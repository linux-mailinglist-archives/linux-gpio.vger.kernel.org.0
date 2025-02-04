Return-Path: <linux-gpio+bounces-15305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A8A269D0
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 02:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961CC1880314
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 01:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BC386323;
	Tue,  4 Feb 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="zhh1q7JA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A6156C71
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738632513; cv=none; b=ePgvPw7R4cjE6xBGP6BZYLzQ1MoJ2U4furXSS/PEkm8hTgdDIaRBi38fcM5A62M91fBEXDseZNRxpD7+JX8iLuldT5qgzfCXT6lHIvOdIV7FZdzi7wlt/Mc2nys7voThObJ1daNiGdHSioQg2zcOLgOEnMEs8chQza5sj7zLLYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738632513; c=relaxed/simple;
	bh=o/048RK8KbfvFNL35mW1RqTvxs6dxfeNWBz91bdQgTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ng2lG4AVl/uwhMMK4gmaZhjXbnWlhdRMx/bdD43KqRpaf5QVXReFR4jKzTypw06l+bHNRXKrJctCaC9RXBEp5R7gNwJfamwoPi4/FmvcNJu4+ew7HmLX5AbIaqginIJMtOpSK1Bn2nXzoVRXw2Z+BcKzuOWq0XWDFJE4Y3mqQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=zhh1q7JA; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id f2cbtrgC5zZPaf7jktdngS; Tue, 04 Feb 2025 01:28:24 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id f7jjthSFn1kimf7jjtes7F; Tue, 04 Feb 2025 01:28:23 +0000
X-Authority-Analysis: v=2.4 cv=B/i/0vtM c=1 sm=1 tr=0 ts=67a16d37
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=3GLQtCDrk5mhnYkuwPoHkA==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7T7KSl7uo7wA:10 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=4kty7C-LuapIIgrfkgcA:9 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1bcZbq5etASTQ/kWDMfEYbte/eHZMRZ/ExU1etRZnzk=; b=zhh1q7JAv+tsaL5IvlC2FnHs7K
	kKDgPR9JleRzhjGUg4Io4kM5UQwvl0yLZJPOqbfV0lJhGO8aIRNGJhYiXpHln6mxjAxq7Jx2nrS1A
	m2KobqSFEOybht5GqDgQw6/hDBAsQnroSXdXYouwYMZbhe0g6xhAB5LCx76l8gWtEMFZ/KnCrDsFG
	jxvrTPJ5mVoMzzyFF+pFyXHj/8jCauBVeAzrwYcGuF4A5FEopMVrnvHuokgpCqTG6ywloG7lHmfoW
	XDRgtEURECDMzCQH8S6WtYpetBNLvpd9JtDBXBtW7SUlfzOU/jGfXvVW/f8rb81MlV9cvieKeNxEY
	Xn6gbT2g==;
Received: from [45.124.203.141] (port=55286 helo=[192.168.0.157])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1tf7jh-0027Ze-25;
	Mon, 03 Feb 2025 19:28:22 -0600
Message-ID: <82b97884-19a3-4948-8212-d0fd38669ee2@embeddedor.com>
Date: Tue, 4 Feb 2025 11:58:02 +1030
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] gpio: 74x164: Annotate buffer with __counted_by()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
 <20250203121843.3183991-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250203121843.3183991-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.141
X-Source-L: No
X-Exim-ID: 1tf7jh-0027Ze-25
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.157]) [45.124.203.141]:55286
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMWavBfdZ010b2+S7MHfamF40N0AN0iL8G/4Dfm770wI0AeFa1H2P6Poh5snoYzlaKMWBuCCvfMrE9IKNOEHWRx+PWr+NNJPGO6M6H1NwGBmcVtx+paU
 iqdzcMiBDrA6dYve52s4ptd9iYSoRmVc8dKqGs8eZoOqZ3AsvTkqwTQTMt0xX+Ks1XfrgSYzEiUB1m3UorzLe9fqCfgajwr5DzR9P52UWxT01w3pm3grym/J



On 03/02/25 22:47, Andy Shevchenko wrote:
> Add the __counted_by() compiler attribute to the flexible array member
> volumes to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE.
> 
> Use struct_size() instead of manually calculating the number of bytes to
> allocate the private structure with a buffer.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/gpio/gpio-74x164.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
> index 70c662bbca7b..7844f8a58834 100644
> --- a/drivers/gpio/gpio-74x164.c
> +++ b/drivers/gpio/gpio-74x164.c
> @@ -30,7 +30,7 @@ struct gen_74x164_chip {
>   	 * register at the end of the transfer. So, to have a logical
>   	 * numbering, store the bytes in reverse order.
>   	 */
> -	u8			buffer[];
> +	u8			buffer[] __counted_by(registers);
>   };
>   
>   static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
> @@ -97,6 +97,7 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
>   
>   static int gen_74x164_probe(struct spi_device *spi)
>   {
> +	struct device *dev = &spi->dev;
>   	struct gen_74x164_chip *chip;
>   	u32 nregs;
>   	int ret;
> @@ -116,10 +117,12 @@ static int gen_74x164_probe(struct spi_device *spi)
>   		return -EINVAL;
>   	}
>   
> -	chip = devm_kzalloc(&spi->dev, sizeof(*chip) + nregs, GFP_KERNEL);
> +	chip = devm_kzalloc(dev, struct_size(chip, buffer, nregs), GFP_KERNEL);
>   	if (!chip)
>   		return -ENOMEM;
>   
> +	chip->registers = nregs;
> +
>   	chip->gpiod_oe = devm_gpiod_get_optional(&spi->dev, "enable",
>   						 GPIOD_OUT_LOW);
>   	if (IS_ERR(chip->gpiod_oe))
> @@ -133,10 +136,7 @@ static int gen_74x164_probe(struct spi_device *spi)
>   	chip->gpio_chip.set = gen_74x164_set_value;
>   	chip->gpio_chip.set_multiple = gen_74x164_set_multiple;
>   	chip->gpio_chip.base = -1;
> -
> -	chip->registers = nregs;
>   	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
> -
>   	chip->gpio_chip.can_sleep = true;
>   	chip->gpio_chip.parent = &spi->dev;
>   	chip->gpio_chip.owner = THIS_MODULE;


