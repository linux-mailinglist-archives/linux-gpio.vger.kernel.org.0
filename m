Return-Path: <linux-gpio+bounces-25710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9DB47BBF
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 16:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B3217CFE6
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDC2275AF7;
	Sun,  7 Sep 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kVr6mPH/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7D26E143;
	Sun,  7 Sep 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757254206; cv=none; b=ZFnRnsy156ki3z8hROa3DT3UMp4bXe/logQ0douxuBH2Wno0MC4NH88onmpKGuWQB+WmvRKcG0PwuFck82Smpo5TCVKa3VrRjgsyu1I4IJOJIntp9BFnWCi7UuNYzJN11DdZMyFJ9wgX2xYLrcbGmL5JYoxbD+gzo3MJWXHKZSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757254206; c=relaxed/simple;
	bh=xHZKz28P4B9qneJGd4bihS1Kj7knNrpqY00JMu0Xh9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UnkLjUhdJFXz5ve41x9vAnwJ0fBfqSwES1ZbiorOqli166tKmBpOir6VvHxonoeIqQzt9tNCCyWkSuK7sg5MrBzudby3xPrNMflwbN7FuSA/he9Vjfy5mG1W+1Qjr7Lj3y20kcMHcUsuLBY5TzpJrg0Px4StByRbh0RXv27Ir5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kVr6mPH/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 587E9wak3604398;
	Sun, 7 Sep 2025 09:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757254198;
	bh=nX2lcggh7Oc1Dcnq24mF2U0nUwjHXRO74W0IGIkMZ0Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kVr6mPH/q8iuAfPlh3TYm4DW8dlKvn6Hvzr6i7t9faPl+8g1gEcN6VvxqtadvvLX4
	 n51WMNbCoCBzAoFtNKpBv/2D/j/vkTE6K0djV0dMO6yfHQ6dfjeNlMXeIbtPXZWlWB
	 rSMAYYBKryVXbzWxbex30vq2czMZYnGuvOCIGHhw=
Received: from DFLE20.ent.ti.com (dfle20.ent.ti.com [10.64.6.57])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 587E9wI33076022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 7 Sep 2025 09:09:58 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Sep
 2025 09:09:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Sun, 7 Sep
 2025 09:09:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 09:09:57 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 587E9v3r3610320;
	Sun, 7 Sep 2025 09:09:57 -0500
Message-ID: <7dc4da15-28a4-4e1f-b0c9-9115f97edd77@ti.com>
Date: Sun, 7 Sep 2025 09:09:57 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: pisosr: Use devm_mutex_init()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
References: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 9/7/25 8:25 AM, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     8431	   1808	    192	  10431	   28bf	drivers/gpio/gpio-pisosr.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8112	   1736	    192	  10040	   2738	drivers/gpio/gpio-pisosr.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/gpio/gpio-pisosr.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index a69b74866a13..7ec6a46ed600 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -108,11 +108,6 @@ static const struct gpio_chip template_chip = {
>   	.can_sleep		= true,
>   };
>   
> -static void pisosr_mutex_destroy(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int pisosr_gpio_probe(struct spi_device *spi)
>   {
>   	struct device *dev = &spi->dev;
> @@ -139,8 +134,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>   		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
>   				     "Unable to allocate load GPIO\n");
>   
> -	mutex_init(&gpio->lock);
> -	ret = devm_add_action_or_reset(dev, pisosr_mutex_destroy, &gpio->lock);
> +	ret = devm_mutex_init(dev, &gpio->lock);
>   	if (ret)
>   		return ret;
>   


