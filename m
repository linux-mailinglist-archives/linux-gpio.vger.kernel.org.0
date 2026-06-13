Return-Path: <linux-gpio+bounces-38405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pX0MKfdkLWoFfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 16:11:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2467EBA4
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 16:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GudeV6gu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38405-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38405-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11093303CEB1
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1C630D3E9;
	Sat, 13 Jun 2026 14:10:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF890281532;
	Sat, 13 Jun 2026 14:10:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781359859; cv=none; b=R1XgBB4piuG6S5M+af6BbI8dCcuaAvRjmJ5GrMBusmRAhV/JrFQaPSD7wmIw6xpDVad+EUoHcirZozUc1ASElk8zEMvhg81aHUDFxZdWN4GM06O2sshlfLGh7+R9ogdp5jXjx0eDeB9HOvtzs9wsF1+xri2zLEwZAGgGKec7pfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781359859; c=relaxed/simple;
	bh=fp/hivSY/csefW+Za2qgpVIDyRY27Ux0kAZB2mSCX8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YoHBMFGnossXupRqKYNtVrmrWOEziPORK5CDE/9Jv++bjnfj3LYDZD+9UjMRim0o/w7jhrccR06X3LlHf6M6FIIvE5Rd+8SbPjiZXUwvq44Fnf0bk8blVtZrTJqbzzKMGOewKfgPIvrWtjKPrG+HdWjD1ITROwb0+ZOv0QtgxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GudeV6gu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFCC1F000E9;
	Sat, 13 Jun 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781359857;
	bh=/oG4sz904dx7/lDkPQwUAT1EDQGFByh5pdsU8cchgfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GudeV6guJQw0NAPcT9CFGk3vaTA4gJsTW1lMh1gfRBXgxd/950JuoWoOKP4+8uNBV
	 rBKRyZYYcZr15ad26hadYQmnc1AXXGd87vpRrXDXrYs9Is8j500EHRiR2bKgWc30QJ
	 MZ4/+GLTz9syR3/UGWP+nHwb3E/H5lGGtoCyrGXhk+5KFNTT8L43qs61D68cCni9E5
	 KDu8xIdEsu4Ta7qw4O/+7+7oHTPo6rRSUtxO8Ax/5vUZhcOmSZsUd57ybE8p0e6x3f
	 UznPtX8GCpnNog+3Y/bkl9Tg2KVEll0OqzJttw/rYJY8OtK4n759c8O8M92hNW/jX9
	 ELIj2cvNZFlgg==
Date: Sat, 13 Jun 2026 15:10:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/5] iio: adc: Add ti-ads1263-adc2 driver
Message-ID: <20260613151047.57cd074f@jic23-huawei>
In-Reply-To: <20260612-ads126x-v1-5-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
	<20260612-ads126x-v1-5-894c788d03ed@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-38405-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FB2467EBA4

On Fri, 12 Jun 2026 17:46:23 -0500
Kurt Borja <kuurtb@gmail.com> wrote:

> The TI ADS1263 includes an auxiliary, 24-bit, delta-sigma ADC (ADC2).
> ADC2 operation is independent of ADC1, with independent selections of
> input channel, reference voltage, sample rate, and channel gain
> 
> Add support for this ADC as an independent IIO device, through the
> auxiliary bus API.

A few things inline.

> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index b33505e7fdc7..1a4b2f934d43 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

