Return-Path: <linux-gpio+bounces-19508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B56AA52EB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247841C06C52
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4468F26561C;
	Wed, 30 Apr 2025 17:50:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31863F9D2;
	Wed, 30 Apr 2025 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035449; cv=none; b=IZmkMwjyufXGAujD54FRhlZhV3PHv8QgUUzHBe4yFmn0vNcBhRibRuMZPXysWV7T2r8xQkUBGn99nxw1h7+Wql6nOgQlq4WctJ3ypm8fT7Yw9P9oCoCdt2fH1U94BKVPUSzypxKV/g02JT535yw7yl81yEPisyjnn6zDLZOZEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035449; c=relaxed/simple;
	bh=ZYopyMLlnLDX+woA9g511UQ2e+4AzYvHm3Jor5tF3lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn2yD2MHX9fRJclaB7/9ckijGrT2iryp/EQQzPCtRtqfnBOSjAh2RTKYo/VV59uWVTxhhtvcl5BSE41ZurwGERjYGadSE2k8Xo/moJ/4dJmqJrwqgfeK4LqED4br9L+lsP+LIlgIL/BG7xyo9xgrmUy0enF0/DGd3cB8iFAK5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZnkqN2kqkz9sjs;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Qa8SuqShg7C; Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZnkqN1zfNz9sj6;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E48B8B765;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 11LIMd6Z3cYq; Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C1928B763;
	Wed, 30 Apr 2025 19:35:43 +0200 (CEST)
Message-ID: <95e42755-13ad-4659-903f-5f087926c0a1@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] powerpc: 52xx/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
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
>   arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> index 1ea591ec6083..c96af6b0eab4 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> @@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>   	return (in_be32(&gpt->regs->status) >> 8) & 1;
>   }
>   
> -static void
> +static int
>   mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
>   {
>   	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
> @@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
>   	raw_spin_lock_irqsave(&gpt->lock, flags);
>   	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
>   	raw_spin_unlock_irqrestore(&gpt->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> @@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
>   	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
>   	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
>   	gpt->gc.get = mpc52xx_gpt_gpio_get;
> -	gpt->gc.set = mpc52xx_gpt_gpio_set;
> +	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
>   	gpt->gc.base = -1;
>   	gpt->gc.parent = gpt->dev;
>   
> 


