Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9D3CB58E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhGPKES (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:18 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62527 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234167AbhGPKEQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429682; x=1657965682;
  h=from:to:cc:subject:date:message-id;
  bh=tiyUwbQP5/bDBlyRXNUxXz6rB+KN19LuV6Niuna3boI=;
  b=oGuCxQQFV0ZazoTxj3is66sIk8n5g7uaxUEv/6LrB98pPKw/VV4mNyO9
   xpPtxJXY+DV2gHGRX8DWM3erY7Fa8G3EcizbMmQ25+fYKeD8eM6ln7hai
   DKwzDzpgw+yrOB1y+aLzGAxAi+AncTBg22bm1TRsdxok3rO3Jd/U8E3cz
   j6RcNz6WT9Pj7MRMxBPumhlP5M8qnPNzBHJW7xngaIKvR662sm4H1Zqm4
   mIhn3pAPiOD63nHwIEVvmgr5SEIEntYCBdVmOxLB5dvvSNycct4tuvQuo
   iOZTGPTM5rFkxMsU0+MTOh75hiXTEo4YLMhpZQTN9K4KZfCiXfQWXgr/I
   A==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492074"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429678; x=1657965678;
  h=from:to:cc:subject:date:message-id;
  bh=tiyUwbQP5/bDBlyRXNUxXz6rB+KN19LuV6Niuna3boI=;
  b=UH7k8VCAXWfgdKQW6xiHgaUnw20hcm0QKyNSFSaWjRcN2XHHIaqU6xUT
   zRlZWRqBagrkAcWUHJLL1F4DiUx2TwtgIrPzE3DXKIsJCnCQajT/jyFsl
   WAJkeQGSQoQ/I2EzEYr4Mbo6VUp+/Lw6O96XMtrYDkrdSjqHr8MRlQIO9
   KOxlNZMpaExD/GiT/tmt/CGv7wVnBTWuIB5axUV0e+GHbAGHnNU8ItnR+
   XSSUejQNdJ3RX4Mforyj7npj8y+beq2M/Af6X1lXVIw6s7BSjFemF5ZoV
   J+FA7QsprnFDcLtTDwz78vvBAKoGG0v/QsejVY8BmGK0sbt86cRHsNxel
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492073"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A4E1D280070;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 5/7] mfd: tqmx86: add support for TQMx110EB and TQMxE40x
Date:   Fri, 16 Jul 2021 12:00:51 +0200
Message-Id: <fe59c52cc79c407dce03fad1206f479bfc8ab73c.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the board IDs for the TQMx110EB and the TQMxE40x family. All use a
24MHz LPC clock.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2:
- add more new modules
- explicitly list each module for LPC clock

v3: no changes

 drivers/mfd/tqmx86.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index ff1bdb742e3f..9eb05b3ef573 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -35,6 +35,11 @@
 #define TQMX86_REG_BOARD_ID_E39x	7
 #define TQMX86_REG_BOARD_ID_70EB	8
 #define TQMX86_REG_BOARD_ID_80UC	9
+#define TQMX86_REG_BOARD_ID_110EB	11
+#define TQMX86_REG_BOARD_ID_E40M	12
+#define TQMX86_REG_BOARD_ID_E40S	13
+#define TQMX86_REG_BOARD_ID_E40C1	14
+#define TQMX86_REG_BOARD_ID_E40C2	15
 #define TQMX86_REG_BOARD_REV	0x21
 #define TQMX86_REG_IO_EXT_INT	0x26
 #define TQMX86_REG_IO_EXT_INT_NONE		0
@@ -127,6 +132,16 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
 		return "TQMx70EB";
 	case TQMX86_REG_BOARD_ID_80UC:
 		return "TQMx80UC";
+	case TQMX86_REG_BOARD_ID_110EB:
+		return "TQMx110EB";
+	case TQMX86_REG_BOARD_ID_E40M:
+		return "TQMxE40M";
+	case TQMX86_REG_BOARD_ID_E40S:
+		return "TQMxE40S";
+	case TQMX86_REG_BOARD_ID_E40C1:
+		return "TQMxE40C1";
+	case TQMX86_REG_BOARD_ID_E40C2:
+		return "TQMxE40C2";
 	default:
 		return "Unknown";
 	}
@@ -139,6 +154,11 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
 	case TQMX86_REG_BOARD_ID_60EB:
 	case TQMX86_REG_BOARD_ID_70EB:
 	case TQMX86_REG_BOARD_ID_80UC:
+	case TQMX86_REG_BOARD_ID_110EB:
+	case TQMX86_REG_BOARD_ID_E40M:
+	case TQMX86_REG_BOARD_ID_E40S:
+	case TQMX86_REG_BOARD_ID_E40C1:
+	case TQMX86_REG_BOARD_ID_E40C2:
 		return 24000;
 	case TQMX86_REG_BOARD_ID_E39M:
 	case TQMX86_REG_BOARD_ID_E39C:
-- 
2.17.1

