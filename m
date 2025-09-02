Return-Path: <linux-gpio+bounces-25403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A7B408AD
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 17:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8362C3A3C71
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78731576D;
	Tue,  2 Sep 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="T5j3VJvJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EAE30DD3C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826097; cv=none; b=AVtOBjZcPYbJ0Fhx/epR0g+jZqmxKKrmZWf+sHzy0rucXGBpTlQ30QomjBohO9IH95LYBJin+ypFj03VhP33xebnEjjM1gpqHxV3zrcOisiKECKHJi+Xw8T4eiknXKkm4NKD9b5cFc1G36h0potAVrkdYntuyKcqqgTfd5djCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826097; c=relaxed/simple;
	bh=k+/O35OLEaFLE720FQq2xXfg7gWF2UlM2xi61rk76LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQUL2+IcoLr5VXSYvgBYFCqTK1+1g9lUEipC8cNsqHdNZGlHkkSQdOvKFvnaLcG2nFqZHvF+hfTXoscVVYWNRe/MsEXFY5AXaiMHkI72Ty3iPBCWCsVNmsrAxZGW+B9HleIrUgPlCJtO0/xytj6f42k7QXxzStjAPl7bY0MaqdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=T5j3VJvJ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-319873b2432so1642216fac.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756826094; x=1757430894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Xgg2pm+dNGmJi2dTat3GmYq1nuu4RhGRKW9DE9wgjY=;
        b=T5j3VJvJIq9vtmRuHplfbLq17cSvaZ8NsM6NXDEyqGZaSYFQoNOrKJT9H+6g2aeWqF
         BDAIJvaqu6Gue/f856kqrhHAVJ8E52RUFuzOb4evK16ovwdgN7PPkcbKj0Z3m7IsjTb/
         QQVCnXvIE0MKckdi7hpz7uWuR4gMcZ7rS2zOVcMNFiERJ5e5QvgDXzPWYIOVNKKBFJVc
         Lb+858XYCrodocSVNPsh68YQwFTaj1xw8S17ru1ObzVrNQGC6W2202jSSeTK1EYdYFQT
         8Zj/lmj+Klitp8db7WBDRs2o6lGVXwyoO3qt526lKM3x6NSC/C371n8N7HGoGVtcLxZ3
         wJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756826094; x=1757430894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Xgg2pm+dNGmJi2dTat3GmYq1nuu4RhGRKW9DE9wgjY=;
        b=YqZpGAX8GaUR5VYRpGy3LLU+iCx/uT+5O2zgSpTjhu5eQOm5wJYPPxHRAGCSt+5EyO
         XIDZARxXKg9yVxjV72da1xkSPULh7fGep+bfL/x4EYMluv+guftpkPqrmYczjEdZjzu+
         KeEh3rHwVTyD6b6JUd8Qo1QAwWarhSaLCNxd5+k9vpgIN8/9/BadVZESSFwPQr/3x9TQ
         f6AWc3kIoOMxhSWgxQdDFoWrimDIdsLrYQLykQk3Bd2DUEJKdQVN6K2LBK+IBzLETO/I
         VsgOiNi6sL/uvPqjkHJotSuj7mSX8niriLW7m41N4j0wlRc8QZztWhQ4Mzxt5KYzYJe/
         cqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwXH4QpUsE7SF1G597l+X4j+Ug3cXhH5dDPsaiE+Vx/pe2P5MwCKiqYz3EjFDcCtfdlDVcDU8bGpAG@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKxJIN3o5ldzbdg8Nay3L/ykGiQMTGxBnLaCYGxDL1l7CUC38
	mtIIte/8QhJyDUjBWjRRMSfk6vVOgZn/QkR+tJJ6yZqKzxcFvl2VWpkZABvjDo5O2NU=
X-Gm-Gg: ASbGnctsqanY3QkgIbmsbEuu9BYywnXJfrbHaO8E5gnX1atHvcXdjE8DUPOjvFQPiXj
	vXAhn4evu4Zee4panQkEJa/TwM5d0vknUdIRU4aUpj4IZBbaUbUn84Gq+S5953bDHp3Z+1MktXg
	J5furgdXCvYM25notJU4w73EmE8POS2u+KiAW4PBCpSf0ZQbjZrTpvjcqw2yKuCQLVriwMfCols
	zChx8Hx+Xk9N3m1T/nBpws38HmWfcKImoC0NcQvBdPdR0b1WAYziJacyMk36oadTbxJCcycU1ld
	88Kw/5Bk0E6IX4+gE94uVepOLYktgfpu7T1GgJTsw859bHvW7MZKn7MWUlO8NBFrJR42FEODDnC
	ouSdlCfCdzf1LszzSPynUgHw5mIzn4e1NP+xvNyqKExhUCaeAN9fmohIBjhFndgWE5iTEHGtIkI
	KnibdbDavKp/HD1IPNsg==
