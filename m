Return-Path: <linux-gpio+bounces-33052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MCKAzQRsWmYqQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:52:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0929B25D10A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 583B8303189F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D977131197B;
	Wed, 11 Mar 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsL+5bKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D92BE043;
	Wed, 11 Mar 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211902; cv=none; b=Er+py1Q/Pv0WuTRNcDbKO4HHWjvQtkYH4vWVpqPvPWhRblrqnnIV5gZwgwllNoOkocaVkZPvv/r/ZTwAr6crwGfvzeCRr2lEFteT3dCU8a1kHXBHT9J6lt7thcsbEdySd/ppGyY1927Bpsatd9xghFIWX6eE6Qkafgtc5ysvHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211902; c=relaxed/simple;
	bh=Oc2x3ElYrjUwgmDviA0P5KAGFhDwqTHN0y27sRC7lR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBBSC7PjC778A58Ia7hw7KIlM8ROXj9akPotW+9uWUWjx7qL0I4AzaEQ8t4L9EzsAcPG1dXr+Iz4FAe07TU6rh1Mx8vI7vUriF5CzxrSXIjThlOsVX4SQxLosMrZt466UVsgVo1YgMjLdUXLyehoxvhbX+o0kn1f51V38OGRwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsL+5bKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4025C4CEF7;
	Wed, 11 Mar 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773211902;
	bh=Oc2x3ElYrjUwgmDviA0P5KAGFhDwqTHN0y27sRC7lR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsL+5bKxgNsi/48zPwMoDvq7iH/riRJGMq1T9F0TL9FP6jo7qIelqRRE/WIgyaJZs
	 EM+Sdd4dy4FfnxWUoSLuO/DF5v35BKcnC3vc+n0kTD+LPsrVdLvpDkeN8IyZASON7K
	 92rYjdOpwbw+jQ+wFPvkN8VtFaBKuq6zJY7wJEOE+C4WNOaY78SNJkX5eIt6iIlCrw
	 XDoIRX7HvHnr9LXFOvyzborf81bqd+627nf4hoxLDhhD/2y5oyVv6QoJaTzgIVK8Cx
	 SJO6FFtarpkfmUvu0xWn5DLjfscwdV8vPUdLjs426Agghl9a5Dmy/ro3RtC27PI8Mi
	 E3Zj74CnTEMeQ==
Date: Wed, 11 Mar 2026 07:51:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260311-icy-dove-of-endurance-ab2bbe@quoll>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-2-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309134920.1918294-2-o.rempel@pengutronix.de>
X-Rspamd-Queue-Id: 0929B25D10A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,protonic.nl:email,pengutronix.de:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:49:12PM +0100, Oleksij Rempel wrote:
> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
> 
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
> 
> The device interfaces via SPI and provides multiple functions. To
> accurately represent the hardware without unnecessary DT overhead, the
> binding is structured as follows:
> - pinctrl: A dedicated child node managing the 22 switch inputs (SG/SP
>   pins) and their GPIO configurations.
> - hwmon: Integrated into the parent node, exposing critical hardware
>   faults (OT, OV, UV) and static voltage/temperature thresholds.
> - mux: Integrated into the parent node, controlling the 24-to-1 analog
>   multiplexer to route pin voltages, internal temperature, or battery
>   voltage to an external SoC ADC.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v3:
> - Drop regular expression pattern from pinctrl child node and define
>   it as a standard property
> - Reorder required properties list in MFD binding
> - Remove stray blank line from the MFD binding devicetree example
> - Replace unevaluatedProperties with additionalProperties in the pinctrl
>   binding
> changes v2:
> - Squashed MFD, pinctrl, hwmon, and mux bindings into a single patch
> - Removed the empty hwmon child node
> - Folded the mux-controller node into the parent MFD node
> - Added vbatp-supply and vddq-supply to the required properties block
> - Changed the example node name from mc33978@0 to gpio@0
> - Removed unnecessary literal block scalars (|) from descriptions
> - Documented SG, SP, and SB pin acronyms in the pinctrl description
> - Added consumer polarity guidance (GPIO_ACTIVE_LOW/HIGH) for SG/SB
>   inputs, with a note on output circuit dependency
> - Updated commit message
> ---
>  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 112 ++++++++++++++++++
>  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> new file mode 100644
> index 000000000000..23520315d484
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,mc33978.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Multiple Switch Detection Interface
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description:
> +  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
> +  devices with 22 switch inputs, integrated fault detection, and analog
> +  multiplexer (AMUX) for voltage/temperature monitoring.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio(@.*)?$"

