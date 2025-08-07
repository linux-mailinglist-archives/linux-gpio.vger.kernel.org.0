Return-Path: <linux-gpio+bounces-24066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E13B1DABE
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 17:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA34189DCCB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 15:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F32269D11;
	Thu,  7 Aug 2025 15:25:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89561265621;
	Thu,  7 Aug 2025 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580312; cv=none; b=vAhnRMcOwQb1fm1Ux4DYMwDiMfE+dPOPLnWSHRbn11UE1IEDAX0qXqqbHYxhNKrEVAK6o17Kuxq4xSUpuDSccDaHoshlGp+h7MZjfrSZe9JCt7DelrnXmK136oEpP9R9MSrLiPE8TfM9eWZEPowUHH95WCYLiRt3fFOH0dZVhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580312; c=relaxed/simple;
	bh=3Po1l4gYu0MHsFuaauDmTk7PLri0Rg6elR2hBPzCJbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqP1WId8UQ895mxYI+efdXcK35TTVLLB7k38fAe2sa69j05Ntf/+BPf/hsdGrolK4tCKzR1eIhF8jPFfQHlqSCfaosQKUfGbYw+8iqnzkzqgfpPnLfiQKLv1IPX5QA3wSYBG19lR1mfmW0GRm3CLmMoFcHfOr9eSprRMen5Pm5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E4B101F0004D;
	Thu,  7 Aug 2025 15:24:50 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 92D47B012AF; Thu,  7 Aug 2025 15:24:47 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 92918B012AF;
	Thu,  7 Aug 2025 15:24:44 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:24:41 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 07/22] dt-bindings: vendor-prefixes: Shenzhen Baijie
 Technology
Message-ID: <aJTFOV_MK4GftLWu@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ho7mfi0SoROEEEAS"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>


--ho7mfi0SoROEEEAS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> Add entry for Shenzhen Baijie Technology (https://szbaijie.com)
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..81cbc8b6b195 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1466,6 +1466,8 @@ patternProperties:
>    "^synopsys,.*":
>      description: Synopsys, Inc. (deprecated, use snps)
>      deprecated: true
> +  "^szbaijie,.*":

It's quite common for Chinese companies to have their main location as a pr=
efix
in their name, for example Rockchip's full name is Fuzhou Rockchip Electron=
ics
Co., Ltd.

Since the company here calls itself "Baijie Technology" I think the "sz" pa=
rt
should be dropped from the vendor prefix and just be "baijie,.*".

All the best,

Paul

> +    description: Shenzhen Baijie Technology Co., Ltd.
>    "^tbs,.*":
>      description: TBS Technologies
>    "^tbs-biometrics,.*":
>=20
> --=20
> 2.39.5
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--ho7mfi0SoROEEEAS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxTkACgkQhP3B6o/u
lQwopA/+OeQYWbpgzDlU7JSXZXYWbcSY72g6g2qNUV8nGT5ut5lkOdPpDbag40ll
kW45uiqEwvjAqNjfNv2jP1oIIZJ/OzRfJ+5rFc0e5iskSa4bd8NOv8AHZMF0ibL6
Qc9N+qH1HdFiL/7e0btMZKjWTPTyoBqSLN2oJbEPrI14E/YyOpnmi0FQwP9tSBvD
GJHPXfijHfK/JJnlIV70cJSUugUvmcLzpy3JxoiuW8PModhutaIYXdZiyDsqWxBK
d+kxznL9QDfnY1qtQkse38eigagjwswfQXmSjTAXXNTFl+sQXFsKoxDZ21HBgd7X
3rwxa/hqesqIe6EPAs5xDQi6F2BOBa+ZLzLnjqmlj5FEZttLx/c8IePLqPHlKcg2
ycEsXE4XE0hpqs676aUwb/xVjVXbchBriZYX9ftKokBhRw/8AkRAUE6O4RNS4sGR
X+rhGpoaFKBiI2kcu1aF7cAjv6BhYfOhs9d6wFVfF0dDVsC2Cf+9pBMysCc0zSXX
/OLwkZj3sucRQHpNV5ZVsSQqR/ZUlae8K4INMLaMZFt97nW4EyCaHdmHlHrM7A7D
dp3NaIPkts0QyUswwDFY0Ahn/dqLKRxCVlUBix05YuGy0gbfigILHXxcERddkoyq
SG3VlZcyst6/ryITN66ZxWnPBrhxVFGN1NheSCPPe6E93GYPfuc=
=jRKT
-----END PGP SIGNATURE-----

--ho7mfi0SoROEEEAS--

