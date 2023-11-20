Return-Path: <linux-gpio+bounces-300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2D7F2170
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 00:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7234E1C217F5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 23:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6FB3B2A9;
	Mon, 20 Nov 2023 23:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJEMpXeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E99385;
	Mon, 20 Nov 2023 15:31:17 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1378787276.3;
        Mon, 20 Nov 2023 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700523076; x=1701127876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=V+K6hgLHS0z0nvHsglPl4zOP5uaW3Nv0I1YV5l8r1Wc=;
        b=AJEMpXeqAqTpefqy3UoL+4+tGp95xaJZnqHurFFWe3qkHia31mjVJwbGQKAmcm8IGW
         MkXu9ccaBefnwTeETT5ESYWkjukDM+IrFF8XUlnIhuPisZURBs6RqtKWOrhDXC3XcrYW
         NHUrae8Of7f0dtdVIbirhnSlhIyjkg+dAtBA+gVnw7Tn7kHXGFXJQIoxg3jSs347rFbq
         xjE9QsTjeDCb0n+xdjLN/6qswnnpcHIhpuVq3afcfiCMhplJth64IvOcLE603AMh6isG
         EfospxK1EQ0tnJTeYfjCwRtQiJ+sfgfV4z0a/RvRb2DbgW7AiC6sQHARsaNjerB9uXJB
         jw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700523076; x=1701127876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+K6hgLHS0z0nvHsglPl4zOP5uaW3Nv0I1YV5l8r1Wc=;
        b=Q5j3YFWgsgZEFCGqiJqoObd8TY7E3nLN+q4U66a1e4GRt+kZtuHVntL7LZZ7vUEEhk
         N3KApHV0k8B6WKmqW/gaw2Kqta/7mUStNTW2F2EFHW8V/xsrlAvFWWvRuhyi02IwQH+8
         cPrTZ4mLhPfSvpnq4dPejnY/QD3o1j8m3F8iVsD2A7dBQwQ3HKT2Tbx7zcYwa5JyDTZ/
         9tnrQBMe9uJ+X07JX9HyN9A/5a5ceFFiOTvEiGhaOyX/svcCKDcunyjny5i2SZJsuZHD
         FH6aAq4GAskYV1/T2aCnya3MZE4lvLftwTde+BfUwZ+3iqkiLVgYOcCBND04zVRCljkj
         HZ9Q==
X-Gm-Message-State: AOJu0YwdotmFib3ZAFlF9RaaZPSwqyLhVbjQFBE0zbe60e/uDdXKTHwy
	B+C5b8CQFBbSGTXrNg0o+gmm1LGtEbs=
X-Google-Smtp-Source: AGHT+IGQVq2Z9Sf+Ple48rifo6jtgOzSagAOCz+8BH5RtxatHkA7MXdYj78PLv8emqT3e4ktaU/HYg==
X-Received: by 2002:a25:9c06:0:b0:da0:3636:b506 with SMTP id c6-20020a259c06000000b00da03636b506mr8180893ybo.64.1700523076618;
        Mon, 20 Nov 2023 15:31:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 123-20020a251381000000b00da0abddeb02sm296560ybt.34.2023.11.20.15.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 15:31:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a39ba78a-41f2-4098-8395-faf5122bacb6@roeck-us.net>
Date: Mon, 20 Nov 2023 15:31:12 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org>
 <5ee955e4-4c22-4696-8001-1e4f24952eeb@roeck-us.net>
 <CADrjBPoHYTZiMCFKBtdaT6hFp9QO=GMzn5yE2k3Dg_mcBhrvkA@mail.gmail.com>
 <0c37e32f-079c-4b91-a9db-1c1c2df299b1@roeck-us.net>
 <CADrjBPog+7p3Njx4E_gU1uZRrOULNXVV2fbcL5pxce2tM3=Q=g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADrjBPog+7p3Njx4E_gU1uZRrOULNXVV2fbcL5pxce2tM3=Q=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/23 15:20, Peter Griffin wrote:
> Hi Guenter,
> 
> On Mon, 20 Nov 2023 at 23:03, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/20/23 14:45, Peter Griffin wrote:
>>> Hi Guenter,
>>>
>>> Thanks for the review.
>>>
>>> On Mon, 20 Nov 2023 at 22:00, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 11/20/23 13:20, Peter Griffin wrote:
>>>>> The WDT uses the CPU core signal DBGACK to determine whether the SoC
>>>>> is running in debug mode or not. If the DBGACK signal is asserted and
>>>>> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>>>>>
>>>>> Presence of the DBGACK_MASK bit is determined by adding a new
>>>>> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
>>>>> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
>>>>> drv_data_gs101_cl1 quirks.
>>>>>
>>>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>>>> ---
>>>>>     drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>>>>>     1 file changed, 27 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>> index 08b8c57dd812..ed561deeeed9 100644
>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>> @@ -34,9 +34,10 @@
>>>>>
>>>>>     #define S3C2410_WTCNT_MAXCNT        0xffff
>>>>>
>>>>> -#define S3C2410_WTCON_RSTEN  (1 << 0)
>>>>> -#define S3C2410_WTCON_INTEN  (1 << 2)
>>>>> -#define S3C2410_WTCON_ENABLE (1 << 5)
>>>>> +#define S3C2410_WTCON_RSTEN          (1 << 0)
>>>>> +#define S3C2410_WTCON_INTEN          (1 << 2)
>>>>> +#define S3C2410_WTCON_ENABLE         (1 << 5)
>>>>> +#define S3C2410_WTCON_DBGACK_MASK    (1 << 16)
>>>>>
>>>>>     #define S3C2410_WTCON_DIV16 (0 << 3)
>>>>>     #define S3C2410_WTCON_DIV32 (1 << 3)
>>>>> @@ -107,12 +108,16 @@
>>>>>      * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
>>>>>      * with "watchdog counter enable" bit. That bit should be set to make watchdog
>>>>>      * counter running.
>>>>> + *
>>>>> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
>>>>> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>>>>
>>>> This is a bit difficult to understand. I _think_ it means that the DBGACK_MASK bit
>>>> has to be set to be able to trigger interrupt and reset requests.
>>>
>>> Not quite, it is a bit that controls masking the watchdog outputs when the SoC
>>> is in debug mode.
>>>
>>>> "masking" normally refers to disabling something (at least in interrupt context).
>>>> "Enables masking WDT interrupt" sounds like the bit has to be set in order to
>>>> be able to disable interupts, and the code below suggests that the bit has to be
>>>> set for the driver to work. Is that the case ? It might make sense to explain this
>>>> a bit further.
>>>
>>> Maybe I explained it more clearly in the commit message than the comment
>>>
>>> "The WDT uses the CPU core signal DBGACK to determine whether the SoC
>>> is running in debug mode or not. If the DBGACK signal is asserted and
>>> DBGACK_MASK is enabled, then WDT output and interrupt is masked."
>>>
>>> Is that any clearer? Or maybe simpler again
>>>
>>> "Enabling DBGACK_MASK bit masks the watchdog outputs when the SoC is
>>> in debug mode. Debug mode is determined by the DBGACK CPU signal."
>>>
>>> Let me know what you think is the clearest and most succinct and I can
>>> update the comment.
>>>
>>
>> You are still using the term "masked" which I think just hides what
>> the code is really doing. Why not just say "disable" ?
> 
> The reason for using the "masked" terminology was that is what the
> Watchdog IP TRM uses throughout to describe the feature. But I agree
> just saying disable is clearer.
> 

At least please say something like "masked (disabled)" if you want to use
the term.

Thanks,
Guenter


