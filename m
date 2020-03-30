Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F58B197A99
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 13:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbgC3LWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 07:22:03 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33573 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729744AbgC3LWD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 07:22:03 -0400
Received: by mail-qk1-f196.google.com with SMTP id v7so18464387qkc.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2020 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CzM9Ul/dphXe/6k6V017VGqcrogFXRUNidC2oEsJyA4=;
        b=Lo81bSLQWPVgU/i6sxlrCIBODUnjRkBTUhlltdOET1Dmks4BFPSVpOUpndvcX76UyB
         hkWTYKD7omKCo2QzXiH1W+Q/eSWGYesRpzjunThYHGs7hjuSdF+XD+aVckt8qcSQLHLf
         2dGg3fYi4+AUTb5J78URConeOPfe4tGuRHbb2F1LS3sMbaCujqQsCxjWXbGbH5HyzGhD
         p/Ux96ci6T31CRwG9rUx5pXRxGzCZ84npmpm7CJGxisaBEPrDQEfeik1T+tSs3DS8SSR
         xRT/u5P760PPOifEwBJ2NscES25L2rM7gIEkuzVGazBBxQdHCpd66DpKgluiH+hEAOZj
         1OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CzM9Ul/dphXe/6k6V017VGqcrogFXRUNidC2oEsJyA4=;
        b=q05+Xu//9ERCjoHp4R9pKUlUwrZeArXPOm4H7Lt9Dtma401JANXGwvws48qv7TD2dI
         ec9Rff9jO69uaVHtr+xn/3wToxD5BekXznMMKN1NKKDCLYrJMjAii8AfWlnjnUpduL1k
         e3AAv4no/pE6OSjWg+/ub+9Lt09V22jHWyRDSM9E4U3F69f7y8R6zwCNSK7AoPh4knmy
         UvArVhfc0N9Lg76Q9i3LwY8d6m4IcewggGurdifLB7bSGUdXq1GZZuvr0SOWdZNuGO0s
         GKQgXz0QEPVzFH4hhumRcKNfbn4kol2vJdAVeA2O5ChFcuDZ5Wv8hTYsQqvIx/RzatxA
         Toug==
X-Gm-Message-State: ANhLgQ3++PniLX32+zkkEp2DPoejWpP8cFBATu/u23V0OGhiNUXdLiNZ
        fr+6HIon4kgRhWN5/HSSJwjm19wn6I3MxF4itkPj4g==
X-Google-Smtp-Source: ADFU+vstVtsw7JWrmBNop5+zhRNU4WPamx9SIUzCEtNOrBy3Hzu3AZDNweBkY+DVn4Q0wOYnEWX26BByXVYtpX6VxmE=
X-Received: by 2002:a37:a2c8:: with SMTP id l191mr11373979qke.120.1585567321647;
 Mon, 30 Mar 2020 04:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205017.28280-1-michael@walle.cc> <20200317205017.28280-13-michael@walle.cc>
 <CAMpxmJW770v6JLdveEe1hkgNEJByVyArhorSyUZBYOyFiVyOeg@mail.gmail.com>
 <9c310f2a11913d4d089ef1b07671be00@walle.cc> <CAMpxmJXmD-M+Wbj6=wgFgP2aDxbqDN=ceHi1XDun4iwdLm55Zg@mail.gmail.com>
 <22944c9b62aa69da418de7766b7741bd@walle.cc> <CACRpkdbJ3DBO+W4P0n-CfZ1T3L8d_L0Nizra8frkv92XPXR4WA@mail.gmail.com>
 <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
In-Reply-To: <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Mar 2020 13:21:50 +0200
Message-ID: <CAMpxmJUj7wBvO=Y-u5CXazHhjsPHXcq=5iST4KuLrfakW_a9Mg@mail.gmail.com>
Subject: Re: [PATCH 12/18] gpio: add support for the sl28cpld GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 27 mar 2020 o 16:28 Michael Walle <michael@walle.cc> napisa=C5=82(a):
>
> Am 2020-03-27 11:20, schrieb Linus Walleij:
> > On Thu, Mar 26, 2020 at 9:06 PM Michael Walle <michael@walle.cc> wrote:
> >> Am 2020-03-25 12:50, schrieb Bartosz Golaszewski:
> >
> >> > In that case maybe you should use the disable_locking option in
> >> > regmap_config and provide your own callbacks that you can use in the
> >> > irqchip code too?
> >>
> >> But how would that solve problem (1). And keep in mind, that the
> >> reqmap_irqchip is actually used for the interrupt controller, which
> >> is not this gpio controller.
> >>
> >> Ie. the interrupt controller of the sl28cpld uses the regmap_irqchip
> >> and all interrupt phandles pointing to the interrupt controller will
> >> reference the toplevel node. Any phandles pointing to the gpio
> >> controller will reference the GPIO subnode.
> >
> > Ideally we would create something generic that has been on my
> > mind for some time, like a generic GPIO regmap irqchip now that
> > there are a few controllers like that.
> >
> > I don't know how feasible it is or how much work it would be. But
> > as with GPIO_GENERIC (for MMIO) it would be helpful since we
> > can then implement things like .set_multiple() and .get_multiple()
> > for everyone.
>
> For starters, would that be a drivers/gpio/gpio-regmap.c or a
> drivers/base/regmap/regmap-gpio.c? I would assume the first,
> because the stuff in drivers/base/regmap operates on a given
> regmap and we'd just be using one, correct? On the other hand
> there is also the reqmap-irq.c. But as pointed out before, it
> will add an interrupt controller to the regmap, not a device
> so to speak.
>
> -michael

This has been on my TODO list for so long, but I've never been able to
find the time... I'd really appreciate any effort in that direction as
I believe it would allow us to slowly port a big part of the GPIO
expander drivers over to it and make large portions of our codebase
generic.

Best regards,
Bartosz Golaszewski
