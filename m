Return-Path: <linux-gpio+bounces-19507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B95AA52E9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5723BB3E6
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F452620C1;
	Wed, 30 Apr 2025 17:50:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61E23F9D2;
	Wed, 30 Apr 2025 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035444; cv=none; b=ETLq0sTN0bEhGk9K2UZKh+HtzNMkdhePEv8q0/40guXBn124a2mWxnqp/EZwWeG5kEGzzxvJyd2sSlFDeT/Atv9a3tu0TDOaNaFSqA1y5ipQIp8a1YMQ2ESyseBOMUdZbpVj2xOSzL2tN+4mwRwCtLorCszOKM7/Rf/rQVAKZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035444; c=relaxed/simple;
	bh=C0civ7UfCnkq3OvhNTY/w/0vMX9MvLl6Hh9nZlX0Ogo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvZX3NJ7xwpvtaTieQ25e+B2TDkahI/oAdB0fYiLgp4JVTAMFAlXmoeFvSGRgsqcRKdQdRfTeBOUuUodFNMlYObcHoRflbZ4PaSt99DbvUEmSp/YDTO48rfTMNiusI4eWRmSiR7Efu5BIG8nP+YR7vJuHapCAsGSXyOlOFooriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkpn2cG4z9sgJ;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAsYUwx7dfLd; Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkpn1gckz9sfW;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 31F988B765;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7luFV74bg8tK; Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 508E88B763;
	Wed, 30 Apr 2025 19:35:12 +0200 (CEST)
Message-ID: <0b2ca5c5-cad2-46f1-bc3a-f69d926443e9@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] powerpc: sysdev/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
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
>   arch/powerpc/sysdev/cpm_common.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
> index 47db732981a8..e22fc638dbc7 100644
> --- a/arch/powerpc/sysdev/cpm_common.c
> +++ b/arch/powerpc/sysdev/cpm_common.c
> @@ -138,7 +138,7 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
>   	out_be32(&iop->dat, cpm2_gc->cpdata);
>   }
>   
> -static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>   	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
> @@ -150,6 +150,8 @@ static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm2_gpio32_set(mm_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -208,7 +210,7 @@ int cpm2_gpiochip_add32(struct device *dev)
>   	gc->direction_input = cpm2_gpio32_dir_in;
>   	gc->direction_output = cpm2_gpio32_dir_out;
>   	gc->get = cpm2_gpio32_get;
> -	gc->set = cpm2_gpio32_set;
> +	gc->set_rv = cpm2_gpio32_set;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
>   
> 


