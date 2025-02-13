Return-Path: <linux-gpio+bounces-15889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DDA337BE
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 07:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B783A4113
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 06:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A03207646;
	Thu, 13 Feb 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="RX20qZHv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBA20764B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427169; cv=none; b=osanNa6g2hgbWkgxD2wBE7ATOLl5XEJJXguvqpy50tZi7YHufoAU+dWrDU0JxWsi/13SPfMs4LIsCbrzJrgPgWO+xlogd9+t85gy8tPITL7FoTwxki35JnQrx3oHiadT9PZvSbqswKSARx9RUYHJYPYW0n9ZN5C9p0r2zKWmDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427169; c=relaxed/simple;
	bh=7C3/E7K4p+lE3lRlzJSt5GqsDZ487XK98lSEw0sndWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIa/klC3ZQbh9amelgMiZyR/hCBCmEh8/m7Ib1AEDKIbj8xnkAn+TF2P175glMf+jmcEkOX2pJ4vQYi3Auq3oTJ1MIwofpXfbx0FRy4rRWL33l78mOGaFdnIDT3b0tXO5gYBmk+OFPJFZrfpaBPGXG9iEQILefsIf4SfDbDyI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=RX20qZHv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7430e27b2so106272166b.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 22:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739427165; x=1740031965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWTCEpW4ZKwSUbhFip1v+YkWAMK+zwwmcEHsy52JujU=;
        b=RX20qZHvvhhCAO6lUjSD3gxfZBAhfttqxkvHY6RukzhzOkZUp0WFIkCjucvL461evB
         A3VMcxhuTypbJxOOHgZTdMFnwvjoUYElNw3B0K7GpK2Ol3bYWKyTnL67aP+6JuT3e6vl
         LMPR04MxNRlVPiAoEFQte/C4nwKkudeETR6oE2jntbsS5q8m6N9U7cTFri5zRObZlf7E
         UtiYLzFhmMgCWayqlIcdU7dpXg8aiMpCIsU62psfECfMr+hcrKUqtrD3bm3Hm/jh0N49
         /U86fEoZbjJBFN+3tJR1t6l6xafFM3fDn2KoyrJgWrxjxtDytPsGVYF/zRlX6hHH/vav
         YzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427165; x=1740031965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWTCEpW4ZKwSUbhFip1v+YkWAMK+zwwmcEHsy52JujU=;
        b=veLzvcjkPjejIZkORlm8KBhjdnboO3awhQnop8VRwPEiM0cOvgm/aRJLfayf84M5gF
         8lvJyUezKgznOharHM0z+MLCL5MX+yqWXyJqok51A2XS5VfGUwx7AUM6IRd9hn1eMvFI
         f5Vxfib+djVzj6x1jA4KVrOUkl2g51WRF/af/fI49moSwU4xabBQ6r8hxy3eKCNxzgSR
         4W0PdJGuqAUj/SX95jnWXf8sCPo5J0PEVbFuvDs6gX5EtMtb45I/nEKe2griFq5Soe55
         2I/ESWpEsONTu8S1qqprKkjPR+3PTGQlgZHeFejeXjCHPYM5tfZe51GRKTamogrys0qb
         1eKg==
X-Gm-Message-State: AOJu0YzLMhnWIBz3O5lHrGBawHS/99w49z5dhzWZ455d5OULPDwNk4+y
	65d0dBc28rfl2ptTY065qiXcWsrhAWiIxGNHKs8nlWvJK4xd/xFWDqcDjrR+AA==
X-Gm-Gg: ASbGncvUMwfMD1HCffge/cgv09FtWf+u9WQEznnruXe6rus4kENw8t9mqGkkYd1Jdn4
	uV2om6dB7JcOIgh8Y+BMCzGcIYDV3EFlvLwngy5YGV0+j11lefBfmfU8kVAj6X2we2jrK1i1KlN
	mpaktk40ZGwfzpN2cbDZVSCBnvE571Zqf4CSrKAcwVRhBgxCzrcL/breZwz6Ls9xz+dw0Z59OBr
	idUn1Ft8fyhUKLUzT6VZ/R75pMDiphjRauQcGl+Iq1NcZVc42zctuLPOVa3qB0EOld67+U6ZK80
	2ynta32wLMPjwc1Tf6J6GPp5ow==
