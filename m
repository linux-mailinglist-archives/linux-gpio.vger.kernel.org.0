Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E168E124453
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 11:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLRKUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 05:20:19 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:60924 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbfLRKUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 05:20:19 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihWRD-0007Bi-NH; Wed, 18 Dec 2019 10:20:15 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihWRD-00ALHS-7f; Wed, 18 Dec 2019 10:20:15 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: actions: remove duplicate dsi entry
Date:   Wed, 18 Dec 2019 10:20:13 +0000
Message-Id: <20191218102013.2465038-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dsi entry is defined identically twice, so remove
the second one to remove the sparse warning:

drivers/pinctrl/actions/pinctrl-s700.c:1581:10: warning: Initializer entry defined twice
drivers/pinctrl/actions/pinctrl-s700.c:1586:10:   also defined here

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/actions/pinctrl-s700.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
index 8b8121e35edb..771d6fd50b45 100644
--- a/drivers/pinctrl/actions/pinctrl-s700.c
+++ b/drivers/pinctrl/actions/pinctrl-s700.c
@@ -1583,7 +1583,6 @@ static const struct owl_pinmux_func s700_functions[] = {
 	[S700_MUX_USB30] = FUNCTION(usb30),
 	[S700_MUX_CLKO_25M] = FUNCTION(clko_25m),
 	[S700_MUX_MIPI_CSI] = FUNCTION(mipi_csi),
-	[S700_MUX_DSI] = FUNCTION(dsi),
 	[S700_MUX_NAND] = FUNCTION(nand),
 	[S700_MUX_SPDIF] = FUNCTION(spdif),
 	[S700_MUX_SIRQ0] = FUNCTION(sirq0),
-- 
2.24.0

