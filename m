Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFF280B95
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfHDQEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 12:04:34 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36459 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfHDQEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 12:04:34 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so38405536pgm.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2019 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=43+wBAA2pYCZyIeE6dblgNpeldlqw4UsjWWmEq3JFkQ=;
        b=MNB/Mc92mGLyuhVsZap7ySAwBC6u9/2UU+v246vUn8jld4GTJtPBdEK/sS4jqDUALx
         ASGO3QxSSTMfen5a4818hqHKc6dGWuxarFx4xVAR37oOi3z8C6DwKf3cpZXKhDzcZzDT
         ARu26iZVW+gzOfNZZ9Id3tcZBBzBwANnqVKwf8VzC5/yECvRSodP2CfPxpjUyEwuSPxC
         qH90LTTJ6KOYUienovhJSPBFDDWqgKPSz1JCYRZq/rovUJDq6RyBecXXng5tZP2ocKyN
         hfLDw1Dxmy84XUppiFSG/z4ANSf/CaaFsXaIFTK2flreppmFfwGRRCzJxKNQuDlWqeJP
         okjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=43+wBAA2pYCZyIeE6dblgNpeldlqw4UsjWWmEq3JFkQ=;
        b=BEBpgz/JXxxBtUaRfU62mhTga/ZTYNJv6p3d9JRJmtmiI7M+DTqtjQm22r8eYdy+Te
         Me5Bxz5BbtyjJ+droBn2AZ5l1yWaT9FW1r4UKZ/3nqVk2PD8YIIx9b02CqxaMUNGExNn
         raxdkDNy4xxtH8HhYVmI5ol6eMV+1SrYE/NtD/HO0cOqTRossGIrswcxntj0YTQXssqu
         jnncuKBtWzQycFyySRQnbBfkzdiUtZ1PrxaC2XVy1Yd7mIMWQuCRjTjO2JNAV8g2Is1t
         PrwywqeYLlA/xGF/pUBY3DJEdwmGtUJWOlfrEuZPl9JWnAamYYC7QMH7cZ0/LoZnqHcR
         zCzg==
X-Gm-Message-State: APjAAAVVDP+0799iN7yFG+eoiCtqXV2v+vNoEQBK8d0DIAX0UFQ+9y4V
        F3AkMqLJZk3tipkH5vUqAM0=
X-Google-Smtp-Source: APXvYqyoNpL7JNr6fzQGvbgLfKgJsIZcPfbrRAGknNTrjrqkxFtSsE80PHNU91LWByI9gkjdaETv6w==
X-Received: by 2002:a17:90a:fa12:: with SMTP id cm18mr13985647pjb.137.1564934674142;
        Sun, 04 Aug 2019 09:04:34 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id c8sm9505686pjq.2.2019.08.04.09.04.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:04:33 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, stefan@agner.ch,
        shawnguo@kernel.org, festevam@gmail.com, aisheng.dong@nxp.com
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: freescale: mxs: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:34:20 +0530
Message-Id: <20190804160420.5309-1-nishkadg.linux@gmail.com>
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
 drivers/pinctrl/freescale/pinctrl-mxs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 641b3088876f..735cedd0958a 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -488,8 +488,10 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 		if (of_property_read_u32(child, "reg", &val)) {
 			ret = mxs_pinctrl_parse_group(pdev, child,
 						      idxg++, NULL);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 			continue;
 		}
 
@@ -499,15 +501,19 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 						 f->ngroups,
 						 sizeof(*f->groups),
 						 GFP_KERNEL);
-			if (!f->groups)
+			if (!f->groups) {
+				of_node_put(child);
 				return -ENOMEM;
+			}
 			fn = child->name;
 			i = 0;
 		}
 		ret = mxs_pinctrl_parse_group(pdev, child, idxg++,
 					      &f->groups[i++]);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.19.1

