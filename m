Return-Path: <linux-gpio+bounces-23829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64847B12550
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37B227B785D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F215725A2BB;
	Fri, 25 Jul 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGN9Hi1i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195D4501A;
	Fri, 25 Jul 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475217; cv=none; b=RG/j6L8dnYMkfmasQ3/N0vms589nXBDwrW6HshP1IYHR8rmWzAz2zcWvC9p29ZC1wuLAp8p5yZpDoM8Qe8xYIQ6SQcoh6HT91uUBBxiF343uuGsOh5dwKC9l65d5YS61Afn4HFwl5Ry3cmZcrepSGiG29LONj3P9/Pil/e4keXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475217; c=relaxed/simple;
	bh=gwiksp3J4bGpqvzDaXhOxRpN1GcS86ZmMLM2DmIXBlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+Pew8ts7urPp9R+Uck1l5rNaMUW3+YWnju6+C8z/+B5aTaaVIlYB7Wtu3Qm98ekXHrfW/LQ0dGo6YcJHHSlN4KRsRKkajOfNXbuwzbMEWkAsfiaD/lzClppVc43SWbHcPtJFfD/ZDxC9JpgqVlMXeWId0owI3iBhlumSDKjrtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGN9Hi1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD53CC4CEE7;
	Fri, 25 Jul 2025 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475217;
	bh=gwiksp3J4bGpqvzDaXhOxRpN1GcS86ZmMLM2DmIXBlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGN9Hi1imKljswG6X/DBWlkd92MGaNXkl7nCpM96OQLcPyU/TkuYmNgKqvYkbtIVR
	 9dckup9w/GKbTvNcPaRj1rQ77iwFaIjwjQJQaekWBHEzdCiBLNfF+qnHajVK1zC8T2
	 fEvTe7JTB/wj79CyGw4A/ansr+AR4VppgZXBymyhe5oAQt0Z2tmwxe0DngswssY1h+
	 /kyUy6w2NxgYSmTlvqwU4n4bVhYX9RCEZ0BaoTO9ElMI5nyzjj++ig1nJ4q+GO0v9F
	 wJwMkqxcH4BdiQte7QQqI9MDqYfQBMxJAWlvaDvqDWvRMUTD3lgPtZMZNoj8a+7PJG
	 yUHsU9u7dT27A==
Date: Fri, 25 Jul 2025 15:26:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au,
	davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	sean.wang@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
	broonie@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
	ck.hu@mediatek.com, houlong.wei@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com, olivia.wen@mediatek.com,
	granquet@baylibre.com, eugen.hristev@linaro.org, arnd@arndb.de,
	sam.shih@mediatek.com, jieyy.yang@mediatek.com,
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
Message-ID: <20250725202655.GA1826181-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>

On Thu, Jul 24, 2025 at 05:16:21PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 24, 2025 at 4:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> > is optional, and has always been unused until MT8195; specifically:
> > on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> > on newer SoCs, like MT8195, it is located in VDOSYS.
> >
> > For this reason, allow specifying the resets and reset-names on
> > all MediaTek SoCs.
> >
> > Those properties are optional because there are multiple ways to
> > reset this IP and the reset lines in MM/VDO are used only if the
> > IP cannot perform warm-reset.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index b659d79393a8..eb4f276e8dc4 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -102,6 +102,13 @@ properties:
> >        - port@0
> >        - port@1
> >
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dpi
> > +
> 
> Do we really need the name if there is only one though?

Not really, but if it is already in use then easier to just fix the 
binding than both the binding and dts.

Rob

