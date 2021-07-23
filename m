Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0523D4192
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 22:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhGWTw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 15:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWTw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 15:52:27 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3E8C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so5270118pji.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZVKUlKTGS2ng4q72AzoDhDV3MB8Gv1pVGQS808AjNI=;
        b=Af1untcUb5Xc3lJtiGzq7c9sCYcoJCQcs5GjdB/OMFqTfNrMQYHtR3PTp6C0XB0c8Q
         YwuLwdAmY2tcqSemm/0c/lBgJ466TaolyYk9MEVfOlACc91NMCAcWobGYmS/tYVjxDPA
         vbQCHRsaRDQVGrPkpmd8BvlgULCexk/eZW156Cn6CdLmFxYcOKynzgcOkKcVAtkstPkV
         hO4wa486HfBPOVGP8+f54P62KlvDZwR32k0UZfIKixPafccc2o5QKCzKD3qUMMhmxxN2
         cC26QRclGZoquh01zAYh688VDRimeh/UrKYewlwKOXJjgwHH+E945TiewaMVetui9f+k
         Hirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZVKUlKTGS2ng4q72AzoDhDV3MB8Gv1pVGQS808AjNI=;
        b=IGzGGKVRSj2SaAjoUCFkeKTALEzyMopPOCSAtSyQ+1571Nc2BQCeG1AILMT+7E7I4/
         t3CCdpVS1DecKLWCAefizU51h9qIQnmLXqLux5nADseYIhfJ8L4oz4vYrEwE/J/Ypjdb
         pUjZCk3UEjPJlHQy3FR59thYsczF+iIX6UMop0KR8giYvEotHJQczb5mtGcGdBAXtbZ0
         Cuv4bF5pNVgZ5cTZgHLVWGk1bvhX/LDWMSKe1uoqH8efzeI2px20P9YyGY3uyH+YUJxd
         yiFfAVWP8OquIdIIvq1iXjY84VvUPYOjuu9wFJw3LJBHjfLTzIBdfKk+9j/3g0vOPixu
         OKvQ==
X-Gm-Message-State: AOAM53309A26N42so8WDBaIFADhnaEZTkd9P1zw9LTMNYyGGoJl37rxm
        xeacnUShPBSWEXZX56KLlVg=
X-Google-Smtp-Source: ABdhPJyBy9TY9oSk5XeSmpzyKqvNF6iZxHYVlvP2x/By6LgdAfGgbqPl5wGTM8EQagQYP2XIQUIanw==
X-Received: by 2002:a65:490b:: with SMTP id p11mr6314513pgs.313.1627072379808;
        Fri, 23 Jul 2021 13:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:d157:8bd3:ec42:18c3])
        by smtp.gmail.com with ESMTPSA id e13sm36222708pfd.11.2021.07.23.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 13:32:58 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        Fabio Estevam <festevam@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: imx8ulp: Initialize pin_reg
Date:   Fri, 23 Jul 2021 17:32:42 -0300
Message-Id: <20210723203242.88845-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The initialization of pin_reg is missing, causing the following build
warning:

drivers/pinctrl/freescale/pinctrl-imx8ulp.c:228:35: warning: 'pin_reg' is used uninitialized in this function [-Wuninitialized]

Initialize pin_reg the same way as it is done on vf610 and imx7ulp
to fix the problem.

Fixes: 16b343e8e0ef ("pinctrl: imx8ulp: Add pinctrl driver support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8ulp.c b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
index c5db5dfcfcce..f8572597a54e 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
@@ -225,6 +225,10 @@ static int imx8ulp_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	const struct imx_pin_reg *pin_reg;
 	u32 reg;
 
+	pin_reg = &ipctl->pin_regs[offset];
+	if (pin_reg->mux_reg == -1)
+		return -EINVAL;
+
 	reg = readl(ipctl->base + pin_reg->mux_reg);
 	if (input)
 		reg = (reg & ~BM_OBE_ENABLED) | BM_IBE_ENABLED;
-- 
2.25.1

