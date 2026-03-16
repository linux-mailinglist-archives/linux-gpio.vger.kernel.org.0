Return-Path: <linux-gpio+bounces-33573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAG1KJQruGnhZgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:11:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDE29D1A9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2559C3007C95
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7B8330651;
	Mon, 16 Mar 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl5mcm4P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FE324B1E;
	Mon, 16 Mar 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677302; cv=none; b=fpKVmGOpuvYwMez7FcgGEddPRHGegpnsqkoseJvEMB5pg8XJIkL2dBV4fK8jqBairZJwvWAGAtb26lwa4YywSHwNP1Kj09a3kPkArFj4Zj1ahNMaLN5ZV8UA5uj1P94H2Rxrn1H2mWjLWbj70wAhdGtENYUccT71mbR9L795ekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677302; c=relaxed/simple;
	bh=zheSOjWZVX0jJy+pjuzYRXGN8X8Rm5D2EoxmK7k4oks=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nnWB/4eVbQRoyFKUvzQtImpK/XLhiPVc2MN3gHNhTGOeHlbqzuhRx0x/GPmF4wficg6Nb6+2SJEIfrLJ+iRXYeg5shsloSKChVbsG+BZfY8ms0dCWVJ29K1y6cUyXHNMry+gYISiRe/Yoys7e3J49Ux2C5hMN/jvpzpIHqsuoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl5mcm4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E154C19421;
	Mon, 16 Mar 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773677301;
	bh=zheSOjWZVX0jJy+pjuzYRXGN8X8Rm5D2EoxmK7k4oks=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Sl5mcm4P8hJ1OluY+arkRsUP9K3UqR8NoBbLxPwPmqGefGsulo8YAEha5DTJN0Soi
	 PzryUlubnQPpZH2SSuwzBpEnGDPtzVGPMpp4kw44O+9kO7FWLr2rmYPidQi+RKaVbV
	 QbbPYDdREZH7Vfj0+R4/ABF7uyLBX36FQ2SMfv27z6H8sh42KIyefLLm4sbRQxQ40x
	 LUpunQj7+JUpC81KsHZg62rrgrSqcMyr3sbGyEd3BFk2OM2V80cExZ72lsSQavnamt
	 FTOJU+fZrAK+R41/qVBnpU4b4t7DyZ6CvEd0u97CsdjYuibowtHqtAJjP8VRLGdgXW
	 x72QRov6czrSA==
Date: Mon, 16 Mar 2026 11:08:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20260316140514.1406588-2-o.rempel@pengutronix.de>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
 <20260316140514.1406588-2-o.rempel@pengutronix.de>
Message-Id: <177367730051.1660620.4239200064941367815.robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: pinctrl: add NXP MC33978/MC34978
 MSDI
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33573-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 46BDE29D1A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 15:05:06 +0100, Oleksij Rempel wrote:
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
> ---
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

See https://patchwork.kernel.org/project/devicetree/patch/20260316140514.1406588-2-o.rempel@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


