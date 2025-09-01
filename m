Return-Path: <linux-gpio+bounces-25263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45AB3D77F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 574FB16DE8B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 03:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6469213DB9F;
	Mon,  1 Sep 2025 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vnzxd3Zy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D201DED63
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756697759; cv=none; b=HHJyXadUQ+1pJhOMpBI2Ti9Ka68rGJn5OZ1VEj+/+KKe/hhVY6jbyUOZetrG9iSZtb7ktZkgiqmfXwzH1Ib23nwcuy7adx2jFftSYeDJKXh2if2cQQbmUlSTceVjZtiLe1xisE6MTagPnG21ONqgScaiDZdmGl/nHpEGwq7wMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756697759; c=relaxed/simple;
	bh=SLph87s8uTl1mRNhEJdvueXclNiF3X9Ct/qHq8xkbxc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=NJQz+DB1GFlFtL9IOdVGAe7IdCY+WYlWkb9heXFMF7yVYiaTO+4Ddkhi7VdsQxII8BuMlr4Vif2r+xP/LAsLKaycQNfcsAt9G+2LSjYksVmA5jJMVFSxIsQnrsZ5+nNqbcj9tUKt+z5Ln/3kP07IHwOvfveqHQP4N2IPSFLr3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Vnzxd3Zy; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901033555epoutp04b829085085f6df4c71775a95d3cea392~hC00XVWRc1009310093epoutp04g
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:35:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901033555epoutp04b829085085f6df4c71775a95d3cea392~hC00XVWRc1009310093epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756697755;
	bh=SLph87s8uTl1mRNhEJdvueXclNiF3X9Ct/qHq8xkbxc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Vnzxd3Zyttevv+8cM067HoYIE3M7gBjG24JKRDbOxR923nuB014ryLPY2dqqmPkAk
	 2MVePyYtmkBGNkRdl6pMNV4hbSaFL9Mq1vSp1Llhu6b0EUYx/zRyoUpV9re4VkL4G1
	 USHmIhEgtX9C5ll3CgGqUQBl09sGHKQdJHvN0K1Q=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250901033554epcas5p3bf93e89b823f346c64490171a2f3a95a~hC0zLD_ZI2697626976epcas5p3E;
	Mon,  1 Sep 2025 03:35:54 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFZK473pJz2SSKY; Mon,  1 Sep
	2025 03:35:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901033552epcas5p10b35ebcca823a43b8d282064733414c4~hC0xcw4bL0189601896epcas5p1G;
	Mon,  1 Sep 2025 03:35:52 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901033547epsmtip2a6cc484678d50e13aa2c0a4577703238~hC0s-tZa92354723547epsmtip2B;
	Mon,  1 Sep 2025 03:35:47 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Linus Walleij'"
	<linus.walleij@linaro.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <shradha.t@samsung.com>, <inbaraj.e@samsung.com>,
	<swathi.ks@samsung.com>, <hrishikesh.d@samsung.com>,
	<dj76.yang@samsung.com>, <hypmean.kim@samsung.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <soc@lists.linux.dev>, "'Priyadarsini G'"
	<priya.ganesh@samsung.com>
In-Reply-To: <32dedafd-df52-48fe-a9b2-be96127bb9b7@kernel.org>
Subject: RE: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific
 configuration
Date: Mon, 1 Sep 2025 09:05:46 +0530
Message-ID: <000101dc1af1$84438410$8cca8c30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ632k4xbrD7jhK5O/rHG9LFVDGhAHHo9j0ArVvYJACmL3/qQEjiZNhsv5Y8CA=
Content-Language: en-in
X-CMS-MailID: 20250901033552epcas5p10b35ebcca823a43b8d282064733414c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
	<20250825114436.46882-1-ravi.patel@samsung.com>
	<20250825114436.46882-6-ravi.patel@samsung.com>
	<CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
	<32dedafd-df52-48fe-a9b2-be96127bb9b7@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 29 August 2025 15:59
