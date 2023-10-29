Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FA07DB0F2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Oct 2023 00:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbjJ2XYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Oct 2023 19:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbjJ2XY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Oct 2023 19:24:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A8C6F86;
        Sun, 29 Oct 2023 16:01:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09072C116B2;
        Sun, 29 Oct 2023 22:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698620400;
        bh=FMQrM8rvPb+BR3jkz89P0nM8HxUUIDo2skSSGYxw9PI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E5k88aQYiKsD1kwxHo0MottDmDlsK5cds5G8c5aOM01lW90RN5Su55HYxssMiWPl9
         lg2uoFz8OIrdBDJJaQ0ArhtupBh0jicOAo2aYTCPXajVBvhRz60VtZiL5w/0Ivispl
         iUyqM6q+RJo7MDTCIVkal0LeBgcs3og5n/M7mzPfqtYsjlbARYmI78wizR+lnxmxEw
         m6Ivyy/AsPgx8jt82vhzkaqQXOFu8uLVbxc/LMHw1nR+qo8j0Q3ffANMzINwK8J8J9
         470VtLfINvA0xC5GqXFDr59imC2mJkkUqtebmeQOxH8JZpbl1difquXRyhswx1f5B5
         51+efl/MUWxTA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 28/28] Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
Date:   Sun, 29 Oct 2023 18:59:03 -0400
Message-ID: <20231029225916.791798-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 62140a1e4dec4594d5d1e1d353747bf2ef434e8b ]

The commit breaks MMC enumeration on the Intel Merrifield
plaform.

Before:
[   36.439057] mmc0: SDHCI controller on PCI [0000:00:01.0] using ADMA
[   36.450924] mmc2: SDHCI controller on PCI [0000:00:01.3] using ADMA
[   36.459355] mmc1: SDHCI controller on PCI [0000:00:01.2] using ADMA
[   36.706399] mmc0: new DDR MMC card at address 0001
[   37.058972] mmc2: new ultra high speed DDR50 SDIO card at address 0001
[   37.278977] mmcblk0: mmc0:0001 H4G1d 3.64 GiB
[   37.297300]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10

After:
[   36.436704] mmc2: SDHCI controller on PCI [0000:00:01.3] using ADMA
[   36.436720] mmc1: SDHCI controller on PCI [0000:00:01.0] using ADMA
[   36.463685] mmc0: SDHCI controller on PCI [0000:00:01.2] using ADMA
[   36.720627] mmc1: new DDR MMC card at address 0001
[   37.068181] mmc2: new ultra high speed DDR50 SDIO card at address 0001
[   37.279998] mmcblk1: mmc1:0001 H4G1d 3.64 GiB
[   37.302670]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10

This reverts commit c153a4edff6ab01370fcac8e46f9c89cca1060c2.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20231017141806.535191-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 17c6931211c65..ffe39336fcaca 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1007,20 +1007,17 @@ static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
 
 static struct pinctrl *find_pinctrl(struct device *dev)
 {
-	struct pinctrl *entry, *p = NULL;
+	struct pinctrl *p;
 
 	mutex_lock(&pinctrl_list_mutex);
-
-	list_for_each_entry(entry, &pinctrl_list, node) {
-		if (entry->dev == dev) {
-			p = entry;
-			kref_get(&p->users);
-			break;
+	list_for_each_entry(p, &pinctrl_list, node)
+		if (p->dev == dev) {
+			mutex_unlock(&pinctrl_list_mutex);
+			return p;
 		}
-	}
 
 	mutex_unlock(&pinctrl_list_mutex);
-	return p;
+	return NULL;
 }
 
 static void pinctrl_free(struct pinctrl *p, bool inlist);
@@ -1129,6 +1126,7 @@ struct pinctrl *pinctrl_get(struct device *dev)
 	p = find_pinctrl(dev);
 	if (p) {
 		dev_dbg(dev, "obtain a copy of previously claimed pinctrl\n");
+		kref_get(&p->users);
 		return p;
 	}
 
-- 
2.42.0

