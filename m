Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275CD1776B5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 14:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgCCNKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 08:10:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36825 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbgCCNKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 08:10:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id 195so3476659ljf.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zbDdwq+X0+SJe1Y9uOGBu0Is3puyU2cocxmobEd5on8=;
        b=p3F/VMm4WwZdHK9m6fgI249WJFx6qab3QDN1Ba/TK5kWdTGKTvIFRq+0fhLlu+ps1b
         SA+c005ORh8opyLIeAfiEGAlXcrtE/BVrAU+kCpDxaXkWPqW8Xh65zf+Q7pyz0Uu0AMN
         GYLxQC5YZYD/rfUo+NsTCLzavxIEmGIlqvED2idIy8IUC9qvQaCThFurmt7FzZK43m6K
         NmKyihooNy70v+j8IZyfPG6SRaBhOQMnxgtaUVQ2HWvuilyDA3QgDYbz2/+QMTW27+QO
         mKrvd8Qth6Nxa31uV16PHf/G7SJMhsJzAvqaMwl1SGzwdYBC13XUF4cUQ8XCy6wte8Js
         Q+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zbDdwq+X0+SJe1Y9uOGBu0Is3puyU2cocxmobEd5on8=;
        b=I1q/QyjcLqdKDDBx5ktAcsVA/sdI3O4SdIft4//So20Suqi3tk8+rf7bCLTGNjWa5+
         S8tEUXiHPiuaEV/OUyet6DMR8ablMiUFYls3MxESJBcCkZrW/AyJtFh7gnJfROe7lYBl
         RI+no1UsSnfzEP5j8WXi7njUn4ci2bVs+HyTrbHQ2a2AJPg0bnc90fXXzwygEI7D90sj
         0sRb911cYS8xXnEKrbdxjQSs/nwmwXMlRcli9FN9SV7bTWj8lY8ie9ymmDBYfRSQcwd2
         5C0o41lbZg6bYTJGZrrcgyxG93lniJHDAa3ESAGz88Nz+uSjXJcfGXy/hAFSFTpPzznx
         cFVQ==
X-Gm-Message-State: ANhLgQ3AWQy8Xfwi4lAQYFoAgG7gcUayJCXOXwv/26zXG7F+yraNqeHd
        BNoYY1Gpnxe6V6pNjfdiCc0kj6QRFqxXD6Nc15q2ug==
X-Google-Smtp-Source: ADFU+vsYznw3DKPvszvhS0EutabypbtboXUhnLRfK6AwsYTO3TrkQ2W5j6zqMQylNo9y/D2hhfBScEoiC+aCjFRt/bI=
X-Received: by 2002:a05:651c:44b:: with SMTP id g11mr2348622ljg.168.1583241046338;
 Tue, 03 Mar 2020 05:10:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200302083959.wju5vz3acuka2edq@pengutronix.de> <20200302093607.GG25745@shell.armlinux.org.uk>
 <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com> <20200302213002.ajeujnuox6ioi2ua@pengutronix.de>
In-Reply-To: <20200302213002.ajeujnuox6ioi2ua@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 14:10:35 +0100
Message-ID: <CACRpkdYdwsLPEGnVLpYZsf70BLvxhOAbNbSD7LDCTp-FDYPCGA@mail.gmail.com>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 10:30 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Mar 02, 2020 at 05:34:19PM +0100, Linus Walleij wrote:

> > That's especially annoying. I would consider adding a specific
> > consumer flag for GPIOs used this way, in additon to
> > GPIOD_ASIS, something like GPIOD_ASIS_NOMUX
> > (thinking of better names).
>
> This is not only relevant for GPIOD_ASIS. GPIOs for recovery are
> registered (in the case of i2c-imx) with:
>
>         rinfo->sda_gpiod =3D devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
>         rinfo->scl_gpiod =3D devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_=
HIGH_OPEN_DRAIN);
>
> so we'd need a _NOMUX variant for each gpiod_flags value.

Oh we don't need a special variant for everything. In the end
it is just a bitfield, sorry if I was unclear. :(

#define GPIOD_FLAGS_BIT_NOMUX    BIT(5)

rinfo->sda_gpiod =3D devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN |
GPIOD_FLAGS_BIT_NOMUX);

or
GPIOD_OUT_HIGH_OPEN_DRAIN | GPIOD_FLAGS_BIT_NOMUX
is fine.

It is just convenient helpers after all.

> Also if a board makes use of i2c, the corresponding pins shouldn't be
> muxed to GPIO if userspace requests the GPIO via gpioctl or sysfs.
> (IMHO i2c isn't special here, this should apply to all used pins,
> shouldn't it?)

This is another reason why people tag their pin controllers
as strict, and in that case this works.

For those that are not strict, userspace can intercept
the same pins and wreac havoc. Using GPIO from userspace
is indeed in many cases a good gun to shoot oneself in
the foot with.

The solution is not perfect, improvements can be made.

> > Since the calling site knows about this usecase we can
> > open code the semantics for this specifically.
>
> Since the calling site doesn't know if the pin is used otherwise, it
> should default to _NOMUX?

Sorry I'm not following?

I was thinking that if the I2C driver knows it will be doing this
imperative I2C recovery by shaking the pins from the GPIO
side of things, it will request the pins with the flag
GPIOD_FLAGS_BIT_NOMUX and then the GPIO and
pin control subsystems knows: "aha they wanna use these
behind the back of pin control so let's not enforce stuff,
just give them a handle to the line and make sure nobody
else goes and use these lines".

Yours,
Linus Walleij
