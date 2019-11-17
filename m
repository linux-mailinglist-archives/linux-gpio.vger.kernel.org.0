Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5EBAFFBB2
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2019 22:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfKQVHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Nov 2019 16:07:36 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:31538 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfKQVHg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Nov 2019 16:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574024854;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=wbKXX1nOfYoJS3RH2L8z7sjOaFVKKHWctbqjU5FvcYw=;
        b=pjCzcYM3ZlTLx8Mijl7Ox8BJ31Y4oTMvOmGF+55fuCMBLCe7DHXezkVDDLQgah++Qu
        bEbKvDCnDnfwFyTD8zuOrAQzezh+Hc++muG2qKWLq0e4DHqIIVmk6plVH0itCOvSXvWu
        LYOgrGfzGJHzFL8z+1VHWrZNeuoz8lp1VHTU9hUu9ERB6xnZZoIn2YQcRICdOmBphH50
        D5NZ20O0fVkrXoz1Kh+/Fh8tLe1g/7RLIWrpvN29Wx+sX7tFj1m7HMYYc5rwP/BvkZVV
        sz182AqJhZBu9oueSFCynZi+Iu81zcAjA4tYJWO4Nhui5vBqq/0hgwVnRlRyC1DRzDqj
        zgew==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMvvtBRRPA=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.29.0 AUTH)
        with ESMTPSA id e07688vAHKtXb36
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sun, 17 Nov 2019 21:55:33 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] pinctrl: nomadik: db8500: Add mc0_a_2 pin group without direction control
Date:   Sun, 17 Nov 2019 21:54:39 +0100
Message-Id: <20191117205439.239211-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices do not make use of the CMD0/DAT0/DAT2 direction control
pins of the MMC/SD card 0 interface. In this case we should leave
those pins unconfigured.

A similar case already exists for "mc1_a_1" vs "mc1_a_2"
when the MC1_FBCLK pin is not used.

Add a new "mc0_a_2" pin group which is equal to "mc0_a_1" except
with the MC0_CMDDIR, MC0_DAT0DIR and MC0_DAT2DIR pins removed.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index 726c0b5501fa..b9246e0b4fe2 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -391,6 +391,15 @@ static const unsigned mc0_a_1_pins[] = { DB8500_PIN_AC2, /* MC0_CMDDIR */
 					 DB8500_PIN_AA2, /* MC0_DAT2 */
 					 DB8500_PIN_AA1  /* MC0_DAT3 */
 };
+/* MMC/SD card 0 interface without CMD/DAT0/DAT2 direction control */
+static const unsigned mc0_a_2_pins[] = { DB8500_PIN_AA3, /* MC0_FBCLK */
+					 DB8500_PIN_AA4, /* MC0_CLK */
+					 DB8500_PIN_AB2, /* MC0_CMD */
+					 DB8500_PIN_Y4,  /* MC0_DAT0 */
+					 DB8500_PIN_Y2,  /* MC0_DAT1 */
+					 DB8500_PIN_AA2, /* MC0_DAT2 */
+					 DB8500_PIN_AA1  /* MC0_DAT3 */
+};
 /* Often only 4 bits are used, then these are not needed (only used for MMC) */
 static const unsigned mc0_dat47_a_1_pins[] = { DB8500_PIN_W2, /* MC0_DAT4 */
 					       DB8500_PIN_W3, /* MC0_DAT5 */
@@ -670,6 +679,7 @@ static const struct nmk_pingroup nmk_db8500_groups[] = {
 	DB8500_PIN_GROUP(msp0tfstck_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(msp0rfsrck_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc0_a_1, NMK_GPIO_ALT_A),
+	DB8500_PIN_GROUP(mc0_a_2, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc0_dat47_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(mc0dat31dir_a_1, NMK_GPIO_ALT_A),
 	DB8500_PIN_GROUP(msp1txrx_a_1, NMK_GPIO_ALT_A),
@@ -828,7 +838,7 @@ DB8500_FUNC_GROUPS(ipi2c, "ipi2c_a_1", "ipi2c_a_2");
  */
 DB8500_FUNC_GROUPS(msp0, "msp0txrx_a_1", "msp0tfstck_a_1", "msp0rfstck_a_1",
 		   "msp0txrx_b_1", "msp0sck_b_1");
-DB8500_FUNC_GROUPS(mc0, "mc0_a_1", "mc0_dat47_a_1", "mc0dat31dir_a_1");
+DB8500_FUNC_GROUPS(mc0, "mc0_a_1", "mc0_a_2", "mc0_dat47_a_1", "mc0dat31dir_a_1");
 /* MSP0 can swap RX/TX like MSP0 but has no SCK pin available */
 DB8500_FUNC_GROUPS(msp1, "msp1txrx_a_1", "msp1_a_1", "msp1txrx_b_1");
 DB8500_FUNC_GROUPS(lcdb, "lcdb_a_1");
-- 
2.23.0

