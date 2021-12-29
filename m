Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40224481463
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 16:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240517AbhL2PYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 10:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237012AbhL2PYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 10:24:05 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE734C061574
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:24:04 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q16so45101125wrg.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LZQ2uT+dEDdcfo6GdsvFMg5+lwEKUwPetYi8+iOsNTE=;
        b=g/BtKfrE39CwIcZaRrFrzcFAcOo2HU9xLitA2rLAs+sZo1JTwMpnrghiftDw6poaLd
         He50o4JOWuTaTkDV9XN2FmtEOsVK0kLXLsXApfSsmRnpnPiBw8lnJT+o3ooUMkeHOkZ5
         szGZGGV1dInrwoVLs8qvTc0i9nKXwFzwTJh/1327gNE7Khbd+FV4hUtgnC54VDILcxF9
         OobNnOF5/Y2nDFeHfWzUTLpoWjyfN7tw0+sSsG/YxzWGcj44dp9NfbUUfn2uiDePHABp
         N3skC7MAmZfyfYVH1kdfdu1E/SHlULXIHqYprX4r3qC7saf6SFtRJSQfds7+oD501XuI
         tEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LZQ2uT+dEDdcfo6GdsvFMg5+lwEKUwPetYi8+iOsNTE=;
        b=FcwjlahkhVwnbzXnLdjUHMPKb2kc8aVby10IbaeXhpfcIYQM5aRHDP8B+f4HFdUorv
         xUdYjGHUPEgLshMAmHeszByGqG2w8UiZTJ1cGrWYkq5vxPZPFqkLYnXqhJ+/tSvXywtK
         daQuTOaOW+IM7zZdP39sqJ/RVqR0p+wmgF5bB/ERxfb/gNyjW5K5NTEzotKGiYQAUEAX
         rNDRzA85+pQX3ocpK5CLZvoIDpwO/LJ5Y8aiiFPsX5Bo44XheTqXSvyNbzaXWP+ErhxA
         kO9EPkWPAo9XGE65sQGGhCv1FlpXt5QxNwtinm+uHcSdz32G0zLDk3vMidH0wHQKTyIG
         QqIA==
X-Gm-Message-State: AOAM530S/BJ2E1TeCoJQu1Clj651FmHP1InYkCHYNFI1EDQQ2NE941p4
        Pp90MDLbiqf52XF0v8rVpgvm+w==
X-Google-Smtp-Source: ABdhPJx27hQZtD1q76IBUMnEd1Xg0f7/2/Jw1Bws56rnUP8BCeQIA9tfDcTTsNw6NPF8VRPLqDpGxQ==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id i6mr21307251wry.373.1640791443205;
        Wed, 29 Dec 2021 07:24:03 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id b10sm21383326wrg.19.2021.12.29.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:24:02 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:23:59 +0000
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
Subject: Re: [RFC v5 net-next 02/13] mfd: ocelot: offer an interface for MFD
 children to get regmaps
Message-ID: <Ycx9j3bflcTGsb7b@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211218214954.109755-3-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 18 Dec 2021, Colin Foster wrote:

> Child devices need to get a regmap from a resource struct, specifically
> from the MFD parent. The MFD parent has the interface to the hardware
> layer, which could be I2C, SPI, PCIe, etc.
> 
> This is somewhat a hack... ideally child devices would interface with the
> struct device* directly, by way of a function like
> devm_get_regmap_from_resource which would be akin to
> devm_get_and_ioremap_resource. A less ideal option would be to interface
> directly with MFD to get a regmap from the parent.
> 
> This solution is even less ideal than both of the two suggestions, so is
> intentionally left in a separate commit after the initial MFD addition.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/mfd/ocelot-core.c |  9 +++++++++
>  include/soc/mscc/ocelot.h | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
> index a65619a8190b..09132ea52760 100644
> --- a/drivers/mfd/ocelot-core.c
> +++ b/drivers/mfd/ocelot-core.c
> @@ -94,6 +94,15 @@ static struct regmap *ocelot_mfd_regmap_init(struct ocelot_mfd_core *core,
>  	return regmap;
>  }
>  
> +struct regmap *ocelot_mfd_get_regmap_from_resource(struct device *dev,
> +						   const struct resource *res)
> +{
> +	struct ocelot_mfd_core *core = dev_get_drvdata(dev);
> +
> +	return ocelot_mfd_regmap_init(core, res);
> +}
> +EXPORT_SYMBOL(ocelot_mfd_get_regmap_from_resource);

This is almost certainly not the right way to do whatever it is you're
trying to do!

Please don't try to upstream "somewhat a hack"s into the Mainline
kernel.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
