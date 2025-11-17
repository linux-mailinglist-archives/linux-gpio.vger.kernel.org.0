Return-Path: <linux-gpio+bounces-28560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB19C62C0C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C869C4E85CF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67330319855;
	Mon, 17 Nov 2025 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="psxdoYvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C58318143
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364970; cv=none; b=ZShjWgVr9P5mF6fmjzVuU8AgLmNoaCbB+q2zwsUcQy/17zwdtPvJg4lf3cLO+aRbrXq9FCrZHqU/+bJ2TKvm6nITwu2XtO3DHQnY8sVyV06Gr7GAq5rBVaAAoGqMCqi/fAWh8IETTE8fu4Frel/kRakbrX+5TNfvraEnVn1kFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364970; c=relaxed/simple;
	bh=7Kr6dkiafFRmZqGimwTXQ9RphcDVYEXAYi5mEoFD9rM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=oKGSrfqNnxWsqEHDYGDjdd19F51NIz0s8yz89cAbpauj57E0A/f0mvCOnoE9/CkEEpAH5nA/23KQ/Yb5W4UA4/3JOJ7MArThbtbj/hmMc2sYrbzKwaYIuhEzR7Yrb/2EoKZpqQIx4zhColSIWrHR8wC7ZVCWcZ2JkttXNaLpvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=psxdoYvm; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251117073605epoutp03232b9f67bccc71a1b64d0ddfdfaab269~4uxfcIZQv2096620966epoutp03Q
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251117073605epoutp03232b9f67bccc71a1b64d0ddfdfaab269~4uxfcIZQv2096620966epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364965;
	bh=kf/sGnMP+uPwRoS11MP/BvqHNSifHXfJ38KYiWc+Knw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=psxdoYvmWGihS5oKKR10YM8ErvwPfDHE88WeK2o9+2R9gD+2/grMYfuyxzXrSfvYW
	 ojUf65zh8T0WxRKqu5Gm7qAhThGNhfL/TcAuNqOK+qEiOxbbdgY1GtoQrmOKqGg0vq
	 hMFu7Ci9A2df6AbNTCZDxTtyTyAfMQi/lpT7Bp4E=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251117073604epcas2p264339cf8275f57eaad3e9d3f61b27270~4uxe4d9uF2295622956epcas2p25;
	Mon, 17 Nov 2025 07:36:04 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.201]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d900h1ynzz3hhT9; Mon, 17 Nov
	2025 07:36:04 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251117073603epcas2p1366028012403591bd297764f91694181~4uxd6TeVq0038400384epcas2p1x;
	Mon, 17 Nov 2025 07:36:03 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073603epsmtip2ac73eb334fb72e3640c6709a1a679ba8~4uxd0HYnv2919729197epsmtip2K;
	Mon, 17 Nov 2025 07:36:03 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Mon, 17 Nov 2025 16:41:37 +0900
Message-Id: <20251117074140.4090939-3-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073603epcas2p1366028012403591bd297764f91694181
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073603epcas2p1366028012403591bd297764f91694181
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073603epcas2p1366028012403591bd297764f91694181@epcas2p1.samsung.com>

This patch corrects wrong pin bank table definitions for 4 SoCs based on
their TRMs.

Exynos2200
- gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
  'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
- Per the SoC TRM these banks must use the 'alive' layout
  (.fld_width = {4,1,4,4}).
- Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).

Exynos7885
- etc0, etc1: update bank type to match the SoC TRM.
- gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.

Exynos8890
- Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
  a non-external interrupt bank.
- gpi1, gpi2: update bank type to match the SoC TRM.
  exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
  exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
- Per the SoC TRM, mark etc1 as a non-external interrupt bank.
- apply lower case style for hex numbers.

Exynos8895
- gpa4 is a non-wakeup interrupt bank per the SoC TRM.
  change EINTW -> EINTN. (The bank_type itself was correct and is kept
  unchanged.)
- apply lower case style for hex numbers.

This aligns the pin-bank tables with the documented bitfield layouts and
wakeup domains. No DT/ABI change.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index d11b2d4ca913..b4a7d86b82fe 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
-	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
 };
 
 /* pin banks of exynos2200 pin-controller - CMGP */
@@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
 
 /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
-	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
-	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
@@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
 /* pin banks of exynos8890 pin-controller 2 (CCORE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
 };
 
 /* pin banks of exynos8890 pin-controller 3 (ESE) */
@@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
 /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
 };
 
 /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
@@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
 };
 
 /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
@@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
@@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
+	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
 };
 
 /* pin banks of exynos8895 pin-controller 1 (ABOX) */
@@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
 };
-- 
2.39.2


