Return-Path: <linux-gpio+bounces-24945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC6B346A7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 18:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0E117079A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3030A2FF654;
	Mon, 25 Aug 2025 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ThS3qUoa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25501E32DB;
	Mon, 25 Aug 2025 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137810; cv=none; b=C4UpOx8RB7iN7Xx8JDla73JqeL+Dm7KNHmV301Wm3A29G5H16zd05RvKQAckHw0M0hIJU2ggiVS7KmGtmr7fbKKfianbbm7VzlkKtHN8qTOBFTFSowFt7evyJjDrBMpj4S7y2E0GGbMCDuSKxEJGUdPTgGdGbEiXnMUnQj5gxS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137810; c=relaxed/simple;
	bh=yNYKVB7ejZHvag9mlt4vBKdDNtWCCkBY3PhbjTGPdRk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SuPfz6+IVvfJUgTSximKxa+Q/RBAwuBpX7C+xCO7MdsFIz9T1kGEHJwACcL8YTBgQ8FzsHLv9dpEhCkmBEEDTlGFILTFuvNvDnoT9u93zs3hMAaT4nKasetSUnK4ENL6+ngZt5NERejcu+jcbec9pHKXG8lkGfSLw8IB+CPNjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ThS3qUoa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137806;
	bh=yNYKVB7ejZHvag9mlt4vBKdDNtWCCkBY3PhbjTGPdRk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ThS3qUoaX7eSegoVgtUWcxMbZq7tWTHAX6xAiSMkJu4+yJFjx7OYHWS+8FWzCH9OQ
	 YafPQfcpzdW2iRvTV43ZZOnjD2sSpXfwKTXEnzOhDvtt9VRfFaQxs/zPxK/5S9PqM8
	 jl7GTA8FsemJ4NL3V1wEQCIcTo4ErT9Aunz6NJTm2lDRCJ/OOqn2Apv5DjtdywA7dN
	 j/NUoXwrCm19r6Jvt4hssp3/GTJGLUbSF6R8BW5AxUS+fXSqoFxU2J7B2HWwmli9sv
	 Y2VR1uGnongrkp5618EobR8+03VtVyiy0NIyoldlpiXzHW0+tQP0kC6gkqLQ4pop3z
	 kffGlHDrJymjQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EFED117E08E3;
	Mon, 25 Aug 2025 18:03:24 +0200 (CEST)
Message-ID: <305df15f3fdc1b9b1b1d9b853a859cfd969733c7.camel@collabora.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
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
Date: Mon, 25 Aug 2025 18:03:24 +0200
In-Reply-To: <20250822144224.GA3745327-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
	 <20250822144224.GA3745327-robh@kernel.org>
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

On Fri, 2025-08-22 at 09:42 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:56PM +0200, Julien Massot wrote:
> > Convert the Device Tree binding for MT8183-based boards using the
> > DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> > amplifiers from the legacy .txt format to YAML schema.
> >=20
> > This improves binding validation and removes DT schema warnings
> > for boards using these audio components.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../bindings/sound/mediatek,mt8183_da7219.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 49
> > ++++++++++++++++++++++
> > =C2=A0.../bindings/sound/mt8183-da7219-max98357.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 21 ----------
> > =C2=A02 files changed, 49 insertions(+), 21 deletions(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..b6fee3ff3af9a90820ee57efdf8e
> > fb3f3d474804
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_da7219.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8183 sound card with external codecs
> > +
> > +maintainers:
> > +=C2=A0 - Julien Massot <jmassot@collabora.com>
> > +
> > +description:
> > +=C2=A0 Binding for MediaTek MT8183 SoC-based sound cards with DA7219 a=
s
> > headset codec,
>=20
> Drop 'Binding for '. Otherwise,
>=20
Ack

> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Julien

