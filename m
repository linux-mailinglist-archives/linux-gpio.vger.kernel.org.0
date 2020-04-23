Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1051A1B57BA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgDWJG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgDWJGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:06:25 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7021FC08E934
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 02:06:25 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
        by xavier.telenet-ops.be with bizsmtp
        id W91L2200R1RvcFS0191LFF; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0006kH-Bt; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0002vd-Aq; Thu, 23 Apr 2020 11:01:20 +0200
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
Subject: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
Date:   Thu, 23 Apr 2020 11:01:17 +0200
Message-Id: <20200423090118.11199-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the PL061 GPIO controller user-creatable, and allow the user to tie
a newly created instance to a gpiochip on the host.

To create a new GPIO controller, the QEMU command line must be augmented
with:

    -device pl061,host=<gpiochip>

with <gpiochip> the name or label of the gpiochip on the host.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 hw/gpio/pl061.c | 35 +++++++++++++++++++++++++++++++++++
 qemu-options.hx |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 74ba733a8a5e8ca5..98204f9a586ae8c8 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -12,11 +12,14 @@
 #include "hw/arm/fdt.h"
 #include "hw/gpio/pl061.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/gpiodev.h"
 
 //#define DEBUG_PL061 1
 
@@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
 typedef struct PL061State {
     SysBusDevice parent_obj;
 
+#ifdef CONFIG_GPIODEV
+    char *host;
+#endif
     MemoryRegion iomem;
     uint32_t locked;
     uint32_t data;
@@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
     qdev_init_gpio_out(dev, s->out, 8);
 }
 
+#ifdef CONFIG_GPIODEV
+static Property pl061_properties[] = {
+    DEFINE_PROP_STRING("host", PL061State, host),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pl061_realize(DeviceState *dev, Error **errp)
+{
+    PL061State *s = PL061(dev);
+
+    if (!dev->opts) {
+        /* Not created by user */
+        return;
+    }
+
+    if (!s->host) {
+        error_setg(errp, "'host' property is required");
+        return;
+    }
+
+    qemu_gpiodev_add(dev, s->host, 8, errp);
+}
+#endif /* CONFIG_GPIODEV */
+
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+#ifdef CONFIG_GPIODEV
+    device_class_set_props(dc, pl061_properties);
+    dc->realize = pl061_realize;
+    dc->user_creatable = true;
+#endif
     dc->vmsd = &vmstate_pl061;
     dc->reset = &pl061_reset;
 }
diff --git a/qemu-options.hx b/qemu-options.hx
index 292d4e7c0cef6097..182de7fb63923b38 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -875,6 +875,15 @@ SRST
 ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
     Like the KCS interface, but defines a BT interface. The default port
     is 0xe4 and the default interrupt is 5.
+
+#ifdef CONFIG_GPIODEV
+``-device pl061,host=gpiochip``
+    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
+    controller on the host.
+
+    ``host=gpiochip``
+        The name or label of the GPIO controller on the host.
+#endif
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.17.1

