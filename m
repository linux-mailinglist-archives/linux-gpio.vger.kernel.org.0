Return-Path: <linux-gpio+bounces-199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C17EDF73
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 12:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA68F281098
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 11:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D472E3E8;
	Thu, 16 Nov 2023 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IK0dI8TY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B50DD6A
	for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 03:17:45 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-41cb615c6fbso3731081cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700133464; x=1700738264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/ViPVFwqUwSC+Tx+7EWOjQPL45nD+KFikxOfTzEf40=;
        b=IK0dI8TYVXcjF18RdMU0r6Zq6q9TqlfLhETnq36Io1eOcKpLxdTbY/ASnXF2KrzhPB
         5juaD2W4rL34jowj3bekaprEJh+kv24mc/nAw/duGETdXWpmNtCtUCQQqgo9TPjbuzxF
         vBUGSSYY5z3PutDQ/Ppk1+DeZc/VfElj+1vGIh5Lv4B2f4hiPQUgUUPuyNg8tl2RETmT
         6wC02lEEKtoarpy4/Sx9r/uLnqit3ewTl63yQTAkY7IE1HDyUaa/j1xj1Dx0qBrd4Biv
         AF2AjEGWimYAdwUEEONwNJQXg/n9l0LEIqXg78DwV3Y89RP3jXCmVb12N/nqtaKPet7g
         Ke4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700133464; x=1700738264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/ViPVFwqUwSC+Tx+7EWOjQPL45nD+KFikxOfTzEf40=;
        b=HpfjEqDva7kT1FE0s6yzDXM1lrzEmMdr9l1XqOCMiky2A4UBXp0e1q7dLfYJ6x91FV
         9VY4LyYCJ7VG5cQJrTD09Vn9CmruYlRG+pIvefB/wDw6BnY4YPbCr9LTdivqiK25jYpR
         RIrUJ9sdRiSgUd5jqUT8Yu6RUXbwKgfxecHLurCD9vyAOVGBVXgZIdHSWzew+zujmJ/v
         iE0D/4BHgQhWBeO0MJUbYsMBpPN6Z0pH0fJTvLxv20JJCNgnoNvDU5xnevp0qVjEj8dw
         KHkWy9Pex6eCovm7K5saMua9joUdxl86cfiv4DOC+tukTgvBOYS5xs49KIAvDVuokIj0
         r64A==
X-Gm-Message-State: AOJu0YzIRyJG4f+eTN2mm1VsVE9DWKzikmXaHOjNGn+aMJ6nyYwEGXR8
	7f6Qq7R7Pgtg6qbRapPdGOYszA==
X-Google-Smtp-Source: AGHT+IGmc3lg9F/gM+4W6WD1vBOiWRD8zNb/8rybZdvYVfRMFHMyluxpL95roHczIvbweCyaSHw1Vg==
X-Received: by 2002:a05:622a:612:b0:421:c806:cd83 with SMTP id z18-20020a05622a061200b00421c806cd83mr8900859qta.30.1700133464221;
        Thu, 16 Nov 2023 03:17:44 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id r5-20020ac85205000000b0041519614354sm4271080qtn.7.2023.11.16.03.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:17:43 -0800 (PST)
Message-ID: <b25df5a4-d426-418c-b8da-cc92f441f2bf@linaro.org>
Date: Thu, 16 Nov 2023 12:17:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: samsung: add exynosautov920 pinctrl
Content-Language: en-US
To: Jaewon Kim <jaewon02.kim@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231115095609.39883-1-jaewon02.kim@samsung.com>
 <CGME20231115095856epcas2p1c3ee85750828bec2ee4ab0adeaeaff28@epcas2p1.samsung.com>
 <20231115095609.39883-11-jaewon02.kim@samsung.com>
 <ae03b902-fa12-4a33-9a4f-ab3a5956ea5c@linaro.org>
 <221efdec-4940-031c-73b1-30aed96c76b0@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <221efdec-4940-031c-73b1-30aed96c76b0@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2023 04:50, Jaewon Kim wrote:
> 
> On 23. 11. 15. 21:42, Krzysztof Kozlowski wrote:
>> On 15/11/2023 10:56, Jaewon Kim wrote:
>>> ExynosAutov920 GPIO has a different register structure.
>>> In the existing Exynos series, EINT control register enumerated after
>>> a specific offset (e.g EXYNOS_GPIO_ECON_OFFSET).
>>> However, in ExynosAutov920 SoC, the register that controls EINT belongs
>>> to each GPIO group, and each GPIO group has 0x1000 align.
>>>
>>> This is a structure to protect the GPIO group with S2MPU in VM environment,
>>> and will only be applied in ExynosAuto series SoCs.
>> Checkpatch points some warnings:
>>
>> CHECK: Alignment should match open parenthesis
>> CHECK: Lines should not end with a '('
>> CHECK: Macro argument reuse 'reg' - possible side-effects?
> 
> I don`t know this happens.
> 
> When I did the checkpatch, there were no problems as shown below.

Didn't you miss some arguments? Lime --strict?

Best regards,
Krzysztof


