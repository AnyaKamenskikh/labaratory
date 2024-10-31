using System;
using System.Drawing;
using System.Drawing.Imaging;

namespace BarcodeLib
{
    internal class Barcode
    {
        public Color BackColor { get; internal set; }
        public Color ForeColor { get; internal set; }
        public bool IncludeLabel { get; internal set; }
        public Font LabelFont { get; internal set; }
        public ImageFormat ImageFormat { get; internal set; }
        public object LabelPosition { get; internal set; }
        public object Alignment { get; internal set; }
        public int Height { get; internal set; }
        public int Width { get; internal set; }

        internal Image Encode(object cODE128C, object code)
        {
            throw new NotImplementedException();
        }

        internal Image Encode(object cODE128C, int iD)
        {
            throw new NotImplementedException();
        }
    }
}