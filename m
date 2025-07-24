Return-Path: <linux-gpio+bounces-23788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F74B1090B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 13:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED0D1C264CC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C8D274FCB;
	Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KANGt0eb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA882737FD;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355974; cv=none; b=PV++i5uTuPnC5o8s6/iPCqUWhoQ1dwat/rq+AIu8iJmHxsw5nd1fiHDAgwXr/rKapxEFZh7DoICATwbhPaAMWGtOtrrS0Net9ZHMWpVSiio3zHFzQdUoPaybqzc7VCikiltDl7JOrcWm05CWx8PhsG649fVzziJQUyyt8tfDMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355974; c=relaxed/simple;
	bh=5cTdoI2rOUe6G6HT5nFkVFTBctNxOCQYi0uviPnvs+g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Pk2tE9hC8PR1sgCqpznxhMk0Y0JGP09RWurcVkn0BL8JPO4Jt617jclp8x50/OmR643PuIRXhRE1+BN3FrOl5HQ+rK6tClfRMTNsBzPoC5EbrJ1ZsMr+LH6YSsyJ/uwhFswHLl2U6fRcc3BnIKSB4mgaK5MamZSCtKN8wuwdFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KANGt0eb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E977C4CEF6;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355973;
	bh=5cTdoI2rOUe6G6HT5nFkVFTBctNxOCQYi0uviPnvs+g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KANGt0ebto1MONaBI3ARQ7iBvAyPQDgayh99q1orDfo5Er0bg7f5vzXeCc2U1ZKU9
	 7AIietCqp0u2n/uzXq2vyZXtIUALbpWNrw68ovOF7GDqPSQHH6aoG+Vcp2I5P4CuLc
	 WDpVL+fFrBAsHRjDnxbIvYeONye17mTyba5lQKQ5X+aqK36r0WZGhGI89WPQibT0mJ
	 ww9QIa3f7q2k7n213+Sfl8DZDJV3ErIdW5dEejEW6SvtxobVppRrm54brUQktp6fp7
	 P5KrvWdRk9ylcHJld7sId3USeqBmub4mDblrJjjpqLvTCWCXGiXyWRzx5OcPxXR9qQ
	 IY5rKBj8p/g8A==
Date: Thu, 24 Jul 2025 06:19:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org, krzk+dt@kernel.org, 
 daniel.lezcano@linaro.org, houlong.wei@mediatek.com, atenart@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 tinghan.shen@mediatek.com, broonie@kernel.org, sean.wang@kernel.org, 
 shane.chien@mediatek.com, sam.shih@mediatek.com, 
 linux-media@vger.kernel.org, mchehab@kernel.org, 
 linux-mediatek@lists.infradead.org, andersson@kernel.org, 
 linux-crypto@vger.kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
 eugen.hristev@linaro.org, kishon@kernel.org, mathieu.poirier@linaro.org, 
 herbert@gondor.apana.org.au, ck.hu@mediatek.com, 
 linux-sound@vger.kernel.org, p.zabel@pengutronix.de, 
 chunkuang.hu@kernel.org, maarten.lankhorst@linux.intel.com, arnd@arndb.de, 
 fparent@baylibre.com, linux-phy@lists.infradead.org, tzimmermann@suse.de, 
 davem@davemloft.net, jassisinghbrar@gmail.com, lgirdwood@gmail.com, 
 granquet@baylibre.com, andy.teng@mediatek.com, vkoul@kernel.org, 
 tglx@linutronix.de, jitao.shi@mediatek.com, frank-w@public-files.de, 
 linux-gpio@vger.kernel.org, chunfeng.yun@mediatek.com, mwalle@kernel.org, 
 olivia.wen@mediatek.com, jieyy.yang@mediatek.com, 
 linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, simona@ffwll.ch, 
 jiaxin.yu@mediatek.com, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597003.1587784.8284498888882102911.robh@kernel.org>
Subject: Re: [PATCH 09/38] dt-bindings: pinctrl: mt6779: Allow common
 MediaTek pinctrl node names


On Thu, 24 Jul 2025 10:38:45 +0200, AngeloGioacchino Del Regno wrote:
> Allow node names like "uart0-pins" for the main nodes and "pins-bus"
> for the children to make this binding consistent with the majority
> of the other MediaTek pinctrl bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dtb: pinctrl@10005000 (mediatek,mt6779-pinctrl): mmc0-0: 'clk-pins', 'cmd-dat-pins', 'rst-pins' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-10-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


