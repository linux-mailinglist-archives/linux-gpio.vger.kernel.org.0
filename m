Return-Path: <linux-gpio+bounces-19506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A18AA52E7
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66DB4A6E84
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E016A262807;
	Wed, 30 Apr 2025 17:50:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24013F9D2;
	Wed, 30 Apr 2025 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035439; cv=none; b=Hd43JuUalkmed3WeXXJVwbVK30xqfsHjj7sXB7Co3E5y1Qn5bB2QuH4Nkz5Zj2Ff5d6HFLQxYsOqqCZeWukSdql0UvuQhdHv9HwB4UovD/RMHwR5b3xgWC2oNhT1XavdXvzU/roKupMFdwwhBFGVKrj2SnR7aITmbq50l42Rl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035439; c=relaxed/simple;
	bh=iPeb5vh2CTxHJsC40GycuD0WRjt9wbFDVct02tI48Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxDgD6t4bfdZ8dLwG2alVlseEvno3u2OomjmB4+TRuYp/CMrvyDuOuiZq3GPfy+epmOf0DillJq8EIQYWepQB4rVsvHhSvmpN+Ibt69hWhwix1De2k1ySViyysf7ELtNzSGYBSP/+C0YZdfJBQSlMRNhj+MijyD5IVb0rUlX32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZnkrJ2Shnz9sl0;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3u-FPeOjPKNM; Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZnkrJ1grhz9skH;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32BE38B765;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PhPau0Aadfr3; Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BA5B8B763;
	Wed, 30 Apr 2025 19:36:31 +0200 (CEST)
Message-ID: <6ed2d6a4-e957-44ad-b498-8b22425da5f5@csgroup.eu>
Date: Wed, 30 Apr 2025 19:36:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] powerpc: 8xx/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
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
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # powerpc 8xx

> ---
>   arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
> index 1dc095ad48fc..7462c221115c 100644
> --- a/arch/powerpc/platforms/8xx/cpm1.c
> +++ b/arch/powerpc/platforms/8xx/cpm1.c
> @@ -417,7 +417,7 @@ static void __cpm1_gpio16_set(struct cpm1_gpio16_chip *cpm1_gc, u16 pin_mask, in
>   	out_be16(&iop->dat, cpm1_gc->cpdata);
>   }
>   
> -static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -428,6 +428,8 @@ static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm1_gpio16_set(cpm1_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm1_gpio16_to_irq(struct gpio_chip *gc, unsigned int gpio)
> @@ -497,7 +499,7 @@ int cpm1_gpiochip_add16(struct device *dev)
>   	gc->direction_input = cpm1_gpio16_dir_in;
>   	gc->direction_output = cpm1_gpio16_dir_out;
>   	gc->get = cpm1_gpio16_get;
> -	gc->set = cpm1_gpio16_set;
> +	gc->set_rv = cpm1_gpio16_set;
>   	gc->to_irq = cpm1_gpio16_to_irq;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
> @@ -554,7 +556,7 @@ static void __cpm1_gpio32_set(struct cpm1_gpio32_chip *cpm1_gc, u32 pin_mask, in
>   	out_be32(&iop->dat, cpm1_gc->cpdata);
>   }
>   
> -static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -565,6 +567,8 @@ static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm1_gpio32_set(cpm1_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -618,7 +622,7 @@ int cpm1_gpiochip_add32(struct device *dev)
>   	gc->direction_input = cpm1_gpio32_dir_in;
>   	gc->direction_output = cpm1_gpio32_dir_out;
>   	gc->get = cpm1_gpio32_get;
> -	gc->set = cpm1_gpio32_set;
> +	gc->set_rv = cpm1_gpio32_set;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
>   
> 


