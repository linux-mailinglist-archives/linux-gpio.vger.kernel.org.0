Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FE343360C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbhJSMgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 08:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJSMgj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 08:36:39 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C0BC061745
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 05:34:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by laurent.telenet-ops.be with bizsmtp
        id 7oaQ2600C12AN0U01oaQVZ; Tue, 19 Oct 2021 14:34:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcoK0-0069F2-At; Tue, 19 Oct 2021 14:34:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcoJz-00EEHf-QL; Tue, 19 Oct 2021 14:34:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rza1: Fix kerneldoc function names
Date:   Tue, 19 Oct 2021 14:34:22 +0200
Message-Id: <2188ede78110c64b8a3bfbfa794a085dac0e4cd2.1634645735.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

make W=1:

    drivers/pinctrl/renesas/pinctrl-rza1.c:770: warning: expecting prototype for rza1_gpio_disable_free(). Prototype was for rza1_gpio_free() instead
    drivers/pinctrl/renesas/pinctrl-rza1.c:889: warning: expecting prototype for rza1_parse_pmx_function(). Prototype was for rza1_parse_pinmux_node() instead

Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.17.

 drivers/pinctrl/renesas/pinctrl-rza1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 10020fe302b8a09f..3ad0537febe4f6b4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -757,7 +757,7 @@ static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
 }
 
 /**
- * rza1_gpio_disable_free() - reset a pin
+ * rza1_gpio_free() - reset a pin
  *
  * Surprisingly, disable_free a gpio, is equivalent to request it.
  * Reset pin to port mode, with input buffer disabled. This overwrites all
@@ -875,7 +875,7 @@ static int rza1_dt_node_pin_count(struct device_node *np)
 }
 
 /**
- * rza1_parse_pmx_function() - parse a pin mux sub-node
+ * rza1_parse_pinmux_node() - parse a pin mux sub-node
  *
  * @rza1_pctl: RZ/A1 pin controller device
  * @np: of pmx sub-node
-- 
2.25.1

