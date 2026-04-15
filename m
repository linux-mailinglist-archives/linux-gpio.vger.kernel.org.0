Return-Path: <linux-gpio+bounces-35177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHBBMGcS4GllcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 00:34:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85574408B65
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 00:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9AEA30BA5F5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 22:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0186E3914FE;
	Wed, 15 Apr 2026 22:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJ5VWjvM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCF38F22F;
	Wed, 15 Apr 2026 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776292315; cv=none; b=JONw7Bu2BBNE9dB4KWRsOc0MUm7mkHlgdKRWLpXQ6p2IOmoaDh//HIU4+LhgxkGquChV4gzOYBoN90AIvdpX/uAn2Ahj9im5vn55C3RcVqY1AxbxRO6zY6xJR7jGf9bwxbNhhkipufAn9uzBdOfTTPBsGIlImAwy2HZX85cZncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776292315; c=relaxed/simple;
	bh=WPuIjMAw2ocla7dY4PH5AfZDm54Cudg1cBk8x+T2SWo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qFuiBcIxaLl9N6YtpjUt8IIAL/ipy4jajKiO6BZ6B7Ixav3QJldnvrw7iVbfGO+25sROsp3qpaTD0X3bGuV4dq59ISjIh/1mDFtq2NNTecwl9cxWtRY3IXu/qxR+O9WVI3cQYjtR/dDGpS7qxr0Lgc4A0DYoss67FCX0DYHVc2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJ5VWjvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B73C19424;
	Wed, 15 Apr 2026 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776292315;
	bh=WPuIjMAw2ocla7dY4PH5AfZDm54Cudg1cBk8x+T2SWo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uJ5VWjvMoT3HFcDUCZIjlcya34Wb+vN/KoNeCdTsmgE0YpuNfEF7a8tR5VJUYNKtD
	 ZLMiZJ3TRHtJiiWzSLEgNT8KNDwHCFE8yyBFY30yBgTT+deMu0BopFqUETadRqZN+v
	 d7kEb26guP4aMc8y4lA/wJprSezQyaf+103VrbqK7aP0ycrmy95ktZxaJ9/QGlOkH8
	 YiZ5gjfKqHOcVGyl0SPffjtIJ3nhiQxDcVDvm0dXD+Vk3zdjQfbWCrIBQieSMd7oTk
	 uqpvT/oqyEP1VeNp+Idtogxc3N4Fut0riuoME02qVOR1t5eoo1K9tOjjRiv5Mzir3a
	 hnzfJ9FhivtTA==
Date: Wed, 15 Apr 2026 17:31:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Lee Jones <lee@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
 <20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com>
Message-Id: <177629231119.934339.16424036449507234934.robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
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
	TAGGED_FROM(0.00)[bounces-35177-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,aspeedtech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85574408B65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 14 Apr 2026 17:39:00 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
> 
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


