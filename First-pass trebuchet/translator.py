from mathml.lmathdom import MathDOM

MathMLeqn = """<math xmlns='http://www.w3.org/1998/Math/MathML'
    mathematica:form='StandardForm'
    xmlns:mathematica='http://www.wolfram.com/XML/'>
 <mrow>
  <mo>-</mo>
  <mrow>
   <mo>(</mo>
   <mrow>
    <mrow>
     <mo>(</mo>
     <mrow>
      <mrow>
       <mrow>
        <mo>-</mo>
        <mi>g</mi>
       </mrow>
       <mo>&#8290;</mo>
       <mi>l1</mi>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mi>&#952;1</mi>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>1</mn>
       </msub>
      </mrow>
      <mo>+</mo>
      <mrow>
       <mi>g</mi>
       <mo>&#8290;</mo>
       <mi>l2</mi>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mi>&#952;1</mi>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>2</mn>
       </msub>
      </mrow>
      <mo>+</mo>
      <mrow>
       <mi>g</mi>
       <mo>&#8290;</mo>
       <mi>l2</mi>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mi>&#952;1</mi>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
      </mrow>
      <mo>-</mo>
      <mrow>
       <mi>g</mi>
       <mo>&#8290;</mo>
       <mi>l2</mi>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mrow>
          <mi>&#952;1</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
         <mo>-</mo>
         <mrow>
          <mi>&#952;2</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mi>&#952;2</mi>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
      </mrow>
      <mo>+</mo>
      <mrow>
       <msup>
        <mi>l2</mi>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Cos</mi>
        <mo>[</mo>
        <mrow>
         <mrow>
          <mi>&#952;1</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
         <mo>-</mo>
         <mrow>
          <mi>&#952;2</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Sin</mi>
        <mo>[</mo>
        <mrow>
         <mrow>
          <mi>&#952;1</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
         <mo>-</mo>
         <mrow>
          <mi>&#952;2</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
       <mo>&#8290;</mo>
       <msup>
        <mrow>
         <msup>
          <mi>&#952;1</mi>
          <mo>&#8242;</mo>
         </msup>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mn>2</mn>
       </msup>
      </mrow>
      <mo>+</mo>
      <mrow>
       <mi>l2</mi>
       <mo>&#8290;</mo>
       <mi>l3</mi>
       <mo>&#8290;</mo>
       <mrow>
        <mi>Sin</mi>
        <mo>[</mo>
        <mrow>
         <mrow>
          <mi>&#952;1</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
         <mo>-</mo>
         <mrow>
          <mi>&#952;2</mi>
          <mo>[</mo>
          <mi>t</mi>
          <mo>]</mo>
         </mrow>
        </mrow>
        <mo>]</mo>
       </mrow>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
       <mo>&#8290;</mo>
       <msup>
        <mrow>
         <msup>
          <mi>&#952;2</mi>
          <mo>&#8242;</mo>
         </msup>
         <mo>[</mo>
         <mi>t</mi>
         <mo>]</mo>
        </mrow>
        <mn>2</mn>
       </msup>
      </mrow>
     </mrow>
     <mo>)</mo>
    </mrow>
    <mo>/</mo>
    <mrow>
     <mo>(</mo>
     <mrow>
      <mrow>
       <msup>
        <mi>l1</mi>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>1</mn>
       </msub>
      </mrow>
      <mo>+</mo>
      <mrow>
       <msup>
        <mi>l2</mi>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>2</mn>
       </msub>
      </mrow>
      <mo>+</mo>
      <mrow>
       <msup>
        <mi>l2</mi>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
      </mrow>
      <mo>-</mo>
      <mrow>
       <msup>
        <mi>l2</mi>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <msup>
        <mrow>
         <mi>Cos</mi>
         <mo>[</mo>
         <mrow>
          <mrow>
           <mi>&#952;1</mi>
           <mo>[</mo>
           <mi>t</mi>
           <mo>]</mo>
          </mrow>
          <mo>-</mo>
          <mrow>
           <mi>&#952;2</mi>
           <mo>[</mo>
           <mi>t</mi>
           <mo>]</mo>
          </mrow>
         </mrow>
         <mo>]</mo>
        </mrow>
        <mn>2</mn>
       </msup>
       <mo>&#8290;</mo>
       <msub>
        <mi>m</mi>
        <mn>3</mn>
       </msub>
      </mrow>
     </mrow>
     <mo>)</mo>
    </mrow>
   </mrow>
   <mo>)</mo>
  </mrow>
 </mrow>
</math>"""

doc = MathDOM.fromString(MathMLeqn)