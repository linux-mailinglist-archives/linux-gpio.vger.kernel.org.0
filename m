Return-Path: <linux-gpio+bounces-24022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11CB1C212
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 10:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AACFE3BB812
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DD92248B3;
	Wed,  6 Aug 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gEmTUuxm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13757221567
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468543; cv=none; b=WfWETrW2IS99hSlPi/3EnFp/swoUilXblyxOEG7W/c4CyCHTFzZ6rIhp6EaaSSNQ/7CUSy9H7wxxBNhlDGVsaVVMApg35Em4fPTT0viJtzISCYB8J9j61VCcc7qTg8jhrJkBDVjLejxI1KQVgkoP9cc4o29K5NO7dsj121js2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468543; c=relaxed/simple;
	bh=m7sqR9B0NN86kX0PoItCJADw/zIvrr2/IE+k7Ve7aao=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cLNYqwJRf1jM+oqVhpQ8RuAYRqoyH+NzHsDMNluxRH9dJolWLb4j5kxURlCXwhb9BfPXtwIuzYxq7r6QF7J+qM8yHCmloKJNPdpSbfKCvDzISPqgtsaYMZFi4tXYYWFc5wmwU8jqdsObAVTXG6rlxyYqUGqTrLrFLWUN77W9/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gEmTUuxm; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250806082219epoutp01ebeb1c599543d42257851d33ff9c9558~ZH9c8wvNP2636126361epoutp01M
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 08:22:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250806082219epoutp01ebeb1c599543d42257851d33ff9c9558~ZH9c8wvNP2636126361epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754468539;
	bh=m7sqR9B0NN86kX0PoItCJADw/zIvrr2/IE+k7Ve7aao=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=gEmTUuxmCfuWXNYVyJZg2seg6+c/BelnYnxR4CcGOhNf17X7Hue/dVeyWjq4tx8xE
	 2tvbG55Uw39nHba6Ar3DhTzhReZ/rWsaxONqjFRVJGEJ/ahww82P+ZQDLQTV8jVhlW
	 x86fXNbvlvlPvKNqe1PXIUWR/jDTszJgLSl1WU7w=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250806082218epcas5p33aecd08f1649afbc6048ea4b3067297c~ZH9b645E70885208852epcas5p3z;
	Wed,  6 Aug 2025 08:22:18 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bxjvX6p3sz2SSKY; Wed,  6 Aug
	2025 08:22:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250806082216epcas5p2976661d5f4c9a10835fe831e97cf7fd1~ZH9aWh2GV0281802818epcas5p2V;
	Wed,  6 Aug 2025 08:22:16 +0000 (GMT)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250806082211epsmtip1d80097c73b45e759d745e4b959969147~ZH9V88NzW1683116831epsmtip1R;
	Wed,  6 Aug 2025 08:22:11 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'SeonGu Kang'"
	<ksk4725@coasia.com>, "'Jesper Nilsson'" <jesper.nilsson@axis.com>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Linus
 Walleij'" <linus.walleij@linaro.org>, "'Tomasz Figa'"
	<tomasz.figa@gmail.com>, "'Catalin Marinas'" <catalin.marinas@arm.com>,
	"'Will Deacon'" <will@kernel.org>, "'Arnd Bergmann'" <arnd@arndb.de>
Cc: "'kenkim'" <kenkim@coasia.com>, "'Jongshin Park'" <pjsin865@coasia.com>,
	"'GunWoo	Kim'" <gwk1013@coasia.com>, "'HaGyeong Kim'" <hgkim05@coasia.com>,
	"'GyoungBo Min'" <mingyoungbo@coasia.com>, "'SungMin Park'"
	<smn1196@coasia.com>, "'Shradha Todi'" <shradha.t@samsung.com>, "'Ravi
 Patel'" <ravi.patel@samsung.com>, "'Inbaraj E'" <inbaraj.e@samsung.com>,
	"'Swathi K S'" <swathi.ks@samsung.com>, "'Hrishikesh'"
	<hrishikesh.d@samsung.com>, "'Dongjin Yang'" <dj76.yang@samsung.com>, "'Sang
 Min Kim'" <hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
Subject: RE: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Date: Wed, 6 Aug 2025 13:52:10 +0530
Message-ID: <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKXZrJuAgeQag4A83Fv2QHBXkcOtL/uTdA=
Content-Language: en-us
X-CMS-MailID: 20250806082216epcas5p2976661d5f4c9a10835fe831e97cf7fd1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
	<bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
	<CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
	<99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, July 21, 2025 12:10 PM
