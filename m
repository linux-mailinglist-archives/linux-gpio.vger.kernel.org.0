Return-Path: <linux-gpio+bounces-29209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A759BC9ADC6
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 10:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19BEF4E31F5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6832130DEC6;
	Tue,  2 Dec 2025 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dy9myO9Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C975F21770B
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667834; cv=none; b=eAIHBZWxQ0+JaC6bAOh+Mga8Wyj5vA8+uTltZzl+CqyqsfyI0JxzLMgTawrVIvr/w/xlQgWmCtORkfJp8UJQyIX1rsi5woK+Z0rpicoq+hd7vh4NADE12U7+f0SutSxzqDjiofg8NyR8jWQ5GGCCPlzAWjUV1PueSt9CCKAj3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667834; c=relaxed/simple;
	bh=ANQjGpV34MiZtaYsTQtLkwtdFvmK2IdXOKKwcTsb564=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=BnWSYYfmu8K2YnniAZ2Rv1ExWA5V3SD3nnAwIy5nIAYS2esAPObaI5X+xCEd6kK5lL5Uj2zyGzf2izc48gYaoJ0ZnQkBp2mRc8jKNqPFiLyxVDjnxIwc/fYE870aThvxdu6z49pYwn+attEORPlcfHvOJ1aSohKb3zufLtPcVUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dy9myO9Z; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251202093027epoutp03d6ba6d3e9bd615cfad4a4f1c80ad6c43~9XAoqdQFv1984219842epoutp03C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251202093027epoutp03d6ba6d3e9bd615cfad4a4f1c80ad6c43~9XAoqdQFv1984219842epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764667827;
	bh=Tq6uRYh4WGiFNoA6OH2eM3BYYSyv0ZGESJVkNDvQP+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dy9myO9Z7fQXUG4xeH5IG15LheMJ8pwcanMpqW1pbt91sNMmcePzCSONzdbNmy5Ml
	 TbqPsWLmmoEY/IIJMUQiwWXuiu2r+gKim3SvhnSLYJSm5rVcYzKxcn+A72nRetWEFE
	 mRrxFmHHaWDNwoQ3oKjnNTwDr239VjDoVPUKAg1I=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251202093027epcas2p1976ea9829dd9689db84e26c6a709fb09~9XAoHHgRr0391603916epcas2p1P;
	Tue,  2 Dec 2025 09:30:27 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dLFqk5j1Bz2SSKm; Tue,  2 Dec
	2025 09:30:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251202093026epcas2p28ddfd32305695df996841fd73b231b6b~9XAnP4t503085430854epcas2p2m;
	Tue,  2 Dec 2025 09:30:26 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093026epsmtip16e8d671d96eb54cb5ba3d402294ceab9~9XAnJnP6_1252612526epsmtip1f;
	Tue,  2 Dec 2025 09:30:26 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
	jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros under
 EXYNOS9_* and pass bank_type explicitly
Date: Tue,  2 Dec 2025 18:36:08 +0900
Message-ID: <20251202093613.852109-2-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202093613.852109-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251202093026epcas2p28ddfd32305695df996841fd73b231b6b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093026epcas2p28ddfd32305695df996841fd73b231b6b
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093026epcas2p28ddfd32305695df996841fd73b231b6b@epcas2p2.samsung.com>

Modern Exynos platforms have several near-duplicate pin-bank macro
families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
tables verbose and harder to share across SoCs that differ only by
bank_type (alive/off) layout.

This patch unifies them into one EXYNOS9_* macro family and makes the
bank_type an explicit argument. The common 850-era bank types are also
renamed to 'exynos9_bank_type_{alive,off}' to reflect their reuse on
later Exynos 9xxx-generation parts.

Naming rationale:
- Use of the EXYNOS9_* prefix indicates that these macros target
  current Exynos generations sharing the same register layout and
  EINT wiring model. Compared to SoC-specific prefixes
  (EXYNOS850_*, EXYNOS8895_*),
  EXYNOS9_* is clearer and more future-proof for modern parts.

Key changes:
- Introduce:
  - 'EXYNOS9_PIN_BANK_EINTN(bank_type, pins, reg, id)'
  - 'EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)'
  - 'EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)'
- Rename:
  - 'exynos850_bank_type_alive'-> 'exynos9_bank_type_alive'
  - 'exynos850_bank_type_off'  -> 'exynos9_bank_type_off'
