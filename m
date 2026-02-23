Return-Path: <linux-gpio+bounces-32052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJaBHf2BnGnIIgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:36:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD559179E2A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC2D31E1240
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDC53148CD;
	Mon, 23 Feb 2026 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="smL3rtHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C1313E29
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864277; cv=none; b=XPQNn+f/9yppO/4Plu7Rg5PAN+tsq/x9cePPa3Llu79qV/4BBhSWdAi/vnCs57t4t1eE442ZL0NgkAxQSkigoQUOJ72C/QLiUCPfXQVr3CZQ+s9e59pOCpKHFlpVZV7ZR1s+YkOXRqJCgrD4ywH5XlJKnSqxgRblLZEt2EFP1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864277; c=relaxed/simple;
	bh=AXKL+fcozxp+GpI8pvxD2aSAWc8U1kpa5P0PeJuGNDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcXzzdlIMFi4Kp0w2j5mwLtmsrWos4WSbCYnN/SD+m/eI2GzjGP4cfELjito50mQ+e0I+ls/hf35h3FUNhCEJDQem2BphIpwyPsh2uTcN2NBFQIZBIMFnRvgzWhwrR/lVH1v6kDM75ulM6WZUhvGIc7MG828TzQTKUBS1Fx6u/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=smL3rtHA; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-463901a0accso1572617b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 08:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771864274; x=1772469074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/WSSubdXWO4v+sW3CLfrhFH7dC9lTt9CrzEJ0rC2GY=;
        b=smL3rtHAqrJv7TMtk70jhHz42Lvg6NPjZxJZN4zyJBM1WdRwBgk/CVoC5uQQZO8/5v
         EuAzZrCGx1sCm/aVaczCjnK/tKZOgFsDJkgiyONQK94B3TjFN743RJaS/ZKaND3pCes7
         /yvNTIgQFAyzmwDpdvB/HK6nim/Bhgl8Qz7V+72PIRsTDBbQSgNNHEadzL8S9r+zfS8u
         Xl7NTzJ5IZopHDUxzUuZpuHTQfSzvWf09283FP3R3w0yPx/v9VCoCt6wxsbboDOfPr6j
         cdrA8tKQzWB9vDZ8spFC7eyFgUP5d3yhx1nGaYQNr8V/8/VnPAv81eMYGCV1EiO9+zkZ
         IATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864274; x=1772469074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/WSSubdXWO4v+sW3CLfrhFH7dC9lTt9CrzEJ0rC2GY=;
        b=KqZJBqoFaXn/mtD53dNqZziLgliiNR2q/PI+hYTQEQslnM4tiwY4Z/PPNPtdrgePYA
         NcosfirQ8PMtVG2z4S1a5Ayxxgni+rnhW6azxlyQDdaWPBc0jnJ3aKlYouPIVlaRGzNr
         kVGKes8DJZTqWLDANxUbN62rfpReYf39SHuxNlCKJUyBhbpyuxQNZ4cYo+6p84BFNUaE
         5JJS5VYv9nGypaueISqot/70nYU9pty+j27RvPt6bW9iZQTa5lLnFjve/Q0HzFZ5IWBL
         eGbaCo803atjAn8Bo0prk5o7ckU7z8SxsuyUzDt1fIcA6wv8R1dbFUBtBlwwrHSPEO2x
         QOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHHhjYxMdPW4g/j42s/mRcoIKF5Op0wT7GTNeQBspIC3KNWScld4u1QHYhp5uDz0KjD1T7LFnYktiG@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHT93Wh5ddZnSYTb0yZABWcXeNehD9LIDpn2tmAXNr3c9447l
	SCqQBjPferj54seuddecVoaHcaxp4vB0zskdO7fxu66c1E4IVzEp8IoSbm+ITFCyc+M=
