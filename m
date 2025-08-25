Return-Path: <linux-gpio+bounces-24946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D5B346B5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 18:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E2A87A5E3D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D662FF655;
	Mon, 25 Aug 2025 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O3oy07lg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A562FB994;
	Mon, 25 Aug 2025 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137932; cv=none; b=DUmg0RGFkKAcJiehhpWE/fQ+6dm/rTBOq3yDRGwGgTIJTbfO0d3AjEB/QrQ+kouKvScs3/qIMK1ZuoXwS5lZLExQ2HNVEL68PkX9NrdaWt9IS1S2FMHR8Lo0uxgQhg42L1Ia39wUD+g8kpMXlAOZc1bqHMMreFet6XQ99iPQfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137932; c=relaxed/simple;
	bh=MXpFBvl/G9TdM58J/HqLeuWhK7n8weJPpEkm2tmgU/s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LUZnNZb0AbZ4nu8kDfzvbY4zIidzT4qLMC/ht7PVnVelrY7nfXRwcGUxzDEmAH4plB2o/6OR3GFnEc077q8xre26s0uTtwZ9PA6a2+TsNfQmETzlOOMbSxKyVdK9qQPtsGyPEK3gQkYnlCvzmFAJCE3aELmAzuyT++bzZB8uen8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O3oy07lg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137929;
	bh=MXpFBvl/G9TdM58J/HqLeuWhK7n8weJPpEkm2tmgU/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O3oy07lgJtUmddl3ObqfK0Dw2tOSJrtb1veMxs9gJqc7bsM0XH/3uuLH7p8NbyS28
	 sOYokpgZqXpq8Ef5TLcv2wU2fJbnufKcoc8VQaI+c4G2+Uijnvj5lRVtMQWMN86vTK
	 Ce/WkSB2SpjBqC/OQ75c3Pr3Upefjp1H4g0g1C7ns6xLBQgm0bWyb2G5UrzoKjsaKs
	 ds2/C1Z35njmOiwLvV+HV5LjtyKXoDVcw4RiZ3TJA1VsgCqmlgWZ/slNlZUEAoF/Q/
	 2taqVa7VlaMgP+o9Z67fi+AfkWgZy8RbxmetnKPghMOkNBEckyliDL3Zsrgw3732N1
	 YEJyLZFWPlWLg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 218B317E053B;
	Mon, 25 Aug 2025 18:05:28 +0200 (CEST)
Message-ID: <57d67b983f527e9a202422dcc329622cceac6b89.camel@collabora.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
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
Date: Mon, 25 Aug 2025 18:05:27 +0200
In-Reply-To: <20250822144652.GA3763665-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
	 <20250822144652.GA3763665-robh@kernel.org>
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

On Fri, 2025-08-22 at 09:46 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:57PM +0200, Julien Massot wrote:
> > Convert the existing text-based DT binding for MT8183 sound cards
> > using
> > MT6358 and various other codecs to a YAML schema.
>=20
> In the subject (on all the patches), avoid saying 'binding' twice and I=
=20
> prefer 'DT schema' over YAML. Lot's of things are YAML, but only one=20
> thing is DT schema.

Ok, I fixed all the commit messages and replaced 'YAML' by 'DT schema'.

>=20
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../sound/mediatek,mt8183_mt6358_ts3a227.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 59
> > ++++++++++++++++++++++
> > =C2=A0.../sound/mt8183-mt6358-ts3a227-max98357.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 25 ---------
> > =C2=A02 files changed, 59 insertions(+), 25 deletions(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..048fe62715d67d44daa08e75a63c
> > 782238815689
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a2
> > 27.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/sound/mediatek,mt8183_mt6358_ts3a227.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8183 sound card with MT6358, TS3A227, and
> > MAX98357/RT1015 codecs
> > +
> > +maintainers:
> > +=C2=A0 - Julien Massot <julien.massot@collabora.com>
> > +
> > +description:
> > +=C2=A0 Binding for MediaTek MT8183 SoC-based sound cards using the MT6=
358
> > codec,
>=20
> Drop 'Binding for '.
>=20
> Sure
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> And thank you for jumping on all these Mediatek bindings.
>=20
> Rob
No problem, Thanks for your time.

Regards,
Julien

