Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638FB41644B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 19:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242401AbhIWRYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 13:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242288AbhIWRY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 13:24:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96662C061574
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 10:22:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c33so3125272ljr.8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kqgy4XtrAnXd2pwfNj+EfVSyKbIEO/VB+6CmCbnUb58=;
        b=I0Kwhlf34TW1DuoQ+RwuO0yue27TE8Y7tMoc11qLpjk3yW+l4/DoYG5Xbpo3g5lny9
         EdX1P8Wl7quuPC1PpeLn3GTeLsg72juTpB+uK8w1y7xwPqRnpSX8/NrGWBXK78wLqLeG
         DuePTk38DGSo+FISTCPDNL2Ct/vKeicrYeT2Ye33scu7jMYTchYgrkThMGGxf+TGBVZy
         zb3iwKBNKBHCDr5rNz1YniOfyQAnGaNNj2/3agCZtiwX9yXuM0eZWivvwHb24mkMLTw0
         ioeDk4qPERuaQlcffNtk8/U6zVtRGTVJi+P44P34uwV47wzSqGy7G1uCwNoBVV2wfJhj
         yt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kqgy4XtrAnXd2pwfNj+EfVSyKbIEO/VB+6CmCbnUb58=;
        b=b6pctg0+vB1O2HfGpxT7+U7nB6D9oMBuJCyfuuDa50BxFtwy2DB6cNHNcv2yR1aFOl
         U3oplTBrOnXYynFCMwD+Zc5Frt1iL9L/81JxPX19o9yxz0S72cVstd+9RCuosnwU5LVX
         QPQcUuw19NnQUkuau+JIscrUqE/8tVTcQW+tbG8mtZAtcsCKEsH0kAdJBXagsL1tlTSO
         jw136SMsUlAbY/mf2SQ3vTOGoLsPByMfu5KnxTL9bmL0V9agOLX74JfR3GZbdS+tbxOx
         Ay3hgvc7t/c+id48JF/H7GmTz5G5zaaNppTNOutfz+RtDORIVdTWLpmg8lFW/3TiEX7/
         BX9A==
X-Gm-Message-State: AOAM530Z2Nf6blxX7t1R38ap49PPrO0PWVAI80RO8DvtWEPpajTkXNuZ
        1kZAdV4xo50yAJ9mCdg5aJxC0Q==
X-Google-Smtp-Source: ABdhPJyVseVGMDpMEEMzWfb3vbFS/Cx90+7pdNZah6YXtDvtAQ/Ml0GNuMXYIGzuanIC4dHHeOF/fw==
X-Received: by 2002:a2e:944d:: with SMTP id o13mr6618922ljh.419.1632417775933;
        Thu, 23 Sep 2021 10:22:55 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id p23sm336660ljm.127.2021.09.23.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 10:22:55 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] gpio: pca953x: do not ignore i2c errors
Date:   Thu, 23 Sep 2021 20:22:16 +0300
Message-Id: <20210923172215.18376-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>

Per gpio_chip interface, error shall be proparated to the caller.

Attempt to silent diagnostics by returning zero (as written in the
comment) is plain wrong, because the zero return can be interpreted by
the caller as the gpio value.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/gpio/gpio-pca953x.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f5cfc0698799..8ebf369b3ba0 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -468,15 +468,8 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 	mutex_lock(&chip->i2c_lock);
 	ret = regmap_read(chip->regmap, inreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
-	if (ret < 0) {
-		/*
-		 * NOTE:
-		 * diagnostic already emitted; that's all we should
-		 * do unless gpio_*_value_cansleep() calls become different
-		 * from their nonsleeping siblings (and report faults).
-		 */
-		return 0;
-	}
+	if (ret < 0)
+		return ret;
 
 	return !!(reg_val & bit);
 }
-- 
2.30.2