- Convert pin-bank tables for:
  - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
    AutoV9, AutoV920, FSD
- Update GS101/EXYNOSV920 helpers to reference 'exynos9_bank_type_*'
  instead of the old exynos850 names.
- Standardize on EXYNOS9_* macros while keeping SoC-specific
  '*_bank_type_*' when layouts differ (e.g., 7870/8895).

No functional change intended.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 785 +++++++++---------
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  49 +-
 2 files changed, 402 insertions(+), 432 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 627dca504d7a..d11b2d4ca913 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -53,7 +53,7 @@ static const struct samsung_pin_bank_type exynos7870_bank_type_alive = {
  * Bank type for non-alive type. Bit fields:
  * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
  */
-static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
+static const struct samsung_pin_bank_type exynos9_bank_type_off = {
 	.fld_width = { 4, 1, 4, 4, 2, 4, },
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
 };
@@ -62,7 +62,7 @@ static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
  * Bank type for alive type. Bit fields:
  * CON: 4, DAT: 1, PUD: 4, DRV: 4
  */
-static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
+static const struct samsung_pin_bank_type exynos9_bank_type_alive = {
 	.fld_width = { 4, 1, 4, 4, },
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
 };
@@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
 
 /* pin banks of exynos2200 pin-controller - ALIVE */
 static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
 	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
 	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
 	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
@@ -102,90 +102,90 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
 
 /* pin banks of exynos2200 pin-controller - CMGP */
 static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTW(2, 0x0, "gpm0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x20, "gpm1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x40, "gpm2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpm3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpm4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xa0, "gpm5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xc0, "gpm6", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpm7", 0x1c),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x100, "gpm8", 0x20),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x120, "gpm9", 0x24),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x140, "gpm10", 0x28),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x160, "gpm11", 0x2c),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x180, "gpm12", 0x30),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x1a0, "gpm13", 0x34),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm20", 0x48),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm21", 0x4c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm22", 0x50),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm23", 0x54),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x2c0, "gpm24", 0x58),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8", 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9", 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10", 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11", 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12", 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13", 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20", 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21", 0x4c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22", 0x50),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23", 0x54),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24", 0x58),
 };
 
 /* pin banks of exynos2200 pin-controller - HSI1 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - UFS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - HSI1UFS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x00),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC0 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpb0",  0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpb1",  0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpb2",  0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpb3",  0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4",  0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpc0",  0x14),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xc0, "gpc1",  0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc2",  0x1c),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x100, "gpg1",  0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpg2",  0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  0x24),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC1 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0,  "gpp7",  0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp8",  0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp9",  0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp10", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0x0c),
 };
 
 /* pin banks of exynos2200 pin-controller - PERIC2 */
 static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpp0",  0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1",  0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2",  0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp3",  0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp5",  0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp6",  0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp11", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc3",  0x1c),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpc4",  0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpc5",  0x24),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x140, "gpc6",  0x28),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpc7",  0x2c),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x180, "gpc8",  0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpc9",  0x34),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x1c0, "gpg0",  0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  0x38),
 };
 
 /* pin banks of exynos2200 pin-controller - VTS */
 static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpv0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
@@ -638,70 +638,70 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 
 /* pin banks of exynos7870 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __initconst = {
-	EXYNOS7870_PIN_BANK_EINTN(6, 0x000, "etc0"),
-	EXYNOS7870_PIN_BANK_EINTN(3, 0x020, "etc1"),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
-	EXYNOS7870_PIN_BANK_EINTN(2, 0x0c0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 6, 0x000, "etc0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 3, 0x020, "etc1"),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 2, 0x0c0, "gpq0"),
 };
 
 /* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpz0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x020, "gpz1", 0x04),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x040, "gpz2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2", 0x08),
 };
 
 /* pin banks of exynos7870 pin-controller 2 (ESE) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpc7", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7", 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 3 (FSYS) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpr0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x040, "gpr2", 0x08),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpr3", 0x0c),
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x080, "gpr4", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4", 0x10),
 };
 
 /* pin banks of exynos7870 pin-controller 4 (MIF) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0", 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 5 (NFC) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpc2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2", 0x00),
 };
 
 /* pin banks of exynos7870 pin-controller 6 (TOP) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpb0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x020, "gpc0", 0x04),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x040, "gpc1", 0x08),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpc4", 0x0c),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpc5", 0x10),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x0a0, "gpc6", 0x14),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x0c0, "gpc8", 0x18),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x0e0, "gpc9", 0x1c),
-	EXYNOS8895_PIN_BANK_EINTG(7, 0x100, "gpd1", 0x20),
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x120, "gpd2", 0x24),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x140, "gpd3", 0x28),
-	EXYNOS8895_PIN_BANK_EINTG(7, 0x160, "gpd4", 0x2c),
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x1a0, "gpe0", 0x34),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x1c0, "gpf0", 0x38),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x1e0, "gpf1", 0x3c),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x200, "gpf2", 0x40),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x220, "gpf3", 0x44),
-	EXYNOS8895_PIN_BANK_EINTG(5, 0x240, "gpf4", 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4", 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0", 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1", 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2", 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3", 0x44),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4", 0x48),
 };
 
 /* pin banks of exynos7870 pin-controller 7 (TOUCH) */
 static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpc3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3", 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
