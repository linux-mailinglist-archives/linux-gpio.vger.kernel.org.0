Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9AB481468
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 16:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbhL2PYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 10:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240514AbhL2PYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 10:24:47 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50524C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:24:47 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a9so45015630wrr.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KqiFixRDwuebcUdOeplid6xG17xDjpziOFlviefhv2Q=;
        b=nNJTDgd6cyoVnqWIh8zuAB3em+soTEMXYwGJqKPcaraaKiqchm0dS7OEWV9MCfBbLz
         WnT/c7wSD7HUNnCcQjElIZ+jeGBvuZk/2FqgcYqFsAz8/ItfQeDDHr5i+J2fasOhrP0y
         9/R3hLN1O9FEgkNUfmlkXShnBcVdmnRNKE833V646jflU+TcbZJTs14SKVTvWfiW9T1K
         9EKyQ8UkiolS8noYj1DYjuYbFRabQwuzMCNMKS55GabalnCXEQoLG14J5bkt/6mSDQzD
         KzfMyQlKIbWhnxTnYebQaY3T3gpnDscJT2G++X6e82dx3sQgfXQtD2bVJC8CYgMf8AXT
         xzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KqiFixRDwuebcUdOeplid6xG17xDjpziOFlviefhv2Q=;
        b=X5PYD4USjKVbitIyhpcUK3kqBjbUCDLY+g8MA0Cgv/bMoZA00cHIUGgO8YlQH9JXxh
         /tSZh0YSoyD0m9zBiXtySJBiev2VU1ZQF3R9gO0hdULnx8oI4U/C9/EeMVWW7sJ+t8oG
         CaN5QbQVoQTrJfy333dTWUj/IqYTCszfAtjX3Ru1p/+KraFdfKOksFurPy9W4GgFTp95
         LoI5d7IfDRyyNF/7MwXVenzFgyxLH2cyE9q0tgOYWdWWWorN+YJ4z8qB2/n/4yRxEaPB
         wi/hMJCaEx1Q5a24DIfTj61yb/vIdMUqrs2F4WSm1jkybLSAHFtGTVZkSmc9TNNfmmZ8
         hKFw==
X-Gm-Message-State: AOAM533N5HhddP0XolZGsqg1PLicJQ8bidwSqL2ReSjPlVblLTgsV2hH
        Am/cf5h7yb4r+QRKWDWylIO4rA==
X-Google-Smtp-Source: ABdhPJyJuFhjgZUVbjoakFKAC91veTmsc3uDRoPKGeKy3dwhFhaN7k0OCCpBuSzgmDLUcOgMwrL+Xg==
X-Received: by 2002:a05:6000:91:: with SMTP id m17mr21001870wrx.250.1640791485880;
        Wed, 29 Dec 2021 07:24:45 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id a22sm21525833wme.19.2021.12.29.07.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:24:45 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:24:43 +0000
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
Subject: Re: [RFC v5 net-next 07/13] mfd: ocelot: enable the external switch
 interface
Message-ID: <Ycx9uz8IbdeXCzu4@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-8-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211218214954.109755-8-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 18 Dec 2021, Colin Foster wrote:

> Add the ocelot-ext child device to the MFD. This will enable device-tree
> configuration of the MFD to include the external switch, if desired.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/mfd/ocelot-core.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Please squash this into the driver creation patch.

> diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
> index 09132ea52760..52aa7b824d02 100644
> --- a/drivers/mfd/ocelot-core.c
> +++ b/drivers/mfd/ocelot-core.c
> @@ -6,6 +6,7 @@
>  #include <asm/byteorder.h>
>  #include <linux/spi/spi.h>
>  #include <linux/kconfig.h>
> +#include <linux/mfd/core.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  
> @@ -103,6 +104,13 @@ struct regmap *ocelot_mfd_get_regmap_from_resource(struct device *dev,
>  }
>  EXPORT_SYMBOL(ocelot_mfd_get_regmap_from_resource);
>  
> +static const struct mfd_cell vsc7512_devs[] = {
> +	{
> +		.name = "ocelot-ext-switch",
> +		.of_compatible = "mscc,vsc7512-ext-switch",
> +	},
> +};
> +
>  int ocelot_mfd_init(struct ocelot_mfd_config *config)
>  {
>  	struct device *dev = config->dev;
> @@ -139,7 +147,10 @@ int ocelot_mfd_init(struct ocelot_mfd_config *config)
>  		return ret;
>  	}
>  
> -	/* Create and loop over all child devices here */
> +	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, vsc7512_devs,
> +			      ARRAY_SIZE(vsc7512_devs), NULL, 0, NULL);
> +
> +	dev_info(dev, "ocelot mfd core setup complete\n");
>  
>  	return 0;
>  }
> @@ -147,7 +158,7 @@ EXPORT_SYMBOL(ocelot_mfd_init);
>  
>  int ocelot_mfd_remove(struct ocelot_mfd_config *config)
>  {
> -	/* Loop over all children and remove them */
> +	mfd_remove_devices(config->dev);
>  
>  	return 0;
>  }

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
