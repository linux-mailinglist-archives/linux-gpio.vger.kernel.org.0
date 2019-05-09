Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A8C193EE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 23:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfEIVBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 17:01:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33607 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfEIVBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 17:01:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id y3so1725062plp.0;
        Thu, 09 May 2019 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MSJ4xqUm9vrKGdI4mtkTYOHlvZbHUnqDBUPly/F4wuQ=;
        b=VbXUipzv50tdvMoMxdrUTgpcDcs34w51583wOCbZx5EJFh7Xd77s+q29KSaW/yS7g6
         JNxwi/WnVdjh8pUPCUgV11QhmHxVm80pZh4OVtep3YHZLRd203cfRDrOYRF9BMuAS14J
         /S/EneJHu+RnuRGuDOToccv2aHYe54l5LvbN6f82wjbvn54k2/j8ttYQoS/I4lH6h19e
         38MNG/HClLzYyMxdnOlHOctn9iCYaTi7OqgjmZC72NEVvc+7KKz9DIfDC0GJunFVPh4A
         Kp09m4HYTwdo2j0AZl6EQKr/BAlfL/834LoBlfpc4niflErnXXU/iD8ZowHd/gOVGbf3
         I0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MSJ4xqUm9vrKGdI4mtkTYOHlvZbHUnqDBUPly/F4wuQ=;
        b=stTsKMZyp1Cbe4WEMq8fipojjPaE954kAEqaXX/vyvgt9o+JqrTingDe7dt0Em8v4a
         gCe7yhegJGRAsBb+rN1m22Skwhl3522xjwQg1iKt1vBLmC4q00LdpkS1Czjpp9ajkB2A
         BudmW87x27ebc+1UjzFIkRJZaDdxBHdtywguo5K4Dx8z1L9su93Y7MdYgWFVNziNkBJP
         2Jun4bAAz9ESwFZ7DnYiuAAC64oxFcHSPRva0UZPdKMFJg4J6lxjFyEa/m2URElu7kOZ
         nR6lq2WdZ4SO2LFbm3UF1m0Kewt/aklSXHhktnVfpJ0VBdP9pvZdawBgDS/e+csDpUN0
         tNng==
X-Gm-Message-State: APjAAAVjFVxIZ7auDF4MPLKP5Ut9oyJ9TroKBqhNk1hLEBJVHrRuWNAl
        0VEntTxayEUslupJIGkXlDU=
X-Google-Smtp-Source: APXvYqzeZd/pZ43yTx99GwwYFgQ+ou7UuhYXuksIA98japswJFhif//e+t0t5Uj11uv//Zcv5bgqIA==
X-Received: by 2002:a17:902:e091:: with SMTP id cb17mr8039710plb.222.1557435682568;
        Thu, 09 May 2019 14:01:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id d15sm10989209pfm.186.2019.05.09.14.01.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:01:21 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
Date:   Thu,  9 May 2019 13:59:54 -0700
Message-Id: <20190509205955.27842-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Doug Berger <opendmb@gmail.com>

ARCH_BRCMSTB needs to use the BCM2835 pin controller for chips
like BCM7211 which adopted that pin controller for GPIO. This
commit makes the option menu configurable with default enabled
for ARCH_BRCMSTB and ARCH_BCM2835.

Signed-off-by: Doug Berger <opendmb@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index c8575399d6f7..c57f1d9259d8 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -17,11 +17,15 @@ config PINCTRL_BCM281XX
 	  framework.  GPIO is provided by a separate GPIO driver.
 
 config PINCTRL_BCM2835
-	bool
+	bool "Broadcom BCM2835 GPIO (with PINCONF) driver"
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
+	default ARCH_BCM2835 || ARCH_BRCMSTB
+	help
+	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
-- 
2.17.1

