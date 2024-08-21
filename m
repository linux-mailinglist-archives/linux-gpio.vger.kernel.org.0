Return-Path: <linux-gpio+bounces-8927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1A495980F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640E31F2358E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 10:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0B316B391;
	Wed, 21 Aug 2024 08:51:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE6165EE8;
	Wed, 21 Aug 2024 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230285; cv=none; b=mEqHf6oZr3E34kSxAduHB4TA9QjLd+jwvxvYpegVWFr0Ri8dJdvKXf9SA0fnwtzx/Rq/Plf8QHWDVfARE8UWRCrPFHSvE0ufdB2+cmnjvb+Pb01Yu5iSsNzQnOt4YqD6cD38jJGp2298LRM3aLNxJm+lDWMUN9h4uxbU4Plc7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230285; c=relaxed/simple;
	bh=bGA/b8UDri/Zj5EdsIsP8nNFv4JTmBmBHcQu+n4ERJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biioP0EbONXsXQp3cwVvq3XDQBpFp4r5NeMdjKKCwf2SHUELwyoYkcAgpS4eB/EwbcagonptZLt+pk4kOuOQW1dCYsvqPLTLWGCbjxQ5l6DClVtrLqLlOyH53e+iKFOeq6WcrfCJnkBJs6ENgD8zHbdD9Z6hZW5CuaaYqxYn6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428243f928fso70277835e9.0;
        Wed, 21 Aug 2024 01:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230282; x=1724835082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1grTtpsOD7QxOvlav66VEj13IRTNdzSA+6cdUBz9z7c=;
        b=n2WlvywSkXTVQugA2L2gT17h2rgLR/OxR/roqmAyGfU86wUITQtASpsN7fpscL/ejY
         B4a7vM/SnjKPXUreuBEBijKONv2zSfbZZcMJciOgO7GiVHvmPrJ0jlK2Jph+ICMikScn
         44GNBv2EtGEr+hQEB/Eyn2I3JR41S35Kfj13kAVW4eYAv0VJwFcR/h2zrWhGH473Jjhp
         FdJnLqjc57m/dDrJmIOl50NBdYo+sHsuzv3CgfGBH9uo3zwZMwwMaAe2i5Nz4APEwdfg
         0P8Slpm7pP993FRuxzKO5yHyzgoeGp5qj/fdyDvg65eijs2S9bsLauYpyw3uGOrwON/a
         EFYg==
X-Forwarded-Encrypted: i=1; AJvYcCVysfEXwrcxNFd5JVwiRZiIDta/ScsyzoeeSS+7+5doBgCtJXD6wiGLgW8dIu/GoxgtEwOeRs/JP82C@vger.kernel.org, AJvYcCXB0Me2Py68JarqC6CWiCWt/9aRm/U53tAawDs0Fy61pP3TFVE0iOsbW3zvdLYNzq/Z1TXrDMD7r1KW1PBx@vger.kernel.org, AJvYcCXwQ3XpygJZpuS5A2JQMJLnVv95TnZ0XY3LbES/H6f8DJzZF55WUX35HBM4EPOl4KDfkXLxWRTXOKwATA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpEa3J3XzCWvL/VrElIT5Mdn9MH3I2zLbCBijYDx6lezW7ahor
	2103/qttBuM8QwH9SsOJ5UAa/trX9/9iZWMAO2NhvSCGHFWVXMBx
X-Google-Smtp-Source: AGHT+IFSv9dRDxRxssoEwFJ9zMxpMyAVM3DX9QE+lXjk5ISrbFMnahGU4oGJcJr3eIQD0eScUDcIrQ==
X-Received: by 2002:a05:600c:a01:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-42abd2149d0mr17554295e9.10.1724230281780;
        Wed, 21 Aug 2024 01:51:21 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718984980dsm15121871f8f.40.2024.08.21.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:51:21 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:51:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <rdbnhk6hsgusamxn3c6vol47xoliad57gwy4i7tbitb6n2dkhe@hnd7vgbstpvw>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
 <20240821070740.2378602-2-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240821070740.2378602-2-billy_tsai@aspeedtech.com>

On Wed, Aug 21, 2024 at 03:07:39PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index cf11aa7ec8c7..4d439972c14b 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -15,6 +15,7 @@ properties:
>        - aspeed,ast2400-gpio
>        - aspeed,ast2500-gpio
>        - aspeed,ast2600-gpio
> +      - aspeed,ast2700-gpio
>  
>    reg:
>      maxItems: 1
> @@ -42,7 +43,7 @@ properties:
>      const: 2
>  
>    ngpios:
> -    minimum: 36
> +    minimum: 12
>      maximum: 232
>  
>  required:
> @@ -93,6 +94,20 @@ allOf:
>            enum: [ 36, 208 ]
>        required:
>          - ngpios
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 12
> +          maxItems: 216
> +        ngpios:
> +          enum: [ 12, 216 ]
> +      required:
> +        - ngpios
>  
>  additionalProperties: false
>  
> @@ -146,3 +161,32 @@ examples:
>          gpio-ranges = <&pinctrl 0 208 36>;
>          ngpios = <36>;
>      };
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        gpio2: gpio@14c0b000 {
> +            compatible = "aspeed,ast2700-gpio";

No need for new example, no relavant/important differences here.


> +            reg = <0x0 0x14c0b000 0x0 0x1000>;
> +            interrupts-extended = <&soc1_intc2 18>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            #gpio-cells = <2>;
> +            gpio-controller;
> +            gpio-ranges = <&pinctrl1 0 0 216>;
> +            ngpios = <216>;
> +        };
> +
> +        gpio3: gpio@12c11000 {
> +            compatible = "aspeed,ast2700-gpio";

Especially for two the same examples...

Best regards,
Krzysztof


