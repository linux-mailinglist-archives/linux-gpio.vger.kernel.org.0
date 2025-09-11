Return-Path: <linux-gpio+bounces-25954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3ABB53485
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E57C63AA03E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D81345720;
	Thu, 11 Sep 2025 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A8TDZ5kV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDCA3451A5
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598669; cv=none; b=muprjjsmUjbA48zOp1+D1xSEihuW7zmodhGLz+6S/2UZB+K46YEVIUDU3j+RfgBjGDCsKm7coW+FclU+2EpUB/lY6aKPKNgFySshktiIihq0mIb7AZyPr4Lygsrx+228gGdzivSiwdH08+JFttLjTVsCEOBYkOos04+i/DPL2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598669; c=relaxed/simple;
	bh=aKsAZFYuBd/AQWpaWEX8ThXsjnBnZ6NLciQvyn21cDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfffpWuYoSnbfRY8wlBlz8Tj0KJMPjDZoCLOu0cjeEvdSKKzp3x39watw8stXrWky1YxEDz8kG9FShTHgS5esSkkjU194Wt+HCmqYxem3UKKd2oBTl3BN1G3HCVdc+RGal1lvb7h0YRCyi3qyoHlkatcKGx+eeAeUFOWGIENT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A8TDZ5kV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so363702f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757598666; x=1758203466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWiaBosOtX/ctQvR+tRX52W6WE3mA+pedyBvnIGg6w=;
        b=A8TDZ5kV11UbCt3NHOV+1GQTg+lKHzi4he8QUaloh0hCRiIUjuxJi08CRZ+drTR9UM
         NHFHRpqQzX1XmjjJFnos2DekiqfR/Ve4VOw+PgJVfcrb3OaCtFpkhfGM51oZS+aG+QEp
         cfXBRpJGuKI/u2nPU3h39S1zh3IJMx8vjgGPIiEhb8j/O/LDkj9ilGuKnHi2Cnf7P1dX
         ayn/P+uBK8NPVM/gFEGUQu7fiAPdKn4l9TNwsBjoKEzbzc4unerT42JaPiExX4shnpO4
         8tPLmNU4lQK24ATh5IgzEO+3upLfNO9yDs7KTJDmzHPJxjJFLdxcxLGpRLDK5Tt9IOVu
         n9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598666; x=1758203466;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWiaBosOtX/ctQvR+tRX52W6WE3mA+pedyBvnIGg6w=;
        b=EmWBk4FeGriFPYNCF9vjWakAYi2o6qeh9vV39ZRtCEmKGUo5YOe8oVsE7BobBnJ5pU
         At4Qe4dDivcAIy4torL+bJuLQrmLQyd0VrKk5+dK2/ATNTfXOT6ufTaK4M9eDZu+7jYb
         KdiYY1UDrIK3LSnrMw24JoFlolu3LVJ9vNhV/wEYHlDb7suPgetKP9ll8DCM4PbrNQIw
         yYneGULXhbOGe4fHBzh4QO7rUlcnGCOogZrMhII34UYviDqpKW5bZlPeWlukqeliBNSY
         8dlCQu1/eYrJIVE2m5VJd5gDCO3YTfPmH+XulCRF5HN9GdJms0Wv0W9rV56gLwGv6tXS
         O/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIO/bJCtTh1px2mYzbKEvAdW1AyMeqYOGQSgJsQRuoN19Nq0zFCSHRITYnNm9HNSv+mblltClSbM3b@vger.kernel.org
X-Gm-Message-State: AOJu0YwVX3X3ylpDOcwClbQs5C8WTViduhpknOpBacDWpkXTewIEWbtX
	rJ2Foz6rhwtfKBern8mvegGAE3x/2MJG/1+CDx5AQmBlMNSeg9jAgdVJa+KrwVoVvnawA01QzgS
	ak7Q/
