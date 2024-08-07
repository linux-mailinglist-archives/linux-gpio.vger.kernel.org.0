Return-Path: <linux-gpio+bounces-8665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89194AF5B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 20:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C9A1C20FFB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 18:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565E413DB90;
	Wed,  7 Aug 2024 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lvxiRCRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-210.smtpout.orange.fr [193.252.23.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C11386C6;
	Wed,  7 Aug 2024 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723053968; cv=none; b=YyrHoSeH89KjjrrZ15fnSCRCaujl/VthbkpcDlF9KrLovwnDpkZPuxOfc1cXqrehqA5THTCw7VFT8aBzfREXdB4ZAqf9pJbLONVBIUSwz5PsDjsZrHitOd9STn0qqZ14h03oTRYYD6a3SRUcpyF/3RPp3L3y16w7pU2cbXov580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723053968; c=relaxed/simple;
	bh=FjR7cH/AXMgF2qcIHMvs3kP9ryNU/T4uBvQzOETdKkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZIl6rq2DNwU/cAAIbCLHn1K4tuD+7gyLnrSlMvKl2DGlLQgU7nnTK5h/Z0h/Sy5Di4tFNH3TLcDOpYhsdXzqDNeThpRB+Qg9HJEAIJdEw2OR0abHBbxONerE50FGidzTuOxMU8gzmniRbqkqvzhtZMgpVrZHLCNlNjJv6d5bbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lvxiRCRf; arc=none smtp.client-ip=193.252.23.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bl2lskduHJ0ftbl2lsPwG0; Wed, 07 Aug 2024 20:05:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723053956;
	bh=XsnSip/UQMIfmGG+Nu8wWlXtm1D/0x/299eGd5I7dcg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lvxiRCRfF4KyaWIc26xf68UmUOmjY58SMy5bssxDpvg4dl5OaVAYYKBLWSbyOxRDx
	 AlJVqkAr2rHki/q3bgO0m7u1U5EXQvzbr4qp5T2mSxCxCP3mt3ifFBBk1M4fKdgbMN
	 Bij04lfj8RT70+hCuPbgEpTQDIlY4BhNl54ZqcLI4rIAEcqcWCigAVsTsCbmvoiTeG
	 fJn871hGkU6gF/V2AafQ+A0gphhbw758RbAvRWsUCDKM21xgS6WXD2KFU2FdunrnRM
	 4gSK6AqWf9XqRIb70o58fFa/ApLjcnW9uoLBx4m/ZBAVKkEg1ES6LqdefTdGEjMrZE
	 CkPe1LQSF01CQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 20:05:56 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2] pinctrl: meson: Constify some structures
Date: Wed,  7 Aug 2024 20:05:36 +0200
Message-ID: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following structures are not modified in these drivers.
  - struct meson_bank
  - struct meson_pmx_bank
  - struct meson_pmx_func
  - struct meson_pmx_group
  - struct meson_pinctrl_data
  - struct meson_axg_pmx_data

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  10818	  11696	      0	  22514	   57f2	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  17198	  17680	      0	  34878	   883e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  14161	  11200	      0	  25361	   6311	drivers/pinctrl/meson/pinctrl-meson8b.o
  17348	  12512	      0	  29860	   74a4	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
   9317	   9648	      0	  18965	   4a15	drivers/pinctrl/meson/pinctrl-meson-a1.o
  12115	  11664	      0	  23779	   5ce3	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  15125	  15224	      0	  30349	   768d	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  13800	  10160	      0	  23960	   5d98	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  13040	   9648	      0	  22688	   58a0	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  12212	  12880	      0	  25092	   6204	drivers/pinctrl/meson/pinctrl-meson-s4.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  22242	    248	      0	  22490	   57da	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  34638	    248	      0	  34886	   8846	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  25137	    232	      0	  25369	   6319	drivers/pinctrl/meson/pinctrl-meson8b.o
  29604	    232	      0	  29836	   748c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18725	    248	      0	  18973	   4a1d	drivers/pinctrl/meson/pinctrl-meson-a1.o
  23539	    248	      0	  23787	   5ceb	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  30101	    256	      0	  30357	   7695	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  23688	    248	      0	  23936	   5d80	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  22416	    248	      0	  22664	   5888	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  24820	    248	      0	  25068	   61ec	drivers/pinctrl/meson/pinctrl-meson-s4.o
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

In order to compile them, I've updated Kconfig to add some "| COMPILE_TEST"
on 'depends' line.
Should it be useful, I can send a patch to add it, but I don't think it
would be that useful.

Changes in v2:
  - Merge 3 patches into only 1   [Jerome Brunet]
  - Add constification of struct meson_pinctrl_data and
    struct meson_axg_pmx_data   [Jerome Brunet]

v1: https://lore.kernel.org/all/cover.1723022467.git.christophe.jaillet@wanadoo.fr/
---
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-a1.c      | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h |  2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 24 +++++++++---------
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 24 +++++++++---------
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 12 ++++-----
 drivers/pinctrl/meson/pinctrl-meson.c         | 25 ++++++++++---------
 drivers/pinctrl/meson/pinctrl-meson.h         |  8 +++---
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    |  6 ++---
 drivers/pinctrl/meson/pinctrl-meson8.c        | 16 ++++++------
 drivers/pinctrl/meson/pinctrl-meson8b.c       | 16 ++++++------
 15 files changed, 107 insertions(+), 106 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
