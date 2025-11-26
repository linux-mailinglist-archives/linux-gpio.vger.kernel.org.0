Return-Path: <linux-gpio+bounces-29076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC6C89926
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 12:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E89F54EA19B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510F02C0265;
	Wed, 26 Nov 2025 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFAfN93u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981832F83DB
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157209; cv=none; b=DhG11WJtXcgmRSLVVXYjSppedRWwKrqtzy+GCKBSIsVrsz1ZFWSzJVTct7ZgDnAZDGaH71qsuUKQI5zCTr8CQWxKmh8Yo47sy0dXPfIGuVwoa0eB/qKurF0oPrsaOIhjrTRMx2vOHrjTosaoLnlZ6zAMTN3af3C6pmRcRWtwMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157209; c=relaxed/simple;
	bh=jHKAKgyPg3W/G8524ABvZ+B58swKOBhVrdFUeoI8x+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC+GCF6lEpf9wTelfFQA+gjMTp9U8HXETC9gi/5yhPqLhsoChsPmmBPFIbAb9q8kanNcQBNfV7XdP7uWWDaM1xkuK8xFy61U2X9dV9JzX8QM/PbZ9SftBFFu0pCVp2En2YWsbxLXp7IS85df1BKslhsRwDirdFotAsYM/TPaZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFAfN93u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b379cd896so3669034f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 03:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764157203; x=1764762003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80bh3XWCt9HrtGnwRb5ljnRsELmreFDRBDJ96f4NaMY=;
        b=VFAfN93uVQuI2ssUPxV/pXzYoKRAfM/GjuYJg0s6w/PHC5BcR7fAX/Zh4SOY9CBDEJ
         A3QeS5yx0Umr3MsQKEZRmjP8ivsFHJmNMH7vFq3M5X/jExxf8bTIlMd9q/QwSLjia2Ac
         odLjKW9sBwFsh8rMrHmso1F5ZcwadQWfoD4UWi74EiSujGdkuKcE187yKV/7aoSEXZ5S
         jf5nYwrZa+xlDb7RhysBYAgzfmHp1+zYVQgG+uB+EttKsWvABPWg4ZeSpIAcBu7zsncm
         Mbwgu4Cueet95L0+lFJOY1wfdre9BKaUAoieoFpSJsClGHNbqDDjgy2vbNf+sT3ipCqa
         TY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157203; x=1764762003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80bh3XWCt9HrtGnwRb5ljnRsELmreFDRBDJ96f4NaMY=;
        b=m/YjggaYNZOsFOQyT58xsoN/bSXx3tprikAUrilSkHm5u7nROPU4ziRjovm88H4mm7
         trK+qvfrIaNMDbSl7XE2sjmhAZ0ptdCcwD3Mx2K6SutGEGBkQUMtw/y0Ut3oIQe3oREd
         Xk8s1rVuraSrFDrJUvpFJ6z7OsKTyew38KDS34mG/CL/Z9oyQDKCMkiBNqQsSWyLxhie
         PqUHeI6vEVfVDVp2bivbdxOmCSelJLvq7k31+xivZX5JoCsX5gCAW6nvy7/baWqVhpl1
         BEFqEjuS3zVf+nyOsEodvX8Q4uDpyAA8wa99tINEnmhy0iFd5ba+hlZr+PIEdIYQXri+
         6ixA==
X-Forwarded-Encrypted: i=1; AJvYcCXG++znr/d1v3RUv+ccoZtzt/ENfYn/A1yB/hvEPsqDQnlcqrZmnuFF2DB7l84kz5Ab9Jh5ZyBgQRcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JzOEYLGel5dfz+TGT9rxuBPuzfOBH5BT7Ykz9axtM8gqJrQE
	iRTajDFJrb+a3873pUNIcqGnoFgzL0ujdnRQcQdvE7aOKJJDxhisaEHu
