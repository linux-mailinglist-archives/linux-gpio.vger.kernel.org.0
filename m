Return-Path: <linux-gpio+bounces-23554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE22B0BBEF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 06:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E0C179A7A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 04:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B648D217666;
	Mon, 21 Jul 2025 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="Uvvy++8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FFB190498
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073437; cv=none; b=IchmvCTZk62cqrbD0XI3NpwmCVbb/BV5D1K1CGXLetqgvz9INL6Gp2GiDfnckrHrTg5rKdDX3ifI6yuBLOAX+cc55HSN02cXDfcsC2ywjUmJf49mFhlsAML4iQKNRnhag+t2u0Mp2Sj9p1W/haZsK8+XMnwGYwQ8z5Uo13gB+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073437; c=relaxed/simple;
	bh=9+GedT4iAX7BPa6QoQlxCDrNvaxf9KZLzwRNGrPIl9A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wn/F/qnq9Iq+whpK3At2klciDEcrj99B77x1XOrMsYexby6Ld5mofchjbEA7hzGW1WoPAnS68RhfphDj9fct656ej2anOJBeohxGCX3+ZeTSohJOI6llK3l8Zzl7nopdp23Ex+a02FDzWnCS3U2kjvHxV1suNdcgGV7uo+IwNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=Uvvy++8u; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753073433; bh=9+GedT4iAX7BPa6QoQlxCDrNvaxf9KZLzwRNGrPIl9A=;
	l=1085; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=Uvvy++8uXAZT7wQyLTLKlhWrF4/HJYJuQlkMPGfzfmUnjNa0Iv/+C3bv485JfEIdg
	 hGSF/X8W3fGI96go6sPPazEIcxe8ZZVTX04e8+lJ5aKhW7D2iMIC3SrVQu+oUL+6wu
	 EoszgB7FDfPFRyt/FxJUVmWI819LBz24tb80Fhas=
Received: from unknown (HELO ?192.168.36.110?) (115.23.218.194)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:50:33 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
From: SeonGu Kang <ksk4725@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, SungMin Park <smn1196@coasia.com>, Pankaj Dubey
 <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>, Ravi
 Patel <ravi.patel@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K
 S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:50:34 +0900
In-Reply-To: <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

2025-07-10 (=EB=AA=A9), 09:07 +0200, Krzysztof Kozlowski:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: SeonGu Kang <ksk4725@coasia.com>
> >=20
> > Add basic support for the Axis ARTPEC-8 SoC.
> > This SoC contains four Cortex-A53 CPUs and other several IPs.
> >=20
> > Patches 1 to 10 provide the support for the clock controller,
> > which is similar to other Samsung SoCs.
> >=20
> You should explain here (and in DTS patches or the bindings) the
> hardware, that this is Samsung SoC.
>=20
> You could also explain the differences from Exynos and proposed
> handling
> of patches (because this is odd)
>=20
> Also, entire patchset has wrong and incomplete SoBs. Your SoB is
> missing
> everywhere, others have wrong order.
>=20
> Please read submitting patches first.
>=20

This Custom SoC is owned by the Axis (OEM) and manufactured by the
Samsung (ODM). It has standard Samsung specific IP blocks.
Regarding SoB, sorry I missed to add submitter's signoff. We will take
care in next patch series.

>=20
> Best regards,
> Krzysztof


