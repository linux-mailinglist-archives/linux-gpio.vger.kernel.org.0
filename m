Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DC8136DBF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgAJNTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:35 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:46580 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id odKU2100J5USYZQ06dKUhJ; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007XJ-Hq; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Ib-Gu; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/13] pinctrl: sh-pfc: checker: Add data register checks
Date:   Fri, 10 Jan 2020 14:19:26 +0100
Message-Id: <20200110131927.1029-13-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add checks for data register descriptors:
  1. Register addresses must be unique.
  2. Enum ID values must be unique.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index eb2b0860378407e5..34d3d210c7347336 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -1004,6 +1004,14 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	/* Check ioctrl registers */
 	for (i = 0; info->ioctrl_regs && info->ioctrl_regs[i].reg; i++)
 		sh_pfc_check_reg(drvname, info->ioctrl_regs[i].reg);
+
+	/* Check data registers */
+	for (i = 0; info->data_regs && info->data_regs[i].reg; i++) {
+		sh_pfc_check_reg(drvname, info->data_regs[i].reg);
+		sh_pfc_check_reg_enums(drvname, info->data_regs[i].reg,
+				       info->data_regs[i].enum_ids,
+				       info->data_regs[i].reg_width);
+	}
 }
 
 static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
-- 
2.17.1