X-Gm-Gg: AZuq6aJp53ahSy0fRxYZ9qUKgzrh+H0FVrtinGJEmGC5aUsDiaEv0C+3L39SgP0Bg9v
	E0VuyTn9SGmc9l3XTI28e4yk9paSlSgZUf7MnTk+OSIxU9jG61fV20PBcIqbxXU+Hn6D9uY7XT/
	OjuuVGiRrXeZuV+ka9tccmC62iZlTcGQfI/qBpKwELsUnZV+LUG3bUc8jmITBz6FViYGUpCvoBm
	6yiPiFfc7ON9DuF0ApC3lGivTEF+fewpfG/ly2DnNINNSoUUm1HdjGS4cUrfzztZah+5RuAA1HQ
	r+J3LgmokgumNwy4kN77qgww4ybnj3pRKFf2Kc8jt1uk9aNrJ6Uxmv6upLc4/Qb9GXo8UfUtRCU
	Q0YQ1l+73oJbrCgfoKDZy+QIXS6dWEfMdKDqDfwrxFPgsldlpJ2xOG1P3NMZfVLQ8NsjToR1lPZ
	7l97qp6bDZodrYYqgZvcU8NtUxoC0FPfNdkkjjZKFdMn3Yo2JjHmjbFjfXwQOOHg+scdETR4Q=
X-Received: by 2002:a05:6808:bd0:b0:45e:e21f:bbaa with SMTP id 5614622812f47-46446341019mr3593036b6e.33.1771864273966;
        Mon, 23 Feb 2026 08:31:13 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d0725c4sm8168079a34.25.2026.02.23.08.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 08:31:13 -0800 (PST)
Message-ID: <022c6472-0f7f-4c56-8ba7-7f9690e8a625@baylibre.com>
Date: Mon, 23 Feb 2026 10:31:12 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
 <0b9e1c9d-9bee-4fc3-ac19-28d969f65ef2@baylibre.com>
 <aZt1ypf6msZxc2U1@google.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aZt1ypf6msZxc2U1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-32052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid]
X-Rspamd-Queue-Id: CD559179E2A
X-Rspamd-Action: no action

On 2/22/26 3:37 PM, Dmitry Torokhov wrote:
> On Sat, Feb 21, 2026 at 11:34:33AM -0600, David Lechner wrote:
>> On 2/18/26 8:29 PM, Dmitry Torokhov wrote:
>>> +	scoped_guard(mutex, &st->slock) {
>>> +		error = spi_sync(st->spi, &st->ring_msg);
>>> +		if (error)
>>> +			break;
>>
>> I'm not a fan of scoped_guard() because of the hidden for loop in it.
>> It hides the fact that the break; is breaking out of that for loop.
>>
>> It would be more clear/obvious written as:
>>
>> 	do {
>> 		guard(mutex)(&st->slock);
>>
>> 		ret = spi_sync(st->spi, &st->ring_msg);
>> 		if (ret)
>> 			break;
>>
>> 		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
>> 						   iio_get_time_ns(indio_dev));
>> 	} while (0);
> 
> OK.
> 
> I could also make it
> 
> 	scoped_guard(mutex, &st->slock) {
> 		ret = spi_sync(st->spi, &st->ring_msg);
> 		if (!ret)
> 			iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
> 							   iio_get_time_ns(indio_dev));
> 	}

This is OK.

> 
> to avoid using "break".
> 
> I think you will find that scoped_guard() will gain the foothold in the
> kernel so having implementation that does not follow common pattern
> might not be the best option.

In general, I agree with this idea.

In this case, the common pattern unfortunately leads to common bugs.
Since we were discussing this, I audited the kernel and found and 
reported 3 unintentional mistakes with break/continue when scoped_guard()
was introduced. And I have caught more in reviews before they made it
into the kernel.

So I make an exception here to thinking that the common pattern is best.

> 
>>>  
>>>  	/* If set as output, return the output */
>>>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
>>>  		state = st->cmd_settings_bitmask & BIT(offset);
>>> -		goto out;
>>> +		return state;
>>
>> This can return directly instead of using local variable.
> 
> This will require the explicitly normalizing, which we avoided by
> introducing "bool state" to begin with...
> 
>>>  
>>>  	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
>>> -	ret = spi_sync(st->spi, &st->scan_single_msg);
>>> +	error = spi_sync(st->spi, &st->scan_single_msg);
>>
>> Can just return directly here now.
> 
> I think there is benefit in explicitly calling out the error paths and
> explicitly return 0 on success. It removes the doubt whether a function
> can return positive value on success.

In the IIO subsystem, the direct return is preferred (maintainer and
other reviewers frequently request this).

> 
> Thanks.
> 


