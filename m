Return-Path: <linux-gpio+bounces-24221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B9B217F0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 00:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25281A2126E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 22:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2722D4817;
	Mon, 11 Aug 2025 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpx4K9bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C361F5619;
	Mon, 11 Aug 2025 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950143; cv=none; b=H251hQ/919A9FSVjuE9ZoW063fVqeTqAvoKKZ76GV5kBH/Gg19ND7MIL9DX0fVTlc+5LfizOaWsaMLP4G8bkIadzNtz2dqJHcfJ3g4lGpaHVR2O1/QPmF+2mhmrZpc59EuC+uAPPTz5neb6WvJ9gsstQsE1+iWG/oudk9vCZ1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950143; c=relaxed/simple;
	bh=M7cUkVfwO6dwDnPkJ75gnTs0rb6wS07K0cZjufFCAdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEwpFleMg3iWgdN/8JjQqHXqXjsEoBTkxdWD3Znt1+2Ftr9BkR3WmhbKDvRKY4ooWrm1SLIcJOjpy99mAk6oaQMiXXuNLa47HFvTtPDa9nVZDdfn2wUAxrkig+O+a2R+erlZy2AGIsW+fjxkZlINH5Fk7fCcKethrBUbQ2riQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpx4K9bg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4209a0d426so4850190a12.1;
        Mon, 11 Aug 2025 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754950141; x=1755554941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2S9pg8v7o5mRJiQVZf8V1Ym4Pi/3TRmsQa27GUDL3g=;
        b=Wpx4K9bgJ04rCtq1YE3Ltv5s0SGyELu2TeNUqrK1pflfJKd79lg6pNuelcaNy5k2pi
         /9scqSUxoHr3PT0uo2N+qGI/hrqe+tIevMVQMCARN1vXOAWgvrVdEbahmH3TrvdmUPOj
         xXBBFXO8j0jNKJq+p2k03vrsxElQ6RxFBPeQy4SC0Gy1CeDXkose2rpC4vtVtHzG53Vc
         irXShyIhIK+ho2tTUT5E6Zo914VqA4N506+qZI0QCcMqAc5JblmrJ1Ti3WarZ0FPDr+6
         zAjxzq+axEuNPA2W9kSzVamCsYUq4ace4yi+xDraUoJ65/kuqPF/oahbVgp0q7IM+8pP
         9Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950141; x=1755554941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2S9pg8v7o5mRJiQVZf8V1Ym4Pi/3TRmsQa27GUDL3g=;
        b=Y37txZawRUJfNweKxUCMMOIC0dMjg2jnlsdp7TKIljf/XOF/o6Y8gEcOK2ePEj6azL
         hXfFc9eEs/TUwkb5yww4bCkbF60Sf6SjzeCwAgRxNCexFY5rLCKOKRsX23mwRuEQc2IH
         j8kdbu5ZZ0XcXeT258hwQfIpmuV9zdF8bLhnz2eyvKApbhjZFkEnCatEGk3T8hFgc9PN
         g7Q+Vj8alkaPJJ/24C9IoGyQhTh96kFQWqxXVeajg+MEMmrtw6nzENtTn86nLgf/8LUx
         o/QadEa0LG1u6rBigmujdyU9ulOYdtZ2GeEg24Iti9bnGSwto3vrnIZngC//Qh9Jx1Z6
         vnmw==
X-Forwarded-Encrypted: i=1; AJvYcCUdmM1C6/OKbHlKlEePLnhLeyX07mk0QRKs0SogL6cgrfRoWfcUSnHyp010IVxbkWgU+s8R/Y1Itl3OI8sw@vger.kernel.org, AJvYcCW3Wg/GhxFEtbR+XrZya18fiETwxplx15bLxWST92GwzJWVPmx/o/dNWgf9NnFikiV2VBNJtcLEsmvS@vger.kernel.org, AJvYcCWTp0e1G5rnXYvd4iN6WRdPbL6Fy3uheDFk5J+brp2ow/l5zOsvXUKo6CzMN3XtOkKVjgMOERSP@vger.kernel.org
X-Gm-Message-State: AOJu0YxT9filGkl7O5ScZ8h7BTHLvDpKPzp3APLaiM+EzrJ+b39gJoXn
	7QR61ppcuaGg1e55GYIlydsIph++Wsy9rtCWF0pTGBW0sLJcIEiIrHEo
X-Gm-Gg: ASbGncuWz7DYsQ94NqjT/mVV8FyvJXF++/L36Yp4QxtiuorgEwAb77tKc/3EJsfdyLL
	n1EyRKtCKWL5YyaEBC3zcMAYxobow9e44u3jUrQc4fufspten/cFM6TE6qN21AArVjDIyrQwN3U
	Psq4t1WwJkI5QyJZRTlu22DEOW1VcViGISziB3DH1HiFOkCaoTCTkGA9NdZSlXPg/9xZeTdzA1W
	XuJOvxVYMj1C4cI0Gte2VK0aOCe/4hha4/Pkgzt/I+FWWSzFQbYhcrZzrhaVaG0qAh3L66yg2wp
	24cyqeTmh3xKHlyjCdCWT3hQH+YuQNJT7I1xdqgF6tdaqtAm2WMXFDOwVY9+nu7niPithFW0jcR
	dND/wapsJLpAKR/ZI94uAYAc=
