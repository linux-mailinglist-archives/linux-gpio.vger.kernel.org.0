Return-Path: <linux-gpio+bounces-23551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C380FB0BBDC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 06:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625B3179E30
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 04:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0251121FF28;
	Mon, 21 Jul 2025 04:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="tgvv69//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6020C494
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 04:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753072341; cv=none; b=qMBKLibUBuYusX1gdMQ1zYbWXGlED0hjVMCmBmj+IqJgyaSkhJFEezKZ9T95E432j0uFGdVvWu2giXpY2G0Fqb+BZG2YOFjs2NO8FuzUoKx6/P3XpHFnW3xPXzn9iDUweWrd653Bq+OZ4y+ZHL4QwVJP3f1Su61TbYMuXomCik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753072341; c=relaxed/simple;
	bh=fkkRCoPbO262N6nh5T1e3WS51jJoTMENI1DUO2zY2Qs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDpgI2cPcxkuuWCWsy6cY5FDMdT7uJOPiVKbNyUzUYAyDZ32aG6ErxqdmxV3aQRQx+hVA6Xozb15zAMP6QGneOutxkZnFVM8uXbLeBK80SZ87NnIvG3cV8gjPtd5F9ejnDRfgWcwz719D9Eju4UordX3kZgEQtQ/jzkeIKgJErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=tgvv69//; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072336; bh=fkkRCoPbO262N6nh5T1e3WS51jJoTMENI1DUO2zY2Qs=;
	l=1861; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=tgvv69//Fs2/46nT31h2p0wGINamYYhDrCg79CyxUey8MTdRF1HJGc/TKxIYA5Rc0
	 XlNgTsN+sZhzN3g1aJ5a+q8qXiGKCc3wsewQxj5nCw5eyP5Y+xniRugyr7dvH5dIjW
	 tZ4Mxu35CtyS0zkANrBXcO1f39m/BIYPhB2j5YR4=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:32:16 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: hgkim05@coasia.com
X-Original-RCPTTO: linus.walleij@linaro.org,
	ksk4725@coasia.com,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
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
Message-ID: <d8ab3efec0eac72e74cd7864c81c91cd796e3074.camel@coasia.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
From: Hakyeong Kim <hgkim05@coasia.com>
To: Linus Walleij <linus.walleij@linaro.org>, ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, Jongshin Park
 <pjsin865@coasia.com>,  GunWoo Kim <gwk1013@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, SungMin Park <smn1196@coasia.com>,  Pankaj Dubey
 <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>, Ravi
 Patel <ravi.patel@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K
 S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:32:17 +0900
In-Reply-To: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-07-12 at 21:26 +0200, Linus Walleij wrote:
> Hi Hakyeong,
>=20
> thanks for your patch!
>=20
> On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:
>=20
> > Add basic support for the Axis ARTPEC-8 SoC.
> > This SoC contains four Cortex-A53 CPUs and other several IPs.
> >=20
> > Patches 1 to 10 provide the support for the clock controller,
> > which is similar to other Samsung SoCs.
> >=20
> > The remaining patches provide pinctrl support and
> > initial device tree support.
> >=20
> > Hakyeong Kim (9):
> > =C2=A0 dt-bindings: clock: Add ARTPEC-8 CMU bindings
> > =C2=A0 clk: samsung: Add clock PLL support for ARTPEC-8 SoC
> > =C2=A0 clk: samsung: artpec-8: Add initial clock support
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CMU block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_BUS block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CORE block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_FSYS block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_PERI block
>=20
> Out of the 9 patches there are 7 patches related to "CMU" without
> any explanation or even expansion of this acronym.
>=20
> Camera Management Unit? I think I'm not supposed to
> guess. Is is an Axis-custom piece of hardware? (Would make
> sense.)
>=20
> Please expand this acronym and state clearly that (if this
> is a correct assumption) that you are not supplying any
> bindings and even less a driver for the "CMU" thing, just the
> clocks. (That's fine the actual CMU can come later, but
> it should be clear *what* it is.)

Ok, I will add CMU abbreviation on cover-letter and respective patches.

Thanks,
Hakyeong Kim

>=20
> Yours,
> Linus Walleij


