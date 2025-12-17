Return-Path: <linux-gpio+bounces-29665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E03CC5FB8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 05:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42ABD3028FE9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 04:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927ED2264CD;
	Wed, 17 Dec 2025 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uq3zEgJc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2C1F4174
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947231; cv=none; b=cOHgHWK46TvQl+f8/AHFq+2jqAg9RvwefSQox3B2flKaOkIOvE2uLoQqvWMyFZ5TPOb1dEMAmwJ5SimXiwN76jIoINCVeSz5ECgCtwxJ3cAAmSDcQnjs4mQF50MejMJeifIlo4q3V40BeNdlR74lHlJnS1DkTwqsga1IkwvNTF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947231; c=relaxed/simple;
	bh=RSCL3+CVIHsJNsiOFSZveVboNJX+DWT4v6gr+2w4XpY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gFLCS9mSXGGMWQxq9AVenx7kLYfVtntD1SkuJuvHHqmJBqblwOFmIWnqtKYg9KW33PT3dqX7Y0ehvh5Vpdl+kXDzvmF6wz0YgiEmDu5DC/h6tMmd8/yuj3HSpDUc2nRsr+PUjKjRsIU3/qn1C4J9VsIDVmE4NDPxH/lkr54yq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uq3zEgJc; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251217045346epoutp0484fc63d06c6d4937f1108d58ab891167~B56VZO4c41349413494epoutp04Q
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:53:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251217045346epoutp0484fc63d06c6d4937f1108d58ab891167~B56VZO4c41349413494epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765947226;
	bh=gwMQFbuii6OFTcgrFdkJAKQYDxCd7chG2CDPC72TD5A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uq3zEgJcxfA0KYJ+2W/wfrcmgpRhiw3dwweN34dYNJEBAX9c4XhU80UOOGndMq4tv
	 ZAnCegS3EIZZh/rTANaRSm9e1BoSl1zcGOQwEv8kAvV+EvzUlWxTWLprppf6jxUMTV
	 RKlaC56uHP9Zv8YnGb2jR8lGwD0dNTa+3nlkdXn8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217045345epcas5p4a03712a3b5ba5d381ea11a76fb4c1a33~B56U3zm0r2314923149epcas5p4f;
	Wed, 17 Dec 2025 04:53:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dWLzX48Bxz6B9m6; Wed, 17 Dec
	2025 04:53:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217045343epcas5p42b5288f51ac3b36862605f0a4b6e1281~B56SvsDZr3255232552epcas5p4p;
	Wed, 17 Dec 2025 04:53:43 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217045341epsmtip15abe4c870d785544f9f672b775006566~B56QzUVqU1277712777epsmtip1F;
	Wed, 17 Dec 2025 04:53:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-6-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
Date: Wed, 17 Dec 2025 10:23:40 +0530
Message-ID: <12a701dc6f11$1e9412a0$5bbc37e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQH6Vff4AS6bXfS11VMO8A==
Content-Language: en-us
X-CMS-MailID: 20251217045343epcas5p42b5288f51ac3b36862605f0a4b6e1281
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093029epcas2p19224bab81f8ed2b9f63613fdd010ab57
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093029epcas2p19224bab81f8ed2b9f63613fdd010ab57@epcas2p1.samsung.com>
	<20251202093613.852109-6-youngmin.nam@samsung.com>

Hello Youngmin

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam=40samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org; peter.griffin=40linaro.org;
> semen.protsenko=40linaro.org; ivo.ivanov.ivanov1=40gmail.com
> Cc: ryu.real=40samsung.com; d7271.choe=40samsung.com;
> shin.son=40samsung.com; jaewon02.kim=40samsung.com; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; linux-kernel=40vger.kernel.org; Youngmin Nam
> <youngmin.nam=40samsung.com>
> Subject: =5BPATCH v3 5/5=5D pinctrl: samsung: rename gs101_pinctrl_* to
> exynos9_pinctrl_*
>=20
> The suspend/resume helpers named gs101_pinctrl_=7Bsuspend,resume=7D are
> not GS101-specific. They implement the generic save/restore sequence used
> by Exynos9-style controllers that have EINT filter configuration
> (eint_fltcon) to preserve.
>=20
> Rename them to exynos9_pinctrl_=7Bsuspend,resume=7D and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables
>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>=20
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
> Tested-by: Peter Griffin <peter.griffin=40linaro.org> (tested on Pixel6/g=
s101)
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested this series on Exynosautov920 sadk

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>



