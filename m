Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DA21EE145
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 11:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgFDJ2L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 05:28:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:43863 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgFDJ2L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jun 2020 05:28:11 -0400
IronPort-SDR: ecb21u5GFYve9inp+1IqdgLaQizqcTsHQ5rbjPl4ItzPOacJMO8wVHuW+ODwy9eUgKlH/LYxFL
 m4UXkqcAV5yw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 02:28:11 -0700
IronPort-SDR: s5CjtJPhuJYFPDoOL02oshbGx1djFp4johgV/9xFzqBiHjDnebkEr5xd6i4gdJ84Yyurmu0OBq
 hGjxK6m/3J2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="273050045"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 04 Jun 2020 02:28:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EDC673CA; Thu,  4 Jun 2020 12:28:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        mouse <xllacyx@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v1] =?UTF-8?q?pintctrl:=20merrifield:=20Add=20I=C2=B2S=20b?= =?UTF-8?q?us=202=20pins=20to=20groups=20and=20functions?=
Date:   Thu,  4 Jun 2020 12:28:07 +0300
Message-Id: <20200604092807.67283-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is useful to control I²S bus 2 pins if we would like to connect
an audio codec.

Reported-by: mouse <xllacyx@gmail.com>
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 04ca8ae95df8..84da1b746fb8 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -339,6 +339,7 @@ static const struct pinctrl_pin_desc mrfld_pins[] = {
 	/* Family 18: Broadcast (0 pins) */
 };
 
+static const unsigned int mrfld_i2s2_pins[] = { 40, 41, 42, 43 };
 static const unsigned int mrfld_sdio_pins[] = { 50, 51, 52, 53, 54, 55, 56 };
 static const unsigned int mrfld_spi5_pins[] = { 90, 91, 92, 93, 94, 95, 96 };
 static const unsigned int mrfld_uart0_pins[] = { 115, 116, 117, 118 };
@@ -350,6 +351,7 @@ static const unsigned int mrfld_pwm2_pins[] = { 132 };
 static const unsigned int mrfld_pwm3_pins[] = { 133 };
 
 static const struct intel_pingroup mrfld_groups[] = {
+	PIN_GROUP("i2s2_grp", mrfld_i2s2_pins, 1),
 	PIN_GROUP("sdio_grp", mrfld_sdio_pins, 1),
 	PIN_GROUP("spi5_grp", mrfld_spi5_pins, 1),
 	PIN_GROUP("uart0_grp", mrfld_uart0_pins, 1),
@@ -361,6 +363,7 @@ static const struct intel_pingroup mrfld_groups[] = {
 	PIN_GROUP("pwm3_grp", mrfld_pwm3_pins, 1),
 };
 
+static const char * const mrfld_i2s2_groups[] = { "i2s2_grp" };
 static const char * const mrfld_sdio_groups[] = { "sdio_grp" };
 static const char * const mrfld_spi5_groups[] = { "spi5_grp" };
 static const char * const mrfld_uart0_groups[] = { "uart0_grp" };
@@ -372,6 +375,7 @@ static const char * const mrfld_pwm2_groups[] = { "pwm2_grp" };
 static const char * const mrfld_pwm3_groups[] = { "pwm3_grp" };
 
 static const struct intel_function mrfld_functions[] = {
+	FUNCTION("i2s2", mrfld_i2s2_groups),
 	FUNCTION("sdio", mrfld_sdio_groups),
 	FUNCTION("spi5", mrfld_spi5_groups),
 	FUNCTION("uart0", mrfld_uart0_groups),
-- 
2.27.0.rc2

