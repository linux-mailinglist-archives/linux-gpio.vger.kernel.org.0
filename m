Return-Path: <linux-gpio+bounces-26181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194BB5833F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 19:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C897616086B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E85C279DBA;
	Mon, 15 Sep 2025 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/JbTlRd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A119E98C;
	Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956715; cv=none; b=IPP5fll48lM+GQVrEwOge+gpjoGxDgUKpowgfQRH5v8nEBYG++n4laHEdus0xiZBUM36RMs/Nvon7bqbFtkQdyuMAo7/GGKrHeSo1lPDuufi3/6cNZ5mDlK+my0f9qQtisqgMMV9wLO3e70xSQfGgYnGG/mkmTud3uclaR8kheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956715; c=relaxed/simple;
	bh=UudavyaBPyKCvnlpRZjR/WL6Gz4dsHuj/kJzrYrD31k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJQw75eH7CNUgymKvUWU0QORghT2G0NHB6dv1B32UdS0tjCdsCkSFusMSty87FWeg1UfDxMN02L399Yte3yIqWqBVgSeYJoFv4n0sRzEq+q3OO/1lwLLPhE8bSqwXZpKu2GaYjacgOas6Fzra1qX+eE1YdVlYibAgy+haw+eekA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/JbTlRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060DC4CEF1;
	Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956714;
	bh=UudavyaBPyKCvnlpRZjR/WL6Gz4dsHuj/kJzrYrD31k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/JbTlRdHf2wuMS7PAQDX+cMcUt0Tl2t0XWZyhzi1eOyiISPk7RjJcnsIS0GIpi9V
	 7SbXrx0cZaL37tKdyg/vcUqZJzqSXLzgTtNoPXknib9uGaINZ14kqTyI7w27Jd9lfE
	 6D3ifCwLIr5z4r+BgcNvocGfn8dNx4/n/EYCi8Mze70UyAizPmCLXaCHML3w4Or7VH
	 FunnWjeDz28vusWXMx/XEhCwqYuB21S/9Q0HK2V/W6cRl8dDYJpjZR2DN8/L5UEREY
	 wgMm1OoRpOaQJd0B0pyOH+m2tJXI1okpo7J4dXt2uk7aqpPPk7lAJ+PaV8RA0gVQkg
	 wtCjSaz/a2p3A==
Date: Mon, 15 Sep 2025 12:18:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	broonie@kernel.org, flora.fu@mediatek.com, p.zabel@pengutronix.de,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	support.opensource@diasemi.com, edumazet@google.com,
	krzk+dt@kernel.org, louisalexis.eyraud@collabora.com,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	tiffany.lin@mediatek.com, linux-media@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	chunkuang.hu@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, airlied@gmail.com,
	linus.walleij@linaro.org, pabeni@redhat.com, lgirdwood@gmail.com,
	kuba@kernel.org, linux-sound@vger.kernel.org, tzimmermann@suse.de,
	amergnat@baylibre.com, linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	yunfei.dong@mediatek.com, linux-bluetooth@vger.kernel.org,
	davem@davemloft.net, jeesw@melfas.com, heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org, minghsiu.tsai@mediatek.com,
	sean.wang@kernel.org, houlong.wei@mediatek.com,
	luiz.dentz@gmail.com, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, simona@ffwll.ch,
	marcel@holtmann.org, andrew-ct.chen@mediatek.com
Subject: Re: [PATCH v2 04/12] dt-bindings: ASoC: Convert MediaTek RT5650
 codecs bindings to DT schema
Message-ID: <175795671272.2949182.4347956532845839846.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-5-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-5-ariel.dalessandro@collabora.com>


On Thu, 11 Sep 2025 12:09:53 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>  2 files changed, 73 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


