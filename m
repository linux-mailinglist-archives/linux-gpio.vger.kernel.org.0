Return-Path: <linux-gpio+bounces-32735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCjEGsxjrGlApQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:43:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E322D0E0
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7C43012265
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDEE3385A1;
	Sat,  7 Mar 2026 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1TpsEIm0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699133556E
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772905416; cv=none; b=ui7Gam04puo8yCz2c6oWZMY1R5xhPztmIkEJD5+aigKLBzI3A6yCQ7/W+jfIWeEDBhOOPe63/GRAbhcLLpr5CG4GpNqdXwWchS27z2qtVGu8p/QpbfdKTHQEykJUVb6awTl5d2xKe2shLjAkd1pQE/enO2BmqPiD/Vq1x6QP1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772905416; c=relaxed/simple;
	bh=tr3p0PTcxBuivh7N96rweUQQ9Gz4LSzHd362mmpnOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQ2JxSTyW5W2zuOfNz0ycv410PvRqS8N9TJ5xN57qsNcJ+aXsFAmlN0Qmg5R1m71IIV7glMFJTWF3s171NAm/xIQZYlZekV3r6Ob26epBFHj8pd6Qy0VByQqN8vthO9DUaIdE8n/93C8neI/Di1kuXcCjH5W4ZfqxvqdNeK8Bo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1TpsEIm0; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c3896e32so5650158a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 09:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772905414; x=1773510214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFhakp+HczB4woBZn1FB3ZG86sZEhfSMF0Ogqoecu3o=;
        b=1TpsEIm0pN9LaPZsRxiotl1Z1hcidj1wq/uStCvVIRCusKzdaau/vHIEj+xOvqh6wZ
         V89pUfEPr0o8wz13Lj2OzynbAX+r5j6wthhu4H+2oKrRzbaMeSdHoluxZoDFaMIbBqcJ
         m+Lf0QIuWsJYlIaRN0H+hmkoShy+ykY2tWG+nS4jUzcsMuZc4KkBz28JkgJgnXLBy29U
         369cQk941BHSm7wP1NbwxuBnBXXJDMDMAiJlDx/rPI82Wpf7VzjyQjpLApB1BrPAcmcQ
         VAxf8sAYWFMpW9/CWTqEMWn4eCqd1zWQUXUU00xdzCgYwONEveWpezHJ/FxWl1CdC3ri
         VmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772905414; x=1773510214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFhakp+HczB4woBZn1FB3ZG86sZEhfSMF0Ogqoecu3o=;
        b=vbVxS6OaPPGL9rxWxxi3pE7FH/QtgHePISpRt0P6i0VydMwhXDuWrznA5fsGVrvAWh
         zfx7vW5LkYwVJuiF5LmF79+uOfc7Fp1S7S1PNs5XLneL/5JH7dngsDwmeWfc2ZsPgtXr
         Oq5u+p2UGtL6gf6wAFHtlzSXiw7TdfjRe0JVj/2BfOujKxjNu1DOnkcgIjUwKDjKtDHs
         f8XVFf7RzYNakxOsugHBA1DdI/z2n4WT9ej5oqCHnUvw1sIjczLn7GFnY4yAiT4dOEVm
         IV6EsRu8HLaKkOZ7y/LpNFUSEV+VdIPDempI91t/54XvFbSQgLwAJlTsiakjhVsmjBSs
         N2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv0nVFYvB2bpX1YHBPqC7kxTHBuO8dSIg47lRORkbmScSOxngOWyeJ06qhfid5ue3SJ3rVx7SeRs3I@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLPmNhN4qGfw/Mh7L8MmxklLyp4/z8N+miIaqyt9m+1c20wRj
	yW9tmz365V4CuAoot0To448l1HPYi/A042yRZIghiPGhgLE9MmSRwsrJTwiWBGiElsk=
X-Gm-Gg: ATEYQzwrFwjqyucWg3pwYZDLQeRqa7Kl2tZhtAVAyrWv6TCq5qe+bZ+qJUJO44Ji5xv
	Yte8UuObJWfc00g5Im+EAPHvoAYnzu6QcB9jyaaJmzFAr3TqhGMM63VuImXAFQ7bpwc4xAnlkBn
	+a4yhg/dZ9tSFwNfkTc1Pe36c5Et/zDEKtl+UAxLD6FxtepOxucIJSsDO6xwDGFl4S9lTjwwWXK
	ZB7YFQ4IvOhNcjO6AfUQ/IKQovQywWtR7P4T/RtkXZ9MVnaNqq4/44ZL4mZlntvwBqgwh3eP/Yj
	Q8kmcfSnUhSvXWcY4+tRw/QsAOxmcvS+y3ap7ipdhiSsMVs0OVc/zRM1TJCyYzsbgJ/Kbnwoi1Q
	jFRgoveQt6cm+AQTtPH08RC6oo6llC3J6EuEJlevC31VatejIP+m+D/JvNmmJAzfE+4w5zXJY5x
	VoobFn6ieX68Dc70pVehGCFJqQHsocmo9TT7cTd7FiS9PnkJQa0IhtJ4waoyLOLT/dZoQ5pNwen
	Q==
