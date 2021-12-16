Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EB547788A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 17:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbhLPQWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 11:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239574AbhLPQWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 11:22:14 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F838C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:14 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id k2so39287743lji.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lWtkWUkkW3ND3RjcGaqJdo8TrrjuOiBcKkAeDb9fTo=;
        b=X19CCWSHn+YUHSaTyIW1WkzS0qn/tl30Lmbqg5N7OydTWstDVDYHDH22bqmTE4S4Rk
         5U0jsh8xNoewi0aeZ8t3LbOALo5ol45GHayFSqWcgvO1q1p2zXwHxD79ClnJPmlDPMgQ
         0TJ/LQ3mKJTaWy/tNmXDdGCaQvRNE0rAYzxPav3wRBLSnUZh9s7/vvMp26kTog9mQql/
         oexJaqt8KdTpN2iRmXEbWgA4ij/rjeDjSRYz/tRgvFYA60JLCiWfmrBGvfbfWdIZHNJ1
         No6qAASzU1mJZZL2Pf90U0jWc1fI/1S/ohuiwXZG+boKRlTTZMBsniLW5n+Nz+1y1zi2
         IVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lWtkWUkkW3ND3RjcGaqJdo8TrrjuOiBcKkAeDb9fTo=;
        b=o7MC5xzHT+2c6AeYRuAaBmwVvvbi2MGEUTASEiOTc36zy7bF728xKYUNjhplg9+7UL
         pt21oVgbpLs7HW2EYJRAxTvB9NCShbne6h07xf9a+xS2SibOgGKvRtDXAI6V0qIZwuma
         vFa2LADACT6QLdMc8v6L1AwI2+yc4gvV0qrywFmWxgy7GsVX8TxXfZQ9XT4rTmzWYV61
         dcb5/z65UBiln9/+IYodDwqqJb64Z09pHVAqCwinYLxrFhzsTghuxgw4RECMzzmJgmI4
         8RgBS6bY+YOzqQc8hHPdjyq3ZnkCbFrCpYRc0IjJp/wk2nr/Zx5H4QVmoc6NGsqvGISX
         QrCQ==
X-Gm-Message-State: AOAM530I6jSUruUyNCYdoFfv0Pi12rZlqMlZlFGiUm1aQD4SIJIfWFuu
        UTWa86p7HSEIYhWoBcNWZwMXB5CIr+4=
X-Google-Smtp-Source: ABdhPJw7w293M7f00o/g7bhxbJz0jq9qzwJ29MYFqBPAHxUkJMWnG8RqduvBa2CVLAnpR9T+cSbrfQ==
X-Received: by 2002:a2e:8502:: with SMTP id j2mr16129822lji.191.1639671732555;
        Thu, 16 Dec 2021 08:22:12 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm938623lfg.126.2021.12.16.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:22:12 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in "function_desc" const
Date:   Thu, 16 Dec 2021 17:22:03 +0100
Message-Id: <20211216162206.8027-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

The plan for "struct function_desc" is to make its "group_names"
/double/ const. That will allow drivers to use it with static const
data.

This imx change is required to avoid:
drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_functions':
drivers/pinctrl/freescale/pinctrl-imx.c:672:24: error: assignment of read-only location '*(func->group_names + (sizetype)(i * 4))'
  672 |   func->group_names[i] = child->name;
      |                        ^

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index daf28bc5661d..47b2ab1a14d0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -648,6 +648,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	struct device_node *child;
 	struct function_desc *func;
 	struct group_desc *grp;
+	const char **group_names;
 	u32 i = 0;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
@@ -663,14 +664,16 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		dev_err(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
-	func->group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
-					 sizeof(char *), GFP_KERNEL);
+
+	group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
+				   sizeof(char *), GFP_KERNEL);
 	if (!func->group_names)
 		return -ENOMEM;
+	for_each_child_of_node(np, child)
+		group_names[i] = child->name;
+	func->group_names = group_names;
 
 	for_each_child_of_node(np, child) {
-		func->group_names[i] = child->name;
-
 		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
 				   GFP_KERNEL);
 		if (!grp) {
-- 
2.31.1

