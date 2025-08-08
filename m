Return-Path: <linux-gpio+bounces-24101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33AB1EF08
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 21:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75463A2838
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 19:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD4B2882D9;
	Fri,  8 Aug 2025 19:51:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62F27F74C;
	Fri,  8 Aug 2025 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754682716; cv=none; b=f3yc2UhbvPltBKgjRgGrwiti5hPO+rBD++5nO7/n3vtloL/c7Iuio742j0xUtlwdvbnvKD7CeV5I1/tWYtQrLyHfkB5B1rij50kJG4nvQ+ElYUBzw8YfPDr3wHp7+rNqBGZW4UogtnYLL1bk5ZqaOveXns0v9YATDKo0b30rx3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754682716; c=relaxed/simple;
	bh=0ob90HkETYRkq7ul01bifcYwg7rjfKChsYDYQSF85ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/iVIVqDZpZDwZO7G5MtXtP+Lh1uuaL1mx7suX5ZO6uFrvpjOCr0WGMy/kWP6hF2fT7UeRd3HNzP1yL1uscP+zJX5Uuypu09ElRrBPLh0x2rj8gSi6bGXniMMADNTguWO3qc5AYCIvMSkJ+MaY44uH09L0q2ONu/lQiBM2lcO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53945ba7f2aso1850937e0c.0;
        Fri, 08 Aug 2025 12:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754682712; x=1755287512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ+8vy22VRRFcvaUqDwj58cikikxo4XqdD5alIqAgQc=;
        b=W9ZFCClzNgHXvkd5zSXc+yXcHfK0Zk/aZgNfs5ajJPHINB7VxQCc8k5Ygrh0LFq63D
         9Ktkjs9lfbfZiu7RqxTJ+Ffy7qmYiElSiiaeccX26nRQ9UGq0oRXrPd4gbNjPdzzdlyq
         MjqnBPqcuNYnIINP9OsK/1Bgfj0nCxwGTb2m6Nb2kCgKbjZzoyo4N9yaP8EtB+g8r5oL
         +N/LLCUWi8vOgY0KaPIPzyM/ICJsUApz5PFu6gBp5cJk2t6dDo2Vyc2gYcdWz1XLLG0p
         zjkdH04zwcnIycFbwPRh5GcQdUDkxXeq11ciSn8Jw+q9LMqMlG2jNiC00IXevFRe+19T
         5TgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJPAHGMtPM7yKuTQNnK4qZjpyjPI0WsUlqf0GsXFYBGx4Oyziu9vk2J7kunnSgnfMcAL+HvLphKwnVuQOu@vger.kernel.org, AJvYcCVKk/eFN1XCY2arpAMJU3B0RXKkooXkcq8ItyB64fIX8bRF0iegQrwgXdeg3CF5YgY+nK8FkzDqTObW@vger.kernel.org, AJvYcCWE5giOwIGz/rccjd57XZjRwVqgW4we7vzpJEATH04AbhYVtjpfEG87jLnPYKFYdhwrD1KfuHEN5R4GlDS5eCMpVZw=@vger.kernel.org, AJvYcCWSrJK/cSs8WPSpkaWn/qI/+R+l2Jsfiyi36wU4IRuwfHc+Czfh++x1PfKLHvcS3l7XmqYUJ5SjdBhYbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUad4hi2EKrDLZ7aLi6IrfEbrGXmHCDmZjV/YfCdOAhXCoAwT
	MRv8qFHnWUqdaD4S3rCythd8CBHzN9isExb+QE7GEkGN9acN/mx8bMKIkio/fhFg
X-Gm-Gg: ASbGnctaip0RIVG2GjBBpI3d2x+Fl+lpvPVK1qf4t79Igl/i3MS+7zf8QSmzrJqE1oI
	LCbJZCZi0xukuW7QUaDjElEqrqQvLe9IxrfG1DCqamKBJ0jAyGItQJalOG31MRRnvALwOEeThWo
	K9sCNUOlTmKNt8gPj3a4kaj2ZavhdDOLpBHwwpqtsPFzmoAypLzpJnziYASeMM9kL/oMU1BAkpW
	TrN8ix2yUTDaEipTaYgPrk5q7QDbyEoDQ1AzxjorPbzR64VY1MLPsIP4QgOEMsHXF5kz6gohWzz
	k+Zj0OpbI5lk2LN6+ySWV0ZKNIcS21DPnniVx/fq9EgsWd52+0VlNIDSPT2jSbnsl1vJ+fC6Irn
	kzYP6BvBN8L/c0EBCAD6aStiPCgJ5lWzVkBGL+uG2MdH7YrPtKCGHe1c6qSOU
