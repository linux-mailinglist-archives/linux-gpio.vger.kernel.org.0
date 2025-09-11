Return-Path: <linux-gpio+bounces-25986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B1B53D9C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 23:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10071BC1231
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 21:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B059229B18;
	Thu, 11 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fJtlTnQx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83324A066
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625656; cv=none; b=Yb6SUY2WEpVobFyA6WhchRnoiEyo/13HrK2y8BRwmieHGqqPQcvcordBh0KBAssVwfcwB6RfV8sf0FmnempfKKYvSADWZE8hLC3WV1dyWFj7gR3Nr/BeZhOvDdHGEL4X37D15jNVV3/0/LVZumfqzbBFua88tcJQ4RCN3Fj3sbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625656; c=relaxed/simple;
	bh=/qbqklOy73Xy205h9CiRY2qnxrIANAuJGQ6ZqXMNk3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PN0qngdYJMarQbSTHdoqghZo2Jg4B+R7f3zoDHb+3WvR6zHCtPpDmG6fQQV7r2ppiVqe00ID/udya9l1Cj2EW4MdK7EWTmVDUmuPfHn94dloqxuud7Clc9CiWysnfXnR/bdHqBCrtJ28YOmOhkZXTPHTQndgjhEcjL7Jz9x4NqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fJtlTnQx; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74382048b8cso1027274a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757625653; x=1758230453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Xdz7g9XJCi94PW1u7R25e+prar+7bf8nt1qt2s44Ts=;
        b=fJtlTnQx+tCkgTeyaqjf96obb1M2sYcjGcX5aIcWXGTpeaTXHLF9IZncZjkkH9x2Nj
         viOQwrZnCAOpbc+/OoNfuRdRBjpuClf/t4Z2nvRRsxDRBh2FP3PGdbU91NExOcx1ExZu
         PiKH5lwRca/PdiJwMA3QGg4quXpf9Cj5nKoqUe/YVfrl1M13v7I8M0/0qCqKH4ujnwKb
         gsDGUjiINsajfAbMlXbgnkx7cB3or0urFE50JoyaYapeoZwR1JdRHPX3TBFrQsMPR2nX
         zaKSE8tWsXVudCMQ0WoxtEuMA311RMH/mO69p7m01I5RrakHioobfQegeKojUIsTNcJR
         1I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625653; x=1758230453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Xdz7g9XJCi94PW1u7R25e+prar+7bf8nt1qt2s44Ts=;
        b=abKvTc9ckpNcMngSlWMf5IWvAH7XnI4DBiXjLMe+/6dQNiJT0Sk8ZaGd6wE6oppX7E
         QWTmMYs3flT7fQ0skpd9l7LN3JGuvV82YCAm+xhPFb748w6iCwukzgiPk4oDTJa7dCFH
         USnICBmzrEIC2kJUJ6qnUkebR/XPPTryodaebomt2VUiGsSqvx15syrvu+7iOPQx7goC
         Ks4xbAAeDUsXSkg1IOIFqD8UF5Rnpxzga3K0rjNCPUc9VjQZEI66htpCJ9/PqQwiW6f2
         HZ142Jim4u/GuTyp5qSqc0DSvFVfvPYdaXHRXfgDXDaxLxcU9HE4Ts3yDGZloe9XxEtc
         mz1w==
X-Forwarded-Encrypted: i=1; AJvYcCV1Q/K9vFw7ZSqRbBxdGBeNa/I5fbkdRWmDmYZecUcXENIr1LQXvL2GNoMm1L57v3cJsg1s1T4M6ATP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7YCR3xMx5VWCEOnAz1d5pW9n+YCehPrxhlJfvt531n8ClGst
	ZVPaHKUQw9nKIjm6K9PvQaBHj/hsJjnTrZZFl+Scy9cwGTeQMGWG4pMjx36R3TOGfok=
