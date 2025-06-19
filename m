Return-Path: <linux-gpio+bounces-21829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E7ADFA85
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 03:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A70F1BC08B8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 01:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BDD18DB20;
	Thu, 19 Jun 2025 01:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ThcwohwO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE07346F;
	Thu, 19 Jun 2025 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295254; cv=none; b=B/htfcYICxnOat8TYVnFXqP3s2sEf1CkyunAFWt723cLaDCoZKfXSvwllW+wk7KgnCJFp5NAJiqm5TfRFT0eRkiVCsRy0SHwoc7j1jQrR0SmVVOpEAGoJ7AE9w+wa4lwfrx04mHEP9i4t5Dm2tld6UZ9zl+igLW7c4+AZYL9WuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295254; c=relaxed/simple;
	bh=DTTzp2Vl+gfUSOjGl00L5KJ+Pi3ykju5H8rpHVudf/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1uKD3apc0RJzdvWpAyOLM+E3jdDhenJSNNJrlp7onehctG/tk1GgQvXpn5CMNHnEUBDMxlQ7yYl6MIRHH9sEhOhPqlYJzFT+M+B/YNkrQL8Q4g0AX+2dxkVUfEl+Z1WO220CAuIqWjOsWi4vB9Biy66GE+ki9oTMwC0AH/CZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ThcwohwO; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750295242; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=AHKGW4H7LN/JdA90Hf//Jy9UM44rzmLKYv/T1BIQf3A=;
	b=ThcwohwOlVxxBFreTs/w1zTgC4MHQ6HRZhidngBWyY40rRhV54E7HKpfTj0DXj/k6TcquCCVhH6FARIw95S8GH9PVSUkr3KViEHKMOdLwzCr5eaEr973mZk+fouPBM2Y1JLqndjqDeBW5H2iZOcxbD9tA5WDhy8Ko5nhJJHb/Pc=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeFD6QU_1750295241 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 09:07:21 +0800
Message-ID: <fd838615-d550-4e3a-9b4c-616a977fa410@linux.alibaba.com>
Date: Thu, 19 Jun 2025 09:07:21 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
 <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/17 20:24, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
>   	return 0;
>   }
>   
> -static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
> -			      int value)
> -{
> -	/* EICs are always input, nothing need to do here. */
> -}
> -
>   static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
>   				      unsigned int offset,
>   				      unsigned int debounce)
> @@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
>   	pmic_eic->chip.request = sprd_pmic_eic_request;
>   	pmic_eic->chip.free = sprd_pmic_eic_free;
>   	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
> -	pmic_eic->chip.set = sprd_pmic_eic_set;
>   	pmic_eic->chip.get = sprd_pmic_eic_get;
>   	pmic_eic->chip.can_sleep = true;
>   
> 