> +static int ads1262_aux_device_setup(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	struct ads1263_adc2_channel *chans;
> +	struct auxiliary_device *adev;
> +	struct ads1263_adc2_ctx *ctx;
> +	struct fwnode_handle *node;
> +	int id, ret;
> +
> +	node = device_get_named_child_node(dev, "adc");
> +	if (!node)
> +		return 0;
> +
> +	ctx = kzalloc_obj(*ctx);
> +	if (!ctx) {
> +		ret = -ENOMEM;
> +		goto out_node_put;
> +	}
> +
> +	id = ida_alloc(&ads1262_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		ret = id;
> +		goto out_free_adc2;
> +	}
> +
> +	chans = kcalloc(st->num_channels, sizeof(*chans), GFP_KERNEL);
> +	if (!chans) {
> +		ret = -ENOMEM;
> +		goto out_free_id;
> +	}
> +
> +	for (unsigned int i = 0; i < st->num_channels; i++) {
> +		chans[i].negative_input = st->channels[i].negative_input;
> +		chans[i].positive_input = st->channels[i].positive_input;
> +	}
> +
> +	ctx->chip = st;
> +	ctx->num_channels = st->num_channels;
> +	ctx->channels = chans;
> +	ctx->enable = ads1263_adc2_enable;
> +	ctx->start = ads1263_adc2_start;
> +	ctx->stop = ads1263_adc2_stop;
> +	ctx->read = ads1263_adc2_read;
> +	mutex_init(&ctx->chan_lock);
devm_mutex_init()

> +
> +	adev = &ctx->adev;
> +	adev->name = "ads1263_adc2";
> +	adev->id = id;
> +	adev->dev.release = ads1262_aux_device_release;
> +	adev->dev.parent = dev;
> +	device_set_node(&adev->dev, no_free_ptr(node));
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		goto out_free_channels;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, ads1262_aux_device_destroy, adev);
> +
> +out_free_channels:
> +	kfree(chans);
> +out_free_id:
> +	ida_free(&ads1262_ida, id);
> +out_free_adc2:
> +	kfree(ctx);
> +out_node_put:
> +	fwnode_handle_put(node);
> +
> +	return ret;
> +}

> diff --git a/drivers/iio/adc/ti-ads1262.h b/drivers/iio/adc/ti-ads1262.h
> new file mode 100644
> index 000000000000..98697d771da3
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Texas Instruments ADS1262 ADC driver
> + *
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#ifndef _ADS1262_H_
> +#define _ADS1262_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/types.h>
> +
> +struct ads1263_adc2_channel {

As with earlier patch avoid bitfields where layout matters.
Better to just use defines for the field makss.

> +	/* ADC2CFG */
> +	u8 gain:3;
> +	u8 refmux:3;
> +	u8 data_rate:2;
> +
> +	/* ADC2MUX */
> +	u8 negative_input:4;
> +	u8 positive_input:4;
> +};
> +
> +struct ads1263_adc2_ctx {
> +	struct auxiliary_device adev;
> +	struct ads1262 *chip;
> +	/* Protects channel state */
> +	struct mutex chan_lock;
> +	struct ads1263_adc2_channel *channels;
> +	unsigned int num_channels;
> +	int (*enable)(struct ads1263_adc2_ctx *ctx,
> +		      const struct ads1263_adc2_channel *chan);
> +	int (*start)(struct ads1263_adc2_ctx *ctx);
> +	int (*stop)(struct ads1263_adc2_ctx *ctx);
> +	int (*read)(struct ads1263_adc2_ctx *ctx, __be32 *val);

I'm not sure I see this loose coupling as that useful. I'd just export the
functions from the other module and add them to this header.
Maybe I'm missing why you need this complexity.
> +};
> +
> +#endif
> diff --git a/drivers/iio/adc/ti-ads1263-adc2.c b/drivers/iio/adc/ti-ads1263-adc2.c
> new file mode 100644
> index 000000000000..d21f08bbd9ee
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1263-adc2.c

