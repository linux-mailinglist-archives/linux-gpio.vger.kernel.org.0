Return-Path: <linux-gpio+bounces-19510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B9AA52F1
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE084A727F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81672701A6;
	Wed, 30 Apr 2025 17:50:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2283266B41;
	Wed, 30 Apr 2025 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035459; cv=none; b=Y/XhGPzM9HrHkhYOyd4le2r2GqFaiESdQFCFin0TSCDyUuaKKTbUzgnEFB+qzQ9A+bucwT3Plaba7UVVx8gcfgQ2Ovb30rHva69zzLJW6huzyS+DTJXTayqhyQK5sqKViOpWZ/VT9fDQIk+uxLfzhJq75CCK/qiAENxjxY+r4B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035459; c=relaxed/simple;
	bh=6DnXcuIB7kw/wgnKG59umpRn+P/6qnNW2bGCf3Dec4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCfJ00sfMKM5/sBSX7ddeoWk3k9WJCXftuWS0alO2Vx7ZnNEJHNQRIZeNd1WN5AcV7HNgIxKeoFhmyfWtA5R2yCxxgYbQmumZSrW78PkliWos4lfZZg6+L8EdHXmbLYA938H97EhLhkv91m5wnGM4Zm/vkVq627N6kmmMsGIbww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkq45ny8z9sgs;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqe3FYWY-FyS; Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkq40BnRz9sgR;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 009548B765;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g5LcEjKmwqYi; Wed, 30 Apr 2025 19:35:27 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D3A228B763;
	Wed, 30 Apr 2025 19:35:26 +0200 (CEST)
Message-ID: <fab558c6-0403-45f4-97c3-9c71db678a20@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] powerpc: 44x/gpio: use new line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/04/2025 à 09:21, Bartosz Golaszewski a écrit :
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/44x/gpio.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
> index e5f2319e5cbe..d540e261d85a 100644
> --- a/arch/powerpc/platforms/44x/gpio.c
> +++ b/arch/powerpc/platforms/44x/gpio.c
> @@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   		clrbits32(&regs->or, GPIO_MASK(gpio));
>   }
>   
> -static void
> -ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	spin_unlock_irqrestore(&chip->lock, flags);
>   
>   	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
> +
> +	return 0;
>   }
>   
>   static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> @@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
>   		gc->direction_input = ppc4xx_gpio_dir_in;
>   		gc->direction_output = ppc4xx_gpio_dir_out;
>   		gc->get = ppc4xx_gpio_get;
> -		gc->set = ppc4xx_gpio_set;
> +		gc->set_rv = ppc4xx_gpio_set;
>   
>   		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
>   		if (ret)
> 


