Return-Path: <linux-gpio+bounces-29662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC535CC5F75
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 05:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B63B3020480
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 04:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7808231A32;
	Wed, 17 Dec 2025 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Si8KYqBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D622D7B0
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765946009; cv=none; b=WXU3C2F9b7TcIWQWl/5WJEFX0kw8sTg8YVQkoyAmYhF/HKhL1rG5hZbfLv99Lm8gz4KSCmJpcSOQUAz7EZ6TBca7qKbPRN0XrP7W0jXmHSsLAWS2/k+WKaxbEWTWhuy8qN5JkkocHpAQRuNuTjtwZwMSV6z7x0YLueTHnVWvFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765946009; c=relaxed/simple;
	bh=+QVDdlpqYQJvpcip8+rh9MAEtfAv7rDEwteqrP+zV/I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=kkWpOUvOo4AL54BmWA0RkDzwX6FrWmJhS8C7dPOGtqAVlBKGsHrW7GV+GrTTamODCW2zZRdEdTw7ISpxozE59/c1Qkd2rjjRir8YXwESSYLoGG4RxnrUz+xx2CG9HGOcmC/yEve41fQ/3CR9YuGJquLCWQJTX+ovxCzF0z71NcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Si8KYqBc; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251217043320epoutp04c79ab94a4a3116db6fae5f57f2e55861~B5ofufMua2734127341epoutp047
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251217043320epoutp04c79ab94a4a3116db6fae5f57f2e55861~B5ofufMua2734127341epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946000;
	bh=y0J3PnL2BKaLoFuJGvyxGh17PgdmTUCfDKR9Hdls1sA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Si8KYqBcRT1XjtFJRIKLJmNTT2vCPV0FEyBJY6rbA5A0ANTBSKS5s52tt2Kd6vB9H
	 qdvK58Y85NRkVpvNtHS71KaS1a/uhh9B0/osnkh4nQZkvZHQke2mxGc0t2EvRehP3B
	 eZ+SVgnjscriQHHvs9vEYmxE86ceHwPZNRAVj7Tw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217043319epcas5p4985f521bd57309ed404f3b9218d41b59~B5ofIagsg1310513105epcas5p4_;
	Wed, 17 Dec 2025 04:33:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWLWy5d7sz2SSKX; Wed, 17 Dec
	2025 04:33:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251217043317epcas5p303a51a5ecae59ec994dec8d1ae7bce9d~B5odYEZVn2667326673epcas5p3T;
	Wed, 17 Dec 2025 04:33:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217043313epsmtip22e5d96625da110faf098ce06ffa52b64~B5oZAxP-T0687206872epsmtip2k;
	Wed, 17 Dec 2025 04:33:12 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-3-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Wed, 17 Dec 2025 10:03:10 +0530
Message-ID: <12a401dc6f0e$441ae1f0$cc50a5d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQIr5xjBAatK81O1z9vLcA==
Content-Language: en-us
X-CMS-MailID: 20251217043317epcas5p303a51a5ecae59ec994dec8d1ae7bce9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>

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
> Subject: =5BPATCH v3 2/5=5D pinctrl: samsung: fix incorrect pin-bank entr=
ies on
> Exynos2200/7885/8890/8895
>=20
> This patch corrects wrong pin bank table definitions for 4 SoCs based on =
their
> TRMs.
>=20
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width =3D =7B4,1,2,2,2,2=7D).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width =3D =7B4,1,4,4=7D).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>=20
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>=20
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width =3D =7B4,1,2,3,2,2=7D) ->
>   exynos5433_bank_type_off (.fld_width =3D =7B4,1,2,4,2,2=7D)
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
>=20
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)
> - apply lower case style for hex numbers.
>=20
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested on Exynosautov920 SADK board

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>




