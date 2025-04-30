Return-Path: <linux-gpio+bounces-19509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32698AA52EE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 19:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968E74A727F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 17:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1774C26658B;
	Wed, 30 Apr 2025 17:50:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2BC266566;
	Wed, 30 Apr 2025 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035453; cv=none; b=S4m+YJLps26lca/tmLnocPptoHU1rN5QZ6QMg/An/lthwQVo+9Sz3H1ZoYkIQfr1umazSefKfPxC1gSw38OAKOA1pBr0ntrM9ieLg7QaXvxJ2Hqsyb4fEuUarfE30ZOD/4nn0mEDdIJiIzwORvtsKXn0Pki7hnxobiOCmZaMFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035453; c=relaxed/simple;
	bh=lhbpp0bXVbOc8CtFLW0Ny8MieOlby3Adwq4uiz5JmIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pq0qNA/sie7nIENAXu/rVt+LiXOjLB5RJLqcrKUW8HuIde2100P0HiqDtjEq99d5M4vynNNyJPBaPw/53dLRnqNio493fRh1sucJz6tcjvXh2/O1tmxrYlvhlxPdRSGsPSc9XvZQt4uLsupswe6DqkqkSiFA9FHCPTHxO3Pfsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkmp3X2Nz9sfF;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKxf0jgrwP6Q; Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkmp2jH5z9sd1;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 576778B765;
	Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AMxxhowWQVYU; Wed, 30 Apr 2025 19:33:30 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 554BC8B763;
	Wed, 30 Apr 2025 19:33:29 +0200 (CEST)
Message-ID: <4a6e8ac1-b4e8-49e1-bc8a-d1854985bb31@csgroup.eu>
Date: Wed, 30 Apr 2025 19:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
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
> ---
>   arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> index 4d8fa9ed1a67..d4ba6dbb86b2 100644
> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> @@ -92,7 +92,7 @@ static void mcu_power_off(void)
>   	mutex_unlock(&mcu->lock);
>   }
>   
> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	struct mcu *mcu = gpiochip_get_data(gc);
>   	u8 bit = 1 << (4 + gpio);
> @@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   
>   	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
>   	mutex_unlock(&mcu->lock);
> +
> +	return 0;

i2c_smbus_write_byte_data() can fail, why not return the value returned 
by i2c_smbus_write_byte_data() ?

>   }
>   
>   static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
>   	gc->can_sleep = 1;
>   	gc->ngpio = MCU_NUM_GPIO;
>   	gc->base = -1;
> -	gc->set = mcu_gpio_set;
> +	gc->set_rv = mcu_gpio_set;
>   	gc->direction_output = mcu_gpio_dir_out;
>   	gc->parent = dev;
>   
> 