@.+, because it is not optional, or just drop the nodename completely.

> +
> +  compatible:
> +    enum:
> +      - nxp,mc33978
> +      - nxp,mc34978
> +
> +  reg:
> +    maxItems: 1
> +    description: SPI chip select number
> +
> +  spi-max-frequency:
> +    maximum: 8000000
> +    description: Maximum SPI clock frequency (up to 8 MHz)
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      INT_B pin interrupt. Active-low, indicates pin state changes or
> +      fault conditions.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      First cell is the IRQ number (0-21 for pins, 22 for faults).
> +      Second cell is the trigger type (IRQ_TYPE_* from interrupt-controller.h).
> +
> +  '#mux-control-cells':
> +    const: 0
> +    description:
> +      Present if the device AMUX selector is used as a mux provider.
> +      Consumers (e.g. io-channel-mux) must provide settle-time-us for the
> +      external ADC sampling path.
> +
> +  vddq-supply:
> +    description: Digital supply voltage
> +
> +  vbatp-supply:
> +    description: Battery/power supply
> +
> +  pinctrl:
> +    type: object
> +    $ref: /schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +    description:
> +      Pinctrl and GPIO controller child node for the 22 switch inputs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - vddq-supply
> +  - vbatp-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        msdi: gpio@0 {
> +            compatible = "nxp,mc33978";
> +            reg = <0>;
> +            spi-max-frequency = <4000000>;
> +
> +            interrupt-parent = <&gpiog>;
> +            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +
> +            vddq-supply = <&reg_3v3>;
> +            vbatp-supply = <&reg_12v>;
> +
> +            #mux-control-cells = <0>;
> +
> +            pinctrl {
> +                compatible = "nxp,mc33978-pinctrl";
> +                gpio-controller;
> +                #gpio-cells = <2>;

pin grp nodes should be here


> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> new file mode 100644
> index 000000000000..ba946906557c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Pinctrl/GPIO Driver

s/Driver// because otherwise it sounds like "pinctrl driver" and you
cannot drive pin controls.

> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
> +
> +  Pin numbering:
> +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
> +    contacts closed to ground and typically require GPIO_ACTIVE_LOW
> +    flags when used as digital inputs.
> +  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
> +    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
> +    inputs monitor contacts closed to the battery voltage and typically
> +    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
> +
> +  Output Emulation:
> +  The hardware lacks standard push-pull output drivers. Outputs are emulated
> +  by toggling the programmable wetting current sources (acting as pull-ups or
> +  pull-downs) and the hardware tri-state registers. Because of this physical
> +  constraint:
> +  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN or
> +    GPIO_OPEN_SOURCE in the device tree.
> +  - Push-pull configurations are physically unsupported.
> +  - The active polarity depends entirely on the external circuit (e.g., how an
> +    LED is wired) and must be flagged accordingly by the consumer.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978-pinctrl
> +      - nxp,mc34978-pinctrl

I did not raise it before, but now I think these compatibles are
pointless. MC33978 is a one, specific (as in fixed) device, so its
pinctrl/gpio part won't be taken and used in some other device. They
should be dropped. That way entire schema would fit parent one, although
its placement is odd - it's not really MFD device.


> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  ngpios:
> +    const: 22
> +
> +patternProperties:
> +  "^.*-grp$":

Keep consistent quotes, either ' or "

Best regards,
Krzysztof


