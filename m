Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5065247FC93
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Dec 2021 13:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhL0MXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Dec 2021 07:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbhL0MXN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Dec 2021 07:23:13 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C989C06173E
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 04:23:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bu9so34455444lfb.7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Dec 2021 04:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCOTppZx5ITVQRcOYLCvtJwW/rivHndYR4t8j9Wor2I=;
        b=Z+f9Sn3XeYJ8fUCwkKs6VRhJrPGpqWTSCklhKr66uES/FF7Bm0y0XNP2hzVNedDzM7
         JclSbjNrdeNG0RuthZrTNQlDy+T0rn0FKn2u2lDwZU7mecyaC800kGqHBDqmHWr2XVje
         cIW2ZpCq30WLx8SlNewyTWlx4EQlWfP/329fs8Zu/zuXXqMrgATUuzVSITytxsWaT9b1
         wJkIL5xG6iV7fflZuSe0cT6HI+I9nv2ZfaiPT7naw1uRc7U9ro+FK+gwv18O/Pq9I+ak
         aMHGdPqCc2lubz66qC+9+3bb46METFPG3qlcQqW2DWWi2PUViu5boN9Qw06yA0ollzEc
         kKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gCOTppZx5ITVQRcOYLCvtJwW/rivHndYR4t8j9Wor2I=;
        b=PplLtavqcR+tKryNaQ8gpAl2Yar4ZmibLSLZg9ihmMf9hlkR9xkdBPOeinltKGxkKh
         RsMU7GrxmzbT346GFWqrfPf4IGBW8jvqSM3c7dlM8N5p+kk7UNQ7Z6jHJ3TaIIFLDNyo
         grBaRL2JXyclQjeBhhLyfs8BreYZi/0Q3z55s8AbZaO1tRbjqhykdq6qlawbFqum3Hf1
         5/1tsd09THdnHKbAiXsNWu0KwPmZaFyxtAIXgv/eN9Ses18xNffR4GFzkitkKbiIXVlX
         U7E8n+bY5HolNskCmNY+TYja/B/pa4HZGN2MScEBo64DozXK+1hmjCwKUUQhdIaWhSr+
         up5A==
X-Gm-Message-State: AOAM532wDE+Lcc4v3l44tubukKNvNwB+AG+kSQT7BKDEuJlSdv77miT0
        tWJuYYXCzt5XuWPfYj5g2rU=
X-Google-Smtp-Source: ABdhPJxg010dhjQlFDfTMGi9rfJ33KtOUsrZSAssQUtB+8BCK0i6xXslM5cReHIoWcV0leS9jB0Khw==
X-Received: by 2002:a19:5042:: with SMTP id z2mr14793798lfj.603.1640607791229;
        Mon, 27 Dec 2021 04:23:11 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id b29sm1632461lfv.187.2021.12.27.04.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 04:23:10 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] pinctrl: imx: fix assigning groups names
Date:   Mon, 27 Dec 2021 13:22:37 +0100
Message-Id: <20211227122237.6363-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes regression caused by incorrect array indexing.

Reported-by: Fabio Estevam <festevam@gmail.com>
Fixes: 02f117134952 ("pinctrl: imx: prepare for making "group_names" in "function_desc" const")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 16bc1bfc03e4..fa3cc0b80ede 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -649,7 +649,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	struct function_desc *func;
 	struct group_desc *grp;
 	const char **group_names;
-	u32 i = 0;
+	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
@@ -669,10 +669,12 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				   sizeof(char *), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
+	i = 0;
 	for_each_child_of_node(np, child)
-		group_names[i] = child->name;
+		group_names[i++] = child->name;
 	func->group_names = group_names;
 
+	i = 0;
 	for_each_child_of_node(np, child) {
 		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
 				   GFP_KERNEL);
-- 
2.31.1