X-Google-Smtp-Source: AGHT+IGjkztYScAcNXEfSr8JOnz9DlNlrKELtIRHl6YJzC7lSocRypsK4PSlrP90iF5xHUH1+s+GWA==
X-Received: by 2002:a17:902:e5ce:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-242fc316eb5mr15774605ad.27.1754950141143;
        Mon, 11 Aug 2025 15:09:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd6aacc4fsm26535676b3a.118.2025.08.11.15.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:09:00 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:08:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sumanth Gavini <sumanth.gavini@yahoo.com>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/21] nfc: s3fwrn5: convert to gpio descriptors
Message-ID: <bkvnzaipmkiz7lkh5p35pqmdtlcwnm5j5snyc7g5umfxm3io6j@dqhetenn2zm2>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-19-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-19-arnd@kernel.org>

Hi Arnd,

On Fri, Aug 08, 2025 at 05:18:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is no need for this driver to still use the legacy interfaces,
> so convert all the legacy calls into their modern equivalents.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/nfc/s3fwrn5/i2c.c        | 42 +++++++++-----------------------
>  drivers/nfc/s3fwrn5/phy_common.c | 12 ++++-----
>  drivers/nfc/s3fwrn5/phy_common.h |  4 +--
>  drivers/nfc/s3fwrn5/uart.c       | 30 ++++++-----------------
>  4 files changed, 28 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index 110d086cfe5b..411be709b397 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -8,7 +8,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/i2c.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
> @@ -149,29 +149,22 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
>  static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
>  {
>  	struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
> -	struct device_node *np = client->dev.of_node;
> +	struct device *dev = &client->dev;
>  
> -	if (!np)
> -		return -ENODEV;
> -
> -	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
> -	if (!gpio_is_valid(phy->common.gpio_en)) {
> +	phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
> +	if (IS_ERR(phy->common.gpio_en)) {
>  		/* Support also deprecated property */
> -		phy->common.gpio_en = of_get_named_gpio(np,
> -							"s3fwrn5,en-gpios",
> -							0);
> -		if (!gpio_is_valid(phy->common.gpio_en))
> -			return -ENODEV;
> +		phy->common.gpio_en = devm_gpiod_get(dev, "s3fwrn5,en", GPIOD_OUT_HIGH);
> +		if (IS_ERR(phy->common.gpio_en))
> +			return PTR_ERR(phy->common.gpio_en);
>  	}

Should be GPIOD_OUT_LOW or ASIS.

>  
> -	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
> -	if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
> +	phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
> +	if (IS_ERR(phy->common.gpio_fw_wake)) {
>  		/* Support also deprecated property */
> -		phy->common.gpio_fw_wake = of_get_named_gpio(np,
> -							     "s3fwrn5,fw-gpios",
> -							     0);
> -		if (!gpio_is_valid(phy->common.gpio_fw_wake))
> -			return -ENODEV;
> +		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "s3fwrn5,fw", GPIOD_OUT_LOW);
> +		if (IS_ERR(phy->common.gpio_fw_wake))
> +			return PTR_ERR(phy->common.gpio_en);
>  	}
>  
>  	return 0;
> @@ -197,17 +190,6 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
> -				    GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = devm_gpio_request_one(&phy->i2c_dev->dev,
> -				    phy->common.gpio_fw_wake,
> -				    GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
> -	if (ret < 0)
> -		return ret;
> -
>  	/*
>  	 * S3FWRN5 depends on a clock input ("XI" pin) to function properly.
>  	 * Depending on the hardware configuration this could be an always-on
> diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
> index deb2c039f0fd..e802b4e609c8 100644
> --- a/drivers/nfc/s3fwrn5/phy_common.c
> +++ b/drivers/nfc/s3fwrn5/phy_common.c
> @@ -8,7 +8,7 @@
>   * Bongsu Jeon <bongsu.jeon@samsung.com>
>   */
>  
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  
> @@ -19,7 +19,7 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
>  	struct phy_common *phy = phy_id;
>  
>  	mutex_lock(&phy->mutex);
> -	gpio_set_value(phy->gpio_fw_wake, wake);
> +	gpiod_set_value(phy->gpio_fw_wake, wake);
>  	if (wake)
>  		msleep(S3FWRN5_EN_WAIT_TIME);
>  	mutex_unlock(&phy->mutex);
> @@ -33,14 +33,14 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode)
>  
>  	phy->mode = mode;
>  
> -	gpio_set_value(phy->gpio_en, 1);
> -	gpio_set_value(phy->gpio_fw_wake, 0);
> +	gpiod_set_value(phy->gpio_en, 1);
> +	gpiod_set_value(phy->gpio_fw_wake, 0);
>  	if (mode == S3FWRN5_MODE_FW)
> -		gpio_set_value(phy->gpio_fw_wake, 1);
> +		gpiod_set_value(phy->gpio_fw_wake, 1);
>  
>  	if (mode != S3FWRN5_MODE_COLD) {
>  		msleep(S3FWRN5_EN_WAIT_TIME);
> -		gpio_set_value(phy->gpio_en, 0);
> +		gpiod_set_value(phy->gpio_en, 0);
>  		msleep(S3FWRN5_EN_WAIT_TIME);

The GPIO is describe as "active low" in DTS:

arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi

So here you are leaving the chip disabled. You need to use logical
polarity.

Thanks.

-- 
Dmitry

