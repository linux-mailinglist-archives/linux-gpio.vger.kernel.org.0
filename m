Return-Path: <linux-gpio+bounces-297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A237F2131
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 00:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EF78B219ED
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 23:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B2D3AC32;
	Mon, 20 Nov 2023 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNDsN0PX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D4EC8;
	Mon, 20 Nov 2023 15:03:50 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5cb68b8fa27so3285337b3.0;
        Mon, 20 Nov 2023 15:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700521430; x=1701126230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wy00UAbbeK5FI852LAsyQcSkAXKUMJhM0If0BzmnvZs=;
        b=KNDsN0PXUEPtfLYsCxU+grLRCiwVrxWz4k7BCWMwej43SVZKJ2y1iCjtzbok5Fkq8R
         hFh/ec8lUGvh1587Kbh3dXbH+JFSBDZ9U7KgYugTjB9D9jBM4heRTfFRNKwa+nBJf6rJ
         N/kpVIN2eUnk4sXc0/qs8/vK82nAMTCflPp2GFG4X3pBcQUjrXu/U44wwrhoxDl7wy4H
         NLxzl2MOzTVH5E08xfp7RxaGQIC5nbMOMDA7dmNBnNJ2fXryDxNdC0I+eK+iu/57xqQX
         nWzGkfitgs/5fQ40gsXA/LNDVWgXaf6xOOA2JVFp1mTDffOOAkL35ZednwPTLk6P+8bT
         rcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700521430; x=1701126230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wy00UAbbeK5FI852LAsyQcSkAXKUMJhM0If0BzmnvZs=;
        b=p/CYNQQg4+nTvMuN9FjuOUWw7gp7Td1Ils6FxHMaEnKeiDW8g47xYvBnUH4CoW8Ro/
         QUQ5hb+83icEOAAYgyQgH/xrQpDls97IRv+coATAlkf5MWMizM/802iHKt5BNajdi1WF
         tLsCJlFW9yZlqtyRrtkq9qg2XPymR9nGARHA6/RuYpkW3y5MA/NQBaenPEiHtN3swShx
         XyJrEhdonLyoIfSge9hOY5KNh5MVxajEa8YaE10V7umhx8jJXnLJRTBXsO0ZKajAV/RQ
         FmNccfXWx77/+ff2tVmU2Z+jDN9BBkbyId/31raFsK/TeHHC5VLZRBeT6stEZ0baoIPy
         6Ing==
X-Gm-Message-State: AOJu0YwGa5C7LjREpsxE5IyyPbuV2heG3jPrsQ3c28EgRwrIvKZzg5Mx
	jP2828tSiDnkF0aNLhk18WE=
X-Google-Smtp-Source: AGHT+IGYlAEfoxYA7AJY5M2yRakrukiNgREDVZO8WTldGJwPJ61r6TUrD/h4WFMpZuk8ZsjQb/N6Pw==
X-Received: by 2002:a05:690c:b0c:b0:5c9:7590:1535 with SMTP id cj12-20020a05690c0b0c00b005c975901535mr8174025ywb.16.1700521429677;
        Mon, 20 Nov 2023 15:03:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i205-20020a8154d6000000b0059bcadded9dsm2655365ywb.116.2023.11.20.15.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 15:03:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c37e32f-079c-4b91-a9db-1c1c2df299b1@roeck-us.net>
