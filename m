Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BB946888E
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 01:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhLEAJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 19:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhLEAJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 19:09:45 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C48C0613F8
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 16:06:19 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id n66so13721116oia.9
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 16:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
        b=oypqQM9WYczOUD8yOv4W0b0J4SdrSIP2/GWFE4TR5k1CGEkHNy9WPiO008zNzsg3Pz
         zh9bUtf/VG6/b3zJ480BiJtwEa7PuEjsHQIWuEsggMdMqcZfJwsOE3iFtiG2DEPADAsO
         hqFPrgRv7CWtgQ4J5ZJRkR9iA1oQHlUoWYY8QDKpr7VM+f+8Yrryge0w8oCSslRvNp+6
         exKWbX0iHLd50+WQaM9fAnPeBnEozwwfUcCOKBUJC5pSMVg0d33S/UEK3rrGtAaDpFWu
         Uv4am7V67+qDJ2gKBQwHEmdYiUOqE7eMf4wLG94y+RQ3YPpVsZKN31tRHAbmVgDqfwLj
         frKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aLM7Vzy6+wcFi2+uw4mY6eHdc1c6QIPZ2YzBFSeQVDk=;
        b=lsCQ+Mh/9OzTt2HZFhY3P5lGfD6vcyFF8GJjqtxluZ76nbNRcbnKr94cpBz77af3SN
         QmmbB7xg+zjMVh2vjwesB6bmmbSvlk1N4+wI/Vy1hsKMkbCuLXT8kQSmaZbWitssAVCH
         pe8NZ0HZqMpyPFTK5q13fW683Yv9lZvbWOypi2pFxFoq6K88Sdvhe1B0M4FXFNmIaASX
         0mJ7i8UDkZABkEQYrwXcFXpPRz53Dom9nUn56c2r8v+eiKRQCf8Oqaf+EQCYzShX5zco
         GcJX4Fs7MaIoHCJmBHxST44Frigjwe4ZrHH3qAVjY6j9TP11p90uXJS/8nqOmy8Yoa1E
         0mGQ==
X-Gm-Message-State: AOAM532BOBE8XKnBXVd5EEAN5D3t6XFThoxNVPwC7W/vsHnyluZz3R42
        wTTpHZfGqxyekLLI9YaAJeMjGrQ95wBnAf0uFa5v2w==
X-Google-Smtp-Source: ABdhPJy/aeGs123LiAIPsyMW3EdsawUgHdqxl5iex8vMswm1x7JAmAebxj9z1jBeNmQdoS/RXvDPX+AOcq/DNJTtHIA=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16602417ois.132.1638662778472;
 Sat, 04 Dec 2021 16:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 01:06:07 +0100
Message-ID: <CACRpkdZbpKqG_uS2N8TW2-HL5CqnuKDpHVCabf66MyQQof0jOw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Baruch Siach <baruch@tkos.co.il>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Tony Lindgren <tony@atomide.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        bcm-kernel-feedback-list@broadcom.com,
        linux-power@fi.rohmeurope.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Keerthy <j-keerthy@ti.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is definitely a patch in the right direction, as Bart says
it can be a bit dangerous, the outliers are those drivers that
assign the .dev to something completely different than the
the dev where the of_node is copied from.

The idea was definitely always to only assign it in the core
*unless* there is a reason to have a completely different
of_node for some reason.

> +++ b/drivers/gpio/gpio-rda.c
> @@ -240,8 +240,6 @@ static int rda_gpio_probe(struct platform_device *pdev)
>         rda_gpio->chip.label = dev_name(dev);
>         rda_gpio->chip.ngpio = ngpios;
>         rda_gpio->chip.base = -1;
> -       rda_gpio->chip.parent = dev;
> -       rda_gpio->chip.of_node = np;

Mention in the commit message that in this driver
you also drop the the .parent assignment because the
core will handle it.

Yours,
Linus Walleij
