Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013567C37A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbfGaN30 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:29:26 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:33492 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfGaN30 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:29:26 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id jRVQ2000E05gfCL06RVQUN; Wed, 31 Jul 2019 15:29:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofU-0001Aj-D5; Wed, 31 Jul 2019 15:29:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofU-0004ao-Bg; Wed, 31 Jul 2019 15:29:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] pinctrl: devicetree: Use strlen() instead of hardcoded number
Date:   Wed, 31 Jul 2019 15:29:15 +0200
Message-Id: <20190731132917.17607-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731132917.17607-1-geert+renesas@glider.be>
References: <20190731132917.17607-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve readability by replacing a hardcoded number requiring a comment
by strlen().

Gcc is smart enough to evaluate the length of a constant string at
compile-time.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/devicetree.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 88ddbb2e30de10f6..5d6d8b1e906203af 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -228,10 +228,8 @@ int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
 		 * than dynamically allocate it and have to free it later,
 		 * just point part way into the property name for the string.
 		 */
-		if (ret < 0) {
-			/* strlen("pinctrl-") == 8 */
-			statename = prop->name + 8;
-		}
+		if (ret < 0)
+			statename = prop->name + strlen("pinctrl-");
 
 		/* For every referenced pin configuration node in it */
 		for (config = 0; config < size; config++) {
-- 
2.17.1

