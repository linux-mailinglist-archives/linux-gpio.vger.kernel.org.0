Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A2E1AD70A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 09:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgDQHI6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 03:08:58 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2390 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728375AbgDQHI6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 03:08:58 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2B8BD1AB94DE7EDF6FDF;
        Fri, 17 Apr 2020 15:08:52 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 15:08:46 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <linus.walleij@linaro.org>, <stephan@gerhold.net>,
        <yanaijie@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] pinctrl: nomadik: db8500: remove some unused symbols
Date:   Fri, 17 Apr 2020 15:35:12 +0800
Message-ID: <20200417073512.42350-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following gcc warning:

drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:899:20: warning:
‘sbag_groups’ defined but not used [-Wunused-const-variable=]
 DB8500_FUNC_GROUPS(sbag, "sbag_oc2_1", "sbag_oc4_1");
                    ^
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:570:23: warning:
‘ipgpio6_c_2_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned ipgpio6_c_2_pins[] = { DB8500_PIN_G3 };
                       ^~~~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:472:23: warning:
‘mc1dir_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned mc1dir_a_1_pins[] = { DB8500_PIN_AH13,
DB8500_PIN_AG12,
                       ^~~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:453:23: warning:
‘modem_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned modem_a_1_pins[] = { DB8500_PIN_D22,
DB8500_PIN_C23,
                       ^~~~~~~~~~~~~~
drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:430:23: warning:
‘kpskaskb_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned kpskaskb_a_1_pins[] = { DB8500_PIN_D17,
DB8500_PIN_D16 };
                       ^~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index b9246e0b4fe2..0bba16dadb45 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -427,7 +427,6 @@ static const unsigned lcd_d12_d23_a_1_pins[] = {
 	DB8500_PIN_A3, DB8500_PIN_B6, DB8500_PIN_D6, DB8500_PIN_B7 };
 static const unsigned kp_a_1_pins[] = { DB8500_PIN_D7, DB8500_PIN_E8,
 	DB8500_PIN_D8, DB8500_PIN_D9 };
-static const unsigned kpskaskb_a_1_pins[] = { DB8500_PIN_D17, DB8500_PIN_D16 };
 static const unsigned kp_a_2_pins[] = {
 	DB8500_PIN_B17, DB8500_PIN_C16, DB8500_PIN_C19, DB8500_PIN_C17,
 	DB8500_PIN_A18, DB8500_PIN_C18, DB8500_PIN_B19, DB8500_PIN_B20,
@@ -449,9 +448,6 @@ static const unsigned i2c0_a_1_pins[] = { DB8500_PIN_C15, DB8500_PIN_B16 };
  */
 static const unsigned ipgpio0_a_1_pins[] = { DB8500_PIN_B14 };
 static const unsigned ipgpio1_a_1_pins[] = { DB8500_PIN_C14 };
-/* Three modem pins named RF_PURn, MODEM_STATE and MODEM_PWREN */
-static const unsigned modem_a_1_pins[] = { DB8500_PIN_D22, DB8500_PIN_C23,
-					   DB8500_PIN_D23 };
 /*
  * This MSP cannot switch RX and TX, SCK in a separate group since this
  * seems to be optional.
@@ -469,8 +465,6 @@ static const unsigned mc1_a_1_pins[] = { DB8500_PIN_AH16, DB8500_PIN_AG15,
 	DB8500_PIN_AH15 };
 static const unsigned mc1_a_2_pins[] = { DB8500_PIN_AH16, DB8500_PIN_AJ15,
 	DB8500_PIN_AG14, DB8500_PIN_AF13, DB8500_PIN_AG13, DB8500_PIN_AH15 };
-static const unsigned mc1dir_a_1_pins[] = { DB8500_PIN_AH13, DB8500_PIN_AG12,
-	DB8500_PIN_AH12, DB8500_PIN_AH11 };
 static const unsigned hsir_a_1_pins[] = { DB8500_PIN_AG10, DB8500_PIN_AH10,
 	DB8500_PIN_AJ11 };
 static const unsigned hsit_a_1_pins[] = { DB8500_PIN_AJ9, DB8500_PIN_AH9,
@@ -567,7 +561,6 @@ static const unsigned u0_c_1_pins[] = { DB8500_PIN_AF2, DB8500_PIN_AE1,
 					DB8500_PIN_AE2, DB8500_PIN_AG2 };
 static const unsigned ipgpio4_c_1_pins[] = { DB8500_PIN_F3 };
 static const unsigned ipgpio5_c_1_pins[] = { DB8500_PIN_F1 };
-static const unsigned ipgpio6_c_2_pins[] = { DB8500_PIN_G3 };
 static const unsigned ipgpio7_c_1_pins[] = { DB8500_PIN_G2 };
 static const unsigned smcleale_c_1_pins[] = { DB8500_PIN_E1, DB8500_PIN_E2 };
 static const unsigned stmape_c_1_pins[] = { DB8500_PIN_G5, DB8500_PIN_G4,
@@ -896,7 +889,6 @@ DB8500_FUNC_GROUPS(i2c3, "i2c3_c_1", "i2c3_c_2");
 DB8500_FUNC_GROUPS(spi0, "spi0_c_1");
 DB8500_FUNC_GROUPS(spi2, "spi2_oc1_1", "spi2_oc1_2");
 DB8500_FUNC_GROUPS(remap, "remap0_oc1_1", "remap1_oc1_1");
-DB8500_FUNC_GROUPS(sbag, "sbag_oc2_1", "sbag_oc4_1");
 DB8500_FUNC_GROUPS(ptm, "ptma9_oc1_1", "ptma9_oc2_1");
 DB8500_FUNC_GROUPS(rf, "rf_oc1_1", "rf_oc1_2");
 DB8500_FUNC_GROUPS(hx, "hxclk_oc1_1", "hxgpio_oc1_1");
-- 
2.21.1

