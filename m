Return-Path: <linux-gpio+bounces-13897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EF9F2777
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 00:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AD197A13D9
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2024 23:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED99E1C3C0D;
	Sun, 15 Dec 2024 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TI7J14mp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D16335C7;
	Sun, 15 Dec 2024 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734306860; cv=none; b=sMTpJVwVLkeDCxT3G1YOUqDHwW2rkat+SfZWQiRKFF6jeSgphWgxI6NzUcu3zPwURFex509y5ARzxkvH+mqvnC5+xXC2r3EVqJPjVGVJpclgFXx4uZGj2xVQGGRP9qhXOs1nMhA0cG6rfro6HUM5eeB2J4maSs4jDKSu9tX33RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734306860; c=relaxed/simple;
	bh=cpeljJB1zLV6yroPx2aPolzI/gxPF+mFin7QGAk4tRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmuMspHXx++tru+usXd0C3AXD2x1yLoxVXY+wysP7sOuVQvLpSnFqkv3rONIkwQdtWKC6C+ClyHVFR19dqMDk/tkvc5tD7EA+LRbWNJ68OqYuwCgeRXaW+LYJA6X7KlnHPkG00V00Y0QpGWHbjmRBnpOrLZBYGjSwiwdiwlZnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TI7J14mp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A1951048AF66;
	Mon, 16 Dec 2024 00:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734306849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/HK4E/A1XXBdIojpdswgpBBjDQ20PrFgHRSAU0uFOc=;
	b=TI7J14mpcYLmk+Tft8b38gaO5OjyC2RhtCvv/s76ISz51SobZbUQTpF5irmWtztnhqb/8D
	WXqZmlujV1tilLbaStVeCJkJ8MiBVCOe69mCms1/XOS4oVHx5Hj4ScqwsxlITAYr8tI7RP
	xZGTJEyU/cIcTFjkW9Zo161mNGsDuPRaGaQ6TXIkdu3/5cq+/Kg1hp5s0xe1YhIuE+l8kN
	+yg9m/bRcu7SAcLPpmhUAJkYDGTMh/Lz33RNLx/1G1HoXkRAuqQdZ3eJmP6S0t9nPK+j9/
	tvRV/E3IT9S7+4O3mvjShrjXRnXfjkOUWTAgjxb30ru9k2KCFXnCuvLabHUrrw==
Message-ID: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
Date: Mon, 16 Dec 2024 00:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241215204014.4076659-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241215204014.4076659-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/15/24 9:40 PM, Mingwei Zheng wrote:

[...]

> @@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> -			GFP_KERNEL);
> +				   GFP_KERNEL);

Please drop this one change.

>   	if (!pctl->banks)
>   		return -ENOMEM;
>   
> +	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> +				  GFP_KERNEL);
> +	if (!pctl->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < banks; ++i)
> +		pctl->clks[i].id = "";

Is this ^ assignment necessary ? If so, why ?

[...]

