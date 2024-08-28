Return-Path: <linux-gpio+bounces-9277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D5962AF7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 17:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07CF7285512
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB44319EEB4;
	Wed, 28 Aug 2024 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b+/0R/Wt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F34A16B386;
	Wed, 28 Aug 2024 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857198; cv=none; b=Q+WZJ0nQ2eUyxtQvE8+adtBDfaQHTrQoC5htOYslIVp4Gm8OJQ4eV2DdrCl8BRe6UU6Ke9ul1t8kTYwlX69YOVPpC315THIjHTSPxh7V+Mlmq/J1C7YJYDSYCQLRG5ZLTyGBHqY+kTjwFvb+VsnKq+CgcVNGvWAghX7MWcZfM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857198; c=relaxed/simple;
	bh=pPIGGElmaUEGncd/LGQc1RdgNFBdvnnWrz6caAuBDFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kPwivrNX5nloOqd8m4WX/JeT5qv7+U2wKq8xGOJfapCAGH3lA4sn318a4NqON7xHC9OZ9FGncAIUgmmtLkhcy/7DAYfPkyQmAlCXcTZhPmQeTSvxsZFq3pBymJ7InWPjbexge5mu1EMvFYMsbEFVeaQ5yu1hXURLZ4Zrs/PuASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b+/0R/Wt; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SEIXA7003698;
	Wed, 28 Aug 2024 09:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e2mJBcwa8EC9KVRlnCfz8BcvfT35jHTD7dZTCgoi42M=; b=
	b+/0R/WtO3lC+Y0u0GewYynKQofpyUIr85xtNwFEEfLY0EaGHrzxSNyBNAEz8eTL
	8ruX3om6ZcjcZxyZlGAuRm7gnHmMscdYRIfFcQ3p5rR24IiCDnspUCBD3N9zhKuN
	9fAlLtdOeNOu2slU2u6vERJu/Jr9s+TEX2946Be9xYSuuUKPzxAd0knr9lK0Q12h
	jSNVbsG22EM1/56iXZD53bCGY47Z9qdxGli2/XRGFzsF96uOqcT4fGuxPbCmyAvA
	5XyNU6TGG8QRS4MyhkioK9STW8GZ9MhPHRVme7vm4aoGrSwJIlt6nIGeqEEPLuCp
	OkR1xWkhK4q3zO6gqr8Qfg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 419puw0wbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:59:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 15:59:51 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 28 Aug 2024 15:59:51 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EA1F6820244;
	Wed, 28 Aug 2024 14:59:50 +0000 (UTC)
Message-ID: <9b5a3025-3e78-44b9-98f5-c945a6ac48d7@opensource.cirrus.com>
Date: Wed, 28 Aug 2024 15:59:50 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
To: Thomas Gleixner <tglx@linutronix.de>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Yan Zhen <yanzhen@vivo.com>
CC: <linus.walleij@linaro.org>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <opensource.kernel@vivo.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
 <Zs8XlyXw421hHjM/@opensource.cirrus.com> <8734mod7qi.ffs@tglx>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <8734mod7qi.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bP2wIbI4F9r4FI1BDVg7TngZVh3b9_yZ
X-Proofpoint-ORIG-GUID: bP2wIbI4F9r4FI1BDVg7TngZVh3b9_yZ
X-Proofpoint-Spam-Reason: safe

On 28/08/2024 15:47, Thomas Gleixner wrote:
> On Wed, Aug 28 2024 at 13:27, Charles Keepax wrote:
>> On Wed, Aug 28, 2024 at 08:01:18PM +0800, Yan Zhen wrote:
>>> @@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
>>>   		ret = pinctrl_register_mappings(pdata->gpio_configs,
>>>   						pdata->n_gpio_configs);
>>>   		if (ret) {
>>> -			dev_err(priv->dev,
>>> -				"Failed to register pdata mappings (%d)\n",
>>> -				ret);
>>> -			return ret;
>>> +			return dev_err_probe(priv->dev, ret,
>>> +						"Failed to register pdata mappings (%d)\n",
>>> +						ret);
>>>   		}
>>
>> Since we are doing a respin anyway also the brackets on the if
>> should be dropped on both of these as well.
> 
> No. https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules
> 

https://www.kernel.org/doc/html/latest/process/coding-style.html#codingstyle

does not say that. It says:

"Do not unnecessarily use braces where a single statement will do."

Note: single statement, not single line.

coding-style.rst is the coding style. If you disagree with the coding
style, send a patch to change coding-style.rst.

> Thanks,
> 
>          tglx


