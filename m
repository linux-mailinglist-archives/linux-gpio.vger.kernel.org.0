Return-Path: <linux-gpio+bounces-17257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A95A56A7B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD8A3B34DF
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 14:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E0E21C9FE;
	Fri,  7 Mar 2025 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwlDu4Nq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BDE21B8E1;
	Fri,  7 Mar 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358125; cv=none; b=aOchDbBbYufNePh09XWERUFmvRlQZhwPMALc6xLEDFrcsb2c4HE6VPIp9Ojea0uLARIDdSoDqj5gexirfTGPFbMolJYOr2nTxb80qUHcUmgozJp7RF1S0l3GbBLtx5x4odxAmd1P6xwNxnWtq3bqFV/z+77+RWpUwLZCn9Z1PYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358125; c=relaxed/simple;
	bh=mSYF5jWdr2DmPy1tLsGF7JnDLa4fBSeg5OOTSDPYIGY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GkB38fGXTPAPlqknAdrYx3hUW1RMYLHmWzCvTNpuEWPU4RDkjzpXGzZOdNwvxtMGYN2CWgjawEjb8lQVoPYHjNgzjEP+sz535YdI6lCcw4NDXJxu1QHGnVDA0fAfK5Xk5erSwhuFiqAUQfufEkD/R0y3UpQMl6VfE8KaL3cP/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwlDu4Nq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B17EC4CED1;
	Fri,  7 Mar 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741358124;
	bh=mSYF5jWdr2DmPy1tLsGF7JnDLa4fBSeg5OOTSDPYIGY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FwlDu4Nq5poNzIQ0wTx6obM39typS2Mem5/PONWfpx/qbODRlaAqh8t2UMPtpqvfk
	 b+MiaqJqmzVAz4Uh41I4rqaNfAcLJtPWk5jmW/ygNcQF3Oc54joll+Bbre8NQPpFKq
	 css+kMJGFAeDkCcaCZaK/tooY0+J5vYp8SLwMQDIGsFi4pXA6x/CyVy9ckmnZ60FS6
	 GTm3FLbVIIO36xRFTfoAR1SESbAsOTPIvQDY/EfGu3Sm4XZuVAjFu2PG+KRuz/QvDX
	 9iLz0ba79rbpEu9N3MiWr1YVz9O4jCmjFA7sYLvL28dl0+A2KN35GoYO8xvjT1xIpj
	 ZWMzGMGJ50PDQ==
Date: Fri, 07 Mar 2025 08:35:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-13-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-13-darren.ye@mediatek.com>
Message-Id: <174135812164.4140447.14223699212791655529.robh@kernel.org>
Subject: Re: [PATCH 12/14] dt-bindings: mediatek: mt8196: add audio AFE
 document


On Fri, 07 Mar 2025 20:47:38 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 audio AFE document.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 259 ++++++++++++++++++
>  1 file changed, 259 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.example.dts:24:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   24 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307124841.23777-13-darren.ye@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