Date: Mon, 20 Nov 2023 15:03:44 -0800
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
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADrjBPoHYTZiMCFKBtdaT6hFp9QO=GMzn5yE2k3Dg_mcBhrvkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/23 14:45, Peter Griffin wrote:
> Hi Guenter,
> 
> Thanks for the review.
> 
> On Mon, 20 Nov 2023 at 22:00, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/20/23 13:20, Peter Griffin wrote:
>>> The WDT uses the CPU core signal DBGACK to determine whether the SoC
>>> is running in debug mode or not. If the DBGACK signal is asserted and
>>> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>>>
>>> Presence of the DBGACK_MASK bit is determined by adding a new
>>> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
>>> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
>>> drv_data_gs101_cl1 quirks.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>    drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>>>    1 file changed, 27 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>> index 08b8c57dd812..ed561deeeed9 100644
>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>> @@ -34,9 +34,10 @@
>>>
>>>    #define S3C2410_WTCNT_MAXCNT        0xffff
>>>
>>> -#define S3C2410_WTCON_RSTEN  (1 << 0)
>>> -#define S3C2410_WTCON_INTEN  (1 << 2)
>>> -#define S3C2410_WTCON_ENABLE (1 << 5)
>>> +#define S3C2410_WTCON_RSTEN          (1 << 0)
>>> +#define S3C2410_WTCON_INTEN          (1 << 2)
>>> +#define S3C2410_WTCON_ENABLE         (1 << 5)
>>> +#define S3C2410_WTCON_DBGACK_MASK    (1 << 16)
>>>
>>>    #define S3C2410_WTCON_DIV16 (0 << 3)
>>>    #define S3C2410_WTCON_DIV32 (1 << 3)
>>> @@ -107,12 +108,16 @@
>>>     * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
>>>     * with "watchdog counter enable" bit. That bit should be set to make watchdog
>>>     * counter running.
>>> + *
>>> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
>>> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>>
>> This is a bit difficult to understand. I _think_ it means that the DBGACK_MASK bit
>> has to be set to be able to trigger interrupt and reset requests.
> 
> Not quite, it is a bit that controls masking the watchdog outputs when the SoC
> is in debug mode.
> 
>> "masking" normally refers to disabling something (at least in interrupt context).
>> "Enables masking WDT interrupt" sounds like the bit has to be set in order to
>> be able to disable interupts, and the code below suggests that the bit has to be
>> set for the driver to work. Is that the case ? It might make sense to explain this
>> a bit further.
> 
> Maybe I explained it more clearly in the commit message than the comment
> 
> "The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK is enabled, then WDT output and interrupt is masked."
> 
> Is that any clearer? Or maybe simpler again
> 
> "Enabling DBGACK_MASK bit masks the watchdog outputs when the SoC is
> in debug mode. Debug mode is determined by the DBGACK CPU signal."
> 
> Let me know what you think is the clearest and most succinct and I can
> update the comment.
> 

You are still using the term "masked" which I think just hides what
the code is really doing. Why not just say "disable" ?

"Setting the DBGACK_MASK bit disables the watchdog outputs when the SoC is
  in debug mode. Debug mode is determined by the DBGACK CPU signal."

That seems to be much clearer to me, though I think there should still
be a comment along the line of "disable watchdog output if CPU is in
debug mode" in the code.

That doesn't really explain _why_ the watchdog is disabled in this mode,
but at least it makes it obvious what is happening.

>>
>>>     */
>>>    #define QUIRK_HAS_WTCLRINT_REG                      (1 << 0)
>>>    #define QUIRK_HAS_PMU_MASK_RESET            (1 << 1)
>>>    #define QUIRK_HAS_PMU_RST_STAT                      (1 << 2)
>>>    #define QUIRK_HAS_PMU_AUTO_DISABLE          (1 << 3)
>>>    #define QUIRK_HAS_PMU_CNT_EN                        (1 << 4)
>>> +#define QUIRK_HAS_DBGACK_BIT                 (1 << 5)
>>>
>>>    /* These quirks require that we have a PMU register map */
>>>    #define QUIRKS_HAVE_PMUREG \
>>> @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
>>>        .cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
>>>        .cnt_en_bit = 8,
>>>        .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>>> -               QUIRK_HAS_WTCLRINT_REG,
>>> +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>>    };
>>>
>>>    static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>>> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>>>        .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
>>>        .cnt_en_bit = 7,
>>>        .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>>> -               QUIRK_HAS_WTCLRINT_REG,
>>> +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>>    };
>>>
>>>    static const struct of_device_id s3c2410_wdt_match[] = {
>>> @@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>>>        return 0;
>>>    }
>>>
>>> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
>>
>> I think I must be missing something. This is only ever called with mask==true,
>> meaning the bit, if present, is always set.
>>
>> Why not call the function s3c2410wdt_set_dbgack() and drop the unnecessary
>> parameter ?
> 
> I can update like you suggest, it would simplify the logic a little bit.
> 

Please do.

Thanks,
Guenter

