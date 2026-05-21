Return-Path: <linux-gpio+bounces-37298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFyeA5pxD2qOMQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 22:56:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB45ABF12
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 22:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26DBE300468E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 20:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF98839D3D4;
	Thu, 21 May 2026 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jng0oUZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E2368D6E;
	Thu, 21 May 2026 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397012; cv=none; b=B4r8Vl0ILYdvsYMeCH/gSSAV+QRBLdtNxzwgZcA/kHwxN8ixLng+ss0OgoMSTRHRopRz1ThYMvURUe1fn42xDYERf4anPiuGkyjBzA57GrjNzH2XRT8vskmmfgCoRemtRnpzWH9xaUKZQtgwJQ5G4oB7eTSij1+fE/kLcc90QSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397012; c=relaxed/simple;
	bh=WDe79g1ki2DMcd+idThZ8q0HnR63pP0oUOr/Pt8qijY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLMQ0OWaCeXbGJ50VeY5rfZJi0hJcHiF04xkjQ+GHoiPUcqrL1yZY4ClwrFbBKeFGQ4dB6B9NCkrK2JHRic7NbI+4m8r7mU1EryV7wMAdKqquSdJbUwXQhWQ5Sxxqj7rV6RrGJynfkkJLNSfWRX8nJq4iHGPFZRL6sIPXKA9nKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jng0oUZc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A8B1F000E9;
	Thu, 21 May 2026 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779397011;
	bh=JBpHqKaYN6JoJB1/n1KhHrVaNfbZCB68wzXmDpnHWM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Jng0oUZcv7zd6nnjbs3Mq3ed2A9c/QNUiY2Gld1gwPRtjwTcT+NdmLKDAQmebkuT4
	 eqAudrKxJXMi4ksxSQX3KTYQuQmo5hB2sKb+/zEyyVYNAFYrgeFspzcFFEgZEPl2i2
	 68gdPXiPNAvzAPu4731XXUbaOiYQi4U8TTaKHq+s75xI/iDuPOot25YY3NPsUVGV2p
	 c+If8W4BUPDBPRpkcXbbppjrsHBGLknnfUjy/PdKKX0jX48dCK6laOAFk9f7tlrq1a
	 BeHV5TuSj/N6eQL12rbzWr0Cl7p4sY+v2DA2MjxzHiytAEAeFMI2rm+NereVnXvCR4
	 8JkUPJmm4KHRA==
Message-ID: <6c320ea2-e169-4c97-a183-b0d5ec3d7aa9@kernel.org>
Date: Thu, 21 May 2026 22:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
To: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37298-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.169.21.40:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,bootlin.com:url,ultrarisc.com:email]
X-Rspamd-Queue-Id: 09FB45ABF12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++++++++
>  3 files changed, 240 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> new file mode 100644
> index 000000000000..c7ed1f96382a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 Pin Controller

Missing blank line.

Please organize your bindings to match expected style. See example-schema.

> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description: |
> +  UltraRISC RISC-V SoC DP1000 pin controller.
> +
> +  The binding supports two child node styles under the same controller
> +  compatible:
> +
> +  - legacy DP1000-specific nodes using phandle-array properties

New bindings CANNOT introduce legacy. It's contradictory.

> +    `pinctrl-pins` and `pinconf-pins`
> +  - generic pinctrl nodes using `pins`, `function` and generic pin
> +    configuration properties
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pinctrl-cells":

