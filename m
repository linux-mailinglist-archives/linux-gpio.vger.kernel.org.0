Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7669D34FFA6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 13:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhCaLnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 07:43:31 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:12578 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229486AbhCaLnZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 07:43:25 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Mar 2021 07:43:19 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617191005; x=1648727005;
  h=from:to:cc:subject:date:message-id;
  bh=RyAG+h56ey2LjdS2mss2T21PdnG5lqMEuStAcVDgc7c=;
  b=NHbB5WUE0awtzRm5gYo0QDdDDjj+vKeAUv1CsHIONEF9IbUzWGRg3Dxj
   ONEYHzvBq4C6QZhVIji8kXl7rW1DDFZoYMgcP5zaCZt0HtA2z9Hp+vDNJ
   FckcurdfJ2m3QlL8fVZCuShYWhgIHSZjg2VPA8eicroGskpXy57nX3r8s
   cJLuhjnuhaVkMPyzP4BKxkhyYlumcAwr//1x+owJnaN08XVPyAwVRh2jk
   SqB3IlP2GLodw03MhsAIOMNYe/tLymWtTfGU+dJRqu2qxan35MRaQxaQB
   DdwRgtmlk4O+B5QMMZjNcOnxnOsgxVRtSMizkWvNW4GNwPWhEi1B4VfA1
   A==;
IronPort-SDR: 4wDyZXTtRA/8gC37vnHhSRfN5aL6Wkdu1JOFvS2+cBRNuN4dPLH3ZPRS9P+trPD6wxCzEML7+o
 aJ4DzyEwb6hyH4oAIFDStaPT8baxR7RiQdOzWKWmpylzfLPc7CvLdpNjgMoMHH9T87EQDuilSl
 n53bqcFYpQgPjoL7Ufi3ITOe7xVJT/c+Nraf/G/TpfKhPU+GMknDHuVUOzZifizy3NY3NpYhAp
 +OIp7Gx2G7/EZ8xti6FtJWpjFB5RqOhG0XdttZ19Q7jGenlNSY4os+CNDZtQvIQdBFPCUKbl11
 pcs=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16742382"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 13:36:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 13:36:11 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 13:36:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617190571; x=1648726571;
  h=from:to:cc:subject:date:message-id;
  bh=RyAG+h56ey2LjdS2mss2T21PdnG5lqMEuStAcVDgc7c=;
  b=hhKLVkh1IdzcVQ05A/h3KcQtCYl6AhmOJPfpQyRbwTZucb3EOkKE3SD5
   pTGwCnuA538BuaMuBTaiTKCsARdjJLBS/f6R6iINBZlwqWirwd7csu5dJ
   cAarjsjorNH+WCOGk+1MXuIrjD86qynv0hwzer8E0SLgFZcbXr6MYqjlY
   s6FCDuCDaRML+8E856zmv86VLaM/P2KgWGYXJYQHVHvRQVm6xgUNcoJJW
   cQSEn0txd1UZEUfRCSazp+kgTtFKAX+RFIa/1YM+s6cm8gmsm7Bse6jdw
   KAUN4b5vAOHJyMAZF2tHW7BP6kskS1a9FixTPY/Po3qOSd0QHYMJtTgp7
   Q==;
IronPort-SDR: y8A4fCzFjxCsYE1Uqh0VUTFXRItvQ7Le6BELmpX1Azk8nznZh9Tuz7Hh45uFwiFZgvf+Ymi0Mq
 eHruoQg4MAl+/GKbvVGquE72oys4JeI3koF+bqlG3RRLv0BihqrntRf+r++WIFnet4s1iI/tZr
 4mi5U73yNJGmHxRaNO/nv2RpDREzdnmb836VgbThkqhZYv2sIxNbMOeilWtr+XlwjTG9Yqyq/r
 XoKa4QqvpkzAjDE9DZ067/I1cBw5jBeqPS7zBtH1RLjp7CYhTGMnC8DTHTS5xBtDl4jr8iSqu6
 O1E=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16742381"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 13:36:11 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 23AA0280075;
        Wed, 31 Mar 2021 13:36:11 +0200 (CEST)
X-CheckPoint: {60645E92-3-486672D-C0FA7804}
X-MAIL-CPID: 00FEFC02EA55698BA82460F2CACBA22A_2
X-Control-Analysis: str=0001.0A782F29.60645EAB.004C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
Date:   Wed, 31 Mar 2021 13:35:45 +0200
Message-Id: <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All future TQMx86 SoMs will use a 24MHz LPC clock, so we can use that as
a default instead of listing each new module individually.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mfd/tqmx86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 732013f40e4e..1d5cebc4e72b 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -36,6 +36,7 @@
 #define TQMX86_REG_BOARD_ID_70EB	8
 #define TQMX86_REG_BOARD_ID_80UC	9
 #define TQMX86_REG_BOARD_ID_90UC	10
+#define TQMX86_REG_BOARD_ID_E40M	12
 #define TQMX86_REG_BOARD_REV	0x21
 #define TQMX86_REG_IO_EXT_INT	0x26
 #define TQMX86_REG_IO_EXT_INT_NONE		0
@@ -130,6 +131,8 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
 		return "TQMx80UC";
 	case TQMX86_REG_BOARD_ID_90UC:
 		return "TQMx90UC";
+	case TQMX86_REG_BOARD_ID_E40M:
+		return "TQMxE40M";
 	default:
 		return "Unknown";
 	}
@@ -138,12 +141,6 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
 static int tqmx86_board_id_to_clk_rate(u8 board_id)
 {
 	switch (board_id) {
-	case TQMX86_REG_BOARD_ID_50UC:
-	case TQMX86_REG_BOARD_ID_60EB:
-	case TQMX86_REG_BOARD_ID_70EB:
-	case TQMX86_REG_BOARD_ID_80UC:
-	case TQMX86_REG_BOARD_ID_90UC:
-		return 24000;
 	case TQMX86_REG_BOARD_ID_E39M:
 	case TQMX86_REG_BOARD_ID_E39C:
 	case TQMX86_REG_BOARD_ID_E39x:
@@ -152,7 +149,7 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
 	case TQMX86_REG_BOARD_ID_E38C:
 		return 33000;
 	default:
-		return 0;
+		return 24000;
 	}
 }
 
-- 
2.17.1

