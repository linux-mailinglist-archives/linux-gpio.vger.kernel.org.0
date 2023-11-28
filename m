Return-Path: <linux-gpio+bounces-554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE357FB45C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 09:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ADB3B2155C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 08:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8695B14287;
	Tue, 28 Nov 2023 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdoFQfn7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F38D1A3;
	Tue, 28 Nov 2023 00:37:14 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b86f3cdca0so1237183b6e.3;
        Tue, 28 Nov 2023 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701160634; x=1701765434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=go40FnkWcUCXyHhLKOuIPbJom9fe45XP5cbqv8kDvJI=;
        b=jdoFQfn7ZmQkc+/6b5f7+hQEoMPx03gk18cZqFrz1f1v+g6W58huGM4Q+p3813cDKr
         HRCqrS4XZFZjzo9wvs1MK+UlexlKjj+6KIzUKjpvynZc4rzGXQTJJeXQl6YFZtKzzx4T
         c/TlrgMBZXBhVNVqYF/jBt/5a3TLlNbGO2z0SPYuDcjX7ooIgkJfBM30GU7Py0Njewco
         CDBIAvfK91xwR8FH7JRTL4ixaZ1dbB3FQypvjGFXg5O56A+lVloqPC3shx7jH5CcMOJk
         qoMgqwui2lL5+mLiOnsgyXk0/OZP0Cwu/nK5L2qGlVKf8jLoK8opD311Akw4Iq7e4Afm
         980A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701160634; x=1701765434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=go40FnkWcUCXyHhLKOuIPbJom9fe45XP5cbqv8kDvJI=;
        b=U5a1Aq0NQ1zmHDNoh7c/ck3qJqtQE9pDWpKK1ufyUMvY8rIoNncDYi/uMXDUZRs2nF
         22pDMUs2Uyo5j5t6trEq4OnoM7WuwUd4F/MfvPE4Z5Y93YxRgIw5shw12M30xXccJ/O/
         9hl26q/ShIzPi2/F4Xa5LYHdGW9hgL1ZoeF33vJbMqx/UgE5ULZigboqiyvpRK1wJyZv
         /7b+yO5TozC4843wfKoaDImikM9rO61CtG+IMY3h49lJj79ZRDeUvA1/OApMZegwYnUM
         BhvBExXJ22dC+KCkcUc+wtZsRe4+C6ePN6bQb9VIQGeMBF8UT8KhxJB50HOnKsKvRZfC
         bsWA==
X-Gm-Message-State: AOJu0YwRiBfUoQ7pa3hcARa8ljqchECbulfpmWKPFWZz/nx5M2+GMZip
	5dxf8llzj7a7uBWuXDrHKW0=
X-Google-Smtp-Source: AGHT+IH15015NSX8qmJ739FcoZiRc/C3jxCCRjr3Vh5MZvXfq67+xUo++xPB4DyN4B5DNUibvqf3Mg==
X-Received: by 2002:a05:6808:150a:b0:3b8:5c54:fe0a with SMTP id u10-20020a056808150a00b003b85c54fe0amr13691919oiw.2.1701160633761;
        Tue, 28 Nov 2023 00:37:13 -0800 (PST)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b006cb94e20014sm8510066pfn.41.2023.11.28.00.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:37:13 -0800 (PST)
Message-ID: <a0be9aaa-290d-450e-b0b8-d87453bcaaa0@gmail.com>
Date: Tue, 28 Nov 2023 16:37:09 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: nuvoton: Add pinctrl support for
 ma35d1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20231128061118.575847-1-ychuang570808@gmail.com>
 <20231128061118.575847-4-ychuang570808@gmail.com>
 <7edda3ca-b98a-4125-979f-3ee7ac718a9a@linaro.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <7edda3ca-b98a-4125-979f-3ee7ac718a9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,

Thanks for your review.


On 2023/11/28 下午 03:35, Krzysztof Kozlowski wrote:
> On 28/11/2023 07:11, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> Add 'pinctrl' node and 'gpioa' ~ 'gpion' nodes to the dtsi of ma35d1
>> SoC and describe default pin configurations.
>>
>> Enable all UART nodes presented on som and iot boards, and add pinctrl
>> function settings to these nodes.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>
>> +
>> +			gpion: gpio@40040340 {
>> +				reg = <0x340 0x40>;
>> +				interrupts = <GIC_SPI  105 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clk GPN_GATE>;
>> +				gpio-controller;
>> +				#gpio-cells = <2>;
>> +				interrupt-controller;
>> +				#interrupt-cells = <2>;
>> +			};
>> +
>> +			pcfg_default: pin-default {
>> +				slew-rate = <0>;
>> +				input-schmitt-disable;
>> +				bias-disable;
>> +				power-source = <1>;
>> +				drive-strength = <17100>;
>> +			};
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
>
> Best regards,
> Krzysztof
>

I forgot to remove 'ma35d1-pinfunc.h' from my local copy.
After remove the '#include <dt-bindings/pinctrl/ma35d1-pinfunc.h>', it 
can pass
the `make dtbs_check W=1` check.
I will fix it in the next version.


Best Regards,
Jacky Huang


