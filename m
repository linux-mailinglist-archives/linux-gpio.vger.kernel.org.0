Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B305333FDA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 15:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhCJOCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 09:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhCJOBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 09:01:47 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22238C061760;
        Wed, 10 Mar 2021 06:01:47 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d23so5310262plq.2;
        Wed, 10 Mar 2021 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GCVQjWt0AiUSEd6FKWYgmvzWBrd1IhH0M7mcUn/44lQ=;
        b=Px0uOi0ryjRx6x08IYmQ6kMksj/yHk95AZS1jObIxSWVrOk6XIxq/UhsgFBDROE6NK
         5tMupwA+SUii8a2B7zCpHiXtJ2ipBz070h1TZToPZO4ZpgHa0Wm/5EQeEznAzjOi+maU
         0csiXQ9y3QH2/0Fl6oOID3TuSy5br8ERPBHeqmuiYFCkh4P8vxwTJMnAMdcTcu7+K6f7
         u9VfaVnldMU4RC3T4u0tA2wL/rPCHmZ/bGLVX1cSeeo/gbJ6Va5seL6Q0j4pCtyTzi2+
         AyiKOAzjASbUo8ZgbLxgWgmGlBUwc6NqPGqKi/rjkGGBT1c0ibOXQxrCJwlMkMVbsZq0
         gBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GCVQjWt0AiUSEd6FKWYgmvzWBrd1IhH0M7mcUn/44lQ=;
        b=tKuWh0aFyeQxwnx7O7r5PLTL/X13rMs69X82rXCzbfqoE1ri46HCo7JpW/VPqSzlVz
         F9Hj4wzaZhwWSEPINEPRjF+Dla1PvO63JUTjNeg3hAj0G2MYiwP2RgEukxFUMn9LT62X
         oSNnVoWE9ffWqE+jzeHFGAQZRpshK7InXYoA2sCNqtECi158UJh+0bM/iAC4vpREYSh1
         Ll449wbG7G1e5a8FtNLnXZmh2wWqQJ07NODyHGcxvmumsyx6FTp8LMB17/oYtPUTcx7w
         HCTG4bWXXhbwM6cE3sNmSRrmHwkX/e3P/tZwfGLyYUBj/PJeJirTeUtw4PgFJqTi6V84
         +7tw==
X-Gm-Message-State: AOAM533wrCWg8uhMrF1V0P7r+ASz+zuJEyWnfzFEG86DLGNa27ujw22I
        yD7Ne1jRCUYCJWWuTePbeyq0Ho9cA5aV47GTzvU=
X-Google-Smtp-Source: ABdhPJzKz7o7Q41neFjaiKGbGw1g/ggo7MCvqxNQhETQKoMzACZK76VS/lS0IsB/t4i57E5n23jDy3qbOmh0U2sPIgY=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr3828368pja.228.1615384906581;
 Wed, 10 Mar 2021 06:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-3-noltari@gmail.com>
In-Reply-To: <20210310125504.31886-3-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Mar 2021 16:01:30 +0200
Message-ID: <CAHp75VeAmdkDuJ-rhyunQ+tAbB6=qHLGKzwFg26jgkdYzJLK1A@mail.gmail.com>
Subject: Re: [PATCH v6 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 2:55 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> This is needed for properly registering GPIO regmap as a child of a regma=
p
> pin controller.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>  v6: add comment and simplify of_node assignment
>  v5: switch to fwnode
>  v4: fix documentation
>  v3: introduce patch needed for properly parsing gpio-range
>
>  drivers/gpio/gpio-regmap.c  | 1 +
>  include/linux/gpio/regmap.h | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 5412cb3b0b2a..d4fc656e70b0 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>
>         chip =3D &gpio->gpio_chip;
>         chip->parent =3D config->parent;
> +       chip->of_node =3D to_of_node(config->fwnode);
>         chip->base =3D -1;
>         chip->ngpio =3D config->ngpio;
>         chip->names =3D config->names;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index ad76f3d0a6ba..334dd928042b 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -4,6 +4,7 @@
>  #define _LINUX_GPIO_REGMAP_H
>
>  struct device;
> +struct fwnode_handle;
>  struct gpio_regmap;
>  struct irq_domain;
>  struct regmap;
> @@ -16,6 +17,8 @@ struct regmap;
>   * @parent:            The parent device
>   * @regmap:            The regmap used to access the registers
>   *                     given, the name of the device is used
> + * @fwnode:            (Optional) The firmware node.
> + *                     If not given, the fwnode of the parent is used.
>   * @label:             (Optional) Descriptive name for GPIO controller.
>   *                     If not given, the name of the device is used.
>   * @ngpio:             Number of GPIOs
> @@ -57,6 +60,7 @@ struct regmap;
>  struct gpio_regmap_config {
>         struct device *parent;
>         struct regmap *regmap;
> +       struct fwnode_handle *fwnode;
>
>         const char *label;
>         int ngpio;
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