> To: Linus Walleij <linus.walleij=40linaro.org>; Ravi Patel <ravi.patel=40=
samsung.com>
> Cc: jesper.nilsson=40axis.com; mturquette=40baylibre.com; sboyd=40kernel.=
org; robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> s.nawrocki=40samsung.com; cw00.choi=40samsung.com; alim.akhtar=40samsung.=
com; tomasz.figa=40gmail.com; catalin.marinas=40arm.com;
> will=40kernel.org; arnd=40arndb.de; ksk4725=40coasia.com; kenkim=40coasia=
.com; pjsin865=40coasia.com; gwk1013=40coasia.com;
> hgkim05=40coasia.com; mingyoungbo=40coasia.com; smn1196=40coasia.com; pan=
kaj.dubey=40samsung.com; shradha.t=40samsung.com;
> inbaraj.e=40samsung.com; swathi.ks=40samsung.com; hrishikesh.d=40samsung.=
com; dj76.yang=40samsung.com; hypmean.kim=40samsung.com;
> linux-kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; l=
inux-samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com;
> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40v=
ger.kernel.org; soc=40lists.linux.dev; Priyadarsini G
> <priya.ganesh=40samsung.com>
> Subject: Re: =5BPATCH v3 05/10=5D pinctrl: samsung: Add ARTPEC-8 SoC spec=
ific configuration
>=20
> On 29/08/2025 12:11, Linus Walleij wrote:
> > Hi Ravi / SeonGu,
> >
> > thanks for your patch=21
> >
> > On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM=20Ravi=20Patel=20<ravi.patel=40=
samsung.com>=20wrote:=0D=0A>=20>=0D=0A>=20>>=20From:=20SeonGu=20Kang=20<ksk=
4725=40coasia.com>=0D=0A>=20>>=0D=0A>=20>>=20Add=20Axis=20ARTPEC-8=20SoC=20=
specific=20configuration=20data=20to=20enable=20pinctrl.=0D=0A>=20>>=0D=0A>=
=20>>=20Signed-off-by:=20SeonGu=20Kang=20<ksk4725=40coasia.com>=0D=0A>=20>>=
=20Signed-off-by:=20Priyadarsini=20G=20<priya.ganesh=40samsung.com>=0D=0A>=
=20>>=20Signed-off-by:=20Ravi=20Patel=20<ravi.patel=40samsung.com>=0D=0A>=
=20>=0D=0A>=20>=20Please=20avoid=20CC=20to=20soc=40kernel.org=20on=20these=
=20patches,=20they=20end=20up=20in=20the=0D=0A>=20>=20patchwork=20for=20imm=
ediate=20merging=20for=20SoC:=0D=0A>=20>=20https://patchwork.kernel.org/pro=
ject/linux-soc/patch/20250825114436.46882-6-ravi.patel=40samsung.com/=0D=0A=
>=20=0D=0A>=20Yeah,=20that's=20odd=20-=20most=20likely=20old=20CC-list.=20T=
his=20could=20happen=20if=20using=0D=0A>=20b4=20but=20there=20is=20no=20b4=
=20being=20used=20here,=20so=20why=20Cc-ing=20according=20to=20some=0D=0A>=
=20old=20files?=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=20I=20think=20this=20is=20n=
ot=20you=20intention,=20the=20pinctrl=20portions=20will=20be=20merged=20by=
=0D=0A>=20>=20Krzysztof=20who=20sends=20it=20to=20me=20once=20that=20part=
=20is=20finished=20reviewing.=0D=0A>=20Version=20for=20review=20should=20no=
t=20be=20merged=20via=20soc=40,=20so=20that's=20wrong=0D=0A>=20process=20in=
=20any=20case.=20But=20you=20are=20right=20that=20I=20will=20be=20taking=20=
everything,=0D=0A>=20thus=20soc=40=20is=20not=20involved=20at=20all.=0D=0A=
=0D=0AOk,=20I=20will=20remove=20soc=40=20while=20sending=20next=20version.=
=0D=0A=0D=0AThanks,=0D=0ARavi=0D=0A=0D=0A>=20=0D=0A>=20Best=20regards,=0D=
=0A>=20Krzysztof=0D=0A=0D=0A