X-Google-Smtp-Source: AGHT+IGat6ZjbMuioQKBQXOqTHYElW/luqM/opPulIQKdKaydLsYSALBxKDrmlk/19b2RqF3Lb9tsg==
X-Received: by 2002:a17:907:7288:b0:ab7:b928:1e05 with SMTP id a640c23a62f3a-ab7f334a9e5mr548728666b.4.1739427164707;
        Wed, 12 Feb 2025 22:12:44 -0800 (PST)
Received: from [10.0.72.158] ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337697fsm60116666b.105.2025.02.12.22.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 22:12:44 -0800 (PST)
Message-ID: <7df4608e-8016-4b16-a837-4cd7c3dd8c82@remarkable.no>
Date: Thu, 13 Feb 2025 07:12:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
 <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/10/25 10:35 AM, Bough Chen wrote:
>> -----Original Message-----
>> From: Johan Korsnes <johan.korsnes@remarkable.no>
>> Sent: 2025年2月10日 16:53
>> To: Bough Chen <haibo.chen@nxp.com>; Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>> <bartosz.golaszewski@linaro.org>; imx@lists.linux.dev
>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
>>
>> [You don't often get email from johan.korsnes@remarkable.no. Learn why this is
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 2/7/25 7:21 AM, Bough Chen wrote:
>>>> -----Original Message-----
>>>> From: Linus Walleij <linus.walleij@linaro.org>
>>>> Sent: 2025年2月7日 2:29
>>>> To: Johan Korsnes <johan.korsnes@remarkable.no>
>>>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>>>> <bartosz.golaszewski@linaro.org>; Bough Chen <haibo.chen@nxp.com>
>>>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction
>>>> functions
>>>>
>>>> Hi Johan,
>>>>
>>>> thanks for your patch!
>>>>
>>>> On Thu, Feb 6, 2025 at 7:17 PM Johan Korsnes
>>>> <johan.korsnes@remarkable.no>
>>>> wrote:
>>>>
>>>>> Add locking to `vf610_gpio_direction_input|output()` functions.
>>>>> Without this locking, a race condition exists between concurrent
>>>>> calls to these functions, potentially leading to incorrect GPIO direction
>> settings.
>>>>>
>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> Cc: Haibo Chen <haibo.chen@nxp.com>
>>>>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>>>>
>>>> Looks correct to me, verified by looking at the most tested driver
>>>> gpio-mmio.c and seeing there is a lock there indeed.
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>
>>>>> where after a couple of reboots the race was confirmed. I.e., one
>>>>> user had to wait before acquiring the lock. With this patch the race
>>>>> has not been encountered. It's worth mentioning that any type of
>>>>> debugging (printing, tracing, etc.) would "resolve" the issue.
>>>>
>>>> Typical. I would include this in the commit message, people care.
>>>>
>>
>> Hi Linus and Haibo,
>>
>> Thanks for the review! I'll include this in v2.
>>
>>>> Looking at the driver it seems
>>>> vf610_gpio_irq_mask()/vf610_gpio_irq_unmask()
>>>> could have a similar issue, both write the same register.
>>>
>>> Indeed, and also the vf610_gpio_set() / vf610_gpio_irq_ack().
>>>
>>
>> Could you please explain the race condition we fix by adding locking to these
>> other functions? F.ex. the vf610_gpio_set(), in which scenario would the lack of
>> locking cause an issue? It's a single write to either the set or clear register. Is this
>> related to how the writel_relaxed() works on different architectures?
>>
> 
> Sorry, I think twice of this condition, seems no need to add lock for these functions.
> 

Hi Haibo,

May I add your Reviewed-by or Acked-by in v2?

Kind regards,
Johan

> Regards
> Haibo Chen
> 
>> Kind regards,
>> Johan
>>
>>>>
>>>> Both issues could be fixed by converting the driver to use
>>>> gpio-mmio() with bgpio_init() which would also implement
>>>> get/set_multiple support for free.
>>>>
>>>> I have no idea why this driver isn't using gpio-mmio.
>>>> Not your fault though, just pointing out obvious improvement opportunities.
>>>
>>> I check the code, for
>> vf610_gpio_direction_input()/vf610_gpio_direction_output(), to let the
>> input/output really works, need to call pinctrl_gpio_direction_input() for
>> vf610/imx7ulp/imx8ulp SoC.
>>> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement
>> gpio_set_direction callback. Also for imx7ulp/imx8ulp pinctrl drivers.
>>> This should be the reason why not using gpio-mmio.
>>>
>>> Regards
>>> Haibo Chen
>>>>
>>>> Yours,
>>>> Linus Walleij
> 


