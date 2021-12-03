Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D587467359
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 09:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379239AbhLCIob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 03:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245058AbhLCIob (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 03:44:31 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB093C06173E
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 00:41:07 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v1so8625994edx.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
        b=LsIAHi4O7+rAKszJKyJ/QwZwolqgX7Xp85HCfWi/OAlf7oOjExVQVB3A1uF6oJMxXi
         gPosTZ3PyRq9IbJKMX4ESqDGYZZYcom4XQ8JtyMRl5tOE7xlwAkd4FpJbONadp6pWo7I
         oUoB99whrPg0HGUqiRetXBExiz97qDkf5NdxXb1GpetgxbWitUxWw81WWVuMwB7DeHg4
         F4fsE0Im8ySC6EvPdTGuYxXIdnTwT10W+OMVEHRanF7YSviRe6CvO4rDs/Sfax7qLy0G
         GQ8KIQPRWvs0w82uwlN5lRnk2skx92g4UPLasKF6asjvNdNubK/yYeFyTDsn7OcD+219
         BK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLBHn9jsbKV7jZYY7Dm+t8lPDQRTZnoOfAaLgWh49GU=;
        b=b9Mg1VjCj/MnF/hEOSCBHh5CG5Kw+Wc1AytOXv78usd8wpjrPYC1X0UqlPpeJmageY
         GRuWK+dy/s00ligURGAWr31BCSlKpugv55NL2uTqypad0UGu5ftDHU8ZtULwcmsOVHNl
         UuCNan+25iLuCOUcxL27k5ul82jFHGoBuxK0HRGUbemUwd/mZVGL/OKkNgpV7IcHlY3R
         50NroxfNXhIxdGaovIRGwtqOQDblMUojS+OOFBtOrW9gv30dzm8df4n5fZk9RkMbWw/8
         N+KJnRvCoD/XTpfa4n0cPOpBe8OzI5J1mvXQGVCTseAxCiVAJRHbmidk/dofpMEEuqur
         CBxA==
X-Gm-Message-State: AOAM530EJWoS2h7+GdEnN8/IjCj889F1ipzu/ukGCsN7RgdbrjhNtq0G
        hPl/dfxAKpv4arwSCz9naEjAlhfh8fEbVr6dk7zNOSprwL54cg==
X-Google-Smtp-Source: ABdhPJzNHiauf+pMC5f/US+c9OIXcWbcKMNg90ABw6xCvQOgNu83JV2BIOiQy03TdGH6uVMTEr4y57dSuqO0jiYbpps=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr22268827ejc.77.1638520866276;
 Fri, 03 Dec 2021 00:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 09:40:55 +0100
Message-ID: <CAMRc=Md-TKUETLzf41D2KeQODac153_AumMTW4928XfJ70GRxQ@mail.gmail.com>
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
        <linux-mediatek@lists.infradead.org>, linux-pwm@vger.kernel.org,
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

I have a bad feeling about this but I've gone through the drivers in
this patch and it seems like you don't update any of the drivers that
use multiple child OF nodes so I can't really point out any obvious
bug.

I have another change I'm working on that's related, let me send it shortly.

Bart
