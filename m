Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA09F22C650
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 15:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgGXNZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 09:25:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:34872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXNZL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Jul 2020 09:25:11 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB9AA2065F;
        Fri, 24 Jul 2020 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595597111;
        bh=pp/ojK1FzfEWYVM4WBKudjbEzP9+0SYYLSoiNjE9YLU=;
        h=From:To:Cc:Subject:Date:From;
        b=w0c8S6XQ+gzkzI5LxJL+XfMrR2B7El+RZsYxvDnwnzjYv73NtN/9hjndd4B8c/C+s
         uA97p96af+HrUn/IfyHzz6aoHGb20RrTkI6J064UIp5zTTa9KoM3kW1mLISRMsaXIp
         e32E/jNou3sLIkTCyJ2e/Kfp2Fr3xpZxJ526gUy8=
Received: by pali.im (Postfix)
        id 2AA4788C; Fri, 24 Jul 2020 15:25:09 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: armada-37xx: Add comment for pcie1_reset pin group
Date:   Fri, 24 Jul 2020 15:24:57 +0200
Message-Id: <20200724132457.7094-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Group name 'pcie1' is misleading as it controls only PCIe reset pin. Like
other PCIe groups it should have been called 'pcie1_reset'. But due to
backward compatibility it is not possible to change existing group name.
So just add comment describing this PCIe reset functionality.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 2bbc69b4dc99..d5b6c0a1c54a 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -316,7 +316,7 @@
 				};
 
 				pcie_reset_pins: pcie-reset-pins {
-					groups = "pcie1";
+					groups = "pcie1"; /* this actually controls "pcie1_reset" */
 					function = "gpio";
 				};
 
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 5f125bd6279d..8fd8b2af9216 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -196,7 +196,7 @@ static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
 	PIN_GRP_GPIO("sdio_sb", 24, 6, BIT(2), "sdio"),
 	PIN_GRP_GPIO("rgmii", 6, 12, BIT(3), "mii"),
 	PIN_GRP_GPIO("smi", 18, 2, BIT(4), "smi"),
-	PIN_GRP_GPIO("pcie1", 3, 1, BIT(5), "pcie"),
+	PIN_GRP_GPIO("pcie1", 3, 1, BIT(5), "pcie"), /* this actually controls "pcie1_reset" */
 	PIN_GRP_GPIO("pcie1_clkreq", 4, 1, BIT(9), "pcie"),
 	PIN_GRP_GPIO("pcie1_wakeup", 5, 1, BIT(10), "pcie"),
 	PIN_GRP_GPIO("ptp", 20, 3, BIT(11) | BIT(12) | BIT(13), "ptp"),
-- 
2.20.1

