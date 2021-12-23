Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9D347E486
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243807AbhLWO2Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348807AbhLWO2Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:28:25 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDB1C061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:28:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqUN260041rdBcm01qUNvg; Thu, 23 Dec 2021 15:28:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0P4v-006a2E-Se; Thu, 23 Dec 2021 15:28:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0P4v-003rL6-1v; Thu, 23 Dec 2021 15:28:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a7794: Add range checking to .pin_to_pocctrl()
Date:   Thu, 23 Dec 2021 15:28:20 +0100
Message-Id: <d23767ad7152327654192d7191f4b8ae19493966.1640269510.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The .pin_to_pocctrl() implementation for R-Car E2 does not perform a
full range check, unlike on all other SoCs.  Add the range check, so the
checker can validate better the consistency of the pin control tables.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.18.

 drivers/pinctrl/renesas/pfc-r8a7794.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index fbb5b3b68f349ac6..08a4269565e2e54a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -5623,6 +5623,9 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 
 static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
 {
+	if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
+		return -EINVAL;
+
 	*pocctrl = 0xe606006c;
 
 	switch (pin & 0x1f) {
-- 
2.25.1

