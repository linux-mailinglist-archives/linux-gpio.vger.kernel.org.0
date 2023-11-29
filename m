Return-Path: <linux-gpio+bounces-637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC57FD03F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 09:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BA89B21238
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 08:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357A3111BD;
	Wed, 29 Nov 2023 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsZR4+oD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E783919B9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 00:00:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54b89582efeso3385190a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 00:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701244807; x=1701849607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wUfUD/oQz54nGG7jbhVhWy8+i62QavId9Qpb09Q0Qyw=;
        b=SsZR4+oDpas/jZScqZ7oUKNCMebX09qBx6NIIFkhqwVmAlhKNv4wV2i0c6fbZDowl+
         PnHiJhKq+VpR5ieOt1v/3pkvx6RjudaQUQFlsAIAB0V47xyxP/DPUcfZwC3WmNtKx7nk
         irAT/bgKvM11eXCY11a8TKHmJRtWRPyq56WT0n67Lc65B8R4F7yP9+NoV9A33b+XI3f8
         WWXH0LLue8QzVMVJ6jMRq3fJDVMz0NHkk+lTC4CGS8ehoxEffalqpgaeK/RisgNZTPFw
         ick8lm6Z12ObX0+dwpYVfp1bd7XDHL0wY1OrUJQ+YoCoxRNC/vfti7ksWQVgoCutHFMn
         zruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701244807; x=1701849607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUfUD/oQz54nGG7jbhVhWy8+i62QavId9Qpb09Q0Qyw=;
        b=iaJ3XBqdCda4Y2Un45kZYIvrh2TcweBrX915Wa9pby7pfueJtkdab6UEYi7J2LOqo/
         xZpwxQ2OEj26TILpwSJDBmLgQPdSdOS50GAlhoJBDBkNzseDiiTRWkipmO902u85sgwV
         HjFPFvFtI5d7djSvGNmFbAnPsO/tfl/WZWyD4Lc/K2hRXpM9vEZ5oqtscMQ9cyxjfK7h
         joag67I+DizFWk7O+CFfBEpJcmNtxGrj36YfBajHLXIIltIbrBmi+EGWfFX6Mk+cDSMI
         FHwuGJ8ycyMbFMsOyIFkqb74VJE+PBCavgHDegJmnFrpmrz+5/lSj4BtVk2bFCRnUfj4
         4EUA==
X-Gm-Message-State: AOJu0Yx4sAIpvL4UeGwj0wfWekItEFFTmvPbHSeNbT0RHwOHwZDfs+dL
	f7zkSkhXBLNHME6Ci+cV/ngyQQ==
X-Google-Smtp-Source: AGHT+IEc14tdp6TvnxmKroZTOZjJqE7gPgswZziSscWMYri53yt+h5aqh/mjyofHXov+LCugo6Wcsg==
X-Received: by 2002:a05:6402:320e:b0:54b:4e14:ee14 with SMTP id g14-20020a056402320e00b0054b4e14ee14mr8576603eda.23.1701244807219;
        Wed, 29 Nov 2023 00:00:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402014300b00543b2d6f88asm7061697edu.15.2023.11.29.00.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:00:06 -0800 (PST)
Message-ID: <a0ac295b-ea96-475c-acde-5a61de8ca170@linaro.org>
Date: Wed, 29 Nov 2023 09:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non wake
 up external gpio interrupt
To: Youngmin Nam <youngmin.nam@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com>
 <20231126094618.2545116-1-youngmin.nam@samsung.com>
 <bb738a6b-815d-4fad-b73f-559f1ba8cd68@linaro.org> <ZWU75VtJ/mXpMyQr@perf>
 <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
 <CAPLW+4n0SAOTb6wocY-WjkxgSFMbx+nVuqdaPcNYVDsbfg+EfA@mail.gmail.com>
 <ZWbjPIydJRrPnuDy@perf>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZWbjPIydJRrPnuDy@perf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2023 08:07, Youngmin Nam wrote:
> On Tue, Nov 28, 2023 at 03:35:53PM -0600, Sam Protsenko wrote:
>> On Tue, Nov 28, 2023 at 1:29 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 28/11/2023 02:01, Youngmin Nam wrote:
>>>> On Mon, Nov 27, 2023 at 10:54:56AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 26/11/2023 10:46, Youngmin Nam wrote:
>>>>>> To support affinity setting for non wake up external gpio interrupt,
>>>>>> add irq_set_affinity callback using irq number from pinctrl driver data.
>>>>>>
>>>>>> Before this patch, changing the irq affinity of gpio interrupt is not possible:
>>>>>>
>>>>>>     # cat /proc/irq/418/smp_affinity
>>>>>>     3ff
>>>>>>     # echo 00f > /proc/irq/418/smp_affinity
>>>>>
>>>>> Does this command succeed on your board?
>>>>>
>>>> Yes.
>>>
>>> Hm, fails all the time one mine.
>>>
>>
>> I tried to test this patch on E850-96, and an attempt to write into
>> smp_affinity (for some GPIO irq) also fails for me:
>>
>>     # echo f0 > smp_affinity
>>     -bash: echo: write error: Input/output error
>>
>> When I add some pr_err() to exynos_irq_set_affinity(), I can't see
>> those printed in dmesg. So I guess exynos_irq_set_affinity() doesn't
>> get called at all. So the error probably happens before
>> .irq_set_affinity callback gets called.
>>
>> Youngmin, can you please try and test this patch on E850-96? This
>> board is already supported in upstream kernel. For example you can use
>> "Volume Up" interrupt for the test, which is GPIO irq.
>>
> 
> I intened this affinity setting would work only on *Non* Wakeup External Interrupt.
> The "Volume Up" on E850-96 board is connected with "gpa0-7" and
> that is Wakeup External interrupt so that we can't test the callback.
> 
> I couldn't find out a pin for the test on E850-96 board yet.
> We can test if there is a usage of *Non" Wake up External Interrupt of GPIO
> on E850-96 board.
> 
> Do you have any idea ?

Please test on any upstream platform or upstream your existing platform.
I hesitate to take this change because I don't trust Samsung that this
was tested on mainline kernel. OK, for sure 100% it was not tested on
mainline, but I am afraid that differences were far beyond just missing
platforms. Therefore the issue might or might not exist at all. Maybe
issue is caused by other Samsung non-upstreamed code.

Best regards,
Krzysztof


