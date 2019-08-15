Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 453A28E4BE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 08:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfHOGGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 02:06:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33398 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfHOGGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 02:06:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so873125pfq.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 23:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWP/C/XpjQhJDAx2QHm1UDwbKPSNG33jAiOfZIHArMw=;
        b=ta+mnThUrSgw4PJu9B1bI/erSr+RFYpPGO/FcdAk2Y1C87+F1jr+hjOb37wXGBB5I4
         QG2PirON/lA1Fi1LUXZFmmzgJZftvnEkWDWyv6SsuI9m53Lt8PY268xzIZ0uQD1Q/Okf
         Y14nXreXD1kJQ3ICkN4HmTPIYCbiwEA0OnaUN9etLN9HMaHrTQ/W5UNWOpOwNEdJc8vV
         Qo8Rn+d0cH1XngoVUCY33JcKNpGfSN9/A8MCJjJ82SrmftLMLjkFAzu8SV1dUvUVRj6V
         bPyX8f+e8YB3C4f8EThbKazbR4InCuGL6DHhYTdG6AfAuYaWLlOcGu20hn+PsH4eZyND
         Ro2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWP/C/XpjQhJDAx2QHm1UDwbKPSNG33jAiOfZIHArMw=;
        b=p7qm2+B26Z9FF7lkYzZF1KoRfz36f5GUhKQgdomzjDWcBWNhg9/w2YhKrNekX5dmUO
         d7dMqGyocrswImuuL7XP+ECiRpPKTxGMtRftsE9VRkt34wKGSsnz9E973ls89yup1Mqc
         Dn6kYQGZSC96ilSNFExOmtBm0eyKHEUbo26zxp9Qzr0kVh0QGhqX0NfhFjWGH86zm0oB
         0Mw3D6NxJISjtA7KZfnZPzqvNlfkvwAAZFcPlyR/SLwR+oso1zp+GSd86oSIQgfFvsUW
         9WVhrsaoEsJfPKrzfMBi+HLUT0M5bhLd9dj8VHCrpgTbWr+XWCzb9FB8b2Al/HGhHuJA
         8lIQ==
X-Gm-Message-State: APjAAAWOvg6O1l4Q2WlZs7K9aOkAnpV8tYJxeBR8Ep1CWi67oIsXmvXy
        THAkIOphbtrkTm215Hg0GlU=
X-Google-Smtp-Source: APXvYqxTYYMswK13ErwYCDDOlLX/KNuxx4uj1nuebSYRyIorlOmqQpwOmMfKl+Go7/pr6OEwiqq+FQ==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id b44mr808587pjc.87.1565849184305;
        Wed, 14 Aug 2019 23:06:24 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id i9sm411521pjj.2.2019.08.14.23.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 23:06:23 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     patrice.chotard@st.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: st: Add of_node_put() before return
Date:   Thu, 15 Aug 2019 11:36:09 +0530
Message-Id: <20190815060609.3056-1-nishkadg.linux@gmail.com>
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
 drivers/pinctrl/pinctrl-st.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index b9688ea548da..e788c7495ec7 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1262,8 +1262,10 @@ static int st_pctl_parse_functions(struct device_node *np,
 		grp = &info->groups[*grp_index];
 		*grp_index += 1;
 		ret = st_pctl_dt_parse_groups(child, grp, info, i++);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 	dev_info(info->dev, "Function[%d\t name:%s,\tgroups:%d]\n",
 				index, func->name, func->ngroups);
@@ -1623,8 +1625,10 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 		if (of_property_read_bool(child, "gpio-controller")) {
 			const char *bank_name = NULL;
 			ret = st_gpiolib_register_bank(info, bank, child);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 
 			k = info->banks[bank].range.pin_base;
 			bank_name = info->banks[bank].range.name;
@@ -1641,6 +1645,7 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 							i++, &grp_index);
 			if (ret) {
 				dev_err(&pdev->dev, "No functions found.\n");
+				of_node_put(child);
 				return ret;
 			}
 		}
-- 
2.19.1

