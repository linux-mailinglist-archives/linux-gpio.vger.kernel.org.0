Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348F5ABC52
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731738AbfIFP0R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 11:26:17 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:51663 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfIFP0R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 11:26:17 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3bjH-1iEohF3GeB-010cLz; Fri, 06 Sep 2019 17:26:10 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Chris Chiu <chiu@endlessm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: intel: hide unused intel_pin_to_gpio
Date:   Fri,  6 Sep 2019 17:26:01 +0200
Message-Id: <20190906152609.1603386-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AiaKs1hcEO1fque6w/E9Anh66wK4Q7pzqtqbUXPbfMjkxkZpJhj
 gRJeh3Irz/R8XadEwis9bcv1tG2oIDpk75Me9ErHiSBXCDBrvL+uMIzQAifh0k3WNRHlDho
 Mk42z6/tjP+shaHiPj6mafMnbgSx4Jv9PoKOtige2XWj584zvNW1TJu55u3kwfiG97MVCB8
 dWdx8ZPbqKo2OK2A1Z+Kg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OrqLmJTU00I=:davTVrMu33y8hmRr6QShJF
 dRv7bHz1iAPK9mbk80pWgEZCvw0ACxLMC5DvefJ6sBzsi6KLVEgaWDhlb6qM2n8uF307AKvOu
 /0l6r9gRgI4+DEbtR/DIwr78B7kdzkmOOv3lRWI0g9tzYo5dJBAps8Itf7gsjkrNlfx1O1v3Q
 hmUmAoHf0OAhpINoOuM+/OMcC0/hz5maJCbBTmdpGjHad7q2O5dBOFvbmCnXcM8X3JTyNDBWH
 T1/hmmaAbgF18z11vrXtDCy2prSlM7ytJQBJTMBmfukvCcskXt48wwuqUFiFlAwLw+OQ7ldEW
 L68ZJzoc8rOPu4LOriXpLQyhKkbVskQbk1OzXOUXWfYU2Y5DHFLPZWU9QWv1UCGGh6Ct67Zqf
 QqpjQcpktlRWl6TnoiFM5yLcoBdNr4PZ0T1DzGsucBteFSiwsBUGpAjG7LLrXrCBlpCKaQ7du
 OwOaYtwa0XMQEF7mAAphByjIb8wm3HlAytX9d0GNfn65EtmwqBN2PwW1NldR5mb4cI1xndd9S
 4A1piJ6M2zraYL5W2PDfzgtSxmfcjfyVbJrvdOkKsD4b77RP2VkyrDQuvUsmJCQ0o+sz47sQa
 8nB33N6SMNQjKCqiE8UJYDp+asIsCx/GKkRu7+Byt+7YxSOQEiDtyH7NuYoh9fONVCWc6Zqq0
 PdlqzQXD8upPfr0Pnz93REhQsIxSRTkw41gYX+du39AcTk3W67l+cfCNbx924e2vzqs2dU9vi
 jUxymNahBkGscLbZE/2rrd6ElByhBnygGRPwkMAMq8+PmyE995QCdbOK+9xDgiAW5I6v+QjaU
 7/29UxgKfLjnGEKJ5ogRGUCgFqPyzkaNvXWb4u7zHpGjKLSy80=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The intel_pin_to_gpio() function is only called by the
PM support functions and causes a warning when those are disabled:

drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]

As we cannot change the PM functions themselves to use __maybe_unused,
add another #ifdef here for consistency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d66fe2b4221b..67f392174090 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -831,29 +831,6 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
 	return -EINVAL;
 }
 
-/**
- * intel_pin_to_gpio() - Translate from pin number to GPIO offset
- * @pctrl: Pinctrl structure
- * @pin: pin number
- *
- * Translate the pin number of pinctrl to GPIO offset
- */
-static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
-{
-	const struct intel_community *community;
-	const struct intel_padgroup *padgrp;
-
-	community = intel_get_community(pctrl, pin);
-	if (!community)
-		return -EINVAL;
-
-	padgrp = intel_community_get_padgroup(community, pin);
-	if (!padgrp)
-		return -EINVAL;
-
-	return pin - padgrp->base + padgrp->gpio_base;
-}
-
 static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -1477,6 +1454,29 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
 
 #ifdef CONFIG_PM_SLEEP
+/**
+ * intel_pin_to_gpio() - Translate from pin number to GPIO offset
+ * @pctrl: Pinctrl structure
+ * @pin: pin number
+ *
+ * Translate the pin number of pinctrl to GPIO offset
+ */
+static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
+{
+	const struct intel_community *community;
+	const struct intel_padgroup *padgrp;
+
+	community = intel_get_community(pctrl, pin);
+	if (!community)
+		return -EINVAL;
+
+	padgrp = intel_community_get_padgroup(community, pin);
+	if (!padgrp)
+		return -EINVAL;
+
+	return pin - padgrp->base + padgrp->gpio_base;
+}
+
 static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	const struct pin_desc *pd = pin_desc_get(pctrl->pctldev, pin);
-- 
2.20.0

