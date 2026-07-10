Return-Path: <linux-gpio+bounces-39786-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUUiAb9UUGp4wwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39786-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 04:11:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0C736995
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 04:11:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cOCKyDgI;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39786-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39786-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E69302B752
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066BA29D260;
	Fri, 10 Jul 2026 02:10:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BAB22D4E9;
	Fri, 10 Jul 2026 02:10:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649448; cv=none; b=cV/1J/oYSpIuL+7ARaiQkeg/+nRpvjvh8+sbr8mXp2Gd5CS1gWO2EgTzbEuAHp2YYFNrKVVsS1EkdIzsKilO1iyb7UO1bS7IdtVOQNtxPG4BNgE60qAgL9iy+HIQ06oB8RunYpNqnD/DkKhIy7MyQNPcdUVOrY4YgyLER4x7dhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649448; c=relaxed/simple;
	bh=woq6WgXy9TfakaN1qZGNrx9DsmZmCvdY4fvu2f3tMHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A0O3iwRcRgYnkICJwtJs+iJWSsJ2iI/OZiY7dnURu/NKLIjDj36pCkgatA/5bvxN3aFTuEKUjErEyodLdi/sfJQx6j1V2ueDUyt4ghCv6GZi0/GuDVOyNX+VfK68aShAPbJrvmMPkeIqtw6Nb6btWbrnUPa/nidgZyxP+s3OE5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOCKyDgI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8092C1F000E9;
	Fri, 10 Jul 2026 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783649446;
	bh=nHCdTMtFEcwpxyUY8ehNZy9hqBWY0Y1eRe3jsHCgWSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cOCKyDgI0SLvi4MUk8cEEgmUfELxo7JkjDU9/q7xfYn+DBkMUq6TvPhcyr4FTFHFu
	 rV+UskIKR/KwGUmvi62XLYunsi6EgfZYW3ELEOs9cCn05bqO1z3rIu6z3YMNG95f55
	 YHt1T4wLCqaqcZVk1HTCsvGOlxD4USyeTsOWepcoMj0zL56GCaeJ86Gov5ru6VgqtJ
	 WaNCOIkflWRqbhxDATsaC85ZeUDj7gkqW4+2AteBT9LDZPEBHlstSsBLdi0afca22i
	 WjuLJvg02LVb+Mg0o/kDcjhhDJ6kjFrN4dc+ivPlTXSHzgLmXD5i9C0bHS+pNuqP0G
	 3i4nuJmolSo8w==
Date: Fri, 10 Jul 2026 03:10:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <jananisunil.dev@gmail.com>
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
Message-ID: <20260710031039.3d41982d@jic23-huawei>
In-Reply-To: <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
	<20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39786-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,baylibre.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jic23-huawei:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CF0C736995

On Thu, 9 Jul 2026 10:50:15 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add support for AD7768 4/8 channel,simultaneous sampling Sigma-Delta
> ADC, supporting configurable power modes, decimation filters and data
> output lines
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
Hi Janani.

Various things inline.

> ---
>  MAINTAINERS              |    1 +
>  drivers/iio/adc/Kconfig  |   16 +
>  drivers/iio/adc/Makefile |    1 +
>  drivers/iio/adc/ad7768.c | 1291 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1309 insertions(+)

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> new file mode 100644
> index 000000000000..f76a7081090e
> --- /dev/null
> +++ b/drivers/iio/adc/ad7768.c
> @@ -0,0 +1,1291 @@
...
> +
> +#define AD7768_AUX_DEV_GPIO_NAME	"gpio"

Can this just go inline?

> +#define AD7768_REG_GPIO_CONTROL		0x0E

> +/* AD7768_REG_POWER_MODE */
> +#define   AD7768_SLEEP_MODE_MSK			BIT(7)
> +#define   AD7768_POWER_MODE_POWER_MODE_MSK	GENMASK(5, 4)
> +#define   AD7768_POWER_MODE_POWER_MODE(x)	(((x) & 0x3) << 4)
> +#define   AD7768_POWER_MODE_GET_POWER_MODE(x)	(((x) >> 4) & 0x3)
> +#define   AD7768_POWER_MODE_MCLK_DIV_MSK	GENMASK(1, 0)
> +#define   AD7768_POWER_MODE_MCLK_DIV_MODE(x)	(((x) & 0x3) << 0)

