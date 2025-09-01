Return-Path: <linux-gpio+bounces-25267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E0B3D8C7
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 07:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE851897807
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9703623D283;
	Mon,  1 Sep 2025 05:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kLUxhvjW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1286238C3B
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756704600; cv=none; b=XfJJYSWkoz0BY+/jui35ns9ZuQCvATd3+DEdiy/bJF3+fF46tNMX7Q9hQTSy8JJnTXOSTp991Ncer0W+peQOmcjjvNatlr2pLEs2Z794sSqJWvM6fC2wuO+gV1YnisA6VEozpS8l3LDA0vOGdv8PH4WmZo25GttE3wcod9foqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756704600; c=relaxed/simple;
	bh=f0VTLj2oJi5Q/8tVmqZKyqiwP/jE3Chg74tuZB6REWs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mlyRX01jeSyF2FCFOOepA2ZGFf0PnmSUaSnMBQwbLvFWXmH+ClhLWAc+63NN8DWZjp4LRuDgSJKQ2EuTTYfqhb0ao+dU2nF9m1104vJy98O3gjlqocnZyMz+bYxZnluj+uuW9c2vin6T7M5HDhNL8/r142kPm/uqOxuzHZ+eEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kLUxhvjW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250901052955epoutp027110792fe0113f204c6fa43791e011f6~hEYXGhsYf0766807668epoutp02F
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:29:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250901052955epoutp027110792fe0113f204c6fa43791e011f6~hEYXGhsYf0766807668epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756704595;
	bh=z74vgOVZHNwhfErJhL2+ZnEEShq8T4mkIJ9fIx6HkJQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=kLUxhvjWD/mYbZWj/N8LeoPc+73L39Dh+Lr0tUT3Ccl9ZUQ5rAfoo13t+w1sq8Uno
	 JLYajbXO0xArhoVcbQ/SSA8UfvitXvIdlyK3TkcBmT5JONGMQncr1f/FZsYAz/Hc0y
	 stSRy8pUgrj70HWDSK+E2B6OJ+klryW6TQCscd/s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250901052955epcas5p22cc7004bedc0128438190393c0253af3~hEYWQVkKp0411204112epcas5p2p;
	Mon,  1 Sep 2025 05:29:55 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFcrf0XRtz6B9mF; Mon,  1 Sep
	2025 05:29:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901052953epcas5p18a498f14a81ac41b86c227ad4c8acef4~hEYUxtHhj1182311823epcas5p1C;
	Mon,  1 Sep 2025 05:29:53 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901052948epsmtip1608cfb6e73b057139f6d612781fccdea~hEYQcXvfw0550105501epsmtip1f;
	Mon,  1 Sep 2025 05:29:48 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <shradha.t@samsung.com>, <inbaraj.e@samsung.com>,
	<swathi.ks@samsung.com>, <hrishikesh.d@samsung.com>,
	<dj76.yang@samsung.com>, <hypmean.kim@samsung.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <soc@lists.linux.dev>
In-Reply-To: <e3f6d000-bbb7-45c2-93f2-69be9815ca99@kernel.org>
Subject: RE: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Date: Mon, 1 Sep 2025 10:59:47 +0530
Message-ID: <000301dc1b01$71e4f5a0$55aee0e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAMDo+/eAkhMLtUCILeh+gILpIJwAZ3h4W+0TgkigA==
Content-Language: en-in
X-CMS-MailID: 20250901052953epcas5p18a498f14a81ac41b86c227ad4c8acef4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
	<20250825114436.46882-5-ravi.patel@samsung.com>
	<b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>
	<000201dc1af2$537b4e70$fa71eb50$@samsung.com>
	<e3f6d000-bbb7-45c2-93f2-69be9815ca99@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 01 September 2025 10:42
> To: Ravi Patel <ravi.patel=40samsung.com>; jesper.nilsson=40axis.com; mtu=
rquette=40baylibre.com; sboyd=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; s.nawrocki=40samsung.com; cw=
00.choi=40samsung.com; alim.akhtar=40samsung.com;
> linus.walleij=40linaro.org; tomasz.figa=40gmail.com; catalin.marinas=40ar=
m.com; will=40kernel.org; arnd=40arndb.de
> Cc: ksk4725=40coasia.com; kenkim=40coasia.com; pjsin865=40coasia.com; gwk=
1013=40coasia.com; hgkim05=40coasia.com;
> mingyoungbo=40coasia.com; smn1196=40coasia.com; pankaj.dubey=40samsung.co=
m; shradha.t=40samsung.com; inbaraj.e=40samsung.com;
> swathi.ks=40samsung.com; hrishikesh.d=40samsung.com; dj76.yang=40samsung.=
com; hypmean.kim=40samsung.com; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; linux-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40vger.ke=
rnel.org; soc=40lists.linux.dev
> Subject: Re: =5BPATCH v3 04/10=5D dt-bindings: pinctrl: samsung: Add comp=
atible for ARTPEC-8 SoC
>=20
> On 01/09/2025 05:41, Ravi Patel wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 31 August 2025 18:55
> >> To: Ravi Patel <ravi.patel=40samsung.com>; jesper.nilsson=40axis.com; =
mturquette=40baylibre.com; sboyd=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; s.nawrocki=40samsung.com;=
 cw00.choi=40samsung.com; alim.akhtar=40samsung.com;
> >> linus.walleij=40linaro.org; tomasz.figa=40gmail.com; catalin.marinas=
=40arm.com; will=40kernel.org; arnd=40arndb.de
> >> Cc: ksk4725=40coasia.com; kenkim=40coasia.com; pjsin865=40coasia.com; =
gwk1013=40coasia.com; hgkim05=40coasia.com;
> >> mingyoungbo=40coasia.com; smn1196=40coasia.com; pankaj.dubey=40samsung=
.com; shradha.t=40samsung.com; inbaraj.e=40samsung.com;
> >> swathi.ks=40samsung.com; hrishikesh.d=40samsung.com; dj76.yang=40samsu=
ng.com; hypmean.kim=40samsung.com; linux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linu=
x-samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; linux-
> >> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40vger=
.kernel.org; soc=40lists.linux.dev
> >> Subject: Re: =5BPATCH v3 04/10=5D dt-bindings: pinctrl: samsung: Add c=
ompatible for ARTPEC-8 SoC
> >>
> >> On 25/08/2025 13:44, Ravi Patel wrote:
> >>> From: SeonGu Kang <ksk4725=40coasia.com>
> >>>
> >>> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> >>> which is similar to other Samsung SoC pinctrl blocks.
> >>>
> >>> Signed-off-by: SeonGu Kang <ksk4725=40coasia.com>
> >>> Acked-by: Rob Herring (Arm) <robh=40kernel.org>
> >>> Signed-off-by: Ravi Patel <ravi.patel=40samsung.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml =7C 1=
 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >>
> >> No wakeup-eint interrupts here? samsung,pinctrl-wakeup-interrupt.yaml?
> >
> > I don't see any use case for external wake-up interrupt here (as of now=
).
>=20
> It is more about hardware, not use case. Does this hardware has EINT
> wakeup pin banks?

I checked SFR sheet, ARTPEC-8 does not have any EINT wakeup pins or SFRs.

Thanks,
Ravi

>=20
> > So wakeup-eint entry is not present in dts and yaml both.
>=20
>=20
>=20
> Best regards,
> Krzysztof


