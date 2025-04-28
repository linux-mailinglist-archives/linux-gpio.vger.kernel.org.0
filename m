Return-Path: <linux-gpio+bounces-19429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8075A9F603
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 18:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFD23B88B5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 16:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557E927B4E0;
	Mon, 28 Apr 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="i58r+1ud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3327A13A
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858473; cv=none; b=D/0ydoXaKu4GhSeBzBAoUgI/PJuZlawj+PkHQmci9DrMmYHUkySGyRAySGOHhLXr2WYuFJfGTE3l7jrHWn4KaGKZyQ0XAbwe4l9jj1s3T2sWNGBywuahdxcuopYX/X4cj98Bamsc2tpPrcsmkFuhrgXJlSZ7ocPmL2O8dJ8ZazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858473; c=relaxed/simple;
	bh=Bavg8MsEPLj2E1NX0mcGsajlgukspo/8yhnbzoFCAqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U4do6AG/uyPPfAUu9TEvOA6urX7MyTA0xMhpZ+h71kaqplN8NMofnd6AG0X4rQURwjFKUnnVLUjP2CPmp5oI/gJhuYpx0Xw3smJJmuliAObWBN5g5UpsJNstaVuVhahE7o68NWB0XUdhx79hCodEwL3nKCHdmtDorv/du6m4FDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=i58r+1ud; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c9376c4bddso615265385a.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1745858469; x=1746463269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OT9TryD/nAmeIz18EEN2p3SyudDv+zGV2Fd3MOVo4o=;
        b=i58r+1udSkGLuBqLmbErZwLLGn8xsyYCW0x3ElwyXebOVOhISq86SS9ohoMbisHh6i
         2qfeiU1aYJRe66FZDFwbOBODC8lQ6LMF9wYMolHKwxY/i5xTsiiEEo5h9qJpr+waB38O
         wtbTvHh9FVDmf4TRJHooSfYWfrvYEH5cVX0sVCkVPY63hxWMiafj8QZdTDj4Y8RjBIDZ
         qEgmTJuHFz9zWLsiSM/2lpuMngt78wOOi2TCbNW3xuhBm7NhZamdMMRjaLZbrgNzPXwk
         JCgkYEs2BLbZxwq6BhpgjnsxO8sBtr0CUmpy28wqUVDN2WPDbCE+p5G0/z/uDDuOgvcl
         174g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858469; x=1746463269;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OT9TryD/nAmeIz18EEN2p3SyudDv+zGV2Fd3MOVo4o=;
        b=bqKUqbF4KcUUhvbNKh4tzke4itFoA6AuAC5WQj0qWuGeQ7PI/bcEj2u9lFwPJJ8wwG
         6BFvUh773Cz8OfO/uKgDmxYCROxdkpI0lFkkyY4oihytX1eZkjSjQi6QNwoqMJl+pDL3
         E0upYsNBvtYSx7BOP/LWQEGN1VZo+rFsNZhZ9aOhMwVKzEPlaEmVgFEjF4Nof7m9J0gL
         o1wXtd2WuqWCWjwW+AL2FpmFk2I3d4tAgltD306nXheuKLLUR0kiJNuzAGQrjg1azyGD
         7WvssGRuOuMiNFo7JC0snZYwqlc1rwznZ15RkMx2gG4PxNEMCutJikywUqUky/16mhjU
         75Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUqwc+oLHDDcUPnavnSMdCwudfxj+1WU/9RqWBhhT7wmU8kJiYtWGtHw2rNJkI/LEm5QLG4UstfY68e@vger.kernel.org
X-Gm-Message-State: AOJu0YzqItdqxFCdCmWL++MJOpyD1+cYrAx+ELRZh2foAUCV5NosIFca
	reZvY2eck6pvmpCkABqqvIQH1lerb2jdzWtH2Qhbeu3e/oOJtNZ09jJAAnrkbocEpsE5bJfeDJD
	SSA==
X-Gm-Gg: ASbGnctFh5oMiNmDgwHiM+xO2DEx6LY73+i8/r1En4rcpsLe29Y2Zg6ZRWLECK+JSet
	2McBqgtzzsrSavXyeDY9iMIOITnoYtxmb+PEpjPjwGKlmlm/6N0q7htMry77ahGEMz4yZaq6LZz
	KbPdf/dr43NAuZCTVTSFfrAlPTS0Wru3Vw1NzyNgLWvP1UrN/EnW1hY4+t89CYfy0+YGm6uVl9v
	KKeK5wMgUqWkL0Htq5F2u5LeM0zP6lyCpqXhmBp9JYgzcotkmzYChWRq0riJwlMCQUewfBdy5rv
	blDql+LLvnFacabSS3oDh7PkqFDirsI640FB16RqoBVjsDi0+zNtFtpQ6zyIDCxfGg6+uz5GK9w
	EI4wuOXfPoSgUpNu9jW0=
