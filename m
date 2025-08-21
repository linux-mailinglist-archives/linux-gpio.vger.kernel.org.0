Return-Path: <linux-gpio+bounces-24719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9FB2F288
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B50495E428A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793242D2381;
	Thu, 21 Aug 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UNNSDlpj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3A29A303;
	Thu, 21 Aug 2025 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765532; cv=none; b=hauTx7Ynb2j8amQwrx7gobxU/oxHKaHYodnV99VDxtI6midLiqzpivRQEIwoHf8S5wNiteWmY5E1INr7aBzsmtJ05XlJXRAnqZhAOAOS0EBP99h3iZkTcvxHXW4jMBbAOr49Eqoo7UYBtckHHalgz30mQ3PIFT4EqNo3tigkh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765532; c=relaxed/simple;
	bh=OOWbc93NNAvuoFHJIERvL2ni0Hh4WX8rxmSVcRBWSh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WPfzjX6wKkJrf0DLNirC7fmZyDwCZtZkeq7gc8Oz4JUvYz6o2fdUPr+4y5tgdxcfWMU/+7SKt7j1FHE9q7x0pwSAD1ou8E1uNEFTRVIWcoZApNISyn6uiY0EGAPIHUMAlkmdJrUShnyFhVSdB8bIXx/4r9QmiPn9YO6aUkINZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UNNSDlpj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755765528;
	bh=OOWbc93NNAvuoFHJIERvL2ni0Hh4WX8rxmSVcRBWSh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UNNSDlpjULRYhhubgyBlL3uOvOZTQmSqPOv2MHax1e1KRJ+2nv98syzqmrv6NZaFI
	 ew7WR8HtaioqREui4tfTOLNyfdHkExd7J2MWERwm9fix6D4Yb7wQXduX7SWIAqg8UY
	 mwk3EISANgsXq/dfh6J76UGV1FiYryAIkNMh7w2kLN+gNNkxtHXy/Sh0AF6iaOhCgV
	 OSffjmCunuEHnVAQmQ81fFFEqoDytDBrz9adhKQFrmh/uVp1TQAg0iQdQ6L93BSgRm
	 EQ8c1LE2Eb1YwT+uTausgVfHy1MEVfLt20KvB28Zaw0blRjONprF1wgajZb26iDZxJ
	 YLYdrr4VkAu5w==
Received: from localhost-live.home (2a01cb0892f2D600c8F85CF092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B55E17E0C8C;
	Thu, 21 Aug 2025 10:38:46 +0200 (CEST)
Message-ID: <6491baf3e08454f2ea042934f9f781cf21cbf4d7.camel@collabora.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
From: Julien Massot <julien.massot@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>,  Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Thu, 21 Aug 2025 10:38:46 +0200
In-Reply-To: <376a8f00-e803-4ab1-a54e-6535e41ebaee@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
	 <20250821-whimsical-mustang-of-champagne-ca7a7d@kuoka>
	 <376a8f00-e803-4ab1-a54e-6535e41ebaee@kernel.org>
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

Hi Krzysztof,=20

Thanks for the review
On Thu, 2025-08-21 at 09:30 +0200, Krzysztof Kozlowski wrote:
> On 21/08/2025 09:16, Krzysztof Kozlowski wrote:
> > On Wed, Aug 20, 2025 at 03:44:52PM +0200, Julien Massot wrote:
> > > The mt8183-mfgcfg node uses a power domain in its device tree node.
> > > To prevent schema validation warnings, add the optional `power-domain=
s`
> > > property to the binding schema for mediatek syscon clocks.
> > >=20
> > > Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains=
 property to mfgcfg")
> >=20
> > Checkpatch complains here, but more important - where is explanation of
> > dropped tag?

Right the proper tag is=20
Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains prope=
rity to mfgcfg")

> >=20
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> >=20
> > But this tag appeared? It wasn't even given!
> >=20
> > You remove public tags and add tags never given on the lists.
>=20
> I found Angelo's tag, but still dropping other acks is not explained.
>=20
Regarding the tags: in v2 the patch changed quite a lot after I applied
Angelo's suggestion, so I decided to drop Rob=E2=80=99s Acked-by as it no l=
onger
applies to the new version. I should have explained this in the changelog.

Regards,
Julien

