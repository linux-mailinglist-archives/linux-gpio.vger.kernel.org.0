Return-Path: <linux-gpio+bounces-24620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3845B2DDBA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6CE3AA579
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A19D31E0E4;
	Wed, 20 Aug 2025 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BPhghfmM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8823741;
	Wed, 20 Aug 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696447; cv=none; b=LEuEoyA/w/R84FwFCGzZmdigIPJcZnBaLWx04QSb91yuQn+hsAuVfAFmj4Mc1XYUsgIRwqNsxc+sy8PFyx4TUIDhZMaFBmMEhoztU0O1zhozAv2cAgaiOyWmZfDtX0ansNEg3eL0T7YY7bRH60dbNoiJMH91qvIrxPJDoYWnCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696447; c=relaxed/simple;
	bh=Iroe3MCa2ZZaRY9jKe2399kPLRw8TL6vb7UDOEeV6xo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sJZGCF8Z+z48Yzd/Q0PxlAAd55/Cg8jiONMuvjMZQHzHExaiFbeemYux6EkqzoU9GKg4YA0vRrXC7acUjRGj8dgeX3OF4jVExiAI0D62IGkwT5HYXwmm6dgN9Th49nyjoJY/mofr0pG7Js1lthzh9j5eFslR6dGZMRBkKck/kUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BPhghfmM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696443;
	bh=Iroe3MCa2ZZaRY9jKe2399kPLRw8TL6vb7UDOEeV6xo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BPhghfmM17dTR9tU6w/x7QCksTcLIMZmJe9nr6IPzIGw7KNbMFlwN7Vy7Ks4TWEdt
	 +dIh+4Rx64/VObgOsVABZr2GyQDDUTspGLOi7NkBPilc3dQxEETLl89DMf+h2l6v5O
	 iUpiW5Mm/T1gZtNkKllA9wBB+gAuH62JEyCpqmvebiHanOXdSoqw84/RxoPhMIg9nv
	 uIiJhWmnNENJCXvDzCPPw+kJDZz7w3VJoo92oHfL4/AisZfUB6tzoouFMo9wK0m+FL
	 OR6rdIAdm1MFOn6jbjmF/kE6YGuhwXO2+lDjzbqxer5YqNL9MhikIrkrnIH5PkJb0A
	 xaCNRtP8+0pcw==
Received: from localhost-live.home (2a01cb0892f2d600C8f85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D12717E01F5;
	Wed, 20 Aug 2025 15:27:22 +0200 (CEST)
Message-ID: <124e3fbe79660eac9d529b127d888ce6942ba346.camel@collabora.com>
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
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
Date: Wed, 20 Aug 2025 15:27:21 +0200
In-Reply-To: <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
	 <ab97489a-9493-4005-9a1a-9f88ad970b05@collabora.com>
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
> > The mt8183-mfgcfg node uses a power domain in its device tree node.
> > To prevent schema validation warnings, add the optional `power-domains`
> > property to the binding schema for mediatek syscon clocks.
> >=20
> > Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains p=
roperty to mfgcfg")
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> Is MT8183 the only one?
>=20
> if:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek,mt8183=
-mfgcfg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^(if it's not just=
 mt8183, this should be an enum)
>=20
> then:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 power-domains: true
> else:
> =C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 power-domains: false
>=20
> (check if the above is correct, don't blindly trust what I wrote! :P)
>=20
>=20
Verified on my side 'mediatek,mt8183-mfgcfg' is the only one with a power-d=
omain
property.
I will add the if/else and disable the power-domains property for other com=
patible
as suggested.

>=20
> after which:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> (if it's not only mt8183, keep the R-b on this commit regardless)
Thanks,

Julien

