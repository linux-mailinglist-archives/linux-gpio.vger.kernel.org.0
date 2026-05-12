Return-Path: <linux-gpio+bounces-36678-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABQZHvVBA2pT2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36678-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:06:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB552346E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2C234E5388
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 14:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6123BFACC;
	Tue, 12 May 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RU0ua3zO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4E3B5F5D;
	Tue, 12 May 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596678; cv=none; b=IQDRlJ169nyw1PsDmZQ1M7vrvyHw0TbRIzKOWYVoG7otx1mjCYFhgA4Abw3cDrcQUOE+1ddTuumlFbq5XIKozP+VcJ0CZifNsIXG60PuWdg929u6TixZ11VgbATfJpe7iq4c9hhxneHy8/16QsNKhcmQfsb+sQkn0ZaO7e23D/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596678; c=relaxed/simple;
	bh=80j3GK9Ky80LtSOqwjpJhxCkLUAXDfbcjbp8T8hGbwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=greLscAqMeZ6/nm2qf9eak6jrsGHFsr7CjIM46Bgl0huOnCBzYW2C1Md8KQnDaOUu3ph+VwsuyZcqI99QxO4ARwjFp2qR57NAO3tlYRBJ4dXZK2QmxTzBMtldXqdZBnoTb9iPJplu/48E/PmF0FCCiAx+b+qTAfjtIjKFmD2tOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RU0ua3zO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C47C2BCF6;
	Tue, 12 May 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596678;
	bh=80j3GK9Ky80LtSOqwjpJhxCkLUAXDfbcjbp8T8hGbwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RU0ua3zOPzd4L/YCZwE2kd9BD+QWdEVWpNMLhEtTCRBDVlYFWdwunBaUp+nYfgr9P
	 kintRagou4DCi8iB/GcbwFgRCX5moMgdTV2LpB/qW/1GkoycwRfl7tv+xpmyMcqXrG
	 f7A4aQDA27yilq67keceHfKxBIQdeeAkw5ZVGRo3kz8n1LTdn1yDS5i1ZdTfo0IzPK
	 NlfCZdHNghOWZX2pWd5bOHZMyKmpFm16ZoZgw+ldxI7gQnRme/Eiwte1QiYljHauoz
	 Nald8RK22uuthwLyq249SyrkH31H27N4eowH83oyDoxFnPwu6PDi4MQcro617OGbDJ
	 Wm7jGgN4LQS8Q==
Date: Tue, 12 May 2026 15:37:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
 <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>, <mwalle@kernel.org>,
 <lars@metafoo.de>, <Michael.Hennerich@analog.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <dlechner@baylibre.com>, <tychang@realtek.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
 <james.tai@realtek.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <20260512153745.3ec68675@jic23-huawei>
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
	<20260512033317.1602537-4-eleanor.lin@realtek.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 05EB552346E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36678-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,realtek.com:email]
X-Rspamd-Action: no action

On Tue, 12 May 2026 11:33:13 +0800
Yu-Chun Lin <eleanor.lin@realtek.com> wrote:

> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
> 
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
> 
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.

What is the reasoning behind setting *mask = 0 for unsupported operations?
If it is a special value why not just return an error code to indicate
not supported?  This seems to come from the assumption that you will want
to | that with masks for another operation.

I'm coming into this late but to me there look to be a bunch of undocumented
assumptions. Why do the operations have to share a register for example?

Perhaps an interface where you provide a single operation for write_enable
and whatever else and hence t here is only one 'reg' would work better?


> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index deb9eebb58de..c76eef20e412 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -38,9 +38,10 @@ struct gpio_regmap {
>  	struct regmap_irq_chip_data *irq_chip_data;
>  #endif
>  
> -	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> -			      unsigned int offset, unsigned int *reg,
> -			      unsigned int *mask);
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
> +			      enum gpio_regmap_operation op,
> +			      unsigned int base, unsigned int offset,
> +			      unsigned int *reg, unsigned int *mask);
>  
>  	void *driver_data;
>  };
> @@ -54,6 +55,7 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
>  }
>  
>  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
> +				    enum gpio_regmap_operation op,
>  				    unsigned int base, unsigned int offset,
>  				    unsigned int *reg, unsigned int *mask)
>  {
> @@ -61,7 +63,16 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>  	unsigned int stride = offset / gpio->ngpio_per_reg;
>  
>  	*reg = base + stride * gpio->reg_stride;
> -	*mask = BIT(line);
> +
> +	switch (op) {
> +	case GPIO_REGMAP_SET_WREN_OP:
> +	case GPIO_REGMAP_SET_DIR_WREN_OP:
> +		*mask = 0;
> +		break;
> +	default:
> +		*mask = BIT(line);
> +		break;
> +	}
>  
>  	return 0;
>  }
> @@ -69,7 +80,7 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>  static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, val, reg, mask;
> +	unsigned int base, val, reg, mask, dir_mask;
>  	int ret;
>  
>  	/* we might not have an output register if we are input only */
> @@ -78,10 +89,24 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
>  	else
>  		base = gpio_regmap_addr(gpio->reg_set_base);
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &dir_mask);
>  	if (ret)
>  		return ret;
>  
> +	ret = regmap_read(gpio->regmap, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & dir_mask) {
> +		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_OUT, base, offset, &reg, &mask);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_IN, base, offset, &reg, &mask);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* ensure we don't spoil any register cache with pin input values */
>  	if (gpio->reg_dat_base == gpio->reg_set_base)
>  		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
> @@ -98,10 +123,14 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
>  	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
> -	unsigned int reg, mask, mask_val;
> +	unsigned int reg, mask, mask_val, wren_mask;
>  	int ret;
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
>  	if (ret)
>  		return ret;
>  
> @@ -112,9 +141,9 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>  
>  	/* ignore input values which shadow the old output value */
>  	if (gpio->reg_dat_base == gpio->reg_set_base)
> -		ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> +		ret = regmap_write_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
>  	else
> -		ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
> +		ret = regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
>  
>  	return ret;
>  }
> @@ -123,7 +152,7 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
>  				      unsigned int offset, int val)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, reg, mask;
> +	unsigned int base, reg, mask, wren_mask;
>  	int ret;
>  
>  	if (val)
> @@ -131,11 +160,15 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
>  	else
>  		base = gpio_regmap_addr(gpio->reg_clr_base);
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
>  	if (ret)
>  		return ret;
>  
> -	return regmap_write(gpio->regmap, reg, mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WITH_CLEAR_OP, base, offset, &reg, &mask);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(gpio->regmap, reg, mask | wren_mask);
>  }
>  
>  static int gpio_regmap_get_direction(struct gpio_chip *chip,
> @@ -167,7 +200,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
>  		return -ENOTSUPP;
>  	}
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_DIR_OP, base, offset, &reg, &mask);
>  	if (ret)
>  		return ret;
>  
> @@ -185,7 +218,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  				     unsigned int offset, bool output)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, val, reg, mask;
> +	unsigned int base, val, reg, mask, wren_mask;
>  	int invert, ret;
>  
>  	if (gpio->reg_dir_out_base) {
> @@ -198,7 +231,12 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  		return -ENOTSUPP;
>  	}
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base, offset, &reg, &mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset, &reg,
> +				   &wren_mask);

What constrains these two to provide the same value back for reg?
To me it seems like the write enable might well be in a different register.

>  	if (ret)
>  		return ret;
>  
> @@ -207,7 +245,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  	else
>  		val = output ? mask : 0;
>  
> -	return regmap_update_bits(gpio->regmap, reg, mask, val);
> +	return regmap_update_bits(gpio->regmap, reg, mask | wren_mask, val | wren_mask);
>  }
>  
>  static int gpio_regmap_direction_input(struct gpio_chip *chip,

