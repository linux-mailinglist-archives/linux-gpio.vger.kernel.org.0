Return-Path: <linux-gpio+bounces-35020-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IInJCghl2Wk5pQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35020-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:00:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E63DCA24
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81F82300E59A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 21:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567093A7F4D;
	Fri, 10 Apr 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="kfMDwnux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42E37F00C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775854850; cv=none; b=ac4LkzG7mDV6NLrKtOH5Dv6yXIWAvvB7bTviqBsXGTrTQnv2/dVUE9bWtxHGLbzyheDsluQXi7EDBqoYplbsQduUdrum4TWy/+VI8Gi12K6Il2zCxoNTJD2fMAy2Fs+89h3mj2hw4AIZ7TLGH7a4JVN/L3Dhd2prEWPoyURZhnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775854850; c=relaxed/simple;
	bh=6rP/2NeocjyaqMUftXzW/8uQUv6ELa/rQzdfz7/fRSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRIq4vcYBRd4p3gVhXy/eJe6zM6B7+N5ts52+9rsNkdfxQUZix5JNGWNke+CY8V9eN42mh1rHUpXhUczYbqALbvBmdrWqiRbbHhLO4dywFKzhJ5WLd3zevwjEoY9zMk1VgzXwzM82bJN1g53IccUdgnjFTUacteThg3jODRp1mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=kfMDwnux; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-47018d3416aso1572873b6e.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775854846; x=1776459646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjiDa43R9nZMxJdozPmDaP5r3lj4EBR+Ho5duYukD5Y=;
        b=kfMDwnuxX208vL6zZvAkBA23GL9w75AFNCa22xIW/a9zPHibIsn2cZeajisN6A4zyV
         hv0TPZOirjkRj/H8gG44ElTS3KhdKXkBG7nRfzJ/VLV3ZmyGsc4KWXijmLyGnu949MXm
         OEqM2Exi7tu5BUcmTDgGIiXKq+cWffJv/BCttYzL0TT2Xx+ifb4Vbj67kb0tYSQF/pm8
         FbwO88DcDJh3A4VHBjQxQ/69Z3KgdCZHWUY05vPK+RSLvNIz3pfYwW9JGmvwJr9KynxG
         Bu/FCocUDT5NhJVrnib+MOmKNllCTDTeIRaUQQGjElWicxWKuWNdO8MZa3X5ULK0kQGK
         adgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775854846; x=1776459646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjiDa43R9nZMxJdozPmDaP5r3lj4EBR+Ho5duYukD5Y=;
        b=hBHbQNDXKsgIs+Wemmg7PNN7KQ7rw1kN432od+7FoDIM5ctrEgqaB8a3YRkTfDUZWu
         jSncevaoJYU1lhYsVZA/gfMgF6MT6iWqO5nuX4GyDxnPSseSyj4miJk1h2nzj5Wtnn0c
         ATjwr2zi+0iVkLrWr1FuomW4lpQQ5rpJ+Ff9gfCj9JyYumNBVpyKa/zlsN3LzWlKA/7b
         pu7EP0I1EXrCYC4avI9v88hcW3j8JUcNvu7DmZueA6b2KL4yRD4ZJ9+fWPZKrYHa2RiM
         O0vo51Zl+Arbjm9Buvh2MuNyxVFThDqbHRlRfr6+6smazU/+GaRJ6bkEBaxmotU57WfW
         8i1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIMzpv2nVTF1/zZ8mBX89E3fcZjQAOKNkTp5Lz8zewEJUlajv/TEdpFlE1Yj9zmlZlZ9eYP707w/Oz@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXxTwYme34+lNkQtpfPEPH0yDkSS7VbttGFoJvqk7WLyl7gaW
	ovEEiEMj+IkoSY9ejZoPn+EghFU80nWaDMQ3hoCDU3nY99dpkF+bL7fhemKZ4QhO8+s=
X-Gm-Gg: AeBDiesnC+0qIPLlMLY6Qp77ovbg2Ae0k5hvbIbzgVKd5IvE6atBOlB+9IuSJOTy2vl
	h5Ya1ODDNprLBCPqQ5QmUNJiQFcClFxFQ7VLNLR0Q4P4h9syau7uzMZX6LScoN1UGNBl29RdtnP
	TCtjzuPfuIdgTa5tGAk7oI7cYWBbQST9eopN9kSGt7v/GsXqeznUpvhgZRvrRqXRh3dMpwf+7CG
	mG0TAkWElH7KihdL9QXjSVTm1D6QoFZblLHTO3643Cq6HVdlaCkgIOyCGEcz9xRMNhLSUtAb7Ht
	X5rDB9uwJt3GhIwZ716nUCOku3qXFx2gpw8LDc5NT2YVZY5uja0N7P7/AIvrVAlRIzqgNBqwsGg
	jUYk1tOHbhfVyKSJYUFJa0Frsqvw1ucC+eiadc5Y31/TURhmrJx531OnF6KxOXShQP/dftijeFh
	fY+R80aDpN7dE9GfTg2iXu4G4wuueBsG88uqj63oYZPfPUmA13PaFL9zoTE9aq6hqgvd7P0he2N
	Ygs/j1SEFgD
