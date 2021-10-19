Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD19434138
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Oct 2021 00:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhJSWQo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 18:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJSWQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 18:16:43 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AD1C06161C;
        Tue, 19 Oct 2021 15:14:30 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id j190so13931897pgd.0;
        Tue, 19 Oct 2021 15:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=db7rEPRLzmzI5PinOMajtHWjLZ84asKHAw3+UbYQqrI=;
        b=fqe3bvOaBxbVhzaKLdztWbhm4VnbMY66SAxgni9R3Y1MUCCCTIAj6uKVT4rIyP+yKu
         n8TZY8ZoSh6iRlJaxuVevEFsYZpzUUh9WM8euGEv9SVKdmq3YI+mi9uIYpmTbwCHTlWa
         yiFk0ohpB4cnFOrk4sdiF0IfR4TyMEXA+5jbE/FVHR/A4zxLVTStxNGNv0nw5dnFYepx
         MKeDEaA/IVWkFquOHZZW/BgmeAiq2VDwjhDqwAHxoUHLE2FF4Knp11NrkxHrEMiE2Gdm
         +P4k8Y8+sKfriEd+7YxndGjBobUU1WWrn6wGP4g1wr8apgow3/2kJYbBpv43NrpPSBkG
         7tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=db7rEPRLzmzI5PinOMajtHWjLZ84asKHAw3+UbYQqrI=;
        b=mh5KOJM5KZAyV0ekMcxKzgk0nybb8WWStVUf3qbtkCFO1kcm0s0riMF3+zaNZGl+gK
         Yvzh6YuyKh+HR3tivJDxnGmF1KvIwvN2bH8D8UduKRpIe+lTD+ZE2598EY1hMSTjPVt/
         7nL+QjmiKdK0VXQdPlwEitlB/8jM5nxZ9tdBXDCBOJEp5x8jdXW03uaUVAf2HKc0Iyqs
         QC9Wm3lRAPTTrrftEb81fpupOncQ8VDyd5KCPTPO9V1w23avXyKlvMupWEP0Fmtu1G6K
         Tl9ZhNtrAIpeJboF9IY8k1AuAQR7fmdqwoqfl3DXn61QJX432Mfofzuq81DjuBTIlPz0
         R7Cg==
X-Gm-Message-State: AOAM532eUMAo1xH8JCCUPv6ka5AEmvLQis2jknl0+0B0hYoSUu1qPNSt
        cor8nM8ZhGaRkP9IkaaTez5tgIElJJM=
X-Google-Smtp-Source: ABdhPJzOTticDhcbLAuvC/vCcVPjf0Xza41ZAhCLev8x7LTgw9X3IyBbsaQ4IHukxjc9Vos099ViHQ==
X-Received: by 2002:a63:84c3:: with SMTP id k186mr31070638pgd.462.1634681669452;
        Tue, 19 Oct 2021 15:14:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y13sm205587pgc.46.2021.10.19.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 15:14:28 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Jason Wang <wangborong@cdjrlc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH] pinctrl: bcm2835: Allow building driver as a module
Date:   Tue, 19 Oct 2021 15:11:21 -0700
Message-Id: <20211019221127.1953001-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the pinctrl-bcm2835 driver to support being built as as a module
by converting it to a module_platform_driver() with the appropriate
module license, authors and description.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig           | 2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index c9c5efc92731..8fc1feedd861 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -18,7 +18,7 @@ config PINCTRL_BCM281XX
 	  framework.  GPIO is provided by a separate GPIO driver.
 
 config PINCTRL_BCM2835
-	bool "Broadcom BCM2835 GPIO (with PINCONF) driver"
+	tristate "Broadcom BCM2835 GPIO (with PINCONF) driver"
 	depends on OF && (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
 	select PINMUX
 	select PINCONF
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 6e6fefeb21ea..2abcc6ce4eba 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -20,6 +20,7 @@
 #include <linux/irqdesc.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -1332,4 +1333,10 @@ static struct platform_driver bcm2835_pinctrl_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver(bcm2835_pinctrl_driver);
+module_platform_driver(bcm2835_pinctrl_driver);
+
+MODULE_AUTHOR("Chris Boot");
+MODULE_AUTHOR("Simon Arlott");
+MODULE_AUTHOR("Stephen Warren");
+MODULE_DESCRIPTION("Broadcom BCM2835/2711 pinctrl and GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

