Return-Path: <linux-gpio+bounces-8651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D294A463
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CE67B2B5BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07011D1F42;
	Wed,  7 Aug 2024 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mMuB8wFA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8481D1757
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023142; cv=none; b=jVlwyIu4Ktl8imozh/gSEAS5FiUuyNx0dWQPjvknuR3+jp3QM3iK4CYTQarerh4/oDsRvEvWUQUMeQ1WJAn3Vi53Qm2bb1W09wuIFv6YBQ1vp4hyvqqxf2BCfYOgzxswAPhKEwdKPPxYDGJM+xbBd+VxYGbGmK4Q+FFFpjFXvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023142; c=relaxed/simple;
	bh=BYgE1GUjRLUnguJec50eXqEvnonDUY2/FawJOSVqWh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEKo1/uAJVb4VCvZOS4bF3SBb1eUJPG3OXvHz/xXEJoKuz/MLtIaTykUIq62/8HdW7qZcD2ALQOPA3D2F/bIDAA7bEfTfpNim2LOxKP6Dhc4yWCayqNQiNVizfEnfW94aXHcv3m71aPSHrKAQt1kAJxCZcFhOMwDDpHGJ58JNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mMuB8wFA; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bd0dsp4BgEfqMbd0gsKOn2; Wed, 07 Aug 2024 11:31:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723023070;
	bh=564hBimGk2DDlvujlmab4Dw5OpWEdelZ/sCpuI9a0Gc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mMuB8wFAKvFx5syV9wGy9kKdAfKqcHJ1X0j5Jbl4UP8YjbF374MpGMkwlP+GHzwQ3
	 LFuN1zvabOdePyYNA9JH8udA6foPlTabN0DuwtOtsDEny61Tv2zoRs+ssezWQv4TBS
	 Oabun2ZlyLQhOtlyIOKFqfeFHXKGTqhgpOpEDQvA7uOk0C0nm9cwsFCjZhfnDpGMdR
	 0D9zyLO36m8WBvgXTHPcJ9wdbfZ/sjw4v1v9+Mkenpoj1vQu0xg5ZjqPK9BDW06oqP
	 DBgfi6A4tuWyerM3UaGookV5SNp7E4xpiqg+FIbv6Oec2vv/60WcmIRLxHCdB9ejjJ
	 zNUbAd0NGMpgQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 07 Aug 2024 11:31:10 +0200
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
Subject: [PATCH 1/3] pinctrl: meson: Constify struct meson_pmx_group and meson_pmx_func
Date: Wed,  7 Aug 2024 11:30:55 +0200
Message-ID: <18676f51c891782c9c13bd469ec57041e9a6e0ff.1723022467.git.christophe.jaillet@wanadoo.fr>
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

'struct meson_pmx_group' and 'struct meson_pmx_func' are not modified in
these drivers.

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

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/meson/pinctrl-amlogic-c3.c    | 4 ++--
 drivers/pinctrl/meson/pinctrl-amlogic-t7.c    | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson-a1.c      | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson-axg.c     | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 2 +-
 drivers/pinctrl/meson/pinctrl-meson.h         | 4 ++--
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    | 6 +++---
 drivers/pinctrl/meson/pinctrl-meson8.c        | 8 ++++----
 drivers/pinctrl/meson/pinctrl-meson8b.c       | 8 ++++----
 14 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-c3.c b/drivers/pinctrl/meson/pinctrl-amlogic-c3.c
index 04f1e87bae99..9c14a8781680 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-t7.c b/drivers/pinctrl/meson/pinctrl-amlogic-t7.c
index 0aed5de3f068..121158cce4f7 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index d2ac9ca72a3e..11368ee01452 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index cad411d90727..2ae802ee8241 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
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
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 8f4e7154b73f..9fb99af8a348 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 32830269a5b4..28a3a06e40e3 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 2867f397fec6..64f43f4bddb2 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index a2f25fa02852..f812393e5b2c 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 60c7d5003e8a..6a6bd767ae0a 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index ef002b9dd464..1a58f135aca9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -528,7 +528,7 @@ static int meson_pinconf_group_set(struct pinctrl_dev *pcdev,
 				   unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
-	struct meson_pmx_group *group = &pc->data->groups[num_group];
+	const struct meson_pmx_group *group = &pc->data->groups[num_group];
 	int i;
 
 	dev_dbg(pc->dev, "set pinconf for group %s\n", group->name);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 34fc4e8612e4..395362c33d59 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -110,8 +110,8 @@ struct meson_bank {
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
index dd17100efdcf..af479d4b3e2a 100644
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
diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 6cd4b3ec1b40..f1a8950d0bde 100644
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
-- 
2.45.2


