Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378543BA052
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhGBM0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:41 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42421 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhGBM0k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228648; x=1656764648;
  h=from:to:cc:subject:date:message-id;
  bh=Q/64wyLAKZYuggBcQQiGTIRE0uQ5M5Ts91Z7qH6yqhc=;
  b=kK66NjxfmUcMdcKdzXkmVkrYC5y8lVRKTolf91BCyhzpBu+dk/j461ZJ
   VtyT5VIP7FAHS/6RKSRHJWIP8ZG4JnGijuNi/rwyqvvvkhTkyERZ+e+g2
   xXkq8Il8acLB7nPvlVnoZG53Cbk877jx47WrnYwCPxE+BQYNWCOvx/ddy
   ZGDYr40oFUI8z9WOKlCtelTW1KneWlmc9T4w3sjvTCOAygcFsKmqUvllf
   XYoCGl/P4KjTcHbIzhO65RqKlKi20KWB4Gg9s7IiE+Zcg2JCIG9vlurmh
   RJ13HxdSjdxnSYvTTJzR2NOgk7jUoNnSp63NZgpSbhuHduW77d3O4j9/W
   w==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252572"
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
  bh=Q/64wyLAKZYuggBcQQiGTIRE0uQ5M5Ts91Z7qH6yqhc=;
  b=VR0APtByvJisolLRAXi2Qg+61xjHowBb1TBT3TTPmNCoYjgJH77HDBPZ
   2nQVxwBSvgNPsjf8yKK51AWy3SsHygQXsk5GlpK8QvTxSH3yEPIExWQ+Y
   07fljPeFARyCH232LIMXW/KfZzu34kmjS/vqOzbZhTK7wZUcJWahT4hRT
   qpUbfaN7ZcgXkDycJOz29cIPke9fQOk+53irqP6EszTUsL50Lbg7UFb3N
   ugTLs3afaTnK0vmTpBjPGxjHIlsmNARwWoelQ2W8+knVhtU7F+jwyiqcx
   JzV6WdL52BSkFkj0Lai1Ep6LJgSK5783pIGamTdEMqPR8Wu7Z4sDAQaDF
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252571"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id D340F280070;
        Fri,  2 Jul 2021 14:24:04 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/7] mfd: tqmx86: remove incorrect TQMx90UC board ID
Date:   Fri,  2 Jul 2021 14:23:49 +0200
Message-Id: <36046861067369c0569f3d955f7a390c136689b5.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No TQMx90UC exists at the moment, and it is undecided whether ID 10 will
be used eventually (and if it is, how that SoM will be named).

Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: new patch

 drivers/mfd/tqmx86.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 732013f40e4e..9b65dbedc1bb 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -35,7 +35,6 @@
 #define TQMX86_REG_BOARD_ID_E39x	7
 #define TQMX86_REG_BOARD_ID_70EB	8
 #define TQMX86_REG_BOARD_ID_80UC	9
-#define TQMX86_REG_BOARD_ID_90UC	10
 #define TQMX86_REG_BOARD_REV	0x21
 #define TQMX86_REG_IO_EXT_INT	0x26
 #define TQMX86_REG_IO_EXT_INT_NONE		0
@@ -128,8 +127,6 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
 		return "TQMx70EB";
 	case TQMX86_REG_BOARD_ID_80UC:
 		return "TQMx80UC";
-	case TQMX86_REG_BOARD_ID_90UC:
-		return "TQMx90UC";
 	default:
 		return "Unknown";
 	}
@@ -142,7 +139,6 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
 	case TQMX86_REG_BOARD_ID_60EB:
 	case TQMX86_REG_BOARD_ID_70EB:
 	case TQMX86_REG_BOARD_ID_80UC:
-	case TQMX86_REG_BOARD_ID_90UC:
 		return 24000;
 	case TQMX86_REG_BOARD_ID_E39M:
 	case TQMX86_REG_BOARD_ID_E39C:
-- 
2.17.1

