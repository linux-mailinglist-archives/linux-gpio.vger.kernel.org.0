Return-Path: <linux-gpio+bounces-22552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D9AF090C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 05:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8213BBA97
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 03:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F101D63F2;
	Wed,  2 Jul 2025 03:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="cFlxaOsx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0512A1AA;
	Wed,  2 Jul 2025 03:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425851; cv=pass; b=pG/5s3PEAeE7VPE48I5zGwGTzjdBd+3p5SDSZR+6NEfMQAQI93Q3/2t4dRp65MINixscSGFuVi0EaiFQn4y86H6VC1xa69VdQD+N0tRYsJrCg8eTg8ItISqLx0iz8Vj89zxnZUMMooa9yLeSgtvNXCdtid2Ldsu6Y94XsJ1ZBA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425851; c=relaxed/simple;
	bh=vB/bRw7mFEOpN1qxnHiykYCOW17QQ/rr/o+IPmh4y5Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOdYukiz9pt/MGzr14KJ+gjtSOwoKgn8GPRlwJjQyymfRkOUQKGW0OsBDI1VyrVO64FlQt7XIaM0yYoBOLV/GpTPE9pyFuQOffrkgqvBeakqW+nKsVBOx90URDAQetVH1dRWwhFkJkBn+VVYmbSLRVGqMwyqeqH8m00c6Qe2iFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=cFlxaOsx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1751425814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xr2cK+CvHwCuLF6dqXXOm/rllWOBEN3wTLEfVyx3HLw+Tx8nsUmMnmuBj9W6XziZWV+cj7hneaVu7wXBvA9yzfX+uT8PfA9a3p5HwkhipQD2Hi8Xucq88FlOlY4pcH3wFl+HKzuIAniXGtsoSaUhEzM1p/lWq/xgTZ0kzAjX/Cg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751425814; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vB/bRw7mFEOpN1qxnHiykYCOW17QQ/rr/o+IPmh4y5Q=; 
	b=UNQtavYyRj4TxsQRH734yLFUks9OFmyPo2t8gUt0F+p0DqsZwx+9Vb4/qx5LDBac+Id+oPXfwziiUXBEoj2i2GBuJCRkua6Vl0sTET2IkDZRcFxuucIYmvIrJMnf+U19+gfKFLNOaksL5yYROvfLrJMN8FbcSgkugQLt8YvvJiI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751425814;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=vB/bRw7mFEOpN1qxnHiykYCOW17QQ/rr/o+IPmh4y5Q=;
	b=cFlxaOsxOq+v8V4Nltv2Ir58bEEoGVmiSvLcstC5HyUk/RCZcqn+vgiFAuJxBWWo
	EdHlWnIUU+E6xh7d06gfViIrGt4VDk619PqpMN+p550b/GFbehA2rAgvIg8L3Z5G/Cm
	8eKKru+QCFjsQHFklTpaCyHWVwVEoBwf19cNevA5B9IjJFAQ/v3IbIJtu9ZmPYCWunE
	854MkUXIw5et57gmT36wcwLJqRsXavJgFP9dGRMZ0XpWB7UbCJu1fXzaqNcaRYbBAao
	vMFrIZi6sSXF7a/ZEEt+nOwGVpeniKAaRbqPmrIj8PxpGr8TvSPdquQwtjARmUNfBFH
	EyDbRayMsw==
Received: by mx.zohomail.com with SMTPS id 175142581211425.435655253733216;
	Tue, 1 Jul 2025 20:10:12 -0700 (PDT)
Message-ID: <4a9b51f36da2500604f8d1099b0765f1e3764f10.camel@icenowy.me>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,  Icenowy Zheng
 <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Date: Wed, 02 Jul 2025 11:10:02 +0800
In-Reply-To: <20250701201124.812882-4-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
	 <20250701201124.812882-4-paulk@sys-base.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-07-01=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 22:11 +0200=EF=BC=
=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> The CSI1 MCLK clock is reported as "csi-mclk" while it is specific to
> CSI1 as the name of the definition indicates. Fix it in the driver.
>=20
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index d12791b31a9d..86d933d1ac72 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -366,7 +366,7 @@ static const char * const csi_sclk_parents[] =3D {
> "pll-video", "pll-isp" };
> =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(csi_sclk_clk, "csi-sclk",
> csi_sclk_parents,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x134, 16, 4, 24, 3, BIT(31),=
 0);
> =C2=A0
> -static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi-mclk",
> csi_mclk_parents,
> +static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi1-mclk",
> csi_mclk_parents,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x134, 0, 5, 8, 3, BIT(15), 0=
);

Yes, there exists csi0-mclk.

Reviewed-By: Icenowy Zheng <uwu@icenowy.me>

> =C2=A0
> =C2=A0static SUNXI_CCU_M_WITH_GATE(ve_clk, "ve", "pll-ve",


