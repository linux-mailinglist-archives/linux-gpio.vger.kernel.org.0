Return-Path: <linux-gpio+bounces-14168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E099FB4B8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 20:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A241881A44
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 19:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C142E1C6889;
	Mon, 23 Dec 2024 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="CueH/fD3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432D28DA1;
	Mon, 23 Dec 2024 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734982524; cv=none; b=lJq431Op5Lkc2JUNMXc970NsS3RAbymZanyJLgDGG0P1yjPOhuHPFQg8TO4+FPonH07p8oSKsmL+G2WH05JrH9yo0LDS6c6e3sxE/hbEn50jR6PSmsCXg2tLFtcnHHU70tnCVf8KbpJ1FfV4YTPe3UL7HyMCcRitrVcVUyRJacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734982524; c=relaxed/simple;
	bh=h9YOzidppOmJWphCLl255FUdTo3VTZPN4fiPiJDGkKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMoD7zqtFKaKRbhqLA5jywF0qEOiD9pkgzXESIYTsl6uoWWfMOMU9DICyVlj17GYyrfeCuAmaiXUtLQ0hV2DCWReewGUrgAHQn2J7PaWDGjmfgJVEHLaEMIE97b7gIZ7ZYArtLJiCmIdvJ4a0v8TN5tAvNbWpZt7b35y29V9X3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=CueH/fD3; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF95108A88F0;
	Mon, 23 Dec 2024 20:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734982520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WLuHWjZM3VRX7nJ+Pc75I1m4HqNbbSxdu5AhUiwKyg=;
	b=CueH/fD3YFomuQ1LDPTIrV6Y7okJdiQF7ouvXjU8mWrTaaDb1lShPFWDI3w4gTLIoDG15Z
	buFWYSgi5vaRBeWFErPnX9r0BxPiN9/6p8CcnRlH+CQ1l1VTJqM98idg8+PYFh8b6d4rN+
	TRz+EbhHKRqm10eL64RtQIKMrfJ2ejlUugJ6ikp7krKjXyvcAge5Y5ZByn7UDqUYJuYBTR
	k/IUvEBsrKs9vch5/Fx6Q0MOigV4/ZjFg9dRgV9KyeHUtya6HJ67RQVRH4+//L6VpuTP3C
	zOwOVu32xwsi/hQt5B3lLbOYasInFMiGufNsQb4I3X4t/X9ZhpyfVcHvOHKkLg==
Message-ID: <412e65b5-dd91-4982-8b1a-423997da9a28@denx.de>
Date: Mon, 23 Dec 2024 20:33:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241223020629.3471182-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241223020629.3471182-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/23/24 3:06 AM, Mingwei Zheng wrote:

[...]

Shouldn't the clock be enabled before calling 
stm32_gpiolib_register_bank() ? I think the 
clk_bulk_prepare_enable(pctl->nbanks, pctl->clks); should be around here.

> @@ -1646,15 +1628,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
>   			return ret;
>   		}
>   
>   		pctl->nbanks++;
>   	}
>   
> +	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
Aside from that one question, this looks good, thanks !

