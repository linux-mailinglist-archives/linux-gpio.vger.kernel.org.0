Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98789472DE4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238051AbhLMNvK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 08:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238021AbhLMNvK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 08:51:10 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F11DC061756
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:51:09 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r11so51692085edd.9
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
        b=JR+DaCc5q3x/nJ52dLl6r+4FwSEv9WD0p7h6CAvJzuCN4LA6+wkAYifxMiKmhtGPMC
         FTN/0x8gYKn6C0DH+DPrgH6lH2w+WJEIfGDy1/YzVD0zU202RDccLQt46z8yx/mv5SEQ
         orFijgywNSCXDOJ/OPyq3mvh5NlrdflBnU+13ax6fE2dt0FQGfzQsQKPQMlWf12X6gYS
         H/d+nrvTinlxhp9IzxuZ3LhRXaM+23FWY9lMgayxh0hvEqluoQhfJStRiFE2+rfIOnQF
         Iw8LA3Ko152lC8tyud5LtFSKXRrJ7LmTPR7MzT1Pb8/drF5Zj0ygRhSQOmk3y0qr4lHt
         19ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JA6W9bf1908WD6cfFb6AhPYhGreRD1L3ZPU1ovM0YAo=;
        b=lH2FGOXU+MFUfzHxNvB2m+BMNGcjrLfms19cy7bLQCGVT074fG6ZrETO4MBAY4p09x
         3aruYYSBcCmhbNJkRVc0TnzFtJpn++GTpj8CKuVlVQtaiu9a15yy6C3+ohDhj6Av8Vgq
         NXoJTsWp5M6han8fV6TSa+txZbj+xahhourdp/9TIsP56C2ZB5JDfIhrMkyhxA3GYDdG
         Wctn5K7AxiaC7UWodtKybrmqcqVfQgHPBaSiTyR5x4UNkpPwj1vJSw0UEKXdGOdfOOvt
         OUo8StHyYHFYqegNX8Y6UbMMImE07nGNHorK0A2F6mzcDPX7b5im3NEEwBjdo75iWaXi
         e7VA==
X-Gm-Message-State: AOAM530EpBL3kOO3uQxfONs7fyruV5vnT1DIqXG0jKU3Juer8RU+w2UG
        M0uwOL4nUq4wZV/U41HnHfFclcm+gFyEjZevU3ZtCg==
X-Google-Smtp-Source: ABdhPJyUfRonKaOMYp5CA3+4Qguk6GD9f9+ENkQJ7XEThNqMIaIY/ZVhde1IxmgVdguaMtUOm8hj/b6kBh4NcjdyhEI=
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr63951085edd.245.1639403467922;
 Mon, 13 Dec 2021 05:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 14:50:57 +0100
Message-ID: <CAMRc=Meve=W3yvPmakFap-s6cOY1GUq7c1VjJE2dEH4f0+shag@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Baruch Siach <baruch@tkos.co.il>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Tony Lindgren <tony@atomide.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
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
>
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

If there are no objections, I am willing to apply this to give it some
time in next and get the work on dropping the OF APIs from gpiolib
going.

Bart