X-Google-Smtp-Source: AGHT+IF7xtHajjSlL0dCDgPAgPiZO+XJ68RgR9ERJHd3YLfVmT6rO+KVBwVHgz5ddl+4fFx0L6L7oA==
X-Received: by 2002:a05:620a:280c:b0:7c7:bb07:af07 with SMTP id af79cd13be357-7cabdd86c94mr64652385a.22.1745858469014;
        Mon, 28 Apr 2025 09:41:09 -0700 (PDT)
Received: from [10.0.62.2] (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fdfbsm640582885a.94.2025.04.28.09.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:41:08 -0700 (PDT)
Message-ID: <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
Date: Mon, 28 Apr 2025 12:41:07 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jerome Neanne <jneanne@baylibre.com>
Cc: m-leonard@ti.com, praneeth@ti.com, jsava@criticallink.com,
 Praneeth Bajjuri <praneeth@ti.com>
References: <20250425203315.71497-1-s-ramamoorthy@ti.com>
 <20250425203315.71497-4-s-ramamoorthy@ti.com>
Content-Language: en-US
In-Reply-To: <20250425203315.71497-4-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/25 4:33 PM, Shree Ramamoorthy wrote:
> Add device-specific structs to select the different PMIC .npgio and .offset
> values. With the chip_data struct values selected based on the match data,
> having a separate GPIO0_OFFSET macro is no longer needed.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/gpio/gpio-tps65219.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index a5a9dfdb214c..c971deac8619 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -13,7 +13,6 @@
>   #include <linux/regmap.h>
>   
>   #define TPS65219_GPIO0_DIR_MASK		BIT(3)
> -#define TPS65219_GPIO0_OFFSET		2
>   #define TPS6521X_GPIO0_IDX			0
>   
>   struct tps65219_gpio {
> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>   	struct tps65219 *tps;
>   };
>   
> +struct tps65219_chip_data {
> +	int ngpio;
> +	int offset;
> +};
> +
>   static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>   {
>   	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
>   	struct device *dev = gpio->tps->dev;
>   	int v, mask, bit;
>   
> -	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
> +	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset - 1) : offset - 1;
(gpio->gpio_chip.offset - 1) is incorrect.  TPS65219_GPIO0_OFFSET used 
to be 2 but now ends up being calculated as 1.  This causes our board to 
power cycle when we try to blink our LED connected to GPIO (Pin 16) - 
"gpio 0".

The whole reason for this strange offset math was that on the TPS65219:
GPO0 -> Register bit 0
GPO1 -> Register bit 1
GPIO -> Register bit 2

However Jerome wanted GPIO to map to linux "GPIO 0".  Is this still the 
case for TPS65215?
>   
>   	mask = BIT(bit);
>   	v = value ? mask : 0;
> @@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chip = {
>   	.get			= tps65219_gpio_get,
>   	.set			= tps65219_gpio_set,
>   	.base			= -1,
> -	.ngpio			= 3,
>   	.can_sleep		= true,
>   };
>   
> +static const struct tps65219_chip_data chip_info_table[] = {
> +	[TPS65215] = {
> +		.ngpio = 2,
> +		.offset = 1,
I cannot validate this.

The linked TRM for the TPS65215 mentions register and field names but 
doesn't provide any register addresses or field offsets. So I cannot 
validate if the GPIO0 math is correct or how it compares to the TPS65219.

Figure 2-2 shows the PMIC has 3 "GPIO" (1 GPIO and 2 GPO) similar to the 
TPS65219 but Shree has stated there is only 2 (1 GPIO and 1 GPO) so a 
little confusing.
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

> +	},
> +	[TPS65219] = {
> +		.ngpio = 3,
> +		.offset = 2,
Offset 2 ends up becoming 1
> +	},
> +};

Note for TI, this needs to be fixed in the SDK11 6.12 release for the 
AM62x as well.

Note: Its unclear to me, why Jerome Neanne and I weren't included in 
this patch set, considering we were the ones who authored and submitted 
this driver.

