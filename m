Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6371B57B6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgDWJG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 05:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDWJGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:06:25 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Apr 2020 02:06:25 PDT
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560BEC03C1AF
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 02:06:25 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
        by andre.telenet-ops.be with bizsmtp
        id W91L2200k1RvcFS0191LLq; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0006kJ-Cn; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRXjU-0002vg-BT; Thu, 23 Apr 2020 11:01:20 +0200
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
Subject: [PATCH QEMU v2 5/5] hw/arm/virt: Add dynamic PL061 GPIO support
Date:   Thu, 23 Apr 2020 11:01:18 +0200
Message-Id: <20200423090118.11199-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for dynamically instantiating PL061 GPIO controller
instances in ARM virt.  Device tree nodes are created dynamically.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 hw/arm/sysbus-fdt.c | 18 ++++++++++++++++++
 hw/arm/virt.c       |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 6b6906f4cfc36198..493583218d176d0a 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -32,6 +32,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/tpm.h"
 #include "hw/platform-bus.h"
+#include "hw/gpio/pl061.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
@@ -468,6 +469,22 @@ static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+/*
+ * add_pl061_node: Create a DT node for a PL061 GPIO controller
+ */
+static int add_pl061_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    PlatformBusDevice *pbus = data->pbus;
+    void *fdt = data->fdt;
+
+    pl061_create_fdt(fdt, data->pbus_node_name, 1,
+                     platform_bus_get_mmio_addr(pbus, sbdev, 0), 0x1000,
+                     platform_bus_get_irqn(pbus, sbdev, 0) + data->irq_start,
+                     qemu_fdt_get_phandle(fdt, "/apb-pclk"));
+    return 0;
+}
+
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
     return 0;
@@ -489,6 +506,7 @@ static const BindingEntry bindings[] = {
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
+    TYPE_BINDING(TYPE_PL061, add_pl061_node),
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c88c8850fbe00bdb..191594db09422d54 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2178,6 +2178,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PL061);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.17.1

