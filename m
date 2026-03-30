Return-Path: <linux-gpio+bounces-34435-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBedLl2dymmg+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34435-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 17:57:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3535E44C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CEEF303C621
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 15:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A0374160;
	Mon, 30 Mar 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecTpZORG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A982F6170
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885657; cv=none; b=QJbROsvCpOA3S+zTEikGYUPc+4bzaiao+I62VAcLvpNpqesVWmQP3tQ1upewDOEYFGJWqOklkhdKMv7e4UFDmD2Tg0j7ZDKkVuzAx3IEbYoajTyQ9848W3dbavPBFpOGRg7n65giBN/e8+H52qiFvO7NBe0nA11ZCCrUr5i4Xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885657; c=relaxed/simple;
	bh=3Sjhql64F8YbVSqIIBGW+7FGX7TWmYnn8PcKHPquz2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOyCQZfL84MTHQAvk4uj7O9yPFHRa4azR/UbOF4YJ27vw/iUrx8bDOaG1OI9dbLVUrIyrfIU9T5tNb9bUlmEpsk1N+RpmkUWkwICF+G/3pXC6MxOyK0FQVdCi88avQ52Ea9FEo1K4rfVaPrZ/UJTVnvogVviGc6hKbRpf1L+wyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecTpZORG; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c17446ba8dso2820086eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885655; x=1775490455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gYnlQZ7209SCOgDIPVCJkyFmKO2sNNpaNQ5iPdvDQ3c=;
        b=ecTpZORGocf3bFUMlZoFiByqZwJUcV3Ns2cMKcU+yByHFW6hS1prwrkhPy7PooQqix
         SyiDs0n+HthHqPutzWkbqRYyRBEuyumO5zzC7L+Iu2G9jpHZ+AP72HevmyyXanFt2NGd
         5A82peFFjt814fhM0iP4Tbxg8sf/84SiU/jXCNIcx1Fb9nhYbPQcnfOpzXflrHGjXh3b
         npqRMGow4CifE/PxqZuXKmB28+2pJkGj9pRBUrVHW9Lo1GjoWphzHglFHK9KrTQgfQXZ
         06kMXY9UhkJAAntA63eXfWjkuarOn+wjj8WmcTrMGGUjueFFc79vbyD5+ZZ8axjsGq9E
         sHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885655; x=1775490455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYnlQZ7209SCOgDIPVCJkyFmKO2sNNpaNQ5iPdvDQ3c=;
        b=e3j9nMMChtX+vHpe35E2PGP63AXwPwop3UYJqO7Mt50gnfHCIbd40U6jqkf1RoF23S
         TwexPDKkxsPF12bQ6zHMs5ew0iVRqFWuHxlSGNmD4+omPUlcEIaMZxa5sIIIYiGFCdnT
         iDdyy9qh2A+cGm3S9n3/h5A8mBzuES253b2M5SLf+HS7D+kB6DLX760c4OVcBOrmVcrD
         GLnvtKbamxIrzD2OXBCnTUaZmDstQo+J7+EJae+OojHJ3Yjk8kaQyjL+vKqFWTCzKxIb
         quV2xOZAxHWvjvhZnXVAMroKW6H3EEmLEZyNwt5GsWbiYnOf8z80DSk9zVOIBcvUDQ2f
         PaNA==
X-Gm-Message-State: AOJu0YziEI6mhxYK+TEzNxfPC6sR2fY61WJDm3bWXFFR1XwisIb5IN8n
	iq8xikzzOlVRb5pkslENlWmKeqqlFH5nR0wBEpcmZQJTx6WgmOY7yQeE
X-Gm-Gg: ATEYQzxo5Xe+6qilf+4GM/7plcDYJGpJl85nJJk/dtPA3s4zyX+wJgo0NJLRttXuNqQ
	89+21JwAF0X3HJx3WYZ5E1smY71afuZWzcf1Bw0XhF6YPnIT9MSvYY1yqHonmNz0LpM+Wr+UTkt
	Ab3BIkAfeCAodD1qfWNI8sOao7NNmMk2GNzW6xqMJ30wLk+lEmD5JBI3DAxm8EMNKRKstK3ggIq
	6A6JLwhI7Pkz4GldsbArHWz0VSKvHLjvDzBWtAUgQclRScWMqHMjeFNzNsZMflUfNb1bFkKuKtE
	NdTzOGauXPyILrDBTmG2gMsLhdZQ1IGbyCoR/QGtuu3yusTAfLORzl9iuWNaMMfGfiaZnkELO4Z
	V+Rwd8VW3mM+DBuK0FgdqzO8upObfVFl+qwkPJkIVPkX0RDuPetF1vBiOZyffEJWP4ma9PeEYOd
	0evhVwBNpvKcLP88WQrvvZROYwQ5pdDqD0GCLjKAn08zpKB25r/bVy91pbLVm8l1FjxvlYU3qln
	7iGwNYkCUM=