@@ -770,46 +770,46 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
 	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
 	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(5, 0x0a0, "gpq0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
 };
 
 /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0x08),
 };
 
 /* pin banks of exynos7885 pin-controller 2 (FSYS) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf2", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x040, "gpf3", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x060, "gpf4", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0x0c),
 };
 
 /* pin banks of exynos7885 pin-controller 3 (TOP) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x020, "gpg0", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x080, "gpp3", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0a0, "gpp4", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0c0, "gpp5", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x0e0, "gpp6", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpp7", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp8", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x140, "gpg1", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x160, "gpg2", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x180, "gpg3", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpg4", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpc0", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x1e0, "gpc1", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpc2", 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0x40),
 };
 
 static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
@@ -850,59 +850,59 @@ const struct samsung_pinctrl_of_match_data exynos7885_of_data __initconst = {
 /* pin banks of exynos850 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTN(3, 0x0a0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos850 pin-controller 1 (CMGP) */
 static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpm5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpm6", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpm7", 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c),
 };
 
 /* pin banks of exynos850 pin-controller 2 (AUD) */
 static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0x04),
 };
 
 /* pin banks of exynos850 pin-controller 3 (HSI) */
 static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0x00),
 };
 
 /* pin banks of exynos850 pin-controller 4 (CORE) */
 static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0x04),
 };
 
 /* pin banks of exynos850 pin-controller 5 (PERI) */
 static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0a0, "gpg2", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(1, 0x0c0, "gpg3", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x0e0, "gpc0", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0x20),
 };
 
 static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
