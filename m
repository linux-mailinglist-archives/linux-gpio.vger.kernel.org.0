Return-Path: <linux-gpio+bounces-16753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E8A48E91
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 03:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21BFC189021C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 02:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F07517A302;
	Fri, 28 Feb 2025 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCFy01Yv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBA3596A;
	Fri, 28 Feb 2025 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740709578; cv=none; b=Lp7AuJgug6l8maPOcUCagvoXzwIX9WDCs3vYJmRq9JM+5cMWJCGyA2Cmy+LTOoTlwQm4tEe9K2wRkLWra0LQMWgS5TuGMB/3dwKsnLgCPTvSc0IvSdcVOLRqO+SBjMOpVMd9af/6RhdMzlT3WOEeUAtXa8nGL4FdUi0f3HVVHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740709578; c=relaxed/simple;
	bh=4XXZ9I7t+Z962ZjSI+scZzu97ELOgs2wjrA6GJcuow0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=A1pjWMfy7XCAeQ9EPdouQi3bYoUSsnqurUsZaZ5pYEYksTlR0cXpSb+q88KvSfpT3XPeq3OCUnCF4qhc/IMZjucLQHdinyODutojty+8LJiE3UND4QI3JCUPyaBwjqud7dQA/G7+6ejCxdLp/eWOPAfDHdUSiMxVeH1WFZj+FgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCFy01Yv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEC2C4CEDD;
	Fri, 28 Feb 2025 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740709577;
	bh=4XXZ9I7t+Z962ZjSI+scZzu97ELOgs2wjrA6GJcuow0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KCFy01YvCZ614Qe+4DKOYJYaFXRvq2OU8rY7p+/81nMc6UTkuJsKfqka27v7s+sLO
	 lhxbRyTDODwe+79/khyCtu1J8DIdJre/1LR/1U84VYGIC83q4Z34WjJo08WKpS+xxE
	 7UXTMPaxfXCp2Bhp91NYhnYZp9SK1MMEb+7U9W3qfS6zZ/KE4EkFjaLRBrB/lwb/qn
	 f88qaT2IFYfmWxCZ6QmgPht+Nti1vWwOuEEoGhSGuaA1NthTcnAoc2mHTMOYy41DIV
	 L88Zy5gbns1HRCe64kLWI7yHYJslvwfrr+D+YbZWexeOv5duApkKoLdaBS5mawDm6T
	 Vn3POcEwigSFw==
Date: Thu, 27 Feb 2025 20:26:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Yong Mao <yong.mao@mediatek.com>, 
 Axe Yang <axe.yang@mediatek.com>, linux-kernel@vger.kernel.org, 
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guodong Liu <guodong.liu@mediatek.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mediatek@lists.infradead.org
To: Cathy Xu <ot_cathy.xu@mediatek.com>
In-Reply-To: <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
Message-Id: <174070957527.867625.13463640154036333781.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196


On Fri, 28 Feb 2025 09:16:25 +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241 ++++++++++++++++++
>  1 file changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.example.dts:24:18: fatal error: ../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h: No such file or directory
   24 |         #include "../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250228011702.16493-2-ot_cathy.xu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


