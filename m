Return-Path: <linux-gpio+bounces-5147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EB989B36C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 19:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F6F2B22150
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927653BBD6;
	Sun,  7 Apr 2024 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8sY57Lh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E583EA76
	for <linux-gpio@vger.kernel.org>; Sun,  7 Apr 2024 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712512276; cv=none; b=U3K97RKr58L9XtO5Jgqy9/OXT7zOleSQoEQ+fKz6gDLnTeQu7dfTP3SqxJBMNQ0DZANAzzLIoPBus6nH+qLuLMsYyaVjOabaKPcXMruHNqEKt8wAcA27dQWIUD3pZfH7rZ1qot1XpPGgh6opZakPo537KfBGpFSpbXznWWKhCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712512276; c=relaxed/simple;
	bh=STCT33lWAbdC34dqXLoOvFVVliGRdCDKuOfy7/jfbhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQ5m+2ysn+9n5zcN+hNiWjiE9PYBaPUeqljqRBieeEgfYAhv3UEoqCnEhLumDrxfuGKBtfEnaf849ELJqbyXaZVTgimu+/wN0wFarneywA/Eef5cu9rXcXfm2A8kaPRYEGrd881RKeXH2iPRjF5IQHpG3csvsEFu6vVUQ/16l8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8sY57Lh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712512273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Urr4YihCj9H+DAXo0lw2qYLFIJlnoJ4Tz/3s7Xp/zgA=;
	b=d8sY57LhJPHxP9Bho707LnRFuYwjkYucU/+cXgBWiYThDmatGatIvK6XBAvgsbPKStKbIh
	JXqpQxGfoh38lXJpMqPzkQYxZdyzawzIKo2phw788wt37NZ5rQMJ59xs9PuMvYGEQqh6+s
	f8HNALaAJlLYLtqT3p2bE3iQ1OScNmA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-bHBNsW1dNw6udLgk7fX1hQ-1; Sun, 07 Apr 2024 13:51:10 -0400
X-MC-Unique: bHBNsW1dNw6udLgk7fX1hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C2D28DEF78;
	Sun,  7 Apr 2024 17:51:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C57BE40B4979;
	Sun,  7 Apr 2024 17:51:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] pinctrl: baytrail: Fix selecting gpio pinctrl state
Date: Sun,  7 Apr 2024 19:50:48 +0200
Message-ID: <20240407175049.11644-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

For all the "score" pin-groups all the intel_pingroup-s to select
the non GPIO function are re-used for byt_score_gpio_groups[].

But this is incorrect since a pin-group includes the mode setting,
which for the non GPIO functions generally is 1, where as to select
the GPIO function mode must be set to 0.

So the GPIO function needs separate intel_pingroup-s with their own mode
value of 0.

Add a new PIN_GROUP_GPIO macro which adds a foo_gpio entry to each
pin-group defined this way and update byt_score_gpio_groups[] to point
to the new foo_gpio entries.

The "sus" usb_oc_grp usb_ulpi_grp and pcu_spi_grp pin-groups are special
because these have a non 0 mode value to select the GPIO functions and
these already have matching foo_gpio pin-groups, leave these are unchanged.

