Return-Path: <linux-gpio+bounces-34364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAqvLDz/yGn1tAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 12:30:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB235190F
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 12:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBB6B30059B4
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 10:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3C730F934;
	Sun, 29 Mar 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlkGVG50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41122FBE1F;
	Sun, 29 Mar 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780216; cv=none; b=u02x0W0OocaUa0vHtop51VZRXUgr2i6b0zCLdoX+RAzZraMTe+Eofmpta//vmWn+vGW3J4hBp658l27C9MiAQq3ShfFY9ulHKjpsH/dkHCmjT+KlM9BjGfbfnnnY5nh09Z+wuPopPLSecnV3qxQHqvLpmOXpI5L6iT/OOmer3sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780216; c=relaxed/simple;
	bh=/fukVW96SgGw6bB09c6/3nFhEVSaAYJbKOiTe7DJXgw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KZfR3Zp7wOCcFmwCQ71vmtBa/nniWK83cXfrBz2xc0V7V61opFN6uVnV9MAbG7nnuGBYhcaR8EZ5deXNOUZFlhCNRyAZimksVOWeOWPCtnfckc70m8Fo1F0KMPMSNi6u19fsIss9mN6BsA/JcAOMjYkUJKiJxNNwtOoevqhogjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlkGVG50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A88C116C6;
	Sun, 29 Mar 2026 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774780215;
	bh=/fukVW96SgGw6bB09c6/3nFhEVSaAYJbKOiTe7DJXgw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KlkGVG50EAYk9yzfHOFYAn0207s5l9jVbpYwR0JCvVJ6aS+64TDfhU26aQrJQNO4P
	 Bo8i3HWavK4Xdv1l28ZVESm4JOz7SIuiNSCL2B0hDzZ4GZZC66Wbk9nlgbkVfakkKl
	 Zr7rd3QTw7CiiZbFLHWLY3n8dzlFrzsthzbXj4EnGlSpKkXfY0lUIjHjiGdBf9ztxI
	 F4Dkvba0SMp2UsLN3o6T0wIkE/TwDZgzTcZ84tQh7MrA07CAA3gS95K56bQ6HTa2Eq
	 nH0/Vl9UyTPN42aUk3ks5YrxQUQjJEovP/TPJelqvP3dRvrnBfJ7vuFagTiNfwvc6K
	 NW1kZcMncnAfg==
Date: Sun, 29 Mar 2026 05:30:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Lee Jones <lee@kernel.org>, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Peter Rosin <peda@axentia.se>, Conor Dooley <conor+dt@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20260329090601.532477-2-o.rempel@pengutronix.de>
References: <20260329090601.532477-1-o.rempel@pengutronix.de>
 <20260329090601.532477-2-o.rempel@pengutronix.de>
Message-Id: <177478021183.3290857.2184125740020596802.robh@kernel.org>
Subject: Re: [PATCH v8 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34364-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CAB235190F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 29 Mar 2026 11:05:56 +0200, Oleksij Rempel wrote:
> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
> 
> The MC33978 and MC34978 differ primarily in their operating temperature
> ranges. While not software-detectable, providing specific compatible
> strings allows the hwmon subsystem to correctly interpret thermal
> thresholds and hardware faults.
> 
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
> 
> The device interfaces via SPI. While it provides multiple functions, its
> primary hardware purpose is pin/switch control. To accurately represent
> the hardware as a single physical integrated circuit without unnecessary
> DT overhead, all functions are flattened into a single pinctrl node:
> - pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
>   and managing their pin configurations.
> - hwmon: Exposing critical hardware faults (OT, OV, UV) and static
>   voltage/temperature thresholds.
> - mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
>   internal temperature, or battery voltage to an external SoC ADC.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> changes v8:
> - Update IRQ_TYPE_* macros include path reference in documentation from
>   interrupt-controller.h to dt-bindings/interrupt-controller/irq.h.
> - Add bias-disable, drive-open-drain, drive-open-source, and drive-strength
>   to the list of supported pin configuration properties.
> changes v7:
> - no changes
> changes v6:
> - add Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> - add Reviewed-by: Linus Walleij <linusw@kernel.org>
> changes v5:
> - Commit Message: Added justification for distinct compatible strings
>   based on temperature ranges.
> - Restricted pins property to an explicit enum of valid hardware pins
> changes v4:
> - Drop the standalone mfd/nxp,mc33978.yaml schema entirely.
> - Move the unified device binding to bindings/pinctrl/nxp,mc33978.yaml,
> - Remove the dedicated child node compatible strings (nxp,mc33978-pinctrl).
> - Flatten the pinctrl/gpio properties directly into the main SPI device
>   node.
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
>  .../bindings/pinctrl/nxp,mc33978.yaml         | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260329090601.532477-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


