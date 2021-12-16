Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BECE477892
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239495AbhLPQWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 11:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239566AbhLPQWS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 11:22:18 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873ABC061401
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:17 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 207so39278164ljf.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lUnqODC8l6jXMRXSjWHaW3K51f2Zp3o4i2EaGR4+YbQ=;
        b=lvXiAF1d3Vs6sdW3IGqJJAUJXmkC98UgqlCJXdWz4XRv6C+B2cDS1Bf41kUY0g2Zkz
         xYZiJ+HHUlS4YHH4irezA1s/Xn+KoDL/90rVDnGDTT2oHgjhwqlmlSy6cNxnvxCmw9lO
         vFJlw0d5k4Oj5l64lX3jLconjiLdN2tEcyHmnUuH3Rcqdow/Rm841YmWY7Awofrw+RIh
         1kZHNv+RMH2gYu8zKPOiMijlsd6RYSAv4g5ocOwpMStnlo/T3wEOXp6aOx6/tcbtfJNO
         V3Zh0jJQkwhculKk8tpYf4EqFP6MnmJRJ2Cn9v97qeNzMfDNimWbJ1u8zbKQJ92rtnrs
         YTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lUnqODC8l6jXMRXSjWHaW3K51f2Zp3o4i2EaGR4+YbQ=;
        b=D3bOGZ9VBtvKFqkCkvFrqUDTNZxQ65OuXhyLU6+YJV1VPyFGr1W4/S5TQcixidUisx
         cl26raVXj0lNMEU8Zm37+6BCp26BPFdy954s3klAMj1pUgVCn2LIfony/cZMznTO5oOW
         plcib0YkT7HuXi/sM7RTss8FYXxhLS1PlQZ1t2dmvxk/D9cPDaQ2zbe7iOaImblefLZe
         /yuj1ihxvuy//Bbg0t0pEFr5aYb1tR+SJiV9WAtKJ0RUr7tkqF9CH3wQkjYB43ZjtWmw
         qqkTf0ruE/01sHKQOaUZN1gkw9WOxaE+Uf28Ewdudjd4UEFjDJfb/U7WHrPiXl0KhPdM
         genA==
X-Gm-Message-State: AOAM533igyuI7CVuJ+lWLJ0Pc47jO+9wOz025x9xHM+IR5F+/bc7rlaF
        YaW/z1AgAGWNPdVHQV0JXvw=
X-Google-Smtp-Source: ABdhPJwCahoizSn2WH15Q57HOXkXWNpk/FmVvJXcE9B0YnDgR8bHY5REokQAOeCUiLKOMPZGnP+GsA==
X-Received: by 2002:a2e:5d6:: with SMTP id 205mr15153216ljf.270.1639671735855;
        Thu, 16 Dec 2021 08:22:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm938623lfg.126.2021.12.16.08.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:22:15 -0800 (PST)
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
Subject: [PATCH V2 3/4] pinctrl: keembay: rework loops looking for groups names
Date:   Thu, 16 Dec 2021 17:22:05 +0100
Message-Id: <20211216162206.8027-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
References: <20211216162206.8027-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Make the outer loop iterate over functions as that's the real subject.
This simplifies code (and reduces amount of lines of code) as allocating
memory for names doesn't require extra checks anymore.

While at it use local "group_names" variable. The plan for
"struct function_desc" is to make its "group_names" /double/ const. That
will allow drivers to use it with static const data.

This keembay "group_names" change is required to avoid:
drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_add_functions':
drivers/pinctrl/pinctrl-keembay.c:1594:8: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1594 |    grp = func->group_names;
      |        ^

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This has been runtime tested. I verified that output of
/sys/kernel/debug/pinctrl/*/pinmux-functions is the same without and
with my patches.
---
 drivers/pinctrl/pinctrl-keembay.c | 66 ++++++++++++-------------------
 1 file changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 9a602abad8df..152c35bce8ec 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1555,58 +1555,42 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *function)
+				 struct function_desc *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
-	for (i = 0; i < kpc->npins; i++) {
-		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct keembay_mux_desc *mux = pdesc->drv_data;
-
-		while (mux->name) {
-			struct function_desc *func;
-			const char **grp;
-			size_t grp_size;
-			u32 j, grp_num;
-
-			for (j = 0; j < kpc->nfuncs; j++) {
-				if (!strcmp(mux->name, function[j].name))
-					break;
-			}
-
-			if (j == kpc->nfuncs)
-				return -EINVAL;
-
-			func = function + j;
-			grp_num = func->num_group_names;
-			grp_size = sizeof(*func->group_names);
-
-			if (!func->group_names) {
-				func->group_names = devm_kcalloc(kpc->dev,
-								 grp_num,
-								 grp_size,
-								 GFP_KERNEL);
-				if (!func->group_names)
-					return -ENOMEM;
+	for (i = 0; i < kpc->nfuncs; i++) {
+		struct function_desc *func = &functions[i];
+		const char **group_names;
+		unsigned int grp_idx = 0;
+		int j;
+
+		group_names = devm_kcalloc(kpc->dev, func->num_group_names,
+					   sizeof(*group_names), GFP_KERNEL);
+		if (!group_names)
+			return -ENOMEM;
+
+		for (j = 0; j < kpc->npins; j++) {
+			const struct pinctrl_pin_desc *pdesc = &keembay_pins[j];
+			struct keembay_mux_desc *mux;
+
+			for (mux = pdesc->drv_data; mux->name; mux++) {
+				if (!strcmp(mux->name, func->name))
+					group_names[grp_idx++] = pdesc->name;
 			}
-
-			grp = func->group_names;
-			while (*grp)
-				grp++;
-
-			*grp = pdesc->name;
-			mux++;
 		}
+
+		func->group_names = group_names;
 	}
 
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++) {
 		pinmux_generic_add_function(kpc->pctrl,
-					    function[i].name,
-					    function[i].group_names,
-					    function[i].num_group_names,
-					    function[i].data);
+					    functions[i].name,
+					    functions[i].group_names,
+					    functions[i].num_group_names,
+					    functions[i].data);
 	}
 
 	return 0;
-- 
2.31.1

