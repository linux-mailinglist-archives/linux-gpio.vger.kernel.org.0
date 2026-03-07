Return-Path: <linux-gpio+bounces-32739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PMPOnxprGnPpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:07:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4A22D292
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 19:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F0D7301ECEE
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 18:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361B36BCE4;
	Sat,  7 Mar 2026 18:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YvnOzOXT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88C36B06F
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772906865; cv=none; b=NpSrVDdkI6kXDVbQyWjXRl30qrj6dCLK+i1J5bysoOuquWjdkBf7PTPFf2CTv5Oj1o0zkj7ClfQ5F8yX5+UQF8hOrm23BcI6nVEbM/v0bRAX+qOsFvI0p0Hrb9FWooUyUig1clPo4vOwqSkvrDTbF0SXK3QLprM9J9KUTbggTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772906865; c=relaxed/simple;
	bh=AjLmyyV1IqIcyjL94dLV+Q8gDTyZ2Fibz1qd//sD39I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SepbD+jVkGPagO1GuoZ6buGGB8CFLINZHPtAZSSzsFFy3KQBj06vyQKNGhihF+t4vK8J/J8nZ3yEg0iyNgk8eU30QmtG8A+t+kPozX9oXqqQbO/Fh+UIAjG9+IKnzq+Dg2y0q4libhHqa/LxIlZqCqBWh82RS3KtxesWgJAKDYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YvnOzOXT; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c7d04890so8767132a34.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772906862; x=1773511662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6QvxCwB+7fa0QyFkBuDXBSyOMIgNW/h6j55oZ+anGw=;
        b=YvnOzOXT0lF6IVBeCMAnopIOYk4uHBRJIAeaTxGK39TPdjCPODGgFXvJMsKfRWM5E4
         6au/CiBvW7WL21ZntcX8nkiOASxQWr9yn9Vi4l/yqr+qFKiuzJb97gz+3uHTeC5+iaBB
         a+t/fQ3qFvqUthKCvZa/AK78VC4GU+V5n+USVeleQDdqLKhjm3eHWsXxKLzFt3aW2+K1
         fpeCFSnirUQO19nX4hBGfhVLGdKVQsnBgbztAs8yVFuMTy10/Jtsj9Pr1nAYf3ktzcb6
         SY55UZm6c0w9Lm//9jH4pQ1+AAzne4W4s8hd79g9hm/kWm0BOUhFFh/yrkndBcRAhmYR
         mMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772906862; x=1773511662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6QvxCwB+7fa0QyFkBuDXBSyOMIgNW/h6j55oZ+anGw=;
        b=POfP6vtnoc8q6o1zSzIIwondN/JrkaLtRHBKMUDwwqoFmOFHWlmhTKC4WJ8Aj0JETZ
         wZRVwO2cPqjRn3SSxReIXL+MpQ8ULyEGBF42tTVcsh9uqdCHKQ3ckAnBsoM3Xhp3KxUP
         gw2aMcKkBDzhzf/F+dX7MM69pi42oUOawDiSJPLRkGSseiBndY2G1gKFXPs22e8ifrGd
         9UEqLrXPyHKLQi31rn/tTQV1wJkFaVTbuX+0FqoM8hiXgZ8tgpFO0ZWbRy4c5W0CwaZn
         wQYf6rg6/ZS3NBToGF9O82x+HorT2bZ0X3fGGgC1+2wG24H9crfuQEidbYmmsnVw0LzB
         fU1w==
X-Forwarded-Encrypted: i=1; AJvYcCXJGLSKkmO5pskOyRpSTxHBENG+pDH1oNgkQOcx/RWwGJY5ueJWUkAz1IeupW2DCWz61rFBCXoJvpcW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywttf0Lyvemekc31U6Fi4ONPADkRFwxCmxCTHpi7SwCnlWMTFXD
	lJ8GGLRg8NdNN/FpjhWlK5zJtmBdsXdczm+WsIM+FeVLn5+W11OTFcB7+b4Wt2r4hCo=
X-Gm-Gg: ATEYQzwogzBhiY6wp3TJrvUomcouhT160VR/zLPIABsqWC66WdNwYU3Gb/9lcpnkwew
	/QcP9xJxLykq9LdzmU5qalVViPZ/y5d+EfX/GWsm/QT6RY2nV+6nJF4x0Slz0edYkN7p4y5aPLJ
	PepWL3XKpW4OYDw25Wr52cImw0cVC5VIgQqec2JFuhblqiH0k/EJjGXWjB31gMcdli0ojwLz2qg
	kHYu35ztuWF4su8kD+yjIkpO7CgUhOh2HZgjf1zoC983mzNOG0089qc8ErnNOtPmPp4FQ2KiVtk
	DDkA5CGZlmozrjAWj5TfddvLOIDb8I5Z8DSuDqGxP97MsnSdDmGjLgQgGX6m2PlV5ddVxU8TyWZ
	bzfs3aWQz8cT75SySH+sS7aEFXC3v4AnT7Uso/F6SnHfsEh9LgnVlhwZKNds+/KY0dPZazEnorh
	CdXUhr4PR134x4s9qEowTf3CGZgwFl7tL5Mv6orgb4DXyPdXsQnAyJZnKL2mXPCM1Hw8o3OcOGB
	Q==
