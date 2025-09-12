Return-Path: <linux-gpio+bounces-26058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006CB55065
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FAE31D6446C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D772E30F7E8;
	Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzznp34s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E91E32B7;
	Fri, 12 Sep 2025 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685980; cv=none; b=drcD++6DNCVsB64OeziMZ+4YU4pXb9n6Qk8PbMQEoX+4UdB+Xh1QU54HbUZCXg1DM0DDS0ptD3NC6EzxdD7ksNYsUd34OBMtdKohWeVIRh4io9/KInqIbUjjJseRDswJh9TEOsWElecfUzbFNhFS4kKuugCnbgxSS3TQZ+g/mu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685980; c=relaxed/simple;
	bh=gQYcfi405JQ9buqQxkTP7o9NnD/8vJsE/3UdfYC31Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+KEjLNmux7tdeSbXfEkMgcpwTN6sSD742Ym+xA6xbU8hT5jwGH32BilhsTqmNx4flfOKpC7/ttRp2W6KOMQ3AljUjjR9UEFfKD80therHBSZF+nX4rjeLQl0rurLgN964m1z0muE5o12aNgdfU/BEi/gm7x2gG12kGcW/9k9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzznp34s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BA2C4CEF1;
	Fri, 12 Sep 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757685979;
	bh=gQYcfi405JQ9buqQxkTP7o9NnD/8vJsE/3UdfYC31Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzznp34s7YFwrDjEEJkZ6iekjTLnPUhXzJLoPxBZyYG7N5CYK4W0PMCRqN5AARwKl
	 VymP7CBqTch6oU3Dxu+8CbAWzZ0kIqydRCrxLBhWWMw1bhQ7Z0t2YuRuWT8PhZMYIS
	 Kfz1cNTv0+6uUTVt0rhcsIvu+8XBwwvlvJbDRBPtUXZi6WaKHo+fJ4EgKll7QJ1KOo
	 UF6gaG8l5++/aG16KdKtx01G+jonZrF4pNSs9q4TWqU3ki3ZkruTpdg/M5gSykWMLS
	 gn47pNV+L6Wki7pJ42z98l/YWp8hyHWCGWhDKKhEbjU7tW/W+1B318r/PjuvYKi3cx
	 6YB8Oj981CRLQ==
Date: Fri, 12 Sep 2025 09:06:19 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
	dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
	jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
Message-ID: <20250912140619.GA1293647-robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-4-ariel.dalessandro@collabora.com>

On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> 
> While here:
> 
> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>   schema definition as these are currently documented in file [0].
> * DT binding users are updated to use bluetooth generic name
>   recommendation.
> 
> [0] Documentation/devicetree/bindings/net/btusb.txt
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>  .../devicetree/bindings/net/btusb.txt         |  2 +-
>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------

>  .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>  .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-

.dts files should be separate patches. Please send the bindings patches 
separately per subsystem so subsystem maintainers can apply them. All 
the Mediatek dts changes can be 1 series.

The schema looks good.

Rob

