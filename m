Return-Path: <linux-gpio+bounces-28105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C74C356CC
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2493B560ECD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4E0310650;
	Wed,  5 Nov 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJSB51PU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B6310636
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342791; cv=none; b=tVBnotDEU/zut6uUSF89EsOu6BQcbvsBIRM0tT/Aptbkewj3zLR19qHCNAjr6bx9zPWM4Gc1xx/VsajFxTGuwHzb0CB2MefHKruI9C2RYKST/ty1PtToiGS7ChK9LvCf4HXI87HPb1FQXeqnLYhtXzuXu9xw+xT+1yIlChK3Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342791; c=relaxed/simple;
	bh=XJnQ8QAutR/Qjzuilm6RbMyIh+omr6OWVKRLZO5Bnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF6FRBjAkh2XJJ8nh7aNjp40ueprsy65i7v62F5P/BFSTPo7bsw02S6XtPj+lcaXC0LmuJ0svtNdtTNJLc7sdqOdOIRlVGoSycY+2EZh4LPiOHKt98YBIbMcV/1xQ/Y5RjAJ6f79+pOsqfafAEkIqGvYI0LVwjXKHsixl1NCWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJSB51PU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59428d2d975so3558265e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762342788; x=1762947588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcDBz895P+pKkilzGMv1j9zQS86el4sifmVfoozzk=;
        b=CJSB51PUDDIAmXELEChvDo2y27eoe70faA3tbu/iPSRxcznGwDxA4bNg143HX2AY7h
         6OGa2qZJ2ps5r2LR1uY1uPFiEIH8H8zrwlbmo85b25eyoE02XpPno5Hq12P7LuhwCk1O
         AzhOd7dtEH/zdfXb7nbzaeQzyYAaewr51fx1+H5AjY8W3Kl0BOuLD5SXeR+Vmn2DTv18
         xNqJivuHGk0slJeCzmZ6txTYQKgfh9wlTNrQiIKp6MkBqkBELvDcax2vGsyZL/Yhiyyo
         0UwyKme0BrLCsAaEIC4WGuYf9doozejNTg8izdiv+LZvpkWMA7oSxGmH3YAIz9thlykp
         fWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762342788; x=1762947588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcDBz895P+pKkilzGMv1j9zQS86el4sifmVfoozzk=;
        b=DWEPdceVHpLoCK7fR3W0VMQKDybGBdGnjdKSBqj4kbtwCapblj+m5X1nNoTKbmLRo3
         9ttVWr1WsEGSshOMpGXSNAjRREV0I3wEebmyzqvlZkn9FuvWii2GFFGR/DjHbxNY1gfx
         KDjHHg6THUUeU0EQnrDPkdIkzW1wc9lppKXuXc9ULqNU9w3r7yQg3WrPnglVYuY2ddTi
         2JALdM5jwenYYYKe9j5dhl5yE8BjWQVaQWEZMOdNpbJFE+vPoH79cpSg9ZIvTi+ths4d
         PlHm1iC6ZGH0gVhBg7rH20I2S6URnV8s6+Q/C65Vad/12agi3u9+xu1I+BT1B1meVRRK
         LvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjf2pOwIs78SbQeXN7eXFUXwd6miPdsn9KG55PSeP6S36/TrykDdM5TL1mrj4yGcdwFtMF5XfpMbcX@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwJ9+A71Y9m4udiAa1m6bfQOAgHQdBOGoMsJVavLopgtz4loJ
	KZlUll6JOFcApsn6a06eHySEIm3kEe93ZoD58TrOY8DyDtyTaTXaUqzI
X-Gm-Gg: ASbGncske3o4m8j1PwfVCkh3dUQg0rO6RPPCILkwI1EBH+PgapxSXV/92F1rMFui0O3
	+g/w+OXCJVT6oz/QLlN8VVCfSitRQFw80lMSXnLCauwV/9M45xk99cX1FIBsxWVcXG7vgTTOtuR
	euKgY32byiAh+i9dNpV6xjTUOv1StBfP5SOMB3fLVbyWtxC+WVJgYzFK5nsnUOsEQ6kCEmq14Ps
	MJxZOHVnulNhxlQoVzLohqlG3mDYvgtMpvaZabima59p/tu4+HmOHnY72FyAGlw1mRzPxuGejuc
	be5mBZpDymMD+Rcm5Dy4J77DPb35Zn9J2hJqOSPWcHBm0tKF0FsWEEzhxRVTe77WcCHsFm/UksP
	ilkxkn89pTBJiNCgmvSjvgj9COFc8gTPl5YYxkAmWQfjOkPmxHN5jtEr9t3j+cr/NHNcMcEh+/O
	/7u04fMKXHsn1CEZB6VKYVEeIngHCysjNkCFpluM/xnguf676x92VSTlomgg==
X-Google-Smtp-Source: AGHT+IGG31UsLd4o1FDm3BbiPL0QtqwK8nPiQHx1dRUKJ4gb8AV+HvnhJfY8a3mxdgTF9YlyblMwPQ==
X-Received: by 2002:a05:6512:1395:b0:592:f8aa:c06 with SMTP id 2adb3069b0e04-5943d7f3f74mr1019404e87.57.1762342787278;
        Wed, 05 Nov 2025 03:39:47 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943443992fsm1652172e87.60.2025.11.05.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:39:46 -0800 (PST)
Message-ID: <aa55cba7-1f7a-4c44-a101-cb991387fa55@gmail.com>
Date: Wed, 5 Nov 2025 13:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] dt-bindings: mfd: ROHM BD72720
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
 <4c7ea0c83f4bb4af65439a9b8951d50ee705d22c.1762327887.git.mazziesaccount@gmail.com>
 <176233321210.143104.455177775703669783.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176233321210.143104.455177775703669783.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2025 11:00, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 09:37:05 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
>> charger, LEDs, RTC and a clock gate.
>>
>> Add dt-binding doc for ROHM BD72720.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>>   v2 => v3:
>>   - Styling
>>   - Document all pin functions
>>   - use pattern-properties
>>   - re-use existing Rsense binding
>>   - correct the example
>>
>>   RFCv1 => v2:
>>   - Typofixes
>> ---
>>   .../bindings/mfd/rohm,bd72720-pmic.yaml       | 273 ++++++++++++++++++
>>   1 file changed, 273 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml: Unresolvable reference: /schemas/regulator/rohm,bd77270-regulator.yaml

Not sure how this slipped through. I'll fix this in next version. Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

