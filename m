Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53073988A1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 13:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFBLzW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 07:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhFBLzV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 07:55:21 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BD5C061756
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 04:53:37 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id z1so1906411ils.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y+f8ZC3pggvAlytodd8J3dP2kKeOn4tDj09TwyRew7M=;
        b=T4oSCjFneO/8llGx7/wanVbe+MIBafoE/zLb5uHnMDq9ybw3AdFPlAI+v32H52cKt+
         LYXLX9go+3fnMP/22f3I5osiNgIFgIvjjp53YW5E/jbZVk8ZBTxiBNMHAt3P/m56PXm3
         m1ZF5zJo0hAdUFMVK1JxEvy/nyzvPr+e2afjJpeoH08MXotYydIRagJjZImEgrt6qoG0
         EVM6hJ/umTDPQ++vlJUCaQLMyWSexAhpIbdloYoU8sBqol8e3S2RIFznZ6SKfPt56xc1
         gEslYUQgbYnsjqWEKB5N9csEwaoS0nDQKiWQnp8k2uAY8EC6Z/xwfZO5tRETlqWk/8l2
         2trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y+f8ZC3pggvAlytodd8J3dP2kKeOn4tDj09TwyRew7M=;
        b=R2XqSuUJMKyvs1PJk5nov/NCw60I5ZEGoSE0VEirPuT3Xo/6j7eK7na7B5ZZjSG5wb
         s/oUA1Js2aafZyxIupW81i9NS0dzKzSMI7/RSmnVHZTzt6EykaN+8pHBP1eDF2vbQGdz
         EGK0INuxgtdMb5dKYTabeMFtqZCm/2a7fzFTM1v+wdVAC068u2OXm52tjIvRoo1GuPmn
         BW6sSAqD6gkMYdB/nc6pYFvUAXjmcmd/+r7wlVJaIr/YHajEfh14KEUhhMKDFOcU9mY3
         A5cQOakJ8rA8zwTz/vFTgp4BkKQBS60Oay0QOWV0SUeh5cYJ5nibWxMMz7fRsjU5VXyR
         6zlA==
X-Gm-Message-State: AOAM530Tsopa9wtvRIUTf7vfRyMYnJaOB+uEe6ClvN4H6Y/2owRLHuxO
        UFWzbKwUpD3E25BmUwH4B3jRBpBxEwTYhxOL5rGd5A==
X-Google-Smtp-Source: ABdhPJyR31QpK5+jKZDo2Nelykw3yV4iau+qrQNWwMumrRWU21qkpXQjO2HL9kAYnyAXMJWqy3OEoAfr9SZMjtdezRE=
X-Received: by 2002:a92:260b:: with SMTP id n11mr25634930ile.134.1622634816997;
 Wed, 02 Jun 2021 04:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210531125143.257622-1-robert.marko@sartura.hr> <20210602104904.GJ2173308@dell>
In-Reply-To: <20210602104904.GJ2173308@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 2 Jun 2021 13:53:26 +0200
Message-ID: <CA+HBbNEiy+yUriGzx8oMUsUbwX1+WKwusYs0FqAd792ZJAM6Xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 2, 2021 at 12:49 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 31 May 2021, Robert Marko wrote:
> 65;6200;1c
> > Delta TN48M switches have a Lattice CPLD that serves
> > multiple purposes including being a GPIO expander.
> >
> > So, lets use the simple I2C MFD driver to provide the MFD core.
> >
> > Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> > provide a common symbol on which the subdevice drivers can depend on.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > * Drop the custom MFD driver and header
> > * Use simple I2C MFD driver
> >
> >  drivers/mfd/Kconfig          | 10 ++++++++++
> >  drivers/mfd/simple-mfd-i2c.c |  1 +
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index b74efa469e90..2b5ad314125d 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -297,6 +297,16 @@ config MFD_ASIC3
> >         This driver supports the ASIC3 multifunction chip found on many
> >         PDAs (mainly iPAQ and HTC based ones)
> >
> > +config MFD_TN48M_CPLD
> > +     tristate "Delta Networks TN48M switch CPLD driver"
> > +     depends on I2C
> > +     select MFD_SIMPLE_MFD_I2C
> > +     help
> > +       Select this option to enable support for Delta Networks TN48M s=
witch
> > +       CPLD. It consists of MFD and GPIO drivers. CPLD provides GPIOS-=
s
>
> Not entirely sure what MFD means in this context.
>
> Please replace the MFD mention with Reset.
Sure, that is a leftover from before.

>
> > +       for the SFP slots as well as power supply related information.
> > +       SFP support depends on the GPIO driver being selected.
> > +
> >  config PMIC_DA903X
> >       bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
> >       depends on I2C=3Dy
> > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.=
c
> > index 87f684cff9a1..af8e91781417 100644
> > --- a/drivers/mfd/simple-mfd-i2c.c
> > +++ b/drivers/mfd/simple-mfd-i2c.c
> > @@ -39,6 +39,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2=
c)
> >
> >  static const struct of_device_id simple_mfd_i2c_of_match[] =3D {
> >       { .compatible =3D "kontron,sl28cpld" },
> > +     { .compatible =3D "delta,tn48m-cpld" },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
>
> Once fixed, please apply my:
>
> For my own reference (apply this as-is to your sign-off block):
>
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Sure, will do.
Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