X-Received: by 2002:a05:6808:470b:b0:46c:cdf4:1bde with SMTP id 5614622812f47-4789ca3aaadmr2638671b6e.10.1775854846014;
        Fri, 10 Apr 2026 14:00:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a3a78204sm2094472b6e.18.2026.04.10.14.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:00:44 -0700 (PDT)
Message-ID: <1170956f-da05-4280-990f-64306ca905c2@baylibre.com>
Date: Fri, 10 Apr 2026 16:00:42 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] iio: adc: ad4691: add SPI offload support
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-4-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-4-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35020-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,analog.com:email]
X-Rspamd-Queue-Id: BC4E63DCA24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add SPI offload support to enable DMA-based, CPU-independent data
> acquisition using the SPI Engine offload framework.
> 
> When an SPI offload is available (devm_spi_offload_get() succeeds),
> the driver registers a DMA engine IIO buffer and uses dedicated buffer
> setup operations. If no offload is available the existing software
> triggered buffer path is used unchanged.
> 
> Both CNV Burst Mode and Manual Mode support offload, but use different
> trigger mechanisms:
> 
> CNV Burst Mode: the SPI Engine is triggered by the ADC's DATA_READY
> signal on the GP pin specified by the trigger-source consumer reference
> in the device tree (one cell = GP pin number 0-3). For this mode the
> driver acts as both an SPI offload consumer (DMA RX stream, message
> optimization) and a trigger source provider: it registers the
> GP/DATA_READY output via devm_spi_offload_trigger_register() so the
> offload framework can match the '#trigger-source-cells' phandle and
> automatically fire the SPI Engine DMA transfer at end-of-conversion.
> 
> Manual Mode: the SPI Engine is triggered by a periodic trigger at
> the configured sampling frequency. The pre-built SPI message uses
> the pipelined CNV-on-CS protocol: N+1 16-bit transfers are issued
> for N active channels (the first result is discarded as garbage from
> the pipeline flush) and the remaining N results are captured by DMA.
> 
> All offload transfers use 16-bit frames (bits_per_word=16, len=2).
> The channel scan_type (storagebits=16, shift=0, IIO_BE) is shared
> between the software triggered-buffer and offload paths; no separate
> scan_type or channel array is needed for the offload case. The
> ad4691_manual_channels[] array introduced in the triggered-buffer
> commit is reused here: it hides the IIO_CHAN_INFO_OVERSAMPLING_RATIO
> attribute, which is not applicable in Manual Mode.
> 
> Kconfig gains a dependency on IIO_BUFFER_DMAENGINE.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  drivers/iio/adc/Kconfig  |   2 +
>  drivers/iio/adc/ad4691.c | 398 ++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 395 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index d498f16c0816..fdc6565933c5 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -143,8 +143,10 @@ config AD4691
>  	tristate "Analog Devices AD4691 Family ADC Driver"
>  	depends on SPI
>  	select IIO_BUFFER
> +	select IIO_BUFFER_DMAENGINE
>  	select IIO_TRIGGERED_BUFFER
>  	select REGMAP
> +	select SPI_OFFLOAD
>  	help
>  	  Say yes here to build support for Analog Devices AD4691 Family MuxSAR
>  	  SPI analog to digital converters (ADC).
> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 3e5caa0972eb..839ea7f44c78 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
> @@ -22,6 +22,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/spi/spi.h>
> +#include <linux/spi/offload/consumer.h>
> +#include <linux/spi/offload/provider.h>
>  #include <linux/units.h>
>  #include <linux/unaligned.h>
>  
> @@ -43,6 +45,11 @@
>  
>  #define AD4691_CNV_DUTY_CYCLE_NS		380
>  #define AD4691_CNV_HIGH_TIME_NS			430
> +/*
> + * Conservative default for the manual offload periodic trigger. Low enough
> + * to work safely out of the box across all OSR and channel count combinations.
> + */
> +#define AD4691_OFFLOAD_INITIAL_TRIGGER_HZ	(100 * HZ_PER_KHZ)
>  
>  #define AD4691_SPI_CONFIG_A_REG			0x000
>  #define AD4691_SW_RESET				(BIT(7) | BIT(0))
> @@ -95,6 +102,8 @@
>  #define AD4691_ACC_IN(n)			(0x252 + (3 * (n)))
>  #define AD4691_ACC_STS_DATA(n)			(0x283 + (4 * (n)))
>  
> +#define AD4691_OFFLOAD_BITS_PER_WORD		16

