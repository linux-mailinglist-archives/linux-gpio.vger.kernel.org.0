Return-Path: <linux-gpio+bounces-25851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912ABB50C35
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 05:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8623E188D5D0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 03:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5730124E4C6;
	Wed, 10 Sep 2025 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AT7i8eQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E38222A4F6;
	Wed, 10 Sep 2025 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757473802; cv=none; b=RO2PMfp+n33LkqzQApE74Hu1SVRbl03HbvvVBNIXOzpTsODUXkHoXqVWgU+d0F0Oz2mpbzfL0B3aXmGEbVnHq7rgKeLO1jtL28otoiY+97nkLca4LmfozV9Euzxpocobf4WQTF/Pb3utloJkCVHdYDtZ9vCWRZq40rEp1eEVqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757473802; c=relaxed/simple;
	bh=psKh6YmYrpT3IotkiCO2JdSjCWQK4oHdJZwNKIGxbE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crfnqCuYYbiY5WceBh+ZGVFSgwFCxDflsX1NpUW+HrAVbKk10JOE/yVvVRnaFifz0wafTxvPXLrB4GR+Gwr9HQs/DpAZN3i9TLJqkqyzBY8sq8+MNGeviS29uta5FjfNJasCJMsMz/kZLSaoiUcrWRQv2TAAnevkMQjFuvMuq5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AT7i8eQE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 763F520665;
	Wed, 10 Sep 2025 05:09:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJTq5Z_GPK_y; Wed, 10 Sep 2025 05:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757473790; bh=psKh6YmYrpT3IotkiCO2JdSjCWQK4oHdJZwNKIGxbE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AT7i8eQEsa2UZWIGYhxKz7cTBbEL2I0ZoKEvmRmCHSdC6Q3utEZ7LYOquZD5a2gnG
	 LEzsLGBkhCsWFGMLNRPeiQVrrBLLijEeHo5tmIzAd/NFL3I7eC0ZvTastEyC6AD5nQ
	 0pEwdw/y5wF+9XLeokYEZ7QtPUHYJNfW4CrDUd9jGjqFfin6rDgYcnUyG8XVp+hGcM
	 kDaWLfDjt+NEjXXGS5ZzxrhOpHK3FK0s7woAUHIZLxK6twIE1YPpHCgX4/3YEdm50a
	 BlnvflMcefhcjr7Aejf2VFm4Qd6S0u0z7rrGXP9rSPvuwPqcp1I87JQZd2qmRL4KmA
	 bmmSzmpbgFcbw==
Date: Wed, 10 Sep 2025 03:09:38 +0000
From: Yao Zi <ziyao@disroot.org>
To: Colin Ian King <colin.i.king@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] gpio: loongson-64bit: Fix a less than zero check
 on an unsigned int struct field
Message-ID: <aMDr8pX7MLfIRJny@pie>
References: <20250909190356.870000-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909190356.870000-1-colin.i.king@gmail.com>

On Tue, Sep 09, 2025 at 08:03:56PM +0100, Colin Ian King wrote:
> Currently the error check from the call to platform_get_irq is always
> false because an unsigned int chip->irq.parents[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
> 
> Fixes: 03c146cb6cd1 ("gpio: loongson-64bit: Add support for Loongson-2K0300 SoC")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Thanks for catching this,

Reviewed-by: Yao Zi <ziyao@disroot.org>

> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
> index f84f8c537249..24b7219db34a 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -267,10 +267,13 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < data->intr_num; i++) {
> -		chip->irq.parents[i] = platform_get_irq(pdev, i);
> -		if (chip->irq.parents[i] < 0)
> -			return dev_err_probe(&pdev->dev, chip->irq.parents[i],
> +		int ret;
> +
> +		ret = platform_get_irq(pdev, i);
> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret,
>  					     "failed to get IRQ %d\n", i);
> +		chip->irq.parents[i] = ret;
>  	}
>  
>  	for (i = 0; i < data->intr_num; i++) {
> -- 
> 2.51.0
> 

