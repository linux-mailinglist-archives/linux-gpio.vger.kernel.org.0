Return-Path: <linux-gpio+bounces-9266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC48962690
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 678D11F23701
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 12:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D928173355;
	Wed, 28 Aug 2024 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O2ZABgTA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04416131C;
	Wed, 28 Aug 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724846959; cv=none; b=Xxo+RSxw3X+4F/n1kPweFldbhAdbmAbrsTxSJIyL1m43giOVH6QDQFH13wQVHWr2wL/lXf+jQyQ1AIr1FBCwB402M0GUIS7yuKMbE+fbLQ/v8gErACiRj3HTHAHle57IbXNaIK+HV/szhUqjkfY1WMS6Bj511DDISBIgkZm50xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724846959; c=relaxed/simple;
	bh=sSZERcgUIIRzItEE7PIRMmUyATrjbmFbFVv+DIM0QxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E86skYYRRmY37GiuUx/O0hfOkm8aaymJNtIlVlpgYGaOsorGjEYJ1biRYXyoOmMO/hKxuHJ9kamFMyrWWHU2xn3UAyWFol69Ap4wZsWIto65TVU6NBwufQox/lQ2+XGRNKHJzBk2fRf2OvqqyzOWiFO2nR95/GI5Nk0f52wIPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O2ZABgTA; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S81ElJ020629;
	Wed, 28 Aug 2024 07:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dWtL0d6+MeLxP7q4JyqmjS/dCgwsF6pvMN5UPtXtuKM=; b=
	O2ZABgTAFGrPV+X4/SNuTC2Wbe79sNFNdPNjNbMHx27B6arG5T0nvzL7OPRP8T3v
	BqYXgKWP5CE6t8iTuadcApEc3Q3NWIV2iBSGVUq3VJC422tMSSY1RwYrJkv5N2cY
	CZGRN2b0P0OImArCkk7EpsLD6nUU++hm78Av4un+r05KBmp5iFuwljPvxygQ12U1
	2c7h9kmHOjVx3vV75u55tB8kN5M4qlCDzNjMt37poKQv6IEir4uKrVDwZWwORqv0
	hUILrA0eRHqdXDmdEQk9OPyhtOEiuHKKTBhtR1TFZhFZQTxVX02AfK7z42Fz9AfC
	PJ6pUrRlrwWrgYC+nyxpVg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 419puk8p93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:08:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 13:08:55 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 28 Aug 2024 13:08:55 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9C15F820244;
	Wed, 28 Aug 2024 12:08:55 +0000 (UTC)
Message-ID: <82d147d8-8b97-48b1-8e2a-9479bff14f3c@opensource.cirrus.com>
Date: Wed, 28 Aug 2024 13:08:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
To: Yan Zhen <yanzhen@vivo.com>, <ckeepax@opensource.cirrus.com>,
        <tglx@linutronix.de>, <linus.walleij@linaro.org>
CC: <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <opensource.kernel@vivo.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240828120118.1284420-1-yanzhen@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TU5ZEJjH_1nh2G6XwF_mg8CdaJ_34Yjq
X-Proofpoint-ORIG-GUID: TU5ZEJjH_1nh2G6XwF_mg8CdaJ_34Yjq
X-Proofpoint-Spam-Reason: safe

On 28/08/2024 13:01, Yan Zhen wrote:
> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.
> 
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
> 
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
>   drivers/irqchip/irq-madera.c                 | 5 ++---
>   drivers/pinctrl/cirrus/pinctrl-madera-core.c | 7 +++----

Split into separate patches for irqchip and pinctrl. There's no
dependency between these two changes so they don't need to be
applied in the same patch.

Also use the correct commit subject prefix for the subsystem and
driver that is being patched. Not "cirrus:".

>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
> index acceb6e7fa95..68ebe09baaf6 100644
> --- a/drivers/irqchip/irq-madera.c
> +++ b/drivers/irqchip/irq-madera.c
> @@ -199,9 +199,8 @@ static int madera_irq_probe(struct platform_device *pdev)
>   		ret = regmap_update_bits(madera->regmap, MADERA_IRQ1_CTRL,
>   					 MADERA_IRQ_POL_MASK, 0);
>   		if (ret) {
> -			dev_err(&pdev->dev,
> -				"Failed to set IRQ polarity: %d\n", ret);
> -			return ret;
> +			return dev_err_probe(&pdev->dev, ret,
> +						"Failed to set IRQ polarity: %d\n", ret);

dev_err_probe already logs 'ret' so you don't need to log it again in
the message.

>   		}
>   	}
>   
> diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> index 898b197c3738..532fa8ac9a94 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> @@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
>   		ret = pinctrl_register_mappings(pdata->gpio_configs,
>   						pdata->n_gpio_configs);
>   		if (ret) {
> -			dev_err(priv->dev,
> -				"Failed to register pdata mappings (%d)\n",
> -				ret);
> -			return ret;
> +			return dev_err_probe(priv->dev, ret,
> +						"Failed to register pdata mappings (%d)\n",
> +						ret);

Same here. No need to log 'ret' twice.

>   		}
>   	}
>   


