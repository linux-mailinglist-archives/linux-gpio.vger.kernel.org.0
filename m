Return-Path: <linux-gpio+bounces-8652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D2E94A45A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3665728399B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAB21D1731;
	Wed,  7 Aug 2024 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MeACkENj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F2E1D1723
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023152; cv=none; b=UszEiwcH5ia3drQV4mbujeGaY36klBw39e62GVqNmnCXzkdvKxWd0p/Uv/+J8hO+ezugaazE8I4XYV4AJCAMdxtyd/sAmuk7/9VKfyh7xxSxPIcMblzjH7vIIyDG7TkAXUlO6uRXyr99Zfg/khEX3laYdoCqrjNiEHT6CGKLjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023152; c=relaxed/simple;
	bh=MHs5eZc9xHTNYyTHCGC6sET1uRc3FKADsedYYLneOGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7tVkk7MK5PpfgzTTK1kcddHSphTp+Et299N6myrBw3k6LMIeDc2ds/gpzhgi7QVhLTD53ThLxlTEphRJ4p74NZSvS4Cbk9vSGu45/YSJa+6hVr+MpbdZXKUm0cr538vYuLIFMRJnoH2JTNJ8yLSStvlzmO7d1TQXa+9M9aO32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MeACkENj; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bd0dsp4BgEfqMbd0ksKOqu; Wed, 07 Aug 2024 11:31:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723023078;
	bh=bsI1qKNELC3ZAxwyF5BnU/06ie3d7l3SL5EkeyJY11Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MeACkENjzmthnJ8Bn/5QsNgrPgrDcg7YvxzV/mHCmv9idL1y94bq0N+x9LG2rricy
	 bFogyIOCDw0sK5ZGaCkYLfjsWo7FiI17NIbFwNYCgKn0kM5OwhxX2mhofVrSlljY15
	 sZnWjWm0zIJBwecOKUkNirPf6WhQsejcOYMW8MrdJBvOQPzX2vtXfGebQR3wnanJdi
	 10ArUxNvsYNInK3OtXMXGQMbxRTPYbBIFCQ1dx1dnn2rC1ctzofNHSiOL1nLgeDtKr
	 AcXuQByVy9LRy+LxW6t7RCS06dMVegOMdjqgoOQW6PcP17L2UunzNkgf+qqEE/+Iit
	 TfZ6mzYk3LyLA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 11:31:18 +0200
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
Subject: [PATCH 2/3] pinctrl: meson: Constify struct meson_bank
Date: Wed,  7 Aug 2024 11:30:56 +0200
Message-ID: <9c720086e1bba8dc44f15ac435711468d0e6a591.1723022467.git.christophe.jaillet@wanadoo.fr>
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

'struct meson_bank' are not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increase overall security.


On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  21410	   1096	      0	  22506	   57ea	drivers/pinctrl/meson/pinctrl-amlogic-c3.o
  33358	   1552	      0	  34910	   885e	drivers/pinctrl/meson/pinctrl-amlogic-t7.o
  24049	   1336	      0	  25385	   6329	drivers/pinctrl/meson/pinctrl-meson8b.o
  28804	   1048	      0	  29852	   749c	drivers/pinctrl/meson/pinctrl-meson8.o
   3070	    324	      0	   3394	    d42	drivers/pinctrl/meson/pinctrl-meson8-pmx.o
  18085	    888	      0	  18973	   4a1d	drivers/pinctrl/meson/pinctrl-meson-a1.o
  22675	   1112	      0	  23787	   5ceb	drivers/pinctrl/meson/pinctrl-meson-axg.o
   2470	    120	      0	   2590	    a1e	drivers/pinctrl/meson/pinctrl-meson-axg-pmx.o
  29045	   1320	      0	  30365	   769d	drivers/pinctrl/meson/pinctrl-meson-g12a.o
  22824	   1136	      0	  23960	   5d98	drivers/pinctrl/meson/pinctrl-meson-gxbb.o
  21616	   1064	      0	  22680	   5898	drivers/pinctrl/meson/pinctrl-meson-gxl.o
  20507	   1132	     48	  21687	   54b7	drivers/pinctrl/meson/pinctrl-meson.o
  23924	   1168	      0	  25092	   6204	drivers/pinctrl/meson/pinctrl-meson-s4.o