index 04f1e87bae99..776d32465ab9 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
@@ -375,7 +375,7 @@ static const unsigned int spi_a_mosi_a_pins[]		= { GPIOA_3 };
 static const unsigned int gen_clk_a4_pins[]		= { GPIOA_4 };
 static const unsigned int clk12_24_a_pins[]		= { GPIOA_5 };
 
-static struct meson_pmx_group c3_periphs_groups[] = {
+static const struct meson_pmx_group c3_periphs_groups[] = {
 	GPIO_GROUP(GPIOE_0),
 	GPIO_GROUP(GPIOE_1),
 	GPIO_GROUP(GPIOE_2),
@@ -987,7 +987,7 @@ static const char * const lcd_groups[] = {
 	"lcd_clk_a", "lcd_clk_x", "lcd_hs", "lcd_vs",
 };
 
-static struct meson_pmx_func c3_periphs_functions[] = {
+static const struct meson_pmx_func c3_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(uart_a),
 	FUNCTION(uart_b),
@@ -1036,7 +1036,7 @@ static struct meson_pmx_func c3_periphs_functions[] = {
 	FUNCTION(lcd),
 };
 
-static struct meson_bank c3_periphs_banks[] = {
+static const struct meson_bank c3_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in ds */
 	BANK_DS("X",      GPIOX_0,      GPIOX_13,   40, 53,
 		0x03, 0,  0x04, 0,  0x02, 0,  0x01, 0, 0x00, 0, 0x07, 0),
@@ -1054,7 +1054,7 @@ static struct meson_bank c3_periphs_banks[] = {
 		0x73, 0,  0x74, 0,  0x72, 0,  0x71, 0, 0x70, 0, 0x77, 0),
 };
 
-static struct meson_pmx_bank c3_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank c3_periphs_pmx_banks[] = {
 	/* name	            first	 last        reg offset */
 	BANK_PMX("B",      GPIOB_0,     GPIOB_14,    0x00, 0),
 	BANK_PMX("X",      GPIOX_0,     GPIOX_13,    0x03, 0),
@@ -1065,12 +1065,12 @@ static struct meson_pmx_bank c3_periphs_pmx_banks[] = {
 	BANK_PMX("TEST_N", GPIO_TEST_N, GPIO_TEST_N, 0x02, 0),
 };
 
-static struct meson_axg_pmx_data c3_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data c3_periphs_pmx_banks_data = {
 	.pmx_banks	= c3_periphs_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(c3_periphs_pmx_banks),
 };
 
-static struct meson_pinctrl_data c3_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data c3_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= c3_periphs_pins,
 	.groups		= c3_periphs_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
index 0aed5de3f068..cfd98b9dcb68 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
@@ -535,7 +535,7 @@ static const unsigned int i2c0_sck_h_pins[]		= { GPIOH_7 };
 /* Bank H func3 */
 static const unsigned int pcieck_reqn_h_pins[]		= { GPIOH_2 };
 
-static struct meson_pmx_group t7_periphs_groups[] = {
+static const struct meson_pmx_group t7_periphs_groups[] = {
 	GPIO_GROUP(GPIOB_0),
 	GPIO_GROUP(GPIOB_1),
 	GPIO_GROUP(GPIOB_2),
@@ -1443,7 +1443,7 @@ static const char * const mic_mute_groups[] = {
 	"mic_mute_key", "mic_mute_led",
 };
 
-static struct meson_pmx_func t7_periphs_functions[] = {
+static const struct meson_pmx_func t7_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
@@ -1524,7 +1524,7 @@ static struct meson_pmx_func t7_periphs_functions[] = {
 	FUNCTION(mic_mute),
 };
 
-static struct meson_bank t7_periphs_banks[] = {
+static const struct meson_bank t7_periphs_banks[] = {
 	/* name  first  last  irq pullen  pull  dir  out  in  ds */
 	BANK_DS("D",      GPIOD_0,     GPIOD_12, 57, 69,
 		0x03, 0,  0x04,  0,  0x02,  0, 0x01, 0,  0x00, 0, 0x07, 0),
@@ -1552,7 +1552,7 @@ static struct meson_bank t7_periphs_banks[] = {
 		0x83, 0,  0x84,  0,  0x82, 0,  0x81,  0, 0x80, 0, 0x87, 0),
 };
 
-static struct meson_pmx_bank t7_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank t7_periphs_pmx_banks[] = {
 	/*      name	    first	 last        reg  offset */
 	BANK_PMX("D",      GPIOD_0,     GPIOD_12,    0x0a,  0),
 	BANK_PMX("E",      GPIOE_0,     GPIOE_6,     0x0c,  0),
@@ -1568,12 +1568,12 @@ static struct meson_pmx_bank t7_periphs_pmx_banks[] = {
 	BANK_PMX("TEST_N", GPIO_TEST_N, GPIO_TEST_N, 0x09,  0),
 };
 
-static struct meson_axg_pmx_data t7_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data t7_periphs_pmx_banks_data = {
 	.pmx_banks	= t7_periphs_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(t7_periphs_pmx_banks),
 };
 
-static struct meson_pinctrl_data t7_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data t7_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= t7_periphs_pins,
 	.groups		= t7_periphs_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index d2ac9ca72a3e..20c4323d4223 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -339,7 +339,7 @@ static const unsigned int tst_out11_pins[]		= { GPIOA_11 };
 static const unsigned int mute_key_pins[]		= { GPIOA_4 };
 static const unsigned int mute_en_pins[]		= { GPIOA_5 };
 
-static struct meson_pmx_group meson_a1_periphs_groups[] = {
+static const struct meson_pmx_group meson_a1_periphs_groups[] = {
 	GPIO_GROUP(GPIOP_0),
 	GPIO_GROUP(GPIOP_1),
 	GPIO_GROUP(GPIOP_2),
@@ -832,7 +832,7 @@ static const char * const mute_groups[] = {
 	"mute_key", "mute_en",
 };
 
-static struct meson_pmx_func meson_a1_periphs_functions[] = {
+static const struct meson_pmx_func meson_a1_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(psram),
 	FUNCTION(pwm_a),
@@ -875,7 +875,7 @@ static struct meson_pmx_func meson_a1_periphs_functions[] = {
 	FUNCTION(mute),
 };
 
-static struct meson_bank meson_a1_periphs_banks[] = {
+static const struct meson_bank meson_a1_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds*/
 	BANK_DS("P",  GPIOP_0,  GPIOP_12,  0,  12, 0x3,  0,  0x4,  0,
 		0x2,  0,  0x1,  0,  0x0,  0,  0x5,  0),
@@ -889,7 +889,7 @@ static struct meson_bank meson_a1_periphs_banks[] = {
 		0x42,  0,  0x41,  0,  0x40,  0,  0x45,  0),
 };
 
-static struct meson_pmx_bank meson_a1_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_a1_periphs_pmx_banks[] = {
 	/*  name	 first	    lask    reg	offset  */
 	BANK_PMX("P",    GPIOP_0, GPIOP_12, 0x0, 0),
 	BANK_PMX("B",    GPIOB_0, GPIOB_6,  0x2, 0),
@@ -898,12 +898,12 @@ static struct meson_pmx_bank meson_a1_periphs_pmx_banks[] = {
 	BANK_PMX("A",    GPIOA_0, GPIOA_11, 0x8, 0),
 };
 
-static struct meson_axg_pmx_data meson_a1_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_a1_periphs_pmx_banks_data = {
 	.pmx_banks	= meson_a1_periphs_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(meson_a1_periphs_pmx_banks),
 };
 
-static struct meson_pinctrl_data meson_a1_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_a1_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_a1_periphs_pins,
 	.groups		= meson_a1_periphs_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index cad411d90727..00c3829216d6 100644
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
@@ -82,8 +82,8 @@ static int meson_axg_pmx_set_mux(struct pinctrl_dev *pcdev,
 	int i;
 	int ret;
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-	struct meson_pmx_func *func = &pc->data->funcs[func_num];
-	struct meson_pmx_group *group = &pc->data->groups[group_num];
+	const struct meson_pmx_func *func = &pc->data->funcs[func_num];
+	const struct meson_pmx_group *group = &pc->data->groups[group_num];
 	struct meson_pmx_axg_data *pmx_data =
 		(struct meson_pmx_axg_data *)group->data;
 
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
index 8f4e7154b73f..fa2df4896390 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -352,7 +352,7 @@ static const unsigned int tdmb_dout2_pins[] = {GPIOA_12};
 static const unsigned int tdmb_din3_pins[] = {GPIOA_13};
 static const unsigned int tdmb_dout3_pins[] = {GPIOA_13};
 
-static struct meson_pmx_group meson_axg_periphs_groups[] = {
+static const struct meson_pmx_group meson_axg_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
 	GPIO_GROUP(GPIOZ_2),
@@ -675,7 +675,7 @@ static const unsigned int jtag_ao_tms_pins[] = {GPIOAO_7};
 /* gen_clk */
 static const unsigned int gen_clk_ee_pins[] = {GPIOAO_13};
 
-static struct meson_pmx_group meson_axg_aobus_groups[] = {
+static const struct meson_pmx_group meson_axg_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -955,7 +955,7 @@ static const char * const gen_clk_ee_groups[] = {
 	"gen_clk_ee",
 };
 
-static struct meson_pmx_func meson_axg_periphs_functions[] = {
+static const struct meson_pmx_func meson_axg_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
@@ -987,7 +987,7 @@ static struct meson_pmx_func meson_axg_periphs_functions[] = {
 	FUNCTION(tdmc),
 };
 
-static struct meson_pmx_func meson_axg_aobus_functions[] = {
+static const struct meson_pmx_func meson_axg_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao_a),
 	FUNCTION(uart_ao_b),
@@ -1003,7 +1003,7 @@ static struct meson_pmx_func meson_axg_aobus_functions[] = {
 	FUNCTION(gen_clk_ee),
 };
 
-static struct meson_bank meson_axg_periphs_banks[] = {
+static const struct meson_bank meson_axg_periphs_banks[] = {
 	/*   name    first      last       irq	     pullen  pull    dir     out     in  */
 	BANK("Z",    GPIOZ_0,	GPIOZ_10, 14,  24, 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
 	BANK("BOOT", BOOT_0,	BOOT_14,  25,  39, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
@@ -1012,12 +1012,12 @@ static struct meson_bank meson_axg_periphs_banks[] = {
 	BANK("Y", 	 GPIOY_0,	GPIOY_15, 84,  99, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
 };
 
-static struct meson_bank meson_axg_aobus_banks[] = {
+static const struct meson_bank meson_axg_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
 	/*	 name	 first		lask	   reg	offset  */
 	BANK_PMX("Z",	 GPIOZ_0, GPIOZ_10, 0x2, 0),
 	BANK_PMX("BOOT", BOOT_0,  BOOT_14,  0x0, 0),
@@ -1026,21 +1026,21 @@ static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
 	BANK_PMX("Y",	 GPIOY_0, GPIOY_15, 0x8, 0),
 };
 
-static struct meson_axg_pmx_data meson_axg_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_axg_periphs_pmx_banks_data = {
 	.pmx_banks	= meson_axg_periphs_pmx_banks,
 	.num_pmx_banks = ARRAY_SIZE(meson_axg_periphs_pmx_banks),
 };
 
-static struct meson_pmx_bank meson_axg_aobus_pmx_banks[] = {
+static const struct meson_pmx_bank meson_axg_aobus_pmx_banks[] = {
 	BANK_PMX("AO", GPIOAO_0, GPIOAO_13, 0x0, 0),
 };
 
-static struct meson_axg_pmx_data meson_axg_aobus_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_axg_aobus_pmx_banks_data = {
 	.pmx_banks	= meson_axg_aobus_pmx_banks,
 	.num_pmx_banks = ARRAY_SIZE(meson_axg_aobus_pmx_banks),
 };
 
-static struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_axg_periphs_pins,
 	.groups		= meson_axg_periphs_groups,
@@ -1054,7 +1054,7 @@ static struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
 	.pmx_data	= &meson_axg_periphs_pmx_banks_data,
 };
 
-static struct meson_pinctrl_data meson_axg_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson_axg_aobus_pinctrl_data = {
 	.name		= "aobus-banks",
 	.pins		= meson_axg_aobus_pins,
 	.groups		= meson_axg_aobus_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 32830269a5b4..e2788bfc5874 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -436,7 +436,7 @@ static const unsigned int tdm_c_dout1_z_pins[]		= { GPIOZ_3 };
 static const unsigned int tdm_c_dout2_z_pins[]		= { GPIOZ_4 };
 static const unsigned int tdm_c_dout3_z_pins[]		= { GPIOZ_5 };
 
-static struct meson_pmx_group meson_g12a_periphs_groups[] = {
+static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
 	GPIO_GROUP(GPIOZ_2),
@@ -860,7 +860,7 @@ static const unsigned int tdm_ao_b_dout2_pins[]		= { GPIOAO_6 };
 /* mclk0_ao */
 static const unsigned int mclk0_ao_pins[]		= { GPIOAO_9 };
 
-static struct meson_pmx_group meson_g12a_aobus_groups[] = {
+static const struct meson_pmx_group meson_g12a_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -1253,7 +1253,7 @@ static const char * const mclk0_ao_groups[] = {
 	"mclk0_ao",
 };
 
-static struct meson_pmx_func meson_g12a_periphs_functions[] = {
+static const struct meson_pmx_func meson_g12a_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
@@ -1295,7 +1295,7 @@ static struct meson_pmx_func meson_g12a_periphs_functions[] = {
 	FUNCTION(tdm_c),
 };
 
-static struct meson_pmx_func meson_g12a_aobus_functions[] = {
+static const struct meson_pmx_func meson_g12a_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao_a),
 	FUNCTION(uart_ao_b),
@@ -1317,7 +1317,7 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 	FUNCTION(mclk0_ao),
 };
 
-static struct meson_bank meson_g12a_periphs_banks[] = {
+static const struct meson_bank meson_g12a_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
 	BANK_DS("Z",    GPIOZ_0,  GPIOZ_15,  IRQID_GPIOZ_0,  IRQID_GPIOZ_15,
 		4,  0,  4,  0,  12,  0, 13,  0,  14,  0,  5, 0),
@@ -1333,7 +1333,7 @@ static struct meson_bank meson_g12a_periphs_banks[] = {
 		2,  0,  2,  0,   6,  0,  7,  0,   8,  0,  2, 0),
 };
 
-static struct meson_bank meson_g12a_aobus_banks[] = {
+static const struct meson_bank meson_g12a_aobus_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds */
 	BANK_DS("AO",   GPIOAO_0, GPIOAO_11, IRQID_GPIOAO_0, IRQID_GPIOAO_11,
 		3,  0,  2,  0,   0,  0,  4,  0,   1,  0,  0, 0),
@@ -1342,7 +1342,7 @@ static struct meson_bank meson_g12a_aobus_banks[] = {
 		3, 16,  2, 16,   0, 16,  4, 16,   1, 16,  1, 0),
 };
 
-static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
 	/*	 name	 first	  last	    reg	 offset  */
 	BANK_PMX("Z",    GPIOZ_0, GPIOZ_15, 0x6, 0),
 	BANK_PMX("H",    GPIOH_0, GPIOH_8,  0xb, 0),
@@ -1352,17 +1352,17 @@ static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
 	BANK_PMX("X",    GPIOX_0, GPIOX_19, 0x3, 0),
 };
 
-static struct meson_axg_pmx_data meson_g12a_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_g12a_periphs_pmx_banks_data = {
 	.pmx_banks	= meson_g12a_periphs_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(meson_g12a_periphs_pmx_banks),
 };
 
-static struct meson_pmx_bank meson_g12a_aobus_pmx_banks[] = {
+static const struct meson_pmx_bank meson_g12a_aobus_pmx_banks[] = {
 	BANK_PMX("AO",  GPIOAO_0, GPIOAO_11, 0x0, 0),
 	BANK_PMX("E",   GPIOE_0,  GPIOE_2,   0x1, 16),
 };
 
-static struct meson_axg_pmx_data meson_g12a_aobus_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_g12a_aobus_pmx_banks_data = {
 	.pmx_banks	= meson_g12a_aobus_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(meson_g12a_aobus_pmx_banks),
 };
@@ -1375,7 +1375,7 @@ static int meson_g12a_aobus_parse_dt_extra(struct meson_pinctrl *pc)
 	return 0;
 }
 
-static struct meson_pinctrl_data meson_g12a_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_g12a_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_g12a_periphs_pins,
 	.groups		= meson_g12a_periphs_groups,
@@ -1389,7 +1389,7 @@ static struct meson_pinctrl_data meson_g12a_periphs_pinctrl_data = {
 	.pmx_data	= &meson_g12a_periphs_pmx_banks_data,
 };
 
-static struct meson_pinctrl_data meson_g12a_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson_g12a_aobus_pinctrl_data = {
 	.name		= "aobus-banks",
 	.pins		= meson_g12a_aobus_pins,
 	.groups		= meson_g12a_aobus_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 2867f397fec6..4e8b9d7c2e4b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -307,7 +307,7 @@ static const unsigned int spdif_out_ao_13_pins[] = { GPIOAO_13 };
 static const unsigned int ao_cec_pins[]		= { GPIOAO_12 };
 static const unsigned int ee_cec_pins[]		= { GPIOAO_12 };
 
-static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
+static const struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
 	GPIO_GROUP(GPIOZ_2),
@@ -541,7 +541,7 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(sdcard_clk,	2,	11),
 };
 
-static struct meson_pmx_group meson_gxbb_aobus_groups[] = {
+static const struct meson_pmx_group meson_gxbb_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -798,7 +798,7 @@ static const char * const cec_ao_groups[] = {
 	"ao_cec", "ee_cec",
 };
 
-static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
+static const struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
@@ -829,7 +829,7 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(tsin_b),
 };
 
-static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
+static const struct meson_pmx_func meson_gxbb_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(uart_ao_b),
@@ -845,7 +845,7 @@ static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
 	FUNCTION(cec_ao),
 };
 
-static struct meson_bank meson_gxbb_periphs_banks[] = {
+static const struct meson_bank meson_gxbb_periphs_banks[] = {
 	/*   name    first      last       irq       pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,	GPIOX_22,  106, 128, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
 	BANK("Y",    GPIOY_0,	GPIOY_16,   89, 105, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
@@ -857,12 +857,12 @@ static struct meson_bank meson_gxbb_periphs_banks[] = {
 	BANK("CLK",  GPIOCLK_0,	GPIOCLK_3, 129, 132, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
-static struct meson_bank meson_gxbb_aobus_banks[] = {
+static const struct meson_bank meson_gxbb_aobus_banks[] = {
 	/*   name    first      last       irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_gxbb_periphs_pins,
 	.groups		= meson_gxbb_periphs_groups,
@@ -875,7 +875,7 @@ static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
 	.pmx_ops	= &meson8_pmx_ops,
 };
 
-static struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
 	.name		= "aobus-banks",
 	.pins		= meson_gxbb_aobus_pins,
 	.groups		= meson_gxbb_aobus_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index a2f25fa02852..9171de657f97 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -301,7 +301,7 @@ static const unsigned int spdif_out_ao_9_pins[] = { GPIOAO_9 };
 static const unsigned int ao_cec_pins[]		= { GPIOAO_8 };
 static const unsigned int ee_cec_pins[]		= { GPIOAO_8 };
 
-static struct meson_pmx_group meson_gxl_periphs_groups[] = {
+static const struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
 	GPIO_GROUP(GPIOZ_2),
@@ -527,7 +527,7 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(pwm_f_clk,	8,	30),
 };
 
-static struct meson_pmx_group meson_gxl_aobus_groups[] = {
+static const struct meson_pmx_group meson_gxl_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -763,7 +763,7 @@ static const char * const cec_ao_groups[] = {
 	"ao_cec", "ee_cec",
 };
 
-static struct meson_pmx_func meson_gxl_periphs_functions[] = {
+static const struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
@@ -793,7 +793,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(tsin_b),
 };
 
-static struct meson_pmx_func meson_gxl_aobus_functions[] = {
+static const struct meson_pmx_func meson_gxl_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(uart_ao_b),
@@ -807,7 +807,7 @@ static struct meson_pmx_func meson_gxl_aobus_functions[] = {
 	FUNCTION(cec_ao),
 };
 
-static struct meson_bank meson_gxl_periphs_banks[] = {
+static const struct meson_bank meson_gxl_periphs_banks[] = {
 	/*   name    first      last       irq	     pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,	GPIOX_18,   89, 107, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
 	BANK("DV",   GPIODV_0,	GPIODV_29,  83,  88, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
@@ -818,12 +818,12 @@ static struct meson_bank meson_gxl_periphs_banks[] = {
 	BANK("CLK",  GPIOCLK_0,	GPIOCLK_1, 108, 109, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
-static struct meson_bank meson_gxl_aobus_banks[] = {
+static const struct meson_bank meson_gxl_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_gxl_periphs_pins,
 	.groups		= meson_gxl_periphs_groups,
@@ -836,7 +836,7 @@ static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
 	.pmx_ops	= &meson8_pmx_ops,
 };
 
-static struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
 	.name		= "aobus-banks",
 	.pins		= meson_gxl_aobus_pins,
 	.groups		= meson_gxl_aobus_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 60c7d5003e8a..872948699e9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -411,7 +411,7 @@ static const unsigned int s2_demod_gpio0_pins[]		= { GPIOZ_12 };
 static const unsigned int gen_clk_z9_pins[]		= { GPIOZ_9 };
 static const unsigned int gen_clk_z12_pins[]		= { GPIOZ_12 };
 
-static struct meson_pmx_group meson_s4_periphs_groups[] = {
+static const struct meson_pmx_group meson_s4_periphs_groups[] = {
 	GPIO_GROUP(GPIOE_0),
 	GPIO_GROUP(GPIOE_1),
 
@@ -1100,7 +1100,7 @@ static const char * const s2_demod_groups[] = {
 	"s2_demod_gpio3", "s2_demod_gpio2", "s2_demod_gpio1", "s2_demod_gpio0",
 };
 
-static struct meson_pmx_func meson_s4_periphs_functions[] = {
+static const struct meson_pmx_func meson_s4_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(i2c0),
 	FUNCTION(i2c1),
@@ -1160,7 +1160,7 @@ static struct meson_pmx_func meson_s4_periphs_functions[] = {
 	FUNCTION(s2_demod),
 };
 
-static struct meson_bank meson_s4_periphs_banks[] = {
+static const struct meson_bank meson_s4_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in */
 	BANK_DS("B", GPIOB_0,    GPIOB_13,  0, 13,
 		0x63,  0,  0x64,  0,  0x62, 0,  0x61, 0,  0x60, 0, 0x67, 0),
@@ -1180,7 +1180,7 @@ static struct meson_bank meson_s4_periphs_banks[] = {
 		0x83,  0,  0x84,  0,  0x82, 0,  0x81,  0, 0x80, 0, 0x87, 0),
 };
 
-static struct meson_pmx_bank meson_s4_periphs_pmx_banks[] = {
+static const struct meson_pmx_bank meson_s4_periphs_pmx_banks[] = {
 	/*name	            first	 lask        reg offset*/
 	BANK_PMX("B",      GPIOB_0,     GPIOB_13,    0x00, 0),
 	BANK_PMX("C",      GPIOC_0,     GPIOC_7,     0x9,  0),
@@ -1192,12 +1192,12 @@ static struct meson_pmx_bank meson_s4_periphs_pmx_banks[] = {
 	BANK_PMX("TEST_N", GPIO_TEST_N, GPIO_TEST_N, 0xf,  0)
 };
 
-static struct meson_axg_pmx_data meson_s4_periphs_pmx_banks_data = {
+static const struct meson_axg_pmx_data meson_s4_periphs_pmx_banks_data = {
 	.pmx_banks	= meson_s4_periphs_pmx_banks,
 	.num_pmx_banks	= ARRAY_SIZE(meson_s4_periphs_pmx_banks),
 };
 
-static struct meson_pinctrl_data meson_s4_periphs_pinctrl_data = {
+static const struct meson_pinctrl_data meson_s4_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pins		= meson_s4_periphs_pins,
 	.groups		= meson_s4_periphs_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index ef002b9dd464..253a0cc57e39 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -70,7 +70,7 @@ static const unsigned int meson_bit_strides[] = {
  * Return:	0 on success, a negative value on error
  */
 static int meson_get_bank(struct meson_pinctrl *pc, unsigned int pin,
-			  struct meson_bank **bank)
+			  const struct meson_bank **bank)
 {
 	int i;
 
@@ -94,11 +94,12 @@ static int meson_get_bank(struct meson_pinctrl *pc, unsigned int pin,
  * @reg:	the computed register offset
  * @bit:	the computed bit
  */
-static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
+static void meson_calc_reg_and_bit(const struct meson_bank *bank,
+				   unsigned int pin,
 				   enum meson_reg_type reg_type,
 				   unsigned int *reg, unsigned int *bit)
 {
-	struct meson_reg_desc *desc = &bank->regs[reg_type];
+	const struct meson_reg_desc *desc = &bank->regs[reg_type];
 
 	*bit = (desc->bit + pin - bank->first) * meson_bit_strides[reg_type];
 	*reg = (desc->reg + (*bit / 32)) * 4;
@@ -181,7 +182,7 @@ static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
 				      unsigned int reg_type,
 				      bool arg)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit;
 	int ret;
 
@@ -198,7 +199,7 @@ static int meson_pinconf_get_gpio_bit(struct meson_pinctrl *pc,
 				      unsigned int pin,
 				      unsigned int reg_type)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit, val;
 	int ret;
 
@@ -261,7 +262,7 @@ static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
 static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 				      unsigned int pin)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit = 0;
 	int ret;
 
@@ -280,7 +281,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 				     bool pull_up)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit, val = 0;
 	int ret;
 
@@ -308,7 +309,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 					    unsigned int pin,
 					    u16 drive_strength_ua)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit, ds_val;
 	int ret;
 
@@ -399,7 +400,7 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 
 static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit, val;
 	int ret, conf;
 
@@ -435,7 +436,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 					    unsigned int pin,
 					    u16 *drive_strength_ua)
 {
-	struct meson_bank *bank;
+	const struct meson_bank *bank;
 	unsigned int reg, bit;
 	unsigned int val;
 	int ret;
@@ -528,7 +529,7 @@ static int meson_pinconf_group_set(struct pinctrl_dev *pcdev,
 				   unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-	struct meson_pmx_group *group = &pc->data->groups[num_group];
+	const struct meson_pmx_group *group = &pc->data->groups[num_group];
 	int i;
 
 	dev_dbg(pc->dev, "set pinconf for group %s\n", group->name);
@@ -587,8 +588,8 @@ static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 {
 	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	const struct meson_bank *bank;
 	unsigned int reg, bit, val;
-	struct meson_bank *bank;
 	int ret;
 
 	ret = meson_get_bank(pc, gpio, &bank);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 34fc4e8612e4..7883ea31a001 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -110,15 +110,15 @@ struct meson_bank {
 struct meson_pinctrl_data {
 	const char *name;
 	const struct pinctrl_pin_desc *pins;
-	struct meson_pmx_group *groups;
-	struct meson_pmx_func *funcs;
+	const struct meson_pmx_group *groups;
+	const struct meson_pmx_func *funcs;
 	unsigned int num_pins;
 	unsigned int num_groups;
 	unsigned int num_funcs;
-	struct meson_bank *banks;
+	const struct meson_bank *banks;
 	unsigned int num_banks;
 	const struct pinmux_ops *pmx_ops;
-	void *pmx_data;
+	const void *pmx_data;
 	int (*parse_dt)(struct meson_pinctrl *pc);
 };
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index 7f22aa0f8e36..10adf52edda6 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -32,7 +32,7 @@
 static void meson8_pmx_disable_other_groups(struct meson_pinctrl *pc,
 					    unsigned int pin, int sel_group)
 {
-	struct meson_pmx_group *group;
+	const struct meson_pmx_group *group;
 	struct meson8_pmx_data *pmx_data;
 	int i, j;
 
@@ -57,8 +57,8 @@ static int meson8_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned func_num,
 			      unsigned group_num)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-	struct meson_pmx_func *func = &pc->data->funcs[func_num];
-	struct meson_pmx_group *group = &pc->data->groups[group_num];
+	const struct meson_pmx_func *func = &pc->data->funcs[func_num];
+	const struct meson_pmx_group *group = &pc->data->groups[group_num];
 	struct meson8_pmx_data *pmx_data =
 		(struct meson8_pmx_data *)group->data;
 	int i, ret = 0;
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index dd17100efdcf..3da7f3799c3f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -405,7 +405,7 @@ static const unsigned int i2s_out_ch01_ao_pins[] = { GPIOAO_11 };
 
 static const unsigned int hdmi_cec_ao_pins[]	= { GPIOAO_12 };
 
-static struct meson_pmx_group meson8_cbus_groups[] = {
+static const struct meson_pmx_group meson8_cbus_groups[] = {
 	GPIO_GROUP(GPIOX_0),
 	GPIO_GROUP(GPIOX_1),
 	GPIO_GROUP(GPIOX_2),
@@ -745,7 +745,7 @@ static struct meson_pmx_group meson8_cbus_groups[] = {
 	GROUP(sdxc_cmd_b,	2,	4),
 };
 
-static struct meson_pmx_group meson8_aobus_groups[] = {
+static const struct meson_pmx_group meson8_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -1015,7 +1015,7 @@ static const char * const hdmi_cec_ao_groups[] = {
 	"hdmi_cec_ao"
 };
 
-static struct meson_pmx_func meson8_cbus_functions[] = {
+static const struct meson_pmx_func meson8_cbus_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(sd_a),
 	FUNCTION(sdxc_a),
@@ -1051,7 +1051,7 @@ static struct meson_pmx_func meson8_cbus_functions[] = {
 	FUNCTION(spdif),
 };
 
-static struct meson_pmx_func meson8_aobus_functions[] = {
+static const struct meson_pmx_func meson8_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(remote),
@@ -1063,7 +1063,7 @@ static struct meson_pmx_func meson8_aobus_functions[] = {
 	FUNCTION(hdmi_cec_ao),
 };
 
-static struct meson_bank meson8_cbus_banks[] = {
+static const struct meson_bank meson8_cbus_banks[] = {
 	/*   name    first     last         irq       pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,  GPIOX_21,    112, 133, 4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
 	BANK("Y",    GPIOY_0,  GPIOY_16,    95,  111, 3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
@@ -1074,12 +1074,12 @@ static struct meson_bank meson8_cbus_banks[] = {
 	BANK("BOOT", BOOT_0,   BOOT_18,     39,   57, 2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
 };
 
-static struct meson_bank meson8_aobus_banks[] = {
+static const struct meson_bank meson8_aobus_banks[] = {
 	/*   name    first     last         irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0, 16,  0,  0,  0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
+static const struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
 	.name		= "cbus-banks",
 	.pins		= meson8_cbus_pins,
 	.groups		= meson8_cbus_groups,
@@ -1092,7 +1092,7 @@ static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
 	.pmx_ops	= &meson8_pmx_ops,
 };
 
-static struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson8_aobus_pinctrl_data = {
 	.name		= "ao-bank",
 	.pins		= meson8_aobus_pins,
 	.groups		= meson8_aobus_groups,
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 6cd4b3ec1b40..a71e1f41358a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -349,7 +349,7 @@ static const unsigned int eth_ref_clk_pins[]	= { DIF_3_N };
 static const unsigned int eth_mdc_pins[]	= { DIF_4_P };
 static const unsigned int eth_mdio_en_pins[]	= { DIF_4_N };
 
-static struct meson_pmx_group meson8b_cbus_groups[] = {
+static const struct meson_pmx_group meson8b_cbus_groups[] = {
 	GPIO_GROUP(GPIOX_0),
 	GPIO_GROUP(GPIOX_1),
 	GPIO_GROUP(GPIOX_2),
@@ -603,7 +603,7 @@ static struct meson_pmx_group meson8b_cbus_groups[] = {
 	GROUP(eth_rxd2,		7,	23),
 };
 
-static struct meson_pmx_group meson8b_aobus_groups[] = {
+static const struct meson_pmx_group meson8b_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
 	GPIO_GROUP(GPIOAO_2),
@@ -869,7 +869,7 @@ static const char * const tsin_b_groups[] = {
 	"tsin_d0_b", "tsin_clk_b", "tsin_sop_b", "tsin_d_valid_b"
 };
 
-static struct meson_pmx_func meson8b_cbus_functions[] = {
+static const struct meson_pmx_func meson8b_cbus_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(sd_a),
 	FUNCTION(sdxc_a),
@@ -903,7 +903,7 @@ static struct meson_pmx_func meson8b_cbus_functions[] = {
 	FUNCTION(clk_24m),
 };
 
-static struct meson_pmx_func meson8b_aobus_functions[] = {
+static const struct meson_pmx_func meson8b_aobus_functions[] = {
 	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(uart_ao_b),
@@ -917,7 +917,7 @@ static struct meson_pmx_func meson8b_aobus_functions[] = {
 	FUNCTION(hdmi_cec),
 };
 
-static struct meson_bank meson8b_cbus_banks[] = {
+static const struct meson_bank meson8b_cbus_banks[] = {
 	/*   name        first          last        irq       pullen   pull     dir      out      in   */
 	BANK("X0..11",	 GPIOX_0,	GPIOX_11,   97, 108,  4,  0,   4,  0,   0,  0,   1,  0,   2,  0),
 	BANK("X16..21",	 GPIOX_16,	GPIOX_21,  113, 118,  4, 16,   4, 16,   0, 16,   1, 16,   2, 16),
@@ -938,12 +938,12 @@ static struct meson_bank meson8b_cbus_banks[] = {
 	BANK("DIF",	 DIF_0_P,	DIF_4_N,    -1,  -1,  5,  8,   5,  8,  12, 12,  13, 12,  14, 12),
 };
 
-static struct meson_bank meson8b_aobus_banks[] = {
+static const struct meson_bank meson8b_aobus_banks[] = {
 	/*   name    first     lastc        irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
 };
 
-static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
+static const struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
 	.name		= "cbus-banks",
 	.pins		= meson8b_cbus_pins,
 	.groups		= meson8b_cbus_groups,
@@ -956,7 +956,7 @@ static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
 	.pmx_ops	= &meson8_pmx_ops,
 };
 
-static struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
+static const struct meson_pinctrl_data meson8b_aobus_pinctrl_data = {
 	.name		= "aobus-banks",
 	.pins		= meson8b_aobus_pins,
 	.groups		= meson8b_aobus_groups,
-- 
2.45.2


