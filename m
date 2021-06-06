Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C87739D112
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jun 2021 21:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhFFTjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Jun 2021 15:39:53 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:12806 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229738AbhFFTjx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Jun 2021 15:39:53 -0400
X-Greylist: delayed 971 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Jun 2021 15:39:53 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 6948d8f8-c6fc-11eb-ba24-005056bd6ce9;
        Sun, 06 Jun 2021 22:21:37 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] pinctrl: microchip-sgpio: Put fwnode in error case during ->probe()
Date:   Sun,  6 Jun 2021 22:19:40 +0300
Message-Id: <20210606191940.29312-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

device_for_each_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
Cc: Lars Povlsen <lars.povlsen@microchip.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index c12fa57ebd12..165cb7a59715 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -845,8 +845,10 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 	i = 0;
 	device_for_each_child_node(dev, fwnode) {
 		ret = microchip_sgpio_register_bank(dev, priv, fwnode, i++);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			return ret;
+		}
 	}
 
 	if (priv->in.gpio.ngpio != priv->out.gpio.ngpio) {
-- 
2.31.1