FIELD_GET() inline. This define doesn't give us anything wrt
to readability over that.

> +
> +/* AD7768_REG_DATA_CONTROL */
> +#define   AD7768_DATA_CONTROL_SPI_RESET_MSK	GENMASK(1, 0)
> +#define   AD7768_DATA_CONTROL_SPI_RESET_1	0x03
> +#define   AD7768_DATA_CONTROL_SPI_RESET_2	0x02
> +#define   AD7768_DATA_CONTROL_SPI_SYNC_MSK	BIT(7)
> +#define   AD7768_DATA_CONTROL_SPI_SYNC		BIT(7)

No need for define, use FIELD_PREP(AD7768_DATA_CONTROL_SPI_SYNC_MASK, 1)
inline
> +#define   AD7768_DATA_CONTROL_SPI_SYNC_CLEAR	0
Not obvious why a define is needed for this. 
> +
> +/* AD7768_REG_INTERFACE_CFG */
> +#define   AD7768_INTERFACE_CFG_DCLK_DIV_MSK	GENMASK(1, 0)
> +#define   AD7768_INTERFACE_CFG_DCLK_DIV_MODE(x)	(4 - ffs(x))
> +#define   AD7768_MAX_DCLK_DIV			8
> +
> +#define   AD7768_INTERFACE_CFG_CRC_SELECT_MSK	GENMASK(3, 2)
> +/* only 4 samples CRC calculation support exists */

Exists where?  In the backend, or if the hardware. Good to be more specific.

> +#define   AD7768_INTERFACE_CFG_CRC_SELECT	FIELD_PREP(GENMASK(3, 2), 0x01)

> +/* AD7768_REG_PRECHARGE_BUF1 and 2*/
> +#define   AD7768_PRECHARGE_BUF1_MSK(val)	((val) & GENMASK(7, 0))
> +#define   AD7768_PRECHARGE_BUF2_MSK(val)	(((val) & GENMASK(15, 8)) >> 8)
> +#define   AD7768_4_PRECHARGE_BUF1_MSK(val)	((val) & GENMASK(3, 0))
> +#define   AD7768_4_PRECHARGE_BUF2_MSK(val)	(((val) & GENMASK(7, 4)) >> 4)


> +#define   AD7768_CALIB_REG_MSB_MASK(val)		(((val) & 0xFF0000) >> 16)

That seems unlikely to be the mask. It's the value. So just define the mask
and let FIELD_GET() deal with the shift.


> +#define   AD7768_CALIB_REG_MID_MASK(val)		(((val) & 0x00FF00) >> 8)
> +#define   AD7768_CALIB_REG_LSB_MASK(val)		((val) & 0x0000FF)
> +#define   AD7768_REV_ID_VAL			0x06


...
> +
> +static const unsigned int ad7768_4_available_datalines[] = {
> +	1, 4
> +};
> +
> +static const char * const ad7768_supply_names[] = {
> +	"avdd", "avss", "dvdd", "iovdd", "vref"
> +};

Add trailing commas to these.  They aren't terminated in
any way so in theory at least we might get more elements
on the next line.

> +
> +static int ad7768_regmap_read(void *context, const void *reg_buf,
> +			      size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct spi_device *spi = context;
> +	struct ad7768_state *st = spi_get_drvdata(spi);
> +	unsigned int reg;
> +	int ret;
> +	struct spi_transfer t[] = {
> +		{
> +			.tx_buf = &st->d16,
> +			.len = 2,
> +			.cs_change = 1,
> +		}, {
> +			.tx_buf = &st->d16,

Sashiko moaned about this.  Add a comment on why tx_buf is
set to the same thing.

> +			.rx_buf = &st->d16,
> +			.len = 2,
> +		},
> +	};
> +
> +	reg = *(const u8 *)reg_buf;
> +
> +	st->d16 = cpu_to_be16(AD7768_SPI_READ_CMD |
> +			      FIELD_PREP(AD7768_SPI_REG_MASK, reg));
> +
> +	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
> +	if (ret < 0)
> +		return ret;
> +
> +	*(u8 *)val_buf = FIELD_GET(AD7768_SPI_DATA_MASK, be16_to_cpu(st->d16));
I'd prefer seeing a local pointer variable for the correct size

	u8 *data_val = val_buf;
...

> +
> +	return ret;
> +}