> To: SeonGu Kang <ksk4725=40coasia.com>; Jesper Nilsson
> <jesper.nilsson=40axis.com>; Michael Turquette <mturquette=40baylibre.com=
>;
> Stephen Boyd <sboyd=40kernel.org>; Rob Herring <robh=40kernel.org>;
> Krzysztof Kozlowski <krzk+dt=40kernel.org>; Conor Dooley
> <conor+dt=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>;
> Chanwoo Choi <cw00.choi=40samsung.com>; Alim Akhtar
> <alim.akhtar=40samsung.com>; Linus Walleij <linus.walleij=40linaro.org>;
> Tomasz Figa <tomasz.figa=40gmail.com>; Catalin Marinas
> <catalin.marinas=40arm.com>; Will Deacon <will=40kernel.org>; Arnd Bergma=
nn
> <arnd=40arndb.de>
> Cc: kenkim <kenkim=40coasia.com>; Jongshin Park <pjsin865=40coasia.com>;
> GunWoo Kim <gwk1013=40coasia.com>; HaGyeong Kim
> <hgkim05=40coasia.com>; GyoungBo Min <mingyoungbo=40coasia.com>;
> SungMin Park <smn1196=40coasia.com>; Pankaj Dubey
> <pankaj.dubey=40samsung.com>; Shradha Todi <shradha.t=40samsung.com>;
> Ravi Patel <ravi.patel=40samsung.com>; Inbaraj E <inbaraj.e=40samsung.com=
>;
> Swathi K S <swathi.ks=40samsung.com>; Hrishikesh
> <hrishikesh.d=40samsung.com>; Dongjin Yang <dj76.yang=40samsung.com>;
> Sang Min Kim <hypmean.kim=40samsung.com>; linux-kernel=40vger.kernel.org;
> linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.o=
rg;
> linux-arm-kernel=40axis.com; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org; soc=40lists.l=
inux.dev
> Subject: Re: =5BPATCH 00/16=5D Add support for the Axis ARTPEC-8 SoC
>=20
> On 21/07/2025 06:50, SeonGu Kang wrote:
> > 2025-07-10 (=EB=AA=A9),=2009:07=20+0200,=20Krzysztof=20Kozlowski:=0D=0A=
>=20>>=20On=2010/07/2025=2002:20,=20ksk4725=40coasia.com=20wrote:=0D=0A>=20=
>>>=20From:=20SeonGu=20Kang=20<ksk4725=40coasia.com>=0D=0A>=20>>>=0D=0A>=20=
>>>=20Add=20basic=20support=20for=20the=20Axis=20ARTPEC-8=20SoC.=0D=0A>=20>=
>>=20This=20SoC=20contains=20four=20Cortex-A53=20CPUs=20and=20other=20sever=
al=20IPs.=0D=0A>=20>>>=0D=0A>=20>>>=20Patches=201=20to=2010=20provide=20the=
=20support=20for=20the=20clock=20controller,=20which=0D=0A>=20>>>=20is=20si=
milar=20to=20other=20Samsung=20SoCs.=0D=0A>=20>>>=0D=0A>=20>>=20You=20shoul=
d=20explain=20here=20(and=20in=20DTS=20patches=20or=20the=20bindings)=20the=
=0D=0A>=20>>=20hardware,=20that=20this=20is=20Samsung=20SoC.=0D=0A>=20>>=0D=
=0A>=20>>=20You=20could=20also=20explain=20the=20differences=20from=20Exyno=
s=20and=20proposed=0D=0A>=20>>=20handling=20of=20patches=20(because=20this=
=20is=20odd)=0D=0A>=20>>=0D=0A>=20>>=20Also,=20entire=20patchset=20has=20wr=
ong=20and=20incomplete=20SoBs.=20Your=20SoB=20is=0D=0A>=20>>=20missing=20ev=
erywhere,=20others=20have=20wrong=20order.=0D=0A>=20>>=0D=0A>=20>>=20Please=
=20read=20submitting=20patches=20first.=0D=0A>=20>>=0D=0A>=20>=0D=0A>=20>=
=20This=20Custom=20SoC=20is=20owned=20by=20the=20Axis=20(OEM)=20and=20manuf=
actured=20by=20the=0D=0A>=20>=20Samsung=20(ODM).=20It=20has=20standard=20Sa=
msung=20specific=20IP=20blocks.=0D=0A>=20=0D=0A>=20=0D=0A>=20It=20is=20desi=
gned=20by=20Samsung.=20It=20is=20Samsung=20SoC.=0D=0A>=20=0D=0A>=20Anyway,=
=20don't=20explain=20to=20me,=20but=20in=20your=20patchset.=0D=0A=0D=0AHi=
=20Krzysztof,=0D=0A=0D=0AThank=20you=20for=20your=20review=20comments=20on=
=20the=20ARTPEC-8=20platform=20patches.=0D=0AI'd=20like=20to=20add=20more=
=20context=20about=20the=20ARTPEC-8=20SoC=20to=20help=20clarify=20its=0D=0A=
relationship=20with=20Exynos.=0D=0A=0D=0AHere=20are=20the=20key=20details=
=20about=20ARTPEC-8:=0D=0A=20=20=20-=20Manufactured=20by=20Samsung=20Foundr=
y=0D=0A=20=20=20-=20SoC=20architecture=20is=20owned=20by=20Axis=20Communica=
tions=0D=0A=09-=20On=20similar=20model=20as=20Tesla's=20FSD=20chip=20owned=
=20by=20Tesla=20and=20=0D=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20manuf=
actured=20and=20=20by=20Samsung=0D=0A=20=20=20-=20IPs=20from=20both=20Samsu=
ng=20and=20Axis=20Communications=0D=0A=0D=0ASamsung-provided=20IPs:=0D=0A=
=20=20-=20UART=0D=0A=20=20-=20Ethernet=20(Vendor:=20Synopsys)=0D=0A=20=20=
=20=20=20=20=20-=20Same=20IP=20has=20been=20integrated=20as=20integrated=20=
in=20FSD=20Chip=0D=0A=20=20-=20SDIO=0D=0A=20=20-=20SPI=0D=0A=20=20-=20HSI2C=
=0D=0A=20=20-=20I2S=0D=0A=20=20-=20CMU=20(Clock=20Management=20Unit)=0D=0A=
=20=20=20=20=20=20=20Follows=20same=20CMU=20HW=20architecture=20as=20Exynos=
=20SoC=20have=0D=0A=20=20-=20Pinctrl=20(GPIO)=0D=0A=20=20-=20PCIe=20(Vendor=
:=20Synopsys)=0D=0A=20=20=20=20=20=20=20Though=20Exynos,=20FSD,=20ARTPEC=20=
have=20same=20DesignWare=20Controller,=20=0D=0A=20=20=20=20=20=20=20the=20g=
lue/wrapper=20layer=20around=20DWC=20Core=20has=20differences=20across=0D=
=0A=20=20=20=20=20=20=20these=20SoCs.=20All=20manufactured=20by=20Samsung,=
=20but=20differences=20are=20there=0D=0A=20=20=20=20=20=20=20in=20HW=20desi=
gn=20and=20for=20different=20products.=20For=20the=20same=20reason=20PCIe=
=20patch=0D=0A=20=20=20=20=20=20=20refactoring=20effort=20is=20being=20put=
=20by=20us=20=5B1=5D=20to=20streamline=20single=20Exynos=20driver=0D=0A=20=
=20=20=20=20=20=20which=20can=20support=20all=20Samsung=20manufactured=20So=
Cs=20having=20DWC=20PCIe=20controller.=0D=0A=20=20=20=20=20=20=5B1=5D:=20ht=
tps://patchwork.ozlabs.org/project/linux-pci/patch/20250625165229.3458-2-sh=
radha.t=40samsung.com/=0D=0A=0D=0AAxis-provided=20IPs:=0D=0A=20=20=20=20-=
=20VIP=20(Image=20Sensor=20Processing=20IP)=0D=0A=20=20=20=20-=20VPP=20(Vid=
eo=20Post=20Processing)=0D=0A=20=20=20=20-=20GPU=0D=0A=20=20=20=20-=20CDC=
=20(Video=20Encoder)=0D=0A=0D=0AAs=20part=20of=20the=20upstreaming=20effort=
,=20Samsung=20and=20Coasia=20(DSP)=20team=20will=20work=20together=0D=0Ato=
=20upstream=20basic=20SoC=20support=20and=20Samsung=20IPs=20support.=0D=0AT=
he=20Axis=20team=20will=20be=20the=20primary=20maintainer=20for=20the=20ART=
PEC-8=20SoC=20codebase.=0D=0A=0D=0AGiven=20that=20ARTPEC-8=20is=20a=20disti=
nct=20SoC=20with=20its=20own=20set=20of=20IPs,=20we=20believe=20it's=20reas=
onable=0D=0Ato=20create=20a=20separate=20directory=20for=20it,=20similar=20=
to=20FSD.=0D=0A=0D=0AWe=20will=20remove=20Samsung=20and=20Coasia=20teams=20=
from=20the=20maintainers=20list=20in=20v2=20and=20only=0D=0AAxis=20team=20w=
ill=20be=20maintainer.=0D=0A=0D=0AMaintainer=20list=20for=20previous=20gene=
ration=20of=20Axis=20chips=20(ARM=20based)=20is=20already=20present,=0D=0As=
o=20this=20will=20be=20merged=20into=20that.=0D=0A=0D=0APlease=20let=20us=
=20know=20if=20this=20explanation=20addresses=20your=20concerns.=20=0D=0AWe=
'll=20update=20the=20commit=20message=20and=20cover=20letter=20accordingly.=
=0D=0A=0D=0AThanks,=0D=0APankaj=20Dubey=0D=0A=0D=0A>=20=0D=0A>=20Best=20reg=
ards,=0D=0A>=20Krzysztof=0D=0A=0D=0A

