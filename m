Return-Path: <linux-gpio+bounces-35927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPgTAX1c82lfzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:43:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C884A3A13
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97B76301327F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1C5428467;
	Thu, 30 Apr 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qep3HF6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2964266BC;
	Thu, 30 Apr 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556503; cv=none; b=GU7dH3x1ze99mseTQ0riJbBcFWipXonrAAvaaXj0sarQQW3zUap/2mFcKJqtDufLxM/wERFrLCc7xF6bgXckRVCL3tFqTq9b4BtO3sNDtvIPemA2L2YKq+I0LFMUnVulCGvtfvw0YmCHq3U322HdvNGN34gz9sFR9I+u3LwyoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556503; c=relaxed/simple;
	bh=qo0NVFUmB45SVo0XMWqHC4qOMxTWR++i0ZQMSOzxZkE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=D8qbDp7o0wyYfYKvc8E+s9TT6Ap/6l8b98cf+dHrVLqMGjs3hdIGiygzaRIFWD3/YXJYRp0fm+hM0CK8Ook8K11cWWX1ZEhcygByOodShIaE+Bw0MfqmRoPipQwURO7NUuJsA8Ra4rGnUnWkVjZEjQEUB2M2DKn4eg5p1eVZHt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qep3HF6J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF17C2BCB3;
	Thu, 30 Apr 2026 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777556503;
	bh=qo0NVFUmB45SVo0XMWqHC4qOMxTWR++i0ZQMSOzxZkE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qep3HF6J7LU9utiSV6oY7tghewHVRkU6ejIBxqhGqkcMONqXqpem5RPYWLTDmKFBw
	 WgyTxRXQv2jFoP5jbRZ+PrYO/TM+cWVnz/Go+Zf5LGx0LkaVJKdgEjj3ty3Ny3D5m0
	 SgXndJWbzinHtk02ey/XuQXoTNG83/vB5PGOIlbYGIeXd4z+wjZo4dgvNjWjK05rdm
	 w8y7Fbs1ro1ke2y87ZMz7jLvbHiaysrbJkpbLJslDyglv5Rng6UkMmvOkvh2KGo1kC
	 rE6/KvLoyBHXuUrFqohF4dDZKPwt2E+DF+sKVueXBffIJqH55VRgedDsXwTOeFoB7U
	 NcSUXWveZiATA==
Date: Thu, 30 Apr 2026 08:41:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linusw@kernel.org, gregkh@linuxfoundation.org, 
 linux-i3c@lists.infradead.org, brgl@kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, alexandre.belloni@bootlin.com, 
 linux-gpio@vger.kernel.org, Frank.Li@nxp.com, krzk+dt@kernel.org
To: zain_zhou@realsil.com.cn
In-Reply-To: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
Message-Id: <177755650101.425569.4344368132239630879.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
X-Rspamd-Queue-Id: 96C884A3A13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35927-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Thu, 30 Apr 2026 20:13:53 +0800, zain_zhou@realsil.com.cn wrote:
> From: zain_zhou <zain_zhou@realsil.com.cn>
> 
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.
> 
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
> 
> Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: ignoring, error in schema: patternProperties: @[0-9]$: properties: polling-interval-ms: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'uint32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'uint32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency: 'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'anyOf' conditional failed, one must be fixed:
	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'uint32' is not of type 'array'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'anyOf' conditional failed, one must be fixed:
	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'uint32' is not of type 'array'
Lexical error: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dts:50.34-55 Unexpected 'I2C_OWN_SLAVE_ADDRESS'
Lexical error: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dts:114.34-55 Unexpected 'I2C_OWN_SLAVE_ADDRESS'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1637: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260430121354.6253-1-zain_zhou@realsil.com.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


