Return-Path: <linux-gpio+bounces-37080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIMyIzMsC2opEQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:11:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2756FA86
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87BB9303EF41
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E626A355F2A;
	Mon, 18 May 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ouBieWJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244A314B72
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116713; cv=none; b=iT5KEq3AaCWsBLZmX5xYd1hbQTMk9COAk4AWE68RXAv+UUlT/HINyaaGIEySMeJV45hzsTTY91ONwnvTlmSOMuAH+Pgtif0NW59Sa9QvtO9iE55CMeA10yMpSRUwrF/h14fJkUelag2twcsz9xWh+GvyHwr770jb7N9Th9dhmfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116713; c=relaxed/simple;
	bh=DrQFqVK7ClQwUsYNDfngLJu8LH50pdn60WsQM9mVJjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vl2AbEbli0+MVU0ht+H/8lGu1tSWyyk4PrZGdEyHfb2ESpFY5e+WRXGHlLNvKWdhVZkdSEaNfE7hf42dxK6smDf3drclUzGMj6EMJMQN0MZ75qbGdjo16QhSn4cvpdVeose5Pl0MZkUX0YKinXHQvuCEtd0q/KpvNJ4E4b8sI3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ouBieWJQ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7de4e6c5a30so3230478a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779116710; x=1779721510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzeCgn9mFtApC0ztEgdeNOw9BPgUS/EnSmz8TCLSDFQ=;
        b=ouBieWJQc8AfqoM6SDbP7Z7RbowQ+30DVzGfm+fCD/1vjyHR2XCXclmO1Up7IOwg1M
         C39r04RYn3mCgJDMLdaYEP3jX1k/CFmuziAC9axzSe1nBvFbEpQ9fR95XaDGPcw1Kxj4
         2lDT5azjgghFAh+Uv2jGGhU4a6nuXk/hRAV8I8YxhmBlLmEBSQ4TcACaw9W7AT9XXoR1
         9QBWJOZrY4y+9Q6+/wd0japV8X9YzEd7xdDpt4KetP50EIyN3AI0lXhmot5kqkQ/Y+i/
         7ZF5qQBc57gf3TydypXhnf02OI6Xd8ti4biQJAqTMSblKLMGx6LXthYXt9j21lTzAk/O
         OJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116710; x=1779721510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzeCgn9mFtApC0ztEgdeNOw9BPgUS/EnSmz8TCLSDFQ=;
        b=LuJSSwrKSuZDhOxzEWUQz7bbDNVDrRPmk1wdIWolwYdVv6rx1RQ+ps+U+Drttv2y4t
         v8GonbCW1/fF30MAkvRn8E4GiGjXVg2BZwCZHurToK2UDBB24DW7k42QB+f++PBxBHw1
         6hXlt78PTtfzey9ymN7m0PMv3WeOnEXON/spjM886VTsVEhTREqDR/GYujMy+PwMSnfw
         Vi2fUGRYrjBERcl6Xm0tKl0bQKeaVyg9WDHvQTe5cLcSqwmAS3bVUeiQ/2+v1pU1/f1g
         ZS63B9FqJkSC7lGcEXRH2323A+qXl1nfTOfeGd0HuRnttO15BX4iZoAjj8HFjJh0TQvb
         SVsA==
X-Forwarded-Encrypted: i=1; AFNElJ+7R2RZ6VRj2lRdNL/GyrFRkny7oRWElUP/MZecZcAfdB5PVMmzSn34EUt+mKJoQyzhe1zU2udQb9yO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/72wtYxVVFalsaMHR8I1UPcRA8C8ls0ufDWQosz6Riu3mANiG
	VhZJU9a4h41Ukl+4+0iMT7wz11q6BDIxtcOS7m60P3fCOkINrRE4wnotehBOTUtP+RE=