@@ -946,98 +946,97 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 /* pin banks of exynos990 pin-controller 0 (ALIVE) */
 static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x080, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTN(7, 0x0A0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 7, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos990 pin-controller 1 (CMGP) */
 static struct samsung_pin_bank_data exynos990_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTN(1, 0x000, "gpm0"),
-	EXYNOS850_PIN_BANK_EINTN(1, 0x020, "gpm1"),
-	EXYNOS850_PIN_BANK_EINTN(1, 0x040, "gpm2"),
-	EXYNOS850_PIN_BANK_EINTN(1, 0x060, "gpm3"),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x1c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x20),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm13", 0x24),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm14", 0x28),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm15", 0x2c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x30),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x34),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x38),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x3c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x40),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x2A0, "gpm21", 0x44),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x2C0, "gpm22", 0x48),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x2E0, "gpm23", 0x4c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x50),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x54),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x340, "gpm26", 0x58),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x360, "gpm27", 0x5c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x380, "gpm28", 0x60),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x3A0, "gpm29", 0x64),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x3C0, "gpm30", 0x68),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x3E0, "gpm31", 0x6c),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x400, "gpm32", 0x70),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x420, "gpm33", 0x74),
-
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x000, "gpm0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x020, "gpm1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x040, "gpm2"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x060, "gpm3"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9", 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10", 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11", 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12", 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm13", 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18", 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19", 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20", 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm21", 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm22", 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2e0, "gpm23", 0x4c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24", 0x50),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25", 0x54),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26", 0x58),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27", 0x5c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28", 0x60),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3a0, "gpm29", 0x64),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3c0, "gpm30", 0x68),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3e0, "gpm31", 0x6c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32", 0x70),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33", 0x74),
 };
 
 /* pin banks of exynos990 pin-controller 2 (HSI1) */
 static struct samsung_pin_bank_data exynos990_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x040, "gpf2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0x08),
 };
 
 /* pin banks of exynos990 pin-controller 3 (HSI2) */
 static struct samsung_pin_bank_data exynos990_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0x00),
 };
 
 /* pin banks of exynos990 pin-controller 4 (PERIC0) */
 static struct samsung_pin_bank_data exynos990_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp3", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp4", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0A0, "gpg0", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0a0, "gpg0", 0x14),
 };
 
 /* pin banks of exynos990 pin-controller 5 (PERIC1) */
 static struct samsung_pin_bank_data exynos990_pin_banks5[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp5", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp6", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp7", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp8", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp9", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0A0, "gpc0", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0C0, "gpg1", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0E0, "gpb0", 0x1C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpb1", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x120, "gpb2", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpc0", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpg1", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0e0, "gpb0", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0x24),
 };
 
 /* pin banks of exynos990 pin-controller 6 (VTS) */
 static struct samsung_pin_bank_data exynos990_pin_banks6[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpv0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst = {
@@ -1085,88 +1084,88 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
 
 /* pin banks of exynos9810 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x000, "etc1"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x0a0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0c0, "gpa4", 0x10),
 };
 
 /* pin banks of exynos9810 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0x08),
 };
 
 /* pin banks of exynos9810 pin-controller 2 (CHUB) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0x04),
 };
 
 /* pin banks of exynos9810 pin-controller 3 (CMGP) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
-	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10", 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11", 0x24),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12", 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13", 0x2c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14", 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1a0, "gpm15", 0x34),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm16", 0x38),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm17", 0x3c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40", 0x40),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41", 0x44),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42", 0x48),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43", 0x4c),
 };
 
 /* pin banks of exynos9810 pin-controller 4 (FSYS0) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0x00),
 };
 
 /* pin banks of exynos9810 pin-controller 5 (FSYS1) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0x04),
 };
 
 /* pin banks of exynos9810 pin-controller 6 (PERIC0) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg1", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpg2", 0x18),
 };
 
 /* pin banks of exynos9810 pin-controller 7 (PERIC1) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpd0", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0c0, "gpg3", 0x18),
 };
 
 /* pin banks of exynos9810 pin-controller 8 (VTS) */
 static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
@@ -1239,55 +1238,55 @@ const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
 
 /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x020, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTN(2, 0x040, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x040, "gpq0"),
 };
 
 /* pin banks of exynosautov9 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpb2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpb3", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0x0c),
 };
 
 /* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
 };
 
 /* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf8", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0x00),
 };
 
 /* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf3", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x040, "gpf4", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpf5", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x080, "gpf6", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0x10),
 };
 
 /* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x060, "gpg0", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0x0c),
 };
 
 /* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp3", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp4", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp5", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpg1", 0x0C),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg2", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpg3", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0a0, "gpg3", 0x14),
 };
 
 static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
@@ -1349,7 +1348,7 @@ const struct samsung_pinctrl_of_match_data exynosautov9_of_data __initconst = {
 static const struct samsung_pin_bank_data exynosautov920_pin_banks0[] = {
 	EXYNOSV920_PIN_BANK_EINTW(8, 0x0000, "gpa0", 0x18, 0x24, 0x28),
 	EXYNOSV920_PIN_BANK_EINTW(2, 0x1000, "gpa1", 0x18, 0x20, 0x24),
-	EXYNOS850_PIN_BANK_EINTN(2, 0x2000, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x2000, "gpq0"),
 };
 
 /* pin banks of exynosautov920 pin-controller 1 (AUD) */
@@ -1488,94 +1487,94 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
 /* pin banks of exynos8890 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
-	EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
 };
 
 /* pin banks of exynos8890 pin-controller 1 (AUD) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gph0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 2 (CCORE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "etc0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 3 (ESE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpf3", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 4 (FP) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpi1", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
 };
 
 /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gpj0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 7 (NFC) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0", 0x00),
 };
 
 /* pin banks of exynos8890 pin-controller 8 (PERIC0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x000, "gpi0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpd0", 0x04),
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x040, "gpd1", 0x08),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpd2", 0x0c),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x080, "gpd3", 0x10),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x0A0, "gpb1", 0x14),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x0C0, "gpb2", 0x18),
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x0E0, "gpb0", 0x1c),
-	EXYNOS8895_PIN_BANK_EINTG(5, 0x100, "gpc0", 0x20),
-	EXYNOS8895_PIN_BANK_EINTG(5, 0x120, "gpc1", 0x24),
-	EXYNOS8895_PIN_BANK_EINTG(6, 0x140, "gpc2", 0x28),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x160, "gpc3", 0x2c),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x180, "gpk0", 0x30),
-	EXYNOS8895_PIN_BANK_EINTG(7, 0x1A0, "etc1", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
 };
 
 /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpe5", 0x04),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x040, "gpe6", 0x08),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x060, "gpj1", 0x0c),
-	EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpj2", 0x10),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x0A0, "gpe2", 0x14),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x0C0, "gpe3", 0x18),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x0E0, "gpe4", 0x1c),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x100, "gpe1", 0x20),
-	EXYNOS8895_PIN_BANK_EINTG(4, 0x120, "gpe7", 0x24),
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x140, "gpg0", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
 };
 
 /* pin banks of exynos8890 pin-controller 10 (TOUCH) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1", 0x00),
 };
 
 static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst = {
@@ -1644,69 +1643,69 @@ const struct samsung_pinctrl_of_match_data exynos8890_of_data __initconst = {
 
 /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
-	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
-	EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
-	EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
-	EXYNOS_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
-	EXYNOS_PIN_BANK_EINTW(7, 0x0a0, "gpa4", 0x24),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
 };
 
 /* pin banks of exynos8895 pin-controller 1 (ABOX) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
-	EXYNOS_PIN_BANK_EINTG(7, 0x020, "gph1", 0x04),
-	EXYNOS_PIN_BANK_EINTG(4, 0x040, "gph3", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08),
 };
 
 /* pin banks of exynos8895 pin-controller 2 (VTS) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gph2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00),
 };
 
 /* pin banks of exynos8895 pin-controller 3 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __initconst = {
-	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpi0", 0x00),
-	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1", 0x04),
 };
 
 /* pin banks of exynos8895 pin-controller 4 (FSYS1) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj1", 0x00),
-	EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpj0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04),
 };
 
 /* pin banks of exynos8895 pin-controller 5 (BUSC) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(2, 0x000, "gpb2", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00),
 };
 
 /* pin banks of exynos8895 pin-controller 6 (PERIC0) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpd0", 0x00),
-	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpd1", 0x04),
-	EXYNOS_PIN_BANK_EINTG(4, 0x040, "gpd2", 0x08),
-	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpd3", 0x0C),
-	EXYNOS_PIN_BANK_EINTG(4, 0x080, "gpb1", 0x10),
-	EXYNOS_PIN_BANK_EINTG(8, 0x0a0, "gpe7", 0x14),
-	EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpf1", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18),
 };
 
 /* pin banks of exynos8895 pin-controller 7 (PERIC1) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
-	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
-	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
-	EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
-	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
-	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
-	EXYNOS_PIN_BANK_EINTG(4, 0x0a0, "gpk0", 0x14),
-	EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpe5", 0x18),
-	EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
-	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
-	EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
-	EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
-	EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
-	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
-	EXYNOS_PIN_BANK_EINTG(2, 0x1a0, "gpg0", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
 };
 
 static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
@@ -1777,41 +1776,41 @@ const struct samsung_pinctrl_of_match_data exynos8895_of_data __initconst = {
 
 /* pin banks of FSD pin-controller 0 (FSYS) */
 static const struct samsung_pin_bank_data fsd_pin_banks0[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(7, 0x00, "gpf0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gpf1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gpf6", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpf4", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x80, "gpf5", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x10),
 };
 
 /* pin banks of FSD pin-controller 1 (PERIC) */
 static const struct samsung_pin_bank_data fsd_pin_banks1[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpc8", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x020, "gpf2", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpf3", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpd0", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpb0", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0a0, "gpb1", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0c0, "gpb4", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x0e0, "gpb5", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpb6", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x120, "gpb7", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x140, "gpd1", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(5, 0x160, "gpd2", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x180, "gpd3", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x1a0, "gpg0", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x1c0, "gpg1", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x1e0, "gpg2", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpg3", 0x40),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x220, "gpg4", 0x44),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x240, "gpg5", 0x48),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x260, "gpg6", 0x4c),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x280, "gpg7", 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0x44),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0x50),
 };
 
 /* pin banks of FSD pin-controller 2 (PMU) */
 static const struct samsung_pin_bank_data fsd_pin_banks2[] __initconst = {
-	EXYNOS850_PIN_BANK_EINTN(3, 0x00, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x00, "gpq0"),
 };
 
 static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index c9c38f8988dd..41cec8408d0d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -132,37 +132,18 @@
 		.pctl_res_idx   = pctl_idx,			\
 	}							\
 
