Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81004381D2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 01:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFFXcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 19:32:17 -0400
Received: from gateway36.websitewelcome.com ([192.185.196.23]:13523 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726305AbfFFXcQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 19:32:16 -0400
X-Greylist: delayed 1228 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jun 2019 19:32:15 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id C4D7E400E0006
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2019 17:32:43 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id Z1XuhzkcI2PzOZ1XuhJnAa; Thu, 06 Jun 2019 18:11:46 -0500
X-Authority-Reason: nr=8
Received: from [189.250.127.120] (port=54232 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hZ1Xt-000gqI-Gn; Thu, 06 Jun 2019 18:11:45 -0500
Date:   Thu, 6 Jun 2019 18:11:44 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH v2] pinctrl: tb10x: Use flexible-array member and
 struct_size() helper
Message-ID: <20190606231144.GA1402@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.127.120
X-Source-L: No
X-Exim-ID: 1hZ1Xt-000gqI-Gn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.127.120]:54232
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the code to use a flexible array member instead of a pointer in
structure tb10x_pinctrl and use the struct_size() helper:

struct tb10x_pinctrl {
        ...
	struct tb10x_of_pinfunc pinfuncs[];
};

Also, make use of the struct_size() helper instead of an open-coded
version in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(struct tb10x_pinctrl) + of_get_child_count(of_node) * sizeof(struct tb10x_of_pinfunc)

with:

struct_size(state, pinfuncs, of_get_child_count(of_node))

This code was detected with the help of Coccinelle.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Update changelog text.
 - Add Kees' Reviewed-by tag.

 drivers/pinctrl/pinctrl-tb10x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 2e90a6d8fb3b..a32badf3f118 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -483,22 +483,22 @@ struct tb10x_port {
  * @base: register set base address.
  * @pingroups: pointer to an array of the pin groups this driver manages.
  * @pinfuncgrpcnt: number of pingroups in @pingroups.
- * @pinfuncs: pointer to an array of pin functions this driver manages.
  * @pinfuncnt: number of pin functions in @pinfuncs.
  * @mutex: mutex for exclusive access to a pin controller's state.
  * @ports: current state of each port.
  * @gpios: Indicates if a given pin is currently used as GPIO (1) or not (0).
+ * @pinfuncs: flexible array of pin functions this driver manages.
  */
 struct tb10x_pinctrl {
 	struct pinctrl_dev *pctl;
 	void *base;
 	const struct tb10x_pinfuncgrp *pingroups;
 	unsigned int pinfuncgrpcnt;
-	struct tb10x_of_pinfunc *pinfuncs;
 	unsigned int pinfuncnt;
 	struct mutex mutex;
 	struct tb10x_port ports[TB10X_PORTS];
 	DECLARE_BITMAP(gpios, MAX_PIN + 1);
+	struct tb10x_of_pinfunc pinfuncs[];
 };
 
 static inline void tb10x_pinctrl_set_config(struct tb10x_pinctrl *state,
@@ -771,15 +771,13 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	state = devm_kzalloc(dev, sizeof(struct tb10x_pinctrl) +
-					of_get_child_count(of_node)
-					* sizeof(struct tb10x_of_pinfunc),
-				GFP_KERNEL);
+	state = devm_kzalloc(dev, struct_size(state, pinfuncs,
+					      of_get_child_count(of_node)),
+			     GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, state);
-	state->pinfuncs = (struct tb10x_of_pinfunc *)(state + 1);
 	mutex_init(&state->mutex);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.21.0

