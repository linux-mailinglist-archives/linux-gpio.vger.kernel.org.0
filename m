Return-Path: <linux-gpio+bounces-31669-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOwvMNf1jmnTGAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31669-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:58:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A7134C7D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9249A30F98E5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E04734F46C;
	Fri, 13 Feb 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBTUOxlt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BB33E361;
	Fri, 13 Feb 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976646; cv=none; b=Ap/sSuLzoNyw14Uk6k9G0cmW/nvdMMLAAf6RSdgAYyYIlReN3mGItDm0L75kcOARJILWrd7ixblU5bSEAuuxe/XzLWMhdExTwLOkQEkoJru5OwH9xVMzR9LjdFrdM5wOq+0z+wjTUuH463XdYkoc4HBuvsOzq8oelZ1y0k3kSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976646; c=relaxed/simple;
	bh=2AQE3QvHfFwbeib4XB2oHCuNMDAdcVSPDzImHY2Ftfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlmVtfLwzW6iS+DxXrPi0QgJg1/s/vUPdmkndQYyVM8SCjL8nNYH0WvMPD8B3X6WLoHGS5EmdIw5nDr1fmwNHexiDVkpsqGK5Ej/7p8eAd33f55cgDfHl1xD6cObnroKADpNrYMpO9vW9tdF3VgzqElwFRLF2ByWDOkKBgmsLco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBTUOxlt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E49C116C6;
	Fri, 13 Feb 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770976646;
	bh=2AQE3QvHfFwbeib4XB2oHCuNMDAdcVSPDzImHY2Ftfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hBTUOxltPIsaDiVD7gHWR7i0fy2c23VIRLAdoyBQ/Fqi/GPE0FaqQnpZoeLyssC+T
	 huKhljhCUHYTJCGzAs4gvCSGJkSkPyDZpdByeaScn6+aNJ8ADm72Gj/Ctvv5nSqzOd
	 ZWT6aqeSYxruwPCMCpRfmK4eXNxhpnFQLIr/Hju9dqSYIHxGnJAXaPgN9jsjyB5irA
	 xt74TUW3yf2Dw/Xt16L1uk1DiZcOfBVw1m3fZmbnF/WwLhc89vKA/h/aHqIu7csTP9
	 4GKNPVz/xTQwiDb05fD4Y3IhMjkBqC2n9pyndaKGiLoi93SJLSMuuVi9D0XM308qKq
	 glolakPnznDpw==
Message-ID: <5d371a1d-0265-4c59-95dd-19d23bf596d7@kernel.org>
Date: Fri, 13 Feb 2026 10:57:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
To: Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij
 <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: patrickw3@meta.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
 <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31669-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 442A7134C7D
X-Rspamd-Action: no action

On 13/02/2026 09:17, Billy Tsai wrote:
> Add a Devicetree binding for a generic pin controller where pinmux and/or
> pin configuration are represented as fixed-width fields packed
> sequentially within shared registers.
> 
> The binding targets controllers that are typically exposed as subnodes of
> a syscon node and accessed via regmap-mmio through the parent.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pinctrl/pinctrl-packed.yaml           | 166 +++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
> new file mode 100644
> index 000000000000..dd01ba2fed71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-packed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Pin Controller with Packed-Field Registers
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description:
> +  This binding describes pin controller hardware where pinmux and/or
> +  pin configuration fields are represented as fixed-width fields packed
> +  sequentially within shared registers.
> +
> +  Such controllers are commonly embedded within a larger system control
> +  unit (SCU) register block and may be exposed as subnodes of a syscon
> +  device.
> +
> +  Conceptually, this model is related to the pinctrl-single binding,
> +  but instead of describing individual register offsets via
> +  <offset, value, mask> tuples, the hardware provides fixed-width,
> +  per-pin fields packed linearly within shared registers.

Why this cannot be part of pinctrl-single then? Why all these properties
are needed? I imagine that you need them to customize the generic
binding to your device and that would be counter argument - generic
bindings are too generic so people need to grow them with hundreds
properties (see the very simple binding of simple audio card).


> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf

> +      - enum:
> +          - pinctrl-packed
> +          - pinconf-packed
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#pinctrl-cells':
> +    description:
> +      The pinctrl provider uses standard state nodes referenced by pinctrl-N
> +      properties; consumers do not pass per-pin arguments via phandle.
> +    const: 1
> +
> +  pinctrl-packed,function-mask:
> +    description: Mask of the allowed register bits for a single pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-packed,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of a gpio-range node
> +        - description: pin base
> +        - description: number of pins
> +        - description: gpio function
> +
> +patternProperties:
> +  '-pins(-[0-9]+)?$|-pin$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      pinctrl-packed,pins:

No, use standard pinctrl properties.

> +        description: Array of pin index and function selector pairs.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      pinctrl-packed,bias-pullup:
> +        description: Optional bias pull-up configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enabled pull-up bits.
> +          - description: Disabled pull-up bits.
> +          - description: Pull-up mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,bias-pulldown:
> +        description: Optional bias pull-down configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enabled pull-down bits.
> +          - description: Disabled pull-down bits.
> +          - description: Pull-down mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,drive-strength:
> +        description: Optional drive strength configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Drive strength value.
> +          - description: Drive strength mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,input-schmitt:
> +        description: Optional input Schmitt trigger configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Schmitt trigger value.
> +          - description: Schmitt trigger mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,input-schmitt-enable:
> +        description: Optional input Schmitt enable configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 4
> +        items:
> +          - description: Input value.
> +          - description: Enable bits.
> +          - description: Disable bits.
> +          - description: Schmitt mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,low-power-mode:
> +        description: Optional low power mode configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Low power value.
> +          - description: Low power mask.
> +        additionalItems: false
> +
> +      pinctrl-packed,slew-rate:
> +        description: Optional slew rate configuration.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        maxItems: 2
> +        items:
> +          - description: Slew rate value.
> +          - description: Slew rate mask.
> +        additionalItems: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#pinctrl-cells"
> +  - pinctrl-packed,function-mask
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +examples:
> +  - |
> +    syscon@0 {
> +        compatible = "syscon", "simple-mfd";

This is not allowed and you will have warnings here, which means you did
not test the binding correctly (completely). Not even needed here, drop
entire node.

Best regards,
Krzysztof

