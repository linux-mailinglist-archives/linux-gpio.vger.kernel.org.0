Return-Path: <linux-gpio+bounces-24024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC9B1C2E4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 11:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA61E18843A5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 09:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE87328A3FA;
	Wed,  6 Aug 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QmmqLi7W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05CA289803
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471167; cv=none; b=nV5qZ5di+K7AGtNswXb/Kk2yhj3yaiC6X9Snfv5IGMy2Bi+HiOTYlo0APHpVVpSw3NmNP+pQkmmtaPdvOb/y6xLYskCNJuLhOUqEbRYxEfCckzSiMiQoeeK0jLyic+wVKefFGV10dMwigLvFSAhTN9r5+EfNTQ8DfLlFzZu+S7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471167; c=relaxed/simple;
	bh=2kjN0WXjQ+abroDwu3IkRXcVSIHYlVmVxJGaa7M+rxE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Me5tGZ0CRhEGrE8c2L481bKvOiltet9lusajq4ASF7yx05tA3QQxp8KiTtDAD3KdkGfJMB6i0sky4RKD+p3p+wsb7RainH5zPL3rHrWpuJiJPS8mGZTRZlNKBEfBafGwZi3zKuPK88xe5vO0CvU3Zbj55kR9K4AZyBvK0VSG658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QmmqLi7W; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250806090603epoutp022451502c0e187dbc7d9ed1a9703d471b~ZIjovtj5Y0667906679epoutp02f
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 09:06:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250806090603epoutp022451502c0e187dbc7d9ed1a9703d471b~ZIjovtj5Y0667906679epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754471163;
	bh=2kjN0WXjQ+abroDwu3IkRXcVSIHYlVmVxJGaa7M+rxE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QmmqLi7WTZepbC3hS7tIbDfIcZ5x7HrxFLABXkjgZujrtuCz3uTcbXC26ezVc3mAJ
	 uCM+raWaT0gvmOjiNrSHzKQuSE0niziAPl4aR/NOsfoP15q7sylz5eJosTE/w/Smgs
	 qTcAH3jiZovZ7r2wnck0RUYR7rK7rgEjzlkJNqCo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250806090602epcas5p3f259b73e21eaf60e98ab963e0d3408fe~ZIjn6GwD20841708417epcas5p3o;
	Wed,  6 Aug 2025 09:06:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bxkt10jRgz2SSKY; Wed,  6 Aug
	2025 09:06:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250806090600epcas5p4f806e2b8c814408b0c3f63c589103a22~ZIjmTb2_P1330613306epcas5p42;
	Wed,  6 Aug 2025 09:06:00 +0000 (GMT)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250806090555epsmtip1e73bd6bd1f867636fd2b91ba1c43b5df~ZIjh4HQ130727407274epsmtip1e;
	Wed,  6 Aug 2025 09:05:55 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'SeonGu Kang'"
	<ksk4725@coasia.com>, "'Jesper Nilsson'" <jesper.nilsson@axis.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim	Akhtar'" <alim.akhtar@samsung.com>, "'Linus
 Walleij'" <linus.walleij@linaro.org>, "'Tomasz Figa'"
	<tomasz.figa@gmail.com>, "'Catalin	Marinas'" <catalin.marinas@arm.com>,
	"'Will Deacon'" <will@kernel.org>, "'Arnd	Bergmann'" <arnd@arndb.de>
Cc: "'kenkim'" <kenkim@coasia.com>, "'Jongshin Park'" <pjsin865@coasia.com>,
	"'GunWoo Kim'" <gwk1013@coasia.com>, "'HaGyeong Kim'" <hgkim05@coasia.com>,
	"'GyoungBo Min'" <mingyoungbo@coasia.com>, "'SungMin Park'"
	<smn1196@coasia.com>, "'Shradha Todi'" <shradha.t@samsung.com>, "'Ravi
 Patel'" <ravi.patel@samsung.com>, "'Inbaraj E'" <inbaraj.e@samsung.com>,
	"'Swathi K S'" <swathi.ks@samsung.com>, "'Hrishikesh'"
	<hrishikesh.d@samsung.com>, "'Dongjin	Yang'" <dj76.yang@samsung.com>, "'Sang
 Min Kim'" <hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
Subject: RE: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Date: Wed, 6 Aug 2025 14:35:54 +0530
Message-ID: <002001dc06b1$540dc980$fc295c80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgKXZrJuAgeQag4A83Fv2QHBXkcOAZGX7yoCWvFQX7SgkxXA
Content-Language: en-us
X-CMS-MailID: 20250806090600epcas5p4f806e2b8c814408b0c3f63c589103a22
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
	<000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
	<e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>