> +
> +static int ad7768_read_calib_value(struct ad7768_state *st,
> +				   unsigned int base_reg, int *val)
> +{
> +	unsigned int msb, mid, lsb;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = regmap_read(st->regmap, base_reg + 0, &msb);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(st->regmap, base_reg + 1, &mid);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(st->regmap, base_reg + 2, &lsb);
> +	if (ret)
> +		return ret;
> +
> +	*val = (msb << 16) | (mid << 8) | lsb;

No bulk read?  

> +
> +	return 0;
> +}


> +static unsigned int ad7768_get_max_mode_freq(const struct ad7768_state *st,
> +					     unsigned int mode,
> +					     unsigned int mode_freq)
> +{
> +	unsigned int max_freq = 0;
> +	unsigned int i, freq;
> +
> +	for (i = 0; i < AD7768_NUM_CHANNEL_MODES; i++) {
> +		if (!(st->active_modes & BIT(i)))
> +			continue;
> +
> +		freq = i == mode ? mode_freq : st->mode_freq[i];
> +		if (freq > max_freq)
> +			max_freq = freq;
		max_freq = max(max_freq, freq);

> +	}
> +
> +	return max_freq;
> +}
> +
> +static int ad7768_set_sampling_freq(struct iio_dev *indio_dev,
> +				    unsigned int freq, unsigned int ch)
> +{
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	unsigned int mode = st->chn_mode[ch];
> +	int ret = 0;

Always set before use so don't init.

> +	unsigned int max_freq;
> +
> +	if (!freq)
> +		return -EINVAL;
> +
> +	guard(mutex)(&st->lock);
> +
> +	max_freq = ad7768_get_max_mode_freq(st, mode, freq);
> +
> +	ret = ad7768_set_clk_divs(st, max_freq, ch);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad7768_set_channel_decimation(st, freq, ch);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad7768_sync(st);
> +	if (ret)
> +		return ret;
> +
> +	st->mode_freq[mode] = freq;

blank line before simple returns like this one.

> +	return 0;
> +}

