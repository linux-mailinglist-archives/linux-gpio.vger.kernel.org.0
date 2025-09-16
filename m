Return-Path: <linux-gpio+bounces-26189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF5B58D06
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 06:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C0F1BC4FAA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 04:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CA623F421;
	Tue, 16 Sep 2025 04:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOkH/q82"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460052222C5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 04:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757998089; cv=none; b=okz5eY/HLb9MJKfZ8ViFCLvutL52mN9SXHGGbpzlLPpNnyOTxwMF89AKl4UDD1q/LgHEQvaSuoQlZZ4cP3abj4gg+8zOEdYViLiHzONztlg/4H/SEqMs6Oe6PdgFZNk28CXK3mM4jOEgeDk/T4wprW7rQKMiTNX7ttFXIc0ImN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757998089; c=relaxed/simple;
	bh=4lljxmCPotEpCOZhE7upKppTMYl9dHu/d2b81w17SEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/GXTtLfuJ/Ye5nYMiB8gyStdvS+3LtzP6C78oviLB+ma0pD/OzTbMEtzIM1bOpMYkE/caEWY4EfhT8Ovby3SM9R0S/PPOoNXmUoyzx0Uw+EWY7661wD1KIUhMo2SLHSonzaHLJb5U8/eUEYjalqJj86NcwsqXK5HVy80mM0vr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOkH/q82; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso5867611e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 21:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757998085; x=1758602885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nva31CQb9RnyQWaIyMrnWR4lvFSnR44SZz1OrBIg3bw=;
        b=mOkH/q82NRjqy6+0jm7e27z0/deUYJZHoFFGa6b7ewSKl1beyBCmJEPj3besC2vufb
         IPV0XQuV+XyRnjatgOwReU0Xu4dTvRJiiXRgw/LlIoSlFmbt+TMTksTbzMlWGcGtJB/Y
         tktH2rSyfAKIcVVDxTL4mwCOHXV7WvNtGTFahChQa4R11qiMego+ljmD6d7IiDTnpBnV
         05Ae+x8goyOyQvdFjIJjhjVQc6dF2F8bmEHEDn3nMhwMvidhB04oF1w40OiZehJwrLcj
         ew+M1slSleRkpF0tUOk12llcpm0s7sjzdY0gnpFg4uM4ndmfQ1iU8vQCI1MLHvo78RrH
         7nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757998085; x=1758602885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nva31CQb9RnyQWaIyMrnWR4lvFSnR44SZz1OrBIg3bw=;
        b=j0fqtTme9Gxcg2C3uD8TMXKkMBbjB8LAMp0rhT6JIBZl4+dI3SpXSPxcuzh+vT9puu
         I2KrWofCeermQQ44ALrddbEasCAyc5Jb2elgQBriXc4yLNNFxSWD5ArNGkS0RlUDGpQa
         Rq/RI7HZdQ1lW5qdUxVYLChE2zBVWtmIAFICcKRtqCj0Fe1bQogOD2hExnnbUBykUqcS
         hLrLp8BggLRm3UI1Ux0fweTHt7v9wLwJfnRDVpc8fOH7As6Q+oyldpXbh5yI0ahBLuBX
         FLLyOeJ+NN1lJE/vNTweOnS7ihld5Ft6U0HM7nNQLAdsMdvAb4DB3HKoVatFKERk1e9+
         x+5w==
X-Forwarded-Encrypted: i=1; AJvYcCU1ecRe+uBg0Co181N0+OSlH1nSLXphOVl57Ru2FgO+htNTl/Jch3RpZwl4TnJgvJj97YUS3hk50leY@vger.kernel.org
X-Gm-Message-State: AOJu0YySUI+7jbpMCRubSGu1U4uoaTew8X0GTwXQYzUs/CuLKhjFwsS8
	YOiSLzDwtFLrOU9VMfxdVH2zf2sctKNkehbjPuLWe1ErOk4tyDKRWk+SRJbEHgC5
X-Gm-Gg: ASbGncv7mCuW0am1AAFFgbi5Vw1iEGl6XuEPneGrj2Zg9uDcDRXeyQ/SpLT/tUbOwdH
	VMVbhv8e7BK4p307yZysSOweFV2tOsUfdE8HXwLOOnMxN56HmtqvF1x5NdxfzW0ifhKjeaQkE6H
	UzonDh25b2urNsXwC0zMzvFCuSF3CrLEeh5I89kUyLVhS4QqlG0Wdk6O9a0jQ/v7vezxSiQPgzz
	NYvq9+8l9bR/Wuyv5pl5Xs2q9zIucyVufMDQIPDQ3l1AmKyj89PYqWXYwiy6iMrDWFSR/rPoTL7
	sxLVBeHQ2pnG9TtEIi4Xzidg2vlQoIyaWp3Ld0pfdQ2Jzwer+ItPkANmNxBUR/CiahDjoSfno/I
	9z4UNwOvX4OO9eSMeakt8407RGVg4DNr+Vlr1ygPYsn4HhYw2keMw6ANht+7070kFqalPlzzWgb
	EVbkZj