After:
=====
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

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c |  2 +-
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c |  2 +-
 drivers/pinctrl/meson/pinctrl-meson-a1.c   |  2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg.c  |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson-g12a.c |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson-s4.c   |  2 +-
 drivers/pinctrl/meson/pinctrl-meson.c      | 23 +++++++++++-----------
 drivers/pinctrl/meson/pinctrl-meson.h      |  2 +-
 drivers/pinctrl/meson/pinctrl-meson8.c     |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson8b.c    |  4 ++--
 12 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
index 9c14a8781680..aeaa810e855b 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
@@ -1036,7 +1036,7 @@ static const struct meson_pmx_func c3_periphs_functions[] = {
 	FUNCTION(lcd),
 };
 
-static struct meson_bank c3_periphs_banks[] = {
+static const struct meson_bank c3_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in ds */
 	BANK_DS("X",      GPIOX_0,      GPIOX_13,   40, 53,
 		0x03, 0,  0x04, 0,  0x02, 0,  0x01, 0, 0x00, 0, 0x07, 0),
diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
index 121158cce4f7..f880b36c3b54 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
@@ -1524,7 +1524,7 @@ static const struct meson_pmx_func t7_periphs_functions[] = {
 	FUNCTION(mic_mute),
 };
 
-static struct meson_bank t7_periphs_banks[] = {
+static const struct meson_bank t7_periphs_banks[] = {
 	/* name  first  last  irq pullen  pull  dir  out  in  ds */
 	BANK_DS("D",      GPIOD_0,     GPIOD_12, 57, 69,
 		0x03, 0,  0x04,  0,  0x02,  0, 0x01, 0,  0x00, 0, 0x07, 0),
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index 11368ee01452..e0589ce8dd2e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -875,7 +875,7 @@ static const struct meson_pmx_func meson_a1_periphs_functions[] = {
 	FUNCTION(mute),
 };
 
-static struct meson_bank meson_a1_periphs_banks[] = {
+static const struct meson_bank meson_a1_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in  ds*/
 	BANK_DS("P",  GPIOP_0,  GPIOP_12,  0,  12, 0x3,  0,  0x4,  0,
 		0x2,  0,  0x1,  0,  0x0,  0,  0x5,  0),
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 9fb99af8a348..9968bd68f129 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1003,7 +1003,7 @@ static const struct meson_pmx_func meson_axg_aobus_functions[] = {
 	FUNCTION(gen_clk_ee),
 };
 
-static struct meson_bank meson_axg_periphs_banks[] = {
+static const struct meson_bank meson_axg_periphs_banks[] = {
 	/*   name    first      last       irq	     pullen  pull    dir     out     in  */
 	BANK("Z",    GPIOZ_0,	GPIOZ_10, 14,  24, 3,  0,  3,  0,  9,  0,  10, 0,  11, 0),
 	BANK("BOOT", BOOT_0,	BOOT_14,  25,  39, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
@@ -1012,7 +1012,7 @@ static struct meson_bank meson_axg_periphs_banks[] = {
 	BANK("Y", 	 GPIOY_0,	GPIOY_15, 84,  99, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
 };
 
-static struct meson_bank meson_axg_aobus_banks[] = {
+static const struct meson_bank meson_axg_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
 };
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 28a3a06e40e3..0d901b2d1193 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1317,7 +1317,7 @@ static const struct meson_pmx_func meson_g12a_aobus_functions[] = {
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 64f43f4bddb2..45d292e339fa 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -845,7 +845,7 @@ static const struct meson_pmx_func meson_gxbb_aobus_functions[] = {
 	FUNCTION(cec_ao),
 };
 
-static struct meson_bank meson_gxbb_periphs_banks[] = {
+static const struct meson_bank meson_gxbb_periphs_banks[] = {
 	/*   name    first      last       irq       pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,	GPIOX_22,  106, 128, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
 	BANK("Y",    GPIOY_0,	GPIOY_16,   89, 105, 1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
@@ -857,7 +857,7 @@ static struct meson_bank meson_gxbb_periphs_banks[] = {
 	BANK("CLK",  GPIOCLK_0,	GPIOCLK_3, 129, 132, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
-static struct meson_bank meson_gxbb_aobus_banks[] = {
+static const struct meson_bank meson_gxbb_aobus_banks[] = {
 	/*   name    first      last       irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index f812393e5b2c..8744750be015 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -807,7 +807,7 @@ static const struct meson_pmx_func meson_gxl_aobus_functions[] = {
 	FUNCTION(cec_ao),
 };
 
-static struct meson_bank meson_gxl_periphs_banks[] = {
+static const struct meson_bank meson_gxl_periphs_banks[] = {
 	/*   name    first      last       irq	     pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,	GPIOX_18,   89, 107, 4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
 	BANK("DV",   GPIODV_0,	GPIODV_29,  83,  88, 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
@@ -818,7 +818,7 @@ static struct meson_bank meson_gxl_periphs_banks[] = {
 	BANK("CLK",  GPIOCLK_0,	GPIOCLK_1, 108, 109, 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
 };
 
-static struct meson_bank meson_gxl_aobus_banks[] = {
+static const struct meson_bank meson_gxl_aobus_banks[] = {
 	/*   name    first      last      irq	pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 6a6bd767ae0a..6641bef76e58 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -1160,7 +1160,7 @@ static const struct meson_pmx_func meson_s4_periphs_functions[] = {
 	FUNCTION(s2_demod),
 };
 
-static struct meson_bank meson_s4_periphs_banks[] = {
+static const struct meson_bank meson_s4_periphs_banks[] = {
 	/* name  first  last  irq  pullen  pull  dir  out  in */
 	BANK_DS("B", GPIOB_0,    GPIOB_13,  0, 13,
 		0x63,  0,  0x64,  0,  0x62, 0,  0x61, 0,  0x60, 0, 0x67, 0),
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 1a58f135aca9..253a0cc57e39 100644
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
index 395362c33d59..d94d9d9fa5e9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -115,7 +115,7 @@ struct meson_pinctrl_data {
 	unsigned int num_pins;
 	unsigned int num_groups;
 	unsigned int num_funcs;
-	struct meson_bank *banks;
+	const struct meson_bank *banks;
 	unsigned int num_banks;
 	const struct pinmux_ops *pmx_ops;
 	void *pmx_data;
diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index af479d4b3e2a..c0db0b1c8564 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -1063,7 +1063,7 @@ static const struct meson_pmx_func meson8_aobus_functions[] = {
 	FUNCTION(hdmi_cec_ao),
 };
 
-static struct meson_bank meson8_cbus_banks[] = {
+static const struct meson_bank meson8_cbus_banks[] = {
 	/*   name    first     last         irq       pullen  pull    dir     out     in  */
 	BANK("X",    GPIOX_0,  GPIOX_21,    112, 133, 4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
 	BANK("Y",    GPIOY_0,  GPIOY_16,    95,  111, 3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
@@ -1074,7 +1074,7 @@ static struct meson_bank meson8_cbus_banks[] = {
 	BANK("BOOT", BOOT_0,   BOOT_18,     39,   57, 2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
 };
 
-static struct meson_bank meson8_aobus_banks[] = {
+static const struct meson_bank meson8_aobus_banks[] = {
 	/*   name    first     last         irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0, 16,  0,  0,  0,  0,  0, 16,  1,  0),
 };
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index f1a8950d0bde..5b9042849966 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -917,7 +917,7 @@ static const struct meson_pmx_func meson8b_aobus_functions[] = {
 	FUNCTION(hdmi_cec),
 };
 
-static struct meson_bank meson8b_cbus_banks[] = {
+static const struct meson_bank meson8b_cbus_banks[] = {
 	/*   name        first          last        irq       pullen   pull     dir      out      in   */
 	BANK("X0..11",	 GPIOX_0,	GPIOX_11,   97, 108,  4,  0,   4,  0,   0,  0,   1,  0,   2,  0),
 	BANK("X16..21",	 GPIOX_16,	GPIOX_21,  113, 118,  4, 16,   4, 16,   0, 16,   1, 16,   2, 16),
@@ -938,7 +938,7 @@ static struct meson_bank meson8b_cbus_banks[] = {
 	BANK("DIF",	 DIF_0_P,	DIF_4_N,    -1,  -1,  5,  8,   5,  8,  12, 12,  13, 12,  14, 12),
 };
 
-static struct meson_bank meson8b_aobus_banks[] = {
+static const struct meson_bank meson8b_aobus_banks[] = {
 	/*   name    first     lastc        irq    pullen  pull    dir     out     in  */
 	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
 };
-- 
2.45.2


