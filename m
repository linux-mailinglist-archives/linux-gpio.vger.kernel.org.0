Return-Path: <linux-gpio+bounces-17258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D4A56A7C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3FC169393
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C366F21CA1E;
	Fri,  7 Mar 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlnmLA93"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD421C9EE;
	Fri,  7 Mar 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358126; cv=none; b=MYz2+D9mQwpe9ow3u7GLR1NMxKJK6lN4zHe4wZehHo/mGFSgfgRmmK+7fuueRC9nvyGTu34XqdBWHVTrOVdQXV10UCteQiIR13O/7XbBTo72fLANkXPK5eyb/KzA85Qbf6CskLg/ZaI59NYCuZIF5Lyl8jv+Vzj6T/0XLbJuwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358126; c=relaxed/simple;
	bh=03Le1D/NeTxOVG5fsfF0nz70nJVlPT6k453TPDt8ntA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tOXDDzPfL5FibGlrb7V9SCRVmFxqtTYPz8Y3mGnikt60Fbe9U2hPlPp59IcBvBuVo/x4KwcC5Oo1Ll7atQNR8zp7HEu9lWJvRmNBHweN42N8wzCGVZ3L1lGp6uFAhw7ecGxPNRdKDOfA56TqGAuLHot2jsaz60DsltOeJfKhCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlnmLA93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100F4C4CED1;
	Fri,  7 Mar 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741358126;
	bh=03Le1D/NeTxOVG5fsfF0nz70nJVlPT6k453TPDt8ntA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WlnmLA93thLv3i5tOxFwUz61WSRV046LkGcrinCZTDXqlRK0rj+/smuYbUKwxSChj
	 /548Q0GmcbYpexSCVo8842aUCn1cUkJCeMDfJ1qlRtfV1g7Lb3LW6qMoiHbHqXYJ8B
	 4npSRlOUQjG1QsqKLkBFGYOl6+GNLzABEy3hamYzgG16Dy2FzSPzdjOYN6vQ1Za7ET
	 ITiRLsHAhzq8FrjykkbMpLLKkVS5WcICPg5KleDVhyHxWNkYCnId2GLRlfFzadXEAc
	 AJBtln5dHXu3B4PrblpsgUn5pG4y6Wk/nN334Ty/O4Duip4HBnp6ogvoYgIj7R1n1q
	 dnYNMcyI4S3Og==
Date: Fri, 07 Mar 2025 08:35:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org
To: "Darren.Ye" <darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-15-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-15-darren.ye@mediatek.com>
Message-Id: <174135812256.4140479.2757707814425375416.robh@kernel.org>
Subject: Re: [PATCH 14/14] dt-bindings: mediatek: mt8196: add mt8196-mt6681
 document


On Fri, 07 Mar 2025 20:47:40 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add document for mt8196 board with mt6681.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../sound/mediatek,mt8196-mt6681.yaml         | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307124841.23777-15-darren.ye@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


