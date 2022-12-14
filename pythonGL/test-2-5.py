from core.base import Base
from core.openGLUtils import OpenGLUtils
from core.attribute import Attribute
from OpenGL.GL import *

# render six points in a hexagon arrangement
class Test(Base):
    def initialize(self):
        print("Initializing program...")
        ### initialize program ###
        vsCode = """
        in vec3 position;
        in vec3 vertexColor;
        out vec3 color;
        void main()
        {
            gl_Position = vec4(position.x, position.y, position.z, 1.0);
            color = vertexColor;
        }
        """
        fsCode = """
        in vec3 color;
        out vec4 fragColor;
        void main()
        {
            fragColor = vec4(color.r, color.g, color.b, 1.0);
        }
        """
        self.programRef = OpenGLUtils.initializeProgram(vsCode, fsCode)
        ### render settings (optional) ###
        glPointSize(10)
        glLineWidth(1)
        glClearColor(0.0, 0.0, 0.0, 1.0)
        glClear(GL_COLOR_BUFFER_BIT)
        ### set up vertex array object ###
        vaoref = glGenVertexArrays(1)
        glBindVertexArray(vaoref)
        ### set up vertex attributes ###
        positionData = [ [0.8, 0.0, 0.0], [0.4, 0.6,0.0],[-0.4, 0.6, 0.0],  [-0.8, 0.0, 0.0], [-0.4,-0.6, 0.0], [0.4, -0.6, 0.0] ]
        self.vertexCount = len(positionData)
        positionAttribute = Attribute("vec3", positionData)
        positionAttribute.associateVariable(
        self.programRef, "position" )
        colorData = [ [1.0, 0.0, 0.0], [1.0, 0.5, 0.0],[1.0, 1.0, 0.0], [0.0, 1.0, 0.0], [0.0,0.0, 1.0], [0.5, 0.0, 1.0] ]
        colorAttribute = Attribute("vec3", colorData)
        colorAttribute.associateVariable(
        self.programRef, "vertexColor" )

    def update(self):
        # using same program to render both shapes
        glUseProgram( self.programRef )
        #glDrawArrays(GL_LINE_LOOP, 0, self.vertexCount)
        glDrawArrays(GL_TRIANGLE_FAN, 0, self.vertexCount)

# instantiate this class and run the program
Test().run()