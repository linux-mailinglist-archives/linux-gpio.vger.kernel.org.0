Return-Path: <linux-gpio+bounces-33712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAOWDVxYumnFUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:46:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04A2B727A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D10830C4525
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 07:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F7A36BCCE;
	Wed, 18 Mar 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnHmL2+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86676285404;
	Wed, 18 Mar 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819822; cv=none; b=WmcgR1mjMcp9Q6qewS+PsQrO9RKh1CWAf4D6WivQVoxA4+lN2OlkTDdZ+hbFrJdxbQwypIvDy8Abz7k2SPW2Df4XtczB37maleuhSqkeIDZR5Uyj0TkARf0F2LgmHT4HpAbp2BX5JufvW1izFtS/qIt+uobaqH/1hiR8jmBQpAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819822; c=relaxed/simple;
	bh=2w61jaemanYniJ5z43sVFgfleNvmAQFtWVHoLfwtBgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcTHzd01XLRunTKimfQT+pj5ssLYAJ9XYKD3X7SLzx3bDi7ueGVLtYF5+71mt1DyYpmdp9NvLkQxnVmEqt4lP2fj8ODz306UygOOOL90cFu9YIjlfOdn6Ug8k5pFaSQuD3I9IXtXDlsYYoyWOhP1x2iJ42dX6BGV2B7sYdGPuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnHmL2+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71D5C2BC87;
	Wed, 18 Mar 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819822;
	bh=2w61jaemanYniJ5z43sVFgfleNvmAQFtWVHoLfwtBgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnHmL2+6oyLJywU4niLtDhchR53TnJcvi3YhDU7lA0wL9x86VDE1MzyyWABBenWxp
	 1jBnli8V4Bgr2uXnhvTK/ANhpWoR8xTLBFXUkHB7p2DY0chrQvnAf3UzDOpWuMMRhx
	 +IY90Ivlc3gw0WDk2QMrXDsy3db7gptKD7bJaz9Pu16ojbthflSulT9MzaQs/Yd2cq
	 Xbv2w4AWHBsejf/xScBKqW5NGPIetQPsKSvtH6Ep3PPJtzI0yVmgHYQHzWMmf2BwYv
	 ogeY8pM5ZVIW2W031GkxeKh8o0Q3/ffiKY6j5ZiKqFHxz5UmsRwqjGdOlCcFvZoRvI
	 JnZ3rSneZdTTg==
Date: Wed, 18 Mar 2026 08:43:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
Message-ID: <20260318-nickel-serval-of-tolerance-621bad@quoll>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-4-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33712-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB04A2B727A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 06:43:06PM +0000, Luca Leonardo Scorcia wrote:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

You already received this feedback from Mark.

> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  All voltage regulators provided by the PMIC are described as sub-nodes of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator

Drop compatible. Regulator nodes do not have compatibles. With this, you
can also drop example as it won't be used.

> +
> +patternProperties:
> +  "^(buck_)?v(core|proc|sys)$":

Nope, underscores are not allowed. Use only hyphens.

> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> +    description: LDOs with fixed 1.8V output

If fixed, then encode it in the schema - min/max microvolt.

> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false

Best regards,
Krzysztof


