Return-Path: <linux-gpio+bounces-33423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cca7OAM0tWl3xgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:10:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094428C990
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 524BC3030D31
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F3230FC29;
	Sat, 14 Mar 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmi9YZig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3332192F9;
	Sat, 14 Mar 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773483004; cv=none; b=IJuQcR+IeMBjGyxKJrnmLp66ORBIRpHUhnJSNXTNpAnQPaYfFjnftjC+UHhikGmtppLsBw9RrfomIXJuAZkbSgufdGmZMjASsQqgWKp9qTZGNIfDF1jEt3PZy4qsU3GViBjqJ+CXOC4JkoeCpm2PkTENfrTtgKl2tt1OkLd0fug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773483004; c=relaxed/simple;
	bh=9JM2HxiM/2D7f0WoZeD6i7J2Lsf1/r1NqLsYIjJ2u+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOxCTsTdOICX1c93WreZ3/XWZXY8Rwi1XLt16pHKR+ZrKxwiuCaW+WXluIAcM/4SBZ9A/6jRc0el6qFzB4qNRP1P8eYkyKPmUoGibM+FglIVL18Y01B1v74xE4zai6xADzqd1nqjStmmde9gHR2B1Dyble2ib8LzcvpFi/ERBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmi9YZig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B61C116C6;
	Sat, 14 Mar 2026 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483004;
	bh=9JM2HxiM/2D7f0WoZeD6i7J2Lsf1/r1NqLsYIjJ2u+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmi9YZiggA0pbsrxw6Soz7a+FQrnIcYn7GpE7RwgUrAPpUC4t7ycM/H/16xwOUH3v
	 nRz+YczIa6OF6SYMY15h/81CKc/+JSZwDjQ6hazTspSL7kUW1z9lZZWZ+5koNGotTA
	 fATuGoC82zpaqaqMJ5uXnhWCIZFH/GXLKX+nkXW3o9T5VDz4xo/NZkIm5fTR3d4Ver
	 L18kzAatDsQ8oQaz1ghsmCNNpzbWOnpJ8D06tTNAG+jVg+aJnoZAJchxhYLudt8qkn
	 vyNSAtVYP2y5tvITHVgK2mcaLtYRH+5gBgreT2PI9Yv0J/Eakm5+UewR76lLkDSUYd
	 upo8Z6HpIFaKA==
Date: Sat, 14 Mar 2026 11:10:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linusw@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nb@tipi-net.de, 
	navada@ti.com, v-hampiholi@ti.com, sandeepk@ti.com, baojun.xu@ti.com, 
	shenghao-ding@ti.com
Subject: Re: [PATCH v1 2/8] dt-bindings: pinctrl: Add bindings for TI TAC5x1x
 pinctrl
Message-ID: <20260314-keen-glittering-pudu-b7b2c1@quoll>
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-3-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312184833.263-3-niranjan.hy@ti.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33423-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ti.com:email]
X-Rspamd-Queue-Id: 4094428C990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:18:27AM +0530, Niranjan H Y wrote:
> Add device tree bindings for the Texas Instruments TAC5x1x family
> pin controller. These bindings define the GPIO and pin control
> configuration interface for the device.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  .../bindings/pinctrl/ti,tac5x1x-pinctrl.yaml  | 163 ++++++++++++++++++
>  include/dt-bindings/pinctrl/tac5x1x.h         |  44 +++++
>  2 files changed, 207 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/tac5x1x.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
> new file mode 100644
> index 000000000000..3ccb262d6247
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ti,tac5x1x-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TAC5x1x Pin Controller
> +
> +maintainers:
> +  - Niranjan H Y <niranjan.hy@ti.com>
> +
> +description: |
> +  The TAC5x1x devices have 5 configurable pins that can be used for GPIO
> +  or alternate functions like PDM (Pulse Density Modulation) and interrupt
> +  generation. A subset of pins can be present in any variant of the HW.
> +
> +  This binding is used as a child node of the main TAC5x1x MFD device
> +  described in Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> +
> +  Pin capabilities:
> +  - GPIO1, GPIO2: Bidirectional, configurable as GPIO, PDM clock, or IRQ output
> +  - GPO1: Output only, configurable as GPIO, PDM clock, or IRQ output.
> +          Some variants use different name GPO1A.
> +  - GPI1: Input only, configurable as GPIO or PDM data input
> +          Some variants use different name GPI1A.
> +  - GPI2A: Input only, configurable as GPIO or PDM data input
> +
> +properties:
> +  compatible:
> +    const: ti,tac5x1x-pinctrl

