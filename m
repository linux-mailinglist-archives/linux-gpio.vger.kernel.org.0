Return-Path: <linux-gpio+bounces-5137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B764489AACC
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 14:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C961B2150F
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 12:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5B02869B;
	Sat,  6 Apr 2024 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezHtOohw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8949E546
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712407046; cv=none; b=SnY2UTng07Ex1jIFaw2tFmDmlrktTXE88Cp9MkzJ47XefQAAk49GtaghfFXm5ZAAPEWMeS1EFG9bI/jwlDAgwMjGoMaTYPprZjXwZoI6AJljBP8yH554vz7krTnGa6lNe7vSe4KIKue29mGQK4rg40WXc3sUw7rjfczP5c/vD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712407046; c=relaxed/simple;
	bh=djAgCNDPkGxZBDK2u+hwo6ciFDlBIRLcaRzMAj+Qaco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7wE8pwpeLzMRrIpvXrRY3o8A3V4PnDXvCZWVknYOXv2vR4QPImQt+3vbs/TrTaio0NurzH+OOwaoHGVyuwnYaJAZvVNck9Wy0HJEZKnE4OPh4CcJrcxeV0Aw4+NNulWuF8sOJOjNJOyXaBkOFw35ZAnJSAJpNUY7njJuiDN/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezHtOohw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712407043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rAHjUhjq3IcYGXiSV9+nIDKpr6zTDbIeZL9dtn04BEU=;
	b=ezHtOohw2wklbabsTi9cA7x0vWbKE61iGQKQ+oDRLmZUq/6X2oHitZYOIZ1Yv0gMUm/YZt
	GhQ06FshzQGBT/yAYSgALWMrvK+SDAiIcrFTImW0RUD8BxxIxRGMtFCzoKfC+lobPZLliz
	13MwStdmuTkfR2cgEI6CHBWUmq5YWKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-J3nNPmtNNeWHZb-LF77Z2Q-1; Sat, 06 Apr 2024 08:37:20 -0400
X-MC-Unique: J3nNPmtNNeWHZb-LF77Z2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525E9185A781;
	Sat,  6 Apr 2024 12:37:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF07C04120;
	Sat,  6 Apr 2024 12:37:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: baytrail: Fix selecting gpio pinctrl state
Date: Sat,  6 Apr 2024 14:35:05 +0200
Message-ID: <20240406123506.12078-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

For all the "score" pin-groups all the intel_pingroup-s to select
the non GPIO function are re-used for byt_score_gpio_groups[].

But this is incorrect since a pin-group includes the mode setting,
which for the non GPIO functions generally is 1, where as to select
the GPIO function mode must be set to 0.

So the GPIO function needs separate intel_pingroup-s with their own mode
value of 0.

Add foo_gpio entries for each function to byt_score_groups[] and make all
the byt_score_gpio_groups[] entries point to these instead to fix this.

