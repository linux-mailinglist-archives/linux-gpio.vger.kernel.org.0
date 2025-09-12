Return-Path: <linux-gpio+bounces-26091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCBAB55953
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 00:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937005C31B5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 22:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28535257835;
	Fri, 12 Sep 2025 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrVcwliJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A41E5219;
	Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716673; cv=none; b=H0YReYSobK1Xoqz1WQhH7ecxu90OW2naYnkKWlLsMV76R8LDU7RefhXRpbUEoc8BGoBrAR3Owub3gbUCKEpDHjurPaonrawl0ZYJC/pB2RKOhz46ILOjSkUhinLCqrE1ZAV4SMPRdlbQ3eQ0Zp0HLM2HWzu5aQxT5MWK+IupSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716673; c=relaxed/simple;
	bh=B9UWbZGKGjcmdpBpJTHq4Bvu86HEtGMURBUQlAh+wng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmetdA+kRB5A/O39+6elgPq7XC4XLb5Mnuhznvf9du/0T8FBZoECP6brGFt4rhrJLmA9Omz3S93c1oA2BA8eVICwOMMmm+3B+EQn1rj867BBg8zb3VrtIaPs4wvv+D7+xltRjhTvGEgDZFsDYky/Cz80pchu8ri2Wh/YAoNgWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrVcwliJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2214AC4CEF1;
	Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757716673;
	bh=B9UWbZGKGjcmdpBpJTHq4Bvu86HEtGMURBUQlAh+wng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrVcwliJdziWcvEcLi0TVBaYRU0cqz+P0LkYP18PS4V8it1ba7cZ92zsa5Y3dzWLc
	 YrEuOyNwShq0RR+1+3s/CzKz/FvAj8Dg2ILyM9zKHc+GxAcTbJRbF9zrHAxYtHAtWS
	 nowrg87C3Mhu7Ma9MVTSiKPANaSzfmKeaaI+jiwqqKI/eFzfgCVIsx0GyGgRpB5mC/
	 E1FV/bHUfiM/xWBXFUvAkeBLYpdn5iD18PAOpqzc3WdYh8uHA0QJpTs+ikEAG/Jg8A
	 LroectmFESH23Jvjk8Jl5nAs0sIu7GliX4k4LL9XE6Kb1IBSFNtgZdkeRG9oO5IQJw
	 v2hGeBjsKFJvA==
Date: Fri, 12 Sep 2025 17:37:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: luiz.dentz@gmail.com, kuba@kernel.org, airlied@gmail.com,
	mripard@kernel.org, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, tiffany.lin@mediatek.com,
	houlong.wei@mediatek.com, minghsiu.tsai@mediatek.com,
	lgirdwood@gmail.com, louisalexis.eyraud@collabora.com,
	linus.walleij@linaro.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, yunfei.dong@mediatek.com,
	edumazet@google.com, linux-bluetooth@vger.kernel.org,
	tzimmermann@suse.de, broonie@kernel.org, andrew+netdev@lunn.ch,
	kernel@collabora.com, chunkuang.hu@kernel.org,
	amergnat@baylibre.com, conor+dt@kernel.org, matthias.bgg@gmail.com,
	support.opensource@diasemi.com, linux-rockchip@lists.infradead.org,
	davem@davemloft.net, andrew-ct.chen@mediatek.com,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, sean.wang@kernel.org,
	linux-kernel@vger.kernel.org, simona@ffwll.ch,
	linux-mediatek@lists.infradead.org, marcel@holtmann.org,
	dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
	pabeni@redhat.com, jeesw@melfas.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, flora.fu@mediatek.com,
	linux-gpio@vger.kernel.org, heiko@sntech.de,
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 05/12] dt-bindings: display: mediatek,od: Add
 mediatek,gce-client-reg property
Message-ID: <175771595983.1528737.3645378655142592974.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-6-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-6-ariel.dalessandro@collabora.com>


On Thu, 11 Sep 2025 12:09:54 -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek OD (display overdrive) DT bindings set
> mediatek,gce-client-reg node property, which is missing from the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]
> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: od@14023000
> (mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'
> ```
> 
> This commit adds the missing node property in the DT schema and updates the
> example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,od.yaml     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

I fixed up the commit msg with Krzysztof's comments and applied both 
display patches. Thanks!

Rob

