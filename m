Return-Path: <linux-gpio+bounces-24623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A6B2DDD0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633F81887770
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F0C31E10D;
	Wed, 20 Aug 2025 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lfj2HXze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB672617;
	Wed, 20 Aug 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696734; cv=none; b=gjs/oNNW5ipvEEuqegDOHz//Dub3w9RLhGSwkhfeODw/j/cTYneB4fwuCcGI7ABBJmmg/HQ9ts+t5FROTu5Qx4zupvxgW+Q35hBgplIC+lFZyvrARBYhwc9qzvXIgHeuKlGA83KHoviInQwP7+xvdKC9LZQnXZap4ZKlBzrcirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696734; c=relaxed/simple;
	bh=xoMCU8Hclk9pQcShf2e7pCFyLlcJYafcaHzntjO6HTU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z0AwFZkrSjvsjzXkZmi1wjzPQNkVQWbdAMAFc93+T0gg02EDMhdLRz1Abc8P2xKSF78isaWppslSwnd4yBcGRDVJ86nk8B1FvRBsGU4//dF4gEo8jGW8bT7+gxMW0gSgW7McznQm7vqTb2R4sBS60AZv8vAmxvqh1yDAmyo5fO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lfj2HXze; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696731;
	bh=xoMCU8Hclk9pQcShf2e7pCFyLlcJYafcaHzntjO6HTU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lfj2HXzeHIsmYD7rf/UNXlZlzTAuvZ7f+sCaCRuYF/Gb1w2F1j1MYuFXsbGDIfU3p
	 w2/yNSY42ePNPmXRDbYu4tHcg+ho5ugQh0teIZwu43GS4q+CQeuOqy3I7f6OsYYBli
	 D2ArhoUvxXX9sHfgj0drPeVwm4ln9F+s9myHFclfgb953ayoQgwaBCfClOKeHJA42N
	 L+6h5GwzRsMhWUyZQSiX+DkLZmEB+0IyXYmx2GehA1PxXstHP6hLcy5hnSA+yTB6lG
	 42C2eyCZ41vBymwNKzzY5jjtI1DFR4gT9mf4ywH1ELcbI9eiSh7ZrKe/PhkyEmMX6B
	 CkT3sqDqgVHGg==
Received: from localhost-live.home (2a01cb0892f2D600C8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECCF017E02B0;
	Wed, 20 Aug 2025 15:32:09 +0200 (CEST)
Message-ID: <c8cbfdc79b5832d3640141a5ec5a47aacf94b57f.camel@collabora.com>
Subject: Re: [PATCH 4/9] ASoc: dt-binding: Convert mt8183-afe-pcm binding to
 YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:32:09 +0200
In-Reply-To: <20250801172600.GA3107067-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
	 <20250801172600.GA3107067-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,
On Fri, 2025-08-01 at 12:26 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:06PM +0200, Julien Massot wrote:
> > Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> > .txt format to YAML schema format to improve validation.
> >=20
> > While converting, also document all clock inputs used by the AFE block.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/sound/mt8183-afe-pcm.txt=C2=A0=C2=A0 |=C2=
=A0 42 ----
> > =C2=A0.../devicetree/bindings/sound/mt8183-afe-pcm.yaml=C2=A0 | 225 +++=
++++++++++++++++++
> > =C2=A02 files changed, 225 insertions(+), 42 deletions(-)
>=20
> This should come before patch 2 since it is referenced there.
>=20
> Yes, I will swap the patches in the v2.
>=20
> Use the compatible string for the filename.
>=20
Ok
>=20
> Otherwise, looks good to me.
Thank you,
Julien

