# MATLAB-Image_Processing-Filters_FrequencyDomain

These scripts are only aiming to show how the Fourier Transform works when applied to images. First step is to turn the image into a 
grayscale image so it is depicted only by a 2D matrix (instead of 3 in the colour case). Now, we can apply to each element of this 
matrix a Fast Fourier Transform and therefore we obtain what we call a repreasentation in the Frequency domain. 
The frequency domain representation has several problems we have to deal with:

  * the DC component is much larger than any others, so we need to shift the result.
  * If we might want to represent it, as the Fourier Transform of any number is other complex number,
   it would be necessary to take the absolute value of it.
  
 Once we have taken care of these details, it is possible to apply masks in the Frequency Domain, i.e., multiply a 
 geometric shape the frequency distribution. This way we are setting a frequency threshold, gathering only certain frequencies 
 and avoiding others. 
 
 Finally we pass throuhg the inverse process, de-shifting and obtaining the inverse Fourier transform. The results are so that the high
 frequencies are related to rapidly varying information (edges) and low frequencies are related with slow variying information 
 (continuos surfaces).
 
 The results obtained in this sectino are not very good as the masks that have been used are simple geometric forms. However, it is 
 possible ot achieve better results if more complex masks are used, as i.e. a Gaussian Mask.
 
 To finish I would like to mention that, mathematically, a multiplication in the frequency domain is equivalent to a convolution 
 operation in the spatial domain. In the repository MATLAB-Image_Processing-Filters_FrequencyAndSpatial you can find a little more 
 complex mask for the frequency domain: the Butterworth mask.
 
 When preparing these scripts I found the following website truly usefull:
 https://homepages.inf.ed.ac.uk/rbf/HIPR2/hipr_top.htm
