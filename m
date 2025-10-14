Return-Path: <linux-gpio+bounces-27062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98230BD7773
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 07:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98A81892562
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 05:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096DD29ACD1;
	Tue, 14 Oct 2025 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h935ldeu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A1299948
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 05:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420521; cv=none; b=ougoFZwoPZsW1Zuu8rxWh6IW+0UzUVTlVb+MB212H96FGcAAhviuCqBq4sYMDqRBuNBiVsIFKvOmFfvcpZb3D9yyHWt4gUecuCU4XsL62uLmiNoaFHBWFrko11+3cYapRio42wArsWsIUvJ/EJCxGd1SuFJY/rOnR5oz3e3B3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420521; c=relaxed/simple;
	bh=LPydwwLuvDYOHl+cfwdXfUpN/GwdGHgG1JPhR3Rdmrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyqwnPUf5hUcxTxOyFJ4i8Yl99/Jq2ErcePwglFBTC8qLAsJiSDsKTbqzTWBtdLT68U0vRwDIDd4JZT/w5PCpLlDYPPRzLLI0knl/OS8Ieeo89OzrtBeaQHS0Cr/5uXJkuGZei3iJACmudqbdS4ICOou49J8XqEDTwL5uvLNxOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h935ldeu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59066761388so5561122e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 22:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760420518; x=1761025318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlTEYK2lG8FrWga2XE6oW2K2KeWj/MOwPkOEHg1zPF8=;
        b=h935ldeu33LU8yqHCcIH+jy6XZMfwRfXgGOD0NVJ4GbOf/7UESrnnEdNQMIwMWJ2kD
         39A/liJFMk12rPRQQzaN8SjfzgQaU/Ykc3HrNa0XYkMSQFN/kmFm8NFO4ybsnsnVJmNu
         Edm6hI4mqIwKg72CJnpqiLNiqsj7tbOpDuC2c2HS0COIbf3iZ8+KgQoV9bOmr3/TCwyc
         HSIQBwTsv20q/51k1lBkEy8jmL1DQW9AH5zAQrNLGqCiLYEPLTZaXR3N7BCoC80ZOlND
         n0zsGMUxKU9JNM4si8vMSKHebzB70HAoUhh3/D0CpvtG45Idlq4SuJCq8+UAFRTnsJs6
         lhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420518; x=1761025318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlTEYK2lG8FrWga2XE6oW2K2KeWj/MOwPkOEHg1zPF8=;
        b=mv/g1svxka4fMS2EHVsG/a21lqNFqyLIOamVKY8HYpFGjFeyGcshkmrp939daOlY/l
         leQSjfo9fVnm8HAgZcXobXz0NWloPZ3mbTDDmOpADl95mG+/jVKIbj0hYtIMKFSwQck0
         4w66FTTJjiF4X0mlqSdwfcLKqAUm4UBzOexKTwxm5x4sWlQhiDCDod8WHYVz6Vx5G2Uc
         rtjiGG3Vtg/bx4mPQO/XnY595kSyC+xftngWArU0Yx5C5f5ERHcmGTHgdRtZhMYIXgnV
         sfxnRLb9GMd6VqFNf8sh4lIHIPzgCgNnFNDhpy0q4pRdwBdCBYsOI32vHgiZdJ3whsOM
         uMmA==
X-Forwarded-Encrypted: i=1; AJvYcCUCDNOdDf5p8yjDCWN93nKAoyfOdm0y+VI+X4ggRrflK0I3ubdmbzmQ8LGh8H1I68ugQNYD/8p5eqec@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/EtlIbXv9IpVGzduSIPjHTMlSPSwMkaNIaaz7gJrtLQ7xtZ0
	2qE51GN8a03nSgxvuek3ML2G0wBbVk/rirlJgAmVmKMM2sZSqUoSgysY
X-Gm-Gg: ASbGncvo/eyPqtJ81JJXig5KUvpGxXRw9BbNgh4Zy1FL8Fjd8Z35mck0t3XhGB60GgG
	PuC9ASXAY4Zn676rIaCp7Plcv0O4AGmztsVl9hovyMqTMEmV3AT8itZjTRFulHNz4BpEbAk9m1d
	E3eWT5NT8pmDBa5KWpPbJVmcXcLGrtEa/a8HxFaOTGd0xBCGKlbnyNKAiVkwE4/I9gGk6UKArCH
	nyCNinKVFpJ2NDRPzy19zWdaqBhY8g9yrRCMr/rXJU6EEtV5Tvfw/r8TN3PNCMPeIDdEtXjdx5t
	ET6vp6xdUTV1qnF9ehhpYpeF2Vhd51bVkCWLICxllNLE8AubjK4tSnXvQ+CWKxpaFmkpFICDGkD
	WvtG9XSohvs0pI0V/rLWcC0zz2V3heMdlvG8xf1/pKhGCWutaDwcLM/5DM+h21l7XhkCTWbDFca
	ULDxq6NmX2GB7/FoNDry4OTqI=
