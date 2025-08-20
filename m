Return-Path: <linux-gpio+bounces-24678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B476B2E536
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 20:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131C71BA279F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868CC27FD40;
	Wed, 20 Aug 2025 18:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CozULjtI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208672522A7;
	Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716110; cv=none; b=q+xHpZ4WM4cW8Y3L05qoSMsUF7sFfL4Fim7ZsHBtOk7yzzw8pzAB34zE+wcAdyvs2SW0VpARmLwHHRaBCU+goDMrPhYuB7e9/Fck471sS7gxY1Wlh7x7RidXsgsMCH32VZ6b1Pkk5TMJPUgXg4unUfAKxBVvzWsfSq8ML4auO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716110; c=relaxed/simple;
	bh=KrxBI4bw6u84H4zKkUEDYwKmV2iNFMyZmZhqsrfdtV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7IYANhACssORhLKzP6jQq3x17roE97+5pN+L699rcZMDrzXa7lxE43m16CTuT74DTPuPlTRn+DfDjTPiYsxsXSbESyPveoJmfv+lQh4rOslTHx6i834mGZUz96ua78O9d9U3nLbflzqKjgdJPXdx9RXXyHSlTdeyflKhypqmKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CozULjtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD47C4CEE7;
	Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716109;
	bh=KrxBI4bw6u84H4zKkUEDYwKmV2iNFMyZmZhqsrfdtV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CozULjtI87ezxw30qO0tiBXmd/B+a0DtFD8O0r1Ijt8QQQx8BThbtwW8QWNFZ8zwn
	 GDhVSyvd/eTXNDvmuoKLP8gZbzIqwAavVeNAJTL9AD4T+oq9JD211sXJ3A9jIHdBe9
	 oby2P2YVBQ3I8r9mQM/Lwt2RVdfRe2sGJcP/c1x3u1vg+xkh+l09/RNCiQufnL+vjh
	 GyhWNZepnUHlVO7AOBcuUpAEM08nIs4SZGmNIG29XplZsZ5MYKbpImtIHpbPRBy/n6
	 J3D2v1i3GLEYxCZCXE+oRmNdlWlQrHy63msQ03IsVrcWk7mI62sGbw7/ZkfMSJmtPd
	 X3jYiXs/0WZXQ==
Date: Wed, 20 Aug 2025 13:55:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek,jpeg: Fix jpeg
 encoder/decoder ranges
Message-ID: <20250820185508.GA273751-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-15-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-15-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:13:02PM -0300, Ariel D'Alessandro wrote:
> Commit 14176e94bb35d ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg

That commit is not in any upstream tree.

> enc/decoder nodes") redefined jpeg encoder/decoder children node ranges.
> Update the related device tree binding yaml definition to match
> mediatek/mt8195.dtsi, as this is currently the only one using it.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 31 ++++++++++---------
>  .../media/mediatek,mt8195-jpegenc.yaml        | 15 ++++-----
>  2 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index e5448c60e3eb5..b1f3df258dc87 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -36,7 +36,7 @@ properties:
>  
>  # Required child node:
>  patternProperties:
> -  "^jpgdec@[0-9a-f]+$":
> +  "^jpgdec@[0-9],[0-9a-f]+$":

This is wrong unless 0-9 is a separate, distinct address (like a chip 
select #).

Rob


