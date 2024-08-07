Return-Path: <linux-gpio+bounces-8653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C094A45B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9D71C20D3D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D42B1D1737;
	Wed,  7 Aug 2024 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ORqQCsj5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E31C9DC9
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023153; cv=none; b=EZW981MXa73NgsTEr7z1Cs70Q2DRdCBLzeegdM5Zah1Cm60KvUaKEr1ty0YJZDf1WJ9xwRoDyN8gFqVq09HQ3iHYXqQFcZYjz7f5t2NBwbVD2K10Rr3pqbMvMpHzCLU+f7OOrKYfBZVqio9Um9NGgxUsApgbLwYlppPVgFdc3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023153; c=relaxed/simple;
	bh=aj/++CQ2LIjr5eC/DP1KWBwkjwhM4LjMV/JpqGp5M34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiDlTtItnm1SlS4NnKRU/6AqXItgYAwJObmN6ljeiK7tLnjgD2YI1FEkriPgwfNh4ZcZBRLqX7b2oov1NmX0WPeTb0RxfuzyHVRsfrs8kFAJzOLOPSIV6XcMqmyeuhB9JbgbFMHPF3/Zg3Dy2jJgB1dHgeLs64KL0e9RozpOsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ORqQCsj5; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bd0dsp4BgEfqMbd0ysKP2t; Wed, 07 Aug 2024 11:31:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723023088;
	bh=2C3jei8qGjaeHHaxcoYOstyMZe51q3BSOSUGHICZ6Ic=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ORqQCsj5j62YmMnNQTBT4+g5iYIL1m3+/DdnRUiBsNPVYnLvQWfOMQy0cSCmaSpwI
	 xktdcZ1irO/OZvg2TdiCRXtVPlDNP8KRVnICtGQtU7/ugN9jMqH7cc+hMPh8nekpxw
	 tNBHNJntuIBkcXI9+CprHaK8p6IkLSi9zWtSXxfPJdgbHSOc7BdJXwy5TWvWs0fWkY
	 vq3TVinDFNsJowcn1rdkYf5vszxqZGpkop6QLHnKsQY/YRLOHeeEva3ceFWoc392ox
	 Q2LjlrqnIvtQsH+MvtQw856bx1yDLPFZ50zLpzGDXRLpaxgv69SyuDlZDj39LxKJOg
	 Iw8SI9QzmRuwA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 11:31:28 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] pinctrl: meson: Constify struct meson_pmx_bank
Date: Wed,  7 Aug 2024 11:30:57 +0200
Message-ID: <00e8dec399bd188a241eff694b334e27da096aed.1723022467.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct meson_pmx_bank' are not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increase overall security.


On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  21922	    568	      0	  22490	   57da	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  34222	    688	      0	  34910	   885e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  24945	    440	      0	  25385	   6329	drivers/pinctrl/meson/pinctrl-meson8b.o
  29412	    440	      0	  29852	   749c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18469	    520	      0	  18989	   4a2d	drivers/pinctrl/meson/pinctrl-meson-a1.o
  23155	    648	      0	  23803	   5cfb	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  29653	    712	      0	  30365	   769d	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  23496	    456	      0	  23952	   5d90	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  22224	    456	      0	  22680	   5898	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  24500	    592	      0	  25092	   6204	drivers/pinctrl/meson/pinctrl-meson-s4.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22114	    384	      0	  22498	   57e2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  34510	    384	      0	  34894	   884e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  24945	    440	      0	  25385	   6329	drivers/pinctrl/meson/pinctrl-meson8b.o
  29412	    440	      0	  29852	   749c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18597	    384	      0	  18981	   4a25	drivers/pinctrl/meson/pinctrl-meson-a1.o
  23315	    496	      0	  23811	   5d03	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  29877	    504	      0	  30381	   76ad	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  23496	    456	      0	  23952	   5d90	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  22224	    456	      0	  22680	   5898	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  24692	    384	      0	  25076	   61f4	drivers/pinctrl/meson/pinctrl-meson-s4.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 2 +-
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-a1.c      | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
index aeaa810e855b..b94c494249e9 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
@@ -1054,7 +1054,7 @@ static const struct meson_bank c3_periphs_banks[] = {
 		0x73, 0,  0x74, 0,  0x72, 0,  0x71, 0, 0x70, 0, 0x77, 0),
 };
 
-static struct meson_pmx_bank c3_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank c3_periphs_pmx_banks[] = {
 	/* name	            first	 last        reg offset */
 	BANK_PMX("B",      GPIOB_0,     GPIOB_14,    0x00, 0),
 	BANK_PMX("X",      GPIOX_0,     GPIOX_13,    0x03, 0),
diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
index f880b36c3b54..51128ade05c6 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
@@ -1552,7 +1552,7 @@ static const struct meson_bank t7_periphs_banks[] = {
 		0x83, 0,  0x84,  0,  0x82, 0,  0x81,  0, 0x80, 0, 0x87, 0),
 };
 
-static struct meson_pmx_bank t7_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank t7_periphs_pmx_banks[] = {
 	/*      name	    first	 last        reg  offset */
 	BANK_PMX("D",      GPIOD_0,     GPIOD_12,    0x0a,  0),
 	BANK_PMX("E",      GPIOE_0,     GPIOE_6,     0x0c,  0),
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index e0589ce8dd2e..ff42301e4c0c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -889,7 +889,7 @@ static const struct meson_bank meson_a1_periphs_banks[] = {
 		0x42,  0,  0x41,  0,  0x40,  0,  0x45,  0),
 };
 
