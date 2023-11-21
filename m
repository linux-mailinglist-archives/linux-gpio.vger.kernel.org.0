Return-Path: <linux-gpio+bounces-332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E8F7F35B1
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 19:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4533B21A38
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 18:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A982B2209E;
	Tue, 21 Nov 2023 18:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxqvnc/7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47DF10D2;
	Tue, 21 Nov 2023 10:10:38 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5cbbe2cba33so7643417b3.1;
        Tue, 21 Nov 2023 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700590238; x=1701195038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XSGDO0qxcc9Ud2kE8ZCLHb5Pa7tgaGHF2YUCWnyFA10=;
        b=Jxqvnc/77IYNvQlcDfG8p9pIMVfE8RuF8mikK8XvFitU+mCN0sOELt2d0NTErOivhP
         wq9GwqJdKinbbLpL2DoQ8IAZSmc1tzKCo6cFbBNejYohEFpB4bVXOtZM0UJQfH6CFdwJ
         8K9wT++cmyceYKuf00xPhtVRSJQPp32VGJiXvvi+otjRUElyTglj/rIFPAh9EPIeAq1o
         Z2dau4b9tqOVJR4N5UKcmK/EIQJA+Kt4sl/NA9T4XGjF0DxQ8oPZKl2HMrw+Fn3H0rNE
         f2X9nomKH/ZxjM49CfFQzQjUwkF3v11JuTyksx/Xa+6xdE5tRg0SzUs+txQTLYsfAPXt
         75hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700590238; x=1701195038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSGDO0qxcc9Ud2kE8ZCLHb5Pa7tgaGHF2YUCWnyFA10=;
        b=DtlCQFF9Szwa9uU34mvVDIIVQAalLT8BlhMPAWbg4ffB3UfDB8vKJ/yX2OOn+RzdOk
         y1zBVWxNjdAyIvj11g/63cc9ICgnaYv2deNqVNqEcfa0yWju/16GDfZ023kDkd3bB0Jf
         bfNgcu0+1SMNg/v+KkV0ASOVb4A6MOIHD9fHyhVuor7YNBzMru1BjwQ2exxtB0qhtJPH
         Jp+nla8voJfHRFLcsRouSs8cuxY+3IIhyzmy5y9Fg/ibdi0cx08IZ7kv/0lsXvAvJoxK
         zsTeav1VazDsqSjPymuhcy3FSdvrUAS8L9uwEIIrtsKZU4vKCuqeqfA/h2XiWnay4h0X
         F2SQ==
X-Gm-Message-State: AOJu0Yw6x2r/eF16CMx9WNBdA7Sgks8iQtua2TVSPV7V09XU4xEBLonn
	edJn3W+sC30SWI1qBRPjosg=
X-Google-Smtp-Source: AGHT+IHUIw3AdAn4kIG5DXgr1aU9R6c3URGa4QUM/YnqGSHjxfjtf4gytlVhbe0m7vBdDbxOvNcxHw==
X-Received: by 2002:a81:ca04:0:b0:5ca:15db:5c66 with SMTP id p4-20020a81ca04000000b005ca15db5c66mr6899032ywi.18.1700590238056;
        Tue, 21 Nov 2023 10:10:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r63-20020a815d42000000b005a42740fcd4sm3170890ywb.94.2023.11.21.10.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 10:10:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d838a0b-6a13-4538-8dd6-e044ebfabca7@roeck-us.net>
Date: Tue, 21 Nov 2023 10:10:32 -0800
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
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com,
 willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org>
 <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/23 09:52, Sam Protsenko wrote:
> On Mon, Nov 20, 2023 at 3:21 PM Peter Griffin <peter.griffin@linaro.org> wrote:
>>
>> The WDT uses the CPU core signal DBGACK to determine whether the SoC
>> is running in debug mode or not. If the DBGACK signal is asserted and
>> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>>
>> Presence of the DBGACK_MASK bit is determined by adding a new
>> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
>> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
>> drv_data_gs101_cl1 quirks.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> ---
>>   drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>>   1 file changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>> index 08b8c57dd812..ed561deeeed9 100644
>> --- a/drivers/watchdog/s3c2410_wdt.c
>> +++ b/drivers/watchdog/s3c2410_wdt.c
>> @@ -34,9 +34,10 @@
>>
>>   #define S3C2410_WTCNT_MAXCNT   0xffff
>>
>> -#define S3C2410_WTCON_RSTEN    (1 << 0)
>> -#define S3C2410_WTCON_INTEN    (1 << 2)
>> -#define S3C2410_WTCON_ENABLE   (1 << 5)
>> +#define S3C2410_WTCON_RSTEN            (1 << 0)
>> +#define S3C2410_WTCON_INTEN            (1 << 2)
>> +#define S3C2410_WTCON_ENABLE           (1 << 5)
>> +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>>
>>   #define S3C2410_WTCON_DIV16    (0 << 3)
>>   #define S3C2410_WTCON_DIV32    (1 << 3)
>> @@ -107,12 +108,16 @@
>>    * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
>>    * with "watchdog counter enable" bit. That bit should be set to make watchdog
>>    * counter running.
>> + *
>> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
>> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>>    */
>>   #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
>>   #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
>>   #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
>>   #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
>>   #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
>> +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
>>
>>   /* These quirks require that we have a PMU register map */
>>   #define QUIRKS_HAVE_PMUREG \
>> @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
>>          .cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
>>          .cnt_en_bit = 8,
>>          .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>> -                 QUIRK_HAS_WTCLRINT_REG,
>> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>   };
>>
>>   static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>>          .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
>>          .cnt_en_bit = 7,
>>          .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>> -                 QUIRK_HAS_WTCLRINT_REG,
>> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>   };
>>
> 
> This patch states it's adding the feature, but in fact it's also
> enabling this feature for gs101. Suggest moving this patch before the
> one enabling gs101 wdt. This way, one patch will only add the feature,
> and another patch will enable gs101 entirely (with this feature used).
> At least it seems like more atomic approach to me.
> 

Both approaches have their merits and their downsides. I for my part am not
even sure if DBGACK_MASK should be enabled unconditionally if supported.
With your approach, it would be impossible (or at least more difficult) to
revert if it turns out to be broken and/or have unexpected side effects.
That seems less desirable to me than the current approach.

Guenter


