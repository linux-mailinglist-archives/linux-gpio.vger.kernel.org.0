Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5A61B57B9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDWJG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgDWJGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:06:25 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E64C08E859
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 02:06:25 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
        by andre.telenet-ops.be with bizsmtp
        id W91L2200i1RvcFS0191LLp; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0006kB-Al; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0002vU-8q; Thu, 23 Apr 2020 11:01:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <graf@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH QEMU v2 1/5] ARM: PL061: Move TYPE_PL061 to hw/gpio/pl061.h
Date:   Thu, 23 Apr 2020 11:01:14 +0200
Message-Id: <20200423090118.11199-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the definition of TYPE_PL061 to a new header file, so it can be
used outside the driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 MAINTAINERS             |  1 +
 hw/gpio/pl061.c         |  2 +-
 include/hw/gpio/pl061.h | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/gpio/pl061.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cbc1fac2bfcec86..e760f65270d29d5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -538,6 +538,7 @@ F: hw/dma/pl080.c
 F: include/hw/dma/pl080.h
 F: hw/dma/pl330.c
 F: hw/gpio/pl061.c
+F: include/hw/gpio/pl061.h
 F: hw/input/pl050.c
 F: hw/intc/pl190.c
 F: hw/sd/pl181.c
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 2a828260bdb0b946..e776c09e474216ef 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/gpio/pl061.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
@@ -33,7 +34,6 @@ static const uint8_t pl061_id[12] =
 static const uint8_t pl061_id_luminary[12] =
   { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
-#define TYPE_PL061 "pl061"
 #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
 
 typedef struct PL061State {
diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
new file mode 100644
index 0000000000000000..78cc40c52679dc4e
--- /dev/null
+++ b/include/hw/gpio/pl061.h
@@ -0,0 +1,16 @@
+/*
+ * Arm PrimeCell PL061 General Purpose IO with additional Luminary Micro
+ * Stellaris bits.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef PL061_GPIO_H
+#define PL061_GPIO_H
+
+#define TYPE_PL061 "pl061"
+
+#endif /* PL061_GPIO_H */
-- 
2.17.1

