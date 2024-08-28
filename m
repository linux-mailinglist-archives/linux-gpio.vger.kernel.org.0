Return-Path: <linux-gpio+bounces-9268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FD962715
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100F31F23EFD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 12:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6907A175D4A;
	Wed, 28 Aug 2024 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oG0xt3RO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7516C859;
	Wed, 28 Aug 2024 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848047; cv=none; b=QHumBHRlFH7LuAWCr2QXF8eUqGiqnGVeoRqiPhSuDYj1uSVgLwIRNU7E83154qcE3oh6HEc11EwSmxhhmWF9aMhiIMVGph1Jtg5Cz01yPkpLAWmgOwfhIOqECyiPYVpzN8eBJYLN6po7Qfx4IxKPTtcYKvvNtGZlzTDKzLGQCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848047; c=relaxed/simple;
	bh=2ziwrwW4OywBLlfR192dIFSM2DT7pGe0Nj0XqoHXsSA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X051V2JumPb6LOYVaRszDcr2k8fxXPwKSIvlVWVl6fPhAS21LmuJnmNB8hNoQ+YQu5oQ7uz9X7MBG/kitDAp6JRMYrxkQwqL7X7w80v2Y331gfVipiiJbkGJqGznr3PVvHBgN3Zq/cBrxELTamMcJWpcyKWGy6fRqeqqc0a6smc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oG0xt3RO; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S81J3D020794;
	Wed, 28 Aug 2024 07:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=l9zlw/gyFu63tESz3Q
	uaR6nrfY0/IeoZG2y0/T3PxDs=; b=oG0xt3ROPlUIIcm1dpRyIlnhfDsX6P2W/v
	qfvx0TQH403HRJbC4sdkhCL3jRQaMZHv788zl4jmil2sToV/Poc/C50h8EEX5bsq
	l5LhMBsEbHpT/fxafFrEZL8CATW9dN2lULsD9cqklXmx94pUfYhZX4FaHPTsmrCo
	hg4gwB8HpqYS/5agee1dMe+FlcOqYC6U1+u09DDTViB13En8QkM/rzuCGYPaMNgG
	4Wboc6km/2MEUM0LhQGB9eZS/DhaC1W2R9oI4RKqSht8/YWeK5vJQR0E6QbJ0YRS
	Y9+/gYCRmrLxvWj4CQ9oDb60t5Eo5mK8aZokiAcmH8masiYexXqg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 419puw0pgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:27:06 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 13:27:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 28 Aug 2024 13:27:04 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 75288820244;
	Wed, 28 Aug 2024 12:27:04 +0000 (UTC)
Date: Wed, 28 Aug 2024 13:27:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Yan Zhen <yanzhen@vivo.com>
CC: <rf@opensource.cirrus.com>, <tglx@linutronix.de>,
        <linus.walleij@linaro.org>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
Message-ID: <Zs8XlyXw421hHjM/@opensource.cirrus.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240828120118.1284420-1-yanzhen@vivo.com>
X-Proofpoint-GUID: Z59lWicZ8vZqdtlHwKdfeWRAlqaqk8BJ
X-Proofpoint-ORIG-GUID: Z59lWicZ8vZqdtlHwKdfeWRAlqaqk8BJ
X-Proofpoint-Spam-Reason: safe

On Wed, Aug 28, 2024 at 08:01:18PM +0800, Yan Zhen wrote:
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
>  drivers/irqchip/irq-madera.c                 | 5 ++---
>  drivers/pinctrl/cirrus/pinctrl-madera-core.c | 7 +++----
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
> index acceb6e7fa95..68ebe09baaf6 100644
> --- a/drivers/irqchip/irq-madera.c
> +++ b/drivers/irqchip/irq-madera.c
> @@ -199,9 +199,8 @@ static int madera_irq_probe(struct platform_device *pdev)
>  		ret = regmap_update_bits(madera->regmap, MADERA_IRQ1_CTRL,
>  					 MADERA_IRQ_POL_MASK, 0);
>  		if (ret) {
> -			dev_err(&pdev->dev,
> -				"Failed to set IRQ polarity: %d\n", ret);
> -			return ret;
> +			return dev_err_probe(&pdev->dev, ret,
> +						"Failed to set IRQ polarity: %d\n", ret);
>  		}
>  	}
>  
> diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> index 898b197c3738..532fa8ac9a94 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
> @@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
>  		ret = pinctrl_register_mappings(pdata->gpio_configs,
>  						pdata->n_gpio_configs);
>  		if (ret) {
> -			dev_err(priv->dev,
> -				"Failed to register pdata mappings (%d)\n",
> -				ret);
> -			return ret;
> +			return dev_err_probe(priv->dev, ret,
> +						"Failed to register pdata mappings (%d)\n",
> +						ret);
>  		}

Since we are doing a respin anyway also the brackets on the if
should be dropped on both of these as well.

Thanks,
Charles

