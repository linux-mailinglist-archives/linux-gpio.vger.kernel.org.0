Return-Path: <linux-gpio+bounces-31991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIt5N7XsmWmcXQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:34:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6516D647
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FDEA3053BEE
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F62931690A;
	Sat, 21 Feb 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LM1nNJse"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372B2C21F4
	for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771695278; cv=none; b=XIMsKAdoFlgDqYqcXuV/0hrJAQX+pe8LkbjqP9cM4BJEQHpSYO63t63Ac9KxCnyEY47otI/03I3rsaGOUFpmM8EJbWw7xUhLtLK5HnTZ0GWArqvO+OHzAG90pJGZsYzGJ4Lu2wYtSzFNGOl28c2Hd9/lAo6tNA5jXIxiz8QSb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771695278; c=relaxed/simple;
	bh=8DFbuxXlD6z0qNEdWTHytsSIfG8aOT+FPC40zi222as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxuISlD+BWbVFC/E+HyB+Fu0Gn2W9Ri8Y+gtgEj1EzacqK9JbToLx+FuPUKUZcmod9astxrHVAVYKepByarzT2MlS/f4EJPsYRe0Wnouofp8Z3v4djP0cBQ+OB8PwliLAWDo6V5TCMAjDvtt5DkWg8X7S9CUz/k5v9J/Gv131aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LM1nNJse; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c1d2123dso2957006a34.2
        for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771695275; x=1772300075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NKhKWGEDkDoAduIGils44kzoIDiw/7usM5aB+9rdUI=;
        b=LM1nNJseZvBpfR0w6MCnp8n2+IeVp4kL0P4GVbKmAf56qVJAeZg3zpFAxuyzF/48s3
         uZ19UJhN8Q1lrqajfqJwve7wTPmEF7TDccyBZ4rCsiOO1YPJWkTGqrhoGjjV+12TntoG
         p2pJc5DfMxdArI1Wz+wBQz1MFAPyV0hIk5cbahsGzQQtxDGhaX1nB+YR3R55qs2ok2gB
         4x0aGuYz9UcJee7ODt2gYZjBQibo2WvCHfr4uN/rfjXJExA/uv/EpwGzDJU7VTEkg3ZU
         s69Bky121fhzgsJgoyg0w63Vd60ANeMiME5rFASuMgbPFEeUvBOO6vYCxbueirhWmQaZ
         rTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771695275; x=1772300075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NKhKWGEDkDoAduIGils44kzoIDiw/7usM5aB+9rdUI=;
        b=qq/7xZ5BYD99+E7pvuD6MAHeHx7049yVywye8CSo6beqKTqZWCBRY5S7o/HzQqH41d
         2dQA4gpmTQSFHw/sFVcpfma3pF7sfgxEx8lvRVY370YgNK+ywyoARMUMP+V1/eYGsLEa
         EMka9kbhLUVi0W5KCf4qvsFEPhe2FuzvM7eJp0YX/3HrxlmO4cJhwTyfesb4qTIQbOEw
         32zUuF74zPFMJt3Uvhg1qOc4qinGx+fCgYomXDRWPavqqCwk0Bmdc/6Nn03zAOqm4Tm/
         nM8buSOWKGYQaWxcgONPfHrP7PBePhgkaqXYZe1q3b0XT8ZRd4RE90dJ+cBWijpOWw5G
         8Rqg==
X-Forwarded-Encrypted: i=1; AJvYcCUV47GjWiazfv9ScyrpTVu92hPc2ICi5MBhB86ZNeeEfo0SLcFqC39EikRte6btIGhT84DAM8+hggux@vger.kernel.org
X-Gm-Message-State: AOJu0YywiukrHlW7HPF8LtW6LI1cGBiOEQwkre3PdsZl5uE7OXUMw+76
	r85E6YsD45C9O0hJXL4eHNC8Gk3bkhQIkfSweMLAeiDyDUfB8YAh/UwiKmWmR/Fl8AF+V0Y9LDJ
	mxpdQ
