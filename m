Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0BB80B7C
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 17:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfHDPkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 11:40:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38408 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDPkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 11:40:43 -0400
Received: by mail-pl1-f196.google.com with SMTP id az7so35439947plb.5;
        Sun, 04 Aug 2019 08:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoMhUlXgwlF+TgX60dUm1t1N5XFU9W1iJC3WQszsdrU=;
        b=N0/r/5ltGTXkFVCCRh/UKBHLfDMswOFiylibDtY70dtFOVOGNfo+QAnC8CNHJGCTNe
         Vj37Ic+njeNjSPkWSlCk7qdVus6KA9wdEMBpJBF9vzSI/qAAfjH+7vb+Wod9sk75ihDo
         q3+cXgnxpVobnPjbRQ0xr8QvvEUNvdq2GVQ2oQeL6yyXZRXU0v1vHUSm/uOvBSQdDiA0
         vGaihEnbjJNDnTpwB/Y4u7TsTPJWaVScpy+6jxDFH38eWY/Wm8rK/hK5o87DySuGA2Dl
         EKBd0XRepz+facT+fw5zMxe68qUxX+QoJ1S9jpPrNumnCmyk7O8FUpgK+dehuUdKtVEQ
         fyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoMhUlXgwlF+TgX60dUm1t1N5XFU9W1iJC3WQszsdrU=;
        b=pPSS3peGId6uNKrkpBD5oZTIDMUBzhBLZEFCAGPwEZ4DssfCu12QCckv6Anwq0xJVp
         NDWxBQik4A4nW6l4xZ+t4nG5ZPZvxg76Gdv6k4wuKabe6Xj+HANpD5Xp3sh8PwrveQ37
         zFe2JGXvxw7G0BLXRAedHpe/1ETdA0+5AZh5sNjEuQ6ONK25rn2x6LDFs4eHudErSzYQ
         H50MyErnddH0W5n1bSYPxEkysFvk4ooiHwpDfdaBwwCSTb3UL/xhoBJc4SNykV8A7no5
         iL1OYFzLMGvGMrB50VvPOxkiXLcS8pnAuVNeIEuWW//hj2Y6DZ30igRiZn+qfsvRIuwZ
         fkqQ==
X-Gm-Message-State: APjAAAVPjSrBPICVhM5iilALY2+TWkmhiU9uANPwd2w4Mj7gk+CJi4O7
        72VzBMnGL7at4WTsmVtCEbM=
X-Google-Smtp-Source: APXvYqxhqprLEO7bMHgqNw5sKOGYh9+Xdqof3Z3TIGhGAA5NC4gSln+tX0fWp6lVvSXuZLPoKGo07A==
X-Received: by 2002:a17:902:12d:: with SMTP id 42mr133306364plb.187.1564933242828;
        Sun, 04 Aug 2019 08:40:42 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id 5sm16005320pgh.93.2019.08.04.08.40.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 08:40:42 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: rzn1: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:10:29 +0530
Message-Id: <20190804154029.2749-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/pinctrl-rzn1.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index cc0e5aa9128a..0f6f8a10a53a 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -412,8 +412,10 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	for_each_child_of_node(np, child) {
 		ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -792,8 +794,10 @@ static int rzn1_pinctrl_parse_functions(struct device_node *np,
 		grp = &ipctl->groups[ipctl->ngroups];
 		grp->func = func->name;
 		ret = rzn1_pinctrl_parse_groups(child, grp, ipctl);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 		i++;
 		ipctl->ngroups++;
 	}
@@ -838,8 +842,10 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
 
 	for_each_child_of_node(np, child) {
 		ret = rzn1_pinctrl_parse_functions(child, ipctl, i++);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.19.1

