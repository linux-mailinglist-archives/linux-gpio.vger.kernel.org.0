Return-Path: <linux-gpio+bounces-23787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD8B10902
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 13:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4585B1C2160C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A312271A6D;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB9F7RQr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577C27144B;
	Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355973; cv=none; b=EawegTAGd9CNKShoK2KLKtmhkszfzIniIuqqstR9iOzEBakkmyIyu8hvRU/Sv7Kba+9RWZ+86O35c9xJK25xmEyVyoEJKaiy+Xe3sia+KHk9Qc+2XL7RpqcFOXKXwXAaVilqmA5MaTZIShRrHWefmL8oos6Txw7bKbFc3pWZskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355973; c=relaxed/simple;
	bh=fKCuPREZ1fbNq7ig0PZdlTERupyUK7tD1jI8Qmyxs+g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GRhJbxMPfSx6PryoHSLZbP/OyzZV9ldnNGi+A8pEAQ/d2Vr/T+M9EnWNj/dE6QZJqfqu8OQFR4F+np/vTWz7X8x9NZYpBZl+KyNqCkSy0lbOWLqiEPde1qRn468xfHPyFVaMuQEgv2FrfBx9JuFRVexUQYfJqM0bUjhAhh4OK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB9F7RQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BECBC4AF09;
	Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355972;
	bh=fKCuPREZ1fbNq7ig0PZdlTERupyUK7tD1jI8Qmyxs+g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sB9F7RQrKGg3BH5HBxZKEtr+kJAxtHztDJOH4j06rLBPmyPtxR8iCzQpvE8FN+9Iy
	 mcD/YAzmcUN8OsUa43o8rwSj9x+YBqvRJh5DMVuUHTFfj26IXlM/FWU+DH4kTUOUnl
	 FTi6NYjKApl0W1cCWyKtot5HZx3NdodGu8tGv8g+/FaCls7mqFfxAzSgirg+XBM7mp
	 YGT8Ybuu8+k/A3ti+/lmcOOP8rNX+h4vLb+A/HBHRXSF2bbwqJj6IdGKM6kE5fzSw3
	 zV9RNcWAGwDhEKw8LyJsm8l8Xse6hXdc0a6Hv6btUM7ggBxiqyHO9q+EUnGjDVQupz
	 EcJuB5Dd0NFIg==
Date: Thu, 24 Jul 2025 06:19:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: atenart@kernel.org, maarten.lankhorst@linux.intel.com, 
 houlong.wei@mediatek.com, linux-sound@vger.kernel.org, tzimmermann@suse.de, 
 mwalle@kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
 jieyy.yang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, herbert@gondor.apana.org.au, 
 sean.wang@kernel.org, kishon@kernel.org, arnd@arndb.de, 
 linux-media@vger.kernel.org, granquet@baylibre.com, vkoul@kernel.org, 
 lgirdwood@gmail.com, tglx@linutronix.de, devicetree@vger.kernel.org, 
 mripard@kernel.org, ck.hu@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, simona@ffwll.ch, 
 krzk+dt@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, 
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 jassisinghbrar@gmail.com, linus.walleij@linaro.org, conor+dt@kernel.org, 
 jitao.shi@mediatek.com, tinghan.shen@mediatek.com, 
 chunfeng.yun@mediatek.com, davem@davemloft.net, eugen.hristev@linaro.org, 
 linux-kernel@vger.kernel.org, mchehab@kernel.org, jiaxin.yu@mediatek.com, 
 chunkuang.hu@kernel.org, andersson@kernel.org, frank-w@public-files.de, 
 fparent@baylibre.com, linux-remoteproc@vger.kernel.org, broonie@kernel.org, 
 linux-mediatek@lists.infradead.org, andy.teng@mediatek.com, 
 sam.shih@mediatek.com, olivia.wen@mediatek.com, 
 linux-crypto@vger.kernel.org, linux-phy@lists.infradead.org, 
 shane.chien@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
Message-Id: <175335596917.1587632.3054141049365225304.robh@kernel.org>
Subject: Re: [PATCH 08/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl:
 Add missing base reg


On Thu, 24 Jul 2025 10:38:44 +0200, AngeloGioacchino Del Regno wrote:
> The pin controller for both MT7622 and MT7629 need both a "base"
> and an "eint" MMIO like the ones found on other MediaTek SoCs:
> while devicetrees have always been correct, the binding is not,
> as it only allows an "eint" reg.
> 
> Add "base" to reg-names and increment maxItems for reg to two.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.example.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg: [[0, 270602240, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-9-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


