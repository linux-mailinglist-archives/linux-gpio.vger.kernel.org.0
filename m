Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40252B1BD8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 14:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKMNZw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 08:25:52 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:63249 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgKMNZv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 08:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605273951; x=1636809951;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6UEqTuv0Tg591HGHAaVfIFJOdVMBh62YNrvGo6RLEu4=;
  b=KR6bdr5QkjhLKMfzY4ErI8bI+JEpVOVvVsm5F8lGjrVYBW0XfuIquG3t
   Uhw6kl4cZmtKVQkIVtocwJYUQfJC950JZQWgBJLTi2+iMWMkSY3lbDEf6
   R9FcRjRI02K1+aM9iouHwvhr0RB1TBhgt0IiD54uiphfBbnn8yuf0UQNl
   Y/J2I66QqCrsndEFW2T6+NN2j+6biO3tI7rupCdWAdD3IGphvVsLd2+qq
   CNmER27XGZtDPvOnKdzuaKgmU6iYvUqRSPlo5O8aPP2NHiN/uyz4xHJah
   KD98A2CPv4Vm1bGxixANXPQ4+Ax1p0tqVgiPbr5sd+Vv3dY6rmNR7iBgA
   A==;
IronPort-SDR: zgMqS94k5/tfUDntSX0s5GtkJ1MlyOXRwS4tXqP1585QlSyhM0AJyE9bCAhEr4du3ztncQnsL7
 7kmAaRiG4um4DUBYEbCF5X5pzDRUkq6x2MUttBO+P8YxprHyo9JSm1BtpUcw2lW2FfV426vajL
 yV7IutkQelMfRGNdNuaYAbIcnavOA43jRIVUvF9/XaeRwq+2GueChaxpmoIK5CdxazSKcqSLPf
 +0ohzz9iZTkgNarQ9bwOKozmsQ3cGJljwTMW27e6tzS8dd+8mW+kgU0YgN+PDba+KRvoiOnztt
 llc=
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="98926928"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2020 06:25:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 06:25:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 13 Nov 2020 06:25:36 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <ludovic.desroches@microchip.com>
CC:     <linus.walleij@linaro.org>, <nicolas.ferre@microchip.com>,
        <inux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] pinctrl: at91-pio4: add support for fewer lines on last PIO bank
Date:   Fri, 13 Nov 2020 15:24:29 +0200
Message-ID: <20201113132429.420940-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some products, like sama7g5, do not have a full last bank of PIO lines.
In this case for example, sama7g5 only has 8 lines for the PE bank.
PA0-31, PB0-31, PC0-31, PD0-31, PE0-7, in total 136 lines.
To cope with this situation, added a data attribute that is product dependent,
to specify the number of lines of the last bank.
In case this number is different from the macro ATMEL_PIO_NPINS_PER_BANK,
adjust the total number of lines accordingly.
This will avoid advertising 160 lines instead of the actual 136, as this
product supports, and to avoid reading/writing to invalid register addresses.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 578b387100d9..d267367d94b9 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -71,8 +71,15 @@
 /* Custom pinconf parameters */
 #define ATMEL_PIN_CONFIG_DRIVE_STRENGTH	(PIN_CONFIG_END + 1)
 
+/**
+ * struct atmel_pioctrl_data - Atmel PIO controller (pinmux + gpio) data struct
+ * @nbanks: number of PIO banks
+ * @last_bank_count: number of lines in the last bank (can be less than
+ *	the rest of the banks).
+ */
 struct atmel_pioctrl_data {
 	unsigned nbanks;
+	unsigned last_bank_count;
 };
 
 struct atmel_group {
@@ -980,11 +987,13 @@ static const struct dev_pm_ops atmel_pctrl_pm_ops = {
  * We can have up to 16 banks.
  */
 static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
-	.nbanks		= 4,
+	.nbanks			= 4,
+	.last_bank_count	= ATMEL_PIO_NPINS_PER_BANK,
 };
 
 static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
-	.nbanks		= 5,
+	.nbanks			= 5,
+	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
 };
 
 static const struct of_device_id atmel_pctrl_of_match[] = {
@@ -1025,6 +1034,11 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 	atmel_pioctrl_data = match->data;
 	atmel_pioctrl->nbanks = atmel_pioctrl_data->nbanks;
 	atmel_pioctrl->npins = atmel_pioctrl->nbanks * ATMEL_PIO_NPINS_PER_BANK;
+	/* if last bank has limited number of pins, adjust accordingly */
+	if (atmel_pioctrl_data->last_bank_count != ATMEL_PIO_NPINS_PER_BANK) {
+		atmel_pioctrl->npins -= ATMEL_PIO_NPINS_PER_BANK;
+		atmel_pioctrl->npins += atmel_pioctrl_data->last_bank_count;
+	}
 
 	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pioctrl->reg_base))
-- 
2.25.1

