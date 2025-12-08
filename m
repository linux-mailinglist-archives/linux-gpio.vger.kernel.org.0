Return-Path: <linux-gpio+bounces-29361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD8CAC301
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 07:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBB4A30532B8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 06:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D176131A818;
	Mon,  8 Dec 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Adp7hNF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F631A7FB;
	Mon,  8 Dec 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175393; cv=none; b=NQBNxji1vlSjgpiJLQXHKJqC52qZxzSHKBZOKS7UswfSHTEF/luvA8N0z1lTEPHvnVKjcbGS74Dd+cUn/nfavoKwpQpPdDHpVREFr+qdpzodLMu7h0zkorrb96fLddumO6xxdmdvdcl6NpbDUP6NOOtU/z4YtTAxmWtyjEwA31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175393; c=relaxed/simple;
	bh=BNL8+owLhbO9teOYyNVriq9viH9YuOxeblnmtV4NFco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTNhi+muaNBnhZvHUonBlfFUkOHDk9KbkeDyvVl2M1XJt8eLwsH4raswiJnglZk6LBMr7rpPzzcAWS4/21nyUE2VbXRUCOzCvpbaZFD0He4vnAC1gkEzleMCXj0Zj2YrKHukuJ8dfdy/Zamx3Oz+cCJtxwixMYi9S7BpOFyaglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Adp7hNF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03D0C4CEF1;
	Mon,  8 Dec 2025 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175393;
	bh=BNL8+owLhbO9teOYyNVriq9viH9YuOxeblnmtV4NFco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Adp7hNF8uf+sca8VaTE6dkzXOihGGqJBrNksUNoNA5ao9JDXdYwvTUB6u/nJTBuFE
	 Yp34u8aXIE2zd/nPu4Q4kATUtCUULw7f6qn50NnYEb8Y9UP9RwCVTVLjP46/rZVL+W
	 I2bAU0j+2YotigSlLJoWWf8hr5C2uESoLToaTRuKW52bUM5LPCg6mPns9Yqx7pPp9D
	 TyVtmDTaVM4u00yHu/sn66vv4l66FQSEex3jsmhz7grRJghQeJG+sCUeC5xMgWe263
	 EaRlVCD9DGRpWwgCb7YQkPLO8mO4qkjVx11IZS0gwYeQTPLZM7mfYTRGBZcmbGneYm
	 GS0IvVXtW0nUA==
Date: Mon, 8 Dec 2025 07:29:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v2 7/8] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
Message-ID: <20251208-invisible-crazy-squirrel-bb3af0@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-8-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-8-ye.zhang@rock-chips.com>

On Sat, Dec 06, 2025 at 01:08:43PM +0800, Ye Zhang wrote:
> Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
> which is a sub-device of the main pinctrl on some Rockchip SoCs.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>  .../bindings/pinctrl/rockchip,rmio.yaml       | 130 ++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 93bf8f352e48..01df0a51ff83 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -83,6 +83,15 @@ required:
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
> +
>    "gpio@[0-9a-f]+$":
>      type: object
>  
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> new file mode 100644
> index 000000000000..28ec5ad62061
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> @@ -0,0 +1,130 @@
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
> +  (General Register Files).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rmio

Nope, you need Soc specific compatibles. Please see writing bindings
doc first.


> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:

Huh? That's already in the parent, no?

> +      The phandle of the syscon node for the GRF registers.
> +
> +  rockchip,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The offset of the RMIO configuration registers within the GRF.
> +
> +  rockchip,pins-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of physical pins supported by this RMIO instance.
> +      Used for boundary checking and driver initialization.
> +
> +additionalProperties:
> +  type: object
> +  additionalProperties:
> +    type: object
> +    properties:
> +      rockchip,rmio:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +        description: |
> +          A list of pin-function pairs. The format is <pin_id function_id>.
> +          - pin_id: The index of the RMIO pin (0 to pins-num - 1).
> +          - function_id: The mux value selecting the peripheral function.
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              maximum: 31
> +              description:
> +                RMIO Pin ID.
> +            - minimum: 0
> +              maximum: 98
> +              description:
> +                Function ID.
> +
> +    required:
> +      - rockchip,rmio
> +
> +    additionalProperties: false
> +
> +  additionalProperties: false
> +
> +required:
> +  - compatible
> +  - rockchip,grf
> +  - rockchip,offset
> +  - rockchip,pins-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
> +
> +    pinctrl {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Drop all this and below. Parent node should have complete example.

> +        ranges;
> +
> +        rmio {
> +            compatible = "rockchip,rmio";
> +            rockchip,grf = <&grf_pmu>;
> +            rockchip,offset = <0x80>;
> +            rockchip,pins-num = <32>;
> +
> +            rmio-uart {
> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
> +                    rockchip,rmio = <RMIO_PIN27 RMIO_UART1_TX>;
> +                };
> +
> +                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
> +                    rockchip,rmio = <RMIO_PIN28 RMIO_UART1_RX>;
> +                };
> +            };
> +        };
> +
> +        pcfg_pull_default: pcfg-pull-default {
> +          bias-pull-pin-default;
> +        };
> +
> +        rm {
> +          rmio_pin27_pins: rmio-pin27-pins {
> +            rockchip,pins = <1 RK_PC2 7 &pcfg-pull-default>;
> +          };
> +
> +          rmio_pin28_pins: rmio-pin28-pins {
> +            rockchip,pins = <1 RK_PC3 7 &pcfg-pull-default>;
> +          };
> +        };
> +    };
> +
> +    uart1: serial@20064000 {
> +      compatible = "snps,dw-apb-uart";

Do not add irrelevant examples. Please read carefully writing bindings,
writing schema and for example by talk for beginners in DT.

This patchset does not make me happy, too many trivial issues.

Best regards,
Krzysztof