X-Gm-Gg: ASbGncsbywpE4sT3Q3vfgUIfxeTBzjMgtYYIiaRLvYPBN2i57UJkwkoTPfrSdiAooc4
	1ZVmyTExczdlYZJOLI3v1Ux7s5jAjD4+iugWy87B+wvdOmdhc431Gw4pdlniHASfqkKb3iNJLty
	TOhfshF4OEmxelKMjx41nmbl+0pPu+yrHY55Wf7cGeEGIyjSAaagaINxIQFotx9d+XV+cJR+LnB
	eIiPNkEAau5FhmcoBlHAEpmM++aoO7ESjNbLTD/O5un3RVnhCpYiEGv5nUfuah4qG/VFNwpNvsn
	duCX/2hoLwoLc7eYN0tgebC7s5DIdiPiGjHQgFMKj6BPg4bsANKgRr2lnl/sce1T4grrNW6D78j
	UeTXLwBA9J+XNcilanR2fHWkYLdvTBlApA3OczQeMF/zDKY1uLTYctKnhJGAAVO2JUipRBiJBLa
	w=
X-Google-Smtp-Source: AGHT+IEfEi9Sgc3MO/DgYcQbM9cS1aO0i6OLl4q1kcdgGhUYaznl1ArLjqw2SU9iu7Litt3zO5owUA==
X-Received: by 2002:a05:6808:1384:b0:43b:35de:29c5 with SMTP id 5614622812f47-43b8da0bd91mr288002b6e.30.1757625652844;
        Thu, 11 Sep 2025 14:20:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d684:59db:8b2a:5451? ([2600:8803:e7e4:1d00:d684:59db:8b2a:5451])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82abd2d5sm441365b6e.26.2025.09.11.14.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 14:20:51 -0700 (PDT)
Message-ID: <92306c8a-a2ec-4a43-80d7-c8e0c1cc0ee1@baylibre.com>
Date: Thu, 11 Sep 2025 16:20:50 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250910-bd79112-v4-0-f82f43746a8c@gmail.com>
 <20250910-bd79112-v4-2-f82f43746a8c@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250910-bd79112-v4-2-f82f43746a8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/25 6:24 AM, Matti Vaittinen wrote:

...

> diff --git a/drivers/iio/adc/rohm-bd79112.c b/drivers/iio/adc/rohm-bd79112.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a2a3affe2c6dc86a237a164139c27ec66dc9d131
> --- /dev/null
> +++ b/drivers/iio/adc/rohm-bd79112.c
> @@ -0,0 +1,553 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ROHM ADC driver for BD79112 signal monitoring hub.
> + * Copyright (C) 2025, ROHM Semiconductor.
> + *
> + * SPI communication derived from ad7923.c and ti-ads7950.c

Really? I wrote the ti-ads7950 driver and I can't say I see the
resemblance. ;-)

> + */
> +

...

> +static int bd79112_get_gpio_pins(const struct iio_chan_spec *cs, int num_channels)

u32 would make more sense when dealing with bit flags.

> +{
> +	int i, gpio_channels;

same for the local variable.

...

> +static int bd79112_probe(struct spi_device *spi)
> +{

...

> +
> +	data->read_xfer[0].tx_buf = &data->read_tx[0];
> +	data->read_xfer[0].len = sizeof(data->read_tx);
> +	data->read_xfer[0].cs_change = 1;
> +	data->read_xfer[1].rx_buf = &data->read_rx;
> +	data->read_xfer[1].len = sizeof(data->read_rx);
> +	spi_message_init_with_transfers(&data->read_msg, data->read_xfer, 2);
> +
> +	data->write_xfer.tx_buf = &data->reg_write_tx[0];
> +	data->write_xfer.len = sizeof(data->reg_write_tx);
> +	spi_message_init_with_transfers(&data->write_msg, &data->write_xfer, 1);

If these messages never change (other than the data in the buffers), you can
call devm_spi_optimize_message() here on each message to get reduced CPU usage
on every SPI message for free.


