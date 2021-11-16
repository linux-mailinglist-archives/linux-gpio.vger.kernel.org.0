Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA63A453704
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbhKPQOD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238952AbhKPQNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:13:49 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CBFC061570;
        Tue, 16 Nov 2021 08:10:49 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y13so15169743edd.13;
        Tue, 16 Nov 2021 08:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oxMu/KfLQTUAnXP40dA8WAXzuq8ZXQGQQP8a9j781ss=;
        b=X8YZP2z8CxcOEQy2Y5B1aoqny44k3vJdXCkXZJIag+7OHryn4YEmVBbCbq8lVE26Fm
         DGNZucSkxoSe9PW71w0QKMJ9mm6phgC9y3d+Rjh6NxO7l5Mq9AOwdLJspUiXtDj9ROKM
         Ow6y0nRzAKM4MkbmkrPZjxNAqSEAunatrCpAnVuDks4MiPwPzaUKO7PPuPKhS6v61Bie
         O9nqCI6DbjrAWStIs9DhoCYXYr4tmsedK8/qYHYv4XazdYRPZxAJyQvJfwpXbhqQIG5k
         yOwf+rAAnIklgMlT0ADNwimYJWkjzE+QNdyy755F1A1n/dzROX/1OUuPjxksH3VCD2dg
         In0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxMu/KfLQTUAnXP40dA8WAXzuq8ZXQGQQP8a9j781ss=;
        b=PqMC4WuoH9FGpOsNiFnvXmDVl3S6GzfkbYIjeJ327QYddzs0aQTPooCKuTOSRaMlN1
         8W/8GRr2yRcjGxkPeTW3fMSX6ECBmXMmsqxuPWFZeDG6wFKNe9olafXGUMFLPKyUj7OZ
         KuFN/j+AJ4eihZGrAJCiR84gWqI+pJNtVgSgJ+c9NgxN861DMk33NhjCRJ3mc4m2dnu5
         wf2CHgw7Xr9AFh8/C0WypN4Y1EQw80NqG5PHYPEb+j4S+acUHiceiT/iQKsXsnANdx6r
         dMCSLGG/RqhT2cTLczgyKRSZeDrWevpOxNiNkv8v2wpj9V0Tw8O0u6P7lqnG1lhUNqbg
         dOeQ==
X-Gm-Message-State: AOAM533qrMUkzxCHWLou0gdr/gJOUCSU0tNsIB1MDHi/ZSg7wdAzWQIF
        bJ+VLElqUSvzXocvJviKBU7fB2DMTezkI53tr9ooO6hdb8w=
X-Google-Smtp-Source: ABdhPJzxc5hdTJFSVr23Xv4G6rBxfLHDqkEIsvh+Ef7nPwPINdWnca9MtOwrildmAJi2RDIzm0ybRuScyfWDglZQKvg=
X-Received: by 2002:a17:907:869e:: with SMTP id qa30mr10906763ejc.356.1637079047840;
 Tue, 16 Nov 2021 08:10:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Nov 2021 18:10:06 +0200
Message-ID: <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/4] Drop ROHM BD70528 support
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 2:52 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Drop ROHM BD70528 support
>
> Unfortunately there has not been a big demand for ROHM BD70528
> IC. The few users I know control PMIC from separate M4-core,
> which is not running Linux. I am not aware of any users of this
> Linux driver.
>
> While I did really like this IC and writing the drivers for it,
> seems like these drivers are becoming useless burden. So, I see
> no point in maintaining them. Let's just drop the drivers if
> there is no objections to this series. :(
>
> The regulator, WDG and power-supply drivers were already dropped.
>
> The RTC and clk drivers remain in use by few other ROHM IC drivers.
> Nevertheless, they are already converted to not depend the BD70528
> defines during previous cycle.
>
> This series cleans the remaining pieces, GPIO, MFD, dt-bindings and
> MAINTAINER entries. The GPIO code uses defines from MFD - but the GPIO
> part is also depending on MFD KConfig entry - so there should be no
> breakages even if the patches were applied to respective subsystem trees
> and were not carried via single tree.

FWIW, no objections from me.

> ---
>
> Matti Vaittinen (4):
>   dt-bindings: mfd: regulator: Drop BD70528 support
>   gpio: bd70528 Drop BD70528 support
>   mfd: bd70528: Drop BD70528 support
>   MAINTAINERS: bd70528: Drop ROHM BD70528 drivers
>
>  .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 -----
>  .../regulator/rohm,bd70528-regulator.txt      |  68 ---
>  MAINTAINERS                                   |   8 -
>  drivers/gpio/Kconfig                          |  11 -
>  drivers/gpio/Makefile                         |   1 -
>  drivers/gpio/gpio-bd70528.c                   | 230 -----------
>  drivers/mfd/Kconfig                           |  17 -
>  drivers/mfd/Makefile                          |   1 -
>  drivers/mfd/rohm-bd70528.c                    | 314 --------------
>  include/linux/mfd/rohm-bd70528.h              | 389 ------------------
>  include/linux/mfd/rohm-generic.h              |   1 -
>  11 files changed, 1142 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
>  delete mode 100644 drivers/gpio/gpio-bd70528.c
>  delete mode 100644 drivers/mfd/rohm-bd70528.c
>  delete mode 100644 include/linux/mfd/rohm-bd70528.h
>
> --
> 2.31.1
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]



-- 
With Best Regards,
Andy Shevchenko