No wildcards in compatibles and filenames.

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description: |
> +      First cell is the pin number (0-4 corresponding to GPIO1, GPIO2, GPO1, GPI1, GPI2A)
> +      Second cell is flags (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW)
> +
> +  gpio-ranges:
> +    maxItems: 1
> +    description: GPIO range mapping to pin controller
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 5
> +    description: Names for the GPIO lines
> +
> +patternProperties:
> +  '-state$':
> +    type: object
> +    description: Pin configuration state
> +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +    patternProperties:
> +      '^.*$':

-group$ or -grp$

> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +
> +        properties:
> +          groups:
> +            description: Pin groups to configure
> +            items:
> +              enum:
> +                - gpio1
> +                - gpio2
> +                - gpo1
> +                - gpi1
> +                - gpi2a
> +                - pdm_gpio1_gpio2
> +                - pdm_gpio1_gpi1
> +                - pdm_gpio1_gpi2a
> +                - pdm_gpio2_gpio1
> +                - pdm_gpio2_gpi1
> +                - pdm_gpio2_gpi2a
> +                - pdm_gpo1_gpio1
> +                - pdm_gpo1_gpio2
> +                - pdm_gpo1_gpi1
> +                - pdm_gpo1_gpi2a
> +
> +          function:
> +            description: Function to assign
> +            enum:
> +              - gpio
> +              - pdm
> +              - irq
> +
> +          drive-push-pull:
> +            type: boolean
> +            description: Enable push-pull drive mode
> +
> +          drive-open-drain:
> +            type: boolean
> +            description: Enable open-drain drive mode
> +
> +          drive-open-source:
> +            type: boolean
> +            description: Enable open-source drive mode
> +
> +          bias-pull-up:
> +            type: boolean
> +            description: Enable pull-up bias
> +
> +          bias-pull-down:
> +            type: boolean
> +            description: Enable pull-down bias
> +
> +          bias-high-impedance:
> +            type: boolean
> +            description: Set pin to high impedance
> +
> +          input-enable:
> +            type: boolean
> +            description: Enable input buffer
> +
> +          output-enable:
> +            type: boolean
> +            description: Enable output buffer

Drop all descriptions and type. common schema defines them. You only
need :true if none of other properties are applicable here.


> +
> +        required:
> +          - groups
> +          - function
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl {
> +        compatible = "ti,tac5x1x-pinctrl";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl 0 0 5>;
> +        gpio-line-names = "GPIO1", "GPIO2", "GPO1", "GPI1", "GPI2A";
> +
> +        default_state: default-state {
> +            pdm_config {
> +                groups = "pdm_gpo1_gpi1";
> +                function = "pdm";
> +                drive-push-pull;
> +            };
> +
> +            gpio_config {
> +                groups = "gpio1", "gpio2";
> +                function = "gpio";
> +                bias-pull-up;
> +            };
> +
> +            irq_config {
> +                groups = "gpo1";
> +                function = "irq";
> +                drive-open-drain;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/tac5x1x.h b/include/dt-bindings/pinctrl/tac5x1x.h
> new file mode 100644
> index 000000000000..8cc3fa0b7946
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/tac5x1x.h

Header always match bindings filename.

> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Device Tree binding constants for TAC5x1x pinctrl
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated
> + * Author: Niranjan H Y <niranjan.hy@ti.com>
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_TAC5X1X_H
> +#define _DT_BINDINGS_PINCTRL_TAC5X1X_H
> +
> +/* Pin IDs */
> +#define TAC5X1X_PIN_GPIO1 0
> +#define TAC5X1X_PIN_GPIO2 1
> +#define TAC5X1X_PIN_GPO1 2
> +#define TAC5X1X_PIN_GPI1 3
> +#define TAC5X1X_PIN_GPI2A 4

Since when GPIOs are bindings?

> +
> +/* Pin functions */
> +#define TAC5X1X_FUNC_GPIO 0
> +#define TAC5X1X_FUNC_PDM 1
> +#define TAC5X1X_FUNC_IRQ 2

No, pin function is a string.

> +
> +/* Pin drive modes */
> +#define TAC5X1X_DRIVE_HIZ 0
> +#define TAC5X1X_DRIVE_PUSH_PULL 1
> +#define TAC5X1X_DRIVE_PULL_DOWN 2
> +#define TAC5X1X_DRIVE_OPEN_DRAIN 3
> +#define TAC5X1X_DRIVE_PULL_UP 4
> +#define TAC5X1X_DRIVE_OPEN_SOURCE 5

Are you sure this patch was extensively reviewed internally?

Best regards,
Krzysztof