X-Google-Smtp-Source: AGHT+IHNxrP/kvsT7aQC5lpPW/Du1Jpqg1d/0ZYPwAvf1ucEays3UqfGR72IUlOZqI/Ifcr3wSyHBw==
X-Received: by 2002:a05:6122:16a9:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-53a52ef25a1mr1869213e0c.10.1754682712088;
        Fri, 08 Aug 2025 12:51:52 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b01b6352sm1267570e0c.14.2025.08.08.12.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 12:51:51 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so2471904137.1;
        Fri, 08 Aug 2025 12:51:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcAbzBAqNVFdsYjJ9exVFdhJxgsAx4mb0FYmUSVRZ/X7LKZxislF7OFCd+YuiTgtP3pvSL7SOdLuIE@vger.kernel.org, AJvYcCUcQ2ubeGe+FyOLrXJ4UIhuisRlZ0HWSJS1wFBQAWGkDjQ6zYdfBcyNcdFKaw8Wl6kdet02BQXf457NdKuf9OqMVqg=@vger.kernel.org, AJvYcCVCOZjg1nOhtVfpc3YXYxE2uTqCcYSOHLDdo1R8JT/NIcu+xkxsuWcM8gBxuiR7897+pQJu3Pg/dtnNHst+@vger.kernel.org, AJvYcCXvOmqJSimS8vPn7resU5/eJvi3HhKnPs94bMSklVmgfAShpHTd6bIMZnprf4ZJsI2gtl3dLbL492zycg==@vger.kernel.org
X-Received: by 2002:a05:6102:449a:b0:4eb:efc6:740 with SMTP id
 ada2fe7eead31-5060eae45cemr2009743137.18.1754682711540; Fri, 08 Aug 2025
 12:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 21:51:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWApWhAzjJ9K9-SFvZYtPArZ9aFQJvMdMyW=ke+1sj5CA@mail.gmail.com>
X-Gm-Features: Ac12FXxBdYKoBx_i-NuBt6HhynyXU3rROCx603sVBa_T7YqZkl29ac6x4lP9cAU
Message-ID: <CAMuHMdWApWhAzjJ9K9-SFvZYtPArZ9aFQJvMdMyW=ke+1sj5CA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin and GPIO controller IP for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> header file used by both the bindings and the driver.
>
> The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> Both share the same controller architecture; separate compatible
> strings are added for each SoC to distinguish them.
>
> Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Used patternProperties for pin configuration nodes
> - Expanded example nodes

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
> @@ -0,0 +1,177 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzt2h-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H Pin and GPIO controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  The Renesas RZ/T2H SoC features a combined Pin and GPIO controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 8 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a09g077-pinctrl # RZ/T2H
> +      - renesas,r9a09g087-pinctrl # RZ/N2H
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Non-safety I/O Port base
> +      - description: Safety I/O Port safety region base
> +      - description: Safety I/O Port Non-safety region base
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: nsr
> +      - const: srs
> +      - const: srn
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +      (e.g. "RZT2H_GPIO(3, 0)" for P03_0). The second cell represents the consumer
> +      flag. Use the macros defined in include/dt-bindings/gpio/gpio.h.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +definitions:
> +  renesas-rzt2h-n2h-pins-node:
> +    type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +    properties:
> +      pinmux:
> +        description:
> +          Values are constructed from I/O port number, pin number, and
> +          alternate function configuration number using the RZT2H_PORT_PINMUX()
> +          helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>.
> +      pins: true
> +      phandle: true
> +      input: true
> +      input-enable: true
> +      output-enable: true
> +    oneOf:
> +      - required: [pinmux]
> +      - required: [pins]
> +    additionalProperties: false
> +
> +patternProperties:
> +  # Grouping nodes: allow multiple "-pins" subnodes within a "-group"
> +  '.*-group$':
> +    type: object
> +    description:
> +      Pin controller client devices can organize pin configuration entries into
> +      grouping nodes ending in "-group". These group nodes may contain multiple
> +      child nodes each ending in "-pins" to configure distinct sets of pins.
> +    additionalProperties: false
> +    patternProperties:
> +      '-pins$':
> +        $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
> +
> +  # Standalone "-pins" nodes under client devices or groups
> +  '-pins$':
> +    $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
> +
> +  '-hog$':
> +    type: object
> +    description: GPIO hog node
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +    required:
> +      - gpio-hog
> +      - gpios
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +  - clocks
> +  - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> +    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +
> +    pinctrl@802c0000 {
> +        compatible = "renesas,r9a09g077-pinctrl";
> +        reg = <0x802c0000 0x2000>,
> +              <0x812c0000 0x2000>,
> +              <0x802b0000 0x2000>;
> +        reg-names = "nsr", "srs", "srn";
> +        clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl 0 0 288>;
> +        power-domains = <&cpg>;
> +
> +        serial0-pins {
> +            pinmux = <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
> +                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
> +        };
> +
> +        sd1-pwr-en-hog {
> +            gpio-hog;
> +            gpios = <RZT2H_GPIO(39, 2) 0>;
> +            output-high;
> +            line-name = "sd1_pwr_en";
> +        };
> +
> +        i2c0-pins {
> +            pins = "RIIC0_SDA", "RIIC0_SCL";
> +            input-enable;
> +        };
> +
> +        sdhi0_sd_pins: sd0-sd-group {

No need for unused labels in examples.

> +            sd0-sd-ctrl-pins {

Drop the "sd0-sd-" prefix?

> +                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
> +            };
> +
> +            sd0-sd-data-pins {

Likewise.

> +                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
> +            };
> +
> +            sd0-sd-tmp-pins {
> +                pins = "RIIC0_SDA", "RIIC0_SCL";
> +                input-enable;
> +            };

Please drop this subnode? It totally confuses me ;-)

> +        };
> +    };

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

