Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E827021B05
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 17:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbfEQPz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 11:55:56 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42267 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfEQPzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 11:55:55 -0400
Received: by mail-qt1-f195.google.com with SMTP id j53so8518905qta.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2019 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ID2V1s/STUaNVMoZOr8Ozn/UiIBFdSTd8uEqv1CTbgI=;
        b=a5ABeCVbhhYLK+M6opqU17cFVnG8i39QkNwqRf+1xMtFLaQCipsCfVpThMV2jWIsv1
         mFjR/77Vv8Mhr/A+tDFZ8edky2AKC51JASTxjnrS3pwd5sKU004lti40k5YJ1T6SWk5N
         63z27KphCx52vEHLE+zq7wScK40JfdHbumA6Q0oIxJX0w/FXd01niFe0R/sW3dq6WWXU
         EMs1cRBd7SRcXHqDeKN+ZDt0WcvXUOEdvDkY92WO1gJGDnOtz82TbDZPPMRTaGSy8I3A
         VAbA65AKxe3kh8fFZ0mXWoTYMwc3XH+RGwquRiYKNaIgq9WxtbSLd++oulOUvcUNOw1K
         Ywvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ID2V1s/STUaNVMoZOr8Ozn/UiIBFdSTd8uEqv1CTbgI=;
        b=SdlMWoNinNFmq/zRqwaf8YGEEQKtsbemuoaLB2LwbqsEY6NUxJ+/FcHmIzbGqbCnYC
         JUo/iUi1FP1GiVAvilD9SVC4CI4frBlTSfvCKaufucpzWcBHJOYegN2/nT7Ix4D2UVFZ
         dT7wFLCJ42Zxq1JRXE53UmV4RMWLfi4556dRUaZz2Wpiuwobo1q+URMViCcOz530eMMM
         Z2hSVIVPS8Y+Xj0xn07YWTiyxYf0BnfsPovSCM48c6EhrOSa9u+3HVJouDMU8moN+gIz
         jbx+RGJzQSVldpTQIYzDOjHw95BZ8pQdymgP5Uh5Y2zBFzpNAPno+RnKo3B0OfI7yg/I
         kwRQ==
X-Gm-Message-State: APjAAAV/M1D4QCt7CvvgyGlPAiwhCJLMzSU9chG2Qem0XrRkjcS6T8rr
        dqb1MgnvSxGbd82/C17WltjrQK8/lz4=
X-Google-Smtp-Source: APXvYqyb0wB19odHeiPViAIuou9NfctzxTRVMrMzWPwbFfZhwPlG+u4ni1Wdl9KT3uZ/pfUvB3zURg==
X-Received: by 2002:aed:2428:: with SMTP id r37mr49641750qtc.213.1558108554877;
        Fri, 17 May 2019 08:55:54 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id t17sm5924991qte.66.2019.05.17.08.55.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 08:55:54 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] gpio: zynq: add a to_irq implementation
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <CAMpxmJVUBgv5BXLwDnZt7Sr6ym1qB64KiAyipvArLsy5hEPEYA@mail.gmail.com>
Date:   Fri, 17 May 2019 11:55:52 -0400
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B06C8F4B-DED0-4222-9260-80A2FC053132@gmail.com>
References: <20190516182237.5315-1-jeff.dagenais@gmail.com>
 <CAMpxmJVUBgv5BXLwDnZt7Sr6ym1qB64KiAyipvArLsy5hEPEYA@mail.gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,
Thanks for your answer. See below.

> On May 17, 2019, at 03:36, Bartosz Golaszewski =
<bgolaszewski@baylibre.com> wrote:
>=20
> the default implementation for this function is already assigned
> inside the call to gpiochip_irqchip_add() and it does the same thing
> internally (looks up the mapping from the domain). If there's a
> problem with this driver then the culprit lies somewhere else.

Indeed. I totally missed that. So yeah, disregard my patch.

But then my problem still remains...

The root cause of the "edge" attribute missing is that the exported pins =
have
been exported through my own version of gpio-hog-auto-sysfs-exported =
from DTS
("linux,gpio-export") patch :-/
Inception came from: =
https://www.spinics.net/lists/devicetree/msg08604.html

So under my gpio controller node:
	boardid_0 {
		gpio-hog;
		linux,gpio-export;
		gpios =3D <33 GPIO_ACTIVE_HIGH>;
		input;
		line-name =3D "boardid_0";
	};

makes /sys/class/gpio/boardid_0 appear automatically. The DTS is a =
natural fit
for such information in my opinion. No init script is required so it =
just works
in all images I make (initrd or real rootfs) without extra dependencies. =
The
cost is about 15 lines of code in the kernel.

I modified of_gpiochip_add to flag "FLAG_AUTO_EXPORT" each =
linux,gpio-export
marked hogged pins.

Then in gpiochip_add_data, which runs after of_gpiochip_add, I call my
gpiochip_auto_export to scan pins for "FLAG_AUTO_EXPORT" and export =
them.

The problem is that when all this occurs from =
zynq_gpio_probe/gpiochip_add_data,
gpiochip_irqchip_add has not been called yet, so to_irq is still NULL.

Perhaps I should defer my auto-export operation to another point (like =
at the
end of zynq_gpio_probe? But then I have to do the same for another i2c
io-expander chip we have that also exports pins. Or a tasklet...? =
(yikes. no.)

Any thoughts?

If I can make it work correctly in gpiolib, any point in submitting a =
patch?

Cheers!

P.S. Here's my current workaround after your comeback:

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 694d6884e451..ec8ca101041f 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -364,8 +364,6 @@ static umode_t gpio_is_visible(struct kobject *kobj, =
struct attribute *attr,
 		if (!show_direction)
 			mode =3D 0;
 	} else if (attr =3D=3D &dev_attr_edge.attr) {
-		if (gpiod_to_irq(desc) < 0)
-			mode =3D 0;
 		if (!show_direction && test_bit(FLAG_IS_OUT, =
&desc->flags))
 			mode =3D 0;
 	}
--=20
2.11.0

