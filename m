Return-Path: <linux-gpio+bounces-24829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D6B31FD7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 18:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A960E6661BD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD5423D7E5;
	Fri, 22 Aug 2025 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLkvEcDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE1F2206AF;
	Fri, 22 Aug 2025 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877844; cv=none; b=Yzq2lBJ/UVwrI/ZobCaz7qfVXVxWzoXr4hpgzPTuJqvFlFBn16ntMKsCx6NdCcVRFLrk+4tHkYQRD0u5sGh+gELIvTdkTx2CWiBiwhMJkiDAEgD22WCchUzxkSN+/cxDhRAu6GZD/KEYRURLkoL5GTcWtlj1BpYUAdeAZdc6Zds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877844; c=relaxed/simple;
	bh=PRjr1oyN1prDBOKUZ34iupM5Ee2Kn6LvfPBZpedTizo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpfLAFT+/6liDRh8alUoNZrdd0PzRhA2I1IwO7NpHbZ15t2vR/4qbIoDZiqqJRmddB1owjO+2q3aK1whcbq/gFk6v1zYWbnWsHUiydAI50zHBlWlzjNIZBEejv7r4PgB0R7rer+xjmeaTX3P60YWt55mpb8E1TLmi2qCXJlofXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLkvEcDi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BF9C4CEED;
	Fri, 22 Aug 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755877844;
	bh=PRjr1oyN1prDBOKUZ34iupM5Ee2Kn6LvfPBZpedTizo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLkvEcDi7va6d8wofQYB7lrrIzy/EqQpNAQJUXQsL0j3e4syTR+r96SoHaJ3jAtJR
	 7ZckKnr3dczWN36y3PWZAxXyGK69AGZvU7vIBerBELyyjgoLDbNNAcCkA8nodPxDjG
	 o1EdFfnjI81c9N6hD5URN/3efElktMnJn31DHEJ4tSXKO/4iuxY9Zquzh9Lsue3hJv
	 Q28Oexi2b1PJzAUXESiyT7HeH2V0N8GEeoQZVSqffF15OnUhUTMiLeyN1JcqQQOYJK
	 1CcJOJM3mQhb74Hc88k0wxqQw9O3jxOtLRx8iGcXvDWmSZ17ssaR/zBJ0ECkedrAtH
	 kWisP7d7d+0oQ==
Date: Fri, 22 Aug 2025 10:50:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org,
	airlied@gmail.com, amergnat@baylibre.com,
	linux-sound@vger.kernel.org, p.zabel@pengutronix.de,
	linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
	kyrie.wu@mediatek.corp-partner.google.com,
	linux-input@vger.kernel.org, kuba@kernel.org, conor+dt@kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com,
	kernel@collabora.com, lgirdwood@gmail.com,
	minghsiu.tsai@mediatek.com, edumazet@google.com,
	jmassot@collabora.com, simona@ffwll.ch,
	louisalexis.eyraud@collabora.com, support.opensource@diasemi.com,
	chunkuang.hu@kernel.org, andrew-ct.chen@mediatek.com,
	dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
	jeesw@melfas.com, broonie@kernel.org, davem@davemloft.net,
	houlong.wei@mediatek.com, flora.fu@mediatek.com, pabeni@redhat.com,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	tiffany.lin@mediatek.com, ck.hu@mediatek.com, krzk+dt@kernel.org,
	linus.walleij@linaro.org
Subject: Re: [PATCH v1 12/14] dt-bindings: soc: mediatek: pwrap: Add
 power-domains property
Message-ID: <175587784167.3865517.1055280782148729337.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-13-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-13-ariel.dalessandro@collabora.com>


On Wed, 20 Aug 2025 14:13:00 -0300, Ariel D'Alessandro wrote:
> Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
> power-domains property, which is used in the MT8173 E1 evaluation board
> as it needs USB power domain.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


