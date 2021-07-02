Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B2E3BA053
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbhGBM0m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:42 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42427 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232187AbhGBM0k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228649; x=1656764649;
  h=from:to:cc:subject:date:message-id;
  bh=0q1NI26zCrMekPqE1Que8c1L2fPhyX9256BI2bruGPk=;
  b=C2rxwIjXSW5QdgfuXHm32nm8ezrmmjqEF8yOl54Au5HUJGW+Su1VKTUK
   WjiBW5kMEgzD9vjOpzTNLLUAqFiu7CIt8bJ47oEaT3jkO/AXx2wPGVFoo
   uAWFHoY4L4m1AZYG6cP4Dgd4yglKKZ+5HbtJxWf/L3A4Xr/C6vvDDv+YB
   oqsrgDWCy/mPnAd22cyR/l0kzrELmVpkgoTSQ+ndkWNYm4VmvHvdaumFa
   OUv7iAguNOlagcXnm2mFFZcr+pb16IZx6UVDP7H6ks7V71PHfcxHxjWbd
   4g8MObs0PrXu18x9uDf/hLWl4Vqx5RUDC5JkV0VmZPN6Ev7+BauXjXBA2
   w==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252576"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228645; x=1656764645;
  h=from:to:cc:subject:date:message-id;
  bh=0q1NI26zCrMekPqE1Que8c1L2fPhyX9256BI2bruGPk=;
  b=M7946s96b3rBn2W78HBg6zhxH9+o6eJ6U4ughEE4HUp2kg4A1ZJBEsYG
   iZ5jjeJWAjOqNuv0v5VaWZ7xU9j6WEC/xRa3zkLJdzgSHMKK4tyAyBgM/
   WzkCjXQPD73/F0TP5+1r764Di7r7UIujCuJA7kB8MWTOALZKweV0tkaLo
   lq9Srva4w9YhlMf55KkmpzdFaJXGJG5RSozy0mQz1F2g11K/6HFqSQOAq
   ftxh9B5SbJELQSNRn8o5Jx4c98tfb42/i/smik+/rkpY9qPPeGJPd03RD
   GsyJVmtrTyx5gcl1s6Us0+xWD90EVZ1pF921oHPPY6Rx/kPpAmv0Hc44N
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252575"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 2ECD9280078;
        Fri,  2 Jul 2021 14:24:05 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 5/7] mfd: tqmx86: add support for TQMx110EB and TQMxE40x
Date:   Fri,  2 Jul 2021 14:23:51 +0200
Message-Id: <e6906971cd78dde5862e01acab5a8c07cee0a0e3.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the board IDs for the TQMx110EB and the TQMxE40x family. All use a
24MHz LPC clock.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- add more new modules
- explicitly list each module for LPC clock

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