Use consistent quotes, either ' or "

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  '.*-pins$':
> +    type: object
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
> +    properties:
> +      pinctrl-pins:
> +        description: |
> +          The list of pins and their mux settings that properties in the node
> +          apply to. The format: `PORT  PIN  FUNCTION`.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +      pinconf-pins:
> +        description: |
> +          The list of pins and their pad configuration that properties in the
> +          node apply to. The format: `PORT  PIN  CONF`.
> +          CONF is a DP1000-specific encoding of pull and drive strength as
> +          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +      pins:
> +        description: List of pins affected by this state node.
> +        minItems: 1
> +        uniqueItems: true
> +        items:
> +          type: string
> +          pattern: '^(PA([0-9]|1[0-5])|P[BCD][0-7]|LPC([0-9]|1[0-2]))$'
> +
> +      function:
> +        description: |
> +          Mux function to select for the listed pins.
> +          gpio maps to the hardware default mode. The default mode is
> +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> +          func1 is not supported on LPC pins.
> +        enum:
> +          - gpio
> +          - func0
> +          - func1
> +
> +      bias-disable: true
> +      bias-high-impedance: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +      drive-strength:
> +        description: Output drive strength in mA.
> +        enum: [20, 27, 33, 40]
> +
> +    oneOf:
> +      - allOf:
> +          - anyOf:
> +              - required: [pinctrl-pins]
> +              - required: [pinconf-pins]
> +          - not:
> +              required: [pins]
> +      - allOf:
> +          - required: [pins]
> +          - not:
> +              anyOf:
> +                - required: [pinctrl-pins]
> +                - required: [pinconf-pins]
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pinmux@11081000 {
> +        compatible = "ultrarisc,dp1000-pinctrl";
> +        reg = <0x0 0x11081000  0x0 0x1000>;
> +        #pinctrl-cells = <2>;
> +
> +        i2c0-pins {
> +          pins = "PA12", "PA13";
> +          function = "func0";
> +          bias-pull-up;
> +          drive-strength = <33>;
> +        };
> +
> +        uart0-pins {
> +          pins = "PA8", "PA9";
> +          function = "func1";
> +          bias-pull-up;
> +          drive-strength = <33>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    /* Legacy example */

We do not take new code which is already legacy. Why would we want a legacy?

> +    #include <dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pinmux@11081000 {
> +        compatible = "ultrarisc,dp1000-pinctrl";
> +        reg = <0x0 0x11081000  0x0 0x1000>;
> +        #pinctrl-cells = <2>;
> +
> +        i2c0-pins {
> +          pinctrl-pins = <
> +            UR_DP1000_IOMUX_A  12  UR_DP1000_FUNC0
> +            UR_DP1000_IOMUX_A  13  UR_DP1000_FUNC0
> +          >;
> +
> +          pinconf-pins = <
> +            UR_DP1000_IOMUX_A  12  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +            UR_DP1000_IOMUX_A  13  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +          >;
> +        };
> +
> +        uart0-pins {
> +          pinctrl-pins = <
> +            UR_DP1000_IOMUX_A  8  UR_DP1000_FUNC1
> +            UR_DP1000_IOMUX_A  9  UR_DP1000_FUNC1
> +          >;
> +
> +          pinconf-pins = <
> +            UR_DP1000_IOMUX_A  8   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +            UR_DP1000_IOMUX_A  9   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +          >;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bf971ff48b2..baaaa46b1a56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27358,6 +27358,13 @@ S:	Maintained
>  F:	drivers/usb/common/ulpi.c
>  F:	include/linux/ulpi/
>  
> +ULTRARISC DP1000 PINCTRL DRIVER
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> +F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> +
>  ULTRATRONIK BOARD SUPPORT
>  M:	Goran Rađenović <goran.radni@gmail.com>
>  M:	Börge Strümpfel <boerge.struempfel@gmail.com>
> diff --git a/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> new file mode 100644
> index 000000000000..bef28115898d
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * UltraRISC DP1000 pinctrl header.
> + *
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> +#define _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> +
> +/**
> + * UltraRISC DP1000 IO pad configuration
> + * port: A, B, C, D, LPC
> + *     Pin in the port
> + * pin:
> + *     PA: 0 - 15
> + *     PB-PD: 0 - 7
> + *     LPC: 0 - 12
> + * func:
> + *     UR_DP1000_FUNC_DEF: default
> + *     UR_DP1000_FUNC0: func0
> + *     UR_DP1000_FUNC1: func1
> + */
> +#define UR_DP1000_IOMUX_A		0x0
> +#define UR_DP1000_IOMUX_B		0x1
> +#define UR_DP1000_IOMUX_C		0x2
> +#define UR_DP1000_IOMUX_D		0x3
> +#define UR_DP1000_IOMUX_LPC		0x4

Not bindings, drop.

> +
> +#define UR_DP1000_FUNC_DEF		0
> +#define UR_DP1000_FUNC0			1
> +#define UR_DP1000_FUNC1			0x10000

Not a binding.

> +
> +/**
> + * Configure pull up/down resistor of the IO pin
> + * UR_DP1000_PULL_DIS: disable pull-up and pull-down
> + * UR_DP1000_PULL_UP: enable pull-up
> + * UR_DP1000_PULL_DOWN: enable pull-down
> + */
> +#define UR_DP1000_PULL_DIS	0
> +#define UR_DP1000_PULL_UP	1
> +#define UR_DP1000_PULL_DOWN	2

I don't see usage in the driver, so not a binding.

> +/**
> + * Configure drive strength of the IO pin
> + * UR_DP1000_DRIVE_DEF: default value, reset value is 2
> + * UR_DP1000_DRIVE_0: 20mA
> + * UR_DP1000_DRIVE_1: 27mA
> + * UR_DP1000_DRIVE_2: 33mA
> + * UR_DP1000_DRIVE_3: 40mA
> + */
> +#define UR_DP1000_DRIVE_DEF	2
> +#define UR_DP1000_DRIVE_0	0
> +#define UR_DP1000_DRIVE_1	1
> +#define UR_DP1000_DRIVE_2	2
> +#define UR_DP1000_DRIVE_3	3

Not a binding, use actual mA values in the DTS.

> +
> +/**
> + * Combine the pull-up/down resistor and drive strength
> + * pull: UR_DP1000_PULL_DIS, UR_DP1000_PULL_UP, UR_DP1000_PULL_DOWN
> + * drive: UR_DP1000_DRIVE_DEF, UR_DP1000_DRIVE_0, UR_DP1000_DRIVE_1,
> + *        UR_DP1000_DRIVE_2, UR_DP1000_DRIVE_3
> + */
> +#define UR_DP1000_BIAS(pull, drive)		(((pull) << 2) | (drive))
> +
> +#endif /* _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H */
> 

Also not used in the driver. Drop entire header or move out of bindings.

Best regards,
Krzysztof

