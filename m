Return-Path: <linux-gpio+bounces-33258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKSHB57asmlMQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:24:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BA2744E2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52DFE31F918B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A57638237E;
	Thu, 12 Mar 2026 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3tUlYm7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA636B076;
	Thu, 12 Mar 2026 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328858; cv=none; b=u085Ks+D5v22673Nqt+s2DSm48ru3j3Z0i0gpqpMKSAlDXknQIvQrSTNUa9nHuPPblR7CqC2GaR3OZH+sn86gUb/8M1R25GaRHsMudkfw6vjBgdocIeeX3RXdJ7MZsAD1A5brquHBKimYnBhEYcqRNufjWGdm1FSCUKX0Vdd5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328858; c=relaxed/simple;
	bh=hRhyAMZZhHmbiSXeB0Zy10LSXCSR8S/nk96UJtietZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW58VsC+TVEZCQsrHlUhsrhKIkNBg++Cg2mmV3S7FQbIbWfkBgT7q3BV8fygOtDwsU38wZKTjdEd/BjEHhrHoDjDEPFC8rfSHnEvF8roWswXTgMQgQw2jhsS3L41xNKGVySSM3Gb7oJ2Z3L1U12Hxq0poi/2NkdWsdIDN7XYC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3tUlYm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7345DC4CEF7;
	Thu, 12 Mar 2026 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773328858;
	bh=hRhyAMZZhHmbiSXeB0Zy10LSXCSR8S/nk96UJtietZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3tUlYm7stzIaYNt1C/QkG28A+r5gzhWxXI5WupEArzBAbQ0rH3LGhFoK4W5YDLYT
	 lm26ZnvIJqEp/l29LFcfkgdOqruX/TEpTZ0Zv9nOuW2S1lwnPQBvmVP+z3hi+P2+kH
	 83J5Fd1HvpuGavQnMORmKq8l2ngTnR5Vz9PrTMHqhah9stBg7vH5977zyZccD0wHp/
	 Im81j0Kx7iWRkIgclb1r4vw+6VFm6nM8P0d0hq6+6pojWTL9foGPtAvJvQpXlanOmx
	 KFSU/3pZ72cyzmwQ2XBGnNbKGuGxf8RpF/6cICWr+SsfYVwDaVefr7oWUdHrO5gq3o
	 S9Fe6orOmpIrQ==
Date: Thu, 12 Mar 2026 10:20:57 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: pinctrl: pinctrl-max77620: convert
 to DT schema
Message-ID: <20260312152057.GA3156966-robh@kernel.org>
References: <20260312085258.11431-1-clamor95@gmail.com>
 <20260312085258.11431-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312085258.11431-3-clamor95@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33258-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,3c:email,devicetree.org:url]
X-Rspamd-Queue-Id: AE5BA2744E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:52:55AM +0200, Svyatoslav Ryhel wrote:
> Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
>  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
>  2 files changed, 97 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
> new file mode 100644
> index 000000000000..4e5f997317ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinmux controller function for Maxim MAX77620 Power management IC
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  Device has 8 GPIO pins which can be configured as GPIO as well as the
> +  special IO functions.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> +  - $ref: /schemas/pinctrl/pinmux-node.yaml

Don't these properties apply to the child nodes?

> +
> +patternProperties:
> +  "^(pin|gpio).":
> +    type: object

       additionalProperties: false

Or unevaluatedProperties with the $refs moved here.

