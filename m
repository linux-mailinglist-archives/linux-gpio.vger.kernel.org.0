Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89B63CB58C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbhGPKER (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:17 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62523 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236350AbhGPKEQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429681; x=1657965681;
  h=from:to:cc:subject:date:message-id;
  bh=jlC+5hc0tmJ07UCjC0Z9k6Yg10319aUvWNgV5DjyiMA=;
  b=nla5wIKYks18PozlbU0kdmDz56ZqGJxrveTLquR6uwGKNjck1JToGz4S
   7Ykdn3AndbKeXS4OnEiHRc5/OYGzb2zBCSgkRw88/toFWGVkNMXiLpvQi
   JEGXxFbiKP7Etl2lSjr4VKGlvoiRTcvicNtfUg5MTXNt53YQUCKw6tm+u
   hnPc4PC+fy2w3nAcMaXBCKPEX6lcnFXiD2sfQo3S+oOYf4dJwIIbRoh+l
   SzuBsXZX/JUJkHjuOVSYuFOylzTIFBB4d4VZlqfs/DzwgJ37JhLw113bZ
   MAZhkrhMLdzYLjp7B7m7a1Rj1JhmIGjEoWC/9ySp/ika/IdTLxURvgPfG
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492070"
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
  bh=jlC+5hc0tmJ07UCjC0Z9k6Yg10319aUvWNgV5DjyiMA=;
  b=ilNK5V554ymUymC0GoY6nT+2wlwTUxbxER7JVyBNsHAjBc9GlDQwr7ky
   pNjAYeZVOFhGc9vozWDlG0qElo0LmCI6BGvFcSEulJbpttYW1Dp88rI5+
   dStTjzz8syHX/Mcb297ij8JXUR9t4b60pwx6y3uNPUH8OB55BC8+QsI0I
   WJDVfCteZihTNJa93ms5JT7dkL1SEUv3BHOwiJDYfVRl/+5peis1FOEE1
   rcQ/JfJ5FqF1cwQIU9o0WDEgd2uxkgeIx5/nPOiWQQVPwrjv/K04GrW2u
   0QjcI6StOUDqnmPoHs/ovh0LFkF+9zAxoe+9Peg9fhplhs8d5ZKz9Ey8a
   g==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492069"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 506FB280078;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 3/7] mfd: tqmx86: remove incorrect TQMx90UC board ID
Date:   Fri, 16 Jul 2021 12:00:49 +0200
Message-Id: <5bb8c96ee6a755f18d82375927515ad504869b9e.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No TQMx90UC exists at the moment, and it is undecided whether ID 10 will
be used eventually (and if it is, how that SoM will be named).

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: new patch
v3: remove Fixes line

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

