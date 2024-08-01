Return-Path: <linux-gpio+bounces-8525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9299944F1F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 17:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8B31F27A87
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 15:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFE61B011B;
	Thu,  1 Aug 2024 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noprivs.com header.i=@noprivs.com header.b="oo+7IL0/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-108-mta253.mxroute.com (mail-108-mta253.mxroute.com [136.175.108.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C44132139
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525820; cv=none; b=UzSxxI3/KfXGOtpL9uSmSkMKfjGllBRkltmu+D17gqe1GjXpQE1AOidopSF93OGEVgUNNDBIkhvyDTi055GXW2dm7t8Cu+Yh0lKjYmTjI1ipEoDjxkctDbnzsFWgN0PHspnjtdsgec9dvk8zmKyF9au9xbQJqSs46fF3H3hnnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525820; c=relaxed/simple;
	bh=UiAZyNNwH+6w8OwcTr9IjVkvsdiXq0k2vVfJG25b2sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o26Zcx9bHvrochJ6Z5S87z1elUvqvgbboTa9WlSsXa/xa/ea5jk7Z4AvmV2BqnCj2oG277xoz9esqG5R9q3+ukJzx/8oBgP4lHZLt36xgjInuaMLBS8F9xrdD7BPb6V3P/thwDm+RU24uRU5LZj2qeoTy8TK81JvCxz5m9BVHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noprivs.com; spf=pass smtp.mailfrom=noprivs.com; dkim=pass (2048-bit key) header.d=noprivs.com header.i=@noprivs.com header.b=oo+7IL0/; arc=none smtp.client-ip=136.175.108.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noprivs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noprivs.com
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta253.mxroute.com (ZoneMTA) with ESMTPSA id 1910e855d4a00017a3.004
 for <linux-gpio@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Aug 2024 15:18:26 +0000
X-Zone-Loop: 2222451867b9373e8f8526413c5331cbfd63ddecca72
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=noprivs.com
	; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RBL5xfHn/yCv2oQB5tSj0V3J2d/Dye4Rv9aECud2mcE=; b=oo+7IL0/DkY7PZ1KwR3v7hIgVe
	AEw+1avDuOhp1zXd3bbndL/s+Xzxhl1PuqniyA1cpNpgrxbDdeaLDQgD+rO4O0fx5vW64KDYKNZWl
	65PSFSBLTu1urclG3Ixl9abeOhKt2BcrXcdIS2KE5RkgPUWFCdJKQAddBzrA4TcVf3XT5gvwYtJ1f
	BDkPJOnDqbLrUsWVeMdZxe0UzzGTBgSmjo4FQx3U7ba4e+XcKj4+eDl9iX/toz/XRAdwuX+w/GTIe
	KtppOP8iPtPXsWkxT/0lnDz8Ff9H7b8ntIeF+m8uLYbq/akr9LFgXmNsTutYGKnk5xNDxSun1sTQI
	5a/MpoOw==;
Message-ID: <41cf5ac9-a6bf-48b6-b0e3-c4737641b104@noprivs.com>
Date: Thu, 1 Aug 2024 10:18:23 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: exar set value handling for hw with gpio pull-up or
 pull-down
To: Sai Kumar Cholleti <skmr537@gmail.com>, bgolaszewski@baylibre.com,
 andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org
References: <20240730134610.80986-1-skmr537@gmail.com>
Content-Language: en-US
From: Matthew McClain <mmcclain@noprivs.com>
In-Reply-To: <20240730134610.80986-1-skmr537@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: catch@noprivs.com

Hi all,

I worked with Sai on this.

We discovered this problem when we upgraded our kernel from 5.10 to 6.1.
The behavior changed with the switch to regmap in 5.11.

commit 36fb7218e87833b17e3042e77f3b102c75129e8f
Author: Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon Sep 28 17:00:26 2020 +0200

     gpio: exar: switch to using regmap

     We can simplify the code in gpio-exar by using regmap. This allows
     us to drop the mutex (regmap provides its own locking) and we can
     also reuse regmap's bit operations instead of implementing our own
     update function.

     Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
     Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


We noticed because we had some gpios tied to reset pins and when
we set direction to high, value went to 0, and put devices in reset.

Thanks,
Matthew


On 7/30/24 08:46, Sai Kumar Cholleti wrote:
> Setting gpio direction = high, sometimes results in gpio value = 0.
>
> If a gpio is pulled high, the following construction results in the
> value being 0 when the desired value is 1:
>
> $ echo "high" > /sys/class/gpio/gpio336/direction
> $ cat /sys/class/gpio/gpio336/value
> 0
>
> Before the gpio direction is changed from input to output,
> exar_set_value is set to 1, but since direction is input when
> exar_set_value is called, _regmap_update_bits reads a 1 due to an
> external pull-up.  When force_write is not set (regmap_set_bits has
> force_write = false), the value is not written.  When the direction is
> then changed, the gpio becomes an output with the value of 0 (the
> hardware default).
>
> regmap_write_bits sets force_write = true, so the value is always
> written by exar_set_value and an external pull-up doesn't affect the
> outcome of setting direction = high.
>
>
> The same can happen when a gpio is pulled low, but the scenario is a
> little more complicated.
>
> $ echo high > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1
>
> $ echo in > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 0
>
> $ echo low > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1
>
> Signed-off-by: Sai Kumar Cholleti <skmr537@gmail.com>
> ---
>   drivers/gpio/gpio-exar.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index 482f678c893e..de5ce73159cb 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -99,11 +99,13 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
>   	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>   	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
>   	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> +	unsigned int bit_value = value ? BIT(bit) : 0;
>   
> -	if (value)
> -		regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
> -	else
> -		regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
> +	/*
> +	 * regmap_write_bits forces value to be written when an external
> +	 * pull up/down might otherwise indicate value was already set
> +	 */
> +	regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
>   }
>   
>   static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,