X-Google-Smtp-Source: AGHT+IH4zxyHQbgMm4QvAweY0h6OP5yIF60vhkFcv3s+/ryacaTZrzwbyJoBXHCVTMwkH2t4VCyn1w==
X-Received: by 2002:ac2:5681:0:b0:55f:6cc3:45a6 with SMTP id 2adb3069b0e04-5905e27c820mr8006424e87.13.1760420517661;
        Mon, 13 Oct 2025 22:41:57 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f913dsm4874148e87.42.2025.10.13.22.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:41:56 -0700 (PDT)
Message-ID: <5ef55577-b8ae-4c8d-a965-ee356c47c691@gmail.com>
Date: Tue, 14 Oct 2025 08:41:55 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/13] mfd: bd71828: Support ROHM BD72720
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Lee Jones <lee@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <93142a80d90a0ac80b27090d0c83914675aad94d.1759824376.git.mazziesaccount@gmail.com>
 <20251009161847.GE2890766@google.com>
 <8ea507eb-f78c-4a16-882b-112e277fa1b6@gmail.com>
 <20251010150317.07bfdbe8@kemnade.info>
 <d2295506-bf70-4142-8537-0fdf9cb04a30@gmail.com>
 <20251013151900.3e4cc69f@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251013151900.3e4cc69f@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 16:19, Andreas Kemnade wrote:
> On Mon, 13 Oct 2025 12:27:33 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Hi Andreas!
>>
>> First of all, thanks for taking a look at this!
>>
>> On 10/10/2025 16:03, Andreas Kemnade wrote:
>>> On Fri, 10 Oct 2025 15:09:07 +0300
>>> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>>    
>>>>>> +static int bd72720_get_secondary_regmap(struct i2c_client *i2c,
>>>>>
>>>>> Does this 'secondary' have a specific purpose or a better name?
>>>>
>>>> I am not entirely sure. When I asked this from the designers they just
>>>> told me that they needed more than 255 registers so they added another
>>>> slave address... (I'm not sure what would have been wrong with using a
>>>> page register). So, I assume they just placed stuff that didn't fit in
>>>> first 255 register there. But yeah, it looks like most of the registers
>>>> there are related to the charger. So, perhaps it isn't completely
>>>> misleading to use "charger regmap"? The data-sheet seems to be just
>>>> using "Register map 1" and "Register map 2" in the tables listing these
>>>> registers. I kind of like using something which maps easily to the
>>>> data-sheet, but I really have no strong opinion on this.
>>>
>>> just another idea: What about one regmap with custom functions covering
>>> both these adresses? Maybe that could even be added to the regmap
>>> functionality, maybe with a 0x100 offset for the second range.
>>> That way the rest of the code only needs to real with one regmap
>>> and properly defined registers.
>>
>> Interesting idea.
>>
>> I suppose you mean something like implementing custom remap_read() and
>> regmap_write() - which would practically select the I2C adapter to use
>> based on the register address - and then doing same thing as the
>> regmap_i2c_smbus_i2c_write() / regmap_i2c_smbus_i2c_read() do?
>>
>> I suppose this would mean duplicating the functionality provided by the
>> regmap_i2c_smbus_i2c_write() and the regmap_i2c_smbus_i2c_read(), which
>> are static. It'd also mean we'll lose the 1 to 1 mapping between the
>> register addresses in driver and addresses in the data-sheet. I agree
>> this wouldn't be such a huge thing if we used offset like 0x100 though.
>>
> Well, you could also stack regmaps like ntxec.c is doing (but there
> for some very weird reason). That would avoid duplicating code.

Ah. I suppose you suggest I'd try something like:

/* untested, not compiled, pseudo-code */

struct bd72720_regmaps {
	struct regmap *map1_4b;
	struct regmap *map2_4c;
};

static int regmap_write_wrapper(void *context,
				unsigned int reg, unsigned int val)
{
	struct bd72720_regmaps *maps = context;

	if (reg >= 0x100)
		return regmap_write(maps->map2_4c, reg, val);

	return regmap_write(maps->map1_4b, reg, val);
}

static int regmap_read_wrapper(void *context, unsigned int reg,
				unsigned int *val)
{
	if (reg >= 0x100)
		return regmap_read(maps->map2_4c, reg, val);

	return regmap_read(maps->map1_4b, reg, val);

}

static const struct regmap_config wrapper_map_config {
	.name = 
"Maybe_a_descriptive_name_here_Which_devices_can_use_to_get_this_instead_of_map1_4b",
	...
	.reg_write = regmap_write_wrapper,
	.reg_read = regmap_read_wrapper,
}

probe()
{
	struct bd72720_regmaps *maps;
	struct regmap *the_map_we_use_from_all_the_devices;
...
	maps->map1_4b = devm_regmap_init_i2c(i2c, &bd72720_regmap_4b);
	maps->map2_4c = devm_regmap_init_i2c(i2c2, &bd72720_regmap_4c);

	/* Init wrapper map */
	the_map_we_use_from_all_the_devices = devm_regmap_init(dev,
		NULL, maps, wrapper_map_config);
}

If this works, then I kind of like this. It avoids using the platform 
data and simplifies the regmap getting in the power_supply driver. 
Thanks for the good idea Andreas!

Lee, objections to this?

Yours,
	-- Matti