The pmu_clk "sus" groups added in commit 2f46d7f7e959 ("pinctrl: baytrail:
Add pinconf group + function for the pmu_clk") do need to use the new
PIN_GROUP_GPIO macro.

Fixes: 2f46d7f7e959 ("pinctrl: baytrail: Add pinconf group + function for the pmu_clk")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Introduce and use a new PIN_GROUP_GPIO macro
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 74 ++++++++++++------------
 drivers/pinctrl/intel/pinctrl-intel.h    |  4 ++
 2 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 7865ef587788..04d37e121b36 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -278,33 +278,33 @@ static const unsigned int byt_score_plt_clk5_pins[] = { 101 };
 static const unsigned int byt_score_smbus_pins[] = { 51, 52, 53 };
 
 static const struct intel_pingroup byt_score_groups[] = {
-	PIN_GROUP("uart1_grp", byt_score_uart1_pins, 1),
-	PIN_GROUP("uart2_grp", byt_score_uart2_pins, 1),
-	PIN_GROUP("pwm0_grp", byt_score_pwm0_pins, 1),
-	PIN_GROUP("pwm1_grp", byt_score_pwm1_pins, 1),
-	PIN_GROUP("ssp2_grp", byt_score_ssp2_pins, 1),
-	PIN_GROUP("sio_spi_grp", byt_score_sio_spi_pins, 1),
-	PIN_GROUP("i2c5_grp", byt_score_i2c5_pins, 1),
-	PIN_GROUP("i2c6_grp", byt_score_i2c6_pins, 1),
-	PIN_GROUP("i2c4_grp", byt_score_i2c4_pins, 1),
-	PIN_GROUP("i2c3_grp", byt_score_i2c3_pins, 1),
-	PIN_GROUP("i2c2_grp", byt_score_i2c2_pins, 1),
-	PIN_GROUP("i2c1_grp", byt_score_i2c1_pins, 1),
-	PIN_GROUP("i2c0_grp", byt_score_i2c0_pins, 1),
-	PIN_GROUP("ssp0_grp", byt_score_ssp0_pins, 1),
-	PIN_GROUP("ssp1_grp", byt_score_ssp1_pins, 1),
-	PIN_GROUP("sdcard_grp", byt_score_sdcard_pins, byt_score_sdcard_mux_values),
-	PIN_GROUP("sdio_grp", byt_score_sdio_pins, 1),
-	PIN_GROUP("emmc_grp", byt_score_emmc_pins, 1),
-	PIN_GROUP("lpc_grp", byt_score_ilb_lpc_pins, 1),
-	PIN_GROUP("sata_grp", byt_score_sata_pins, 1),
-	PIN_GROUP("plt_clk0_grp", byt_score_plt_clk0_pins, 1),
-	PIN_GROUP("plt_clk1_grp", byt_score_plt_clk1_pins, 1),
-	PIN_GROUP("plt_clk2_grp", byt_score_plt_clk2_pins, 1),
-	PIN_GROUP("plt_clk3_grp", byt_score_plt_clk3_pins, 1),
-	PIN_GROUP("plt_clk4_grp", byt_score_plt_clk4_pins, 1),
-	PIN_GROUP("plt_clk5_grp", byt_score_plt_clk5_pins, 1),
-	PIN_GROUP("smbus_grp", byt_score_smbus_pins, 1),
+	PIN_GROUP_GPIO("uart1_grp", byt_score_uart1_pins, 1),
+	PIN_GROUP_GPIO("uart2_grp", byt_score_uart2_pins, 1),
+	PIN_GROUP_GPIO("pwm0_grp", byt_score_pwm0_pins, 1),
+	PIN_GROUP_GPIO("pwm1_grp", byt_score_pwm1_pins, 1),
+	PIN_GROUP_GPIO("ssp2_grp", byt_score_ssp2_pins, 1),
+	PIN_GROUP_GPIO("sio_spi_grp", byt_score_sio_spi_pins, 1),
+	PIN_GROUP_GPIO("i2c5_grp", byt_score_i2c5_pins, 1),
+	PIN_GROUP_GPIO("i2c6_grp", byt_score_i2c6_pins, 1),
+	PIN_GROUP_GPIO("i2c4_grp", byt_score_i2c4_pins, 1),
+	PIN_GROUP_GPIO("i2c3_grp", byt_score_i2c3_pins, 1),
+	PIN_GROUP_GPIO("i2c2_grp", byt_score_i2c2_pins, 1),
+	PIN_GROUP_GPIO("i2c1_grp", byt_score_i2c1_pins, 1),
+	PIN_GROUP_GPIO("i2c0_grp", byt_score_i2c0_pins, 1),
+	PIN_GROUP_GPIO("ssp0_grp", byt_score_ssp0_pins, 1),
+	PIN_GROUP_GPIO("ssp1_grp", byt_score_ssp1_pins, 1),
+	PIN_GROUP_GPIO("sdcard_grp", byt_score_sdcard_pins, byt_score_sdcard_mux_values),
+	PIN_GROUP_GPIO("sdio_grp", byt_score_sdio_pins, 1),
+	PIN_GROUP_GPIO("emmc_grp", byt_score_emmc_pins, 1),
+	PIN_GROUP_GPIO("lpc_grp", byt_score_ilb_lpc_pins, 1),
+	PIN_GROUP_GPIO("sata_grp", byt_score_sata_pins, 1),
+	PIN_GROUP_GPIO("plt_clk0_grp", byt_score_plt_clk0_pins, 1),
+	PIN_GROUP_GPIO("plt_clk1_grp", byt_score_plt_clk1_pins, 1),
+	PIN_GROUP_GPIO("plt_clk2_grp", byt_score_plt_clk2_pins, 1),
+	PIN_GROUP_GPIO("plt_clk3_grp", byt_score_plt_clk3_pins, 1),
+	PIN_GROUP_GPIO("plt_clk4_grp", byt_score_plt_clk4_pins, 1),
+	PIN_GROUP_GPIO("plt_clk5_grp", byt_score_plt_clk5_pins, 1),
+	PIN_GROUP_GPIO("smbus_grp", byt_score_smbus_pins, 1),
 };
 
 static const char * const byt_score_uart_groups[] = {
@@ -332,12 +332,14 @@ static const char * const byt_score_plt_clk_groups[] = {
 };
 static const char * const byt_score_smbus_groups[] = { "smbus_grp" };
 static const char * const byt_score_gpio_groups[] = {
-	"uart1_grp", "uart2_grp", "pwm0_grp", "pwm1_grp", "ssp0_grp",
-	"ssp1_grp", "ssp2_grp", "sio_spi_grp", "i2c0_grp", "i2c1_grp",
-	"i2c2_grp", "i2c3_grp", "i2c4_grp", "i2c5_grp", "i2c6_grp",
-	"sdcard_grp", "sdio_grp", "emmc_grp", "lpc_grp", "sata_grp",
-	"plt_clk0_grp", "plt_clk1_grp", "plt_clk2_grp", "plt_clk3_grp",
-	"plt_clk4_grp", "plt_clk5_grp", "smbus_grp",
+	"uart1_grp_gpio", "uart2_grp_gpio", "pwm0_grp_gpio",
+	"pwm1_grp_gpio", "ssp0_grp_gpio", "ssp1_grp_gpio", "ssp2_grp_gpio",
+	"sio_spi_grp_gpio", "i2c0_grp_gpio", "i2c1_grp_gpio", "i2c2_grp_gpio",
+	"i2c3_grp_gpio", "i2c4_grp_gpio", "i2c5_grp_gpio", "i2c6_grp_gpio",
+	"sdcard_grp_gpio", "sdio_grp_gpio", "emmc_grp_gpio", "lpc_grp_gpio",
+	"sata_grp_gpio", "plt_clk0_grp_gpio", "plt_clk1_grp_gpio",
+	"plt_clk2_grp_gpio", "plt_clk3_grp_gpio", "plt_clk4_grp_gpio",
+	"plt_clk5_grp_gpio", "smbus_grp_gpio",
 };
 
 static const struct intel_function byt_score_functions[] = {
@@ -456,8 +458,8 @@ static const struct intel_pingroup byt_sus_groups[] = {
 	PIN_GROUP("usb_oc_grp_gpio", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_gpio_mode_values),
 	PIN_GROUP("usb_ulpi_grp_gpio", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_gpio_mode_values),
 	PIN_GROUP("pcu_spi_grp_gpio", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_gpio_mode_values),
-	PIN_GROUP("pmu_clk1_grp", byt_sus_pmu_clk1_pins, 1),
-	PIN_GROUP("pmu_clk2_grp", byt_sus_pmu_clk2_pins, 1),
+	PIN_GROUP_GPIO("pmu_clk1_grp", byt_sus_pmu_clk1_pins, 1),
+	PIN_GROUP_GPIO("pmu_clk2_grp", byt_sus_pmu_clk2_pins, 1),
 };
 
 static const char * const byt_sus_usb_groups[] = {
@@ -469,7 +471,7 @@ static const char * const byt_sus_pmu_clk_groups[] = {
 };
 static const char * const byt_sus_gpio_groups[] = {
 	"usb_oc_grp_gpio", "usb_ulpi_grp_gpio", "pcu_spi_grp_gpio",
-	"pmu_clk1_grp", "pmu_clk2_grp",
+	"pmu_clk1_grp_gpio", "pmu_clk2_grp_gpio",
 };
 
 static const struct intel_function byt_sus_functions[] = {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index fde65e18cd14..6981e2fab93f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -179,6 +179,10 @@ struct intel_community {
 		.modes = __builtin_choose_expr(__builtin_constant_p((m)), NULL, (m)),	\
 	}
 
+#define PIN_GROUP_GPIO(n, p, m)						\
+	 PIN_GROUP(n, p, m),						\
+	 PIN_GROUP(n "_gpio", p, 0)
+
 #define FUNCTION(n, g)							\
 	{								\
 		.func = PINCTRL_PINFUNCTION((n), (g), ARRAY_SIZE(g)),	\
-- 
2.44.0


