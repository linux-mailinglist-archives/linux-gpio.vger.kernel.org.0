Return-Path: <linux-gpio+bounces-36245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG0iO4uZ+mmQQAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 03:29:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE914D5445
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 03:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53D20300F5D7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 01:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FBF26D4F7;
	Wed,  6 May 2026 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdKcHrrY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F54C97;
	Wed,  6 May 2026 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030983; cv=none; b=iDl+LJ5g0ROVkSMTXr5MjSYRs6MM4w8M44DrNN6S7PpTBw9psgcnrKEiSs/wmQpBoP9NOQsVGQ09Ei3F8VXM0rNa6sJQp+SO0oAFrRHSLRoUIQQaaMkHICGAGbObhfyRjoyI8kbITRraSvHZ9kWO2LNG1QvDZHs58gwfpVW30eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030983; c=relaxed/simple;
	bh=wP89bVMkLCeV8uSax+sj7j6o99tqYb4LbJiJy8rGNWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCFaMQ/VMv/emHHS4yq1RYFUWvZSC8RnTj39H4EORsUkxBOaQJrMxFYXKaE5JwLKsOrxw3Zt8Gl3ThD2FHRPR3CivwTqB6OrXj2NXmeY3xt+38dmze3xJjllwXMffyK5Szqpmwyfg+zVhz6UeJaGvGDraO0dJR3TyH8UaAHv5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdKcHrrY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76678C2BCB4;
	Wed,  6 May 2026 01:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030982;
	bh=wP89bVMkLCeV8uSax+sj7j6o99tqYb4LbJiJy8rGNWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdKcHrrYbi/YQ5FiZUEcsDuRtsloLjS0sYVrYW2xhn81Va7VxiDuhGimwsO7+rFJu
	 Gj0z82hCvP0E9ld0m5c+z55pLNX2wRQQrUqaPAKAfRP7A8WaxKaFFMc/AOkojuYCkp
	 jhON0wdJj+F5wIpvz6eOy7v2f+LdpYlSuA2yx8g0EI96Yxfh8HmWU1uI2N6hTRrQN/
	 CSS4g82Xvl9CAAWloRdOnZzicC+dmvdjCkZWBzCpKqKV9WqonHiDToIorpyu2xQ6Bl
	 RXmiH0Z/NpxsYF6EQwMB4bC/zPDN9SPZ8+HKgR7MVzHpw+LSeYsyTK37IZO+ZNYNJt
	 FZ0FBdRNO7F3A==
Date: Tue, 5 May 2026 20:29:40 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260506012940.GA258045-robh@kernel.org>
References: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
 <20260428-upstream_pinctrl-v8-1-eb8ef9ab0498@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-upstream_pinctrl-v8-1-eb8ef9ab0498@aspeedtech.com>
X-Rspamd-Queue-Id: DAE914D5445
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36245-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.1.144:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,aspeedtech.com:email,devicetree.org:url]

On Tue, Apr 28, 2026 at 05:49:45PM +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
> 
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
> 
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 187 +++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..ef500209d81e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description:

Need '>' if you have paragraphs.

> +  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
> +  each having its own System Control Unit (SCU) for independent pin control.
> +  This pin controller manages the pin multiplexing for SoC0.
> +
> +  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
> +  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl

blank line

> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-state$':
> +    description: |
> +      Pin control state.
> +
> +      If `function` is present, the node describes a pinmux state and must

Use regular quotes.

> +      specify `groups`.
> +
> +      For pin configuration, exactly one of `groups` or `pins` must be
> +      specified in each state node. Group-level configuration applies to all
> +      pins in the group. Pin-level configuration may be supplied in a
> +      separate state node for individual pins; when both group-level and
> +      pin-level configuration apply to the same pin, the pin-level
> +      configuration takes precedence.
> +
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +      - if:
> +          required:
> +            - function
> +        then:
> +          required:
> +            - groups
> +      - oneOf:
> +          - required:
> +              - groups
> +          - required:
> +              - pins
> +
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum:
> +          - EMMC
> +          - JTAGDDR
> +          - JTAGM0
> +          - JTAGPCIEA
> +          - JTAGPCIEB
> +          - JTAGPSP
> +          - JTAGSSP
> +          - JTAGTSP
> +          - JTAGUSB3A
> +          - JTAGUSB3B
> +          - PCIERC0PERST
> +          - PCIERC1PERST
> +          - TSPRSTN
> +          - UFSCLKI
> +          - USB2AD0
> +          - USB2AD1
> +          - USB2AH
> +          - USB2AHP
> +          - USB2AHPD0
> +          - USB2AXH
> +          - USB2AXH2B
> +          - USB2AXHD1
> +          - USB2AXHP
> +          - USB2AXHP2B
> +          - USB2AXHPD1
> +          - USB2BD0
> +          - USB2BD1
> +          - USB2BH
> +          - USB2BHP
> +          - USB2BHPD0
> +          - USB2BXH
> +          - USB2BXH2A
> +          - USB2BXHD1
> +          - USB2BXHP
> +          - USB2BXHP2A
> +          - USB2BXHPD1
> +          - USB3AXH
> +          - USB3AXH2B
> +          - USB3AXHD
> +          - USB3AXHP
> +          - USB3AXHP2B
> +          - USB3AXHPD
> +          - USB3BXH
> +          - USB3BXH2A
> +          - USB3BXHD
> +          - USB3BXHP
> +          - USB3BXHP2A
> +          - USB3BXHPD
> +          - VB
> +          - VGADDC
> +
> +      groups:
> +        enum:
> +          - EMMCCDN
> +          - EMMCG1
> +          - EMMCG4
> +          - EMMCG8
> +          - EMMCWPN
> +          - JTAG0
> +          - PCIERC0PERST
> +          - PCIERC1PERST
> +          - TSPRSTN
> +          - UFSCLKI
> +          - USB2A
> +          - USB2AAP
> +          - USB2ABP
> +          - USB2ADAP
> +          - USB2AH
> +          - USB2AHAP
> +          - USB2B
> +          - USB2BAP
> +          - USB2BBP
> +          - USB2BDBP
> +          - USB2BH
> +          - USB2BHBP
> +          - USB3A
> +          - USB3AAP
> +          - USB3ABP
> +          - USB3B
> +          - USB3BAP
> +          - USB3BBP
> +          - VB0
> +          - VB1
> +          - VGADDC
> +
> +      pins:
> +        enum:
> +          - AB13
> +          - AB14
> +          - AC13
> +          - AC14
> +          - AD13
> +          - AD14
> +          - AE13
> +          - AE14
> +          - AE15
> +          - AF13
> +          - AF14
> +          - AF15
> +
> +      drive-strength:
> +        enum: [3, 6, 8, 11, 16, 18, 20, 23, 30, 32, 33, 35, 37, 38, 39, 41]
> +
> +      bias-disable: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@400 {
> +        compatible = "aspeed,ast2700-soc0-pinctrl";
> +        reg = <0x400 0x318>;
> +        emmc-state {
> +            function = "EMMC";
> +            groups = "EMMCG1";
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

