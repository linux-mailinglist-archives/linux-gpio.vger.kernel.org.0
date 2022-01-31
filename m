Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E914A3ED2
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 09:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbiAaIri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 03:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbiAaIrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 03:47:37 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E61C06173D
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 00:47:37 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c23so23878803wrb.5
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 00:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t7jPwPhPro6Iv9HSiNOKR1rT0o1K1FCdRP2oY2jpf+w=;
        b=QzZYqxiaPC9Nq5ye22er2udgF5fExREUxs03Oa7WhWa6T3IpYz+t8negIwYhl+jGHa
         CgdYaW+6E75ONwCsuBQZMdPmo8762DvgwHsw8SGZ9ywzd0fQedjjAtVEZrI77yxMZhbq
         4kZAR8qrJmQ2GmQ3iqLVH9jgpMX072Clf65RoR/S/diKjC/XHFDc5ZBR7ad2bARR7vnv
         FQV+AnulBMJz0XfAWygjxA3XSv5YnwRhjn/Bl+NggIK97vEu6PXPUoN8nzhp6hs5unP5
         hBSH8uwTk13nzmkUZCwsPV9VJ3XXmCNpySljO21CZHxJxBwdwh9xtSjnfyAwemnt22n6
         Z3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t7jPwPhPro6Iv9HSiNOKR1rT0o1K1FCdRP2oY2jpf+w=;
        b=65dTorn8Ho7sUdj80fjEBK0XfcdYvCllDa73UvNyDxcA0TjVfxdGW8xGbLwSxn4a1u
         yOpHGpc5NdaiFEyHtgbliAIYor6Y/Rm7uvnZx9JXWdF+yP1B0KYYaTl3h68/Bl4TEnPZ
         0uF5ZGYvEO6oZlluEpfvuGRSrbmUJRNsqsTrx/qxorgkyanQpLGHEGjpUz1IRtyqlPbJ
         gflwoRn2SfJ+beogn8iHwIeauAVkSDqJ9f5ld7o+W3im7Ah8Cc/C6z3/idDRpp/srJjy
         trwFFMHmk+0Pr895tFU5kp4J2rL/PD69EJskzNDwo4js+oDy7lmCenU5kAUMP7zV8hWt
         HSZw==
X-Gm-Message-State: AOAM533UJmW0bWHPtxQjNUWHJOdijQsh96j/bmD1c59b5Rx5KjiOzi/Y
        VZ0QEwSGS5NIGW7bl3KFJHxXyg==
X-Google-Smtp-Source: ABdhPJyyc+x7qpUHDAy6jWDjoouaxef+ekdgY+9XelsF9wARb21PUz7MLztASeLFL5087U3C0mFR5A==
X-Received: by 2002:a05:6000:1848:: with SMTP id c8mr10310760wri.241.1643618855967;
        Mon, 31 Jan 2022 00:47:35 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id a14sm13421217wri.25.2022.01.31.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 00:47:35 -0800 (PST)
Date:   Mon, 31 Jan 2022 08:47:33 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
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
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        katie.morris@in-advantage.com
Subject: Re: [RFC v6 net-next 5/9] mfd: add interface to check whether a
 device is mfd
Message-ID: <YfeiJVmAbLa497Ht@google.com>
References: <20220129220221.2823127-1-colin.foster@in-advantage.com>
 <20220129220221.2823127-6-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220129220221.2823127-6-colin.foster@in-advantage.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 29 Jan 2022, Colin Foster wrote:

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
>  drivers/mfd/mfd-core.c   |  6 ++++++
>  include/linux/mfd/core.h | 10 ++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 684a011a6396..2ba6a692499b 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -33,6 +33,12 @@ static struct device_type mfd_dev_type = {
>  	.name	= "mfd_device",
>  };
>  
> +int device_is_mfd(struct platform_device *pdev)
> +{
> +	return (!strcmp(pdev->dev.type->name, mfd_dev_type.name));
> +}
> +EXPORT_SYMBOL(device_is_mfd);

As I said before, I really don't want MFDness leaking out into other
parts of the kernel.  Please find another way to differentiate between
devices registered via the MFD API and by other means.

I'm happy to help here.

How else could these devices be enumerated? 

>  int mfd_cell_enable(struct platform_device *pdev)
>  {
>  	const struct mfd_cell *cell = mfd_get_cell(pdev);
> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> index 0bc7cba798a3..c0719436b652 100644
> --- a/include/linux/mfd/core.h
> +++ b/include/linux/mfd/core.h
> @@ -10,6 +10,7 @@
>  #ifndef MFD_CORE_H
>  #define MFD_CORE_H
>  
> +#include <generated/autoconf.h>
>  #include <linux/platform_device.h>
>  
>  #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
> @@ -123,6 +124,15 @@ struct mfd_cell {
>  	int			num_parent_supplies;
>  };
>  
> +#ifdef CONFIG_MFD_CORE
> +int device_is_mfd(struct platform_device *pdev);
> +#else
> +static inline int device_is_mfd(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +#endif
> +
>  /*
>   * Convenience functions for clients using shared cells.  Refcounting
>   * happens automatically, with the cell's enable/disable callbacks

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