X-Gm-Gg: AZuq6aI/joxP2nTmkVX8JG+v03syQmGiVoLn+BKMPYIKB+mm5HLMEDbWHzHr3kp5EVa
	1jZnK1Pu3m+5/47Cn3t1P/5t2DvgHRA7Cgd6VNlcmNktD9EiQSVcUJ0ZHimteZTi2Cs8Dncpm+P
	QIVLxG1v2VE1TSy/ZamTyDds43zvRKhf9wcRoX+QMnMp1AozMaKEUeXFcdgEsAdUAXwfJYDoblb
	N90TVMcxp7krz24iAK7Qj192adfxTSWfvEWIA7l17jSBc6sGnHIiXKr/ZAeoxOYkTadjoY/V5SF
	g+YBQCO7iOhQbXf/QJQo88Sm8yz6BGbKNF7nUA2t6FN2F07dH3eCa2fN1FMJ4y3KY8i+OLdFbFo
	jHVnZwgg3hzz0Knpg6ZT9Ua845QkXJ7CdKm3gsPwoPcQLeEu1YzUNMx9+NdDYHxIMarX2yg7PSq
	amGBBPNku72Y2+OM3qmC+M1FWYQDttqtRcTuuH1+acyTANRqiNExocWWdv/nE0AkQJgZ1Amg==
X-Received: by 2002:a05:6830:40c4:b0:7cf:d2f3:af8a with SMTP id 46e09a7af769-7d52bf5283amr3020274a34.28.1771695274820;
        Sat, 21 Feb 2026 09:34:34 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf7c4d5sm2827794a34.4.2026.02.21.09.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 09:34:34 -0800 (PST)
Message-ID: <0b9e1c9d-9bee-4fc3-ac19-28d969f65ef2@baylibre.com>
Date: Sat, 21 Feb 2026 11:34:33 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-31991-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:mid]
X-Rspamd-Queue-Id: 91E6516D647
X-Rspamd-Action: no action

On 2/18/26 8:29 PM, Dmitry Torokhov wrote:
> guard() notation allows early returns when encountering errors, making
> control flow more obvious. Use it.
> 
> Also variables that now only hold error codes (or 0) are renamed to
> "error" to make their purpose clearer.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 105 ++++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index 2a7d4a1d9fa9..d31397f37ec4 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -306,18 +306,17 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
>  	struct iio_poll_func *pf = p;
>  	struct iio_dev *indio_dev = pf->indio_dev;
>  	struct ti_ads7950_state *st = iio_priv(indio_dev);
> -	int ret;
> +	int error;
>  
> -	mutex_lock(&st->slock);
> -	ret = spi_sync(st->spi, &st->ring_msg);
> -	if (ret < 0)
> -		goto out;
> +	scoped_guard(mutex, &st->slock) {
> +		error = spi_sync(st->spi, &st->ring_msg);
> +		if (error)
> +			break;

I'm not a fan of scoped_guard() because of the hidden for loop in it.
It hides the fact that the break; is breaking out of that for loop.

It would be more clear/obvious written as:

	do {
		guard(mutex)(&st->slock);

		ret = spi_sync(st->spi, &st->ring_msg);
		if (ret)
			break;

		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
						   iio_get_time_ns(indio_dev));
	} while (0);

