Return-Path: <linux-gpio+bounces-23789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4BB1090E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 13:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98FFAE69B8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6B127F005;
	Thu, 24 Jul 2025 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtcIHEg+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E69277C9E;
	Thu, 24 Jul 2025 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355975; cv=none; b=iiQsajiZJ8+OX/v8E9et1SwObRQ8IsvUC8QcWotyadFT1Ch2IWbdaDmv+aiUt+EdOoO/XStaq9lnNoQixB6+FHp4I/QifV7q9s4GP08kSmH6tVi+9q2Cw9O9H5UNI2abU9gIp+ecoN92XEdPuTR0R1g6y9Xo6oXvO+BH/R3ZR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355975; c=relaxed/simple;
	bh=xr9UfPrtsc/ykSfE3EhQN0BAiqLo6Aci+RNDYoh3hig=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=o+grxBAc9bXpzI0VDXjayK2ICY0AuSJskmhHUVy7zxyVdPZ5cSZXVO6G8mwTc2oDooV4PoZiUdAo+kCHuUKxGsMK+7zBUISDZ6ril3M3aMgHpH18bQ5xIJLowpoKIv7Dq2V8RcOjuUsZB20/MN+f3w7080VsJ1tmiYdav10OX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtcIHEg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBABC4AF0B;
	Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355974;
	bh=xr9UfPrtsc/ykSfE3EhQN0BAiqLo6Aci+RNDYoh3hig=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gtcIHEg+ph2IJp1WJwEVEk3R4hb7SfpYBo9kg5zwfeF9fN/WnQ/3g4N5KdsEraUxJ
	 a4kPxnUb6bid5gAmKGKCF0eNsTLWvajd+kYVB4502wn7qiMsf11sjF4R9lpE6mCSR+
	 P67vfBvqBl1xbYZsCu2vX1bxZGrZ52K4QMWbuo9F9vjdiw2jK+i6++M5BfJ5MP73Hc
	 6kOllnuqTh9sjsC7d3K1OIsNLehSe8QcLzIASlA5D65JUPFShxhMhZJ0esq5Y2XylZ
	 Kw+y5W5Hc6gxWxuEybtqyQNpcVHYHK+xTxB5pnUfeY2DDLHt8hF0/MdFi4v5IQxVVo
	 BR6VL794/V8cg==
Date: Thu, 24 Jul 2025 06:19:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org, 
 olivia.wen@mediatek.com, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, andy.teng@mediatek.com, 
 eugen.hristev@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, frank-w@public-files.de, 
 linux-phy@lists.infradead.org, mripard@kernel.org, atenart@kernel.org, 
 sean.wang@kernel.org, ck.hu@mediatek.com, fparent@baylibre.com, 
 granquet@baylibre.com, p.zabel@pengutronix.de, simona@ffwll.ch, 
 tglx@linutronix.de, dri-devel@lists.freedesktop.org, 
 linux-gpio@vger.kernel.org, chunkuang.hu@kernel.org, 
 linux-crypto@vger.kernel.org, vkoul@kernel.org, 
 maarten.lankhorst@linux.intel.com, andersson@kernel.org, 
 linux-arm-kernel@lists.infradead.org, shane.chien@mediatek.com, 
 davem@davemloft.net, herbert@gondor.apana.org.au, broonie@kernel.org, 
 houlong.wei@mediatek.com, mathieu.poirier@linaro.org, 
 linus.walleij@linaro.org, conor+dt@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, daniel.lezcano@linaro.org, 
 mchehab@kernel.org, tzimmermann@suse.de, chunfeng.yun@mediatek.com, 
 mwalle@kernel.org, jiaxin.yu@mediatek.com, airlied@gmail.com, 
 jassisinghbrar@gmail.com, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 kishon@kernel.org, arnd@arndb.de, linux-media@vger.kernel.org, 
 jieyy.yang@mediatek.com, lgirdwood@gmail.com, sam.shih@mediatek.com, 
 jitao.shi@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597061.1587930.6517956701582557579.robh@kernel.org>
Subject: Re: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm
 MMIO from MT8188 dual


On Thu, 24 Jul 2025 10:38:49 +0200, AngeloGioacchino Del Regno wrote:
> Even though the MT8188 SoC's Dual-Core SCP IP is practically the
> same as the one found on MT8195, it doesn't have a dedicated L1
> TCM and relies only on SRAM.
> 
> Set reg/reg-names minItems to 1 globally and override it in all of
> the conditionals for the SoCs that require more, and then split
> the mt8195/8188 conditionals to allow specifying only the cfg MMIO
> on MT8188.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:1:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'sram'}, {'const': 'cfg'}] is too long
	[{'const': 'sram'}, {'const': 'cfg'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:3:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:4:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too long
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-14-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


