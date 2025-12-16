Return-Path: <linux-gpio+bounces-29622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1DCC416A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 16:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A401E30A9C8C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB432308F28;
	Tue, 16 Dec 2025 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADm1V8T6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0723FC5A;
	Tue, 16 Dec 2025 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900333; cv=none; b=S3WTIsj3nlUBDmRBbr6xZxsu/wSjFVOTAWw20UGS1OtGJ8q/g64oJnlLw5J43t8vZmS0jFnSfXybLK7zX+SrhVXUcgpPhUaDUgG8s+gxKq+wfKOmzk8OrXlZKXI/LiRl9NlH4Gt5n2MLU7bicquYlpMqd/hClWofgXGoPeEiPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900333; c=relaxed/simple;
	bh=K8pZtvebClu3B/cJuAfF0UnhnnGQopgoSPsXHN/hcN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riU+vxEs1eRLlG60ZFzCrKWBgkNTF2Rw+LnsjgnjhxWSP0zH6pcPJRNsczc3moZvt/QOE6jmnWV1FHXiP7yadJw/XBK3ZxGOmDJDmbXy5QnGunWp7ilcf7kJKf4YG8+Krl0G6Yeua6+KDpl3fiBDJKbsiCSLmXcI/8BQl0+1CUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADm1V8T6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FD6C4CEF1;
	Tue, 16 Dec 2025 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765900333;
	bh=K8pZtvebClu3B/cJuAfF0UnhnnGQopgoSPsXHN/hcN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ADm1V8T6S680/QK1LgaeuPNCbzu+pEz9pr6PGcj1DSxaCmr6RYUW+b03qAR10f/FR
	 mu2p/7qoL3HDi+ioNVeF6d3WhM2nHoAc5cWPcIOjkOLQ1WIq5Nofzn7jh50onjzB4/
	 Pv70wePghtuP3vjMYzYJeV6ifIoRHoB3E4khxht++oiAFhGymRYAOGnnyz7IVbw/TN
	 T3nVumGYv9GT3QKOoHS9tGx3kfEQEdVpKsCgbN9BQwTi01cUH78pVxHekZaPHOUDS/
	 DN0AOUad+zb2cyqHNzK9UbtOj4RJkiF+S10m8wfhwjS5KZ6YVUkfTMIDg8eYP68I8a
	 hiy56zaTCAdTQ==
Message-ID: <5154ca76-0f23-4b52-8e6d-07005c52ac6d@kernel.org>
Date: Tue, 16 Dec 2025 16:52:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2025 12:20, Ye Zhang wrote:
> 1. Add header file with constants for RMIO function IDs for the Rockchip
> RK3506 SoC.
> 2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
> which is a sub-device of the main pinctrl on some Rockchip SoCs.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>  .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
>  .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 97960245676d..9a27eaf7942b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -82,6 +82,15 @@ required:
>    - rockchip,grf
>  
>  patternProperties:
> +  "rmio[0-9]*$":
> +    type: object
> +
> +    $ref: "/schemas/pinctrl/rockchip,rmio.yaml#"
> +
> +    description:
> +      The RMIO (Rockchip Matrix I/O) controller node which functions as a
> +      sub-device of the main pinctrl to handle flexible function routing.

No. Your child has no resources, so it's not proper hardware
representation. Don't use Linux driver model in the bindings.

That's a NAK. Don't send the same AGAIN without addressing comments like
you did here.

> +
>    "gpio@[0-9a-f]+$":
>      type: object
>  
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> new file mode 100644
> index 000000000000..af0b34512fb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RMIO (Rockchip Matrix I/O) Controller
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |
> +  The RMIO controller provides a flexible routing matrix that allows mapping
> +  various internal peripheral functions (UART, SPI, PWM, etc.) to specific
> +  physical pins. This block is typically a sub-block of the GRF
> +  (General Register Files) or PMU (Power Management Unit).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rockchip,rk3506-rmio
> +      - const: rockchip,rmio

I don't see how pinctrl deserves generic compatible. I already commented
on this.


> +
> +  rockchip,rmio-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node (GRF or PMU) containing the RMIO registers.
> +      This property is required if the RMIO registers are located in a different
> +      syscon than the parent pinctrl node.

Why "if"? How this can be flexible?

Anyway, you did not address my previous comment at all.

NAK

> +
> +  rockchip,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The offset of the RMIO configuration registers within the GRF.

No, this belongs to the phandle.

Look how this is already described and do not come with other style.

> +
> +  rockchip,pins-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of physical pins supported by this RMIO instance.
> +      Used for boundary checking and driver initialization.
> +
> +patternProperties:
> +  "^[a-z0-9-]+$":

No, use a prefix or suffix. See other pinctrl bindings.

> +    type: object
> +    description:
> +      Function node grouping multiple groups.
> +
> +    patternProperties:
> +      "^[a-z0-9-]+$":

Same ocmment

> +        type: object
> +        description:
> +          Group node containing the pinmux configuration.
> +
> +        properties:
> +          rockchip,rmio:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description:
> +              A list of pin-function pairs. The format is <pin_id function_id>.
> +            minItems: 1
> +            items:
> +              items:
> +                - description: RMIO Pin ID (0 to pins-num - 1)
> +                  minimum: 0
> +                  maximum: 31
> +                - description: Function ID
> +                  minimum: 0
> +                  maximum: 98
> +
> +        required:
> +          - rockchip,rmio

Why aren't you using standard pinctrl bindings?

> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - rockchip,rmio-grf
> +  - rockchip,offset
> +  - rockchip,pins-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
> +
> +    pinctrl: pinctrl {

What's this?

> +        rmio: rmio {
> +            compatible = "rockchip,rk3506-rmio", "rockchip,rmio";
> +            rockchip,rmio-grf = <&grf_pmu>;
> +            rockchip,offset = <0x80>;
> +            rockchip,pins-num = <32>;
> +
> +            rmio-uart {
> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
> +                    rockchip,rmio = <27 RMIO_UART1_TX>;
> +                };
> +
> +                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
> +                    rockchip,rmio = <28 RMIO_UART1_RX>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> new file mode 100644
> index 000000000000..b129e9a8c287
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
> +
> +/* RMIO function definition */
> +#define RMIO_UART1_TX			1
> +#define RMIO_UART1_RX			2
> +#define RMIO_UART2_TX			3
> +#define RMIO_UART2_RX			4
> +#define RMIO_UART3_TX			5
> +#define RMIO_UART3_RX			6
> +#define RMIO_UART3_CTSN			7
> +#define RMIO_UART3_RTSN			8
> +#define RMIO_UART4_TX			9
> +#define RMIO_UART4_RX			10
> +#define RMIO_UART4_CTSN			11
> +#define RMIO_UART4_RTSN			12
> +#define RMIO_MIPITE			13
> +#define RMIO_CLK_32K			14
> +#define RMIO_I2C0_SCL			15
> +#define RMIO_I2C0_SDA			16


I do not see how this is a binding. Please point me to the patch using
this in the driver.

Best regards,
Krzysztof

