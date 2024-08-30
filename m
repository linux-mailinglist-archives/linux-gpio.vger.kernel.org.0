Return-Path: <linux-gpio+bounces-9424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F2965811
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31E361F24DA0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 07:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631341537B1;
	Fri, 30 Aug 2024 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h3rDM9oQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DE14C5A4;
	Fri, 30 Aug 2024 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725001639; cv=none; b=S4ydDcII1dR0bqzt8lqzXAVxeJG6EOxBr05OQWbUgG2xnBsb3mxP3RLeFkR98RiW8qZCdPzFysa9Zv0ggDtrX2Ue3naBC4R2DdrXFeLSWdXVE9A6emEvsHSGmFeVM+uQP7hlxJQkUXPCMZkCOAF6XMD9EUAS4AGe8fBCRP0ek9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725001639; c=relaxed/simple;
	bh=s06I7vpuvh5FtVBBjKOoXNfkaI+hpLm4s5Wd8b/Kvr4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR3sMAMQlZSj7geJlPFEDEUaeHjcrvT9bmKLtRe7gjIhIvlSxP8ZmYCB6ZvI4qGG/17SF0znfGZqTXXEiAJ0FYSdmKS3uwrA//6CpnTNNIG5ENMHICNj+11cjN47bB6/BosmYx6TzxISTqyaCnk1fmPR+KTibknwDtdCgnt0Brg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=h3rDM9oQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725001637; x=1756537637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s06I7vpuvh5FtVBBjKOoXNfkaI+hpLm4s5Wd8b/Kvr4=;
  b=h3rDM9oQEAMRBfur4ePaHVQHKFVQqlZIROz9qpqy1mxxYQc3ddi2WAAI
   omHKX/m1oLlMntRs6bQ6onGEYI0qOb/kzaispXu/THplymD+LfqO5stqU
   NUMSPFCCG4q3Y/KGnh0fLXnyUiZCTzRi3Eku4m0ZOiaM4AXtdVNKgJeer
   LheqX5MhZv7x2VFWagNng1anV5AqEFWO8UL8TXRsTLTRcBlJWo75Or0OE
   wi/V3+MKFyWafMKr9LbgTo2NnpziDK/2NWKbvsHy3QDQSR7L/MOSg5gNO
   yGb7hj9rW8XZBvYcOgD7tKcNMbAq9wBGVGmCPcUW6wKi8B9Exx38zlNxb
   w==;
X-CSE-ConnectionGUID: afjsWAo1T6e0LAk7nB8BvQ==
X-CSE-MsgGUID: dlg29yxyR1yb0jKAvDuxBw==
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="asc'?scan'208";a="262034575"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Aug 2024 00:07:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 30 Aug 2024 00:06:52 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 30 Aug 2024 00:06:49 -0700
Date: Fri, 30 Aug 2024 08:06:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor
 Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>, Meng Zhang
	<zhangmeng.kevin@spacemit.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen
	<cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang
	<jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for
 K1 SoC
Message-ID: <20240830-tidy-identify-90dce7a21abc@wendy>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
 <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="74V6P+syw/CVE4ln"
Content-Disposition: inline
In-Reply-To: <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>

--74V6P+syw/CVE4ln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 07:48:17AM +0800, Chen Wang wrote:
>=20
> On 2024/8/28 19:30, Yixun Lan wrote:
> > Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Changes in v3:
> > - drop spacemit,slew-rate-{enable,disable} property
> > - use drive-strength instead of drive-strength-microamp
> > - fold strong-pull-up into bias-pull-up
> > - format fixed
> > - title fixed
>=20
> Drop this change history here, you can add this in the cover letter.
>=20
> [......]

It's perfectly fine to provide per-patch changelogs fyi, rather than in
the cover letter.

Cheers,
Conor.

--74V6P+syw/CVE4ln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtFvZgAKCRB4tDGHoIJi
0jE6AP4ysqQR2wlhI8N7l61bFcKY3fTl/Rj5qEuiKycVRFY/ZwD/RLfvMHbeQnnX
qxMpIu3EJeAfWS0noJpevIiMjG0r5QI=
=l5Fx
-----END PGP SIGNATURE-----

--74V6P+syw/CVE4ln--

