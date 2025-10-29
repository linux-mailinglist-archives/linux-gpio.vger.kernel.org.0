Return-Path: <linux-gpio+bounces-27808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45141C1A46E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B831891517
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7989369972;
	Wed, 29 Oct 2025 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKusNya+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D5335BDDC
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740593; cv=none; b=eJea+PHqbbjxF+sabBJLEzvFdBQw3Oq8+SEPhyYeg47WKpKvcsmVl7XRnk9bMN/7c2xNOPRJ7dpgDsZh2JiwJ7jGdRs1GWUpwlVNNU/Fklw//oqi8HWB7zwJwLmEek2mSC37Vjt8/rnsaE6oRwtsYI4eRqYvIqb1/3INo5iqkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740593; c=relaxed/simple;
	bh=4q7J4aubuQWsGwr0ektsFotDhPgrwX82ZQ+g0OMBrag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ca45EuMF10vZBU5+1VELCdPz1o3vGJLVrLVCEd4AghGjV/D+6Te7sX3EdxeIm0ksKkvgapWlsM5qHIGfjROEzOHQdVHdpiJpxoiVxIvij8srSl5duh4t0YXl75Bn7RSwvyRwO5Ay8ySddcHNPnlLi6+3MWu1RyeiM4NhWSqdMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKusNya+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378e603f7e4so66989201fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740588; x=1762345388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwOTcdAl6vDZ/MWyMdXE0a7QobEAic8ni59wBqX8fPs=;
        b=aKusNya+J1epch69ax/IhqtTcFFpOXJlXycJ3taG2vAOmbfp5vZwMNwAwBFguwg3/Z
         iA5ZMqVWcGfEE/fkTY2j6W8/t6u/Amc3PuCCNe8K3HEP9bi88kUMQEnLT50SmA0xR8oz
         kjgeFGRrAQY7/0L/g/TilJzqMIeIakGJOXRFkr3nWwMw69QcKH4JjpCPNH/8JsOMzS/K
         G//42m3pFRCNn1P2pYqDJZZ7i0fwtn36IiINOJPRcWNJ7n5RPen4uWKfsa00ir6XNTiv
         s4+BR3zF4LXbN2b/x5+DHA325CzYi4Y9bsxThtoQgnfy0Y14RIJAMO5CBUtgcTLfo4Dc
         lfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740588; x=1762345388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwOTcdAl6vDZ/MWyMdXE0a7QobEAic8ni59wBqX8fPs=;
        b=C631GYDQNPnQ0PFH9uNbBamVg0b7S2S0yPlVFnaMWOnu9lx5DK2mkWz9A4zJoQJv/X
         FDGhitBSqPfFXIeB1b9GeR031gFQvjTpc6PPqeGh2nUwh7T2SHuh407KEOg6isveeTbd
         GP6ipZxkqyG9wb2DVe68m7laNHn5WDrlnQHOXkJzZ3LF7BhLEthwjxH8UG+t3cgFJzv0
         MODe6502sidwlnmucsRIQoiwXAfHOqnBvwL7//PqDhXtqte6DO43k7QPCKcBC0B6orLu
         v0USai9AgFAK462VQAZx4p/zhldySETSEckIV3yz5O/a6VJQ62xNfOoyuO6ykFvxKFco
         X/7g==
X-Forwarded-Encrypted: i=1; AJvYcCVDAG+m1Xgr0MAEScKiBQbts8eFFyyvUb6tqw5kslle8eYhz4don2ZvOCBKhlqGC9TOmBFsXW+jJH+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkgjb0XeELqfyAISihD5EFGlbyxgIlNp2vyap084F1c59pi8qR
	INFvqhHwcyPYRgIpy+DjIXqgXDgkgxBHUrIVOh9222OK4JJFDoHZ+4QX
X-Gm-Gg: ASbGncuOHERw5C0aTMFUwJ+wiVf9IR7IrLXNNSNhMQsnS+WFAmriW5ADKwjW1xkGCiz
	n0BJjhkHI52+mqCxc9d7y/ae4bGjYngmuZPjl29yUjEKpq0tiUlDoyekqKih5iGXpIEcJLGjjcD
	NyGBdbu764aD7cjk0cF+M443dmj+OG5b6Ji71pMMKWc4p1iSlqXVGhwIidZjhRK5v91by85ZQuD
	8Qz6YrhOo6eCjFHC/1k3ua5LFXSfXh46jQImFF8i8wfCaU8tprMBOrr29ipzADs8xfn2vV+mfUT
	tLC7lpQucXFmOJHg64IWufVj3ZXLFzZaxbD/wBbNiNW/IavG5WRlCveyjTajn19f9Tav0JkR53c
	HtUmt6Q+d8C2ufySPDpKcYbhbRVIoeXs6tGcSt4knvYAahF/NjHOZ72hwJImmgHEayw/sX6IwzJ
	DEf4Tt8BxFog==
X-Google-Smtp-Source: AGHT+IFFUkHYksyaF7YXcZrhW6iSWoG+pahPESVLSjEUcjb9W1AN2WMoPe9CQ3dBxP/T6OWyot0tAg==
X-Received: by 2002:a05:651c:1ca:b0:378:ec26:bac with SMTP id 38308e7fff4ca-37a023c5e6fmr9540811fa.15.1761740588247;
        Wed, 29 Oct 2025 05:23:08 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5f98esm3814707e87.57.2025.10.29.05.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:23:07 -0700 (PDT)
Message-ID: <49612d39-e2ba-4cf1-8bd2-3da1e9869069@gmail.com>
Date: Wed, 29 Oct 2025 14:23:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <20251027222030.560def67@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251027222030.560def67@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 23:20, Andreas Kemnade wrote:
> On Mon, 27 Oct 2025 13:45:46 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
>> charger, LEDs, RTC and a clock gate.
>>
>> Add dt-binding doc for ROHM BD72720.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> [...]
>> +
>> +  rohm,charger-sense-resistor-milli-ohms:
>> +    minimum: 10
>> +    maximum: 50
>> +    description: |
>> +      BD72720 has a SAR ADC for measuring charging currents. External sense
>> +      resistor (RSENSE in data sheet) should be used. If some other but
>> +      30 mOhm resistor is used the resistance value should be given here in
>> +      milli Ohms.
>> +
> rohm,bd71828.yaml has rohm,charger-sense-resistor-micro-ohms, lets
> keep that unified.

Absolutely! Good catch, thanks!

Yours,
	-- Matti