> +
> +    properties:
> +      pins:
> +        items:
> +          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
> +
> +      function:
> +        items:
> +          enum: [ gpio, lpm-control-in, fps-out, 32k-out1, sd0-dvs-in, sd1-dvs-in,
> +                  reference-out ]
> +
> +      drive-push-pull: true
> +      drive-open-drain: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +      maxim,active-fps-source:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          FPS source for the GPIOs to get enabled/disabled when system is in
> +          active state. Valid values are:
> +          - MAX77620_FPS_SRC_0: FPS source is FPS0.
> +          - MAX77620_FPS_SRC_1: FPS source is FPS1
> +          - MAX77620_FPS_SRC_2: FPS source is FPS2
> +          - MAX77620_FPS_SRC_NONE: GPIO is not controlled by FPS events and
> +                                   it gets enabled/disabled by register access.
> +          Absence of this property will leave the FPS configuration register
> +          for that GPIO to default configuration.
> +
> +      maxim,active-fps-power-up-slot:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sequencing event slot number on which the GPIO get enabled when
> +          master FPS input event set to HIGH. This is applicable if FPS source
> +          is selected as FPS0, FPS1 or FPS2.
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +      maxim,active-fps-power-down-slot:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sequencing event slot number on which the GPIO get disabled when
> +          master FPS input event set to LOW. This is applicable if FPS source
> +          is selected as FPS0, FPS1 or FPS2.
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +      maxim,suspend-fps-source:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          This is same as property "maxim,active-fps-source" but value get
> +          configured when system enters in to suspend state.
> +
> +      maxim,suspend-fps-power-up-slot:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          This is same as property "maxim,active-fps-power-up-slot" but this
> +          value get configured into FPS configuration register when system
> +          enters into suspend. This is applicable if suspend state FPS source
> +          is selected as FPS0, FPS1 or FPS2.
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +      maxim,suspend-fps-power-down-slot:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          This is same as property "maxim,active-fps-power-down-slot" but this
> +          value get configured into FPS configuration register when system
> +          enters into suspend. This is applicable if suspend state FPS source
> +          is selected as FPS0, FPS1 or FPS2.
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +    required:
> +      - pins
> +
> +additionalProperties: false
> +
> +# see maxim,max77620.yaml for an example
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> deleted file mode 100644
> index 28fbca180068..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -Pincontrol driver for MAX77620 Power management IC from Maxim Semiconductor.
> -
> -Device has 8 GPIO pins which can be configured as GPIO as well as the
> -special IO functions.
> -
> -Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
> -for details of the common pinctrl bindings used by client devices,
> -including the meaning of the phrase "pin configuration node".
> -
> -Optional Pinmux properties:
> ---------------------------
> -Following properties are required if default setting of pins are required
> -at boot.
> -- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
> -- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
> -		<pinctrl-bindings.txt>.
> -
> -The pin configurations are defined as child of the pinctrl states node. Each
> -sub-node have following properties:
> -
> -Required properties:
> -------------------
> -- pins: List of pins. Valid values of pins properties are:
> -		      gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7.
> -
> -Optional properties:
> --------------------
> -Following are optional properties defined as pinmux DT binding document
> -<pinctrl-bindings.txt>. Absence of properties will leave the configuration
> -on default.
> -	function,
> -	drive-push-pull,
> -	drive-open-drain,
> -	bias-pull-up,
> -	bias-pull-down.
> -
> -Valid values for function properties are:
> -	gpio, lpm-control-in, fps-out, 32k-out, sd0-dvs-in, sd1-dvs-in,
> -	reference-out
> -
> -There are also customised properties for the GPIO1, GPIO2 and GPIO3. These
> -customised properties are required to configure FPS configuration parameters
> -of these GPIOs. Please refer <devicetree/bindings/mfd/max77620.txt> for more
> -detail of Flexible Power Sequence (FPS).
> -
> -- maxim,active-fps-source:		FPS source for the GPIOs to get
> -					enabled/disabled when system is in
> -					active state.  Valid values are:
> -					- MAX77620_FPS_SRC_0,
> -						FPS source is FPS0.
> -					- MAX77620_FPS_SRC_1,
> -						FPS source is FPS1
> -					- MAX77620_FPS_SRC_2 and
> -						FPS source is FPS2
> -					- MAX77620_FPS_SRC_NONE.
> -						GPIO is not controlled
> -						by FPS events and it gets
> -						enabled/disabled by register
> -						access.
> -					Absence of this property will leave
> -					the FPS configuration register for that
> -					GPIO to default configuration.
> -
> -- maxim,active-fps-power-up-slot:	Sequencing event slot number on which
> -					the GPIO get enabled when
> -					master FPS input event set to HIGH.
> -					Valid values are 0 to 7.
> -					This is applicable if FPS source is
> -					selected as FPS0, FPS1 or FPS2.
> -
> -- maxim,active-fps-power-down-slot:	Sequencing event slot number on which
> -					the GPIO get disabled when master
> -					FPS input event set to LOW.
> -					Valid values are 0 to 7.
> -					This is applicable if FPS source is
> -					selected as FPS0, FPS1 or FPS2.
> -
> -- maxim,suspend-fps-source:		This is same as property
> -					"maxim,active-fps-source" but value
> -					get configured when system enters in
> -					to suspend state.
> -
> -- maxim,suspend-fps-power-up-slot:	This is same as property
> -					"maxim,active-fps-power-up-slot" but
> -					this value get configured into FPS
> -					configuration register when system
> -					enters into suspend.
> -					This is applicable if suspend state
> -					FPS source is selected as FPS0, FPS1 or
> -
> -- maxim,suspend-fps-power-down-slot:	This is same as property
> -					"maxim,active-fps-power-down-slot" but
> -					this value get configured into FPS
> -					configuration register when system
> -					enters into suspend.
> -					This is applicable if suspend state
> -					FPS source is selected as FPS0, FPS1 or
> -					FPS2.
> -
> -Example:
> ---------
> -#include <dt-bindings/mfd/max77620.h>
> -...
> -max77620@3c {
> -
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&spmic_default>;
> -
> -	spmic_default: pinmux@0 {
> -		pin_gpio0 {
> -			pins = "gpio0";
> -			function = "gpio";
> -		};
> -
> -		pin_gpio1 {
> -			pins = "gpio1";
> -			function = "fps-out";
> -			maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
> -		};
> -
> -		pin_gpio2 {
> -			pins = "gpio2";
> -			function = "fps-out";
> -			maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
> -		};
> -	};
> -};
> -- 
> 2.51.0
> 

