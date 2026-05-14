Return-Path: <linux-gpio+bounces-36850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIWmLk/MBWocbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:21:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E280542422
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F94730901EE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431683E120D;
	Thu, 14 May 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th+TJHNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F33E1238;
	Thu, 14 May 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764658; cv=none; b=hjLtkGgo0lTPz9v1yrB+fFXHGnVaiqjyPzB0sja7uarUDjD+KWpNZn78hSLJkfLdDD6zNH/3RQspYF5ydpKvssD1fPIv5Qoc7y5SJOs5TacGvVNIu0djESq/kwiZX3TFsseeUtUV/ozoWepKAl3AHzHtHuhh2uOLmPXu8Mbue7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764658; c=relaxed/simple;
	bh=OC8z690m0OzKSQjT1K52LTD9GBysSPVj4NfaluAtEFs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gYcIrR1i2GVqJ52huoGxKBISlOvV4aJMEa0uFPsQ3wE58sbC/5vHhlY00VQuLF/4wl3o75tchSmKdg/snxLLPw6IGzUY1vE/r+GGP0yD7Xvpm2nCgntyMg29PYFbwGgCFidlN1HiW5SaRTrRkTBKCv4Z8DxmIrxQMnpbJbd2apA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th+TJHNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF224C2BCC7;
	Thu, 14 May 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764658;
	bh=OC8z690m0OzKSQjT1K52LTD9GBysSPVj4NfaluAtEFs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Th+TJHNVAUNAdpxHQUsef2I8qODWyMO+DgFOvJYbyrlSOb6SqGL5FSjGFI56oHZ0X
	 xUsQeLLQH1horXT7v/pQk+Upo/DfwaDQGsf7kyLzkWMNqJnfwTh/WkdNBHulf5GTMH
	 BwzyslXMTloQNe6HSCJvW1Jhz++D5Bkt49USNAU1a4VHkc9U1Iq/ytWT8KsVGBzN1x
	 dMU+L74LQAeBR2UoCjaN0SuG2XdziUlL7VsqusEukeJKv1fccYytkoS7aRSAyxLTwQ
	 oe3Vne4FSau45b4qk8hpr7e4da403vgZoCxcMYPqu42e1qOU8jg+VjfRzUluRHd0FQ
	 Ym5a5MJmfUO4Q==
Date: Thu, 14 May 2026 08:17:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Paul Walmsley <pjw@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-11-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-11-changhuang.liang@starfivetech.com>
Message-Id: <177876464483.126011.3347880775140957613.robh@kernel.org>
Subject: Re: [PATCH v2 10/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
X-Rspamd-Queue-Id: 2E280542422
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36850-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 14 May 2026 04:12:06 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
> controller.
> 
> System-2 domain also supports configuring the pin group voltage.
> Add relevant definitions for power-source configuration.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 173 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  44 +++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/toshiba,tc9563.example.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[4294967295, 119]] is too short
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.example.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [2, 3, 4] is too long
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: dwc3@2680000 (ti,keystone-dwc3): usb@2690000:usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: dwc3@2680000 (ti,keystone-dwc3): usb@2690000: Unevaluated properties are not allowed ('usb-phy' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: usb@2690000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: usb@2690000 (snps,dwc3): Unevaluated properties are not allowed ('usb-phy' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.example.dtb: usb@4a030000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.example.dtb: usb@4a030000 (snps,dwc3): Unevaluated properties are not allowed ('snps,incr-burst-type-adjustment', 'usb-phy' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-drd.example.dtb: usb@4a030000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-drd.example.dtb: usb@4a030000 (snps,dwc3): Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'maximum-speed', 'otg-rev', 'phy_type', 'usb-phy' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-11-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


