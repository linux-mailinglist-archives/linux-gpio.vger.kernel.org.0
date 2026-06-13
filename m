Return-Path: <linux-gpio+bounces-38402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNtDNhlfLWq5fQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 15:46:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69967EB1B
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 15:46:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=inbLlYOM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38402-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38402-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D1C302FB40
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FA1291864;
	Sat, 13 Jun 2026 13:45:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D12288D5;
	Sat, 13 Jun 2026 13:45:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781358356; cv=none; b=JUwntqEmRPMC+54XzK3FXm3BSgt9yfAwKgpfVtNEyRDDVc/qJVQmD5pFPWMAGks8vQUKlE90x7YPhjHPAMQ2cpPRrwPx3RPLQpWPO22Llml2Ujyjustx0v4qrTDqm9I8BooBZjtQXy14vKYu8P0e3o6l2q+WWPnHBtnyWn9jnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781358356; c=relaxed/simple;
	bh=7vUC23rAfJU2bKqao5ACjsOO/qV7eKgG6LnQmUcDrzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WER2HY1ukQD8Wd+KghtY8Ryzm7Ejq8/1tGxN90t8nRxtP7R5j4eCLYofuCL0gOAUlmIXO8FPX5pJlgUI+0TLSIWeFYwdrnwVf7Fk5CfDFp8uQVojVqN1geaUfROVO1KsPCg9V5K7kMYIaNjU2+otSirXpPQAkXfoqNNNpOzqaUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inbLlYOM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB631F000E9;
	Sat, 13 Jun 2026 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781358354;
	bh=MvuBf5LYvuQlsd8Q67VHiYGDj94NPDpnHJXrjwO7fik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=inbLlYOMrHwS8mB2wMHODPtdmhICV3kbcTnd7EVKcv43lJO/wO++KxF1xdxrPCx6M
	 Vx5zWW4ebymbeb6KMRh0D6/hsyVr6XFhH95vx9kqFpEi7biCGAtIIyZW04iPo+5wel
	 hahicq3b4SuFeOX5deepMPGw4yO7Mx+Y+gNXgEASOxbhG6YaYib/AHYftZEtLYqWWr
	 WB+3u5mfUxsU5IR3119Nd7xpnmDYgy/phNkCO/IfJChmaTqpbtu4gb3bwuEcUbvCig
	 T/3bAC5Gz27ICo7Fv2F6LxnXO+0h1XjJ6PJLuPu5UGDHwOD3uvCQlKgOT1jgi7yzIJ
	 Wry349/q3l4QA==
Date: Sat, 13 Jun 2026 14:45:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
Message-ID: <20260613144544.0594a7f0@jic23-huawei>
In-Reply-To: <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
	<20260612-ads126x-v1-2-894c788d03ed@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38402-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B69967EB1B

On Fri, 12 Jun 2026 17:46:20 -0500
Kurt Borja <kuurtb@gmail.com> wrote:

> Add ti-ads1262 driver for TI ADS1262 and ADS1263 ADCs with initial
> support for the following features:
> 
>   - Power management
>   - IIO direct and buffer modes
>   - Channel hot-reloading
>   - Internal or external oscillator
>   - Internal or external voltage reference
>   - Filter configuration
>   - Sensor bias configuration
>   - IDAC configuration
>   - Level-shift voltage configuration
>   - Auxiliary ADC interoperability considerations
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  MAINTAINERS                  |    1 +
>  drivers/iio/adc/Kconfig      |   13 +
>  drivers/iio/adc/Makefile     |    1 +
>  drivers/iio/adc/ti-ads1262.c | 1816 ++++++++++++++++++++++++++++++++++++++++++

That is rather too big. I think you'll have to work out how to split this
up into more manageable chunks.  Staying under a 1000 (preferably a lot less)
per patch makes it much easier for people to review.

Given the complexity of the device this might be one that has to go
in as several series, building up functionality as we go.

I'll ignore all the DT stuff as sounds like that may radically change and
just take a fairly superficial first look at this.

Jonathan


> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> new file mode 100644
> index 000000000000..fd1911cf65ac
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.c
> @@ -0,0 +1,1816 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Texas Instruments ADS1262 ADC driver
> + *
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/align.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/lockdep.h>

