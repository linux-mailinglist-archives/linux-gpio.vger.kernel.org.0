Return-Path: <linux-gpio+bounces-24622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B5B2DDCC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09151885F5B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C283931DDB5;
	Wed, 20 Aug 2025 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IRLqJa+O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2FB6FBF;
	Wed, 20 Aug 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696624; cv=none; b=tZB+JR6Ql9tS3XAIBD5EYTR3BkodwfgfVAqDGOqGgnx9Q1cgx+7wNQaZ3Ur7TAOUsAWbqzxQIU+40mFmRxRbg+GcpR6/+itpgC2J7mU8aAsUuAGDEAmf6VpbAcrBaXh90Q2QGy8gPPDG/eV2mg+VkGWiFvQyXnPG+eAaWEhrGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696624; c=relaxed/simple;
	bh=EGBjb/TgAhfgPZi5I5T6fapGmQkRehVI7gSw2DickvQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VsDa2ADqkVL/1r2YWaJ7K49DMN7+grDDsQUENfu9rBtACW12vpqZo4CQH3TtuETWkCKeF13nzuQ29mxx9+Zi7IhFxdxAh9yzugiGk6ux9Tzqbpu9RBv+rHSfpZuuJ+DrW+UTSuSD9GVRnte3L/R6GkxcG2HxukH0D4xW+RTezLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IRLqJa+O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696620;
	bh=EGBjb/TgAhfgPZi5I5T6fapGmQkRehVI7gSw2DickvQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IRLqJa+OmrNlzDzXfK+Ji+kDy9yuppw3uqBAL7w5tIxnpR4smT1h+4n3lcmimmqSg
	 mE4NoORV2/3zqNaIajI6VNA69du0SUvkw/i/wggnupZOp/M5ge5YYt+ciFpxREfwJ9
	 OJtcdMFYr7wS7HgqvKVrkm5l1yPgawgent7Xt1OMVdW46z7/iVS0F5aJdgCGP/al/D
	 pzqi5Mx0UQ0XkGyf8YPhTCgtULkb/jK6U0igXJaNTgAurEqaI4Yh3sWFA5Hml23awp
	 QceS6BTaTSRxl7Wbs17lsZXDKBLLnDibhfxh3OkbymI5p/YUOl4p0d4kW1UVWYOIYi
	 UgQfdfsGMI++Q==
Received: from localhost-live.home (2a01cb0892f2d600C8F85CF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C79B717E01F5;
	Wed, 20 Aug 2025 15:30:19 +0200 (CEST)
Message-ID: <3967c5d8df7f72bae859ebc07ce035b1978c12dd.camel@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>,  Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:30:19 +0200
In-Reply-To: <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
	 <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
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

Hi Angelo,

On Mon, 2025-08-04 at 09:59 +0200, AngeloGioacchino Del Regno wrote:
> Il 01/08/25 13:18, Julien Massot ha scritto:
> > Update the mediatek,audsys binding to support the mt8183-audiosys
> > compatible, which uses a different audio controller binding
> > (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0 .../bindings/arm/mediatek/mediatek,audsys.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++++++++++++++-
> > =C2=A0 1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,au=
dsys.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> > index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411=
c5632ae6663d15f29 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt7622-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8167-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8173-audsys
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - mediatek,mt8183-audiosys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8183-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8186-audsys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8192-audsys
> > @@ -41,7 +42,6 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: 1
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0 audio-controller:
> > -=C2=A0=C2=A0=C2=A0 $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: object
> > =C2=A0=20
> > =C2=A0 required:
> > @@ -50,6 +50,21 @@ required:
> > =C2=A0=20
> > =C2=A0 additionalProperties: false
> > =C2=A0=20
> > +allOf:
>=20
> I think you can do it without the allOf here as well.
>=20
> if:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains...
> then:
> =C2=A0=C2=A0 properties
> =C2=A0=C2=A0=C2=A0=C2=A0 ...
> else:
> =C2=A0 ... etc
>=20
> after which
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Indeed allOf is not needed here, will be fixed in v2 and will add your R-B.

Regards,
Julien