> +
> +static int ads1263_adc2_read_raw(struct iio_dev *indio_dev,
> +				 struct iio_chan_spec const *chan,
> +				 int *val, int *val2, long mask)
> +{
> +	struct ads1263_adc2 *st = iio_priv(indio_dev);
> +	struct ads1263_adc2_ctx *ctx = st->ctx;
> +	struct ads1263_adc2_channel *chan_data;
> +	u8 realbits;
> +	__be32 raw;
> +	u32 cnv;
> +	int ret;
> +
> +	chan_data = &st->ctx->channels[chan->scan_index];
> +	realbits = chan->scan_type.realbits;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = ads1263_adc2_channel_read(indio_dev, chan_data, &raw);
> +		if (ret)
> +			return ret;
> +
> +		cnv = be32_to_cpu(raw);
> +		cnv >>= chan->scan_type.shift;

Is that really an unaligned be24?  Might be better to handle it as such.

> +		*val = sign_extend32(cnv, realbits - 1);
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		u64 divd, divr, tmp, rem;
> +
> +		mutex_lock(&ctx->chan_lock);
> +		divd = st->vref_uV;
> +		divr = BIT_ULL(chan_data->gain + realbits - 1) * 1000;
> +		mutex_unlock(&ctx->chan_lock);
> +
> +		tmp = div64_u64(divd * 1000000000ULL, divr);
> +		*val = div64_u64_rem(tmp, 1000000000ULL, &rem);

NANO

> +		*val2 = rem;

> +static int
This is oddly different to formatting of most other functions.
static int ads1263_adc2_read_avail(struct iio_dev *indio_dev,
				   struct iio_chan_spec const *chan,
				   const int **vals, int *type,
				   int *length, long mask)
Seems to be under 80 chars + for this sort of thing, going a bit
over is fine anyway.

> +ads1263_adc2_read_avail(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan, const int **vals,
> +			int *type, int *length, long mask)
> +{
> +	switch (mask) {
> +	case IIO_CHAN_INFO_HARDWAREGAIN:
> +		*type = IIO_VAL_INT;
> +		*vals = ads1263_adc2_gain_avail;
> +		*length = ARRAY_SIZE(ads1263_adc2_gain_avail);
> +		return IIO_AVAIL_LIST;
> +
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*type = IIO_VAL_INT;
> +		*vals = ads1263_adc2_data_rate_avail;
> +		*length = ARRAY_SIZE(ads1263_adc2_data_rate_avail);
> +		return IIO_AVAIL_LIST;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ads1263_adc2_write_raw(struct iio_dev *indio_dev,
> +				  struct iio_chan_spec const *chan,
> +				  int val, int val2, long mask)
> +{
> +	struct ads1263_adc2 *st = iio_priv(indio_dev);
> +	struct ads1263_adc2_ctx *ctx = st->ctx;
> +	struct ads1263_adc2_channel *chan_data;
> +	unsigned int i;
> +
> +	chan_data = &ctx->channels[chan->scan_index];
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_HARDWAREGAIN:
> +		for (i = 0; i < ARRAY_SIZE(ads1263_adc2_gain_avail); i++) {
> +			if (val == ads1263_adc2_gain_avail[i])
> +				break;
> +		}
> +		if (i == ARRAY_SIZE(ads1263_adc2_gain_avail))
> +			return -EINVAL;
> +
> +		mutex_lock(&ctx->chan_lock);
> +		chan_data->gain = i;
> +		mutex_unlock(&ctx->chan_lock);
> +
> +		return 0;
> +
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		for (i = 0; i < ARRAY_SIZE(ads1263_adc2_data_rate_avail); i++) {
> +			if (val == ads1263_adc2_data_rate_avail[i])
> +				break;
> +		}
> +		if (i == ARRAY_SIZE(ads1263_adc2_data_rate_avail))
> +			return -EINVAL;
> +
> +		mutex_lock(&ctx->chan_lock);

Slightly nicer to add scope got each cases block and then do just guard() for these

> +		chan_data->data_rate = i;
> +		mutex_unlock(&ctx->chan_lock);
> +
> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ads1263_adc2_channel_hot_reload(st, chan);
> +}

> +
> +static int ads1263_adc2_channels_setup(struct iio_dev *indio_dev)
> +{
> +	struct ads1263_adc2 *st = iio_priv(indio_dev);
> +	struct device *dev = &st->ctx->adev.dev;
> +	struct ads1263_adc2_ctx *ctx = st->ctx;
> +	struct iio_chan_spec *chns;
> +	unsigned int i;
> +
> +	/* Account for the timestamp channel */
> +	chns = devm_kcalloc(dev, ctx->num_channels + 1, sizeof(*chns),
> +			    GFP_KERNEL);
> +	if (!chns)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ctx->num_channels; i++) {
> +		guard(mutex)(&ctx->chan_lock);
> +
> +		ctx->channels[i].refmux = st->refmux;
> +
> +		chns[i] = ads1263_adc2_iio_voltage_template;
Rather than using a template like this I'd just set it all here using
a designated initializer.  Means there is one place to see all the fields.

		chns[i] = (struct iio_chan_spec) {
			.type = IIO_VOLTAGE,
			.indexed = true,
			.differential = true, //not sure why this wasn't in your template.
			.channel = ctx->channels[i].positive_input;
			.channel2 = ctx->channels[i].negative_input;
			.scan_index = i,
			.scan_type = {
				.format = IIO_SCAN_FORMAT_SIGNED_INT,
				.realbits = 24,
				.storagebits = 32,
				.shift = 8,
				.endianness = IIO_BE,
			},
			.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
				BIT(IIO_CHAN_INFO_SCALE) |
				BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
				BIT(IIO_CHAN_INFO_SAMP_FREQ),
			.info_mask_shared_by_all_available = 
				BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
				BIT(IIO_CHAN_INFO_SAMP_FREQ),
		}
> +		chns[i].scan_index = i;
> +		chns[i].channel = ctx->channels[i].positive_input;
> +		chns[i].channel2 = ctx->channels[i].negative_input;
> +		chns[i].differential = true;
> +	}
> +
> +	chns[i] = (struct iio_chan_spec)
> +		IIO_CHAN_SOFT_TIMESTAMP(ctx->num_channels - 1);
That macro has recently become a designated intializer so
	chns[i] = IIO_CHAN_SOFT_TIMESTAMP(ctx->num_channels - 1);

> +	chns[i].scan_index = i;

Isn't this just overwriting the ctx->num_channels - 1 we just
passed in above?

> +
> +	indio_dev->num_channels = ctx->num_channels + 1;
> +	indio_dev->channels = chns;
> +
> +	return 0;
> +}

> +
> +static int ads1263_adc2_probe(struct auxiliary_device *auxdev,
> +			      const struct auxiliary_device_id *id)
> +{
> +	struct ads1263_adc2_ctx *ctx =
> +		container_of(auxdev, struct ads1263_adc2_ctx, adev);
> +	struct device *dev = &auxdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct ads1263_adc2 *st;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +	st->ctx = ctx;
> +	st->indio_dev = indio_dev;
> +
> +	ret = ads1263_adc2_regulator_setup(st);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name = (char *)id->driver_data;

See below.

> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &ads1263_adc2_iio_info;
> +	ret = ads1263_adc2_channels_setup(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
> +					      iio_pollfunc_store_time,
> +					      ads1263_adc2_trigger_handler,
> +					      &ads1263_adc2_buffer_ops);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static const struct auxiliary_device_id ads1263_adc2_auxiliary_match[] = {
> +	{ .name = "ti_ads1262.ads1263_adc2",
> +	  .driver_data = (kernel_ulong_t)"ads1263_adc2" },
	{
		.name = "ti_ads1262.ads1263_adc2",
	  	.driver_data = (kernel_ulong_t)"ads1263_adc2",

Though I really don't like forcing that cast in there and it should be irrelevant
given there is only one entry in this table.  Should be fine to just hard code that
where used.  If you need this later, wrap it in a structure.

	},

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, ads1263_adc2_auxiliary_match);



