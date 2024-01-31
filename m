Return-Path: <linux-gpio+bounces-2781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563984391A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4B98B25E7E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6A453E3D;
	Wed, 31 Jan 2024 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ9j0a/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A234204B
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689929; cv=none; b=niNiYgnC07TgSryS6VciJVKp95qfOF3AMueKUovYiVjAuYoIi7aWAdjtRjvCzHfT0xLF48q/9G20urnWS5bObIt+tBqIcEUX03s8QGMRRiqFGD2UZhfefsk8oi4zzVKES7DxOvKvGYmHTAjVmH0Hr4+JxiSH2lT6UD1bZRkclxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689929; c=relaxed/simple;
	bh=uW2qWG9f4i8dbiyjx/KoeHEpStHxMUg4GXRKzOVY26Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KseBwgBMmCkUfKXG0X/7efN/w71QjiddP+V1BXn2wCwVbFn3k3K5FAwpF/nBJMXG/uMtMn89xP3XTQbeRjCb8+WePozuxbo6jbDl0stUp5J/6POTXMdWCfPhN4lcEvWJ393+BqME/jw9/86nEG9cw2MDTwqHSshJKqXhOToQzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ9j0a/T; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3510d79ae9so553618966b.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706689926; x=1707294726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKqI+ex6kcefYsSc13l7kLpM/i1M6RfFSyL6Vm7tWxU=;
        b=VJ9j0a/T1xNiD/kIBapBtVnHZynt7aIdqnkyYNKllPxkuGQF7FXV1YuH/ACmBPOk+A
         mpuDVAdpIirDfX6UXlw6N7mXHdxJBKmZAIhHsGQhkX4BS/lyULzn+xvaqSvK5nOXAcFd
         SnMhesdWlt+J8RTBVAl5BIboUXKyUJGRTXQYlgT9M6klJ4taGr+BhxFwpRZWWhgb2BQE
         CQ+U4RuvkASa62z02hTGLuBN3+k3PkTRCC/X6So2DrxM+1IV8aGr6b2HWfyblha6iOn6
         2UZLFFmU+PDBfdvj/ZM/SHpIf47L/DOdL4zYylqCVEDJv+vpLuC3XWw7zp29FS29bK//
         9Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689926; x=1707294726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKqI+ex6kcefYsSc13l7kLpM/i1M6RfFSyL6Vm7tWxU=;
        b=KxwSIdCpJVYHZ/U2SNNcZ+VuOiY1zSCpvrXq5eJjQnPVsZbmKaVIFnwHcCF5AP8zRm
         Aut+I3rMYNU7W72vWGUt64N0LMmwfRHA6l70nev4ZfqEcxDSpzNFv8nvXoH8uZDsK0rE
         nF/D0glHVqx8t9HxeCYvw7wqhqwElr2q1yZZvGq3qkwHEsD/CkE8X00K5xg6QRdhQodM
         Tu25cnfJQodGEbGGjo/88MzFNmUD9N1s4ofdmcLkqC9d6r62CY0t3NmzJ8jycfYvQ3Ce
         I4weouVxsd7TNR3V92LwUKjQ9PURLLK4sUnLSkgOJ7nQlmCFl3+IojgQ9VMotQUeTIq7
         5n2w==
X-Gm-Message-State: AOJu0Yxb8hJMbDH06dDehJyMyp8wS0Lp5Xnlo3ahFolb3h3e8PydVpIK
	fmrJmx/y6v+j3d8/4INMi4kJuYJAn4co72pALiC6gOnJ3kBhRZ+u551YVjWS73s=
X-Google-Smtp-Source: AGHT+IFwIdjNb2fXwv4JhM+chfZh206ZDHeUAv0mOI3XqXYqDj0+8KPriicjL4LSfixqTqt/TAeN5w==
X-Received: by 2002:a17:906:28cd:b0:a36:600d:8911 with SMTP id p13-20020a17090628cd00b00a36600d8911mr565720ejd.10.1706689925683;
        Wed, 31 Jan 2024 00:32:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWvEnQ0I6KVpTKGVxXiAJkhJ/m9JcbKiiwVjBDe1jMuIJXVkIwsySjB4CyuZO4OYj8dgVUdqG9guadmgpDAE4ojOrvss3JdC8jNPjs5CpaZFMyRScDyy8JKnWoOy/vk53AjTpO6VBY2xI0ETiWnhdJTxmmLJGeVM65Luia3uZ7PdrTAz62D2SWcdnbQYNY7WPO4I1M8aKf/vG7T9MvhAYHkmb/NDw8oraI5wclzIZ0CJayvcfmS4G15ZTwJvUqbz5i/o4tEbJep8Uo41jSiYXCDNCi+Pvwg+io+fr5c9Lyi3nuUAmos7rxiNeluTJ97gdrjvLjko0JV0BoK1sWWtedYDDGdnIv40beE
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vb1-20020a170907d04100b00a34c07816e3sm5919866ejc.73.2024.01.31.00.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:32:04 -0800 (PST)
Message-ID: <52f1e76e-0953-4625-94ae-2208600f5729@linaro.org>
Date: Wed, 31 Jan 2024 09:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: cy8x95x0: Minor fix & update
Content-Language: en-US
To: Naresh Solanki <naresh.solanki@9elements.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: mazziesaccount@gmail.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240130125602.568719-1-naresh.solanki@9elements.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130125602.568719-1-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 13:56, Naresh Solanki wrote:
> Update maxItems to 60 for gpio-reserved-ranges to allow multiple gpio

Subject: everything can be a fix and everything is update. Write
something useful.

> reserved ranges.
> Add input-enable property to allow configuring a pin as input.
> Update example & fix alignment.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  .../bindings/pinctrl/cypress,cy8c95x0.yaml    | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml b/Documentation/devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml
> index 7f30ec2f1e54..90dda5d3cc55 100644
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
> @@ -125,14 +128,29 @@ examples:
>        #size-cells = <0>;
>  
>        pinctrl@20 {
> -        compatible = "cypress,cy8c9520";
> -        reg = <0x20>;
> -        gpio-controller;
> -        #gpio-cells = <2>;
> -        #interrupt-cells = <2>;
> -        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> -        interrupt-controller;
> -        vdd-supply = <&p3v3>;
> -        gpio-reserved-ranges = <5 1>;
> +          compatible = "cypress,cy8c9520";

I don't understand why you change from correct indentation to mixed one
(2 and 4 spaces). It does not make sense.


> +          reg = <0x20>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          #interrupt-cells = <2>;
> +          interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          vdd-supply = <&p3v3>;
> +          gpio-reserved-ranges = <1 2>, <6 1>, <10 1>, <15 1>;
> +
> +          pinctrl-0 = <&U62160_pins>, <&U62160_ipins>;
> +          pinctrl-names = "default";

Missing blank line.

> +          U62160_pins: cfg-pins {
> +              pins = "gp03", "gp16", "gp20", "gp50", "gp51";
> +              function = "gpio";
> +              input-enable;
> +              bias-pull-up;
> +          };

Missing blank line.


> +          U62160_ipins: icfg-pins {
> +              pins = "gp04", "gp17", "gp21", "gp52", "gp53";
> +              function = "gpio";
> +              input-enable;
> +              bias-pull-up;
> +          };
>        };
>      };

Best regards,
Krzysztof