X-Google-Smtp-Source: AGHT+IHo4ALErq+Xx1bjNqpiiFLemDYjjyezLrlBYACjFEDZuKcuTSOA/KJFI2YP161fK5ZvVyw5EA==
X-Received: by 2002:a19:6a13:0:b0:56a:4f7:6756 with SMTP id 2adb3069b0e04-5704a3e6c5cmr3236714e87.9.1757998085119;
        Mon, 15 Sep 2025 21:48:05 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460d4b5sm4179446e87.97.2025.09.15.21.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 21:48:04 -0700 (PDT)
Message-ID: <0b97adc3-4d77-480f-ace9-a53403c62216@gmail.com>
Date: Tue, 16 Sep 2025 07:48:03 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250915-bd79112-v5-0-a74e011a0560@gmail.com>
 <20250915-bd79112-v5-2-a74e011a0560@gmail.com>
 <aMge0jYwYCiY72Yb@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <aMge0jYwYCiY72Yb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 17:12, Andy Shevchenko wrote:
> On Mon, Sep 15, 2025 at 10:12:43AM +0300, Matti Vaittinen wrote:
>> The ROHM BD79112 is an ADC/GPIO with 32 channels. The channel inputs can
>> be used as ADC or GPIO. Using the GPIOs as IRQ sources isn't supported.
>>
>> The ADC is 12-bit, supporting input voltages up to 5.7V, and separate I/O
>> voltage supply. Maximum SPI clock rate is 20 MHz (10 MHz with
>> daisy-chain configuration) and maximum sampling rate is 1MSPS.
>>
>> The IC does also support CRC but it is not implemented in the driver.
> 
> ...
> 
>> +static int bd79112_probe(struct spi_device *spi)
>> +{
>> +	struct bd79112_data *data;
>> +	struct iio_dev *iio_dev;
>> +	struct iio_chan_spec *cs;
>> +	struct device *dev = &spi->dev;
>> +	unsigned long gpio_pins, pin;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	iio_dev = devm_iio_device_alloc(dev, sizeof(*data));
>> +	if (!iio_dev)
>> +		return -ENOMEM;
>> +
>> +	data = iio_priv(iio_dev);
>> +	data->spi = spi;
>> +	data->dev = dev;
>> +	data->map = devm_regmap_init(dev, NULL, data, &bd79112_regmap);
>> +	if (IS_ERR(data->map))
>> +		return dev_err_probe(dev, PTR_ERR(data->map),
>> +				     "Failed to initialize Regmap\n");
>> +
>> +	ret = devm_regulator_get_enable_read_voltage(dev, "vdd");
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
> 
>> +	data->vref_mv = ret / 1000;
> 
> I still think moving to _mV is the right thing to do.
> There is no 'mv' in the physics for Volts.

I can see you think so :) For me it doesn't look good. This is in-kernel 
C-code not physics textbook. For the kernel C it has been convention to 
_not_ use capital letters (or CamelCase) for variables. This convention 
is strong enough reason for me to avoid mV in a variable name because 
the capital letter instantly requires my attention and makes me need to 
consider if this is "just a variable". What comes to the vref_mv, there 
really are no true downside. It is clear what the _mv suffix denotes and 
"there is no 'mv' in physics" is really an artificial problem.

>> +	ret = devm_regulator_get_enable(dev, "iovdd");
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable I/O voltage\n");
>> +
>> +	data->read_xfer[0].tx_buf = &data->read_tx[0];
>> +	data->read_xfer[0].len = sizeof(data->read_tx);
>> +	data->read_xfer[0].cs_change = 1;
>> +	data->read_xfer[1].rx_buf = &data->read_rx;
>> +	data->read_xfer[1].len = sizeof(data->read_rx);
>> +	spi_message_init_with_transfers(&data->read_msg, data->read_xfer, 2);
> 
>> +	devm_spi_optimize_message(dev, spi, &data->read_msg);
> 
> And if it fails?..

I am not really sure under what conditions this would fail. Without 
taking a further look at that - then we just use unoptimized SPI 
transfers(?). Could warrant a warning print though.

Thanks for taking a look at this again :)

Yours,
	-- Matti