This is just the same as realbits in scan info. So could use that
directly instead.

> +
>  static const char * const ad4691_supplies[] = { "avdd", "vio" };
>  
>  enum ad4691_ref_ctrl {
> @@ -114,6 +123,7 @@ struct ad4691_chip_info {
>  	const char *name;
>  	unsigned int max_rate;
>  	const struct ad4691_channel_info *sw_info;
> +	const struct ad4691_channel_info *offload_info;
>  };
>  
>  #define AD4691_CHANNEL(ch)						\
> @@ -177,6 +187,18 @@ static const struct ad4691_channel_info ad4693_sw_info = {
>  	.num_channels = ARRAY_SIZE(ad4693_channels),
>  };
>  
> +static const struct ad4691_channel_info ad4691_offload_info = {
> +	.channels = ad4691_channels,
> +	/* No soft timestamp; num_channels caps access to 16. */
> +	.num_channels = 16,

`ARRAY_SIZE(ad4691_channels) - 1` would make sense too.

> +};
> +
> +static const struct ad4691_channel_info ad4693_offload_info = {
> +	.channels = ad4693_channels,
> +	/* No soft timestamp; num_channels caps access to 8. */
> +	.num_channels = 8,
> +};
> +
>  /*
>   * Internal oscillator frequency table. Index is the OSC_FREQ_REG[3:0] value.
>   * Index 0 (1 MHz) is only valid for AD4692/AD4694; AD4691/AD4693 support
> @@ -207,24 +229,36 @@ static const struct ad4691_chip_info ad4691_chip_info = {
>  	.name = "ad4691",
>  	.max_rate = 500 * HZ_PER_KHZ,
>  	.sw_info = &ad4691_sw_info,
> +	.offload_info = &ad4691_offload_info,
>  };
>  
>  static const struct ad4691_chip_info ad4692_chip_info = {
>  	.name = "ad4692",
>  	.max_rate = 1 * HZ_PER_MHZ,
>  	.sw_info = &ad4691_sw_info,
> +	.offload_info = &ad4691_offload_info,
>  };
>  
>  static const struct ad4691_chip_info ad4693_chip_info = {
>  	.name = "ad4693",
>  	.max_rate = 500 * HZ_PER_KHZ,
>  	.sw_info = &ad4693_sw_info,
> +	.offload_info = &ad4693_offload_info,
>  };
>  
>  static const struct ad4691_chip_info ad4694_chip_info = {
>  	.name = "ad4694",
>  	.max_rate = 1 * HZ_PER_MHZ,
>  	.sw_info = &ad4693_sw_info,
> +	.offload_info = &ad4693_offload_info,
> +};
> +
> +struct ad4691_offload_state {
> +	struct spi_offload *spi;

I would call this "offload" or "instance". "spi" is usally the SPI
device handle.

> +	struct spi_offload_trigger *trigger;
> +	u64 trigger_hz;
> +	u8 tx_cmd[17][2];
> +	u8 tx_reset[4];
>  };
>  

...

> +
> +static int ad4691_cnv_burst_offload_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st = iio_priv(indio_dev);
> +	struct ad4691_offload_state *offload = st->offload;
> +	int ret;
> +
> +	spi_offload_trigger_disable(offload->spi, offload->trigger);
> +
> +	ret = ad4691_sampling_enable(st, false);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(st->regmap, AD4691_STD_SEQ_CONFIG,
> +			   AD4691_SEQ_ALL_CHANNELS_OFF);

Why this extra step? We don't have it when unwinding in the
error path of the postenable function.

> +	if (ret)
> +		return ret;
> +
> +	spi_unoptimize_message(&st->scan_msg);
> +
> +	return ad4691_exit_conversion_mode(st);
> +}
> +
> +static const struct iio_buffer_setup_ops ad4691_cnv_burst_offload_buffer_setup_ops = {
> +	.postenable = &ad4691_cnv_burst_offload_buffer_postenable,
> +	.predisable = &ad4691_cnv_burst_offload_buffer_predisable,
> +};
> +
>  static ssize_t sampling_frequency_show(struct device *dev,
>  				       struct device_attribute *attr,
>  				       char *buf)