> +
> +static int ad7768_read_raw(struct iio_dev *indio_dev,
> +			   const struct iio_chan_spec *chan,
> +			   int *val, int *val2, long info)
> +{

...

> +	case IIO_CHAN_INFO_PHASE:
> +		if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
> +			base_reg = AD7768_REG_PHASE(chan->address);
> +		else
> +			base_reg = AD7768_4_REG_PHASE(chan->address);
> +
> +		ret = regmap_read(st->regmap, base_reg, val);

As below. Check units.

> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ad7768_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int val, int val2, long info)
> +{
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	unsigned int base_reg;
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return ad7768_set_sampling_freq(indio_dev, val, chan->channel);
> +
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		return ad7768_write_calib_value(st,
> +			ad7768_get_calib_reg_base(st, chan, false), val);

Probably use a local variable for the reg base as you do for
phase so you can align easily after the (

> +
> +	case IIO_CHAN_INFO_CALIBSCALE:
> +		return ad7768_write_calib_value(st,
> +			ad7768_get_calib_reg_base(st, chan, true), val);
> +
> +	case IIO_CHAN_INFO_PHASE:
> +		if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
> +			base_reg = AD7768_REG_PHASE(chan->address);
> +		else
> +			base_reg = AD7768_4_REG_PHASE(chan->address);
> +
> +		return regmap_write(st->regmap, base_reg, val);

Is val in the units the ABI expects? Seems unlikely given that's radians.


> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +
> +static int ad7768_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +
> +	pm_runtime_mark_last_busy(&st->spi->dev);

Look up what the next call does.

> +	pm_runtime_put_autosuspend(&st->spi->dev);
> +	return 0;
> +}

> +
> +static void ad7768_set_available_sampl_freq(struct ad7768_state *st)
> +{
> +	unsigned int mode;
> +	unsigned int dec;
> +	unsigned int mclk = clk_get_rate(st->mclk);
> +	struct ad7768_avail_freq *avail_freq;
> +
> +	for (mode = 0; mode < AD7768_NUM_POWER_MODES; mode++) {
	for (unsigned int mode = 0;  
> +		avail_freq = &st->avail_freq[mode];
> +		for (dec = ARRAY_SIZE(ad7768_dec_rate); dec > 0; dec--) {

for (unsigned int dec = ...


> +			struct ad7768_freq_config freq_cfg;
> +
> +			freq_cfg.dec_rate = dec - 1;
> +			freq_cfg.freq = mclk / (ad7768_dec_rate[dec - 1] *
> +					ad7768_mclk_div[mode]);
> +			avail_freq->freq_cfg[avail_freq->n_freqs++] = freq_cfg;
> +		}
> +	}
> +
> +	/* The max frequency is not supported in one data line configuration */
> +	if (st->datalines == 1)
> +		st->avail_freq[AD7768_FAST_MODE].n_freqs--;
> +}
> +
> +static int ad7768_gpio_adev_init(struct ad7768_state *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	struct auxiliary_device *adev;
> +	int id;
> +
> +	if (!device_property_read_bool(dev, "gpio-controller"))
> +		return 0;
> +
> +	id = (st->spi->controller->bus_num << 8) | spi_get_chipselect(st->spi, 0);

Why that particular ID?  Add some comment.

> +	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME,
> +					      AD7768_AUX_DEV_GPIO_NAME,
> +					      (void *)st->chip_info->name, id);

Why is the cast to void * needed?  Suggests perhaps the type is wrong for name.


> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to create GPIO auxiliary device\n");
> +
> +	return 0;
> +}

> +
> +static int ad7768_configure_precharge_buffers(struct iio_dev *indio_dev,
> +					      struct ad7768_precharge_config *precharge_cfg)
> +{
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	int ret;
> +	u8 ch;
> +	u8 prebuf1_val, prebuf2_val;

Prefer reverse xmas tree where the ordering isn't really enforced by anything else.

> +	u16 prebuf_mask = 0;
> +	u8 refbufp_val = 0;
> +	u8 refbufn_val = 0;
> +
> +	if (st->chip_info->num_channels == AD7768_MAX_CHANNEL) {

This match is odd. Encode what you need in chip_info, don't use the
number of channels as a place holder for which chip it is.
Maybe via a callback, or maybe via data. I haven't messed around
with it to see how bad the data version is (masks etc)

> +		for (ch = 0; ch < indio_dev->num_channels; ch++) {
> +			u8 channel = indio_dev->channels[ch].channel;
> +
> +			if (precharge_cfg[channel].prebufp_en)
> +				prebuf_mask |= AD7768_PREBUF_POS_EN(channel);
> +
> +			if (precharge_cfg[channel].prebufn_en)
> +				prebuf_mask |= AD7768_PREBUF_NEG_EN(channel);
> +
> +			if (precharge_cfg[channel].refbufp)
> +				refbufp_val |= BIT(channel);
> +
> +			if (precharge_cfg[channel].refbufn)
> +				refbufn_val |= BIT(channel);
> +		}
> +
> +		prebuf1_val = AD7768_PRECHARGE_BUF1_MSK(prebuf_mask);
> +		prebuf2_val = AD7768_PRECHARGE_BUF2_MSK(prebuf_mask);
> +	} else {
> +		for (ch = 0; ch < indio_dev->num_channels; ch++) {
> +			u8 channel = indio_dev->channels[ch].channel;
> +
> +			if (precharge_cfg[channel].prebufp_en)
> +				prebuf_mask |= AD7768_PREBUF_POS_EN(channel);
> +
> +			if (precharge_cfg[channel].prebufn_en)
> +				prebuf_mask |= AD7768_PREBUF_NEG_EN(channel);
> +
> +			if (precharge_cfg[channel].refbufp)
> +				refbufp_val |= ad7768_4_get_refbuf(channel);
> +
> +			if (precharge_cfg[channel].refbufn)
> +				refbufn_val |= ad7768_4_get_refbuf(channel);
> +		}
> +
> +		prebuf1_val = AD7768_4_PRECHARGE_BUF1_MSK(prebuf_mask);
> +		prebuf2_val = AD7768_4_PRECHARGE_BUF2_MSK(prebuf_mask);
> +	}
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_PRECHARGE_BUF1, prebuf1_val);
Mentioned below, but if (ret) is more appropriate for regmap calls because...
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_PRECHARGE_BUF2, prebuf2_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_REFP_BUF, refbufp_val);
> +	if (ret < 0)
> +		return ret;
> +

If ret did go positive ever the following would treat it differently to
every other call.

> +	return regmap_write(st->regmap, AD7768_REG_REFN_BUF, refbufn_val);
> +}

