Return-Path: <linux-gpio+bounces-21802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 557ACADF2D3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 18:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2500C3BAF23
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201252F005F;
	Wed, 18 Jun 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kcLgfZXM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501D2EF9DB
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265005; cv=none; b=cvi0A0jCCD0YGpPA6w7/V1bSi4GIXMC2a9sj1/NKGnFdx3DD9pLnqPWStZhngXS8tWCHLIF9ZvEdJBCDepk1WApYKvcpW2EK5YZlAvgeVgvSHAM32dE2XbLjrJ+h2MzvCe+vISrc8nIry2X73o5hVICZ3jn7XLyQtlr3LRueugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265005; c=relaxed/simple;
	bh=0LdJL+y/rOZeUEYIIOhCBErur5uufbz7XArWM+mqnt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=M/26/R0QmdkhFkJHUydspxffcbMzYAqrsDfjtV5LmaxorMXdzW7vg/IqVI+obXWhqHz3r8qkCHL350DFSw+1HBhACZ9lXbiFrCIW9p+1Ra1T1Rk+cuFoK7jL+rxNB6Gjss5kUT7Ccyw63FMJ7IUb6pCU/YYbFBfUgt7VmjcPhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kcLgfZXM; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618164321euoutp01e3439000b95a70ca94fad158a0723edb~KML7LGiM22854028540euoutp01W
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 16:43:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618164321euoutp01e3439000b95a70ca94fad158a0723edb~KML7LGiM22854028540euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750265001;
	bh=UDfJotcIpWIKY+QmO8fvKHc439D+osARVOJJ3r+0Ufg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kcLgfZXMu1OXO6rHUKWk2PHT23diE2bNM4j1nIuztL7CaqFYiQ1QkO/Aq5mDaIRcO
	 JeeosfjgQckCFrDTgHoz2/5cdHPLn91Dt39chRhRFJ3m6+uXqJ0MDxmpKYEyMBy9w9
	 JBNPgknEHprdanrVY06pMchfWLL7pJTnS51eMFbk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618164320eucas1p28174732f38fd279fbba72f07887e5da5~KML6PRps61894318943eucas1p2H;
	Wed, 18 Jun 2025 16:43:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618164318eusmtip29415a14e64deb8a38a5078dfd40afd78~KML45IQjO0062800628eusmtip2E;
	Wed, 18 Jun 2025 16:43:18 +0000 (GMT)
Message-ID: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
Date: Wed, 18 Jun 2025 18:43:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, Romain
	Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko
	<grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
	Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
X-EPHeader: CA
X-CMS-RootMailID: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
	<20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
	<CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>

On 10.06.2025 14:33, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>   	return 0;
>   }
>   
> -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
> +	return 0;
>   }
>   
> -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   	unsigned long flags;
> @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	gc->write_reg(gc->reg_dat, gc->bgpio_data);
>   
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> -				 int val)
> +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> +				int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   
> @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>   		gc->write_reg(gc->reg_set, mask);
>   	else
>   		gc->write_reg(gc->reg_clr, mask);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   	unsigned long flags;
> @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	gc->write_reg(gc->reg_set, gc->bgpio_data);
>   
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>   }
>   
>   static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>   }
>   
> -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>   			       unsigned long *bits)
>   {
>   	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> -				   unsigned long *bits)
> +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
>   {
>   	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> -					  unsigned long *mask,
> -					  unsigned long *bits)
> +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
>   {
>   	unsigned long set_mask, clear_mask;
>   
> @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>   		gc->write_reg(gc->reg_set, set_mask);
>   	if (clear_mask)
>   		gc->write_reg(gc->reg_clr, clear_mask);
> +
> +	return 0;
>   }
>   
>   static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
> @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
>   	if (set && clr) {
>   		gc->reg_set = set;
>   		gc->reg_clr = clr;
> -		gc->set = bgpio_set_with_clear;
> -		gc->set_multiple = bgpio_set_multiple_with_clear;
> +		gc->set_rv = bgpio_set_with_clear;
> +		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
>   	} else if (set && !clr) {
>   		gc->reg_set = set;
> -		gc->set = bgpio_set_set;
> -		gc->set_multiple = bgpio_set_multiple_set;
> +		gc->set_rv = bgpio_set_set;
> +		gc->set_multiple_rv = bgpio_set_multiple_set;
>   	} else if (flags & BGPIOF_NO_OUTPUT) {
> -		gc->set = bgpio_set_none;
> -		gc->set_multiple = NULL;
> +		gc->set_rv = bgpio_set_none;
> +		gc->set_multiple_rv = NULL;
>   	} else {
> -		gc->set = bgpio_set;
> -		gc->set_multiple = bgpio_set_multiple;
> +		gc->set_rv = bgpio_set;
> +		gc->set_multiple_rv = bgpio_set_multiple;
>   	}
>   
>   	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
>   	}
>   
>   	gc->bgpio_data = gc->read_reg(gc->reg_dat);
> -	if (gc->set == bgpio_set_set &&
> +	if (gc->set_rv == bgpio_set_set &&
>   			!(flags & BGPIOF_UNREADABLE_REG_SET))
>   		gc->bgpio_data = gc->read_reg(gc->reg_set);
>   


A few more changes are needed to avoid NULL pointer dereference 
(observed on RasbperrryPi5), because this driver calls ->set method 
internally:

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb23..57622f45d33e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, 
unsigned int gpio,
  static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
                                 int val)
  {
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);

         return bgpio_dir_return(gc, gpio, true);
  }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct 
gpio_chip *gc, unsigned int gpio,
                                    int val)
  {
         bgpio_dir_out(gc, gpio, val);
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);
         return bgpio_dir_return(gc, gpio, true);
  }

  static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int 
gpio,
                                    int val)
  {
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);
         bgpio_dir_out(gc, gpio, val);
         return bgpio_dir_return(gc, gpio, true);
  }

Do You want a formal patch with the above changes, or will You just 
amend them to the updated patch?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