-#define EXYNOS7870_PIN_BANK_EINTN(pins, reg, id)		\
+#define EXYNOS9_PIN_BANK_EINTN(bank_type, pins, reg, id)	\
 	{							\
-		.type		= &exynos7870_bank_type_alive,	\
+		.type		= &bank_type,			\
 		.pctl_offset	= reg,				\
 		.nr_pins	= pins,				\
 		.eint_type	= EINT_TYPE_NONE,		\
 		.name		= id				\
 	}
 
-#define EXYNOS7870_PIN_BANK_EINTW(pins, reg, id, offs)		\
+#define EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)	\
 	{							\
-		.type		= &exynos7870_bank_type_alive,	\
-		.pctl_offset	= reg,				\
-		.nr_pins	= pins,				\
-		.eint_type	= EINT_TYPE_WKUP,		\
-		.eint_offset	= offs,				\
-		.name		= id				\
-	}
-
-#define EXYNOS850_PIN_BANK_EINTN(pins, reg, id)			\
-	{							\
-		.type		= &exynos850_bank_type_alive,	\
-		.pctl_offset	= reg,				\
-		.nr_pins	= pins,				\
-		.eint_type	= EINT_TYPE_NONE,		\
-		.name		= id				\
-	}
-
-#define EXYNOS850_PIN_BANK_EINTG(pins, reg, id, offs)		\
-	{							\
-		.type		= &exynos850_bank_type_off,	\
+		.type		= &bank_type,			\
 		.pctl_offset	= reg,				\
 		.nr_pins	= pins,				\
 		.eint_type	= EINT_TYPE_GPIO,		\
@@ -170,9 +151,9 @@
 		.name		= id				\
 	}
 
