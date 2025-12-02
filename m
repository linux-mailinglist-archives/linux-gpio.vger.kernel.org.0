Return-Path: <linux-gpio+bounces-29212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891CC9ADDE
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 10:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEDD23A6190
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 09:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0585B30EF71;
	Tue,  2 Dec 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pbSHWawN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9830C63A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667839; cv=none; b=pUry718PPiXouNIRZpzfj9EpZEbaiIj+W5IGfLZVEg6YhZYbF2eIGNZWbLGnsO2v3W9IzWsjZFl8VSoAPXHncqx127ayd4rAaB7+FCIEet6uFb52jjf11a5elMiVgL04WC9+wHhkctH+HWakPLp7hJMmGqB6TXB+nKyla/14mbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667839; c=relaxed/simple;
	bh=QwVTIqqylhEdmhWX5Qa2YcrfUnE9YpD6aJB9/FA+98U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Mn6WIvnXotqCqWufFefLKwTJYMJXUjxslMlGVJaNhFtBif/mNp22cqWHAAwO9VJH0HpduuT6hdDGaHsGVgsqWfRaYHvQSP+lKCBp40FrmPPLM31DXEebgcdgZxBiHQFgHnolLj4Utxq/GJ2DqHoC+V35/e7ZgLq5tVvkaw4M6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pbSHWawN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251202093030epoutp01d5d044bf66441de34c1f200a97c46cd6~9XAq-86B61958119581epoutp01X
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2025 09:30:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251202093030epoutp01d5d044bf66441de34c1f200a97c46cd6~9XAq-86B61958119581epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764667830;
	bh=o/WHvhFZgVA98eyqwC6EQj1Ee/5m17NXAEA4xiQvdXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pbSHWawND9AVnAtWyn1KopzUHeEmkaZXpEwD/M8whIedlITBfxmTs2b2G1fR+XBYp
	 PM4KGwIDd8aOaJi9i7FlQg/0Fh2nq2cSAgQmYue2sXrlE+awKOASjEPU7GeWcdo9Yk
	 acTnxAmh7VzLWWO4rribJakrSCRb04Bkcdi3EZEs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251202093029epcas2p26b229d721b4d54478716edb4c311a782~9XAqaSsPX0077900779epcas2p2A;
	Tue,  2 Dec 2025 09:30:29 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.202]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dLFqn1y05z3hhTC; Tue,  2 Dec
	2025 09:30:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa~9XApjETq-0393603936epcas2p1s;
	Tue,  2 Dec 2025 09:30:28 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093028epsmtip1903b9eeefc7e9a03532fe2baa913c14c~9XApdCH340810608106epsmtip1f;
	Tue,  2 Dec 2025 09:30:28 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
	jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v3 4/5] pinctrl: samsung: fold GS101 pin-bank macros into
 EXYNOS9_*
Date: Tue,  2 Dec 2025 18:36:11 +0900
Message-ID: <20251202093613.852109-5-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202093613.852109-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa@epcas2p1.samsung.com>

GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers, but they are
redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics, including
the per-bank .eint_fltcon_offset).
This change removes the GS101_* macros and switches the GS101 pin-bank
tables to the EXYNOS9_* helpers with exynos9_bank_type_{alive,off}.
While here, update the struct comment to note FLTCON is Exynos9-specific
(not 'GS101-specific').

One macro family for all Exynos9-era SoCs (incl. GS101) reduces
copy-paste drift and keeps the FLTCON handling consistent.
There is no functional change.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> (tested on Pixel6/gs101)
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 98 +++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h      | 22 -----
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  4 +-
 3 files changed, 51 insertions(+), 73 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 92ae1bc80f9c..f473a576f58c 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1842,83 +1842,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 
 /* pin banks of gs101 pin-controller (ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_alive[] = {
-	GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
-	GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
-	GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
-	GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
-	GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
-	GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
-	GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
-	GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0x20, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x40, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x60, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x80, "gpa4", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0xa0, "gpa5", 0x14, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0xc0, "gpa9", 0x18, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpa10", 0x1c, 0x30),
 };
 
 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
-	GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
-	GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
-	GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
-	GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa6", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x20, "gpa7", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa8", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpa11", 0x0c, 0x14),
 };
 
 /* pin banks of gs101 pin-controller (GSACORE) */
 static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
-	GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
-	GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
-	GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gps0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gps1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gps2", 0x08, 0x0c),
 };
 
 /* pin banks of gs101 pin-controller (GSACTRL) */
 static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
-	GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 6, 0x0, "gps3", 0x00, 0x00),
 };
 
 /* pin banks of gs101 pin-controller (PERIC0) */
 static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
-	GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
-	GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
-	GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
-	GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
-	GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
-	GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
-	GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
-	GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
-	GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
-	GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
-	GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
-	GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
-	GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
-	GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
-	GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
-	GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
-	GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
-	GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
-	GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
-	GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpp3", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4", 0x10, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpp5", 0x14, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp6", 0x18, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpp7", 0x1c, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x100, "gpp8", 0x20, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp9", 0x24, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x140, "gpp10", 0x28, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpp11", 0x2c, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x180, "gpp12", 0x30, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpp13", 0x34, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpp14", 0x38, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1e0, "gpp15", 0x3c, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x200, "gpp16", 0x40, 0x44),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x220, "gpp17", 0x44, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x240, "gpp18", 0x48, 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x260, "gpp19", 0x4c, 0x50),
 };
 
 /* pin banks of gs101 pin-controller (PERIC1) */
 static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
-	GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
-	GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
-	GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
-	GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
-	GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
-	GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
-	GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
-	GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0, "gpp20", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp21", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x40, "gpp22", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x60, "gpp23", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp24", 0x10, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp25", 0x14, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0xc0, "gpp26", 0x18, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xe0, "gpp27", 0x1c, 0x28),
 };
 
 /* pin banks of gs101 pin-controller (HSI1) */
 static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
-	GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
-	GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x20, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of gs101 pin-controller (HSI2) */
 static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
-	GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
-	GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
-	GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph2", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x20, "gph3", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x40, "gph4", 0x08, 0x0c),
 };
 
 static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7ebfdcaf2781..24f85ff5ed30 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -187,28 +187,6 @@
 		.name			= id				\
 	}
 
-#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
-	{							\
-		.type			= &exynos9_bank_type_off,	\
-		.pctl_offset		= reg,			\
-		.nr_pins		= pins,			\
-		.eint_type		= EINT_TYPE_GPIO,	\
-		.eint_offset		= offs,			\
-		.eint_fltcon_offset	= fltcon_offs,		\
-		.name			= id			\
-	}
-
-#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
-	{								\
-		.type			= &exynos9_bank_type_alive,	\
-		.pctl_offset		= reg,				\
-		.nr_pins		= pins,				\
-		.eint_type		= EINT_TYPE_WKUP,		\
-		.eint_offset		= offs,				\
-		.eint_fltcon_offset	= fltcon_offs,			\
-		.name			= id				\
-	}
-
 #define ARTPEC_PIN_BANK_EINTG(pins, reg, id, offs)			\
 	{								\
 		.type			= &artpec_bank_type_off,	\
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 0f7b2ea98158..0209c2d28858 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -145,7 +145,7 @@ struct samsung_pin_bank_type {
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
- * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
+ * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -180,7 +180,7 @@ struct samsung_pin_bank_data {
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
- * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
+ * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
-- 
2.52.0


