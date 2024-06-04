Return-Path: <linux-gpio+bounces-7131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3658FB786
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 17:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E31D1C22B4C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 15:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB82143C6B;
	Tue,  4 Jun 2024 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQxOU+l8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543615E83;
	Tue,  4 Jun 2024 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515375; cv=none; b=HwRZjQRWDEaEhpqMaQrUf0ABBVBgE4QAYRBqRE/rYaXVy1FaG2D+RyWiL+wwrd7MuNeVg1JuHuxHNn+o6GYy9uwOTnAH6FIL79/FDKyUD+knNNRcntV5Rsi17Ai9EWF/lI6X9mSv9l+oxEo6qkJjG12lG5dwV3E+lZJJromiMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515375; c=relaxed/simple;
	bh=4rMfVnXDULUZCwBnw5F1W1y6pVj9F8WIuK0q0yEsV8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4O/OIj6Ug7ndKhIxo+rB4P8bX25sxYcWtRCl8o9y1LOm0bY/Usmwbg3aoEe4VvMnK06yTpZrIaoJsYe1P+VcsMjMBIMciwnB1rNEVSsSZelOmk176HVwpG1KjbFgqwwpgGCQHnZ17RYkWUSWt7BM9srQM1C7nvlhxRCi2zQyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQxOU+l8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A13C2BBFC;
	Tue,  4 Jun 2024 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717515374;
	bh=4rMfVnXDULUZCwBnw5F1W1y6pVj9F8WIuK0q0yEsV8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQxOU+l8yAScZCmZLUyMFk7yaYYMb8CHKKLgXoYs4N3ZNX9ILogCN/Z11xyXc7JDx
	 P0sV1E+2P4uExY6RV66r7CbU1Ypo82FJ/x8bS3Sjbgy0mK4qbqfclALzmUBc+hWwx8
	 uhltP3d+tNOZixOn0XOe8NDobpnCXQ4GsFk8I4Bo/aEbOJLJuQVuEVdJ5aKu+iTmsm
	 DP+sMRuQtc7SVQIL9ZKDEEg6FVTTwwMyQU15mv17LbYnjiqY23JqT3ttapieGLf2dT
	 PYcq3KaNQ2FHYscEX9suzjSLgKSBu3w3/YK75r0H5PF2GUXcEAKIPKs42bKTrhwGRA
	 KP8wXGs3z9qMg==
Date: Tue, 4 Jun 2024 10:36:12 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
Message-ID: <20240604153612.GA839371-robh@kernel.org>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, May 30, 2024 at 06:38:43PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add documentation for the pin controller found on the Renesas RZ/V2H(P)
> (R9A09G057) SoC. The RZ/V2H PFC varies slightly compared to the RZ/G2L
> family:
> - Additional bits need to be set during pinmuxing.
> - The GPIO pin count is different.
> 
> Hence, a SoC-specific compatible string, 'renesas,r9a09g057-pinctrl', is
> added for the RZ/V2H(P) SoC.
> 
> Also, add the 'renesas,output-impedance' property. The drive strength
> setting on RZ/V2H(P) depends on the different power rails coming out from
> the PMIC (connected via I2C). These power rails (required for drive
> strength) can be 1.2V, 1.8V, or 3.3V.
> 
> Pins are grouped into 4 groups:
> 
> Group 1: Impedance
> - 150/75/38/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
> 
> Group 2: Impedance
> - 50/40/33/25 ohms (at 1.8V)
> 
> Group 3: Impedance
> - 150/75/37.5/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
> 
> Group 4: Impedance
> - 110/55/30/20 ohms (at 1.8V)
> - 150/75/38/25 ohms (at 1.2V)
> 
> The 'renesas,output-impedance' property, as documented, can be
> [0, 1, 2, 3], these correspond to register bit values that can
> be set in the PFC_IOLH_mn register, which adjusts the drive
> strength value and is pin-dependent.
> 
> As power rail information may not be available very early in the boot
> process, the 'renesas,output-impedance' property is added instead of
> reusing the 'output-impedance-ohms' property.
> 
> Also, allow bias-disable, bias-pull-down and bias-pull-up properties
> as these can be used to configure the pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated description for renesas,output-impedance property
> - Updated commit description
> 
> RFC->v2
> - Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
> - Updated values for renesas,output-impedance
> - Added bias properties
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 23 +++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> index 881e992adca3..957b9f7e7de5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -26,6 +26,7 @@ properties:
>                - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
>                - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
>                - renesas,r9a08g045-pinctrl # RZ/G3S
> +              - renesas,r9a09g057-pinctrl # RZ/V2H(P)
>  
>        - items:
>            - enum:
> @@ -66,10 +67,14 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    items:
> -      - description: GPIO_RSTN signal
> -      - description: GPIO_PORT_RESETN signal
> -      - description: GPIO_SPARE_RESETN signal
> +    oneOf:
> +      - items:
> +          - description: GPIO_RSTN signal
> +          - description: GPIO_PORT_RESETN signal
> +          - description: GPIO_SPARE_RESETN signal
> +      - items:
> +          - description: PFC main reset
> +          - description: Reset for the control register related to WDTUDFCA and WDTUDFFCM pins

You need a conditional schema for ensuring the length is 2 for RZ/V2H 
and 3 otherwise.

>  
>  additionalProperties:
>    anyOf:
> @@ -111,6 +116,16 @@ additionalProperties:
>          output-high: true
>          output-low: true
>          line-name: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        renesas,output-impedance:
> +          description: |

Don't need '|'.

> +            Output impedance for pins on the RZ/V2H(P) SoC. Values 0, 1, 2, and 3

Don't repeat values in free form text.

> +            correspond to register bit values that can be set in the PFC_IOLH_mn
> +            register, which adjusts the drive strength value and is pin-dependent.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [0, 1, 2, 3]
>  
>      - type: object
>        additionalProperties:
> -- 
> 2.34.1
> 