X-Gm-Gg: Acq92OFVtUQPBTJzfm05BT86NJfX6hHnygQVrE4pHpNN++RqkY1WVQNTcj0LwvFLLzY
	Uj/JHenwRoPxAT0prhcG77a8IfT9OYf7QLcAVu3tY+Guai5Osz4xyaIZASkuToe3+oqUi0q/Klc
	kQFs4F1/fTBFhHirOSrYVgLH22Q4e9nb70aai0rOO97u9kyhPd8ZYqJUJKN4KQbzXfnETNbnmot
	8+1GkaDEkr3oo7chWw1n2a4xg7YHy4NMKyagE9gJLB1gUyKdMCFIl0QkBzxwSBZq3L+H3xmLlRL
	WZ2LlGG8fFfJDpgTCjmud3k60ODPH4aIul+4htZukaFQPUZoXLh1cqklact+4c4AH5VXgURC1po
	eju5+DX8U9K7GVn7JXLtEk6xVTVCUfOItgPKq2AL/N+V1xUNUirTZBWY1Aoa6yizjC4/OACMOAv
	p/N0LvDhuQwkt7wihSTSgnEHI7ZsperJzifDhThHB+w9OBNAcpcPeRUoHCPEndn0p+xnmRv6/FH
	Q==
X-Received: by 2002:a05:6830:3903:b0:7d7:ef0a:1ce5 with SMTP id 46e09a7af769-7e4ea07e9demr10482946a34.9.1779116710621;
        Mon, 18 May 2026 08:05:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b81c8a0sm7696080a34.10.2026.05.18.08.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:05:10 -0700 (PDT)
Message-ID: <7d338351-5f1f-4eb8-a266-b8756d0e60f5@baylibre.com>
Date: Mon, 18 May 2026 10:05:09 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] iio: adc: ad4691: add initial driver for AD4691
 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com>
 <20260515-ad4692-multichannel-sar-adc-driver-v11-2-eab27d852ac2@analog.com>
 <0696b662-f478-4d1a-95e0-0338bbdb719e@baylibre.com>
 <LV9PR03MB841445D5BD1087FB3204EBD9F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB841445D5BD1087FB3204EBD9F7032@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37080-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,gmail.com,pengutronix.de,lwn.net,linuxfoundation.org];
	DMARC_NA(0.00)[baylibre.com];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2DF2756FA86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 9:59 AM, Sabau, Radu bogdan wrote:
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Saturday, May 16, 2026 8:11 PM
> 
> ...
> 
>>> +static int ad4691_reg_read(void *context, unsigned int reg, unsigned int
>> *val)
>>> +{
>>> +	struct spi_device *spi = context;
>>> +	u8 tx[2], rx[4];
>>> +	int ret;
>>> +
>>> +	/* Set bit 15 to mark the operation as READ. */
>>
>> Can't we just set read_flag_mask in the regmap config?
>>
> 
> As far as I can tell read_flag_mask is applied by the standard SPI regmap bus
> backend, which constructs and sends the address byte itself before reading
> the response. When using devm_regmap_init() with custom reg_read/reg_write
> callbacks, the regmap core calls those callbacks directly with the raw register
> address - it never touches read_flag_mask.
> 
>>> +	put_unaligned_be16(0x8000 | reg, tx);
>>> +
>>> +	switch (reg) {
>>> +	case 0 ... AD4691_OSC_FREQ_REG:
>>> +	case AD4691_SPARE_CONTROL ... AD4691_ACC_MASK_REG - 1:
> 
> ...
> 
>>> +static int ad4691_write_raw(struct iio_dev *indio_dev,
>>> +			    struct iio_chan_spec const *chan,
>>> +			    int val, int val2, long mask)
>>> +{
>>> +	switch (mask) {
>>> +	case IIO_CHAN_INFO_SAMP_FREQ:
>>
>> Should we aquire direct mode so that we can't change the rate during
>> buffered read?
>>
> 
> It is in set_sampling_freq already. Do you think it would make more sense
> to move it here in order to help readability?
> 

IIRC, I think it was resolved in a later patch in the series. So
could just be a problem of it not getting added in the right patch.

In general though, yes it would make it easier review if the
direct mode claim was made here.