> +
> +static struct iio_chan_spec_ext_info ad7768_ext_info[] = {
> +	IIO_ENUM("filter_type", IIO_SEPARATE,
> +		 &ad7768_filter_types_enum),
> +	IIO_ENUM_AVAILABLE("filter_type", IIO_SEPARATE, &ad7768_filter_types_enum),
> +	{ },

No trailing comma on a terminating entry like that one.


> +};
> +
> +static const struct iio_chan_spec ad7768_channel_template = {
> +	.type = IIO_VOLTAGE,
> +	.info_mask_separate =	BIT(IIO_CHAN_INFO_CALIBBIAS) |
> +				BIT(IIO_CHAN_INFO_CALIBSCALE) |
> +				BIT(IIO_CHAN_INFO_PHASE) |
> +				BIT(IIO_CHAN_INFO_SAMP_FREQ),
> +	.indexed = 1,
> +	.scan_type = {
> +		.sign = 's',
> +		.realbits = 24,
> +		.storagebits = 32,
> +	},
> +	.ext_info = ad7768_ext_info,
> +};
> +
> +static void ad7768_init_chan(struct iio_chan_spec *chan, unsigned int channel)
> +{
> +	*chan = ad7768_channel_template;
I'd replace where this is called with
		chan[chan_idx] = (struct iio_chan_spec) {
			.type = IIO_VOLTAGE,
etc.
  Generally ends up easier to read than a template and modify.

> +	chan->address = channel;
> +	chan->channel = channel;
> +	chan->scan_index = channel;
> +}
> +
> +static int ad7768_parse_config(struct iio_dev *indio_dev,
> +			       struct device *dev)
> +{
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	const unsigned int *available_datalines;
> +	struct ad7768_precharge_config precharge_cfg[AD7768_MAX_CHANNEL] = {};

Trivial but { }; would be my preference for style of that.

> +	struct iio_chan_spec *chan;
> +	unsigned int num_channels;
> +	unsigned int channel;
> +	unsigned int i, len, vcm_sel, vcm_pd, ch_mode, pwr_mode;

What you combine and what you don't combine here seems a bit random. Maybe
take another look and see if there is a more logical combination.
(or maybe this makes sense after a later patch, in which case ignore
this comment).

> +	int chan_idx = 0;
> +	int ret;
> +
> +	num_channels = device_get_child_node_count(dev);
> +

Given following is a check on the value returned, no blank line here would
keep that association more obvious.

> +	if (!num_channels || num_channels > st->chip_info->num_channels)
> +		return dev_err_probe(dev, -EINVAL, "Invalid number of channels\n");
> +
> +	chan = devm_kcalloc(indio_dev->dev.parent, num_channels,
> +			    sizeof(*chan), GFP_KERNEL);
> +	if (!chan)
> +		return -ENOMEM;
> +
> +	indio_dev->channels = chan;
> +	indio_dev->num_channels = num_channels;
> +
> +	ret = regmap_write(st->regmap, AD7768_REG_CH_STANDBY,
> +			   GENMASK(st->chip_info->num_channels - 1, 0));
> +	if (ret < 0)
> +		return ret;

regmap is always 0 or negative, so these can be if (ret)

> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &channel);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to parse reg property of %pfwP\n", child);
> +
> +		if (channel >= st->chip_info->num_channels)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid channel number %d\n", channel);

maybe put "from firmware" in that error message.

> +
> +		ret = regmap_update_bits(st->regmap, AD7768_REG_CH_STANDBY,
> +					 BIT(channel), 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = fwnode_property_read_u32(child, "adi,ch-mode", &ch_mode);

David covered this when reviewing the binding. There is quite a bit of precedence
of smaller sets of config registers than channels. Usually we just make it a userspace
thing and fail if too many configs are requested.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to parse property adi,ch-mode %pfwP\n",
> +					     child);

> +
> +	ret = regmap_update_bits(st->regmap,
> +				 AD7768_REG_GENERAL_CONFIG,
> +				 AD7768_GEN_CONFIG_VCM_PD,
> +				 vcm_pd ? AD7768_GEN_CONFIG_VCM_PD : 0);

regmap_assign_bits()

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = device_property_match_property_string(&st->spi->dev,
> +						    "adi,power-mode",
> +						    ad7768_power_mode_str,
> +						    ARRAY_SIZE(ad7768_power_mode_str));
> +	if (ret < 0) {
> +		if (ret != -ENODATA)

Check for device property existing before reading it. Avoids need for caring
about the specific return value.

	if (device_property_present()) {
		ret = device_property_match...
...
	} else {
		pwr_mode = AD7768_LOW_POWER_MODE;
	}

> +			return dev_err_probe(&st->spi->dev, ret,
> +					     "Invalid \"adi,power-mode\" property\n");
> +
> +		pwr_mode = AD7768_LOW_POWER_MODE;
> +	} else {
> +		pwr_mode = ret;
> +	}
> +
> +	ret = ad7768_set_power_mode(indio_dev, pwr_mode);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set power mode\n");
> +
> +	for (i = 0; i < indio_dev->num_channels; i++) {
> +		ret = ad7768_set_sampling_freq(indio_dev, st->sampling_freq,
> +					       indio_dev->channels[i].channel);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to set sampling freq for channel %d\n",
> +					     indio_dev->channels[i].channel);
> +	}
> +
> +	available_datalines = st->chip_info->available_datalines;
> +	len = st->chip_info->num_datalines;
> +
> +	for (i = 0; i < len; i++) {
> +		if (available_datalines[i] == st->datalines)
> +			return 0;
I'd be tempted to not do something so specific to it being the last bit
of the function and keep the error case as clearly out of line.
		if (...)
			break;
	}
	if (i == len)
		return dev_err_probe();

	return 0;
