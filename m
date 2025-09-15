Return-Path: <linux-gpio+bounces-26182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0356B58362
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 19:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43864C0499
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29398307AD5;
	Mon, 15 Sep 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE48EwGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F7301476;
	Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956739; cv=none; b=Zqx7F7SKyhxZASm5TXZHbEqaVtZ1cSLMatzBMNAGzJK5EJLN6ZAdcbjQ20eWu0rH0VX+0SHm9svnq87USGIeMu72J60I/aFbcJh56Z4QW5+Z6Oh+1EfA7LDXqnu2G5hQPxL/O3vSij/xpXobKHoa/Wr9WYvKSq4jho8/ZgEV0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956739; c=relaxed/simple;
	bh=echBK1j+X18njnYEmIigVCWTPbyp+OCXowD7iTEllfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rykAC47oBEm0YTPsn9xNrHXfZGXE7y+4zq6bkmottGfhYIFVNGGL9huplSH2NGMGKEMnJ7WCBa9e/s2JiNp9F0lFXohlv0AqdqGmYsAprFTCRPw2U0+W2kZH4LGR7KU29mmmzG1YW6M4JrQnTZ7dG5cbvEnzElRMfrxUjsWnVgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE48EwGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D2FC4CEF1;
	Mon, 15 Sep 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956739;
	bh=echBK1j+X18njnYEmIigVCWTPbyp+OCXowD7iTEllfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IE48EwGK3IiFjChHMY8WDepEbhLCtNxnYU/5z69sMcEgP7bXPN0cqBnteEiF8K4wz
	 BDuAS8CAefnVdeOjVD221KnpxDk/F0LjOH6qcKQWQJG47odmA0WmwHnSCVre/ZLl6L
	 zVzS+g2T8rF+z/6cNHOBtIbOh8J+0KdUAvwDgAFChv7sM3e6KAmp2O8D1X/hkC2k6l
	 aWTpA49ruDg8QSVkTHqFtiDRf0CjQK0eS2GsoHAD0SyLtQ0pxwhoMX6nTMlLWiuHmK
	 oAKrC/RF+A0eeLwt/qbnL2I7MmyKjt0xGF8YNIIVcrl2hxWOfGG/6RIeiVz12BpOTh
	 dEA+cAoc3xBLg==
Date: Mon, 15 Sep 2025 12:18:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: louisalexis.eyraud@collabora.com,
	angelogioacchino.delregno@collabora.com,
	support.opensource@diasemi.com, tzimmermann@suse.de,
	sean.wang@kernel.org, maarten.lankhorst@linux.intel.com,
	luiz.dentz@gmail.com, krzk+dt@kernel.org, kuba@kernel.org,
	linux-bluetooth@vger.kernel.org, p.zabel@pengutronix.de,
	jeesw@melfas.com, andrew+netdev@lunn.ch, houlong.wei@mediatek.com,
	linux-rockchip@lists.infradead.org, mripard@kernel.org,
	linux-input@vger.kernel.org, tiffany.lin@mediatek.com,
	amergnat@baylibre.com, linus.walleij@linaro.org,
	andrew-ct.chen@mediatek.com, marcel@holtmann.org,
	lgirdwood@gmail.com, heiko@sntech.de, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, dmitry.torokhov@gmail.com,
	airlied@gmail.com, linux-mediatek@lists.infradead.org,
	chunkuang.hu@kernel.org, flora.fu@mediatek.com,
	devicetree@vger.kernel.org, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	simona@ffwll.ch, netdev@vger.kernel.org, edumazet@google.com,
	yunfei.dong@mediatek.com, linux-gpio@vger.kernel.org,
	minghsiu.tsai@mediatek.com, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, broonie@kernel.org, mchehab@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow
 gpio-line-names
Message-ID: <175795673768.2952954.14700429990661884718.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-9-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-9-ariel.dalessandro@collabora.com>


On Thu, 11 Sep 2025 12:09:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


