Return-Path: <linux-gpio+bounces-34292-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMSpJhvBxmm8OQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34292-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:40:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D294348846
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95F7A308A996
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ADA3FA5D9;
	Fri, 27 Mar 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXqMC3UW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8812B93;
	Fri, 27 Mar 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633011; cv=none; b=LtbC1bza29DfhxtdE6udEkKQpddJfJBJ7dav2Umj18LB5VkxoVkkMOY+wvba6dqxhBrl5+34q4Y8EA35DGlA9NuS0fZFZco8WTFI4nEozWnuGhrc/Na7C+YXh+3uqAd72oWb4tYtWOMwtF1oZoVnGro/eNHPCdLAulsKEslmwr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633011; c=relaxed/simple;
	bh=2KlpC23LTJyzB+XkxPq8TL8jB24h5cr/ErMHlwbdgEE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=c4bVATXgQmNrGTNwh1vT2KPwBxfkvMXu7kGBfea6A5eRcvIVkpX8M8JX9NJTTc3GbjfAFD69LAsAHS+vKTDdkZgrIw/GlXSfIkybxPHSZ1KzvmFbd9jqogTgqgDV8fTzLATIJ0WY/krMY+1jfwlvGROFWJfTjzQYk6m8r6iRKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXqMC3UW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D0BC19423;
	Fri, 27 Mar 2026 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774633011;
	bh=2KlpC23LTJyzB+XkxPq8TL8jB24h5cr/ErMHlwbdgEE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CXqMC3UWtK/Q0ep9Im9IOVfyWx/vlYuQUIxtHlLIKCKRwMH7djVQSByiGJMfgD181
	 ynonBTDy27rdvpvp4Yd9WCP9JlBWc7tfASTOnbYTKmkxMN5cf2YdIyEUkNcouZZwCo
	 3x4umLkOOFtw42GJupQ/28LkSXs4NS2cTviqNKY9BUOhxEVMeaE23Z/baRavduuqRL
	 f4ZX9rjsnrInzNKNFmhMYytykxdSEBx1nnKx04Cf7kmLt5uhd6+HCrUb+nDVGDDZ9u
	 wlpeIxXKnJ8W+szi+Nc6Pcm7ftZDLrL0Am/Un27rVJeq0HE7R0UOZwkh/SuKbLCDbg
	 0TAzgvief/SNg==
Date: Fri, 27 Mar 2026 12:36:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@pengutronix.de, linux-hwmon@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20260327163450.3287313-2-o.rempel@pengutronix.de>
References: <20260327163450.3287313-1-o.rempel@pengutronix.de>
 <20260327163450.3287313-2-o.rempel@pengutronix.de>
Message-Id: <177463300748.3194399.12519013668004693488.robh@kernel.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34292-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email]
X-Rspamd-Queue-Id: 0D294348846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 17:34:45 +0100, Oleksij Rempel wrote:
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
>  .../bindings/pinctrl/nxp,mc33978.yaml         | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260327163450.3287313-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


