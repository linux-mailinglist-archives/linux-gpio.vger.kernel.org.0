Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8248F157D7C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 15:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgBJOfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 09:35:13 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35077 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgBJOfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 09:35:12 -0500
Received: by mail-io1-f65.google.com with SMTP id h8so7798043iob.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=a5np5Zx8APOOaMkfYjZ4TCk0migljw3kbWjXT4d5ABI=;
        b=IHxWMXE8RT5s3OjPvo3zb+EGFPhDt8jzF6iFOvoYp7lviqUqV8qG8Xwe5nCKvCzRS0
         ykOrbnLhMSRLGgD28weO+53ZdOuzKtIcIBLcKPbLXF9oPqSw43xwototejM5ACRZWsh7
         r3jRMrELBDOCxCSuJzBuQnieDOCil1rpOhePkvSMPkcNBbcbL1ROY/bw2C3TDXX9NeZw
         h2G77sw8va1wrOGTsrMXfrUTmU/aEVvMc6oCB/gwwvr7m4XIduaA5pzoJHXVJNxDQqUP
         ofdmA/5tekm3kaMiBr73jVIE6ayVYes5x4ek+xFEr+H63XiZbvjRANr+5HBZx1Skn3nT
         4hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a5np5Zx8APOOaMkfYjZ4TCk0migljw3kbWjXT4d5ABI=;
        b=T+6MqpKJOK2OsiRZ77/wOj4JgFHj6pXUqKomY3Rt3UNwMjS32C0gik8xkpTPbDVA1A
         /K20NgW8TEAYMTorIv+rr3qlzyR5vCcaAx1mQu4nEshw9Mkj4WNFV388tUfSNtoBjTIr
         xKvatoGe+2H0coPZC5y5KAT0fSzATcAcyI+4MRx/s7QDLmI53D160JYx9YAyYLfp/5FZ
         Q2YtvSVlV5GNvV61TdLZbk6cOlTAepxPRQL9tm7Upx+geHKr2jkPy17it7WFzfHPEWBv
         afBJ1EeVIAc8Pfb8zkTW8RJuFsV84eyikt/KEcC2pqQcgEluzcFtQSgF0p/neRKlSX++
         G3zA==
X-Gm-Message-State: APjAAAUy9chzOrCs9SQKsicgaBvrptpZBDeZ8fnv3FEfT0DskzGSsK4B
        AcY0kjs8hl834IjPmeWjDC/btWEEUWvvVBifs0T+jrWyZ0A=
X-Google-Smtp-Source: APXvYqxq2OmGbKK95nSF7b0y5QbvKp36IBNjQ4Pfan8wZniuA9t8Zlv7H27dtq8TA53FZqfbV4dxmQtccz5baaEoKe8=
X-Received: by 2002:a6b:710f:: with SMTP id q15mr9634966iog.103.1581345311375;
 Mon, 10 Feb 2020 06:35:11 -0800 (PST)
MIME-Version: 1.0
From:   Mark Deneen <mdeneen@gmail.com>
Date:   Mon, 10 Feb 2020 09:34:59 -0500
Message-ID: <CAP6JJ88pMH+KK_D7z+f69cMfwd_0gBX0M1cs+kkHKff4fJzmCw@mail.gmail.com>
Subject: Unable to use gpio-line-names with Atmel pio4 driver
To:     linux-gpio@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000008d5f34059e39a5a1"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--0000000000008d5f34059e39a5a1
Content-Type: text/plain; charset="UTF-8"

Hi!

I am working with an in-house board and getting the Kernel and Device
Tree straightened out for our needs.  After seeing the bold statements
in the sysfs documentation regarding gpio access, I figured that you
guys really mean it and decided to do things the right way.  In doing
so, however, I'm finding it to be unexpectedly difficult.

My board is uses the sama5d27 SIP.  There are certain portions of the
board which require GPIO lines to be driven from user-space, and these
aspects do not really fit within any particular kernel driver.  For
example, I need to be able to enable a CAN transceiver whenever the
CAN peripheral is in use, and disable it when it is not in order to
disconnect ourselves from the network.  I want to be able to name this
GPIO in Device Tree so that future revisions of this board have the
flexibility to use a different GPIO for this task and user space does
not need to know that PC31 is connected to the transceiver.

The atmel pio4 driver automatically sets names for the GPIOs [1], from
PA0 to PD31, and the gpiolib ignores the gpio-line-names property if
the chip has already set them. [2]  I worked around this by adding a
"no-autoname" device tree property to the pio4 pinctrl driver.  The
patch is attached, but it is admittedly quick & dirty and not
something I'm ready to put my name on yet.

I'm still unable to use libgpiod effectively, with or without my
changes, and I feel like I am fundamentally missing something.
gpioinfo shows all pins as "input".  Setting a pin's value makes
gpioinfo show that pin as an output until I use gpioget.  At this
point it reverts back to an input:

# gpioinfo | grep PC31
        line  95:       "PC31"       unused   input  active-high