X-Gm-Gg: ASbGncthKNiKpd7laXjIun2hSzhpPlnRYNjw8EWb9tjK64ekyDm+URBjarD3rZseQ3+
	fZTmMKofpJgDPSty74MRAzTXbL/ymL2yGzzEipAIbRU7JxVqRVvjiYmDrDo67/+aJG2KDwIZgQW
	Xc2UJbOUOvvrFun5gS2hT3Qz5Oq8QW83XNHp1ry2Wsiayud0nMqvvN2IV4WZl3TtkpRbbd0ceUQ
	O72N4qdjXCIhaBhuJ5QZ8alAZDbvequHo1J5KjX3ghpVz2vD2PkBrDf6h5iQ1kien1OB20KNDVR
	OOGRafM/etgBCqBNIN6+takI3KDLwOHTVPfhHmd5oxK7g9QJD6foS4lpyUx2lypScGBLt3aB+lR
	8LA6UrSYLRq7nmuHPrV9yedJVG7ZDXpxnlgRE1kk+T5wNgSab8UK+yd6UWQXJTwe/UVj/HRzIJR
	HIM6DKlqaRbAa3r6hx7KAxb+eCZlNxHq+SoEFmkvhuegIUXVtSLWYuTaSJ15MDfP2G9qALXfTQq
	U/JCw==
X-Google-Smtp-Source: AGHT+IHzturO050/1zg7Fbh3okV6QiNTnsU5AaJIWtQPP/hc6hDFzi5kyxPzq+8eudXbHxbbzMjGLg==
X-Received: by 2002:a05:6000:401e:b0:427:690:1d84 with SMTP id ffacd0b85a97d-42cc1d0ce5bmr18273783f8f.32.1764157202441;
        Wed, 26 Nov 2025 03:40:02 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:123e:4501:1025:ba00:55dc:4ccc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8c47sm41757015f8f.38.2025.11.26.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:40:02 -0800 (PST)
Date: Wed, 26 Nov 2025 12:40:00 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/9] iio: adc: Add support for ad4062
Message-ID: <aslj3klmv6heyyhgltzewkdze5p4c3hlkzfbxbfnzwwgd375gv@m6iqpst5sv6b>
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-3-a375609afbb7@analog.com>
 <aSQxiSoZcI_ol3S5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSQxiSoZcI_ol3S5@smile.fi.intel.com>