X-Received: by 2002:a05:6830:838c:b0:7c7:58e9:8e16 with SMTP id 46e09a7af769-7d726f5daf1mr3850525a34.14.1772905414081;
        Sat, 07 Mar 2026 09:43:34 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d728d2eef0sm3316571a34.24.2026.03.07.09.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 09:43:33 -0800 (PST)
Message-ID: <27ffa24d-a388-46eb-8df7-04624cd32ea1@baylibre.com>
Date: Sat, 7 Mar 2026 11:43:32 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
To: Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
 <20260307114947.0b946dfb@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260307114947.0b946dfb@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D46E322D0E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32735-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 3/7/26 5:49 AM, Jonathan Cameron wrote:
> On Thu, 05 Mar 2026 11:21:56 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
>> The regulator is enabled for the entire time the driver is bound to the
>> device, and we only need to access it to fetch voltage, which can be
>> done at probe time.
>>
>> Switch to using devm_regulator_get_enable_read_voltage() which
>> simplifies probing and unbinding code.
>>
>> Suggested-by: David Lechner <dlechner@baylibre.com>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Hi.
> 
> I think this broke the ACPI case (where regulator isn't available).
> 
> Jonathan
> 
>> ---
>>  drivers/iio/adc/ti-ads7950.c | 45 +++++++++++---------------------------------
>>  1 file changed, 11 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
>> index 273c35e03185..847e83baa876 100644
>> --- a/drivers/iio/adc/ti-ads7950.c
>> +++ b/drivers/iio/adc/ti-ads7950.c
>> @@ -341,19 +341,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
>>  	return st->single_rx;
>>  }
>>  
>> -static int ti_ads7950_get_range(struct ti_ads7950_state *st)
>> +static unsigned int ti_ads7950_get_range(struct ti_ads7950_state *st)
>>  {
>> -	int vref;
>> -
>> -	if (st->vref_mv) {
>> -		vref = st->vref_mv;
>> -	} else {
>> -		vref = regulator_get_voltage(st->reg);
>> -		if (vref < 0)
>> -			return vref;
>> -
>> -		vref /= 1000;
>> -	}
>> +	unsigned int vref = st->vref_mv;
>>  
>>  	if (st->cmd_settings_bitmask & TI_ADS7950_CR_RANGE_5V)
>>  		vref *= 2;
>> @@ -382,11 +372,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
>>  
>>  		return IIO_VAL_INT;
>>  	case IIO_CHAN_INFO_SCALE:
>> -		ret = ti_ads7950_get_range(st);
>> -		if (ret < 0)
>> -			return ret;
>> -
>> -		*val = ret;
>> +		*val = ti_ads7950_get_range(st);
>>  		*val2 = (1 << chan->scan_type.realbits) - 1;
>>  
>>  		return IIO_VAL_FRACTIONAL;
>> @@ -580,30 +566,24 @@ static int ti_ads7950_probe(struct spi_device *spi)
>>  	spi_message_init_with_transfers(&st->scan_single_msg,
>>  					st->scan_single_xfer, 3);
>>  
>> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
>> +	if (ret < 0)
> 
> I think you need to check for -ENODEV and if you see than then
> see if the acpi route below applies.  Otherwise on ACPI this will fail
> and we'll fail the probe.
> 

Or do something like:

	if (ACPI_COMPANION(&spi->dev)) {
		ret = devm_regulator_get_enable(&spi->dev, "vref");
		if (ret)
			return dev_err_probe(&spi->dev, ret,
					     "Failed to get regulator \"vref\"\n");

 		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
	} else {

		ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
		if (ret < 0)
			return dev_err_probe(&spi->dev, ret,
					     "Failed to get regulator \"vref\"\n");

		st->vref_mv = ret / 1000;
	}

> 
>> +		return dev_err_probe(&spi->dev, ret,
>> +				     "Failed to get regulator \"vref\"\n");
>> +
>>  	/* Use hard coded value for reference voltage in ACPI case */
>>  	if (ACPI_COMPANION(&spi->dev))
>>  		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
>> +	else
>> +		st->vref_mv = ret / 1000;
> 
> 


