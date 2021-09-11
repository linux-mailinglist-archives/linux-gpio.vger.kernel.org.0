Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703CA407ACA
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Sep 2021 01:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbhIKX3T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Sep 2021 19:29:19 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56426 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231534AbhIKX3S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Sep 2021 19:29:18 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 6F69CCAEE3;
        Sat, 11 Sep 2021 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631402884; bh=Ktxuspf8zLP6lR/lYt9+9Mxagdfs83zP+MehmPTG1CM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Mg/PB8NJU6g5JRVRr5OmWTStLoW1tS4SMr+HVnNlhzitKABZlldHUs90EZncgonj0
         aXLcONAs3R2hdDImEZnvNB62ctUF1vzEbUC60OfuG2W7ywiUsBN5pee1y6yiQyimY2
         EDFU34Qe0PWAJynUWyiWCENOFIhI81f0N3wkvECc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] pinctrl: qcom: msm8226: fill in more functions
Date:   Sun, 12 Sep 2021 01:26:55 +0200
Message-Id: <20210911232707.259615-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the functions for QUP4 (spi, uart, uim & i2c), sdc3 and audio_pcm as
derived from the downstream gpiomux configuration.

Also sort the functions alphabetically, while we're at it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/pinctrl/qcom/pinctrl-msm8226.c | 74 ++++++++++++++++++--------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index 98779e62e951..fca0645e8008 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -338,26 +338,32 @@ static const unsigned int sdc2_data_pins[] = { 122 };
  * the pingroup table below.
  */
 enum msm8226_functions {
-	MSM_MUX_gpio,
-	MSM_MUX_cci_i2c0,
+	MSM_MUX_audio_pcm,
 	MSM_MUX_blsp_i2c1,
 	MSM_MUX_blsp_i2c2,
 	MSM_MUX_blsp_i2c3,
+	MSM_MUX_blsp_i2c4,
 	MSM_MUX_blsp_i2c5,
 	MSM_MUX_blsp_spi1,
 	MSM_MUX_blsp_spi2,
 	MSM_MUX_blsp_spi3,
+	MSM_MUX_blsp_spi4,
 	MSM_MUX_blsp_spi5,
 	MSM_MUX_blsp_uart1,
 	MSM_MUX_blsp_uart2,
 	MSM_MUX_blsp_uart3,
+	MSM_MUX_blsp_uart4,
 	MSM_MUX_blsp_uart5,
 	MSM_MUX_blsp_uim1,
 	MSM_MUX_blsp_uim2,
 	MSM_MUX_blsp_uim3,
+	MSM_MUX_blsp_uim4,
 	MSM_MUX_blsp_uim5,
 	MSM_MUX_cam_mclk0,
 	MSM_MUX_cam_mclk1,
+	MSM_MUX_cci_i2c0,
+	MSM_MUX_gpio,
+	MSM_MUX_sdc3,
 	MSM_MUX_wlan,
 	MSM_MUX_NA,
 };
@@ -382,6 +388,10 @@ static const char * const gpio_groups[] = {
 	"gpio111", "gpio112", "gpio113", "gpio114", "gpio115", "gpio116",
 };
 
+static const char * const audio_pcm_groups[] = {
+	"gpio63", "gpio64", "gpio65", "gpio66"
+};
+
 static const char * const blsp_uart1_groups[] = {
 	"gpio0", "gpio1", "gpio2", "gpio3"
 };
@@ -412,6 +422,16 @@ static const char * const blsp_spi3_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
 
+static const char * const blsp_uart4_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15"
+};
+
+static const char * const blsp_uim4_groups[] = { "gpio12", "gpio13" };
+static const char * const blsp_i2c4_groups[] = { "gpio14", "gpio15" };
+static const char * const blsp_spi4_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15"
+};
+
 static const char * const blsp_uart5_groups[] = {
 	"gpio16", "gpio17", "gpio18", "gpio19"
 };
@@ -427,31 +447,41 @@ static const char * const cci_i2c0_groups[] = { "gpio29", "gpio30" };
 static const char * const cam_mclk0_groups[] = { "gpio26" };
 static const char * const cam_mclk1_groups[] = { "gpio27" };
 
