Return-Path: <linux-gpio+bounces-30210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19640CFCA3F
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FA473006466
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527472C11E6;
	Wed,  7 Jan 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HO+J/mFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F823139579
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767775215; cv=none; b=mTc7ymCxKn8RRzl8th2o4v1IdQIsN1g3HNXyzahosEQ6r8hv6h497CVWJmMOU1JRAI6RzUnL82uRTjFq2uEKiShsycki2eqjJ3rYM3CiFnCDsSNZ6woZ0U6OhGAcOVwdL8HfoklNScWjSri3aQCwhZ7AG3elWqdQ4UwbFqquCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767775215; c=relaxed/simple;
	bh=/FkOGFo8g1cSpZe2gOZ8w+2bAT1CvYH5znNXRG79Gh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anDO9nOElia7Q202OGVg9lj2SCeJbCM7xig3Hz1YV3roqKEJHLUeXspz/Y54bqzVSD2XAh0wpHRngLU1RotqZs/LjQTwPx1bD9yPNoqy7RZu+xsDeQ7XSGKWGVcpaicmwhGNVAZJRmuXXdaT0j4WPV1IKsY4U9nh3CgPj30EAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HO+J/mFf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so18711795e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767775212; x=1768380012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3vOMipufGcGKuelPXUN9rVs1wLSPnDQy94IgZFqYtmo=;
        b=HO+J/mFfrXiPIMsQvB9dkIfTVwap3XTgLF4M5NhO4vOgXhgdniZARLgLApy2REYFAe
         GPZipzXLlJfWY+8h6pV4W/jKGzZ8YVr+OuLep166ozrRYtk+HV7Lqb3AHBQz94jZlDhr
         6ZVZaabcs1i0rY/HNzkJJXYKqJtjXz8hXLGXCh8NXXI2sko87CJ99xVDv0yPGNf0afDe
         T6z0GfYPeHS2mJG55pCxq0yus7cSJfz4MGCTtUYr3OwYcBvXW5Ybl9CjXVqzbI3i7ntx
         XscV9ZScD6w6aHkwCZNtBq9qJpVqUvaN1k9E8dcfxijzPVEDvJ9QaMTZplk5MrYjSf4x
         UkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767775212; x=1768380012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vOMipufGcGKuelPXUN9rVs1wLSPnDQy94IgZFqYtmo=;
        b=ovNu/Lfwzj/WRut0gsEHC3gzC7SKh41QPdmnenswt5ag8EGuTv3lBujt4W+meI4Tpj
         7WZzttW2e4+cPbNCWpfQKHoAAbyMV2caWsc95WQMKUozgLaiNr8Ktobo4WXhNQVsEu8J
         bQHsy2BAagvqjjDD/DiUkaCH/+ZzM9MjdZ6tCJJmo5T7m4f4QBWsuKtSsIfOmnzdSjR+
         yAEd2YFWJHfU3Ao2xbQft2ZfdjCEMAtG28ynNJBo6uWj/fp3UzRD9dm+eIFw1pZ2vakr
         2cHr8TB2wm4Q5DC8N2e3qT4Q1kqxnCKTBfylOZoSTec1peIj+eqfHYvSApvMMoWVJu5r
         sztw==
X-Forwarded-Encrypted: i=1; AJvYcCVjBOB4qcuL3ycAWtJC54OiogujSgIR3+n5nuUA2YRD8IqHxdp7BQc7sZdRO05o29LhHuQs42SkaRtJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOy1tZSrNTjHdJl3o730QlZkbdpqR+gi46kPszy44K/IV1Ahe
	R4xpC7riv2824DYS87LsIE5J4dtuq2dd6ITFwJzGATdwH5/AR+IOTfsAywZUP09/jYM=
X-Gm-Gg: AY/fxX7iaeuuz+193+K77P7WvLldz+KREF3akx99CNjW3KLenPwcS/CoyhUXy2TSq0L
	JrJ5E+XamXTuaDak1Q5izTh6teyUv8qLFfWbs43cFdYYK0vCB+AL/xMUBrq/a47iMof6wd26gdh
	imtVIwIPAZgApRZ3CX0lHFWV5+tHbl2n8jpYZbcEUV6xX7lRJJVnZzMMC65X9BbDBPea9CfK/hQ
	J6wYDZvL6nb81ViChQlSfM//6jm6ws10taFCRUwtloQmIqnwTuiHsL2PNO92ToqYJWOPPfERkqb
	3qm8SvyzkuFO9Kz9u6fp0otkOLlt1CdpTgADmqRG94Zj9/qC+oEzhVaIr5QkN4HyrUhYxMVZ5aO
	wbWOPOnAfOR5k6GqjqkXzpEuAoKABpM53FB0t4Rq+RGc019ss2JA6pnIopFNYa9JU62wmH36Mx+
	22mMKz3LRpELVAqxmq
X-Google-Smtp-Source: AGHT+IEr9Jee3oNgh/rPm8U67PCjrXwoDwrkibED2q6zVqo4sAFR090MQLpBiX5V1OXNPJAxbWMVxQ==
X-Received: by 2002:a05:600c:19cd:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-47d84b09166mr15022315e9.2.1767775211605;
        Wed, 07 Jan 2026 00:40:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636e588sm8712765e9.0.2026.01.07.00.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:40:11 -0800 (PST)
Date: Wed, 7 Jan 2026 11:40:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v7 2/2] gpio: add gpio-line-mux driver
Message-ID: <aV4b6GAGz1zyf8Xy@stanley.mountain>
References: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
 <20251227180134.1262138-3-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227180134.1262138-3-jelonek.jonas@gmail.com>

On Sat, Dec 27, 2025 at 06:01:34PM +0000, Jonas Jelonek wrote:
> +struct gpio_lmux {
> +	struct gpio_chip gc;
> +	struct mux_control *mux;
> +	struct gpio_desc *muxed_gpio;
> +
> +	u32 num_gpio_mux_states;
> +	unsigned int gpio_mux_states[] __counted_by(num_gpio_mux_states);
> +};
> +
> +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_lmux *glm = gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset > gc->ngpio)

This is off by one.  Should be >=.

regards,
dan carpenter

> +		return -EINVAL;
> +
> +	ret = mux_control_select_delay(glm->mux, glm->gpio_mux_states[offset],
> +				       MUX_SELECT_DELAY_US);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gpiod_get_raw_value_cansleep(glm->muxed_gpio);
> +	mux_control_deselect(glm->mux);
> +	return ret;
> +}


