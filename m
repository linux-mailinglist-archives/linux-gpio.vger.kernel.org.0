Return-Path: <linux-gpio+bounces-23830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E23B12555
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8991CC1D53
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828C325A2DD;
	Fri, 25 Jul 2025 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AivHnx6f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F34501A;
	Fri, 25 Jul 2025 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475264; cv=none; b=RHEF9UlCXyNS58m92T+szZs4TCrJe7Uk/b282XuVwVEFC9whtEW3VPx//VH7wRgr4m0tR9MxM5p+JAhgAH/fVzeZAsCrmHdHIxlMXR9nXpgcA+5DZ+fWDna2DIZXEaqkn5K2O+mMYK0+1wvf/K1IxpO2HWqnrv8FRrd8ADFbbgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475264; c=relaxed/simple;
	bh=aTUYa4oy4wxPOvc8JecX8ElfkuEQILHtAfALn/xab6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdAo39b51B28UXqxlN/5s+Tiwk0tyd7wKQikyCtpcnT2BMQQzmY66+BB57Nqgiz7tGtG/9qud2OwnBiEFLSeKmIzb8Q8pZL7rs/IlMaw3H2mqGRcGUWoOoJ5m8PbW0SUAwSIkI1Sl3x6PuBMwYnPtUumL1eo4swD/e2EjCXTa0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AivHnx6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85EEC4CEE7;
	Fri, 25 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475264;
	bh=aTUYa4oy4wxPOvc8JecX8ElfkuEQILHtAfALn/xab6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AivHnx6fxOn/tyd89Fe+bvxQTmzuwiKd6XahF2foKADROK61HvS8eG5aqcgsjOwo0
	 QrEn+cpmRseYPEDN+2lgU6QGI7SWcgLSxrjNGxFM/oXNPP0g/f1sztZ5kRvMK+GsBq
	 OO1DuTpijsVzwGPHQ8K1/2vhGbRR3SuWmbHvI5JVhuQorMFU1XtVhK6yReD050/FzQ
	 +u83DVE9OuKOXkCV052rxzX/HVExTYmVgnWa8IowrfBlMwtheKx2ti6lXTQNmGMmsw
	 J1yqjYwhoBbqr64fW7jtsZdYr/zCSY9zIZ1ZpMs+HRj5QCZBoAuRmyJrBWNJ5NFF6a
	 kc+jE5j8hHdYA==
Date: Fri, 25 Jul 2025 15:27:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ck.hu@mediatek.com, mathieu.poirier@linaro.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	linux-media@vger.kernel.org, olivia.wen@mediatek.com,
	p.zabel@pengutronix.de, broonie@kernel.org,
	linus.walleij@linaro.org, tzimmermann@suse.de,
	daniel.lezcano@linaro.org, mchehab@kernel.org, kishon@kernel.org,
	houlong.wei@mediatek.com, herbert@gondor.apana.org.au,
	jieyy.yang@mediatek.com, jitao.shi@mediatek.com,
	shane.chien@mediatek.com, davem@davemloft.net,
	maarten.lankhorst@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, simona@ffwll.ch,
	chunfeng.yun@mediatek.com, airlied@gmail.com,
	kyrie.wu@mediatek.corp-partner.google.com, mwalle@kernel.org,
	chunkuang.hu@kernel.org, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org,
	lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
	atenart@kernel.org, vkoul@kernel.org, andy.teng@mediatek.com,
	linux-crypto@vger.kernel.org, granquet@baylibre.com,
	matthias.bgg@gmail.com, andersson@kernel.org, conor+dt@kernel.org,
	jiaxin.yu@mediatek.com, arnd@arndb.de, frank-w@public-files.de,
	sean.wang@kernel.org, eugen.hristev@linaro.org,
	sam.shih@mediatek.com, linux-phy@lists.infradead.org,
	tglx@linutronix.de, mripard@kernel.org, jassisinghbrar@gmail.com,
	fparent@baylibre.com, devicetree@vger.kernel.org,
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek,dp: Allow
 DisplayPort AUX bus
Message-ID: <175347526170.1834693.13284335506775768371.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:38 +0200, AngeloGioacchino Del Regno wrote:
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


