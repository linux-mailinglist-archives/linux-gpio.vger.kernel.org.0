Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A22B22DA9D
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 01:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGYXXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 19:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGYXXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 19:23:46 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2140C08C5C0;
        Sat, 25 Jul 2020 16:23:46 -0700 (PDT)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 30DBD23E2C;
        Sun, 26 Jul 2020 01:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1595719424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=koZieqMGjt8ICBDJEBEZZ7zoew+ZtLO6K/QV7XfmRiI=;
        b=bAnO5r7NxnBrS5CaSLmY73T2sSff42mk67hdpza/0zgtVg31TpfIvlq1j3hCpFiXjzfKXR
        KPNSG2jjfzfkbZcbD2C4YMgEFh3j6fEWrQEUCMX0Wg8JYDQwhm3WIIKGRV1BU8LqDmhPxK
        TNoohaOHE2jbAoc3NuLFcINFdi0Txe8=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: regmap: fix type clash
Date:   Sun, 26 Jul 2020 01:23:37 +0200
Message-Id: <20200725232337.27581-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO_REGMAP_ADDR_ZERO() cast to unsigned long but the actual config
parameters are unsigned int. We use unsigned int here because that is
the type which is used by the underlying regmap.

Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 include/linux/gpio/regmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 4c1e6b34e824..ad76f3d0a6ba 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -8,7 +8,7 @@ struct gpio_regmap;
 struct irq_domain;
 struct regmap;
 
-#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
+#define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
 /**
-- 
2.20.1

