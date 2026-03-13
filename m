Return-Path: <linux-gpio+bounces-33401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNqmDiN3tGlHogAAu9opvQ
	(envelope-from <linux-gpio+bounces-33401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:44:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A871D289DF2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 21:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 135FA30680BD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 20:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20B33D3487;
	Fri, 13 Mar 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8HGVUof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2E3264E0;
	Fri, 13 Mar 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773434636; cv=none; b=OuaN5rcA2aKU12JsBL6h6LEJPbWq+2P8uInF73FxBewMa/aG1MBR83G5MeHjY3PCXn5RsQbc9nZi7MgClEl9o8zRQpex6cw9+YLV5EONG+rEIl5ePR+6Dv0tTt2EE867q0IlhdkK6VhBxucbr2jeqtzp3TFTV1o5oBrS6ccwcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773434636; c=relaxed/simple;
	bh=qV+/X1vxRX8bZ7PVxv7/i4VhftfQzcPWpSMmHmU3UzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpAErO3Ye4RzumzdXpbR9V4Q3rzOShmZQaLS+SLBorAWAGONTrqcDCqSXReBwcjgwlc0o1qwVFfdQqBq/+BezILNPNmf3hxAbOiulc3xdhiD3lIrxlvVnkjBTVOB+/C1xw87gmNxJDcHGuWdek/qfejwCH/uTm5cNC/dBxGL6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8HGVUof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE13C19421;
	Fri, 13 Mar 2026 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773434636;
	bh=qV+/X1vxRX8bZ7PVxv7/i4VhftfQzcPWpSMmHmU3UzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8HGVUofQv6WUl/tCGU+LFZV38URnRQQGrK9WiJdkW+Yru0j7+gTpWA1QnQyqO2xf
	 aRRznDBl23YtRAUHRgwXcAdgCDwFA45Q4p5FHeaY4ejwuUBXfr8L4XxDabVMTR0QKQ
	 cp14bS+hcqUBdSOqM9R2l1ZF599SQ7JQY4LM/fi4uEp7BFsceG66ti8SEm3oD8XJR5
	 POeyTPWkqItYNWL/UwKjg9J+0KODLGfkk61iG/uTkadOz8vUkqS+iGhrxgzrs2l/2K
	 rtlsGRR0Pm6nzQlz2R3ff2KNvgPjgH3fKuHElH7NM2RoI+/itL/xQ0kSvJiwCQYlXw
	 AhxE11AJqawCQ==
Date: Fri, 13 Mar 2026 15:43:54 -0500
From: Rob Herring <robh@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	lee@kernel.org, linusw@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, nb@tipi-net.de,
	navada@ti.com, v-hampiholi@ti.com, sandeepk@ti.com,
	baojun.xu@ti.com, shenghao-ding@ti.com
Subject: Re: [PATCH v1 1/8] dt-bindings: mfd: Add bindings for TI TAC5x1x MFD
 core
Message-ID: <20260313204354.GA3262647-robh@kernel.org>
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312184833.263-2-niranjan.hy@ti.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	TAGGED_FROM(0.00)[bounces-33401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A871D289DF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:18:26AM +0530, Niranjan H Y wrote:
> Add device tree bindings for the Texas Instruments TAC5x1x family of
> audio codecs with integrated GPIO controller, describing the MFD core
> device interface, power supplies, and clock configuration.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tac5x1x.yaml   | 247 ++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml

This fails testing (not sure what happened to the email about it):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "ti,tad5212" found in schemas matching "$id":
	http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
Warning: Duplicate compatible "ti,taa5412" found in schemas matching "$id":
	http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#
Warning: Duplicate compatible "ti,taa5212" found in schemas matching "$id":
	http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml
	http://devicetree.org/schemas/sound/ti,pcm6240.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
Warning: Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml references a file that doesn't exist: Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml: Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml: Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml

> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> new file mode 100644
> index 000000000000..3d7943c0411f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
> @@ -0,0 +1,247 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAC5x1x Multi-Function Audio Device
> +
> +maintainers:
> +  - Niranjan H Y <niranjan.hy@ti.com>
> +
> +description: |
> +  TAC5x1x family of low-power, high-performance audio codecs with integrated
> +  GPIO controller and diagnostic capabilities.
> +
> +  This is the parent binding. Child nodes are bound by these bindings:
> +  - Pin controller: Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
> +  - Audio codec: Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> +
> +  Hardware features:
> +  - Audio ADC/DAC with configurable impedance and voltage references
> +  - 4-pin GPIO controller with alternate functions (PDM, IRQ)
> +  - Analog voltage and current monitoring circuits
> +  - Diagnostic fault detection with interrupt generation
> +
> +  Device datasheets can be found at:
> +    TAA5212:    https://www.ti.com/lit/ds/symlink/taa5212.pdf
> +    TAA5412-Q1: https://www.ti.com/lit/ds/symlink/taa5412-q1.pdf
> +    TAC5111:    https://www.ti.com/lit/ds/symlink/tac5111.pdf
> +    TAC5112:    https://www.ti.com/lit/ds/symlink/tac5112.pdf
> +    TAC5211:    https://www.ti.com/lit/ds/symlink/tac5211.pdf
> +    TAC5212:    https://www.ti.com/lit/ds/symlink/tac5212.pdf
> +    TAC5301:    https://www.ti.com/lit/ds/symlink/tac5301-q1.pdf
> +    TAC5311-Q1: https://www.ti.com/lit/ds/symlink/tac5311-q1.pdf
> +    TAC5312-Q1: https://www.ti.com/lit/ds/symlink/tac5312-q1.pdf
> +    TAC5411-Q1: https://www.ti.com/lit/ds/symlink/tac5411-q1.pdf
> +    TAC5412-Q1: https://www.ti.com/lit/ds/symlink/tac5412-q1.pdf
> +    TAD5112:    https://www.ti.com/lit/ds/symlink/tad5112.pdf
> +    TAD5212:    https://www.ti.com/lit/ds/symlink/tad5212.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,taa5212
> +      - ti,taa5412
> +      - ti,tac5111
> +      - ti,tac5112
> +      - ti,tac5211
> +      - ti,tac5212
> +      - ti,tac5301
> +      - ti,tac5311
> +      - ti,tac5312
> +      - ti,tac5411
> +      - ti,tac5412
> +      - ti,tad5112
> +      - ti,tad5212
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Hardware reset control pin (active low)
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Interrupt from device diagnostic circuits to host processor.
> +      Generated on voltage/current fault conditions and other diagnostic events.
> +
> +  clocks:
> +    maxItems: 1
> +    description: Master clock input (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  avdd-supply:
> +    description: |
> +      Analog supply voltage input (AVDD pin).
> +      Typical voltages: 1.8V, 3.0V, 3.3V, 5.0V
> +
> +  iovdd-supply:
> +    description: |
> +      Digital I/O supply voltage input (IOVDD pin).
> +      Typical voltages: 1.8V, 3.3V
> +
> +  ti,vref-voltage:

Use unit suffixes for things with units.

> +    description: |
> +      Internal voltage reference setting in microvolts.
> +
> +      Supported values:
> +      - 1375000: VREF = 1.375V
> +      - 2500000: VREF = 2.5V
> +      - 2750000: VREF = 2.75V
> +
> +      Constraint: Selected VREF must be lower than AVDD supply voltage.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1375000, 2500000, 2750000]
> +    default: 2500000
> +
> +  ti,micbias-voltage:
> +    description: |
> +      Microphone bias output voltage in microvolts.
> +
> +      Configuration options:
> +      - VREF voltage: Set to same value as ti,vref-voltage
> +      - 0.5 × VREF: Set to half of ti,vref-voltage value
> +      - AVDD voltage: Set to AVDD supply voltage value
> +
> +      Note: When set to AVDD voltage, hardware automatically overrides
> +      VREF setting to 2.75V regardless of ti,vref-voltage property.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 687500
> +    maximum: 3300000
> +
> +  ti,adc1-impedance:

Same here.

Though maybe existing bindings are using these same properties. That's 
fine then, but please state that at least. Really we should have a 
single, common definition for them.


> +    description: |
> +      ADC Channel 1 input impedance in Ohms.
> +      Supported impedance values:
> +      - 5000: 5k input impedance
> +      - 10000: 10k input impedance
> +      - 40000: 40k input impedance
> +      Available only for TAC5111, TAC5211, TAC5212, and TAA5212 variants.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [5000, 10000, 40000]
> +    default: 10000
> +
> +  ti,adc2-impedance:
> +    description: |
> +      ADC Channel 2 input impedance in Ohms.
> +      Supported impedance values:
> +      - 5000: 5k input impedance
> +      - 10000: 10k input impedance
> +      - 40000: 40k input impedance
> +      Available on stereo variants only (TAA5212, TAC5212).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [5000, 10000, 40000]
> +    default: 10000
> +
> +  ti,out2x-vcom-cfg:
> +    description: |
> +      Channel OUT2x VCOM reference voltage selection.
> +
> +      Configuration options:
> +      - 0: VCOM = 0.6 × VREF
> +      - 1: VCOM = AVDD / 2
> +
> +      Available on devices with stereo DAC output.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  ti,gpa-threshold:
> +    description: |
> +      General Purpose Analog voltage monitoring thresholds in millivolts.
> +      Format: [low_threshold_mv, high_threshold_mv]
> +
> +      Monitoring range: 0mV to 6000mV, Resolution: ~24mV per step
> +      Default thresholds: 200mV (low), 2600mV (high)
> +
> +      Generates interrupt on voltage fault conditions.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      minimum: 200
> +      maximum: 6000
> +    default: [200, 2600]
> +
> +  ti,in-ch-en:
> +    description: |
> +      Enable input channel diagnostic monitoring circuits.
> +
> +      When enabled (1), activates hardware monitoring for:
> +      - Input channel fault detection
> +      - Micbias current monitoring (if ti,micbias-threshold configured)
> +      - Input overvoltage detection
> +
> +      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  ti,out-ch-en:
> +    description: |
> +      Enable output channel diagnostic monitoring circuits.
> +
> +      When enabled (1), activates hardware monitoring for:
> +      - Output channel fault detection
> +      - Driver fault monitoring
> +      - Short circuit detection
> +
> +      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  ti,incl-se-inm:
> +    description: |
> +      Include INxM pins in single-ended input diagnostic scan.
> +
> +      When enabled (1), includes negative input pins (INxM) in diagnostic
> +      monitoring for single-ended input configurations.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  ti,incl-ac-coup:
> +    description: |
> +      Include AC-coupled input channels in diagnostic scan.
> +
> +      When enabled (1), includes AC-coupled input channels in the
> +      diagnostic monitoring system.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  ti,micbias-threshold:
> +    description: |
> +      Microphone bias current monitoring thresholds in microamps.
> +      Format: [low_threshold_ua, high_threshold_ua]
> +
> +      Current monitoring range: 100uA to 33000uA, Resolution: ~132uA per step
> +      Default thresholds: 2600uA (low), 18000uA (high)
> +
> +      Hardware monitors actual current flow through MICBIAS pin.
> +      Generates interrupts on fault conditions when ti,in-ch-en = <1>.
> +
> +      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      minimum: 100
> +      maximum: 33000
> +    default: [2600, 18000]
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - iovdd-supply
> +
> +unevaluatedProperties: false
> -- 
> 2.34.1
> 

