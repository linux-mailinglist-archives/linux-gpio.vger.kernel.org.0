Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287E548146D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 16:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240547AbhL2P00 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 10:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236997AbhL2P00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 10:26:26 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021C3C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:26:26 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q16so45113450wrg.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AX3qxdEvTJwh2Uh3nDiQuU6AkRUobLTqCSR6yPpfdX0=;
        b=rkKqI6TE6vXogFh3+4TATT0MPPUjGkfXvrN3cBDT03N6M+HlBBwtFaG3AVDZ6zdAik
         Kp6lOcqyMiBelqtmB3nwbsln21VbaLAz1UN1rVTtDvU5gbxCAqPF8kaHeSDwbODqFPAW
         1/rnADHWkNXQZ61Z9P5tHth8vkZcPAcU3bgw+9r096Wf4gRo/7gAxQiDakqaIQnJu8iS
         Tw3ZlVOLicSodSTyPDR1oA55gbWMiiV0sQt9ImzB4yS7VxLIHkw5syoLLbDGeG0epbw2
         ko3pGXszlwoyqjx+JJcX1ST0uAvyKLnk98cU1V/Yt/JygR2XpmsSUW7fu8G9NofsZuC7
         IsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AX3qxdEvTJwh2Uh3nDiQuU6AkRUobLTqCSR6yPpfdX0=;
        b=tFkVVM93RgSDdL+8AkBBcN+KTUSI8MdwgucMjFM9xv85KPKPxpFpfjE612jmQ0e+LM
         i/epMSD2azP1UvTehUg0emVUXcyGuXJCOKmSCCd+DKZNsif+EFEro1pzXcaOmJu1KEgW
         4UDjAWTHZNuYF4MJZ9rVibfRa6ZGSC05pzP/eRHtB56Mydqklm00OQfQOTTjv6GqCEBx
         7AI2pWaB0soEJCMvDRILxQjMtEeLPvR+WbZmgyKJJMf8xF+qeeLfW1OtFH/JqgCxc1mr
         u+/DqpvGqyaVUCt5UvU2drIzABqDxuC7M2oZl7RSCwk6Vcjx5fRob90gNHZ71jmeIYYF
         zrnw==
X-Gm-Message-State: AOAM530YAPGYozn3+IMQ25IfDjhkNonGz1ak6P3UcM8S7jyypf6f7Ogl
        KPViUBc7RQIeOj0ZR74R9GjQLA==
X-Google-Smtp-Source: ABdhPJx+WjofkRBJ9D+G9God3XXMPiUmRWUjekgXHbOJvH9uS8ZmmqlEiPExUZmYDJAjraiUxA/nCQ==
X-Received: by 2002:a5d:40d0:: with SMTP id b16mr19785073wrq.709.1640791584534;
        Wed, 29 Dec 2021 07:26:24 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id u14sm20831018wrf.39.2021.12.29.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:26:24 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:26:22 +0000
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
Subject: Re: [RFC v5 net-next 11/13] mfd: ocelot-core: add control for the
 external mdio interface
Message-ID: <Ycx+Ht/rLroaYQRf@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-12-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211218214954.109755-12-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 18 Dec 2021, Colin Foster wrote:

> Utilize the mscc-miim-mdio driver as a child of the ocelot MFD.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/mfd/ocelot-core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Squash please.

> diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
> index 52aa7b824d02..c67e433f467c 100644
> --- a/drivers/mfd/ocelot-core.c
> +++ b/drivers/mfd/ocelot-core.c
> @@ -104,7 +104,22 @@ struct regmap *ocelot_mfd_get_regmap_from_resource(struct device *dev,
>  }
>  EXPORT_SYMBOL(ocelot_mfd_get_regmap_from_resource);
>  
> +static const struct resource vsc7512_miim1_resources[] = {
> +	{
> +		.start = 0x710700c0,
> +		.end = 0x710700e3,
> +		.name = "gcb_miim1",
> +		.flags = IORESOURCE_MEM,
> +	},
> +};
> +
>  static const struct mfd_cell vsc7512_devs[] = {
> +	{
> +		.name = "ocelot-miim1",
> +		.of_compatible = "mscc,ocelot-miim",
> +		.num_resources = ARRAY_SIZE(vsc7512_miim1_resources),
> +		.resources = vsc7512_miim1_resources,
> +	},
>  	{
>  		.name = "ocelot-ext-switch",
>  		.of_compatible = "mscc,vsc7512-ext-switch",

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
