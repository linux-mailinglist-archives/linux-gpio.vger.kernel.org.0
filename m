Return-Path: <linux-gpio+bounces-5995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC8F8B8B41
	for <lists+linux-gpio@lfdr.de>; Wed,  1 May 2024 15:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07D971F235D5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 May 2024 13:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7916912EBCA;
	Wed,  1 May 2024 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6vq4feq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701112E1D1
	for <linux-gpio@vger.kernel.org>; Wed,  1 May 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570374; cv=none; b=WucWXvAXm0RGHIBBsQV6hU4kDeE4jBVQ8J+T00uTomIRYj0Xre/NMFDyGivPt7UfaeWO1SZJTOc6Nl+aWJMjaBGd8x+/nppu5HaRUq1SqksD+fmZRjYZ8zFQeKjwuIHM/qGKg7mPCbFmqWFVlzgct6KSjg6hwcvw2uIL2ml2iAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570374; c=relaxed/simple;
	bh=ZqcDVgO1hmm+00KuoWmbr7W1NZLQvg1QhUiwr8SEKP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvKyM+62aXzsy7x9Gt8PREmhAjLQw0qelPif4cuuS+W9JStH5JOEBiyV2BGM/5rWA99ee/P7vlyqrPsPNcOrjBM/9fYBhpmp1QwAPusnllvypknjOearjVwO8kmY3+dlbgm7lFP99f0iCzlfMuirbXVbUNS5seh+XiqdA28evT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6vq4feq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34d7b0dac54so459769f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 May 2024 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714570370; x=1715175170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=F6vq4feq2N5K6oTj556OwcPXVHZ7iw0HaZm1/3fK7K35ZYPLVA0aEuiko5H4MqYkQh
         qSe5VEjBpSX5FByvdImvMsfRPr6G+ZrVMz0YoI/HbJ3QeVzdcsCZ6ZekbH6GTvtKEgj1
         WBCFyOatej8cYNzphRSYOmgr3QN/8q7hkrGHzYwN2POMuPVHWKe9DGe0pKFAEUO1l1t6
         mWgb4K4+leSysSgczOEMCz+aChc6vudaAWSlV36rkLHpFSd8ZfJb/sGN0wvi8bxq04eA
         vcRNjkl/2HVD/Q82Qhv9vnhuCGOS9syNHALjM4eJ72PUF/+Nuxe0rEm7F19s8DlUBlhg
         xPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570370; x=1715175170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ior2gPFVlEOyeV8FJQcXfdx4VXM0R/609sKh6Of53VM=;
        b=gA6mLd+wxZSM7EppXkpC1aHdLeM7MAMd1mmx0MadJ6dIe38XS9pejM5iLkt3XM+r4E
         lRDfOxhv5W4Dnhttf2hWzE0QyUxFKne0zKUJ6+Yu/jsN0sNUv+FX1Le/6LVWEgrVnLAZ
         Aht+GKqIfI3hsa2U4UMRygmBOS7mleHTvtN1EOVUXu7N2DhUzGatDdljwqULo8GpKSiI
         XxKFuQutfFG5QVzRUSFLEQ9Ge8XnC1F3I7lYkXJwnd6MfonSEdguW9sWFWs8XtE3iWaJ
         cAp+zMfJdpF0uYw+JyV+f2wTk+ulyBoRcXbo0QrXNLjfhRoGjWufEkL9Z+I6BCvdGEK4
         TgYw==
X-Forwarded-Encrypted: i=1; AJvYcCUTd3DS0QPwKyI/lzmFtLot50o1omMU7CKspIr8iYm4gmUniElXCeqmSfQcJoZUAHekYjp96NqlWVOJr+O7wIVzh/54xZTPi1KaaA==
X-Gm-Message-State: AOJu0YzUsAZdCSA1ZAFrWT/uBiFNNYeQZ7Pxc+UneKftchp1zxkovqy2
	kPTRDuiBRSrOi5ACG9NQgkpPDKR6D3zl7nv8TuyscR+EHXYUGbK7WDmbT5SElfU=
X-Google-Smtp-Source: AGHT+IHuNu3c35RsAkvpJAfWqKVWQhv6Z4Ac0yjTjDmpBKt12bv5Zna3drXEkGYfHrENBoZl/SwOjw==
X-Received: by 2002:a05:6000:24f:b0:34c:bf22:73f9 with SMTP id m15-20020a056000024f00b0034cbf2273f9mr2265612wrz.28.1714570369370;
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm32876234wrj.100.2024.05.01.06.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:32:49 -0700 (PDT)
Date: Wed, 1 May 2024 16:32:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>

On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
>  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
>  	if (ret) {
>  		dev_err(dev, "Failed to register pinctrl\n");
> -		goto exit_out;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, iod);
>  
>  	return pinctrl_enable(iod->pctl);
> -
> -exit_out:
> -	of_node_put(np);
> -	return ret;
>  }

This will call of_node_put() on the success path so it's a behavior
change.  The original code is buggy, it's supposed to call of_node_put()
on the success path here or in ti_iodelay_remove().

If it's supposed to call of_node_put() here, then fine, this is bugfix
but if it's supposed to call it in ti_iodelay_remove() then we need to
save the pointer somewhere using no_free_ptr().  Probably saving ->np
is the safest choice?

The original code is already a little bit buggy because it doesn't
check for pinctrl_enable() errors and cleanup.


diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..f40a1476e4ff 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -156,6 +156,7 @@ struct ti_iodelay_device {
 
 	const struct ti_iodelay_reg_data *reg_data;
 	struct ti_iodelay_reg_values reg_init_conf_values;
+	struct device_node *np;
 };
 
 /**
@@ -884,7 +885,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iod);
 
-	return pinctrl_enable(iod->pctl);
+	ret = pinctrl_enable(iod->pctl);
+	if (ret)
+		goto exit_out;
+
+	iod->np = no_free_ptr(np);
+	return 0;
 
 exit_out:
 	of_node_put(np);
@@ -903,6 +909,7 @@ static void ti_iodelay_remove(struct platform_device *pdev)
 		pinctrl_unregister(iod->pctl);
 
 	ti_iodelay_pinconf_deinit_dev(iod);
+	of_node_put(iod->np);
 
 	/* Expect other allocations to be freed by devm */
 }





