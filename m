Return-Path: <linux-gpio+bounces-26059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C007B550D0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D9F5867DF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F8230FC08;
	Fri, 12 Sep 2025 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7ULSFcN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065930F924;
	Fri, 12 Sep 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686757; cv=none; b=mEXhOPwmyXWRCqSC+RLan27ca5WbIL+wVCcF3DQLvGndDRc73eQane3UNS2Kjo3sY6+pkUjNgXKDbkbA1Wro1HL8KAcXcuV39e3pwsE0YwN+vUxgLxK/S24LFDDeKnTq9uKFsHJNrsb763nWndv6a2ewDpQP3681sn7Kd49IXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686757; c=relaxed/simple;
	bh=PSxYq2ubTxu1tLMT4DKVAGcg+k7YJbgFqjIaawl5S3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYNpiakUPewvZW52AHFgVXh11sCKTDGB5hx5qF5l/2F2LHlMzeIqYbeAx85PJCITThm2LNEvsAgRpvUwEPDH3rPOudQ8gmhcKTccPDOBpTLqSHCq6m7Jx1/tpdUhiTgTNoQO6CcRHDfWaop5iOJ/AxyOFZl1I/x010rj3ZrsskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7ULSFcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8EEC4CEF4;
	Fri, 12 Sep 2025 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686757;
	bh=PSxYq2ubTxu1tLMT4DKVAGcg+k7YJbgFqjIaawl5S3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7ULSFcNhUwPip5ZGQjDHF8BRxMGJs/tTb+aAPO85WFZx3/TPtG5mB8Pu7sXtqNzz
	 Cd1F60y4y6lJkZXJB40Ov9Ed2KGYzF7U9NTt1w2RGCjgkBeDgpNXQ1p3D9fsz1be6e
	 T8j2o47OLq/1uSPeEGtnooEP12z3/nd93lg0AiOqy+L9e3nTmVry01+N/nH03xLPnz
	 Hr2G5Yv9gsvSWOIhh8XFXccehuffFv8cLgqZC/vRzqlAmAkIfCUlB3xPcDZZIwplow
	 Z7imIVx59ZXIr+pWq4gqxoGm22ANUELll1XsHPLsWOZKS3FBD/sfrUONpyC4x3XcRT
	 6YaOE9diGR7Ug==
Date: Fri, 12 Sep 2025 09:19:16 -0500
From: Rob Herring <robh@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20250912141916.GA1339383-robh@kernel.org>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912060650.2180691-3-gary.yang@cixtech.com>

On Fri, Sep 12, 2025 at 02:06:49PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S5 state.

Wrap lines at 72 chars.

> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..c4a127fd8330
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 Pin Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  The pin-controller is used to control Soc pins. There are two pin-controllers
> +  on Cix Sky1 platform. one is used under S0 state, the other one is used under
> +  S5 state.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-iomuxc
> +      - cix,sky1-iomuxc-s5
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +# Client device subnode's properties
> +patternProperties:
> +  'pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '(^pins|pins?$)':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, and drive strength.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> +              See arch/arm64/boot/dts/cix/sky1-pinfunc.h for valid arguments.

Constraints on the values?

> +
> +        required:
> +          - pinmux
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
> +    #define DS_LEVEL4 (4)
> +    iomuxc: pinctrl@4170000 {
> +        compatible = "cix,sky1-iomuxc";
> +        reg = <0x4170000 0x1000>;
> +
> +        wifi_vbat_gpio: wifi-vbat-gpio-pins {
> +            pins-wifi-vbat-gpio {
> +                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
> +                bias-pull-up;
> +                drive-strength = <DS_LEVEL4>;
> +           };
> +        };
> +    };
> -- 
> 2.49.0
> 

