Return-Path: <linux-gpio+bounces-1060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2758806E2D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3897EB20DD3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3237321BB;
	Wed,  6 Dec 2023 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuKaTjKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B54D40
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 03:38:19 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33334480eb4so768565f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701862697; x=1702467497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qm7pCcZmaWCMHPggwY7CXlYkirEJ9BDVaMQ6Qupg/xA=;
        b=YuKaTjKFzlYvUVmPIlI/jO6J4yUO7idRnUbGMFM133GtOcjFF7QUVxfjDMoJjyTdsR
         s6c+q+rOATGuPSrM7pgP8qu7m/P8T+BVMjEscgBRzdZJkmCxflHa1AybKVZtmXcTen+u
         6xmBmi+8aLdA5qtGc2rdoeGzYQXWivBSN5fRV5nXv41tCKDBOZ4ydUznGpF3mpbWgNGy
         yw8cr8eoc3qI9ReEzh6MMpxmHlbJXu44BS/+n7osFfuLVZX5SfEEYicfZqzu9sJ3Yf38
         ZGAkvM8ZW41HVwePSHR7ZdaFkrBfAWIqGhS7T6kh6lxI6rP8qxkAAFBfIDHh6rV7Qdkj
         PxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862697; x=1702467497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm7pCcZmaWCMHPggwY7CXlYkirEJ9BDVaMQ6Qupg/xA=;
        b=UpP9SaHUA1rFTFzI4J/4B6l2JCAUgDKxp09W+OO55R/+MoqdHd87XmodKqXzeeu43u
         TC0qaR4sSMxbHnlUdbMF7AbbVLgEedgnexO7+gwzygTnlaYy0J2kyRQ6eBS8DTA/iAwz
         3sPEQfjegcpC0pADqw/asOPgRTRlhnv/DMnvY7H5VWnGjSLCxFBN0ryoybDaJ81zX5EQ
         ic3rEKfSSs1adTkmfkICrNSXqn7EbctDs9vLK7pp59+x54FhJ2EQU3mdbBG4U1+wPl4n
         Sd7FT8E2gmGtTheYmv+UJc208Fl3RQMnb+tzqFkO5d4Uk+e8JAqfTH3zIFvb6eAmXmSd
         MhVg==
X-Gm-Message-State: AOJu0Ywn04HgnbrB+TUR73TkHnVxzixEYBXc6LMbWGQcnUc6AsQY3lXz
	RBiGIeyhYy82uUxzx7cgg0NYAQ==
X-Google-Smtp-Source: AGHT+IHDl6UGXjkhX+Sh5mNIn+o9ppG/aW6SJEMyI6QLyUYRYrTFnfXaaCrq1qDg++lrAfzAdnteqw==
X-Received: by 2002:a5d:4fca:0:b0:333:387b:687b with SMTP id h10-20020a5d4fca000000b00333387b687bmr387774wrw.34.1701862697689;
        Wed, 06 Dec 2023 03:38:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d64cd000000b003334898aafasm8392073wri.11.2023.12.06.03.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:38:16 -0800 (PST)
Message-ID: <71972f4f-b5ac-484a-8a09-0b74bd7c623b@linaro.org>
Date: Wed, 6 Dec 2023 12:38:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
 configuration
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Sam Protsenko' <semen.protsenko@linaro.org>,
 'Peter Griffin' <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-15-peter.griffin@linaro.org>
 <CGME20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55@epcas5p4.samsung.com>
 <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>
 <000001da24c0$0b83aab0$228b0010$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <000001da24c0$0b83aab0$228b0010$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2023 02:36, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Sam Protsenko <semen.protsenko@linaro.org>
>> Sent: Saturday, December 2, 2023 6:10 AM
>> To: Peter Griffin <peter.griffin@linaro.org>
>> Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
>> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
>> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
>> will@kernel.org; arnd@arndb.de; olof@lixom.net;
>> gregkh@linuxfoundation.org; jirislaby@kernel.org;
>> cw00.choi@samsung.com; alim.akhtar@samsung.com;
>> tudor.ambarus@linaro.org; andre.draszik@linaro.org;
>> saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
>> team@android.com; linux-serial@vger.kernel.org
>> Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
>> configuration
>>
>> On Fri, Dec 1, 2023 at 10:11 AM Peter Griffin <peter.griffin@linaro.org>
>> wrote:
>>>
>>> Add support for the pin-controller found on the gs101 SoC used in
>>> Pixel 6 phones.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++++
>>>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
>>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
>>>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>>>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>>>  5 files changed, 198 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>>> b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>>> index cb965cf93705..e1a0668ecb16 100644
>>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>>> @@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data
>> fsd_of_data __initconst = {
>>>         .ctrl           = fsd_pin_ctrl,
>>>         .num_ctrl       = ARRAY_SIZE(fsd_pin_ctrl),
>>>  };
>>> +
>>> +/*
>>> + * bank type for non-alive type
>>> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
>>> +field: 4)
>>> + * (CONPDN bit field: 2, PUDPDN bit field: 4)  */ static struct
>>> +samsung_pin_bank_type gs101_bank_type_off  = {
>>> +       .fld_width = { 4, 1, 4, 4, 2, 4, },
>>> +       .reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, }, };
>>
>> This is just the same as exynos850_bank_type_off (100% duplication).
>> Here is what I suggest. Now that it's obvious there is some common platform
>> for moder Exynos SoCs, and it's probably Exynos9, I'd suggest next course of
>> action (if maintainers agree):
>>   1. Remove this one
>>   2. Rename exynos850_bank_type_off to exynos9_bank_type_off
>>   3. Use it for both gs101 and exynos850
>>
>> Does it make sense?
>>
> My opinion is to reuse exynos850 for gs101 (wherever applicable), same philosophy was historically followed in this file.
> That way (using exynos850 for gs101) things will be simple. 
> Adding exynos9_* is not adding any benefit, rather it create confusion.

I don't see much value in renaming exynos850 bank type to exynos9
considering:
1. We don't really know the bank types for all of Exynos9xxx SoCs,
2. Exynos7885 also uses Exynos850 bank types. Exynos7885 was much
earlier than Exynos9xxx family.

Best regards,
Krzysztof


