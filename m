Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954D148146A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 16:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240535AbhL2P0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 10:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbhL2PZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 10:25:59 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C3EC061574
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:25:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d9so45202405wrb.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 07:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2LvQ3YDK+pFh21ErisGgun4OyhM+EJQfNWms49Mzu18=;
        b=QazW7x7A1LVXE3A5B4XJKAhIKBjmlp7kQI2Y9xZZlNGeathz2ZlE+WdERJpBhFmlE1
         ookyUDRPX7TaIfQ0MgGECz758RDpieowomh5RjPYgBVSEhBp4T41qkR+voCuLqboYpur
         bfIVhl6a6fRfihstRU6g1dpyK79vKxn5uScYxAYErpRLDVxWUXV8k2Q3ZIajOdMjvQ2f
         eBYBBuFaYmQwunIxN/L3rWvp3jaDDtC3sxECWKp8BCjGCsh3JpCLsJ6EXZs1uopj8gtC
         d9ARZwck2YNNftwSLmrUls5pbdi/rOjwEEKx3Mkm0yk0SEg5eXkiGXGrCtGQ05Yb92C1
         mQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2LvQ3YDK+pFh21ErisGgun4OyhM+EJQfNWms49Mzu18=;
        b=ANtOY3Wg1fEL2cIJYjKvsqeQnJQG8D9/0yJ8JoyQ/SQmssZRtVmjuZcuKV+ulAUdpT
         3oUcNI8J3Sf93tKGQQ+LAEYkaIOZroBw4PAwXUzQtjPqzpZnITM/wvwLzka+kXMwdybr
         mESKURQfOcL/MN31LLw6V5FDT6hK+skufFhwsOyyjEJSTvZr5Y7gU83K+hJn21GsWUS8
         5wfxdlSSLVIAWCsZQBKqrkhbXoKCZ0ubZ2YidOvUHjGaeijgc47TZ1P+uwv2I3lwmSJw
         QbTKnzDC49i1QsSNb9ofAV6RZZBnfCJbBLKOUGqcY/rFq6QP3jdoWqFsFLmzadNmFTlP
         ijfQ==
X-Gm-Message-State: AOAM5335ZKa4V92srEJMsQWphrZAJjAHxzXmnuh9+YdgUXRHMpxikOsc
        cRy1kF6P+gZOrKJXhGPct1rdPw==
X-Google-Smtp-Source: ABdhPJyE4O+tlUmmtK6EFlUaGWRLKF3S++iTvVhixbPeoCZ5COQ1aSWej4mCtXIfdW0yQCdSw1AQlg==
X-Received: by 2002:adf:d843:: with SMTP id k3mr22067929wrl.303.1640791557959;
        Wed, 29 Dec 2021 07:25:57 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id h14sm21273126wrz.31.2021.12.29.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:25:57 -0800 (PST)
Date:   Wed, 29 Dec 2021 15:25:55 +0000
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
Subject: Re: [RFC v5 net-next 08/13] mfd: add interface to check whether a
 device is mfd
Message-ID: <Ycx+A4KNKiVmH2PJ@google.com>
References: <20211218214954.109755-1-colin.foster@in-advantage.com>
 <20211218214954.109755-9-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211218214954.109755-9-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 18 Dec 2021, Colin Foster wrote:

> Some drivers will need to create regmaps differently based on whether they
> are a child of an MFD or a standalone device. An example of this would be
> if a regmap were directly memory-mapped or an external bus. In the
> memory-mapped case a call to devm_regmap_init_mmio would return the correct
> regmap. In the case of an MFD, the regmap would need to be requested from
> the parent device.
> 
> This addition allows the driver to correctly reason about these scenarios.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/mfd/mfd-core.c   |  5 +++++
>  include/linux/mfd/core.h | 10 ++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 684a011a6396..905f508a31b4 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -33,6 +33,11 @@ static struct device_type mfd_dev_type = {
>  	.name	= "mfd_device",
>  };
>  
> +int device_is_mfd(struct platform_device *pdev)
> +{
> +	return (!strcmp(pdev->dev.type->name, mfd_dev_type.name));
> +}
> +

Why is this device different to any other that has ever been
mainlined?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