# gpioset 0 95=0
# gpioinfo | grep PC31
        line  95:       "PC31"       unused  output  active-high
# gpioget 0 95
1
# gpioinfo | grep PC31
        line  95:       "PC31"       unused   input  active-high

This was tested with the following dt setup:

&pioA {
        // no-autoname;
        gpio-line-names =
                /* PA */
                "", "", "", "", "", "", "", "",
                "", "", "", "", "GPS_EN", "", "", "",
                "", "", "3V3_EN", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                /* PB */
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                /* PC */
                "GPS_RESET", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "CAN0_EN",
                /* PD */
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "",
                "", "", "", "", "", "", "", "";
        can0-enable {
                gpios = <PIN_PC31 GPIO_ACTIVE_HIGH>;
                output-low;
                line-name = "CAN0_EN";
        };
};

Any idea where I have gone wrong here?

1. https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpio/gpiolib-of.c?h=linux-5.5.y#n908

2. https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/pinctrl/pinctrl-at91-pio4.c?h=linux-5.5.y#n1089

--0000000000008d5f34059e39a5a1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="001-skip-setting-generated-gpio-names.patch"
Content-Disposition: attachment; 
	filename="001-skip-setting-generated-gpio-names.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6ghd12x0>
X-Attachment-Id: f_k6ghd12x0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEtcGlvNC5jIGIvZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmwtYXQ5MS1waW80LmMKaW5kZXggNjk0OTEyNC4uOGI3NjE0OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXQ5MS1waW80LmMKKysrIGIvZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmwtYXQ5MS1waW80LmMKQEAgLTk5Niw3ICs5OTYsNyBAQCBzdGF0aWMg
aW50IGF0bWVsX3BpbmN0cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlz
dHJ1Y3QgcGluY3RybF9waW5fZGVzYwkqcGluX2Rlc2M7CiAJY29uc3QgY2hhciAqKmdyb3VwX25h
bWVzOwogCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOwotCWludCBpLCByZXQ7CisJ
aW50IGksIHJldCwgYXV0b25hbWU7CiAJc3RydWN0IHJlc291cmNlCSpyZXM7CiAJc3RydWN0IGF0
bWVsX3Bpb2N0cmwgKmF0bWVsX3Bpb2N0cmw7CiAJY29uc3Qgc3RydWN0IGF0bWVsX3Bpb2N0cmxf
ZGF0YSAqYXRtZWxfcGlvY3RybF9kYXRhOwpAQCAtMTA1Niw2ICsxMDU2LDcgQEAgc3RhdGljIGlu
dCBhdG1lbF9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQlH
RlBfS0VSTkVMKTsKIAlpZiAoIWF0bWVsX3Bpb2N0cmwtPmdyb3VwcykKIAkJcmV0dXJuIC1FTk9N
RU07CisJYXV0b25hbWUgPSAhb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgIm5v
LWF1dG9uYW1lIik7CiAJZm9yIChpID0gMCA7IGkgPCBhdG1lbF9waW9jdHJsLT5ucGluczsgaSsr
KSB7CiAJCXN0cnVjdCBhdG1lbF9ncm91cCAqZ3JvdXAgPSBhdG1lbF9waW9jdHJsLT5ncm91cHMg
KyBpOwogCQl1bnNpZ25lZCBiYW5rID0gQVRNRUxfUElPX0JBTksoaSk7CkBAIC0xMDg2LDggKzEw
ODcsOSBAQCBzdGF0aWMgaW50IGF0bWVsX3BpbmN0cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAlhdG1lbF9waW9jdHJsLT5ncGlvX2NoaXAtPm5ncGlvID0gYXRtZWxfcGlv
Y3RybC0+bnBpbnM7CiAJYXRtZWxfcGlvY3RybC0+Z3Bpb19jaGlwLT5sYWJlbCA9IGRldl9uYW1l
KGRldik7CiAJYXRtZWxfcGlvY3RybC0+Z3Bpb19jaGlwLT5wYXJlbnQgPSBkZXY7Ci0JYXRtZWxf
cGlvY3RybC0+Z3Bpb19jaGlwLT5uYW1lcyA9IGF0bWVsX3Bpb2N0cmwtPmdyb3VwX25hbWVzOwot
CisJaWYgKGF1dG9uYW1lKSB7CisJCWF0bWVsX3Bpb2N0cmwtPmdwaW9fY2hpcC0+bmFtZXMgPSBh
dG1lbF9waW9jdHJsLT5ncm91cF9uYW1lczsKKwl9CiAJYXRtZWxfcGlvY3RybC0+cG1fd2FrZXVw
X3NvdXJjZXMgPSBkZXZtX2tjYWxsb2MoZGV2LAogCQkJYXRtZWxfcGlvY3RybC0+bmJhbmtzLAog
CQkJc2l6ZW9mKCphdG1lbF9waW9jdHJsLT5wbV93YWtldXBfc291cmNlcyksCg==
--0000000000008d5f34059e39a5a1--