X-Received: by 2002:a05:7301:3f0a:b0:2c0:b92d:267d with SMTP id 5a478bee46e88-2c7baf43c8amr43690eec.2.1774885654839;
        Mon, 30 Mar 2026 08:47:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda306sm7283956eec.3.2026.03.30.08.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 08:47:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
Date: Mon, 30 Mar 2026 08:47:32 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
 <aco5L_6SZIB2DdpF@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aco5L_6SZIB2DdpF@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34435-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,analog.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15F3535E44C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 02:28, Nuno Sá wrote:
> Hi Guenter, Regarding AI review, I think most of the points were
> discussed in previous revisions, but there are two valid.
> 
> On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
>> Support the LTC4283 Hot Swap Controller. The device features programmable
>> current limit with foldback and independently adjustable inrush current to
>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>> temperature rise for reliable protection against overstresses.
>>
>> An I2C interface and onboard ADC allow monitoring of board current,
>> voltage, power, energy, and fault status.
>>
>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>> ---
>>   Documentation/hwmon/index.rst   |    1 +
>>   Documentation/hwmon/ltc4283.rst |  266 ++++++
>>   MAINTAINERS                     |    1 +
>>   drivers/hwmon/Kconfig           |   12 +
>>   drivers/hwmon/Makefile          |    1 +
>>   drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
>>   6 files changed, 2077 insertions(+)
>>
> 
> ...
> 
>> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
>> +				 bool max_alm, long *val)
>> +{
>> +	if (channel == LTC4283_VPWR)
>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
>> +					  BIT(2 + max_alm), val);
>> +
>> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
>> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
>> +		/*
>> +		 * Lower channels go to higher bits. We also want to go +1 down
>> +		 * in the min_alarm case.
>> +		 */
>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
>> +					  BIT(7 - bit - !max_alm), val);
>> +	}
>> +
>> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
>> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
>> +
>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
>> +					  BIT(7 - bit - !max_alm), val);
>> +	}
>> +
>> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
>> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
>> +
>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
>> +					  BIT(7 - bit - !max_alm), val);
>> +	}
> 
> "Will this condition handle the ADIO12 and ADIO34 differential channels?
> It looks like channels 14 and 15 fall through to the default return intended
> for the DRAIN channel. Since reading the alarm implicitly clears the register
> bits, could reading these ADIO alarms unintentionally clear actual DRAIN
> alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"
> 
> Good catch and should be:
> 
> -       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> +       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {
> 
>> +
>> +	if (channel == LTC4283_CHAN_DRNS)
>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
>> +					  BIT(6 + max_alm), val);
>> +
>> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
>> +				  val);
>> +}
> 
> ...
> 
>> +
>> +static int ltc4283_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev, *hwmon;
>> +	struct auxiliary_device *adev;
>> +	struct ltc4283_hwmon *st;
>> +	int ret;
>> +
>> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
>> +	if (!st)
>> +		return -ENOMEM;
>> +
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WORD_DATA |
>> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
>> +
>> +	st->client = client;
>> +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
>> +				   &ltc4283_regmap_config);
>> +	if (IS_ERR(st->map))
>> +		return dev_err_probe(dev, PTR_ERR(st->map),
>> +				     "Failed to create regmap\n");
>> +
>> +	ret = ltc4283_setup(st, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
>> +						     &ltc4283_chip_info, NULL);
>> +
>> +	if (IS_ERR(hwmon))
>> +		return PTR_ERR(hwmon);
>> +
>> +	ltc4283_debugfs_init(st, client);
>> +
>> +	if (!st->gpio_mask)
>> +		return 0;
>> +
>> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
>> +	if (!adev)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> 
> "Does this allow multiple LTC4283 chips to probe successfully?
> Without allocating a unique ID per I2C instance, it seems the first probed
> chip takes the generic name. If a second chip is present, it might attempt
> to register with the exact same name, resulting in a failure in device_add()
> and aborting the probe."
> 
> Also looks valid and I suspect is one of those that a quick look will
> find more "offenders". I would purpose:
> 
> -       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> +                                             &st->gpio_mask, client->addr);
> 

That would still fail if there are multiple chips at the same I2C address
on multiple I2C busses. Check drivers/gpu/drm/bridge/ti-sn65dsi86.c which has
the same problem.

> If there's nothing else and you agree with the above, is this something
> you can tweak while applying or should I spin a new version?
> 

Please respin. Also, regarding the other concerns:

   Can BIT(8) * st->rsense wrap to zero on 32-bit architectures?
   BIT(8) is a 32-bit unsigned long and st->rsense is a u32. If a user sets a
   very large sense resistor value via the device tree, the multiplication could
   wrap to 0, causing a division-by-zero kernel panic. Should the divisor use
   BIT_ULL(8)?

Unless I am missing something, this _can_ overflow. Try to provide a sense
resistor value of 1677721600. Yes, it is unreasonable to specify such large
rsense values, but why not just limit it such that it does not overflow ?

Also, for the overflow concerns, if you are sure they can not happen, I'll
really need to write the unit test code to make sure that this is indeed
the case.

Thanks,
Guenter