+static const char * const sdc3_groups[] = {
+	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43", "gpio44"
+};
+
 static const char * const wlan_groups[] = {
 	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44"
 };
 
 static const struct msm_function msm8226_functions[] = {
-	FUNCTION(gpio),
-	FUNCTION(cci_i2c0),
-	FUNCTION(blsp_uim1),
-	FUNCTION(blsp_uim2),
-	FUNCTION(blsp_uim3),
-	FUNCTION(blsp_uim5),
+	FUNCTION(audio_pcm),
 	FUNCTION(blsp_i2c1),
 	FUNCTION(blsp_i2c2),
 	FUNCTION(blsp_i2c3),
+	FUNCTION(blsp_i2c4),
 	FUNCTION(blsp_i2c5),
 	FUNCTION(blsp_spi1),
 	FUNCTION(blsp_spi2),
 	FUNCTION(blsp_spi3),
+	FUNCTION(blsp_spi4),
 	FUNCTION(blsp_spi5),
 	FUNCTION(blsp_uart1),
 	FUNCTION(blsp_uart2),
 	FUNCTION(blsp_uart3),
+	FUNCTION(blsp_uart4),
 	FUNCTION(blsp_uart5),
+	FUNCTION(blsp_uim1),
+	FUNCTION(blsp_uim2),
+	FUNCTION(blsp_uim3),
+	FUNCTION(blsp_uim4),
+	FUNCTION(blsp_uim5),
 	FUNCTION(cam_mclk0),
 	FUNCTION(cam_mclk1),
+	FUNCTION(cci_i2c0),
+	FUNCTION(gpio),
+	FUNCTION(sdc3),
 	FUNCTION(wlan),
 };
 
@@ -468,10 +498,10 @@ static const struct msm_pingroup msm8226_groups[] = {
 	PINGROUP(9,   blsp_spi3, blsp_uart3, blsp_uim3, NA, NA, NA, NA),
 	PINGROUP(10,  blsp_spi3, blsp_uart3, blsp_i2c3, NA, NA, NA, NA),
 	PINGROUP(11,  blsp_spi3, blsp_uart3, blsp_i2c3, NA, NA, NA, NA),
-	PINGROUP(12,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(13,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(14,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(15,  NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(12,  blsp_spi4, blsp_uart4, blsp_uim4, NA, NA, NA, NA),
+	PINGROUP(13,  blsp_spi4, blsp_uart4, blsp_uim4, NA, NA, NA, NA),
+	PINGROUP(14,  blsp_spi4, blsp_uart4, blsp_i2c4, NA, NA, NA, NA),
+	PINGROUP(15,  blsp_spi4, blsp_uart4, blsp_i2c4, NA, NA, NA, NA),
 	PINGROUP(16,  blsp_spi5, blsp_uart5, blsp_uim5, NA, NA, NA, NA),
 	PINGROUP(17,  blsp_spi5, blsp_uart5, blsp_uim5, NA, NA, NA, NA),
 	PINGROUP(18,  blsp_spi5, blsp_uart5, blsp_i2c5, NA, NA, NA, NA),
@@ -495,12 +525,12 @@ static const struct msm_pingroup msm8226_groups[] = {
 	PINGROUP(36,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(37,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(38,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(39,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(40,  wlan, NA, NA, NA, NA, NA, NA),
-	PINGROUP(41,  wlan, NA, NA, NA, NA, NA, NA),
-	PINGROUP(42,  wlan, NA, NA, NA, NA, NA, NA),
-	PINGROUP(43,  wlan, NA, NA, NA, NA, NA, NA),
-	PINGROUP(44,  wlan, NA, NA, NA, NA, NA, NA),
+	PINGROUP(39,  NA, sdc3, NA, NA, NA, NA, NA),
+	PINGROUP(40,  wlan, sdc3, NA, NA, NA, NA, NA),
+	PINGROUP(41,  wlan, sdc3, NA, NA, NA, NA, NA),
+	PINGROUP(42,  wlan, sdc3, NA, NA, NA, NA, NA),
+	PINGROUP(43,  wlan, sdc3, NA, NA, NA, NA, NA),
+	PINGROUP(44,  wlan, sdc3, NA, NA, NA, NA, NA),
 	PINGROUP(45,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(46,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(47,  NA, NA, NA, NA, NA, NA, NA),
@@ -519,10 +549,10 @@ static const struct msm_pingroup msm8226_groups[] = {
 	PINGROUP(60,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(61,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(62,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(63,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(64,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(65,  NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(66,  NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(63,  audio_pcm, NA, NA, NA, NA, NA, NA),
+	PINGROUP(64,  audio_pcm, NA, NA, NA, NA, NA, NA),
+	PINGROUP(65,  audio_pcm, NA, NA, NA, NA, NA, NA),
+	PINGROUP(66,  audio_pcm, NA, NA, NA, NA, NA, NA),
 	PINGROUP(67,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(68,  NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(69,  NA, NA, NA, NA, NA, NA, NA),
-- 
2.33.0

