Return-Path: <linux-gpio+bounces-24951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A243CB35204
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 05:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE7120867D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 03:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20EB2BF3F4;
	Tue, 26 Aug 2025 03:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+tAGav8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C161FCE;
	Tue, 26 Aug 2025 03:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756177351; cv=none; b=pIHqiVjycqP+BBlyL/fLLYcD7VzSxpa0cahdD83Pc9DBVsQKqETNk6uhoPGXpIp6Aa/8/izrQ7Iu2fn/2HP/7RK7R3aagY3sMqXPQJ7DfZwq3/dJXhpUBrQ9OXFjIOG8Yp46bEmHr2E6VYWMuSzlJvX4olXca8wBZVw6fGyi0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756177351; c=relaxed/simple;
	bh=TnY1fBnPo4jHkpmvDnQPDGPvrviKvfEgR6fDF7bnW8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJvDiO8P/ZbRkyvdKDhrcCfpUBqm/3EAUt/hMi8cya6fqM/Z6pPRBEOV6ndBWm0shiXoVJeN1APXbR/ahZrmphRCqN+VJ3w3Gi2o1v0zs0m7IrMGIy71dKEumT9A1nhOR+/yGQ65yHiJ+TyDjYs4fYDZ9+6fV9XdL9J/fAMj8xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+tAGav8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20057C4CEED;
	Tue, 26 Aug 2025 03:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756177350;
	bh=TnY1fBnPo4jHkpmvDnQPDGPvrviKvfEgR6fDF7bnW8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+tAGav8KRxD2Vhc0vVQGLUeMASIjTn5t7vg569071GFar80qwvi5gQzBS/el0jcf
	 /0F3c8PHo30cX7Vh6nJZsj3ZM5NYFb8PAi4GfRmZvizqDbvkYadYFkojDwBMG4YL1P
	 dN46mJCl5yxVUlIAutAIA42ckLrteJgsIBEWPPdmJCKXKuH9LMPOxAk+5jshJ28qeA
	 5hmbsaDblckfjGKN/A6UxCL1y6vF3/HQtBmoTeI4AJ0eXySlim1AT92b2y8eYla86M
	 VHAE/8Rj5iup7mRET6hk4kDcIQgSgI0Ql0BFhLA+beZWt4vss+bJ1yoU3F44XroNOh
	 d/QCv+HiPUBAw==
Date: Mon, 25 Aug 2025 22:02:28 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: setotau@yandex.ru
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Message-ID: <n2t3qdlo2xf325fms3gwfqqkmjvwgxzauzzgdjqew6cebrnm5h@5w4jwjbid4ih>
References: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
 <20250825-sdm660-lpass-lpi-v3-2-65d4a4db298e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-sdm660-lpass-lpi-v3-2-65d4a4db298e@yandex.ru>

On Mon, Aug 25, 2025 at 03:32:29PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Nickolay Goppen <setotau@yandex.ru>
> 
> Add bindings for pin controller in SDM660 Low Power Audio SubSystem
> (LPASS).
> 
> Co-developed-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6b930a5b914bc79a00dbaead41189efc525c2eb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM660 SoC LPASS LPI TLMM
> +
> +maintainers:
> +  - Nickolay Goppen <setotau@yandex.ru>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
> +  (LPASS) Low Power Island (LPI) of Qualcomm SDM660 SoC.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdm660-lpass-lpi-pinctrl
> +
> +  reg:
> +    items:
> +      - description: LPASS LPI TLMM Control and Status registers
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sdm660-lpass-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-sdm660-lpass-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-sdm660-lpass-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-9]|1[0-9]|2[0-6])$"

Unless I'm parsing the implementation incorrectly, this needs to allow
gpio0 through gpio31.

I.e. it should be: "^gpio([0-9]|[1-2][0-9]|3[0-1])$"

Regards,
Bjorn

> +
> +      function:
> +        enum: [ gpio, comp_rx, dmic12, dmic34, mclk0, pdm_2_gpios,
> +                pdm_clk, pdm_rx, pdm_sync ]
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +allOf:
> +  - $ref: qcom,lpass-lpi-common.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    lpi_tlmm: pinctrl@15070000 {
> +        compatible = "qcom,sdm660-lpass-lpi-pinctrl";
> +        reg = <0x15070000 0x20000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpi_tlmm 0 0 32>;
> +    };
> 
> -- 
> 2.51.0
> 
> 

