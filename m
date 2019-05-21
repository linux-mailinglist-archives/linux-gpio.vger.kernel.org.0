Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB3824F97
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 15:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfEUNEO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 09:04:14 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35393 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfEUNEO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 09:04:14 -0400
Received: by mail-qt1-f194.google.com with SMTP id a39so20364590qtk.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2019 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BRX4mALwgbnK3Swl9SWa51GTZ74LmTCWSwzujtcfH6A=;
        b=YWThnf96OxXRK1aVFR/BqFChjvG5lHcQI2QrT/loCkRy2xZP2yGDvOqFH5OLcUI7pz
         g31LMYp330OdGCROYEFyQAwDTl1coXVo49H0rDbBBDCbKjzWande5JAIJZx2aJNeHHWY
         Vad+Tk+zL0zP4TqQcxmPAgC86CNuYp9CwrNs4aiGqq1tASgE1Ij+vsOk+2HZ7GTc1GkA
         pr3StTZ81TIoGyGy8Cel/Q6vITK14+nqvG46V312mfLyvQcRkVHXe0I2JN5XzpneCG2f
         L2YEO2dRLJJeQScKEzPeOjjVHIDlpUDF2Y/fHjf5WHzDiSaxICpQTNTpVQIpNal5ujzY
         RQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BRX4mALwgbnK3Swl9SWa51GTZ74LmTCWSwzujtcfH6A=;
        b=U6IiMKLAGN9x9w5pg4qjW13hhR4mKrRnC/bEv36qfMfFOuJTKOAyQdFK0dDwbN2qxU
         D+y3CVdr4aiAZJAEjOkSNZFrBvGS1J0HfdjxX62TlThEKpEa2sfBUib+5RPVuEnB4Ziu
         gSTGcM87stQXuRRIhkZkO8BMI/ZnBq41z3UGSS5E7qJqLjuWZVF0mk/UunTAw/4cPw0o
         VSE2OdZoLvZ0sybPi7PjXA2K50cVTbcHrYS2KdQaw1Kc297EpiohL74/F+SRlmKw93x+
         czznILsY7f05eJxtxHh5eI+uoXu2qJ+UI5DKvvGZT3Oke39DbxehcljcjjzoA7W/JUER
         1gGQ==
X-Gm-Message-State: APjAAAVhDm7fcYkpjuT0o/Hk4DTmheD98fAnGd/hHEZH9EHP8a2FLstF
        wtkSVYhQAsOalGWmIA+SvrY=
X-Google-Smtp-Source: APXvYqzjLLStib+qVyUzaF97vy82udbcfRpApR3g6e3+DgsCXnZf5XntcQGy6IBP+ra/zqYkJ6jjtg==
X-Received: by 2002:aed:3bcf:: with SMTP id s15mr47267865qte.105.1558443853225;
        Tue, 21 May 2019 06:04:13 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id s28sm13292739qtc.81.2019.05.21.06.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 06:04:12 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] gpio: zynq: add a to_irq implementation
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <CAMpxmJXhsxJzpw=RNUqaAMWLm-aUoV2wM4-zFW9urnM9fgU4Dw@mail.gmail.com>
Date:   Tue, 21 May 2019 09:04:10 -0400
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <63CE06C6-5E28-4F9C-B73D-CAED9791EF75@gmail.com>
References: <20190516182237.5315-1-jeff.dagenais@gmail.com>
 <CAMpxmJVUBgv5BXLwDnZt7Sr6ym1qB64KiAyipvArLsy5hEPEYA@mail.gmail.com>
 <B06C8F4B-DED0-4222-9260-80A2FC053132@gmail.com>
 <CAMpxmJXhsxJzpw=RNUqaAMWLm-aUoV2wM4-zFW9urnM9fgU4Dw@mail.gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you for your thoughts!

> On May 20, 2019, at 02:38, Bartosz Golaszewski =
<bgolaszewski@baylibre.com> wrote:
>=20
>>=20
>> Any thoughts?
>>=20
>=20
> Yes! Don't use sysfs and especially don't add your own buggy
> interfaces?

aawww... but I like adding a bunch of "buggy" interfaces here and there =
to make
sure my customers get a challenge when using my product. :P

BTW, I've always been fully aware, when I made this change in gpiolib, =
that I
would not be upstreaming it. It's been years and we're quite happy with =
what it
allowed us to do. Only now, because I needed to use the "edge" =
attribute, have I
had any problems with this approach. So it has served us well this far. =
I was
just long-shot probing you the other day.

> Is there any reason you can't use libgpiod and the
> character device?

To be honest, I had only glanced quite a while back at gpiolib and =
thought it
was a bit overkill at that stage of our development to include another C =
library
and methods into the mix. Later, I forgot about it. Looking at it again =
here I
can see the command line tools do satisfy a great part of the =
"simplicity"
argument. I will most likely add gpiolib to my base yocto image, thanks!

> What does your own class provide that none of the
> upstream interfaces do?

I have not fully explored gpiolib's API yet so I may be missing =
something but
the hog/auto-export I use allows for the hardware pin to be described
functionally all the way to userspace and abstract what chip a line is =
on and
whether it is active_low or high.

So for example a line name could be MYSUBCIRCUIT_RESET. =46rom the DTS, =
that line
name is given, but in the hog/auto-export, it would be shown at
/sys/class/gpio/mysubcircuit_enable. So a functional name is given
(mysubcircuit_enable), along with ACTIVE_LOW to abstract the line =
polarity. That
changes this particular gpio's function to a "cleaner" api (an enable =
gpio
rather than a reset gpio). All along, userspace is none the wiser in =
that
hardware "details", other than the gpio functional name, need not be =
present in
the userspace consumer.

This is akin to having positive boolean in a program. Hardware designers =
have
different physical reasons for making "not" signals (inverted). This =
should stay
in the DTS where we already describe the hardware.

If you can describe a pin "functionally" from DTS and still use gpiolib, =
I will
stand corrected.

Thanks for your feedback!=
