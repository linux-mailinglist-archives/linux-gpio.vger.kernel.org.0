Return-Path: <linux-gpio+bounces-28561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD0C62C14
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75EF94EAF3F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3F031984C;
	Mon, 17 Nov 2025 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iWR7yN94"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E73195E6
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364972; cv=none; b=d985oxiglGptUlAbUt3704SVLqhKkN6avPR6QA6FPTxhZy/3kQi8HauwOF80L7xSq18MBQXdEJ0OQJoBbR1+6xdBKon3Qs1AvDAPnb5abObJCwim7PO4qpn/JS9nvnLipAeEFRYkzDOLtTvnrN0UwkoKuBsp5lFtZQ6JGOSY71A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364972; c=relaxed/simple;
	bh=8q/i447LxynMsTAonHtzjI6N/Jmr/nL/1+Z1Xhc2raA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GENleD9vrBNo2BYG5IQfLuqKbpkf6oQ4RBmAdmcNLmX94hgSMF0ILqzNoKznwuGFWrN42vmzwq1xFG3O9uMjP/5ozPN87XoJ/bX1+AzkiYV4NyRtQRYLdbc1/Jku9NpIrEYupU7+T496iublh4QvlT/he727wnOcVCJPVt3s/6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iWR7yN94; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251117073605epoutp03263901fd578d91dbca53a74a160b85cf~4uxf_fuGZ2248322483epoutp03N
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251117073605epoutp03263901fd578d91dbca53a74a160b85cf~4uxf_fuGZ2248322483epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763364965;
	bh=eJq8SwFSArHJsQytn3ddsx6wzZgG0Xu5ECG6O0zeNGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWR7yN94vkWpqJGwKbtiKW3L5abhUazpv074hWcJoqIozpVFn5vufQ4L4XQjVEqr+
	 dRxVYr1T1eyz4OMvigFpz0Fs7ExjUEAFLUKFBrLVGKvHASf0Klu67wD8Q9n7l7kzdh
	 NVeKY8PnL53MTBZUo/9VEzaswDu8/kt2tJXluEgE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251117073605epcas2p3008fc48522417cf3edd9a489f976e642~4uxfZ2U9A1156411564epcas2p3S;
	Mon, 17 Nov 2025 07:36:05 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.206]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4d900h6HmWz6B9mC; Mon, 17 Nov
	2025 07:36:04 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073604epcas2p2d371a278d498107abd5913d2438c4863~4uxehKNLO2295622956epcas2p2z;
	Mon, 17 Nov 2025 07:36:04 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251117073604epsmtip2fe154415cb20161d2057487eb8b279eb~4uxebT8Iw2920629206epsmtip2J;
	Mon, 17 Nov 2025 07:36:04 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Youngmin Nam
	<youngmin.nam@samsung.com>
Subject: [RFT PATCH v2 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
Date: Mon, 17 Nov 2025 16:41:38 +0900
Message-Id: <20251117074140.4090939-4-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251117074140.4090939-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117073604epcas2p2d371a278d498107abd5913d2438c4863
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117073604epcas2p2d371a278d498107abd5913d2438c4863
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
	<CGME20251117073604epcas2p2d371a278d498107abd5913d2438c4863@epcas2p2.samsung.com>

Several Exynos9-era pin-bank tables were implicitly assuming that the
filter control (FLTCON) registers are laid out contiguously from the
EINT base offset. Per the TRMs this is not always true. FLTCON can live
at a separate per-bank offset, and the current tables cause the driver
to program the wrong FLTCON addresses for some banks.

- Extends EXYNOS9_PIN_BANK_EINTG()/EINTW() to take an explicit
  .eint_fltcon_offset parameter.
- Updates pin-bank tables with the correct FLTCON offsets for:
  Exynos2200 (ALIVE/CMGP/HSI1/UFS/HSI1UFS/PERIC0/1/2/VTS),
  Exynos7870 (ALIVE/DISPAUD/ESE/FSYS/MIF/NFC/TOP/TOUCH),
  Exynos7885 (ALIVE/DISPAUD/FSYS/TOP),
  Exynos850  (ALIVE/CMGP/AUD/HSI/CORE/PERI),
  Exynos990  (ALIVE/CMGP/HSI1/HSI2/PERIC0/1/VTS),
  Exynos9810 (ALIVE/AUD/CHUB/CMGP/FSYS0/FSYS1/PERIC0/1/VTS),
  ExynosAuto v9 (ALIVE/AUD/FSYS0/1/2/PERIC0/1),
  Exynos8890 (ALIVE/AUD/CCORE/ESE/FP/FSYS0/1/NFC/PERIC0/1/TOUCH),
  Exynos8895 (ALIVE/ABOX/VTS/FSYS0/1/BUSC/PERIC0/1),
  and FSD (FSYS/PERIC).

Notes:
- GS101 already programs per-bank filter control registers. This change
  aligns the Exynos9 path with that model.
- Banks without filters (EINTN) are unaffected.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 744 +++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 +-
 2 files changed, 390 insertions(+), 388 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b4a7d86b82fe..92ae1bc80f9c 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
 
 /* pin banks of exynos2200 pin-controller - ALIVE */
 static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10, 0x20),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
