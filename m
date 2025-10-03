Return-Path: <linux-gpio+bounces-26774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7ABB5F5B
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 07:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C94D4E4FE8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 05:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B744AA920;
	Fri,  3 Oct 2025 05:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qhNIOAvP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44A202C5C
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759470309; cv=none; b=Z4Fs3GPOcuSL5X47gKUQVDOyHHtNkr10bta3YlS654UEnFWN74VtkYkNaHSp0C53uxUb45zEj/HM4GJoInyU08OxdculBpa1mY2ZDlKZMcVVlSSdPtKXsTDBEhVw+FncyjF5Km/vnYfUVzaptfFD3qqnO90nzlOjteoxMGuNJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759470309; c=relaxed/simple;
	bh=z6SlgDCFOBi9h8Zr7L2vlVB4Qa0jU3GPw7jT23nrerc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=X9VWZXPgkX+2YbP8TelyDxHgckzIhUfvxK6bNj9kD1cwCl0k07Tum2ISnl6rcDIZ62B/TFCB+tzPEKVxZ9C3ehT5TSacxF1z+HjJPXKt16nml4xZCwedoqrgob0KlRh/fVnRPUH0dmg+YtVV9ac+Qz2sCt/MP3nRq4T4B//CDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qhNIOAvP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251003054503epoutp023cc11231dbfe51e365be7e823ca6f355~q5OtU88e42278222782epoutp02y
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 05:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251003054503epoutp023cc11231dbfe51e365be7e823ca6f355~q5OtU88e42278222782epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759470303;
	bh=z6SlgDCFOBi9h8Zr7L2vlVB4Qa0jU3GPw7jT23nrerc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qhNIOAvPx6uoDmXmCwXxj95uNjHaogCl3At7rjuiK+JWfgK9h8VrxSVOiU3sbyb0L
	 Q+exqebSpMvX+0OGrQ9/YD0NbLP9zB56J6LiXykWijBTKN3Q5CcqJe1Ec7KTNy08+5
	 gvewGiE7y978nIop2sKmDL6fB/ScDQ9s48tWpY/Q=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251003054502epcas5p147f4ac05e859f93ced29739c9dd6db1b~q5OsU5Zyx2599925999epcas5p1B;
	Fri,  3 Oct 2025 05:45:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cdHgK5jwVz6B9m7; Fri,  3 Oct
	2025 05:45:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251003054501epcas5p17ec2255ee66f0ea533b8dc9a058e33e9~q5Oq8U0mF2736927369epcas5p12;
	Fri,  3 Oct 2025 05:45:01 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251003054456epsmtip1431a24308d04a35b90a24f8eb7b752a2~q5Omvl53I2540725407epsmtip16;
	Fri,  3 Oct 2025 05:44:56 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>,
	<tomasz.figa@gmail.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <ksk4725@coasia.com>, <kenkim@coasia.com>,
	<pjsin865@coasia.com>, <gwk1013@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <smn1196@coasia.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
In-Reply-To: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
Subject: RE: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
Date: Fri, 3 Oct 2025 11:14:55 +0530
Message-ID: <000001dc3428$dc2990c0$947cb240$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKKMINb5ygeSmhM7iNuat0EV5IHsAIgbsJhATIDr/2zOVZ1wA==
Content-Language: en-in
X-CMS-MailID: 20251003054501epcas5p17ec2255ee66f0ea533b8dc9a058e33e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
	<20250901051926.59970-1-ravi.patel@samsung.com>
	<CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>

Hi Krzysztof,

The dt-bindings patch was merged earlier in v3 series (https://lore.kernel.=
org/linux-samsung-soc/175664688891.195158.13270877080433356384.b4-ty=40lina=
ro.org/ on 31st August)
into respective maintainer repo.=20
Then I have been asked to drop the applied v3 patches and send rebased v4 s=
eries (https://lore.kernel.org/linux-samsung-soc/15508cb4-843c-42d1-8854-5e=
abd79ca0df=40kernel.org/)

Since the 4 patches from v3 series has been already merged, I have not the =
mentioned dependency while sending remaining v4 patches considering
It is going to same maintainer repo and it will be applied in sequence.

For future patches (like artpec-9), I will mention the dependency even it i=
s merged in same repo.

Thanks,
Ravi

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 02 October 2025 12:10
> To: Ravi Patel <ravi.patel=40samsung.com>
> Cc: jesper.nilsson=40axis.com; mturquette=40baylibre.com; sboyd=40kernel.=
org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;=
 alim.akhtar=40samsung.com; linus.walleij=40linaro.org;
> tomasz.figa=40gmail.com; catalin.marinas=40arm.com; will=40kernel.org; ar=
nd=40arndb.de; ksk4725=40coasia.com; kenkim=40coasia.com;
> pjsin865=40coasia.com; gwk1013=40coasia.com; hgkim05=40coasia.com; mingyo=
ungbo=40coasia.com; smn1196=40coasia.com;
> shradha.t=40samsung.com; inbaraj.e=40samsung.com; swathi.ks=40samsung.com=
; hrishikesh.d=40samsung.com;
> dj76.yang=40samsung.com; hypmean.kim=40samsung.com; linux-kernel=40vger.k=
ernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; devicetree=40=
vger.kernel.org; linux-gpio=40vger.kernel.org
> Subject: Re: =5BPATCH v4 0/6=5D Add support for the Axis ARTPEC-8 SoC
>=20
> On Mon, 1 Sept 2025 at 14:42, Ravi Patel <ravi.patel=40samsung.com> wrote=
:
> >
> > Add basic support for the Axis ARTPEC-8 SoC which contains
> > quad-core Cortex-A53 CPU and other several IPs. This SoC is an
> > Axis-designed chipset used in surveillance camera products such as
> > the AXIS Q1656-LE and AXIS Q3538-LVE.
> >
> > This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
> > Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> >
> > List of Samsung-provided IPs:
> > - UART
> > - Ethernet (Vendor: Synopsys)
> > - SDIO
> > - SPI
> > - HSI2C
> > - I2S
> > - CMU (Clock Management Unit)
> > - Pinctrl (GPIO)
> > - PCIe (Vendor: Synopsys)
> > - USB (Vendor: Synopsys)
> >
> > List of Axis-provided IPs:
> > - VIP (Image Sensor Processing IP)
> > - VPP (Video Post Processing)
> > - GPU
> > - CDC (Video Encoder)
> >
> > This patch series includes below changes:
> > - CMU (Clock Management Unit) driver and its bindings
> > - GPIO pinctrl configuration and its bindings
> > - Basic Device Tree for ARTPEC-8 SoC and boards
> >
>=20
> Pretty useless cover letter since it doesn't say the damn most
> important thing : dependency=21
>=20
> So this went unnoticed and now mainline (Linus tree) is affected. See
> Linus rant on soc pull request
>=20
> I'm very disappointed, actually mostly on me that I picked this up.
> Your future patches, need to improve quality and probably you need to
> go back to how Git works and how maintainer trees are organized. Read
> carefully, really carefully please maintainer profile .
>=20
> I'll be putting artpec 9 on hold, till you confirm what was wrong here
> and how are you going to fix it in the future.