On Mon, Nov 24, 2025 at 12:20:57PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 10:18:02AM +0100, Jorge Marques wrote:
> > The AD4060/AD4062 are versatile, 16-bit/12-bit, successive approximation
> > register (SAR) analog-to-digital converter (ADC) with low-power and
> > threshold monitoring modes.
> 
> ...
> 
Hi Andy,
> > +#define AD4062_SOFT_RESET	0x81
> 
> The grouping seems a bit strange. Haven't you forgotten a blank line here?
> Ditto for other similar cases.
> 
Ack.
> > +#define AD4060_MAX_AVG		0x7
> > +#define AD4062_MAX_AVG		0xB
> 
> > +#define AD4062_MON_VAL_MAX_GAIN		1999970
> 
> This is decimal...
> 
> > +#define AD4062_MON_VAL_MIDDLE_POINT	0x8000
> 
> ...and this is hexadecimal. Can you make these consistent?
> Also, is there any explanation of the number above? To me
> it looks like 2000000 - 30. Is it so? Or is this a fraction
> number multiplied by 1000000 or so? In any case some elaboration
> would be good to have.
> 
Since this is not a magic number, I will use directly below.
It MAX_MON_VAL/MON_VAL_MIDDLE_POINT = 0xFFFF/0x8000
> > +#define AD4062_GP_DRDY		0x2
> > +#define AD4062_INTR_EN_NEITHER	0x0
> > +#define AD4062_TCONV_NS		270
> 
> ...
> 
> > +struct ad4062_state {
> > +	const struct ad4062_chip_info *chip;
> > +	const struct ad4062_bus_ops *ops;
> > +	enum ad4062_operation_mode mode;
> > +	struct completion completion;
> > +	struct iio_trigger *trigger;
> > +	struct iio_dev *indio_dev;
> > +	struct i3c_device *i3cdev;
> > +	struct regmap *regmap;
> > +	u16 sampling_frequency;
> > +	int vref_uv;
> > +	int samp_freqs[ARRAY_SIZE(ad4062_conversion_freqs)];
> > +	u8 oversamp_ratio;
> > +	union {
> > +		__be32 be32;
> > +		__be16 be16;
> > +		u8 bytes[4];
> > +	} buf __aligned(IIO_DMA_MINALIGN);
> > +	u8 reg_addr_conv;
> 
> Can't we group u8:s to save a few bytes of memory?
> 
Sure

  struct ad4062_state {
  	// ...
  	union {
  		__be32 be32;
  		__be16 be16;
  		u8 bytes[4];
  	} buf __aligned(IIO_DMA_MINALIGN);
  	u16 sampling_frequency;
  	u8 oversamp_ratio;
  	u8 reg_addr_conv;
  };

> > +};
> 
> ...
> 
> > +static int ad4062_set_oversampling_ratio(struct ad4062_state *st, unsigned int val)
> > +{
> > +	int ret;
> > +
> > +	if (val < 1 || val > BIT(st->chip->max_avg + 1))
> 
> in_range() ?
> 
> 	in_range(val, 1, GENMASK(st->chip->max_avg, 0))
> 
> if I am not mistaken. Also note, the GENMASK() approach makes possible
> to have all 32 bits set, however it's most unlikely to happen here anyway.
> 
Sure, but requires locals to not trigger suspicious usage of sizeof.
  	// ...
  	const u32 _max = GENMASK(st->chip->max_avg, 0);
  	const u32 _min = 1;
  	int ret;
  
  	if (in_range(val, _min, _max))
> > +		return -EINVAL;
> > +
> > +	/* 1 disables oversampling */
> > +	val = ilog2(val);
> > +	if (val == 0) {
> > +		st->mode = AD4062_SAMPLE_MODE;
> > +	} else {
> > +		st->mode = AD4062_BURST_AVERAGING_MODE;
> > +		ret = regmap_write(st->regmap, AD4062_REG_AVG_CONFIG, val - 1);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +	st->oversamp_ratio = BIT(val);
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_get_oversampling_ratio(struct ad4062_state *st,
> > +					 unsigned int *val)
> > +{
> > +	int ret, buf;
> > +
> > +	if (st->mode == AD4062_SAMPLE_MODE) {
> > +		*val = 1;
> > +		return 0;
> > +	}
> 
> > +	ret = regmap_read(st->regmap, AD4062_REG_AVG_CONFIG, &buf);
> > +	return 0;
> 
> This is strange piece of code. Why do we have ret at all?
> Please, try to compile kernel also with `make LLVM=1 W=1 ...`
> assuming you have clang installed. It catches such issues quite
> well.
> 
Can return directly yes.
> > +}
> 
> ...
> 
> > +static int ad4062_calc_sampling_frequency(int fosc, unsigned int n_avg)
> > +{
> > +	/* See datasheet page 31 */
> > +	u64 duration = div_u64((u64)(n_avg - 1) * NSEC_PER_SEC, fosc) + AD4062_TCONV_NS;
> > +
> > +	return DIV_ROUND_UP_ULL(NSEC_PER_SEC, duration);
> 
> Why u64?
> 
> The DIV_ROUND_UP_ULL() seems an overkill here. Or do you expect duration be
> more than 4 billions?
> 
This is necessary since at fosc 111 Hz and avg 4096 it does take longer
than 4 seconds, even though I do timeout after 1 seconds in the raw
acquisition.
> > +}
> > +
> > +static int ad4062_populate_sampling_frequency(struct ad4062_state *st)
> > +{
> > +	for (int i = 0; i < ARRAY_SIZE(ad4062_conversion_freqs); i++)
> 
> Why signed iterator?
> 
Ack, can be u8.
> > +		st->samp_freqs[i] = ad4062_calc_sampling_frequency(ad4062_conversion_freqs[i],
> > +								   st->oversamp_ratio);
> 
> Perhaps
> 
> 		st->samp_freqs[i] =
> 			ad4062_calc_sampling_frequency(ad4062_conversion_freqs[i],
> 						       st->oversamp_ratio);
> 
> But I am not insisting on this case and similar.
> 
> 
Ack.
> > +	return 0;
> > +}
> 
> > +static int ad4062_get_sampling_frequency(struct ad4062_state *st, int *val)
> > +{
> > +	*val = ad4062_calc_sampling_frequency(ad4062_conversion_freqs[st->sampling_frequency],
> > +					      st->oversamp_ratio);
> 
> Oh, temporary variable makes this better for readability.
> 
Ack.
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_check_ids(struct ad4062_state *st)
> > +{
> 
> 	struct device *dev = &st->i3cdev->dev;
> 
Ack.
> > +	int ret;
> > +	u16 val;
> > +
> > +	ret = regmap_bulk_read(st->regmap, AD4062_REG_PROD_ID_1,
> > +			       &st->buf.be16, sizeof(st->buf.be16));
> > +	if (ret)
> > +		return ret;
> > +
> > +	val = get_unaligned_be16(st->buf.bytes);
> > +	if (val != st->chip->prod_id)
> > +		dev_warn(&st->i3cdev->dev,
> > +			 "Production ID x%x does not match known values", val);
> 
> 		dev_warn(dev, "Production ID x%x does not match known values", val);
> 
Ack.
> > +	ret = regmap_bulk_read(st->regmap, AD4062_REG_VENDOR_H,
> > +			       &st->buf.be16, sizeof(st->buf.be16));
> > +	if (ret)
> > +		return ret;
> > +
> > +	val = get_unaligned_be16(st->buf.bytes);
> > +	if (val != AD4062_I3C_VENDOR) {
> > +		dev_err(&st->i3cdev->dev,
> > +			"Vendor ID x%x does not match expected value\n", val);
> 
> 		dev_err(dev, "Vendor ID x%x does not match expected value\n", val);
> 
Ack.
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_soft_reset(struct ad4062_state *st)
> > +{
> > +	u8 val = AD4062_SOFT_RESET;
> > +	int ret;
> > +
> > +	ret = regmap_write(st->regmap, AD4062_REG_INTERFACE_CONFIG_A, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Wait AD4062 treset time */
> > +	fsleep(5000);
> 
> 5 * USEC_PER_MSEC
> 
> This gives a hint on the units without even a need to comment or look somewhere
> else.
>
// TODO
Since the device functional blocks are powered when voltage is supplied,
here we can stick with the treset datasheet value 60ns (ndelay(60)).
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_request_irq(struct iio_dev *indio_dev)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	struct device *dev = &st->i3cdev->dev;
> > +	int ret;
> > +
> > +	ret = fwnode_irq_get_byname(dev_fwnode(&st->i3cdev->dev), "gp1");
> > +	if (ret == -EPROBE_DEFER) {
> > +		return ret;
> 
> > +	} else if (ret < 0) {
> 
> Redundant 'else'
> 
Ack.
> > +		ret = regmap_update_bits(st->regmap, AD4062_REG_ADC_IBI_EN,
> > +					 AD4062_REG_ADC_IBI_EN_CONV_TRIGGER,
> > +					 AD4062_REG_ADC_IBI_EN_CONV_TRIGGER);
> > +	} else {
> > +		ret = devm_request_threaded_irq(dev, ret,
> > +						ad4062_irq_handler_drdy,
> > +						NULL, IRQF_ONESHOT, indio_dev->name,
> > +						indio_dev);
> > +	}
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +static const int ad4062_oversampling_avail[] = {
> > +	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096,
> 
> It's not easy to count them at glance, please add a comment with indices.
> 
Ack, will use
  static const int ad4062_oversampling_avail[] = {
          BIT(0), BIT(1), BIT(2), BIT(3), BIT(4), BIT(5), BIT(6), BIT(7), BIT(8),
  	BIT(9), BIT(10), BIT(11), BIT(12),
  };
> > +};
> 
> ...
> 
> > +static int ad4062_read_avail(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan, const int **vals,
> > +			     int *type, int *len, long mask)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> > +		*vals = ad4062_oversampling_avail;
> > +		*len = ARRAY_SIZE(ad4062_oversampling_avail);
> > +		*type = IIO_VAL_INT;
> > +
> > +		return IIO_AVAIL_LIST;
> > +	case IIO_CHAN_INFO_SAMP_FREQ:
> > +		ret = ad4062_populate_sampling_frequency(st);
> > +		if (ret)
> > +			return ret;
> > +		*vals = st->samp_freqs;
> > +		*len = st->oversamp_ratio != 1 ? ARRAY_SIZE(ad4062_conversion_freqs) : 1;
> 
> Why not using positive conditional?
> 
> Funny trick that Elvis operator can be used in this case, but please don't,
> it will make code harder to follow.
> 
Ack.
> > +		*type = IIO_VAL_INT;
> > +
> > +		return IIO_AVAIL_LIST;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> 
> ...
> 
> > +static int ad4062_get_chan_scale(struct iio_dev *indio_dev, int *val, int *val2)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	const struct iio_scan_type *scan_type;
> > +
> > +	scan_type = iio_get_current_scan_type(indio_dev, st->chip->channels);
> > +	if (IS_ERR(scan_type))
> > +		return PTR_ERR(scan_type);
> > +
> > +	*val = (st->vref_uv * 2) / MILLI;
> 
> It's most likely (MICRO / MILLI) instead of MILLI. Am I right?
> 
Sure.
> > +	*val2 = scan_type->realbits - 1; /* signed */
> > +
> > +	return IIO_VAL_FRACTIONAL_LOG2;
> > +}
> 
> ...
> 
> > +static int ad4062_get_chan_calibscale(struct ad4062_state *st, int *val, int *val2)
> > +{
> > +	u16 gain;
> > +	int ret;
> > +
> > +	ret = regmap_bulk_read(st->regmap, AD4062_REG_MON_VAL,
> > +			       &st->buf.be16, sizeof(st->buf.be16));
> > +	if (ret)
> > +		return ret;
> > +
> > +	gain = get_unaligned_be16(st->buf.bytes);
> > +
> > +	/* From datasheet: code out = code in × mon_val/0x8000 */
> > +	*val = gain / AD4062_MON_VAL_MIDDLE_POINT;
> 
> > +	*val2 = mul_u64_u32_div(gain % AD4062_MON_VAL_MIDDLE_POINT, NANO,
> > +				AD4062_MON_VAL_MIDDLE_POINT);
> 
> I don't see the need for 64-bit division. Can you elaborate what I miss here?
> 
> > +	return IIO_VAL_INT_PLUS_NANO;
> > +}
> 
Can be improved to

  static int ad4062_get_chan_calibscale(struct ad4062_state *st, int *val, int *val2)
  {
  	int ret;
  
  	ret = regmap_bulk_read(st->regmap, AD4062_REG_MON_VAL,
  			       &st->buf.be16, sizeof(st->buf.be16));
  	if (ret)
  		return ret;
  
  	/* From datasheet: code out = code in × mon_val/0x8000 */
  	*val = get_unaligned_be16(st->buf.bytes) * 2;
  	*val2 = 16;
  
  	return IIO_VAL_FRACTIONAL_LOG2;
  }
> ...
> 
> > +static int ad4062_set_chan_calibscale(struct ad4062_state *st, int gain_int, int gain_frac)
> 
> Forgot to wrap this line.
> 
ack
> > +{
> > +	u64 gain;
> > +	int ret;
> > +
> > +	if (gain_int < 0 || gain_frac < 0)
> > +		return -EINVAL;
> > +
> > +	gain = mul_u32_u32(gain_int, MICRO) + gain_frac;
> 
> > +
> 
> Redundant blank line.
> 
Ack.
> > +	if (gain > AD4062_MON_VAL_MAX_GAIN)
> > +		return -EINVAL;
> > +
> > +	put_unaligned_be16(DIV_ROUND_CLOSEST_ULL(gain * AD4062_MON_VAL_MIDDLE_POINT,
> > +						 MICRO),
> > +			   st->buf.bytes);
> 
> Also in doubt here about 64-bit division.
> 
This can be slightly improved to

  static int ad4062_set_chan_calibscale(struct ad4062_state *st, int gain_int,
  				      int gain_frac)
  {
  	u32 gain;
  	int ret;
  
  	if (gain_int < 0 || gain_frac < 0)
  		return -EINVAL;
  
  	gain = gain_int * MICRO + gain_frac;
  	if (gain > 1999970)
  		return -EINVAL;
  
  	put_unaligned_be16(DIV_ROUND_CLOSEST_ULL((u64)gain * AD4062_MON_VAL_MIDDLE_POINT,
  						 MICRO),
  			   st->buf.bytes);
  
  	ret = regmap_bulk_write(st->regmap, AD4062_REG_MON_VAL,
  				&st->buf.be16, sizeof(st->buf.be16));
  	if (ret)
  		return ret;
  
  	/* Enable scale if gain is not equal to one */
  	return regmap_update_bits(st->regmap, AD4062_REG_ADC_CONFIG,
  				  AD4062_REG_ADC_CONFIG_SCALE_EN_MSK,
  				  FIELD_PREP(AD4062_REG_ADC_CONFIG_SCALE_EN_MSK,
  					     !(gain_int == 1 && gain_frac == 0)));
  }

To provide the enough resolution to compute every step (e.g., 0xFFFF and
0xFFFE) with the arbitrary user input.

> > +	ret = regmap_bulk_write(st->regmap, AD4062_REG_MON_VAL,
> > +				&st->buf.be16, sizeof(st->buf.be16));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable scale if gain is not one. */
> 
> "...is not equal to one."
> 
> Also be consistent with the style for one-line comments. Choose one and
> use it everywhere. Usual cases:
> - my one-line comment
> - My one-line comment
> - My one-line comment.
> 
Ack.
> 
> > +	return regmap_update_bits(st->regmap, AD4062_REG_ADC_CONFIG,
> > +				  AD4062_REG_ADC_CONFIG_SCALE_EN_MSK,
> > +				  FIELD_PREP(AD4062_REG_ADC_CONFIG_SCALE_EN_MSK,
> > +					     !(gain_int == 1 && gain_frac == 0)));
> > +}
> 
> ...
> 
> > +static int __ad4062_read_chan_raw(struct ad4062_state *st, int *val)
> 
> Can be named without leading double underscore? Preference is to use
> the suffix, like _no_pm (but you can find better one).
> 
Since there is one usage of this method, can be merged into ad4062_read_chan_raw.
> > +{
> > +	struct i3c_device *i3cdev = st->i3cdev;
> > +	struct i3c_priv_xfer t[2] = {
> > +		{
> > +			.data.out = &st->reg_addr_conv,
> > +			.len = sizeof(st->reg_addr_conv),
> > +			.rnw = false,
> > +		},
> > +		{
> > +			.data.in = &st->buf.be32,
> > +			.len = sizeof(st->buf.be32),
> > +			.rnw = true,
> > +		}
> > +	};
> > +	int ret;
> > +
> > +	reinit_completion(&st->completion);
> > +	/* Change address pointer to trigger conversion */
> > +	ret = i3c_device_do_priv_xfers(i3cdev, &t[0], 1);
> 
> Why array? Just split them on per transfer and use separately. This gives a bit
> odd feeling that the two goes together, but no. They are semi-related as we
> have a special condition after the first one.
> 
For this commit sure, but in the next a fallback method is introduced
for when the gp1 gpio line is not connected.
There are two register to trigger and read samples:

* write CONV_READ -> read dummy value - [conversion] -> read value -> [conv ...
* write CONV_TRIGGER - [conversion] -> read value -> write ...

The first allows almost twice the sampling frequency, but does not work
with the fallback because In-Band-Interrupt for CONV_READ are not
yielded.

> > +	if (ret)
> > +		return ret;
> > +	/*
> > +	 * Single sample read should be used only for oversampling and
> > +	 * sampling frequency pairs that take less than 1 sec.
> > +	 */
> > +	ret = wait_for_completion_timeout(&st->completion,
> > +					  msecs_to_jiffies(1000));
> > +	if (!ret)
> > +		return -ETIMEDOUT;
> > +
> > +	ret = i3c_device_do_priv_xfers(i3cdev, &t[1], 1);
> > +	if (ret)
> > +		return ret;
> > +	*val = get_unaligned_be32(st->buf.bytes);
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_read_raw_dispatch(struct ad4062_state *st, int *val, int *val2,
> > +				    long info)
> 
> The parameters are split in a logical way here...
> 
> (however preference is
> 
> static int ad4062_read_raw_dispatch(struct ad4062_state *st,
> 				    int *val, int *val2, long info)
> 
> to fit 80 characters)
> 
> ...
Ack.
> 
> > +static int ad4062_read_raw(struct iio_dev *indio_dev,
> > +			   struct iio_chan_spec const *chan, int *val,
> > +			   int *val2, long info)
> 
> ...but here. Why not
> 
> static int ad4062_read_raw(struct iio_dev *indio_dev,
> 			   struct iio_chan_spec const *chan,
> 			   int *val, int *val2, long info)
> 
> ?
> 
Ack.
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	if (info == IIO_CHAN_INFO_SCALE)
> > +		return ad4062_get_chan_scale(indio_dev, val, val2);
> > +
> > +	if (!iio_device_claim_direct(indio_dev))
> > +		return -EBUSY;
> > +
> > +	ret = ad4062_read_raw_dispatch(st, val, val2, info);
> > +
> > +	iio_device_release_direct(indio_dev);
> > +	return ret ? ret : IIO_VAL_INT;
> 
> 	return ret ?: IIO_VAL_INT;
> 
> > +}
> 
> ...
Ack.
> 
> > +static int ad4062_debugfs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
> > +				     unsigned int writeval, unsigned int *readval)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	if (readval)
> > +		ret = regmap_read(st->regmap, reg, readval);
> > +	else
> > +		ret = regmap_write(st->regmap, reg, writeval);
> > +
> > +	return ret;
> 
> Do you expand this in the following patches? If not, ret is not needed.
> Just return directly.
> 
Not anymore, will just return.
> > +}
> 
> ...
> 
> > +static int ad4062_regulators_get(struct ad4062_state *st, bool *ref_sel)
> > +{
> > +	struct device *dev = &st->i3cdev->dev;
> > +	int ret;
> > +
> > +	ret = devm_regulator_get_enable(dev, "vio");
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "Failed to enable vio voltage\n");
> > +
> > +	st->vref_uv = devm_regulator_get_enable_read_voltage(dev, "ref");
> > +	*ref_sel = st->vref_uv == -ENODEV;
> 
> _uV ?
> 
Ack.
> > +	if (st->vref_uv < 0 && st->vref_uv != -ENODEV) {
> 
> You already has the second part
> 
> 	if (st->vref_uV < 0 && !*ref_sel) {
> 
> I believe this is better to understand as we check that ref_sel is not chosen.
> 
Ack.
> > +		return dev_err_probe(dev, st->vref_uv,
> > +				     "Failed to enable and read ref voltage\n");
> 
> > +	} else if (st->vref_uv == -ENODEV) {
> 
> Redundant 'else'
> 
> 	if (*ref_sel) {
> 
> (also in similar way as above)
> 
> I don't know if the above was asked specifically, but if so, I ask
> the requestor(s) to reconsider.
> 
Ack. Asked for returning error first, good path return 0 and not return
ret;
> > +		st->vref_uv = devm_regulator_get_enable_read_voltage(dev, "vdd");
> > +		if (st->vref_uv < 0)
> > +			return dev_err_probe(dev, st->vref_uv,
> > +					     "Failed to enable and read vdd voltage\n");
> > +	} else {
> > +		ret = devm_regulator_get_enable(dev, "vdd");
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "Failed to enable vdd regulator\n");
> > +	}
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ad4062_runtime_resume(struct device *dev)
> > +{
> > +	struct ad4062_state *st = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = regmap_clear_bits(st->regmap, AD4062_REG_DEVICE_CONFIG,
> > +				AD4062_REG_DEVICE_CONFIG_POWER_MODE_MSK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	fsleep(4000);
> 
> 4 * USEC_PER_MSEC, also would be good to add a comment for this long delay.
> 
Will add
	/* Wait device functional blocks to power up */
Based on hardware tests, I can drop to 2 * USEC_PER_MSEC, lower than
that the device is not ready to switch to acquisition mode for
conversions.
> > +	return 0;
> > +}
> 
> ...
> 
> > +static DEFINE_RUNTIME_DEV_PM_OPS(ad4062_pm_ops, ad4062_runtime_suspend,
> > +				 ad4062_runtime_resume, NULL);
> 
> I think the logical split is slightly better:
> 
> static DEFINE_RUNTIME_DEV_PM_OPS(ad4062_pm_ops,
> 				 ad4062_runtime_suspend, ad4062_runtime_resume, NULL);
> 
> OR
Ack.
> 
> static DEFINE_RUNTIME_DEV_PM_OPS(ad4062_pm_ops,
> 				 ad4062_runtime_suspend,
> 				 ad4062_runtime_resume,
> 				 NULL);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Best Regards,
Jorge

