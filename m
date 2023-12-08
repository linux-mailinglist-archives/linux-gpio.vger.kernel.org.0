Return-Path: <linux-gpio+bounces-1120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC180A30C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 13:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B203B20BF8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 12:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895721C29B;
	Fri,  8 Dec 2023 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcZY/Wek"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A8E173A
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 04:19:46 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1cdeab6b53so430941166b.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037985; x=1702642785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7Q0jIy5Hwwfpljci5ENjNCx1g8ktoPzNOllrH9T7p0=;
        b=zcZY/WekxvFvoMUq1uBtgDQXD9O3wYiwbSOjjGTP+xUTXhjNyzCorXmKt6u9Nb3DiP
         oeZBn4i+ocTBN7abXl2i8bSNJCT2SDXoBsQFwmUygX2WQxjND7oLTcNnu8+9Pc4bko+M
         6dCea6KAw0s1QQmDpdmKAyEqF7eZZ79yh40u6m+kg8BU0UeRpInDVAqxQRp1AsmQ4GX/
         PfapUnnIdqI+jprayZw++ZuYRcjHtU3WShvFF3y3Q2oBA1tyWGeGczbenqv0ruWLB0pL
         zRQ8/eRHogW0oV6lbHeONVc1jbP9B/qQ8Raw0nOuWw2hwx3MF+9rgx5k6sgMfzD490m7
         VnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037985; x=1702642785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7Q0jIy5Hwwfpljci5ENjNCx1g8ktoPzNOllrH9T7p0=;
        b=EyF2CsIv0ITu3kqiFjyNzaLhNT2uz10ANRU7LOSZMibL8zTxwi4peUveTuAIW84HJV
         qri/6ut+9c9LosWog+kgrEFaBdrPMCsn7HVmzJU49rIoyFflcUmzyZRUjwv/2ZxkOklo
         vFaTtaVNf7FzIBkn82x5g3pR31TTCwqpHRJGDcEU+9MvVrm/3/MxXfNgVEeYYUHTWXHs
         ABTchC48y9uCkDGl+if6kF/LVN7J+M7msL4vf7OiIWgDhLzoUYzc8xct9ROf6cQb0WV0
         rOKpxpJ37I6DqIlBRFXEOa+JQ3JC5iu9zcBqiNyrPZg6zqXVF8JfJwhRBOQx45jZwPl5
         14sw==
X-Gm-Message-State: AOJu0YxDK4ZvwbOfj2JYFMpOfLFIUxYUxwn184N6jWgOMktX+v29wYfl
	waePgkhK9K7snLHQWZNAAgzO7g==
X-Google-Smtp-Source: AGHT+IEIcBP1EFEPziMOH6dqV9KBvAOBKEjySYoMG5Yjgth6YHz7m5tIhTbJy3wglEU0p/iSa68CzQ==
X-Received: by 2002:a17:906:1c9:b0:a1d:1fb9:da08 with SMTP id 9-20020a17090601c900b00a1d1fb9da08mr34035ejj.8.1702037985223;
        Fri, 08 Dec 2023 04:19:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id he43-20020a1709073dab00b00a1e21893a26sm936349ejc.222.2023.12.08.04.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 04:19:44 -0800 (PST)
Message-ID: <3e92295f-3c8b-4699-bf50-0fc2b43ddf1b@linaro.org>
Date: Fri, 8 Dec 2023 13:19:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: realtek: Add realtek,rtd-gpio
Content-Language: en-US
To: =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231207100723.15015-1-tychang@realtek.com>
 <20231207100723.15015-2-tychang@realtek.com>
 <dd22f0fb-e07b-4bd4-bd6a-cf2d8a5687fc@linaro.org>
 <b3a41f598bc043ce9626b674a92b8da4@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b3a41f598bc043ce9626b674a92b8da4@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/12/2023 10:03, TY_Chang[張子逸] wrote:

> 
> The DTS use in our platform follows this structure:
> 
> soc@0 {
>     rbus: rbus@98000000 {
> 	    ...
>         iso: syscon@7000 {
> 		    ...
>             gpio: gpio@100 {
>                 compatible = "realtek,rtd1319d-iso-gpio";
>                 reg = <0x100 0x100>,
>                       <0x000 0x0b0>;
>                 interrupt-parent = <&iso_irq_mux>;
>                 interrupts = <19>, <20>;
>                 gpio-ranges = <&pinctrl 0 0 82>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>             };
>         };
>     };
> };
> 
> The base address for the GPIO controller is 0x98007100. The second line of
> 'reg' refers to the GPIO interrupt status registers, which are distributed
> within the range of 0x98007000 to 0x980070AF. 

Ah, ok.

> Would it be advisable to fetch the
> syscon from parent node(iso: syscon@7000) to handle the GPIO interrupt status
> registers?

If these are GPIO interrupts then current description is fine.

> 
>> It is, btw, 0x0, not 0x000. The same for 0x0b0 -> 0xb0, unless you want to pad
>> to full word.
>>

Best regards,
Krzysztof


