Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E238C85BF3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 09:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbfHHHre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 03:47:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45165 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730887AbfHHHre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 03:47:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so1064831plr.12
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rESte5/57okCowz10RtqHSCa/mKipnoo2DWd+udp9Q=;
        b=sRDhhJpt+/SXsSfg3oUjpHPQcYF6DZUMlgwXkoGoEJxhfxulV6+nhQ+JVKm2CJcyxn
         mLh31PM9g4jiOc88jqEPfr2hZR6KyIKtDJMEsC3meMTNt9tLWENdM7V0yjMTPpi1GMt/
         J6/FEbqmZqMJKeuOytpLmZ9B9hIyJSYBGOKrvxI8vO4k+6t/FYTs5Z2n9YoytI0vcwgQ
         k96Z8aiSDy+W8lqe9yKpnJ8PyaiGSvPVGFUoMyiyevWlZkJO5T0FMs/Eh1dZAB6Mzqir
         SHSWW01PMimuLSC3nWRkCA6k32a0iYXWwDEgKe9pHymrKakiQJsp0iiTw2i8mlwaws2n
         zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rESte5/57okCowz10RtqHSCa/mKipnoo2DWd+udp9Q=;
        b=aDE6z8htbfXg1mc5MHruT1yW5bwbhfj7LnkfQ0qbXmL6V2HKHGc4VqATKnzUEXgRyJ
         9BuKEPQzPsizcXSwBN48wUhBwTBNbReE+PIIGGkxbOT1svhr+Bb0BRJBShXiiz6zhBhL
         vbnJ//7LtKrvrKR6cFsXdRzvWraB6Vb4wx1TSM4Q2qtaZj5mdi8aaYCjnVQ4MKvZu7M0
         DrTwP5QWEePsdRpQoJ8myh/gsV/CbAsqJp6Ax3j6XRuasYloA19tS7JJjsu/lDuLGte+
         3onw6vmRugs9PY8dASRSo1ZX4sfaKsFqVIeUJcPdzrtOp/vksfJNta1258Ce0RliCdmV
         MxnQ==
X-Gm-Message-State: APjAAAWIPDfz7jpTt4wgmRowN7r8C+ea7n4JfQkombjOiZ3aQklxorxY
        pIPfimNnCpum3+BX0fdB4XE=
X-Google-Smtp-Source: APXvYqzqPfZHIApuMh5OHeyfe24xH8jfgbus4OqX9KWnaF77FBz58qGVCMciafF9d9o+0Z7yvZ2dJg==
X-Received: by 2002:a17:902:5a2:: with SMTP id f31mr12011172plf.72.1565250453700;
        Thu, 08 Aug 2019 00:47:33 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
        by smtp.gmail.com with ESMTPSA id i14sm147454599pfk.0.2019.08.08.00.47.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 00:47:33 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: freescale: imx: Add of_node_put() before return
Date:   Thu,  8 Aug 2019 13:17:20 +0530
Message-Id: <20190808074720.15754-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node() puts the previous node;
however, in the case of a return from the middle of the loop, there is no
put, thus causing a memory leak. Hence put of_node_put() statements as
required before two mid-loop return statements.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 83ff9532bae6..9f42036c5fbb 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -672,8 +672,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
 				   GFP_KERNEL);
-		if (!grp)
+		if (!grp) {
+			of_node_put(child);
 			return -ENOMEM;
+		}
 
 		mutex_lock(&ipctl->mutex);
 		radix_tree_insert(&pctl->pin_group_tree,
@@ -697,12 +699,17 @@ static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 	struct device_node *pinctrl_np;
 
 	for_each_child_of_node(np, function_np) {
-		if (of_property_read_bool(function_np, "fsl,pins"))
+		if (of_property_read_bool(function_np, "fsl,pins")) {
+			of_node_put(function_np);
 			return true;
+		}
 
 		for_each_child_of_node(function_np, pinctrl_np) {
-			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
+			if (of_property_read_bool(pinctrl_np, "fsl,pins")) {
+				of_node_put(pinctrl_np);
+				of_node_put(function_np);
 				return false;
+			}
 		}
 	}
 
-- 
2.19.1