X-Received: by 2002:a05:6830:6d13:b0:7cf:d168:1ef3 with SMTP id 46e09a7af769-7d726f8dbdamr4635225a34.23.1772906861727;
        Sat, 07 Mar 2026 10:07:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d728d2eef0sm3351152a34.24.2026.03.07.10.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 10:07:41 -0800 (PST)
Message-ID: <9b63f0d2-24e6-4215-958c-42cb9d2e5536@baylibre.com>
Date: Sat, 7 Mar 2026 12:07:40 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
 <20260307114947.0b946dfb@jic23-huawei>
 <27ffa24d-a388-46eb-8df7-04624cd32ea1@baylibre.com>
 <aaxoIWL7NIa-2VkU@google.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aaxoIWL7NIa-2VkU@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8DE4A22D292
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32739-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Action: no action

On 3/7/26 12:04 PM, Dmitry Torokhov wrote:
> On Sat, Mar 07, 2026 at 11:43:32AM -0600, David Lechner wrote:
>> On 3/7/26 5:49 AM, Jonathan Cameron wrote:
>>> On Thu, 05 Mar 2026 11:21:56 -0800
>>> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>>
>>>> The regulator is enabled for the entire time the driver is bound to the
>>>> device, and we only need to access it to fetch voltage, which can be
>>>> done at probe time.
>>>>
>>>> Switch to using devm_regulator_get_enable_read_voltage() which
>>>> simplifies probing and unbinding code.
>>>>
>>>> Suggested-by: David Lechner <dlechner@baylibre.com>
>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> Hi.
>>>
>>> I think this broke the ACPI case (where regulator isn't available).
> 
> Oh, you're right.
> 
>>>
>>> Jonathan
>>>
>>>> ---
>>>>  drivers/iio/adc/ti-ads7950.c | 45 +++++++++++---------------------------------
>>>>  1 file changed, 11 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
>>>> index 273c35e03185..847e83baa876 100644
>>>> --- a/drivers/iio/adc/ti-ads7950.c
>>>> +++ b/drivers/iio/adc/ti-ads7950.c
>>>> @@ -341,19 +341,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
>>>>  	return st->single_rx;
>>>>  }
>>>>  
>>>> -static int ti_ads7950_get_range(struct ti_ads7950_state *st)
>>>> +static unsigned int ti_ads7950_get_range(struct ti_ads7950_state *st)
>>>>  {
>>>> -	int vref;
>>>> -
>>>> -	if (st->vref_mv) {
>>>> -		vref = st->vref_mv;
>>>> -	} else {
>>>> -		vref = regulator_get_voltage(st->reg);
>>>> -		if (vref < 0)
>>>> -			return vref;
>>>> -
>>>> -		vref /= 1000;
>>>> -	}
>>>> +	unsigned int vref = st->vref_mv;
>>>>  
>>>>  	if (st->cmd_settings_bitmask & TI_ADS7950_CR_RANGE_5V)
>>>>  		vref *= 2;
>>>> @@ -382,11 +372,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
>>>>  
>>>>  		return IIO_VAL_INT;
>>>>  	case IIO_CHAN_INFO_SCALE:
>>>> -		ret = ti_ads7950_get_range(st);
>>>> -		if (ret < 0)
>>>> -			return ret;
>>>> -
>>>> -		*val = ret;
>>>> +		*val = ti_ads7950_get_range(st);
>>>>  		*val2 = (1 << chan->scan_type.realbits) - 1;
>>>>  
>>>>  		return IIO_VAL_FRACTIONAL;
>>>> @@ -580,30 +566,24 @@ static int ti_ads7950_probe(struct spi_device *spi)
>>>>  	spi_message_init_with_transfers(&st->scan_single_msg,
>>>>  					st->scan_single_xfer, 3);
>>>>  
>>>> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
>>>> +	if (ret < 0)
>>>
>>> I think you need to check for -ENODEV and if you see than then
>>> see if the acpi route below applies.  Otherwise on ACPI this will fail
>>> and we'll fail the probe.
>>>
>>
>> Or do something like:
>>
>> 	if (ACPI_COMPANION(&spi->dev)) {
>> 		ret = devm_regulator_get_enable(&spi->dev, "vref");
>> 		if (ret)
>> 			return dev_err_probe(&spi->dev, ret,
>> 					     "Failed to get regulator \"vref\"\n");
>>
>>  		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
> 
> We know that concept of regulators is not exposed on ACPI systems, and
> we'd get a dummy here, so maybe just store st->vref_mv and not bother
> with acquiring and enabling the dummy regulator?
> 
> Thanks.
> 

Sounds OK to me.

