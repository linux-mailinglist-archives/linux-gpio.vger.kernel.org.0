Return-Path: <linux-gpio+bounces-30307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E7D07BBE
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 09:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE12F302CF67
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527952E8DEA;
	Fri,  9 Jan 2026 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNVVGdbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2A2FC881
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946293; cv=none; b=F78QDJAbW0nl7+pbnIZfnChiMIwgfpYNIemlS1iNa6HpGgImTF9y0L0e4JKrQBesD2TiXI0HhNWKQhV4pcG8HpEvjf/rjnEDy1DVvUFTTFZVvWV7N4J1z0948e/p1j5KkMItMSATqsLqdyPROoLQPy3CvrK56NtEcxpziVeJvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946293; c=relaxed/simple;
	bh=TegNChNmHEzD8+9WeNnVdBonXBPxxrbHlIIxhxeFES4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upUNI2Bu+se4kmQzgmsLSjVKW+1wxpGhvCqgHOrxQR5zqZaVoZYPuQ4Fv/tvCIsip2OlHh0BAvSlBokPtJVSRpFgMeTnLor3K4CEaW3JOB4Y+IGbyLg8ww2kLaRYs5EPngRhK/XsgWc5zQ4H6k0UaDROS8wQ5W9bCSQoSoF0paQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNVVGdbJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so6005029a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767946287; x=1768551087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpBRuHMiMCleFgRr0io9MPn59FZX7HGviJTaLToKJC0=;
        b=LNVVGdbJwD2ECGYYBRL9XcKvRIUg7+5k0Ax8G61JFwenPy7RjY8SwmYYEA1AUqBldN
         gxKE69BXwsdpCiJIdcskx6TpbkbhUKJgEGBZv6VKgqjuH9ZI1n/45bqHyK4RoAnMQUws
         2HS6o0poBkILr9aLDrYC4FESp4S21DfeyDrjsV/ZW5o4A3/pp7EtVYbiI2gCR6r259st
         uCt5ZV07lQ9o1yci87dyNSFMoxLbSWbZ+mzbg7jvZw12T3VBw1baPEPja87ZwjRxN3rD
         WGW+VQN04q74ZMiAipGHLcLtBrmVCImv9c92Xo3mJn6b+buohMZFbg3P61bCWOv0DVG1
         gWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946287; x=1768551087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpBRuHMiMCleFgRr0io9MPn59FZX7HGviJTaLToKJC0=;
        b=LIqZTCTecOWZLnlLJxWKD2uVTqcfq8wovSTg5uQKjQLi89DDyBD2VYlQriP1I1/BLW
         rwlKAdTFsqW3vW20Ica5AcnrFaq5vjk18sPzs3JisIGtwhlnWwbe8uxchoAdi1wL8GX7
         NSYeWVzbC91PeJ6iqrTU4AoVdPBdfST5mD+Vli2U4i47zR7vW1oFPAASlmUVZt4aqTLG
         AI3xyG4OOKnZkoSkmPM3WmYnXGa4UY9ol59TGbQoPPAe4ETwj1f9vrn1By4dmnx5TTH+
         IGbP5NjRxVPMOZ/t0NjxTA9LVXPloGJt1PkmNNM38WbusSLJAIYJYmTYGoXHq6jrxkII
         BcNA==
X-Forwarded-Encrypted: i=1; AJvYcCW3eyPJ9r0tCGESYwZQhOyBYWlnTripvVgVr4bX3uMCw1azuUPGmfF8YbmjP3a/bOkx5czYfks8EhCW@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4vQEez4VGkiQpyY5BccGkl+kwgjupOPS/W6eAyZ4fWaV5eNR
	3eYGB/iC3vTMVEPCucvprr+5oIE433mpc0n2/9ILXCDebBgbAnN9WCWYbAyDP8qDARk=