@@ -102,90 +102,90 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
 
 /* pin banks of exynos2200 pin-controller - CMGP */
 static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", 0x10),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", 0x14),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", 0x18),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", 0x1c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8", 0x20),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9", 0x24),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10", 0x28),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11", 0x2c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12", 0x30),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13", 0x34),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x38),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x3c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x40),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x44),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20", 0x48),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21", 0x4c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22", 0x50),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23", 0x54),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24", 0x58),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9", 0x24, 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10", 0x28, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11", 0x2c, 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12", 0x30, 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13", 0x34, 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x38, 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x3c, 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x40, 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x44, 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20", 0x48, 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21", 0x4c, 0x4c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22", 0x50, 0x50),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23", 0x54, 0x54),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24", 0x58, 0x58),
 };
 
 /* pin banks of exynos2200 pin-controller - HSI1 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x00, 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - UFS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x00, 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - HSI1UFS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x00, 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC0 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2", 0x24, 0x24),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC1 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp7", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0x0c, 0x0c),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC2 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  0x28),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  0x2c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  0x34),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5", 0x24, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6", 0x28, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7", 0x2c, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8", 0x30, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9", 0x34, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0", 0x38, 0x38),
 };
 
 /* pin banks of exynos2200 pin-controller - VTS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x00, 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
@@ -640,68 +640,68 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __initconst = {
 	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 6, 0x000, "etc0"),
 	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 3, 0x020, "etc1"),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa2", 0x08, 0x10),
 	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 2, 0x0c0, "gpq0"),
 };
 
 /* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2", 0x08, 0x0c),
 };
 
 /* pin banks of exynos7870 pin-controller 2 (ESE) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7", 0x00, 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 3 (FSYS) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4", 0x10, 0x14),
 };
 
 /* pin banks of exynos7870 pin-controller 4 (MIF) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0", 0x00, 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 5 (NFC) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2", 0x00, 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 6 (TOP) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4", 0x2c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0", 0x34),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0", 0x38),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1", 0x3c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2", 0x40),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3", 0x44),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4", 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2", 0x24, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3", 0x28, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4", 0x2c, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0", 0x34, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0", 0x38, 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1", 0x3c, 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2", 0x40, 0x54),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3", 0x44, 0x58),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4", 0x48, 0x5c),
 };
 
 /* pin banks of exynos7870 pin-controller 7 (TOUCH) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3", 0x00, 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
@@ -770,46 +770,46 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08, 0x10),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0x08, 0x0c),
 };
 
 /* pin banks of exynos7885 pin-controller 2 (FSYS) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0x0c, 0x14),
 };
 
 /* pin banks of exynos7885 pin-controller 3 (TOP) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0x2c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0x34),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0x38),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0x3c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0x18, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0x1c, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0x20, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0x24, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0x28, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0x2c, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0x30, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0x34, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0x38, 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0x3c, 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0x40, 0x58),
 };
 
 static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
@@ -850,59 +850,59 @@ const struct samsung_pinctrl_of_match_data exynos7885_of_data __initconst = {
 /* pin banks of exynos850 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4", 0x10, 0x20),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos850 pin-controller 1 (CMGP) */
 static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c, 0x1c),
 };
 
 /* pin banks of exynos850 pin-controller 2 (AUD) */
 static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0x04, 0x08),
 };
 
 /* pin banks of exynos850 pin-controller 3 (HSI) */
 static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0x00, 0x00),
 };
 
 /* pin banks of exynos850 pin-controller 4 (CORE) */
 static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0x04, 0x04),
 };
 
 /* pin banks of exynos850 pin-controller 5 (PERI) */
 static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0x10, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0x14, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0x18, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0x1c, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0x20, 0x2c),
 };
 
 static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
@@ -946,11 +946,11 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 /* pin banks of exynos990 pin-controller 0 (ALIVE) */
 static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4", 0x10, 0x20),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 7, 0x0a0, "gpq0"),
 };
 