-#define EXYNOS850_PIN_BANK_EINTW(pins, reg, id, offs)		\
+#define EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)	\
 	{							\
-		.type		= &exynos850_bank_type_alive,	\
+		.type		= &bank_type,			\
 		.pctl_offset	= reg,				\
 		.nr_pins	= pins,				\
 		.eint_type	= EINT_TYPE_WKUP,		\
@@ -180,19 +161,9 @@
 		.name		= id				\
 	}
 
-#define EXYNOS8895_PIN_BANK_EINTG(pins, reg, id, offs)		\
-	{							\
-		.type		= &exynos8895_bank_type_off,	\
-		.pctl_offset	= reg,				\
-		.nr_pins	= pins,				\
-		.eint_type	= EINT_TYPE_GPIO,		\
-		.eint_offset	= offs,				\
-		.name		= id				\
-	}
-
 #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pend_offs)	\
 	{							\
-		.type			= &exynos850_bank_type_off,	\
+		.type			= &exynos9_bank_type_off,	\
 		.pctl_offset		= reg,				\
 		.nr_pins		= pins,				\
 		.eint_type		= EINT_TYPE_GPIO,		\
@@ -204,7 +175,7 @@
 
 #define EXYNOSV920_PIN_BANK_EINTW(pins, reg, id, con_offs, mask_offs, pend_offs)	\
 	{							\
-		.type			= &exynos850_bank_type_alive,	\
+		.type			= &exynos9_bank_type_alive,	\
 		.pctl_offset		= reg,				\
 		.nr_pins		= pins,				\
 		.eint_type		= EINT_TYPE_WKUP,		\
@@ -216,7 +187,7 @@
 
 #define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
 	{							\
-		.type			= &exynos850_bank_type_off,	\
+		.type			= &exynos9_bank_type_off,	\
 		.pctl_offset		= reg,			\
 		.nr_pins		= pins,			\
 		.eint_type		= EINT_TYPE_GPIO,	\
@@ -227,7 +198,7 @@
 
 #define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
 	{								\
-		.type			= &exynos850_bank_type_alive,	\
+		.type			= &exynos9_bank_type_alive,	\
 		.pctl_offset		= reg,				\
 		.nr_pins		= pins,				\
 		.eint_type		= EINT_TYPE_WKUP,		\
-- 
2.52.0


