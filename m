Return-Path: <linux-gpio+bounces-30801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFT8MLtAcGnXXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:58:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69919501EC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2176544B482
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C2426EA7;
	Tue, 20 Jan 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHyqsg7S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257A6426D20;
	Tue, 20 Jan 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912070; cv=none; b=DRPTdey8A2RzmfNVj5TcZbD4sof1UjDrrDVWBscmQb6w2WqXCf1IUa0kobYb3KZD9cAKXt7nryWD6WktAo8rUH68OJR6FleKx6st+7bIGsG1zRCxxcHEHXXBkhpmeeC0YdgHuaEGXBSjtdeGrEkRXSgbgFlKaalYy3cNRElqcPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912070; c=relaxed/simple;
	bh=OBQa66E8qIIZZ+a5/f/YUB/uMB9Oa+5RXnBGA2tH1VA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s6xSfG9RlvjBPHn8UaWERSG5d5xu7EJWgMBhH/X913VdFrN+ssv4LjUgqAHFbb3Bdd8VtYixedlOhPGLG9DDEIDsLuB4UfKuL1rh9gb5WOFGc7oTKym/lglfLSsgcxrfQTZsH5w6J5i4Ah5844VUOS9NkddSszZn2Y6C6SV/e8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHyqsg7S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855DC16AAE;
	Tue, 20 Jan 2026 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912069;
	bh=OBQa66E8qIIZZ+a5/f/YUB/uMB9Oa+5RXnBGA2tH1VA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hHyqsg7SLKU6D/+NrFAwaN3MhGr5XHbaGDgQQaIQvl+t/iY5qBmfoYu4l8P1Lcgm2
	 oqJ3zQmgw1zYfVFAqf8RWA870XZkWL9FQDro7p9evW2z0tw4c4/sBvgKaSQtE4S5hn
	 CdQsPuEKhcpai1OKgQmiT+5ZVmFPe9frZIGN4ZfeuxtJ7DNvwhniQ85cZa9PK0IB8T
	 LRTiByz0h8vDb+LxO4ccWKXYiOI8JKsTMY1lsJ9exLUtk9yiLYW4Mi8tjUvTgSQUVa
	 U4O5JcFDH62U61e3HJyoNXKzJhwJ7VTiD1wcAU6iW1MKXr8WJHEzxlNP0uS3iWfgpB
	 YOcSVoJ6njokA==
Date: Tue, 20 Jan 2026 06:27:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bmc-sw@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
Message-Id: <176891206887.1610236.16662937885214497301.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-30801-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.1.144:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 69919501EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 19:43:06 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in ASPEED AST27xx SoCs.
> 
> The AST2700 SoC consists of two interconnected SoC instances, each
> with its own pin controller register block managed by a separate
> System Control Unit (SCU).
> 
> Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
> describe the SoC0 pin controller, which is not compatible with
> existing ASPEED pinctrl bindings.
> 
> The SoC1 pin controller follows a regular and predictable register
> layout and can be described using an existing generic pinctrl
> binding, therefore no dedicated AST2700-specific compatible string
> is introduced for it.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
>  2 files changed, 157 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'pins' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'drive-strength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'pins' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'drive-strength' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dts:63.13-50: Warning (ranges_format): /example-1/syscon@12c02000:ranges: "ranges" property has invalid length (16 bytes) (parent #address-cells == 1, child #address-cells == 1, #size-cells == 1)
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): reg: [[0, 314580992], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): 'reg' does not match any of the regexes: '-state$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): emmcclk-driving-state: 'drive-strength', 'pins' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


