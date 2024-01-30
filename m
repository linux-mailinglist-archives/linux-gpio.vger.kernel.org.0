Return-Path: <linux-gpio+bounces-2734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CE8424B3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A272875F3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD2D6A025;
	Tue, 30 Jan 2024 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gD65BvqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604F67E89
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617164; cv=none; b=UJMO622zsapyRvfSXQ+09CGcFA+hXXUclqo3Ncxcywdc+TSij9rJ5xK6z5yO7eMQv6rS60TJGAnijAs22mRFVMz3SmzMX5py0PghscZj3QPpKNzpf3nqBJ8UbK8PWOtGhByylROdWpDDOgmrd/+eUDpEqy4bIIff9mhNT9N8xTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617164; c=relaxed/simple;
	bh=iQzCSNnyouJp2Wy6QkGA7g9a6IPP8cqVesNbQgWHw7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/IH7wXrg7Y+DuOaaG9b9Q2sbOduZhvdfobB9gS8NxpirNWNGfDrMDAJu1zfyX6o9BvVpZ/KT70uCd82XQ5L1+79qRVubq1NsosiQN2MTkwWq7hWgKksl+WHIZZkXK7SZ9SM0T8MIGZjxwnMfwp57P504vdzlYVbYYpScRfWOOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gD65BvqE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cf2fdd518bso35115161fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706617161; x=1707221961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnb118wvb1elySB2kv/rGXgR8mDeRHl4GCCx/QgEN8U=;
        b=gD65BvqEv+NS6eB+fWPKr2uLPpv414zqJesqbFAm0fLkzU91i4r6jQXA6P7/fJKJB7
         oRxHYHwYlt3Uq3TMGx50QXbV7zMMIQdlTqaO8mRXUheapQRzfOQZvB/EBPk1AZxJOyXq
         ZIwF8upOjs2p8KayQQ7Hk11Wl21bkZIuFL2EnAV71McYBvqLWDgVOtO2T75lpy7iWfSW
         +R7RFO1nJ/yEBD6gQ+UE+4RWuCtFRGQBwicsqQoD7hzQoNvGrRmA4DOHUXVOOeDnuwEG
         r9UCgLEZnFxpz/N3Zkb2wU3yh/Nl6ZMhgzYSi929TbyriQ05UWcoeAEBEP0pzf/85JKf
         VUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706617161; x=1707221961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gnb118wvb1elySB2kv/rGXgR8mDeRHl4GCCx/QgEN8U=;
        b=BDsZd9T0EsosPdp/kV7qZv4+UEL7U4Om8T7ZFvvdc2vwFu4xuVXmhYcdEyjmRoTzZn
         gPXd75uvhFF+mMxlyfjbMSQF51xuWG3fqct8qYOXvQ4tj/aR0w3/dDYzMt8YYw0QBnT1
         Q+ObgD3M0SQkYN7h4LkumUKiCSE0G4PpA1aVVcr2OJgbEm3p+XqWipyxWNfGEYXSFvOm
         tBgiazqB/9DTUrLaJOdt6/mbqY+FiyHGTkG4RR/8sb+k++eOXl7QJu4NqZLw9xCi4XqR
         NaI2f/jluaQAySvLU30yyPadX+M7/tJ6Azow3QTBAs8dzQ+HHoNqF4hV9r8pldcjQagV
         6gUw==
X-Gm-Message-State: AOJu0Yzim3Wzo0sHXXo/qwzb8oyoXmbP6A8u9pmDmN0roRtzDZV21jau
	qGEOl8zbcYAwPrbpxy8JEZrzJ7fQiBo6MYXhTa26v6Fdj6gLEG7E6IKBj1HHuPs=
X-Google-Smtp-Source: AGHT+IF/rK3vccRjWvQ6RqMQD/0pzSOpo9Z/NnuuQrfHk9s/LwhZ4r2o1SenPWBoRfTdFGzOcbZJ8g==
X-Received: by 2002:a05:651c:19ac:b0:2d0:4c0a:a414 with SMTP id bx44-20020a05651c19ac00b002d04c0aa414mr3800947ljb.50.1706617160887;
        Tue, 30 Jan 2024 04:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXrC34wZvBkp3Yjiv5saRu1LoYKrIlQiDzUF3fD+HfYfhylwdnRVJ8pWy0VL30J/Jj/x1poFbS0Vv/SGYaV/5tF02PgunMwzNUx0u1dUgm/tVHFP7dzl5mf2y6cZRdVZ1zH+r9HW2lfrKd822IFFtmKpNWHAcYlOq7mW8/wbv0Awq31wmSqyf7smXwj/t2ZSty7gN4YtxdTbCdea/iUrC9PvITNkXs3btzdVnW9KELfs39l/mRpb/iNiuFElOiz/+jCx+hWE05CU0bOai8fxCCALZdvrt5PaClBvQv0GtUW3xqm2xoj38BvhnzKcjti0aVeY2XSznX21J+wC14EyLo/yxT+w3/g7zIh
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ds8-20020a0564021cc800b0055c9280dc51sm4817603edb.14.2024.01.30.04.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:19:20 -0800 (PST)
Message-ID: <b305291e-199d-4a0b-b24e-09910f1eed37@linaro.org>
Date: Tue, 30 Jan 2024 13:19:18 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: cy8x95x0: Minor fix & update
Content-Language: en-US
To: Naresh Solanki <naresh.solanki@9elements.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: mazziesaccount@gmail.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240130120807.460335-1-naresh.solanki@9elements.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130120807.460335-1-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 13:08, Naresh Solanki wrote:
> Update maxItems to 60 for gpio-reserved-ranges to allow multiple gpio
> reserved ranges.
> Add input-enable property to allow configuring a pin as input.
> Rearrange allOf

Why?

> Update example.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  .../bindings/pinctrl/cypress,cy8c95x0.yaml    | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
> index 7f30ec2f1e54..89ce0cb68834 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
> @@ -45,7 +45,8 @@ properties:
>      maxItems: 1
>  
>    gpio-reserved-ranges:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 60
>  
>    vdd-supply:
>      description:
> @@ -85,6 +86,8 @@ patternProperties:
>  
>        bias-disable: true
>  
> +      input-enable: true
> +
>        output-high: true
>  
>        output-low: true
> @@ -101,6 +104,9 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +allOf:
> +  - $ref: pinctrl.yaml#
> +

That's not a correct placement.

>  required:
>    - compatible
>    - reg
> @@ -112,9 +118,6 @@ required:
>  
>  additionalProperties: false
>  
> -allOf:
> -  - $ref: pinctrl.yaml#
> -
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -133,6 +136,21 @@ examples:
>          interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-controller;
>          vdd-supply = <&p3v3>;
> -        gpio-reserved-ranges = <5 1>;
> +        gpio-reserved-ranges = <1 2>, <6 1>, <10 1>, <15 1>;
> +
> +        pinctrl-0 = <&U62160_pins>, <&U62160_ipins>;
> +        pinctrl-names = "default";
> +        U62160_pins: cfg-pins {
> +                        pins = "gp03", "gp16", "gp20", "gp50", "gp51";

Your indentation is totally broken.


Best regards,
Krzysztof


