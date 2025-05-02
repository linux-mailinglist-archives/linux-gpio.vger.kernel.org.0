Return-Path: <linux-gpio+bounces-19542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08BAA6E73
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97BD34A4847
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60DB22FF59;
	Fri,  2 May 2025 09:50:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43C919E82A;
	Fri,  2 May 2025 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179437; cv=none; b=IeKTZqTVcuOQR37xObNTRxDCL93WF4tyq2xrlPVAndBSQsSx9TWSYt5LcXbeSJMoLnGcMklXEGpROXqTcuTKW/Kx+4PJOKoyyZUk/ayo9vtJ2oMvZYAF7g176sKoC12f0ZpZXij+cX7W0RtCsBoTX9Jw45e+VGX3zAZbT2f54lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179437; c=relaxed/simple;
	bh=9hLa0GeXbjLeuJi3uPOxojCfoyiJQ/EkwrIRDRKr1ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiPbDuZfR68VRutoSgi/8NYRZPOTklfdqjwvH/sK5c/az/M6ZAKNfDY2CLFzKxEx81l5TT4FrDrXcbXcy1qAPaMqy4dxasRmbD+SduCJwQKqgoCC1rJ9ijUTODs4ByvzOUvsdm3tUXYpAKE/5jtDt//w8BxjOVLHVeUcyP6xs3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zpm0p2R7Zz9sVS;
	Fri,  2 May 2025 11:32:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcdAzJ89m-7Z; Fri,  2 May 2025 11:32:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zpm0T386Wz9sYQ;
	Fri,  2 May 2025 11:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 670DC8B765;
	Fri,  2 May 2025 11:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wmcughdSQ2WZ; Fri,  2 May 2025 11:32:09 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA1DF8B763;
	Fri,  2 May 2025 11:32:08 +0200 (CEST)
Message-ID: <4d6de524-82b7-41b3-af67-29dcf6f8c0cf@csgroup.eu>
Date: Fri, 2 May 2025 11:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
 <20250502-gpiochip-set-rv-powerpc-v2-2-488e43e325bf@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-2-488e43e325bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/05/2025 à 10:59, Bartosz Golaszewski a écrit :
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> index 4d8fa9ed1a678..6e37dfc6c5c9e 100644
> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> @@ -92,10 +92,11 @@ static void mcu_power_off(void)
>   	mutex_unlock(&mcu->lock);
>   }
>   
> -static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	struct mcu *mcu = gpiochip_get_data(gc);
>   	u8 bit = 1 << (4 + gpio);
> +	int ret;
>   
>   	mutex_lock(&mcu->lock);
>   	if (val)
> @@ -103,14 +104,16 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	else
>   		mcu->reg_ctrl |= bit;
>   
> -	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
> +	ret = i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL,
> +					mcu->reg_ctrl);
>   	mutex_unlock(&mcu->lock);
> +
> +	return ret;
>   }
>   
>   static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
> -	mcu_gpio_set(gc, gpio, val);
> -	return 0;
> +	return mcu_gpio_set(gc, gpio, val);
>   }
>   
>   static int mcu_gpiochip_add(struct mcu *mcu)
> @@ -123,7 +126,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
>   	gc->can_sleep = 1;
>   	gc->ngpio = MCU_NUM_GPIO;
>   	gc->base = -1;
> -	gc->set = mcu_gpio_set;
> +	gc->set_rv = mcu_gpio_set;
>   	gc->direction_output = mcu_gpio_dir_out;
>   	gc->parent = dev;
>   
> 