@@ -961,82 +961,82 @@ static struct samsung_pin_bank_data exynos990_pin_banks1[] = {
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x020, "gpm1"),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x040, "gpm2"),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x060, "gpm3"),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8", 0x10),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9", 0x14),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10", 0x18),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11", 0x1c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12", 0x20),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm13", 0x24),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x28),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x2c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x30),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x34),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18", 0x38),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19", 0x3c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20", 0x40),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm21", 0x44),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm22", 0x48),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2e0, "gpm23", 0x4c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24", 0x50),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25", 0x54),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26", 0x58),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27", 0x5c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28", 0x60),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3a0, "gpm29", 0x64),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3c0, "gpm30", 0x68),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3e0, "gpm31", 0x6c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32", 0x70),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33", 0x74),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm13", 0x24, 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x28, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x2c, 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x30, 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x34, 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18", 0x38, 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19", 0x3c, 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20", 0x40, 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm21", 0x44, 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm22", 0x48, 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2e0, "gpm23", 0x4c, 0x4c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24", 0x50, 0x50),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25", 0x54, 0x54),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26", 0x58, 0x58),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27", 0x5c, 0x5c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28", 0x60, 0x60),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3a0, "gpm29", 0x64, 0x64),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3c0, "gpm30", 0x68, 0x68),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3e0, "gpm31", 0x6c, 0x6c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32", 0x70, 0x70),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33", 0x74, 0x74),
 };
 
 /* pin banks of exynos990 pin-controller 2 (HSI1) */
 static struct samsung_pin_bank_data exynos990_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0x08, 0x0c),
 };
 
 /* pin banks of exynos990 pin-controller 3 (HSI2) */
 static struct samsung_pin_bank_data exynos990_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0x00, 0x00),
 };
 
 /* pin banks of exynos990 pin-controller 4 (PERIC0) */
 static struct samsung_pin_bank_data exynos990_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0a0, "gpg0", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0x10, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0a0, "gpg0", 0x14, 0x28),
 };
 
 /* pin banks of exynos990 pin-controller 5 (PERIC1) */
 static struct samsung_pin_bank_data exynos990_pin_banks5[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpc0", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpg1", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0e0, "gpb0", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0x10, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpc0", 0x14, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpg1", 0x18, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0e0, "gpb0", 0x1c, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0x20, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0x24, 0x44),
 };
 
 /* pin banks of exynos990 pin-controller 6 (VTS) */
 static struct samsung_pin_bank_data exynos990_pin_banks6[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0x00, 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst = {
@@ -1085,87 +1085,87 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
 /* pin banks of exynos9810 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x000, "etc1"),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3", 0x0c, 0x18),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x0a0, "gpq0"),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0c0, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4", 0x10, 0x20),
 };
 
 /* pin banks of exynos9810 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0x08, 0x10),
 };
 
 /* pin banks of exynos9810 pin-controller 2 (CHUB) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of exynos9810 pin-controller 3 (CMGP) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10", 0x20),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11", 0x24),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12", 0x28),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13", 0x2c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14", 0x30),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm15", 0x34),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm16", 0x38),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm17", 0x3c),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40", 0x40),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41", 0x44),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42", 0x48),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43", 0x4c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14, 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10", 0x20, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11", 0x24, 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12", 0x28, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13", 0x2c, 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14", 0x30, 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm15", 0x34, 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm16", 0x38, 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm17", 0x3c, 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40", 0x40, 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41", 0x44, 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42", 0x48, 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43", 0x4c, 0x4c),
 };
 
 /* pin banks of exynos9810 pin-controller 4 (FSYS0) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0x00, 0x00),
 };
 
 /* pin banks of exynos9810 pin-controller 5 (FSYS1) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0x04, 0x08),
 };
 
 /* pin banks of exynos9810 pin-controller 6 (PERIC0) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg1", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpg2", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg1", 0x14, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpg2", 0x18, 0x2c),
 };
 
 /* pin banks of exynos9810 pin-controller 7 (PERIC1) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpd0", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0c0, "gpg3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpd0", 0x14, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0c0, "gpg3", 0x18, 0x28),
 };
 
 /* pin banks of exynos9810 pin-controller 8 (VTS) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0x00, 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
@@ -1238,55 +1238,55 @@ const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
 
 /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1", 0x04, 0x08),
 	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x040, "gpq0"),
 };
 
 /* pin banks of exynosautov9 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0x0c, 0x18),
 };
 
 /* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04, 0x08),
 };
 
 /* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0x00, 0x00),
 };
 
 /* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0x10, 0x1c),
 };
 
 /* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0x0c, 0x18),
 };
 
 /* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpg3", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0x10, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpg3", 0x14, 0x28),
 };
 
 static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
@@ -1487,16 +1487,16 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
 /* pin banks of exynos8890 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
 };
 
 /* pin banks of exynos8890 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0", 0x00, 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 2 (CCORE) */
@@ -1508,73 +1508,73 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst =
 /* pin banks of exynos8890 pin-controller 3 (ESE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3", 0x00, 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 4 (FP) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2", 0x00, 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04, 0x04),
 };
 
 /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0", 0x00, 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 7 (NFC) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0", 0x00, 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 8 (PERIC0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c, 0x44),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30, 0x4c),
 	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
 };
 
 /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24, 0x44),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28, 0x48),
 };
 
 /* pin banks of exynos8890 pin-controller 10 (TOUCH) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1", 0x00, 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst = {
@@ -1643,69 +1643,69 @@ const struct samsung_pinctrl_of_match_data exynos8890_of_data __initconst = {
 
 /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c, 0x18),
 	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
 };
 
 /* pin banks of exynos8895 pin-controller 1 (ABOX) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08, 0x10),
 };
 
 /* pin banks of exynos8895 pin-controller 2 (VTS) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00, 0x00),
 };
 
 /* pin banks of exynos8895 pin-controller 3 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1", 0x04, 0x04),
 };
 
 /* pin banks of exynos8895 pin-controller 4 (FSYS1) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04, 0x08),
 };
 
 /* pin banks of exynos8895 pin-controller 5 (BUSC) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00, 0x00),
 };
 
 /* pin banks of exynos8895 pin-controller 6 (PERIC0) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18, 0x28),
 };
 
 /* pin banks of exynos8895 pin-controller 7 (PERIC1) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c, 0x50),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30, 0x54),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34, 0x5c),
 };
 
 static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
@@ -1776,36 +1776,36 @@ const struct samsung_pinctrl_of_match_data exynos8895_of_data __initconst = {
 
 /* pin banks of FSD pin-controller 0 (FSYS) */
 static const struct samsung_pin_bank_data fsd_pin_banks0[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x10, 0x18),
 };
 
 /* pin banks of FSD pin-controller 1 (PERIC) */
 static const struct samsung_pin_bank_data fsd_pin_banks1[] __initconst = {
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0x04),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0x0c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0x1c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0x20),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0x24),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0x2c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0x34),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0x38),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0x3c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0x40),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0x44),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0x48),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0x4c),
-	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0x14, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0x18, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0x1c, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0x20, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0x24, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0x28, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0x2c, 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0x30, 0x58),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0x34, 0x60),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0x38, 0x68),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0x3c, 0x70),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0x40, 0x78),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0x44, 0x80),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0x48, 0x88),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0x4c, 0x90),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0x50, 0x98),
 };
 
 /* pin banks of FSD pin-controller 2 (PMU) */
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 41cec8408d0d..7ebfdcaf2781 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -141,24 +141,26 @@
 		.name		= id				\
 	}
 