Fairly unusual to see that header in a driver.
What's it here for?

> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
> +#include <linux/property.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/units.h>


> +/* IDACMAG constants */
> +#define ADS1262_IDACMAG_OFF			0
> +#define ADS1262_IDACMAG_COUNT			11
> +
> +/* REFMUX constants */

Naming is good enough I'm not sure I'd bother with the comments
to say what these are.

On option is to just group them with the register they are about
and using extra indenting to visually separate them from the register

#define ADS1262_REFMUX_REG			0xxx
#define   ADS1262_REFMUX_RMUXP_MASK		GENMASK(5, 3)
#define     ADS1262_RMUX_INTER				0
#define     ADS1262_RMUX_AIN0_AIN1			1
#define     ADS1262_RMUX_AIN2_AIN3			2
#define     ADS1262_RMUX_AIN4_AIN5			3
#define     ADS1262_RMUX_AVDD_AVSS			4
#define     ADS1262_RMUX_COUNT				5
However, if you are going to have a terminating entry, an anonymous enum might be better
with that just as the last item.

#define   ADS1262_REFMUX_RMUXN_MASK		GENMASK(2, 0)


> +#define ADS1262_RMUX_INTER			0
> +#define ADS1262_RMUX_AIN0_AIN1			1
> +#define ADS1262_RMUX_AIN2_AIN3			2
> +#define ADS1262_RMUX_AIN4_AIN5			3
> +#define ADS1262_RMUX_AVDD_AVSS			4
> +#define ADS1262_RMUX_COUNT			5
> +
> +struct ads1262_channel {

As a general rule we tend to avoid bitfields because of all the problems
with how loose the C spec is on how these actually get laid out.
I'd just have this as a suitable 32 bit value and then have
defines for masks within that.

> +	/* MODE0 */
> +	u8 conv_delay:4;
> +	u8 chop_mode:1;
> +	u8 idac_rot_mode:1;
> +	u8 runmode:1;
> +	u8 rev_vref_pol:1;
> +
> +	/* MODE1 */
> +	u8 sbias_magnitude:3;
> +	u8 sbias_polarity:1;
> +	u8 sbias_connection:1;
> +	u8 filter:3;
> +
> +	/* MODE2 */
> +	u8 data_rate:4;
> +	u8 gain:3;
> +	u8 pga_bypass:1;
> +
> +	/* INPMUX */
> +	u8 negative_input:4;
> +	u8 positive_input:4;
> +};
> +
> +struct ads1262 {
> +	struct spi_device *spi;
> +	struct regmap *regmap;
> +	struct iio_dev *indio_dev;
> +	struct iio_trigger *trig;
> +	struct gpio_desc *reset_gpiod;
> +	struct gpio_desc *start_gpiod;
> +
> +	void *scan_buffer;
I think this is always accessed as a __be32. If so just type it as that.

> +	size_t scan_sz;
> +
> +	/* Protects channel state */
> +	struct mutex chan_lock;
> +	u32 vref_uV;
> +	unsigned int num_channels;
> +	struct ads1262_channel *channels;
> +	struct completion drdy;
> +	struct spi_message msg;
> +	struct spi_transfer xfer;
> +
> +	/* Protects transfer buffers and concurrent SPI transfers */
> +	struct mutex xfer_lock;
> +
> +	u8 tx[6] __aligned(IIO_DMA_MINALIGN);
> +	union {
> +		u8 rx[6];
> +		struct {
> +			__be32 data;
> +		} __packed shift_reg;
> +		struct {
> +			u8 dummy;
> +			__be32 data;

I guess Sashiko already moaned about unaligned accesses (I'm too lazy to check :)
You may have to always memcpy this to a local variable rather than accessing
it directly.

> +		} __packed holding_reg;
> +	};
> +};

> +
> +static int ads1262_dev_power_on(struct ads1262 *st)
> +{
> +	int ret;
> +
> +	ret = gpiod_set_value_cansleep(st->reset_gpiod, 0);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(9 * USEC_PER_MSEC);
> +
> +	return 0;
> +}
> +
> +static int ads1262_dev_power_off(struct ads1262 *st)
> +{
> +	int ret;
> +
> +	ret = gpiod_set_value_cansleep(st->reset_gpiod, 1);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(9 * USEC_PER_MSEC);
> +
> +	return 0;
> +}

Given how similar these two are (assuming they don't get more complex
later) perhaps just combine them into one function, or use a shared function
plus trivial wrappers.

> +
> +static int ads1262_dev_cmd(struct ads1262 *st, u8 opcode)
> +{
> +	guard(mutex)(&st->xfer_lock);
> +
> +	st->tx[0] = opcode;
> +
> +	return spi_write(st->spi, &st->tx[0], sizeof(st->tx[0]));
maybe use

	return spi_write_then_read(st->spi, opcode, sizeof(opcode), NULL, 0);

Might as well use the helpers that bounce buffer in cases like this rather
than rolling our own.

> +}

> +static int ads1262_channel_hot_reload(struct ads1262 *st,
> +				      const struct iio_chan_spec *chan)
> +{
> +	unsigned int weight;
> +	unsigned long i;
> +	int ret;
> +
> +	/*
> +	 * Hot reloading is only required on buffer mode and if only one channel
> +	 * is enabled.
> +	 */
> +	if (!iio_device_try_claim_buffer_mode(st->indio_dev))
> +		return 0;

Look at IIO_ACQUIRE_DIRECT_MODE()

That should let you simplify the error paths in here.
I see you used it elsewhere.

> +
> +	weight = bitmap_weight(st->indio_dev->active_scan_mask,
> +			       iio_get_masklength(st->indio_dev));
> +	if (weight != 1) {
> +		iio_device_release_direct(st->indio_dev);
> +		return 0;
> +	}
> +
> +	i = find_first_bit(st->indio_dev->active_scan_mask,
> +			   iio_get_masklength(st->indio_dev));
> +	if (i != chan->scan_index) {
> +		iio_device_release_direct(st->indio_dev);
> +		return 0;
> +	}
> +
> +	/*
> +	 * The device automatically hot reloads the channel after writing to
> +	 * the configuration registers.
> +	 */
> +	ret = ads1262_channel_enable(st, &st->channels[chan->scan_index]);
> +
> +	iio_device_release_direct(st->indio_dev);
> +
> +	return ret;
> +}
> +
> +static int ads1262_channel_read(struct ads1262 *st,
> +				struct ads1262_channel *chan_data,
> +				__be32 *val)

Trivial: Probably move val to line above.

> +{
> +	struct device *dev = &st->spi->dev;
> +	u8 runmode;
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
> +
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(st->indio_dev, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	/*
> +	 * When a channel has chop mode or IDAC rotation mode, the first
> +	 * conversion is always withheld so the datasheet suggests using the
> +	 * CONTINUOUS mode and briefly starting and stopping conversions to
> +	 * achieve the same effect (Section 9.4.1.2).
> +	 */
> +	if (chan_data->chop_mode || chan_data->idac_rot_mode)
> +		runmode = ADS1262_RUNMODE_CONTINUOUS;
> +	else
> +		runmode = ADS1262_RUNMODE_PULSE;
> +
> +	ads1262_channel_set_runmode(st, chan_data, runmode);
> +
> +	ret = ads1262_channel_enable(st, chan_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = ads1262_dev_start_one(st, runmode);
> +	if (ret)
> +		return ret;
> +
> +	ads1262_wait_for_conversion(st);
> +
> +	return ads1262_dev_read_data_command(st, ADS1262_OPCODE_RDATA1, val);
> +}
> +
> +static int ads1262_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int *val,
> +			    int *val2, long mask)
> +{
> +	struct ads1262 *st = iio_priv(indio_dev);
> +	struct ads1262_channel *chan_data;
> +	u8 mode, realbits;
> +	__be32 raw;
> +	u32 cnv;
> +	int ret;
> +
> +	chan_data = &st->channels[chan->scan_index];
> +	realbits = chan->scan_type.realbits;

I'd be tempted to do these two as part of declarations.

> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = ads1262_channel_read(st, chan_data, &raw);
> +		if (ret)
> +			return ret;
> +
> +		cnv = be32_to_cpu(raw);
> +		*val = sign_extend32(cnv, realbits - 1);

Might as well combine these lines and avoid need for local cnv.

		*VAL = sign_extend32(be32_to_cpu(raw), realbits - 1);


> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		u64 divd, divr, tmp, rem;
> +
> +		mutex_lock(&st->chan_lock);
> +		divd = st->vref_uV;
> +		divr = BIT_ULL(chan_data->gain + realbits - 1) * 1000;
> +		mutex_unlock(&st->chan_lock);
> +
> +		tmp = div64_u64(divd * 1000000000ULL, divr);
> +		*val = div64_u64_rem(tmp, 1000000000ULL, &rem);

Use the NANO define probably to avoid need to zero count when reviewing.

> +		*val2 = rem;
> +
> +		return IIO_VAL_INT_PLUS_NANO;

> +
> +static int ads1262_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ads1262 *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +
> +	ads1262_dev_stop(st);
> +	pm_runtime_put_autosuspend(dev);
> +	spi_unoptimize_message(&st->msg);
> +	kfree(st->scan_buffer);
> +	st->scan_buffer = NULL;
> +	st->scan_sz = 0;

Are either scan_buffer or scan_sz ever checked?  If not I would not
bother clearing them as their state doesn't matter when we aren't
in buffered mode.  Maybe there is a small argument that clearing them
might help with debug but I don't see that as a worth the implication that
something might be gated on these.

> +
> +	return 0;
> +}
> +
> +static bool ads1262_validate_scan_mask(struct iio_dev *indio_dev,
> +				       const unsigned long *scan_mask)
> +{
> +	struct ads1262 *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +
> +	if (iio_trigger_using_own(indio_dev)) {
> +		dev_err(dev, "The %s trigger only supports one active channel\n",
> +			st->trig->name);

Given this can be trivially triggered from userspace - if you want to have
a print here, use a rate limited version.

> +		return iio_validate_scan_mask_onehot(indio_dev, scan_mask);
> +	}
> +
> +	return true;
> +}

> +
> +static int ads1262_fill_buffer_mult(struct ads1262 *st)
> +{
> +	__be32 val, *scan_buffer = st->scan_buffer;

Avoid mixing pointer and no point, or anything with assignments
as it makes the code harder to read.

> +	unsigned int chan;
> +	int i = -1;
> +	int ret;
> +
> +	/*
> +	 * This routine enables and reads channels in a full-duplex fashion.
> +	 *
> +	 * When a channel is enabled, the previous conversion is clocked out of
> +	 * the shift data register on the same transfer (Section 9.4.7.1). This
> +	 * allows for low latency software sequencing but forbids any SPI
> +	 * activity happen in between or data corruption may occur, hence the
> +	 * need to take the xfer_lock for the whole operation.
> +	 */

Just to check: Is SPI traffic on the same bus to a different device fine?
If not you'd need spi_bus_lock(). If it is fine then reword this to talk about
communications with this device just to avoid confusion.

> +
> +	guard(mutex)(&st->xfer_lock);
> +
> +	iio_for_each_active_channel(st->indio_dev, chan) {
> +		ret = ads1262_channel_enable_and_read(st, &st->channels[chan],
> +						      &val);

It's fine to go a little past 80 chars on a line if it helps readabiilty.
The harder limit is 100 chars though.

> +		if (ret)
> +			return ret;
> +
> +		if (i > -1)
> +			scan_buffer[i] = val;
> +		i++;
> +
> +		ads1262_wait_for_conversion(st);
> +	}
> +
> +	return ads1262_dev_read_data_direct(st, &scan_buffer[i]);
> +}


> +static int ads1262_read_chip_name(struct ads1262 *st, char **name)
> +{
> +	struct device *dev = &st->spi->dev;
> +	u8 dev_id;
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(st->regmap, ADS1262_ID_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_id = FIELD_GET(ADS1262_DEV_ID_MASK, val);
> +
> +	switch (dev_id) {
> +	case ADS1262_DEV_ID_ADS1262:
> +		*name = "ads1262";

Given, at somepoint I would guess you'll want to support the auxiliary adc
on the 1263, I'd start with a struct chip_info  (with the name in there)
and pick that rather than just the name here.

> +		break;
> +	case ADS1262_DEV_ID_ADS1263:
Not particularly important but common practice to just change the prefix
for anything device specific.
	case ADS1263_DEV_ID

> +		*name = "ads1263";
> +		break;
> +	default:
> +		*name = "ads1262";
Given we'll ultimately want fallback compatibles to work and so allow
for firmware to specify which device to fallback to, this should really be
using the guidance from firmware to select rather than always guessing
the 1262 variant.  That is safe though given the 'subset' nature so this
doesn't matter as much as it normally does.

> +		dev_dbg(dev, "Failed to identify device with ID 0x%x\n", val);
> +	}
> +
> +	return 0;
> +}
>
> +
> +static int ads1262_dev_configure(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	u32 idac_pins[2], idac_mags[2];
> +	u8 val;
> +	int ret;
> +
> +	ret = ads1262_dev_reset(st);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
> +
> +	ret = regmap_update_bits(st->regmap, ADS1262_INTERFACE_REG,
> +				 ADS1262_INTERFACE_STATUS_MASK |
> +				 ADS1262_INTERFACE_CRC_MASK, 0);

regmap_clear_bits()

> +	if (ret)
> +		return ret;
> +
> +	if (device_property_present(dev, "ti,vbias")) {
> +		ret = regmap_update_bits(st->regmap, ADS1262_POWER_REG,
> +					 ADS1262_POWER_VBIAS_MASK,
> +					 ADS1262_POWER_VBIAS_MASK);
regmap_set_bits()

> +		if (ret)
> +			return ret;
> +	}

> +
> +static int ads1262_gpio_setup(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	struct gpio_desc *gpiod;
> +	const char *con_id;
> +
> +	con_id = "start";
> +	gpiod = devm_gpiod_get_optional(dev, con_id, GPIOD_OUT_LOW);
> +	if (IS_ERR(gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gpiod),
> +				     "Failed to get %s GPIO\n", con_id);

Whilst not duplicating the string con_id is nice, it does break grepping for error
messages. So I'd just duplicate it.

> +	st->start_gpiod = gpiod;
> +
> +	con_id = "reset";
> +	gpiod = devm_gpiod_get_optional(dev, con_id, GPIOD_OUT_HIGH);
> +	if (IS_ERR(gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gpiod),
> +				     "Failed to get %s GPIO\n", con_id);
> +	st->reset_gpiod = gpiod;
> +
> +	return 0;
> +}

> +
> +static int ads1262_regulator_setup(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	const char *reg_id, *prop;
> +	u32 mux[2] = {};
> +	int val, ret;
> +
> +	reg_id = "dvdd";
> +	ret = devm_regulator_get_enable(dev, reg_id);
> +	if (ret)
> +		goto err_regulator_get;
> +
> +	reg_id = "avdd";
> +	ret = devm_regulator_get_enable(dev, reg_id);
> +	if (ret)
> +		goto err_regulator_get;
> +
> +	prop = "ti,neg-refmux";
> +	device_property_read_u32(dev, prop, &mux[0]);
> +	if (mux[0] >= ADS1262_RMUX_COUNT)
> +		return dev_err_probe(dev, -ENXIO, " %s out of range\n", prop);
> +
> +	prop = "ti,pos-refmux";
> +	device_property_read_u32(dev, prop, &mux[1]);
> +	if (mux[1] >= ADS1262_RMUX_COUNT)
> +		return dev_err_probe(dev, -ENXIO, " %s out of range\n", prop);
> +
> +	if (mux[0] == ADS1262_RMUX_INTER && mux[1] == ADS1262_RMUX_INTER) {
> +		/* The internal voltage reference is 2.5 V */
> +		st->vref_uV = 2500000;
> +		return 0;
> +	}
> +
> +	val = FIELD_PREP(ADS1262_REFMUX_RMUXN_MASK, mux[0]);
> +	val |= FIELD_PREP(ADS1262_REFMUX_RMUXP_MASK, mux[1]);
> +	ret = regmap_update_bits(st->regmap, ADS1262_REFMUX_REG,
> +				 ADS1262_REFMUX_RMUXN_MASK |
> +				 ADS1262_REFMUX_RMUXP_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	reg_id = "vref";
> +	st->vref_uV = devm_regulator_get_enable_read_voltage(dev, reg_id);
> +	if (st->vref_uV < 0)
> +		goto err_regulator_get;
> +
> +	return 0;
> +
> +err_regulator_get:
> +	return dev_err_probe(dev, ret, "Failed to get regulator %s\n", reg_id);

I'd be tempted to just duplicate the print in the interests of simpler code flow.
Would avoid the need for a local variable to stash 'last one I tried'.


> +}

> +
> +static const struct reg_default ads1262_reg_defaults[] = {
> +	{ ADS1262_POWER_REG,		0x11 },

Is it sensible to specify these in terms of the fields that make them up?
Can make it easier to see what the default state actually means.
Sometimes it is just too complex, so we don't bother.

> +	{ ADS1262_INTERFACE_REG,	0x05 },
> +	{ ADS1262_MODE0_REG,		0x00 },
> +	{ ADS1262_MODE1_REG,		0x80 },
> +	{ ADS1262_MODE2_REG,		0x04 },
> +	{ ADS1262_INPMUX_REG,		0x01 },
> +	{ ADS1262_OFCAL0_REG,		0x00 },
> +	{ ADS1262_OFCAL1_REG,		0x00 },
> +	{ ADS1262_OFCAL2_REG,		0x00 },
> +	{ ADS1262_FSCAL0_REG,		0x00 },
> +	{ ADS1262_FSCAL1_REG,		0x00 },
> +	{ ADS1262_FSCAL2_REG,		0x40 },
> +	{ ADS1262_IDACMUX_REG,		0xBB },
> +	{ ADS1262_IDACMAG_REG,		0x00 },
> +	{ ADS1262_REFMUX_REG,		0x00 },
> +	{ ADS1262_TDACP_REG,		0x00 },
> +	{ ADS1262_TDACN_REG,		0x00 },
> +	{ ADS1262_GPIOCON_REG,		0x00 },
> +	{ ADS1262_GPIODIR_REG,		0x00 },
> +	{ ADS1262_GPIODAT_REG,		0x00 },
> +	{ ADS1262_ADC2CFG_REG,		0x00 },
> +	{ ADS1262_ADC2MUX_REG,		0x01 },
> +	{ ADS1262_ADC2OFC0_REG,		0x00 },
> +	{ ADS1262_ADC2OFC1_REG,		0x00 },
> +	{ ADS1262_ADC2FSC0_REG,		0x00 },
> +	{ ADS1262_ADC2FSC1_REG,		0x40 },
> +};


> +static int ads1262_runtime_suspend(struct device *dev)
> +{
> +	struct ads1262 *st = dev_get_drvdata(dev);
> +
> +	if (!st->reset_gpiod)
> +		return 0;
> +
> +	regcache_cache_only(st->regmap, true);
> +
> +	return ads1262_dev_power_off(st);
> +}
> +
> +static int ads1262_runtime_resume(struct device *dev)
> +{
> +	struct ads1262 *st = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!st->reset_gpiod)
> +		return 0;
> +
> +	ret = ads1262_dev_power_on(st);
> +	if (ret)
> +		return ret;
> +
> +	regcache_cache_only(st->regmap, false);
> +	regcache_mark_dirty(st->regmap);
> +
> +	return regcache_sync(st->regmap);
> +}
> +
> +DEFINE_RUNTIME_DEV_PM_OPS(ads1262_runtime_pm, ads1262_runtime_suspend,
> +			  ads1262_runtime_resume, NULL);
> +
> +static const struct of_device_id ads1262_of_match[] = {
> +	{ .compatible = "ti,ads1262" },
> +	{ .compatible = "ti,ads1263" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ads1262_of_match);
> +
> +static const struct spi_device_id ads1262_spi_match[] = {
> +	{ "ads1262" },
> +	{ "ads1263" },

Named initializers please.  Uwe is driving through updating
all the existing drivers to use them (various reasons to do that
but simplest one is it's inconsistent with what we have always done
for of_device_id!)

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, ads1262_spi_match);
> +
> +static struct spi_driver ads1262_spi_driver = {
> +	.driver = {
> +		.name = "ads1262",
> +		.of_match_table = ads1262_of_match,
> +		.pm = pm_ptr(&ads1262_runtime_pm),
> +	},
> +	.probe = ads1262_spi_probe,
> +	.id_table = ads1262_spi_match,
> +};
> +module_spi_driver(ads1262_spi_driver);
> +
> +MODULE_DESCRIPTION("Texas Instruments ADS1262 ADC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
> 