>  
> -	iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
> -					   iio_get_time_ns(indio_dev));
> +		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
> +						   iio_get_time_ns(indio_dev));
> +	}
>  
> -out:
> -	mutex_unlock(&st->slock);
>  	iio_trigger_notify_done(indio_dev->trig);
>  
>  	return IRQ_HANDLED;
> @@ -326,22 +325,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
>  static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
>  {
>  	struct ti_ads7950_state *st = iio_priv(indio_dev);
> -	int ret, cmd;
> +	int error;
> +	int cmd;
> +
> +	guard(mutex)(&st->slock);
>  
> -	mutex_lock(&st->slock);
>  	cmd = TI_ADS7950_MAN_CMD(TI_ADS7950_CR_CHAN(ch));
>  	st->single_tx = cmd;
>  
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -	if (ret)
> -		goto out;
> -
> -	ret = st->single_rx;
> -
> -out:
> -	mutex_unlock(&st->slock);
> +	error = spi_sync(st->spi, &st->scan_single_msg);
> +	if (error)
> +		return error;
>  
> -	return ret;
> +	return st->single_rx;
>  }
>  
>  static int ti_ads7950_get_range(struct ti_ads7950_state *st)
> @@ -407,9 +403,9 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
>  			  int value)
>  {
>  	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> -	int ret;
> +	int error;
>  
> -	mutex_lock(&st->slock);
> +	guard(mutex)(&st->slock);
>  
>  	if (value)
>  		st->cmd_settings_bitmask |= BIT(offset);
> @@ -417,47 +413,44 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
>  		st->cmd_settings_bitmask &= ~BIT(offset);
>  
>  	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -
> -	mutex_unlock(&st->slock);
> +	error = spi_sync(st->spi, &st->scan_single_msg);
> +	if (error)
> +		return error;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> -	int ret = 0;
>  	bool state;
> +	int error;
>  
> -	mutex_lock(&st->slock);
> +	guard(mutex)(&st->slock);
>  
>  	/* If set as output, return the output */
>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
>  		state = st->cmd_settings_bitmask & BIT(offset);
> -		goto out;
> +		return state;

This can return directly instead of using local variable.

>  	}
>  
>  	/* GPIO data bit sets SDO bits 12-15 to GPIO input */
>  	st->cmd_settings_bitmask |= TI_ADS7950_CR_GPIO_DATA;
>  	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -	if (ret)
> -		goto out;
> +	error = spi_sync(st->spi, &st->scan_single_msg);
> +	if (error)
> +		return error;
>  
>  	state = (st->single_rx >> 12) & BIT(offset);
>  
>  	/* Revert back to original settings */
>  	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
>  	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -	if (ret)
> -		goto out;
> -
> -out:
> -	mutex_unlock(&st->slock);
> +	error = spi_sync(st->spi, &st->scan_single_msg);
> +	if (error)
> +		return error;
>  
> -	return ret ?: state;
> +	return state;
>  }
>  
>  static int ti_ads7950_get_direction(struct gpio_chip *chip,
> @@ -473,9 +466,9 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
>  				     int input)
>  {
>  	struct ti_ads7950_state *st = gpiochip_get_data(chip);
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&st->slock);
> +	guard(mutex)(&st->slock);
>  
>  	/* Only change direction if needed */
>  	if (input && (st->gpio_cmd_settings_bitmask & BIT(offset)))
> @@ -483,15 +476,14 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
>  	else if (!input && !(st->gpio_cmd_settings_bitmask & BIT(offset)))
>  		st->gpio_cmd_settings_bitmask |= BIT(offset);
>  	else
> -		goto out;
> +		return 0;
>  
>  	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> +	error = spi_sync(st->spi, &st->scan_single_msg);

Can just return directly here now.

> +	if (error)
> +		return error;
>  
> -out:
> -	mutex_unlock(&st->slock);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int ti_ads7950_direction_input(struct gpio_chip *chip,
> @@ -514,27 +506,26 @@ static int ti_ads7950_direction_output(struct gpio_chip *chip,
>  
>  static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
>  {
> -	int ret = 0;
> +	int error;
>  
> -	mutex_lock(&st->slock);
> +	guard(mutex)(&st->slock);
>  
>  	/* Settings for Manual/Auto1/Auto2 commands */
>  	/* Default to 5v ref */
>  	st->cmd_settings_bitmask = TI_ADS7950_CR_RANGE_5V;
>  	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -	if (ret)
> -		goto out;
> +	error = spi_sync(st->spi, &st->scan_single_msg);
> +	if (error)
> +		return error;
>  
>  	/* Settings for GPIO command */
>  	st->gpio_cmd_settings_bitmask = 0x0;
>  	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
> -	ret = spi_sync(st->spi, &st->scan_single_msg);
> -
> -out:
> -	mutex_unlock(&st->slock);
> +	error = spi_sync(st->spi, &st->scan_single_msg);

And can return directly here.

> +	if (error)
> +		return error;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ti_ads7950_probe(struct spi_device *spi)