X-Gm-Gg: ASbGncsXogTc506p3qDglodYSSQX9NiEySv1yLiq/gZtg3aDM0I6lAL5QEpHyiu+fYZ
	PpPjhmMV9jUY1H2jFx6JZtDmYrwljOUpEoYQoVXkNS/qa/SVkaAP4Qhk1xavcrVRlOZxe1vBhtp
	+TjrXBZJaBIV/z6SfiUTbqhS2qZFf6LfPZeuV49XCYhiy3JPH4tW6FoYicqZ513cxYxSpkW9eCU
	ryhhyXyrjNPE0V1tPzypuJKpb6DXJ85COMwXgcHQUoyPHKSoQf3DBRRllPRtccLO8S/PYlXl4Mg
	S2yEu0XAmhixym4Qc5xkgVP+dzYy2oXBCiEvs1Q7/L4M3K87DP/oIw7VdkkTCVGSChiRz3hgSgQ
	D1hEUOj02Fs1pQ82zH+jxrgvGmjB3tnqYL8cW9/PTYw==
X-Google-Smtp-Source: AGHT+IHq9qlr5SVbxPXrHpqCsoSxO3Cd+428J/sKOCg7NzkP9nlaNJcC4VfpZGPRxO+l3VOLPYaElQ==
X-Received: by 2002:a05:6000:240c:b0:3df:c5e3:55fe with SMTP id ffacd0b85a97d-3e64392d4bemr15907531f8f.29.1757598665615;
        Thu, 11 Sep 2025 06:51:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760787604sm2596615f8f.24.2025.09.11.06.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:51:04 -0700 (PDT)
Message-ID: <0d0aeb02-aff4-4932-b785-ce156cc4902d@tuxon.dev>
Date: Thu, 11 Sep 2025 16:51:03 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113460BE4B4D20305021D85328609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54d7c3b2-762f-4f61-af21-02247a471251@tuxon.dev>
 <TY3PR01MB113469D5FBD53A8B507E5DC4A8609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113469D5FBD53A8B507E5DC4A8609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/11/25 16:39, Biju Das wrote:
> HI Caludiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 11 September 2025 14:24
>> Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
>>
>> Hi, Biju,
>>
>> On 9/11/25 13:43, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: 08 September 2025 15:43
>>>> Subject: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL
>>>> in
>>>> gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
>>>> rzg2l_gpio_irq_enable()/rzg2l_gpio_irq_disable() and moved it to
>>>> rzg2l_gpio_child_to_parent_hwirq()/rzg2l_gpio_irq_domain_free() to fix spurious IRQs.
>>>>
>>>> The resume code used rzg2l_gpio_irq_enable() (called from
>>>> rzg2l_gpio_irq_restore()) to reconfigure the wakeup interrupts. Some
>>>> drivers (e.g. Ethernet) may also reconfigure interrupts in their own
>>>> code, eventually calling rzg2l_gpio_irq_enable(), when these are not wakeup interrupts.
>>>>
>>>> After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid
>>>> configuring ISEL in gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly after resume.
>>>>
>>>> Fix this by adding rzg2l_gpio_irq_endisable() back into
>>>> rzg2l_gpio_irq_enable(), and by using its unlocked variant in
>>>> rzg2l_gpio_irq_restore(). Having IRQs enable in
>>>> rzg2l_gpio_irq_enable() should be safe with respect to spurious IRQs,
>>>> as in the probe case IRQs are enabled anyway in rzg2l_gpio_child_to_parent_hwirq(). No spurious IRQs
>> were detected on suspend/resume tests (executed on RZ/G3S).
>>>
>>> IIRC, I believe the issue is ISEL is not restored during resume.
>>
>> Yes
>>
>>> Can we restore this register just like Schmitt register
>>> suspend/restore[1]
>>
>> The IA55 would have to be configured for interrupts as well. Doing it in other order will lead to
>> spurious interrupts while resuming. The commit 254203f9a94c ("pinctrl: renesas: rzg2l: Add
>> suspend/resume support") that introduced this approach, mentions the following:
>>
>>     Because interrupt signals are routed to IA55 interrupt controller and
>>     IA55 interrupt controller resumes before pin controller, patch restores
>>     also the configured interrupts just after pin settings are restored to
>>     avoid invalid interrupts while resuming.
> 
> OK. So enable/disable Keep ISEL configuration as it is, so the pin gpio int always.

Yes

> Which commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoidconfiguring ISEL in gpio_irq_{en,dis}able*()")
> is doing.
> 
> The new addition is suspend/resume restores ISEL along with reconfiguring interrupts.
> 
> Is it correct?

This commit only fixes the ISEL restore on resume. The rest of interrupt
reconfiguration on resume was in place from previous commits.

Thank you,
Claudiu

> 
> Cheers,
> Biju
> 
> 
> 


