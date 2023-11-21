Return-Path: <linux-gpio+bounces-323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD487F3221
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 16:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 545B0282D1A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 15:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B16B5676C;
	Tue, 21 Nov 2023 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642ABDD;
	Tue, 21 Nov 2023 07:16:35 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-359343e399fso15592825ab.0;
        Tue, 21 Nov 2023 07:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700579794; x=1701184594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHBJbcTYAJFzd8BQozdA+OUJ8WFFDeZmUm9glBYXWMY=;
        b=XMFfMNWGezswcSMFIRgJPHxeTNGDRVREXwioKmCOZ8Uv8cmK+eeL5p11X/TGPwzHLV
         LsWq8njDA0khhQUO7BGMjPQBR+iBfwh5ZXdrep8yd+y5yIke9/Sf9PyY8ox4pBogimC6
         rPUem/RO2jAlwICWzfg4MTqoJDEtpSgnoXVeVVxq4ICyD1p6HnpbuMYfvS2Ve0c4A0UD
         0jv1PCU0pM3TfnTugL6PXbH9gCjhFcEjz/W/Jmh1keJfItofz3JmdeGF1NNI2/YhmXfB
         M2m6hkUjYbqc2c2Jd8IgP9NrR3VrXOSuu4Gvyhrl+Q0sUTKD/E9/pYH9rKkn4Ahz/GpZ
         ZBDw==
X-Gm-Message-State: AOJu0Yx4K+G+7pVmdGGpkSl+2kTELWIw3aH9SJy19zk3gsOggsAzxRQ9
	c7joqsBzdASgkUPPDyI7Jw==
X-Google-Smtp-Source: AGHT+IGs+KFHExCqkcg3K0j2WE48eh5fwSy6aeVyBcCWydv816/PY/81hpz3b4X9rc/LANFLxc7uYA==
X-Received: by 2002:a92:c90e:0:b0:35b:4b9:7883 with SMTP id t14-20020a92c90e000000b0035b04b97883mr6859544ilp.25.1700579794614;
        Tue, 21 Nov 2023 07:16:34 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s16-20020a02cf30000000b0046676167055sm170383jar.129.2023.11.21.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:16:33 -0800 (PST)
Received: (nullmailer pid 1791730 invoked by uid 1000);
	Tue, 21 Nov 2023 15:16:30 -0000
Date: Tue, 21 Nov 2023 08:16:30 -0700
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Message-ID: <20231121151630.GA1692178-robh@kernel.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120212037.911774-10-peter.griffin@linaro.org>

On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> Specifying samsung,uart-fifosize in both DT and driver static data is error
> prone and relies on driver probe order and dt aliases to be correct.
> 
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
> 
> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> required property. For these platforms fifosize now *only* comes from DT.
> 
> It is hoped other Exynos platforms will also switch over time.

Then allow the property on them.

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index ccc3626779d9..22a1edadc4fe 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -133,6 +133,23 @@ allOf:
>              - const: uart
>              - const: clk_uart_baud0
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +              - samsung,exynosautov9-uart
> +    then:
> +      properties:
> +        samsung,uart-fifosize:
> +          description: The fifo size supported by the UART channel.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [16, 64, 256]

We already have 'fifo-size' in several drivers. Use that. Please move 
its type/description definitions to serial.yaml and make drivers just do 
'fifo-size: true' if they use it.

> +
> +      required:
> +       - samsung,uart-fifosize

A new required property is an ABI break. Please explain why that is okay 
in the commit message.

Rob