-#define EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)	\
-	{							\
-		.type		= &bank_type,			\
-		.pctl_offset	= reg,				\
-		.nr_pins	= pins,				\
-		.eint_type	= EINT_TYPE_GPIO,		\
-		.eint_offset	= offs,				\
-		.name		= id				\
+#define EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs, fltcon_offs)	\
+	{									\
+		.type			= &bank_type,				\
+		.pctl_offset		= reg,					\
+		.nr_pins		= pins,					\
+		.eint_type		= EINT_TYPE_GPIO,			\
+		.eint_offset		= offs,					\
+		.eint_fltcon_offset	= fltcon_offs,				\
+		.name			= id					\
 	}
 
-#define EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)	\
-	{							\
-		.type		= &bank_type,			\
-		.pctl_offset	= reg,				\
-		.nr_pins	= pins,				\
-		.eint_type	= EINT_TYPE_WKUP,		\
-		.eint_offset	= offs,				\
-		.name		= id				\
+#define EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs, fltcon_offs)	\
+	{									\
+		.type			= &bank_type,				\
+		.pctl_offset		= reg,					\
+		.nr_pins		= pins,					\
+		.eint_type		= EINT_TYPE_WKUP,			\
+		.eint_offset		= offs,					\
+		.eint_fltcon_offset	= fltcon_offs,				\
+		.name			= id					\
 	}
 
 #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pend_offs)	\
-- 
2.39.2