X-Google-Smtp-Source: AGHT+IHu9ad7jn5aRdIYj1LhzznHSg+3gNWD0VD4qNGker/OFvxNVNYSGwKe3LEJOn0WHfiGEGVVDw==
X-Received: by 2002:a05:687c:54:10b0:319:be1e:9dce with SMTP id 586e51a60fabf-319be1edb78mr949993fac.5.1756826094264;
        Tue, 02 Sep 2025 08:14:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:8d95:114e:b6f:bf5b? ([2600:8803:e7e4:1d00:8d95:114e:b6f:bf5b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-319b60b8f38sm532195fac.30.2025.09.02.08.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 08:14:53 -0700 (PDT)
Message-ID: <a6ae372e-e0c9-4874-8be1-8070ee3e880f@baylibre.com>
Date: Tue, 2 Sep 2025 10:14:52 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Esteban Blanc <eblanc@baylibre.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Hans de Goede <hansg@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1756813980.git.mazziesaccount@gmail.com>
 <08929460fe11dd0b749c50a72a634423f13f4104.1756813980.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <08929460fe11dd0b749c50a72a634423f13f4104.1756813980.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/25 7:24 AM, Matti Vaittinen wrote:
> The ROHM BD79112 is an ADC/GPIO with 32 channels. The channel inputs can
> be used as ADC or GPIO. Using the GPIOs as IRQ sources isn't supported.
> 
> The ADC is 12-bit, supporting input voltages up to 5.7V, and separate I/O
> voltage supply. Maximum SPI clock rate is 20 MHz (10 MHz with
> daisy-chain configuration) and maximum sampling rate is 1MSPS.
> 
> The IC does also support CRC but it is not implemented in the driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>  drivers/iio/adc/Kconfig        |  10 +
>  drivers/iio/adc/Makefile       |   1 +
>  drivers/iio/adc/rohm-bd79112.c | 542 +++++++++++++++++++++++++++++++++
>  3 files changed, 553 insertions(+)
>  create mode 100644 drivers/iio/adc/rohm-bd79112.c
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index e3d3826c3357..4b78929bb257 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1309,6 +1309,16 @@ config RN5T618_ADC
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rn5t618-adc.
>  
> +config ROHM_BD79112
> +	tristate "Rohm BD79112 ADC driver"
> +	depends on I2C && GPIOLIB
> +	select REGMAP_I2C

I think you want SPI rather than I2C. :-)

> +	select IIO_ADC_HELPER
> +	help
> +	  Say yes here to build support for the ROHM BD79112 ADC. The
> +	  ROHM BD79112 is a 12-bit, 32-channel, SAR ADC, which analog
> +	  inputs can also be used for GPIO.
> +



> +struct bd79112_data {
> +	struct spi_device *spi;
> +	struct regmap *map;
> +	struct device *dev;
> +	struct gpio_chip gc;
> +	unsigned long gpio_valid_mask;
> +	unsigned int vref_mv;
> +	struct spi_transfer read_xfer[2];
> +	struct spi_transfer write_xfer;
> +	struct spi_message read_msg;
> +	struct spi_message write_msg;
> +	/* 16-bit TX, valid data in high byte */
> +	u8 read_tx[2] __aligned(IIO_DMA_MINALIGN);
> +	/* 8-bit address followed by 8-bit data */
> +	u8 reg_write_tx[2] __aligned(IIO_DMA_MINALIGN);
> +	/* 12-bit of ADC data or 8 bit of reg data */
> +	__be16 read_rx __aligned(IIO_DMA_MINALIGN);

Usually, we only need one __aligned(IIO_DMA_MINALIGN) (on the first
field). Since these are only used for SPI messages and we can only
send one message at a time, there isn't a way for there to be a
problem that would require them to each need to be in their own
cache line.

> +};
> +



> +static int bd79112_probe(struct spi_device *spi)
> +{

...

> +	iio_dev->channels = cs;
> +	iio_dev->num_channels = ret;

This is quite far from where it is assigned. Better to have a dedicated
local variable for this.

> +	iio_dev->info = &bd79112_info;
> +	iio_dev->name = "bd79112";
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +

