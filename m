Return-Path: <linux-gpio+bounces-29663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFEFCC5F88
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 05:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 928243022F2C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 04:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FD325D1E9;
	Wed, 17 Dec 2025 04:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DOFN8gqS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0A231836
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765946609; cv=none; b=CP6Y08Zy2Y5ZAHmLnVS+Co1YUPs1lKK2PSNlfSEhaMsmiyjBCpUWqUhRtn3pHDIsVJmpKAQsg5EqZ0ANGj4KRHZ4POX3gAX5/wpIoCaPYwgywv1d3jM07OQUnOD50qj1HvwJBCDSd1NFjIJmiESjUcRkPuibYPXxXZi+aQeph/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765946609; c=relaxed/simple;
	bh=wntWIHSg9UY6achikBORjG8viGhEJfOq4UuJcKAlK+g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QjkRH7hQ4tZhrYd4Pp7s7bcKx4MMSz3b6SAPSrA6Uz4kQZJ4H47tpBTy9KBKZfdHmTpH8y8cCUMBgYooLajCNQ0XLig8SN8rrubRQq0zZRuaG0vUG0l0Pc6ZSXsA01Ardz013w7VLM5cKQRJtxvHv8+sTgTU+BJHR8D5yEO6Z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DOFN8gqS; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251217044325epoutp02d635cdc648f59dd24ff9a60cbc9d25aa~B5xTCw5lV2977929779epoutp02t
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 04:43:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251217044325epoutp02d635cdc648f59dd24ff9a60cbc9d25aa~B5xTCw5lV2977929779epoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946605;
	bh=wntWIHSg9UY6achikBORjG8viGhEJfOq4UuJcKAlK+g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DOFN8gqSfX4toBLOtYCQ6YJ2t6OnrPP44OERtI64Vlmhqprxld4RD8WXh5P3o7lNM
	 fjXbILz8j2haDKLMdDrLD5uRoWg0NCQ2oFLYnZuEOLpQPbwKlIbSo6PCKhxJCkXeIv
	 3mWpBgkWmQB7yDZ8iJP660c8RL/tQUxFkC53Efps=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251217044324epcas5p24766d5be3325dd37a25ca3b25c734ff1~B5xSnBQPo2573425734epcas5p2U;
	Wed, 17 Dec 2025 04:43:24 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dWLlb5Hq5z6B9m6; Wed, 17 Dec
	2025 04:43:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251217044323epcas5p1509325d070f6a5bbdccafa4b07e22010~B5xRH2t390460304603epcas5p1k;
	Wed, 17 Dec 2025 04:43:23 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217044320epsmtip29c4e29ee7c9ce92651fcdd7810bfd325~B5xO67pQn1118811188epsmtip21;
	Wed, 17 Dec 2025 04:43:20 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-5-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 4/5] pinctrl: samsung: fold GS101 pin-bank macros
 into EXYNOS9_*
Date: Wed, 17 Dec 2025 10:13:19 +0530
Message-ID: <12a501dc6f0f$ace76270$06b62750$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQHmAf8yAbO5uNu10cjf4A==
Content-Language: en-us
X-CMS-MailID: 20251217044323epcas5p1509325d070f6a5bbdccafa4b07e22010
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa@epcas2p1.samsung.com>
	<20251202093613.852109-5-youngmin.nam@samsung.com>

Hi Youngmin

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
> Subject: =5BPATCH v3 4/5=5D pinctrl: samsung: fold GS101 pin-bank macros =
into
> EXYNOS9_*
>=20
> GS101 had dedicated GS101_PIN_BANK_EINT=7BG,W=7D helpers, but they are
> redundant with EXYNOS9_PIN_BANK_EINT=7BG,W=7D (same semantics, including
> the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and switches the GS101 pin-bank
> tables to the EXYNOS9_* helpers with exynos9_bank_type_=7Balive,off=7D.
> While here, update the struct comment to note FLTCON is Exynos9-specific
> (not 'GS101-specific').
>=20
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces copy-past=
e
> drift and keeps the FLTCON handling consistent.
> There is no functional change.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Tested-by: Peter Griffin <peter.griffin=40linaro.org> (tested on Pixel6/g=
s101)
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested this series on Exynosautov920 sadk board

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>