The "sus" pin-groups got this correct until commit 2f46d7f7e959 ("pinctrl:
baytrail: Add pinconf group + function for the pmu_clk") added support for
the pmu_clk pins following the broken "score" model.

Add pmu_clk?_grp_gpio entries to byt_sus_groups[] and point to those
in byt_sus_gpio_groups[] to fix this.

Fixes: 2f46d7f7e959 ("pinctrl: baytrail: Add pinconf group + function for the pmu_clk")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 45 ++++++++++++++++++++----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 7865ef587788..019a886a37ae 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -279,32 +279,59 @@ static const unsigned int byt_score_smbus_pins[] = { 51, 52, 53 };
 
 static const struct intel_pingroup byt_score_groups[] = {
 	PIN_GROUP("uart1_grp", byt_score_uart1_pins, 1),
+	PIN_GROUP("uart1_grp_gpio", byt_score_uart1_pins, 0),
 	PIN_GROUP("uart2_grp", byt_score_uart2_pins, 1),
+	PIN_GROUP("uart2_grp_gpio", byt_score_uart2_pins, 0),
 	PIN_GROUP("pwm0_grp", byt_score_pwm0_pins, 1),
+	PIN_GROUP("pwm0_grp_gpio", byt_score_pwm0_pins, 0),
 	PIN_GROUP("pwm1_grp", byt_score_pwm1_pins, 1),
+	PIN_GROUP("pwm1_grp_gpio", byt_score_pwm1_pins, 0),
 	PIN_GROUP("ssp2_grp", byt_score_ssp2_pins, 1),
+	PIN_GROUP("ssp2_grp_gpio", byt_score_ssp2_pins, 0),
 	PIN_GROUP("sio_spi_grp", byt_score_sio_spi_pins, 1),
+	PIN_GROUP("sio_spi_grp_gpio", byt_score_sio_spi_pins, 0),
 	PIN_GROUP("i2c5_grp", byt_score_i2c5_pins, 1),
+	PIN_GROUP("i2c5_grp_gpio", byt_score_i2c5_pins, 0),
 	PIN_GROUP("i2c6_grp", byt_score_i2c6_pins, 1),
+	PIN_GROUP("i2c6_grp_gpio", byt_score_i2c6_pins, 0),
 	PIN_GROUP("i2c4_grp", byt_score_i2c4_pins, 1),
+	PIN_GROUP("i2c4_grp_gpio", byt_score_i2c4_pins, 0),
 	PIN_GROUP("i2c3_grp", byt_score_i2c3_pins, 1),
+	PIN_GROUP("i2c3_grp_gpio", byt_score_i2c3_pins, 0),
 	PIN_GROUP("i2c2_grp", byt_score_i2c2_pins, 1),
+	PIN_GROUP("i2c2_grp_gpio", byt_score_i2c2_pins, 0),
 	PIN_GROUP("i2c1_grp", byt_score_i2c1_pins, 1),
+	PIN_GROUP("i2c1_grp_gpio", byt_score_i2c1_pins, 0),
 	PIN_GROUP("i2c0_grp", byt_score_i2c0_pins, 1),
+	PIN_GROUP("i2c0_grp_gpio", byt_score_i2c0_pins, 0),
 	PIN_GROUP("ssp0_grp", byt_score_ssp0_pins, 1),
+	PIN_GROUP("ssp0_grp_gpio", byt_score_ssp0_pins, 0),
 	PIN_GROUP("ssp1_grp", byt_score_ssp1_pins, 1),
+	PIN_GROUP("ssp1_grp_gpio", byt_score_ssp1_pins, 0),
 	PIN_GROUP("sdcard_grp", byt_score_sdcard_pins, byt_score_sdcard_mux_values),
+	PIN_GROUP("sdcard_grp_gpio", byt_score_sdcard_pins, 0),
 	PIN_GROUP("sdio_grp", byt_score_sdio_pins, 1),
+	PIN_GROUP("sdio_grp_gpio", byt_score_sdio_pins, 0),
 	PIN_GROUP("emmc_grp", byt_score_emmc_pins, 1),
+	PIN_GROUP("emmc_grp_gpio", byt_score_emmc_pins, 0),
 	PIN_GROUP("lpc_grp", byt_score_ilb_lpc_pins, 1),
+	PIN_GROUP("lpc_grp_gpio", byt_score_ilb_lpc_pins, 0),
 	PIN_GROUP("sata_grp", byt_score_sata_pins, 1),
+	PIN_GROUP("sata_grp_gpio", byt_score_sata_pins, 0),
 	PIN_GROUP("plt_clk0_grp", byt_score_plt_clk0_pins, 1),
+	PIN_GROUP("plt_clk0_grp_gpio", byt_score_plt_clk0_pins, 0),
 	PIN_GROUP("plt_clk1_grp", byt_score_plt_clk1_pins, 1),
+	PIN_GROUP("plt_clk1_grp_gpio", byt_score_plt_clk1_pins, 0),
 	PIN_GROUP("plt_clk2_grp", byt_score_plt_clk2_pins, 1),
+	PIN_GROUP("plt_clk2_grp_gpio", byt_score_plt_clk2_pins, 0),
 	PIN_GROUP("plt_clk3_grp", byt_score_plt_clk3_pins, 1),
+	PIN_GROUP("plt_clk3_grp_gpio", byt_score_plt_clk3_pins, 0),
 	PIN_GROUP("plt_clk4_grp", byt_score_plt_clk4_pins, 1),
+	PIN_GROUP("plt_clk4_grp_gpio", byt_score_plt_clk4_pins, 0),
 	PIN_GROUP("plt_clk5_grp", byt_score_plt_clk5_pins, 1),
+	PIN_GROUP("plt_clk5_grp_gpio", byt_score_plt_clk5_pins, 0),
 	PIN_GROUP("smbus_grp", byt_score_smbus_pins, 1),
+	PIN_GROUP("smbus_grp_gpio", byt_score_smbus_pins, 0),
 };
 
 static const char * const byt_score_uart_groups[] = {
@@ -332,12 +359,14 @@ static const char * const byt_score_plt_clk_groups[] = {
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
@@ -457,7 +486,9 @@ static const struct intel_pingroup byt_sus_groups[] = {
 	PIN_GROUP("usb_ulpi_grp_gpio", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_gpio_mode_values),
 	PIN_GROUP("pcu_spi_grp_gpio", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_gpio_mode_values),
 	PIN_GROUP("pmu_clk1_grp", byt_sus_pmu_clk1_pins, 1),
+	PIN_GROUP("pmu_clk1_grp_gpio", byt_sus_pmu_clk1_pins, 0),
 	PIN_GROUP("pmu_clk2_grp", byt_sus_pmu_clk2_pins, 1),
+	PIN_GROUP("pmu_clk2_grp_gpio", byt_sus_pmu_clk2_pins, 0),
 };
 
 static const char * const byt_sus_usb_groups[] = {
@@ -469,7 +500,7 @@ static const char * const byt_sus_pmu_clk_groups[] = {
 };
 static const char * const byt_sus_gpio_groups[] = {
 	"usb_oc_grp_gpio", "usb_ulpi_grp_gpio", "pcu_spi_grp_gpio",
-	"pmu_clk1_grp", "pmu_clk2_grp",
+	"pmu_clk1_grp_gpio", "pmu_clk2_grp_gpio",
 };
 
 static const struct intel_function byt_sus_functions[] = {
-- 
2.44.0