> +	}
> +
> +	return dev_err_probe(&st->spi->dev, -EINVAL,

use dev

> +			     "Invalid data-lines-number %d for %s\n",
> +			     st->datalines, st->chip_info->name);
> +}
> +
> +static int ad7768_reset(struct ad7768_state *st)
> +{
> +	struct reset_control *reset_ctrl;
> +	int ret;
> +
> +	reset_ctrl = devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(reset_ctrl))
> +		return PTR_ERR(reset_ctrl);
> +
> +	if (reset_ctrl) {
> +		ret = reset_control_assert(reset_ctrl);
> +		if (ret)
> +			return ret;

Probably do need a delay of some type here. See if you can find anything in the
data sheet on what it should be (sashiko)

> +
> +		ret = reset_control_deassert(reset_ctrl);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = regmap_write(st->regmap, AD7768_REG_DATA_CONTROL,
> +				   AD7768_DATA_CONTROL_SPI_RESET_1);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(st->regmap, AD7768_REG_DATA_CONTROL,
> +				   AD7768_DATA_CONTROL_SPI_RESET_2);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* ADC start-up time after reset: 1.66 ms max (datasheet Table 1) */
> +	fsleep(2000);
> +
> +	return 0;
> +}
> +
> +static int ad7768_probe(struct spi_device *spi)
> +{

...

> +	ret = devm_iio_backend_enable(dev, st->back);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +
> +	ret = devm_pm_runtime_enable(dev);

I'm fairly sure the sashiko comment here is incorrect but do check it.

> +	if (ret)
> +		return ret;
> +
> +	indio_dev->setup_ops = &ad7768_buffer_ops;
> +
> +	ret = ad7768_gpio_adev_init(st);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static int ad7768_runtime_suspend(struct device *dev)
> +{
> +	struct ad7768_state *st = dev_get_drvdata(dev);
> +
> +	return regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
> +				  AD7768_SLEEP_MODE_MSK,
> +				  AD7768_SLEEP_MODE_MSK);

regmap_set_bits()

> +}
> +
> +static int ad7768_runtime_resume(struct device *dev)
> +{
> +	struct ad7768_state *st = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
> +				 AD7768_SLEEP_MODE_MSK, 0);

regmap_clear_bits()

> +	if (ret)
> +		return ret;