X-Gm-Gg: AY/fxX7pxxTuhcpFwL4I3vzvZBx8sxIMYuCsNQibXOZeDCtT5fqKWDD8qyZBnvHxVvq
	vogVXagciwK137zDRkAGooIOaTtDAELwtCSx8xCL/p/ISdrSsaOT/EU8ArE1EOp3Bfy2aC+dYzx
	wrqajhvnEjGoLygabnHqxPa0IfI4dFxmxjoh8QZpZVP3ZruoLlbmJZdgJeaIFm0ACyzjfXJj1R5
	wpk1eGOOfNSFTWmPNu/CAq/IOFpBwBZqhtq4H0gSciLYLaiwe0DBWzCtFyetuG7Ck0x9IsJpiZL
	MBRlj0NWA7oz00KfQHSV3TJbKMXzgU4UonceBUVCPeZQWfqAfaUqOInEBBgA1JS7WabQtXT0FRc
	bVjZSW8u7mtDUeO38gMHDLSh0ToF3q0zrGITwXGzj6TdOY3qOuVd4vPfz9zxl2aBrAi5u7YX9tS
	Tjmptg+yXBSbHC2DfsHJF/SXbF6cdokVl8GJX8EU8UBebtavlFmYc9jQv5YAHGfP6fQG/e
X-Google-Smtp-Source: AGHT+IEbfnpAwTBpMLXsSD7GLLq4RdVLr81UJhXWfoMR4g3wMxGRElDJAG31EIjk//ER3TZlJZdKiQ==
X-Received: by 2002:a2e:b8d0:0:b0:382:ff8c:c9c3 with SMTP id 38308e7fff4ca-382ff8ccac1mr27076741fa.3.1767940183581;
        Thu, 08 Jan 2026 22:29:43 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7cc214sm21543771fa.22.2026.01.08.22.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 22:29:42 -0800 (PST)
Message-ID: <63bc889a-b97e-43c3-9f46-9ca444873b70@gmail.com>
Date: Fri, 9 Jan 2026 08:29:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 00/17] Support ROHM BD72720 PMIC
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
References: <cover.1765804226.git.mazziesaccount@gmail.com>
 <20260108172735.GK302752@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260108172735.GK302752@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2026 19:27, Lee Jones wrote:
> On Mon, 15 Dec 2025, Matti Vaittinen wrote:
> 
>> Resending the v6
>>
>> Series is same as v6 _except_ being rebased on v6.19-rc1 - and adding rb
>> tags which were replied to v6.
>>
>> The ROHM BD72720 is a new power management IC for portable, battery
>> powered devices. It integrates 10 BUCKs and 11 LDOs, RTC, charger, LEDs,
>> GPIOs and a clock gate. To me the BD72720 seems like a successor to the
>> BD71828 and BD71815 PMICs.
>>
>> This series depends on
>> 5bff79dad20a ("power: supply: Add bd718(15/28/78) charger driver")
>> which is in power-supply tree, for-next. Thus, the series is based on
>> it.
>>
>> The testing since v4 has suffered some hardware-issues after I
>> accidentally enabled charging while the PMIC's battery pin was connected
>> to the I/O domain. Some heat was generated, not terribly lot smoke
>> though...
>>
>> After the incident I've had occasional I2C failures. I, however, suspect
>> the root cause is HW damage in I/O lines.
>>
>> Revision history:
>>    v6 resend:
>>    - Rebased on v6.19-rc1 and collected rb-tags from v6.
>>
>>    v5 => v6:
>>    - MFD fixes as suggested by Lee
>>      - Styling mostly
>>      - New patch to Fix comment style for MFD driver
>>    More accurate changelog in individual patches
>>
>>    v4 => v5:
>>    - dt-binding fixes as discussed in v4 reviews.
>>      - Drop rohm,vdr-battery.yaml and add vdr properties to battery.yaml
>>      - Drop 'rohm,' -vendor-prefix from vdr properties
>>    - Link to v4:
>>      https://lore.kernel.org/all/cover.1763022807.git.mazziesaccount@gmail.com/
>>    More accurate changelog in individual patches
>>
>>    v3 => v4:
>>    - dt-binding fixes to the BD72720 MFD example and regulator bindings
>>    More accurate changelog in individual patches
>>
>>    v2 => v3:
>>    - rebased to power-supply/for-next as dependencies are merged to there
>>    - plenty of dt-binding changes as suggested by reviewers
>>    - add new patch to better document existing 'trickle-charging' property
>>    More accurate changelog in individual patches
>>
>>    RFCv1 => v2:
>>    - Drop RFC status
>>    - Use stacked regmaps to hide secondary map from the sub-drivers
>>    - Quite a few styling fixes and improvements as suggested by
>>      reviewers. More accurate changelog in individual patches.
>>    - Link to v1:
>>      https://lore.kernel.org/all/cover.1759824376.git.mazziesaccount@gmail.com/
>>
>> ---
>>
>> Matti Vaittinen (17):
>>    dt-bindings: regulator: ROHM BD72720
>>    dt-bindings: battery: Clarify trickle-charge
>>    dt-bindings: battery: Add trickle-charge upper limit
>>    dt-bindings: battery: Voltage drop properties
>>    dt-bindings: mfd: ROHM BD72720
>>    dt-bindings: leds: bd72720: Add BD72720
>>    mfd: rohm-bd71828: Use regmap_reg_range()
>>    mfd: rohm-bd71828: Use standard file header format
>>    mfd: rohm-bd71828: Support ROHM BD72720
>>    regulator: bd71828: rename IC specific entities
>>    regulator: bd71828: Support ROHM BD72720
>>    gpio: Support ROHM BD72720 gpios
>>    clk: clk-bd718x7: Support BD72720 clk gate
>>    rtc: bd70528: Support BD72720 rtc
>>    power: supply: bd71828: Support wider register addresses
>>    power: supply: bd71828-power: Support ROHM BD72720
>>    MAINTAINERS: Add ROHM BD72720 PMIC
>>
>>   .../bindings/leds/rohm,bd71828-leds.yaml      |    7 +-
>>   .../bindings/mfd/rohm,bd72720-pmic.yaml       |  339 ++++++
>>   .../bindings/power/supply/battery.yaml        |   33 +-
>>   .../regulator/rohm,bd72720-regulator.yaml     |  148 +++
>>   MAINTAINERS                                   |    2 +
>>   drivers/clk/Kconfig                           |    4 +-
>>   drivers/clk/clk-bd718x7.c                     |   10 +-
>>   drivers/gpio/Kconfig                          |    9 +
>>   drivers/gpio/Makefile                         |    1 +
>>   drivers/gpio/gpio-bd72720.c                   |  281 +++++
>>   drivers/mfd/Kconfig                           |   18 +-
>>   drivers/mfd/rohm-bd71828.c                    |  555 ++++++++-
>>   drivers/power/supply/bd71828-power.c          |  160 ++-
>>   drivers/regulator/Kconfig                     |    8 +-
>>   drivers/regulator/bd71828-regulator.c         | 1025 ++++++++++++++++-
>>   drivers/rtc/Kconfig                           |    3 +-
>>   drivers/rtc/rtc-bd70528.c                     |   21 +-
>>   include/linux/mfd/rohm-bd72720.h              |  634 ++++++++++
>>   include/linux/mfd/rohm-generic.h              |    1 +
>>   19 files changed, 3127 insertions(+), 132 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml
>>   create mode 100644 drivers/gpio/gpio-bd72720.c
>>   create mode 100644 include/linux/mfd/rohm-bd72720.h
> 
> The MFD parts LGTM.

Thanks Lee!

> What Acks are you waiting on?  What's the merge strategy?

I think everything else has been acked by maintainers, except the 
power-supply parts. I think those have only been looked at by Andreas 
and Linus W. Haven't heard anything from Sebastian :(

I would love to see the patches 1 - 14 and 17 to be merged (via MFD?). I 
could then re-spin the 15 and 16 to limited audience as I hope Sebastian 
had time to take a look at them. However, I don't think any of the other 
patches in the series depend on the last .

Yours,
  -- Matti.


---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

