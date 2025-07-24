Return-Path: <linux-gpio+bounces-23786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F272B108FB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 13:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 779F416EC80
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD5427057B;
	Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CStr8z/r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7233991;
	Thu, 24 Jul 2025 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355972; cv=none; b=TptZZscQpBCwBl2dUi/xbub5dkWilli4VvepwWfPRnfMY52CK3Ez/58JhHAbw+mfO4QRrhCHPLKIY5iEovZMAbBZv6g4oYoscZ19kzZEn0VEPECTDnOJbs0/ea+Ey2+EnQRxBmO9QpJPHudjIPQyuquTAJJ/Lzt8/MK+6dlrUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355972; c=relaxed/simple;
	bh=s3ZnbItH7r6cLHTy+VwbS1Kg3RPe/mzeNlY5FzZW73M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nEbwErCeU0G0eVnF4UVDc8NSdPeFApcvjY20QO00/vlSVIU/JVq4n9juF+a89mPStWKnwO+m/B4gWo80JXf0qLmhoZr8hP4fkEzV9c6vqGV1mOeYPGOeDQppKqxk9bsIQJLtngFvtyibpftnYyn/f60Kcc5BQQZoveQHqV3068U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CStr8z/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BD5C4CEEF;
	Thu, 24 Jul 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355971;
	bh=s3ZnbItH7r6cLHTy+VwbS1Kg3RPe/mzeNlY5FzZW73M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CStr8z/rOsij9S3z3BJm9fHa9iakjiAXVR9PdOK5taBZURJfAPAAkHbj0KuQviY7p
	 KiL6Uvucdwz8LxwOWz7lwhX5I2qtRnTp09/USJTZHE24W+o2XT/5ls0Mo+DqJ/EQGy
	 4vOkkwAzobpebJvh+VgDfNRDeqyhbjww7Rd7PHdXbcy0KDnMtuIOIRC83Uv6MAlwmL
	 VYSko7BVS+mI+5gLRGV68wZS0TlpY3UDdnSSzeclWayt2BApahaiftZuAN6c9obWp0
	 2tUwExST1V+igIM59xAHMg7CBzYem4LQ8BDzMMNqgOtJqDmA0vvctgoZdBWhL20O8G
	 xRs89hLXeFgbA==
Date: Thu, 24 Jul 2025 06:19:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: frank-w@public-files.de, herbert@gondor.apana.org.au, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 linux-phy@lists.infradead.org, krzk+dt@kernel.org, eugen.hristev@linaro.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 jiaxin.yu@mediatek.com, jitao.shi@mediatek.com, daniel.lezcano@linaro.org, 
 linux-remoteproc@vger.kernel.org, granquet@baylibre.com, 
 lgirdwood@gmail.com, linux-crypto@vger.kernel.org, 
 tinghan.shen@mediatek.com, mwalle@kernel.org, sam.shih@mediatek.com, 
 sean.wang@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, 
 vkoul@kernel.org, mripard@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, olivia.wen@mediatek.com, 
 dri-devel@lists.freedesktop.org, atenart@kernel.org, arnd@arndb.de, 
 conor+dt@kernel.org, shane.chien@mediatek.com, houlong.wei@mediatek.com, 
 devicetree@vger.kernel.org, kishon@kernel.org, fparent@baylibre.com, 
 airlied@gmail.com, tglx@linutronix.de, linux-sound@vger.kernel.org, 
 broonie@kernel.org, andy.teng@mediatek.com, jieyy.yang@mediatek.com, 
 mathieu.poirier@linaro.org, chunfeng.yun@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, 
 linux-media@vger.kernel.org, davem@davemloft.net, simona@ffwll.ch, 
 linus.walleij@linaro.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 andersson@kernel.org, linux-mediatek@lists.infradead.org, 
 mchehab@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
Message-Id: <175335596838.1587473.6783798436849190740.robh@kernel.org>
Subject: Re: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks
 and clock-names


On Thu, 24 Jul 2025 10:38:40 +0200, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++++++++++++-
>  1 file changed, 104 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names:3: 'aud_adc_clk' was expected
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names:4: 'aud_adda6_adc_clk' was expected
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud_infra_clk', 'aud_infra_26m_clk'] is too short
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clocks: [[4294967295, 0], [4294967295, 7], [4294967295, 8], [4294967295, 47], [4294967295, 58]] is too short
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-5-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