-static struct meson_pmx_bank meson_a1_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_a1_periphs_pmx_banks[] = {
 	/*  name	 first	    lask    reg	offset  */
 	BANK_PMX("P",    GPIOP_0, GPIOP_12, 0x0, 0),
 	BANK_PMX("B",    GPIOB_0, GPIOB_6,  0x2, 0),
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index 2ae802ee8241..00c3829216d6 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -27,10 +27,10 @@
 
 static int meson_axg_pmx_get_bank(struct meson_pinctrl *pc,
 			unsigned int pin,
-			struct meson_pmx_bank **bank)
+			const struct meson_pmx_bank **bank)
 {
 	int i;
-	struct meson_axg_pmx_data *pmx = pc->data->pmx_data;
+	const struct meson_axg_pmx_data *pmx = pc->data->pmx_data;
 
 	for (i = 0; i < pmx->num_pmx_banks; i++)
 		if (pin >= pmx->pmx_banks[i].first &&
@@ -42,7 +42,7 @@ static int meson_axg_pmx_get_bank(struct meson_pinctrl *pc,
 	return -EINVAL;
 }
 
-static int meson_pmx_calc_reg_and_offset(struct meson_pmx_bank *bank,
+static int meson_pmx_calc_reg_and_offset(const struct meson_pmx_bank *bank,
 			unsigned int pin, unsigned int *reg,
 			unsigned int *offset)
 {
@@ -59,10 +59,10 @@ static int meson_pmx_calc_reg_and_offset(struct meson_pmx_bank *bank,
 static int meson_axg_pmx_update_function(struct meson_pinctrl *pc,
 			unsigned int pin, unsigned int func)
 {
+	const struct meson_pmx_bank *bank;
 	int ret;
 	int reg;
 	int offset;
-	struct meson_pmx_bank *bank;
 
 	ret = meson_axg_pmx_get_bank(pc, pin, &bank);
 	if (ret)
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index 67147ebaef1b..63b9d471e980 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -17,7 +17,7 @@ struct meson_pmx_bank {
 };
 
 struct meson_axg_pmx_data {
-	struct meson_pmx_bank *pmx_banks;
+	const struct meson_pmx_bank *pmx_banks;
 	unsigned int num_pmx_banks;
 };
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 9968bd68f129..3b27dec7d858 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1017,7 +1017,7 @@ static const struct meson_bank meson_axg_aobus_banks[] = {
 	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
 	/*	 name	 first		lask	   reg	offset  */
 	BANK_PMX("Z",	 GPIOZ_0, GPIOZ_10, 0x2, 0),
 	BANK_PMX("BOOT", BOOT_0,  BOOT_14,  0x0, 0),
@@ -1031,7 +1031,7 @@ static struct meson_axg_pmx_data meson_axg_periphs_pmx_banks_data = {
 	.num_pmx_banks = ARRAY_SIZE(meson_axg_periphs_pmx_banks),
 };
 
-static struct meson_pmx_bank meson_axg_aobus_pmx_banks[] = {
+static const struct meson_pmx_bank meson_axg_aobus_pmx_banks[] = {
 	BANK_PMX("AO", GPIOAO_0, GPIOAO_13, 0x0, 0),
 };
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 0d901b2d1193..272f713f8787 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1342,7 +1342,7 @@ static const struct meson_bank meson_g12a_aobus_banks[] = {
 		3, 16,  2, 16,   0, 16,  4, 16,   1, 16,  1, 0),
 };
 
-static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
 	/*	 name	 first	  last	    reg	 offset  */
 	BANK_PMX("Z",    GPIOZ_0, GPIOZ_15, 0x6, 0),
 	BANK_PMX("H",    GPIOH_0, GPIOH_8,  0xb, 0),
@@ -1357,7 +1357,7 @@ static struct meson_axg_pmx_data meson_g12a_periphs_pmx_banks_data = {
 	.num_pmx_banks	= ARRAY_SIZE(meson_g12a_periphs_pmx_banks),
 };
 
-static struct meson_pmx_bank meson_g12a_aobus_pmx_banks[] = {
+static const struct meson_pmx_bank meson_g12a_aobus_pmx_banks[] = {
 	BANK_PMX("AO",  GPIOAO_0, GPIOAO_11, 0x0, 0),
 	BANK_PMX("E",   GPIOE_0,  GPIOE_2,   0x1, 16),
 };
diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 6641bef76e58..61d459c46c13 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -1180,7 +1180,7 @@ static const struct meson_bank meson_s4_periphs_banks[] = {
 		0x83,  0,  0x84,  0,  0x82, 0,  0x81,  0, 0x80, 0, 0x87, 0),
 };
 
-static struct meson_pmx_bank meson_s4_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_s4_periphs_pmx_banks[] = {
 	/*name	            first	 lask        reg offset*/
 	BANK_PMX("B",      GPIOB_0,     GPIOB_13,    0x00, 0),
 	BANK_PMX("C",      GPIOC_0,     GPIOC_7,     0x9,  0),
-- 
2.45.2