> Subject: Re: =5BPATCH 00/16=5D Add support for the Axis ARTPEC-8 SoC
>=20
> On 06/08/2025 10:22, Pankaj Dubey wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Monday, July 21, 2025 12:10 PM
> >> To: SeonGu Kang <ksk4725=40coasia.com>; Jesper Nilsson
> >> <jesper.nilsson=40axis.com>; Michael Turquette
> <mturquette=40baylibre.com>;
> >> Stephen Boyd <sboyd=40kernel.org>; Rob Herring <robh=40kernel.org>;
> >> Krzysztof Kozlowski <krzk+dt=40kernel.org>; Conor Dooley
> >> <conor+dt=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>;
> >> Chanwoo Choi <cw00.choi=40samsung.com>; Alim Akhtar
> >> <alim.akhtar=40samsung.com>; Linus Walleij <linus.walleij=40linaro.org=
>;
> >> Tomasz Figa <tomasz.figa=40gmail.com>; Catalin Marinas
> >> <catalin.marinas=40arm.com>; Will Deacon <will=40kernel.org>; Arnd
> Bergmann
> >> <arnd=40arndb.de>
> >> Cc: kenkim <kenkim=40coasia.com>; Jongshin Park <pjsin865=40coasia.com=
>;
> >> GunWoo Kim <gwk1013=40coasia.com>; HaGyeong Kim
> >> <hgkim05=40coasia.com>; GyoungBo Min <mingyoungbo=40coasia.com>;
> >> SungMin Park <smn1196=40coasia.com>; Pankaj Dubey
> >> <pankaj.dubey=40samsung.com>; Shradha Todi
> <shradha.t=40samsung.com>;
> >> Ravi Patel <ravi.patel=40samsung.com>; Inbaraj E
> <inbaraj.e=40samsung.com>;
> >> Swathi K S <swathi.ks=40samsung.com>; Hrishikesh
> >> <hrishikesh.d=40samsung.com>; Dongjin Yang <dj76.yang=40samsung.com>;
> >> Sang Min Kim <hypmean.kim=40samsung.com>; linux-
> kernel=40vger.kernel.org;
> >> linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org;
> >> linux-arm-kernel=40axis.com; linux-clk=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> soc=40lists.linux.dev
> >> Subject: Re: =5BPATCH 00/16=5D Add support for the Axis ARTPEC-8 SoC
> >>
> >> On 21/07/2025 06:50, SeonGu Kang wrote:
> >>> 2025-07-10 (=EB=AA=A9),=2009:07=20+0200,=20Krzysztof=20Kozlowski:=0D=
=0A>=20>>>>=20On=2010/07/2025=2002:20,=20ksk4725=40coasia.com=20wrote:=0D=
=0A>=20>>>>>=20From:=20SeonGu=20Kang=20<ksk4725=40coasia.com>=0D=0A>=20>>>>=
>=0D=0A>=20>>>>>=20Add=20basic=20support=20for=20the=20Axis=20ARTPEC-8=20So=
C.=0D=0A>=20>>>>>=20This=20SoC=20contains=20four=20Cortex-A53=20CPUs=20and=
=20other=20several=20IPs.=0D=0A>=20>>>>>=0D=0A>=20>>>>>=20Patches=201=20to=
=2010=20provide=20the=20support=20for=20the=20clock=20controller,=20which=
=0D=0A>=20>>>>>=20is=20similar=20to=20other=20Samsung=20SoCs.=0D=0A>=20>>>>=
>=0D=0A>=20>>>>=20You=20should=20explain=20here=20(and=20in=20DTS=20patches=
=20or=20the=20bindings)=20the=0D=0A>=20>>>>=20hardware,=20that=20this=20is=
=20Samsung=20SoC.=0D=0A>=20>>>>=0D=0A>=20>>>>=20You=20could=20also=20explai=
n=20the=20differences=20from=20Exynos=20and=20proposed=0D=0A>=20>>>>=20hand=
ling=20of=20patches=20(because=20this=20is=20odd)=0D=0A>=20>>>>=0D=0A>=20>>=
>>=20Also,=20entire=20patchset=20has=20wrong=20and=20incomplete=20SoBs.=20Y=
our=20SoB=20is=0D=0A>=20>>>>=20missing=20everywhere,=20others=20have=20wron=
g=20order.=0D=0A>=20>>>>=0D=0A>=20>>>>=20Please=20read=20submitting=20patch=
es=20first.=0D=0A>=20>>>>=0D=0A>=20>>>=0D=0A>=20>>>=20This=20Custom=20SoC=
=20is=20owned=20by=20the=20Axis=20(OEM)=20and=20manufactured=20by=20the=0D=
=0A>=20>>>=20Samsung=20(ODM).=20It=20has=20standard=20Samsung=20specific=20=
IP=20blocks.=0D=0A>=20>>=0D=0A>=20>>=0D=0A>=20>>=20It=20is=20designed=20by=
=20Samsung.=20It=20is=20Samsung=20SoC.=0D=0A>=20>>=0D=0A>=20>>=20Anyway,=20=
don't=20explain=20to=20me,=20but=20in=20your=20patchset.=0D=0A>=20>=0D=0A>=
=20>=20Hi=20Krzysztof,=0D=0A>=20>=0D=0A>=20>=20Thank=20you=20for=20your=20r=
eview=20comments=20on=20the=20ARTPEC-8=20platform=20patches.=0D=0A>=20>=20I=
'd=20like=20to=20add=20more=20context=20about=20the=20ARTPEC-8=20SoC=20to=
=20help=20clarify=20its=0D=0A>=20>=20relationship=20with=20Exynos.=0D=0A>=
=20>=0D=0A>=20>=20Here=20are=20the=20key=20details=20about=20ARTPEC-8:=0D=
=0A>=20>=20=20=20=20-=20Manufactured=20by=20Samsung=20Foundry=0D=0A>=20>=20=
=20=20=20-=20SoC=20architecture=20is=20owned=20by=20Axis=20Communications=
=0D=0A>=20>=20=09-=20On=20similar=20model=20as=20Tesla's=20FSD=20chip=20own=
ed=20by=20Tesla=20and=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20manufactured=20and=20=20by=20Samsung=0D=0A>=20>=20=20=20=20-=20IPs=20fro=
m=20both=20Samsung=20and=20Axis=20Communications=0D=0A>=20>=0D=0A>=20>=20Sa=
msung-provided=20IPs:=0D=0A>=20>=20=20=20-=20UART=0D=0A>=20>=20=20=20-=20Et=
hernet=20(Vendor:=20Synopsys)=0D=0A>=20>=20=20=20=20=20=20=20=20-=20Same=20=
IP=20has=20been=20integrated=20as=20integrated=20in=20FSD=20Chip=0D=0A>=20>=
=20=20=20-=20SDIO=0D=0A>=20>=20=20=20-=20SPI=0D=0A>=20>=20=20=20-=20HSI2C=
=0D=0A>=20>=20=20=20-=20I2S=0D=0A>=20>=20=20=20-=20CMU=20(Clock=20Managemen=
t=20Unit)=0D=0A>=20>=20=20=20=20=20=20=20=20Follows=20same=20CMU=20HW=20arc=
hitecture=20as=20Exynos=20SoC=20have=0D=0A>=20>=20=20=20-=20Pinctrl=20(GPIO=
)=0D=0A>=20>=20=20=20-=20PCIe=20(Vendor:=20Synopsys)=0D=0A>=20>=20=20=20=20=
=20=20=20=20Though=20Exynos,=20FSD,=20ARTPEC=20have=20same=20DesignWare=20C=
ontroller,=0D=0A>=20>=20=20=20=20=20=20=20=20the=20glue/wrapper=20layer=20a=
round=20DWC=20Core=20has=20differences=20across=0D=0A>=20>=20=20=20=20=20=
=20=20=20these=20SoCs.=20All=20manufactured=20by=20Samsung,=20but=20differe=
nces=20are=20there=0D=0A>=20>=20=20=20=20=20=20=20=20in=20HW=20design=20and=
=20for=20different=20products.=20For=20the=20same=20reason=20PCIe=0D=0A>=20=
patch=0D=0A>=20>=20=20=20=20=20=20=20=20refactoring=20effort=20is=20being=
=20put=20by=20us=20=5B1=5D=20to=20streamline=20single=20Exynos=0D=0A>=20dri=
ver=0D=0A>=20>=20=20=20=20=20=20=20=20which=20can=20support=20all=20Samsung=
=20manufactured=20SoCs=20having=20DWC=20PCIe=0D=0A>=20controller.=0D=0A>=20=
>=20=20=20=20=20=20=20=5B1=5D:=20https://protect2.fireeye.com/v1/url?k=3D8a=
8233e4-d5190ae8-=0D=0A>=208a83b8ab-000babff3563-7bd7c9980190e0e8&q=3D1&e=3D=
2e04cfd4-33cf-4f00-=0D=0A>=20a970-=0D=0A>=207dcbf1d780ec&u=3Dhttps%3A%2F%2F=
patchwork.ozlabs.org%2Fproject%2Flinu=0D=0A>=20x-pci%2Fpatch%2F202506251652=
29.3458-2-shradha.t%40samsung.com%2F=0D=0A>=20=0D=0A>=20So=20entire=20base=
=20of=20the=20SoC=20is=20Samsung.=0D=0A=0D=0AYes,=20if=20we=20are=20saying=
=20this=20based=20on=20the=20core=20IPs=20(CMU,=20Pinctrl)=20and=20the=20fa=
ct=20that=0D=0Ait=20is=20manufactured=20by=20Samsung.=0D=0A=0D=0A>=20=0D=0A=
>=20>=0D=0A>=20>=20Axis-provided=20IPs:=0D=0A>=20>=20=20=20=20=20-=20VIP=20=
(Image=20Sensor=20Processing=20IP)=0D=0A>=20>=20=20=20=20=20-=20VPP=20(Vide=
o=20Post=20Processing)=0D=0A>=20>=20=20=20=20=20-=20GPU=0D=0A>=20>=20=20=20=
=20=20-=20CDC=20(Video=20Encoder)=0D=0A>=20>=0D=0A>=20>=20As=20part=20of=20=
the=20upstreaming=20effort,=20Samsung=20and=20Coasia=20(DSP)=20team=20will=
=0D=0A>=20work=20together=0D=0A>=20>=20to=20upstream=20basic=20SoC=20suppor=
t=20and=20Samsung=20IPs=20support.=0D=0A>=20>=20The=20Axis=20team=20will=20=
be=20the=20primary=20maintainer=20for=20the=20ARTPEC-8=20SoC=0D=0A>=20codeb=
ase.=0D=0A>=20=0D=0A>=20Don't=20know=20what=20do=20you=20mean=20by=20=22pri=
mary=22,=20but=20I=20want=20to=20be=20clear:=20this=0D=0A>=20classifies=20a=
s=20Samsung=20SoC,=20so=20I=20will=20be=20maintaining=20and=20overlooking=
=20it=0D=0A>=20just=20like=20I=20maintain=20and=20take=20care=20about=20all=
=20Samsung=20SoCs.=20Otherwise=20you=0D=0A>=20will=20be=20introducing=20err=
ors=20and=20warnings=20or,=20in=20best=20case=20different=0D=0A>=20style.=
=20And=20this=20already=20happened=20if=20I=20did=20not=20object=21=0D=0A>=
=20=0D=0A=0D=0ABy=20=22primary=22=20I=20mean=20as=20it=20is=20product=20of=
=20Axis,=20and=20only=20Axis=20will=20be=20having=20access=0D=0Ato=20this=
=20SoCs=20in=20future=20they=20will=20be=20responsible=20to=20maintain=20it=
=20and=20add=20support=20for.=0D=0A=0D=0A>=20Also=20SAME=20strict=20DT=20co=
mpliance=20profile=20will=20be=20applied.=20(see=20more=20on=0D=0A>=20that=
=20below)=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=20Given=20that=20ARTPEC-8=20is=20=
a=20distinct=20SoC=20with=20its=20own=20set=20of=20IPs,=20we=20believe=20it=
's=0D=0A>=20reasonable=0D=0A>=20>=20to=20create=20a=20separate=20directory=
=20for=20it,=20similar=20to=20FSD.=0D=0A>=20=0D=0A>=20No.=20It=20was=20a=20=
mistake=20for=20FSD=20to=20keep=20it=20separate=20why?=20Because=20there=20=
is=0D=0A>=20no=20single=20non-Samsung=20stuff=20there.=20I=20am=20afraid=20=
exactly=20the=20same=20will=0D=0A>=20happen=20there.=0D=0A>=20=0D=0A=0D=0AI=
=20am=20not=20sure,=20why=20you=20are=20saying=20this=20as=20a=20mistake,=
=20in=20case=20next=20version=20of=20FSD=0D=0Aor=20ARTPEC=20is=20manufactur=
ed=20(ODM)=20by=20another=20vendor=20in=20that=20case,=20won't=20it=0D=0Acr=
eate=20problems?=20=0D=0A=0D=0AFor=20example=20ARTPEC-6/7=20(ARM=20based)=
=20have=20their=20own=20directories=20as=20=22arch/arm/boot/dts/axis/=22=0D=
=0AThese=20were=20not=20Samsung=20(ODM)=20manufactures=20SoCs.=20=0D=0A=0D=
=0ABut=20ARTPEC-8/9=20(ARM64)=20based=20SoCs=20are=20samsung=20manufactured=
.=20What=20if=20the=20next=20version=20say=0D=0AARTPEC-10=20is=20not=20sams=
ung=20manufactured,=20so=20different=20version=20of=20products=20(SoCs)=20f=
rom=0D=0Asame=20vendor=20(OEM),=20in=20this=20case=20Axis,=20will=20have=20=
code=20in=20separate=20directories=20and=20with=20different=20maintainers?=
=20=0D=0A=0D=0A>=20Based=20on=20above=20list=20of=20blocks=20this=20should=
=20be=20done=20like=20Google=20is=20done,=0D=0A>=20so=20it=20goes=20as=20su=
bdirectory=20of=20samsung=20(exynos).=20Can=20be=20called=20axis=20or=0D=0A=
>=20artpec-8.=0D=0A=0D=0AI=20will=20suggest=20to=20keep=20axis,=20knowing=
=20the=20fact=20that=20sooner=20after=20artpec-8=20patches=20gets=20approve=
d=20and=20merged=0D=0Awe=20have=20plan=20to=20upstream=20artpec-9=20(ARM64,=
=20Samsung=20manufactured)=20as=20well.=0D=0A=0D=0A>=20=0D=0A>=20To=20clari=
fy:=20Only=20this=20SoC,=20not=20others=20which=20are=20not=20Samsung.=0D=
=0A>=20=0D=0A>=20>=0D=0A>=20>=20We=20will=20remove=20Samsung=20and=20Coasia=
=20teams=20from=20the=20maintainers=20list=20in=20v2=0D=0A>=20and=20only=0D=
=0A>=20>=20Axis=20team=20will=20be=20maintainer.=0D=0A>=20=0D=0A>=20A=20bit=
=20unexpected=20or=20rather:=20just=20use=20names=20of=20people=20who=20WIL=
L=20be=0D=0A>=20maintaining=20it.=20If=20this=20is=20Jesper=20and=20Lars,=
=20great.=20Just=20don't=20add=0D=0A>=20entries=20just=20because=20they=20a=
re=20managers.=0D=0A=0D=0AAFAIK,=20Jesper=20will=20be=20taking=20care.=20=
=0D=0A=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=20Maintainer=20list=20for=20previous=
=20generation=20of=20Axis=20chips=20(ARM=20based)=20is=20already=0D=0A>=20p=
resent,=0D=0A>=20>=20so=20this=20will=20be=20merged=20into=20that.=0D=0A>=
=20=0D=0A>=20Existing=20Artpec=20entry=20does=20not=20have=20tree=20mention=
ed,=20so=20if=20you=20choose=0D=0A>=20above,=20you=20must=20not=20add=20the=
=20tree,=20since=20the=20tree=20is=20provided=20by=20Samsung=20SoC.=0D=0A>=
=20=0D=0A=0D=0AOK=0D=0A=0D=0A>=20OTOH,=20how=20are=20you=20going=20to=20add=
=20there=20strict=20DT=20compliance?=20Existing=20axis=0D=0A>=20is=20not=20=
following=20this,=20but=20artpec-8,=20as=20a=20Samsung=20derivative,=20MUST=
=0D=0A>=20FOLLOW=20strict=20DT=20compliance.=20And=20this=20should=20be=20c=
learly=20marked=20in=0D=0A>=20maintainer=20entry,=20just=20like=20everywher=
e=20else.=0D=0A>=0D=0A=0D=0AAs=20I=20said=20this=20is=20tricky=20situation,=
=20though=20artpec-8=20is=20derivative=20of=20samsung,=20we=20can't=20confi=
rm=20=0D=0Aif=20future=20versions=20(>=209)=20will=20be=20samsung=20derivat=
ive.=20=0D=0A=0D=0ABut=20this=20would=20be=20case=20for=20all=20such=20cust=
om=20ASIC=20manufactured=20by=20samsung,=20so=20I=20would=20like=20to=0D=0A=
understand=20how=20this=20will=20be=20handled?=20=0D=0A=0D=0A>=20=0D=0A>=20=
>=0D=0A>=20>=20Please=20let=20us=20know=20if=20this=20explanation=20address=
es=20your=20concerns.=0D=0A>=20>=20We'll=20update=20the=20commit=20message=
=20and=20cover=20letter=20accordingly.=0D=0A>=20=0D=0A>=20=0D=0A>=20Best=20=
regards,=0D=0A>=20Krzysztof=0D=0A=0D=0A

