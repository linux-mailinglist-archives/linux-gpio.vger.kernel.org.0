Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA75B124546
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 12:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLRLFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 06:05:03 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:35524 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726141AbfLRLFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 06:05:02 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihX8U-000088-0X; Wed, 18 Dec 2019 11:04:58 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihX8T-00Acz1-Gj; Wed, 18 Dec 2019 11:04:57 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] pinctrl: tegra: fix missing __iomem in suspend/resume
Date:   Wed, 18 Dec 2019 11:04:56 +0000
Message-Id: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The functions should have __iomem on the register pointer
so add that to silence the following sparse warnings:

drivers/pinctrl/tegra/pinctrl-tegra.c:657:22: warning: incorrect type in assignment (different address spaces)
drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    expected unsigned int [usertype] *regs
drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    got void [noderef] <asn:2> *
drivers/pinctrl/tegra/pinctrl-tegra.c:659:42: warning: incorrect type in argument 1 (different address spaces)
drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    expected void const volatile [noderef] <asn:2> *addr
drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    got unsigned int [usertype] *
drivers/pinctrl/tegra/pinctrl-tegra.c:675:22: warning: incorrect type in assignment (different address spaces)
drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    expected unsigned int [usertype] *regs
drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    got void [noderef] <asn:2> *
drivers/pinctrl/tegra/pinctrl-tegra.c:677:25: warning: incorrect type in argument 2 (different address spaces)
drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    expected void volatile [noderef] <asn:2> *addr
drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    got unsigned int [usertype] *

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 692d8b3e2a20..cefbbb8d1a68 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -648,7 +648,7 @@ static int tegra_pinctrl_suspend(struct device *dev)
 {
 	struct tegra_pmx *pmx = dev_get_drvdata(dev);
 	u32 *backup_regs = pmx->backup_regs;
-	u32 *regs;
+	u32 __iomem *regs;
 	size_t bank_size;
 	unsigned int i, k;
 
@@ -666,7 +666,7 @@ static int tegra_pinctrl_resume(struct device *dev)
 {
 	struct tegra_pmx *pmx = dev_get_drvdata(dev);
 	u32 *backup_regs = pmx->backup_regs;
-	u32 *regs;
+	u32 __iomem *regs;
 	size_t bank_size;
 	unsigned int i, k;
 
-- 
2.24.0

