Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4C6481470
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbhL2P0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 10:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237113AbhL2P0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 10:26:45 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5B5C06173E
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:26:44 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id w20so36105717wra.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kcQxTAn3v/S923+meTxfcYvk0OXYojNzNro1NaE6gHw=;
        b=dz4TCQt3ohJzpaDwzE6E7Y/HFTYydbe1ir/EngWnIo4aR08JTnK3XAfx+cziXHNQ+y
         g+H5l4i6YAiJiRTaYvNEx6LZH81G8I0oBSiXuZunhofR6klKK+n0X8c/VX9KI4xad56E
         E3j6xA6FI1TP1SxQy8TjJ/qbR6KugoR93eMIgoayPnP3ZxQX5zZNKyVmAdakCiaLR1Cp
         /uMuhjTovp/RzXiWWv4g0UPBKGeyFxFoM2ucQjEIE4Id+WWx1a7Us3Wtf1qCG1UL8Vdr
         /UgtUBC+Jl/0w9HmD9fUzreHALL+hBiSb2NaihypBzxw4mtVvuYOMg6G01T5ssC1dcQ1
         pZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kcQxTAn3v/S923+meTxfcYvk0OXYojNzNro1NaE6gHw=;
        b=u6Qnh5Vc6Z5FDvJmP0tdKTHQJ5PMtbsi7GTqCzFcf+NykzB3Znai/aHntDueli93N4
         5YgmAeRc4CQRLLLCOEOnsZ3e4NQYaf2qgr8KDaaCM//BzDZm3gYoxxxyn5LJE5mopfvK
         P/bnG03N6HscOulubUKrZbfIqd2XH4h54z44fchYNNx3nLfQvKkK7auukMmqHboA6Mvy
         t4YdgbKB9yh8L+ZJFK2y5xkQcJ4I1H2qzG+HSxLDPAF5c4a4l+JO28PFSFZ7yRIhajYI
         uBEWrTzVOIYgiB+sg5I3YvUk80hfxLygsEGrZ9X+esRQenxwP/2IDsZzX4lQ5cnc4Dkw
         YhyQ==
X-Gm-Message-State: AOAM530cbYVGg09YYF86xoImRz6l/deXuvuGXNvZ/w+Qhs6e1w1GSGFw
        0TIIDwyM77LRgMOZkYOlJJKIvw==
X-Google-Smtp-Source: ABdhPJzS7sCiQ7+uD75qM8a8p9tojwVsOVKYyirHAPGAd3sc/vdNJ6yZAhg7v5WMtjc5cyITCgRRjw==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr21322655wrh.470.1640791603195;
        Wed, 29 Dec 2021 07:26:43 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id g187sm20096450wmg.40.2021.12.29.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:26:42 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:26:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC v5 net-next 13/13] mfd: ocelot: add ocelot-pinctrl as a
 supported child interface
Message-ID: <Ycx+MNV1edWhdLM5@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-14-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211218214954.109755-14-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 18 Dec 2021, Colin Foster wrote:

> The ocelot-pinctrl device is able to be utilized by ocelot_mfd. This simply
> enables that child driver.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/mfd/ocelot-core.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Squash please.

> diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
> index c67e433f467c..71e062934812 100644
> --- a/drivers/mfd/ocelot-core.c
> +++ b/drivers/mfd/ocelot-core.c
> @@ -113,7 +113,22 @@ static const struct resource vsc7512_miim1_resources[] = {
>  	},
>  };
>  
> +static const struct resource vsc7512_pinctrl_resources[] = {
> +	{
> +		.start = 0x71070034,
> +		.end = 0x7107009f,
> +		.name = "gcb_gpio",
> +		.flags = IORESOURCE_MEM,
> +	},
> +};
> +
>  static const struct mfd_cell vsc7512_devs[] = {
> +	{
> +		.name = "pinctrl-ocelot",
> +		.of_compatible = "mscc,ocelot-pinctrl",
> +		.num_resources = ARRAY_SIZE(vsc7512_pinctrl_resources),
> +		.resources = vsc7512_pinctrl_resources,
> +	},
>  	{
>  		.name = "ocelot-miim1",
>  		.of_compatible = "mscc,ocelot-miim",
> @@ -164,6 +179,10 @@ int ocelot_mfd_init(struct ocelot_mfd_config *config)
>  
>  	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, vsc7512_devs,
>  			      ARRAY_SIZE(vsc7512_devs), NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(dev, "error adding mfd devices\n");
> +		return ret;
> +	}
>  
>  	dev_info(dev, "ocelot mfd core setup complete\n");
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
