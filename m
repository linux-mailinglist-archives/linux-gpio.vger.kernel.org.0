Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF04441515
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 09:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhKAIOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 04:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhKAIOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 04:14:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A46C061714;
        Mon,  1 Nov 2021 01:11:30 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so10804303pjd.1;
        Mon, 01 Nov 2021 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IK0K3VL74t8FFpWI/gw3iKrkg2AsupzSK/wsbh/HAoM=;
        b=eimIEzZlO5fXTaNBunIbeQHU9+jzIwodrvTg8v9csgSpFgOlCnJgAu2VZGEcnmgObh
         SfGObfHTiWRiB+v87Y3Jap8S6QsWTzhwquD8I8tYavNibhIXiC0QKcITuksfxwS2m+Zq
         WYI7WiFOgb0HWw09N9Z5iHfjwTITZwjd9wKy2p4CZY/v+X41pxZ1seyrUFsl2pabZrX1
         VqtMzezr+CxKMS9GZlyhXx93IEFc7WAseBDzlOczfJ5MEi9rwPchd5NTNfQQx6gnaV99
         b2cW0+Ez5qNf+YPL0JHaWSbQggpQD8FUbcLoQuGL3f+caOulEEF6S439+UruLPEMQeh0
         8PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IK0K3VL74t8FFpWI/gw3iKrkg2AsupzSK/wsbh/HAoM=;
        b=s6wVOOm+pa4iMHC8OEn0LEzvGTyn75wp3uL9a16VVbQNQZ6+ki8qKT3ifq8ep0zrV6
         iiie26DfkUG2MuDmIVpP71/TS/4JUpHzNUmZ6duc8OsnBHZP//kh7zTCdGjRPgpBJn6Y
         OVhZQbif1q9xPVdcztdmcx1Ki86euCfZ3jTyYycp1e1wKbJuBOdEqsjJ8YYQV2hR8FYH
         E9PvYUV/50E4VeSRRzjIO4xQhu6kCtlK/rFghkj92uvF13kfGE3VeP2yJwuMKjx5n4HK
         G+m1QZQQnS3kGoL3xMaLKrRkgYtCYT1VVTyY7mH0Ol2GpkrTcv6DHI1nCFDSh1Lx1NPP
         ftIA==
X-Gm-Message-State: AOAM530C2K5v0gU/ZUBtnjRqIkv+UMClmQHDtUMcjsLQJJkMOXQxK5kO
        WVOtwxTuc4XXuGP3vF4mMNM3heH/9fqTqA==
X-Google-Smtp-Source: ABdhPJybGFmXGT/CG30N23t/s02u0DS7l9DO95O5wRxm9R4o3MxnhJToyJE7JyPTFAzDCVzUXri/hw==
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr28014189pjb.144.1635754289295;
        Mon, 01 Nov 2021 01:11:29 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id d2sm15732606pfj.42.2021.11.01.01.11.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 01:11:28 -0700 (PDT)
From:   Wells Lu <wellslutw@gmail.com>
X-Google-Original-From: Wells Lu <wells.lu@sunplus.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: [PATCH v2 1/3] pinctrl: Add driver for Sunplus SP7021
Date:   Mon,  1 Nov 2021 16:11:15 +0800
Message-Id: <1635754277-32429-2-git-send-email-wells.lu@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add driver for Sunplus SP7021.

Signed-off-by: Wells Lu <wells.lu@sunplus.com>
---
Changes in v2:
 - Addressed all comments from Mr. Randy Dunlap.
 - Modified vendor name in MAINTAINERS file.

 MAINTAINERS                                  |   8 +
 drivers/pinctrl/Kconfig                      |   1 +
 drivers/pinctrl/Makefile                     |   1 +
 drivers/pinctrl/sunplus/Kconfig              |  33 ++
 drivers/pinctrl/sunplus/Makefile             |  11 +
 drivers/pinctrl/sunplus/gpio_inf_sp7021.c    |  48 +++
 drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c | 501 ++++++++++++++++++++++
 drivers/pinctrl/sunplus/sppctl.c             | 359 ++++++++++++++++
 drivers/pinctrl/sunplus/sppctl.h             | 181 ++++++++
 drivers/pinctrl/sunplus/sppctl_gpio.c        | 136 ++++++
 drivers/pinctrl/sunplus/sppctl_gpio.h        |  73 ++++
 drivers/pinctrl/sunplus/sppctl_gpio_ops.c    | 288 +++++++++++++
 drivers/pinctrl/sunplus/sppctl_gpio_ops.h    |  75 ++++
 drivers/pinctrl/sunplus/sppctl_pinctrl.c     | 593 +++++++++++++++++++++++++++
 drivers/pinctrl/sunplus/sppctl_pinctrl.h     |  33 ++
 drivers/pinctrl/sunplus/sppctl_sysfs.c       | 385 +++++++++++++++++
 drivers/pinctrl/sunplus/sppctl_sysfs.h       |  33 ++
 17 files changed, 2759 insertions(+)
 create mode 100644 drivers/pinctrl/sunplus/Kconfig
 create mode 100644 drivers/pinctrl/sunplus/Makefile
 create mode 100644 drivers/pinctrl/sunplus/gpio_inf_sp7021.c
 create mode 100644 drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio_ops.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio_ops.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_pinctrl.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_pinctrl.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_sysfs.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_sysfs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f26920f..fd82c77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14866,6 +14866,14 @@ S:	Maintained
 W:	http://www.st.com/spear
 F:	drivers/pinctrl/spear/
 
+PIN CONTROLLER - SUNPLUS / TIBBO
+M:	Dvorkin Dmitry <dvorkin@tibbo.com>
+M:	Wells Lu <wells.lu@sunplus.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
+F:	drivers/pinctrl/sunplus/
+
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
 S:	Orphan
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3192110..5fe8e5d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -452,6 +452,7 @@ source "drivers/pinctrl/mediatek/Kconfig"
 source "drivers/pinctrl/meson/Kconfig"
 source "drivers/pinctrl/cirrus/Kconfig"
 source "drivers/pinctrl/visconti/Kconfig"
+source "drivers/pinctrl/sunplus/Kconfig"
 
 config PINCTRL_XWAY
 	bool
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 200073b..3721877 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
+obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
new file mode 100644
index 0000000..502a8fa
--- /dev/null
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Sunplus Pin control driver configuration
+#
+
+config PINCTRL_SPPCTL
+	bool "Sunplus SP7021 pinmux and GPIO driver"
+	depends on SOC_SP7021
+	depends on OF && HAS_IOMEM
+	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select PINCONF
+	select GENERIC_PINCONF
+	select OF_GPIO
+	select GPIOLIB
+	select GPIO_SYSFS
+	select GENERIC_IRQ_CHIP
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Sunplus SP7021 pinmux controller.
+	  The driver is selected automatically by platform.
+	  This driver requires the pinctrl framework.
+	  GPIO is provided by the same driver.
+
+config PINCTRL_SPPCTL_DEBUG
+	bool "Sunplus pinmux specific debug"
+	depends on SOC_SP7021 && DEBUG_PINCTRL
+	help
+	  Say Y if you need to debug Sunplus pinmux driver in-depth.
+	  Pin control driver will output more messages if you enable
+	  this item. This function is dependent on DEBUG_PINCTRL. It
+	  should be enabled first.
diff --git a/drivers/pinctrl/sunplus/Makefile b/drivers/pinctrl/sunplus/Makefile
new file mode 100644
index 0000000..a945653
--- /dev/null
+++ b/drivers/pinctrl/sunplus/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Sunplus Pin control drivers.
+#
+obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_pinctrl.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_sysfs.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_gpio_ops.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_gpio.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += pinctrl_inf_sp7021.o
+obj-$(CONFIG_PINCTRL_SPPCTL) += gpio_inf_sp7021.o
diff --git a/drivers/pinctrl/sunplus/gpio_inf_sp7021.c b/drivers/pinctrl/sunplus/gpio_inf_sp7021.c
new file mode 100644
index 0000000..31f77ce
--- /dev/null
+++ b/drivers/pinctrl/sunplus/gpio_inf_sp7021.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO Driver for Sunplus/Tibbo SP7021 controller
+ * Copyright (C) 2020 Sunplus Tech./Tibbo Tech.
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "sppctl_gpio.h"
+
+const char * const sppctlgpio_list_s[] = {
+	D_PIS(0, 0),  D_PIS(0, 1),  D_PIS(0, 2),  D_PIS(0, 3),
+	D_PIS(0, 4),  D_PIS(0, 5),  D_PIS(0, 6),  D_PIS(0, 7),
+	D_PIS(1, 0),  D_PIS(1, 1),  D_PIS(1, 2),  D_PIS(1, 3),
+	D_PIS(1, 4),  D_PIS(1, 5),  D_PIS(1, 6),  D_PIS(1, 7),
+	D_PIS(2, 0),  D_PIS(2, 1),  D_PIS(2, 2),  D_PIS(2, 3),
+	D_PIS(2, 4),  D_PIS(2, 5),  D_PIS(2, 6),  D_PIS(2, 7),
+	D_PIS(3, 0),  D_PIS(3, 1),  D_PIS(3, 2),  D_PIS(3, 3),
+	D_PIS(3, 4),  D_PIS(3, 5),  D_PIS(3, 6),  D_PIS(3, 7),
+	D_PIS(4, 0),  D_PIS(4, 1),  D_PIS(4, 2),  D_PIS(4, 3),
+	D_PIS(4, 4),  D_PIS(4, 5),  D_PIS(4, 6),  D_PIS(4, 7),
+	D_PIS(5, 0),  D_PIS(5, 1),  D_PIS(5, 2),  D_PIS(5, 3),
+	D_PIS(5, 4),  D_PIS(5, 5),  D_PIS(5, 6),  D_PIS(5, 7),
+	D_PIS(6, 0),  D_PIS(6, 1),  D_PIS(6, 2),  D_PIS(6, 3),
+	D_PIS(6, 4),  D_PIS(6, 5),  D_PIS(6, 6),  D_PIS(6, 7),
+	D_PIS(7, 0),  D_PIS(7, 1),  D_PIS(7, 2),  D_PIS(7, 3),
+	D_PIS(7, 4),  D_PIS(7, 5),  D_PIS(7, 6),  D_PIS(7, 7),
+	D_PIS(8, 0),  D_PIS(8, 1),  D_PIS(8, 2),  D_PIS(8, 3),
+	D_PIS(8, 4),  D_PIS(8, 5),  D_PIS(8, 6),  D_PIS(8, 7),
+	D_PIS(9, 0),  D_PIS(9, 1),  D_PIS(9, 2),  D_PIS(9, 3),
+	D_PIS(9, 4),  D_PIS(9, 5),  D_PIS(9, 6),  D_PIS(9, 7),
+	D_PIS(10, 0), D_PIS(10, 1), D_PIS(10, 2), D_PIS(10, 3),
+	D_PIS(10, 4), D_PIS(10, 5), D_PIS(10, 6), D_PIS(10, 7),
+	D_PIS(11, 0), D_PIS(11, 1), D_PIS(11, 2), D_PIS(11, 3),
+	D_PIS(11, 4), D_PIS(11, 5), D_PIS(11, 6), D_PIS(11, 7),
+	D_PIS(12, 0), D_PIS(12, 1), D_PIS(12, 2)
+};
+
+const size_t GPIS_listSZ = sizeof(sppctlgpio_list_s)/sizeof(*(sppctlgpio_list_s));
diff --git a/drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c b/drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c
new file mode 100644
index 0000000..1435fba
--- /dev/null
+++ b/drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "sppctl.h"
+
+// function: GPIO. list of groups (pins)
+const unsigned int sppctlpins_G[] = {
+	D(0, 0), D(0, 1), D(0, 2), D(0, 3), D(0, 4), D(0, 5), D(0, 6), D(0, 7),
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5), D(1, 6), D(1, 7),
+	D(2, 0), D(2, 1), D(2, 2), D(2, 3), D(2, 4), D(2, 5), D(2, 6), D(2, 7),
+	D(3, 0), D(3, 1), D(3, 2), D(3, 3), D(3, 4), D(3, 5), D(3, 6), D(3, 7),
+	D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4), D(4, 5), D(4, 6), D(4, 7),
+	D(5, 0), D(5, 1), D(5, 2), D(5, 3), D(5, 4), D(5, 5), D(5, 6), D(5, 7),
+	D(6, 0), D(6, 1), D(6, 2), D(6, 3), D(6, 4), D(6, 5), D(6, 6), D(6, 7),
+	D(7, 0), D(7, 1), D(7, 2), D(7, 3), D(7, 4), D(7, 5), D(7, 6), D(7, 7),
+	D(8, 0), D(8, 1), D(8, 2), D(8, 3), D(8, 4), D(8, 5), D(8, 6), D(8, 7),
+	D(9, 0), D(9, 1), D(9, 2), D(9, 3), D(9, 4), D(9, 5), D(9, 6), D(9, 7),
+	D(10, 0), D(10, 1), D(10, 2), D(10, 3), D(10, 4), D(10, 5), D(10, 6), D(10, 7),
+	D(11, 0), D(11, 1), D(11, 2), D(11, 3), D(11, 4), D(11, 5), D(11, 6), D(11, 7),
+	D(12, 0), D(12, 1), D(12, 2)
+};
+
+#define P(x, y) PINCTRL_PIN(D(x, y), D_PIS(x, y))
+
+const struct pinctrl_pin_desc sppctlpins_all[] = {
+	// gpio and iop only
+	P(0, 0), P(0, 1), P(0, 2), P(0, 3), P(0, 4), P(0, 5), P(0, 6), P(0, 7),
+	// gpio, iop, muxable
+	P(1, 0), P(1, 1), P(1, 2), P(1, 3), P(1, 4), P(1, 5), P(1, 6), P(1, 7),
+	P(2, 0), P(2, 1), P(2, 2), P(2, 3), P(2, 4), P(2, 5), P(2, 6), P(2, 7),
+	P(3, 0), P(3, 1), P(3, 2), P(3, 3), P(3, 4), P(3, 5), P(3, 6), P(3, 7),
+	P(4, 0), P(4, 1), P(4, 2), P(4, 3), P(4, 4), P(4, 5), P(4, 6), P(4, 7),
+	P(5, 0), P(5, 1), P(5, 2), P(5, 3), P(5, 4), P(5, 5), P(5, 6), P(5, 7),
+	P(6, 0), P(6, 1), P(6, 2), P(6, 3), P(6, 4), P(6, 5), P(6, 6), P(6, 7),
+	P(7, 0), P(7, 1), P(7, 2), P(7, 3), P(7, 4), P(7, 5), P(7, 6), P(7, 7),
+	P(8, 0), P(8, 1), P(8, 2), P(8, 3), P(8, 4), P(8, 5), P(8, 6), P(8, 7),
+	// gpio (not wired) and iop only
+	P(9, 0),  P(9, 1),  P(9, 2),  P(9, 3),  P(9, 4),  P(9, 5),  P(9, 6),  P(9, 7),
+	P(10, 0), P(10, 1), P(10, 2), P(10, 3), P(10, 4), P(10, 5), P(10, 6), P(10, 7),
+	P(11, 0), P(11, 1), P(11, 2), P(11, 3), P(11, 4), P(11, 5), P(11, 6), P(11, 7),
+	P(12, 0), P(12, 1), P(12, 2)
+};
+const size_t sppctlpins_allSZ = ARRAY_SIZE(sppctlpins_all);
+
+// pmux groups: some pins are muxable. group = pin
+const char * const sppctlpmux_list_s[] = {
+	D_PIS(0, 0),
+	D_PIS(1, 0), D_PIS(1, 1), D_PIS(1, 2), D_PIS(1, 3),
+	D_PIS(1, 4), D_PIS(1, 5), D_PIS(1, 6), D_PIS(1, 7),
+	D_PIS(2, 0), D_PIS(2, 1), D_PIS(2, 2), D_PIS(2, 3),
+	D_PIS(2, 4), D_PIS(2, 5), D_PIS(2, 6), D_PIS(2, 7),
+	D_PIS(3, 0), D_PIS(3, 1), D_PIS(3, 2), D_PIS(3, 3),
+	D_PIS(3, 4), D_PIS(3, 5), D_PIS(3, 6), D_PIS(3, 7),
+	D_PIS(4, 0), D_PIS(4, 1), D_PIS(4, 2), D_PIS(4, 3),
+	D_PIS(4, 4), D_PIS(4, 5), D_PIS(4, 6), D_PIS(4, 7),
+	D_PIS(5, 0), D_PIS(5, 1), D_PIS(5, 2), D_PIS(5, 3),
+	D_PIS(5, 4), D_PIS(5, 5), D_PIS(5, 6), D_PIS(5, 7),
+	D_PIS(6, 0), D_PIS(6, 1), D_PIS(6, 2), D_PIS(6, 3),
+	D_PIS(6, 4), D_PIS(6, 5), D_PIS(6, 6), D_PIS(6, 7),
+	D_PIS(7, 0), D_PIS(7, 1), D_PIS(7, 2), D_PIS(7, 3),
+	D_PIS(7, 4), D_PIS(7, 5), D_PIS(7, 6), D_PIS(7, 7),
+	D_PIS(8, 0), D_PIS(8, 1), D_PIS(8, 2), D_PIS(8, 3),
+	D_PIS(8, 4), D_PIS(8, 5), D_PIS(8, 6), D_PIS(8, 7)
+};
+// gpio: is defined in gpio_inf_sp7021.c
+const size_t PMUX_listSZ = sizeof(sppctlpmux_list_s)/sizeof(*(sppctlpmux_list_s));
+
+static const unsigned int pins_spif1[] = { D(10, 3), D(10, 4), D(10, 6), D(10, 7) };
+static const unsigned int pins_spif2[] = { D(9, 4), D(9, 6), D(9, 7), D(10, 1) };
+static const struct sppctlgrp_t sp7021grps_spif[] = {
+	EGRP("SPI_FLASH1", 1, pins_spif1),
+	EGRP("SPI_FLASH2", 2, pins_spif2)
+};
+
+static const unsigned int pins_spi41[] = { D(10, 2), D(10, 5) };
+static const unsigned int pins_spi42[] = { D(9, 5), D(9, 8) };
+static const struct sppctlgrp_t sp7021grps_spi4[] = {
+	EGRP("SPI_FLASH_4BIT1", 1, pins_spi41),
+	EGRP("SPI_FLASH_4BIT2", 2, pins_spi42)
+};
+
+static const unsigned int pins_snan[] = {
+	D(9, 4), D(9, 5), D(9, 6), D(9, 7), D(10, 0), D(10, 1)
+};
+static const struct sppctlgrp_t sp7021grps_snan[] = {
+	EGRP("SPI_NAND", 1, pins_snan)
+};
+
+static const unsigned int pins_emmc[] = {
+	D(9, 0), D(9, 1), D(9, 2), D(9, 3), D(9, 4), D(9, 5),
+	D(9, 6), D(9, 7), D(10, 0), D(10, 1) };
+static const struct sppctlgrp_t sp7021grps_emmc[] = {
+	EGRP("CARD0_EMMC", 1, pins_emmc)
+};
+
+static const unsigned int pins_sdsd[] = {
+	D(8, 1), D(8, 2), D(8, 3), D(8, 4), D(8, 5), D(8, 6)
+};
+static const struct sppctlgrp_t sp7021grps_sdsd[] = {
+	EGRP("SD_CARD", 1, pins_sdsd)
+};
+
+static const unsigned int pins_uar0[] = { D(11, 0), D(11, 1) };
+static const struct sppctlgrp_t sp7021grps_uar0[] = {
+	EGRP("UA0", 1, pins_uar0)
+};
+
+static const unsigned int pins_adbg1[] = { D(10, 2), D(10, 3) };
+static const unsigned int pins_adbg2[] = { D(7, 1), D(7, 2) };
+static const struct sppctlgrp_t sp7021grps_adbg[] = {
+	EGRP("ACHIP_DEBUG1", 1, pins_adbg1),
+	EGRP("ACHIP_DEBUG2", 2, pins_adbg2)
+};
+
+static const unsigned int pins_aua2axi1[] = { D(2, 0), D(2, 1), D(2, 2) };
+static const unsigned int pins_aua2axi2[] = { D(1, 0), D(1, 1), D(1, 2) };
+static const struct sppctlgrp_t sp7021grps_au2x[] = {
+	EGRP("ACHIP_UA2AXI1", 1, pins_aua2axi1),
+	EGRP("ACHIP_UA2AXI2", 2, pins_aua2axi2)
+};
+
+static const unsigned int pins_fpga[] = {
+	D(0, 2), D(0, 3), D(0, 4), D(0, 5), D(0, 6), D(0, 7),
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5),
+	D(1, 6), D(1, 7), D(2, 0), D(2, 1), D(2, 2), D(2, 3),
+	D(2, 4), D(2, 5), D(2, 6), D(2, 7), D(3, 0), D(3, 1),
+	D(3, 2), D(3, 3), D(3, 4), D(3, 5), D(3, 6), D(3, 7),
+	D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4), D(4, 5),
+	D(4, 6), D(4, 7), D(5, 0), D(5, 1), D(5, 2)
+};
+static const struct sppctlgrp_t sp7021grps_fpga[] = {
+	EGRP("FPGA_IFX", 1, pins_fpga)
+};
+
+/* CEC pin is not used. Release it for others. */
+//static const unsigned int pins_hdmi1[] = { D(10, 6), D(10, 7), D(12, 2), D(12, 1) };
+//static const unsigned int pins_hdmi2[] = { D(8, 3), D(8, 4), D(8, 5), D(8, 6) };
+//static const unsigned int pins_hdmi3[] = { D(7, 4), D(7, 5), D(7, 6), D(7, 7) };
+
+static const unsigned int pins_hdmi1[] = { D(10, 6), D(12, 2), D(12, 1) };
+static const unsigned int pins_hdmi2[] = { D(8, 3), D(8, 5), D(8, 6) };
+static const unsigned int pins_hdmi3[] = { D(7, 4), D(7, 6), D(7, 7) };
+static const struct sppctlgrp_t sp7021grps_hdmi[] = {
+	EGRP("HDMI_TX1", 1, pins_hdmi1),
+	EGRP("HDMI_TX2", 2, pins_hdmi2),
+	EGRP("HDMI_TX3", 3, pins_hdmi3)
+};
+
+static const unsigned int pins_eadc[] = {
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5), D(1, 6)
+};
+static const struct sppctlgrp_t sp7021grps_eadc[] = {
+	EGRP("AUD_EXT_ADC_IFX0", 1, pins_eadc)
+};
+
+static const unsigned int pins_edac[] = {
+	D(2, 5), D(2, 6), D(2, 7), D(3, 0), D(3, 1), D(3, 2), D(3, 4)
+};
+static const struct sppctlgrp_t sp7021grps_edac[] = {
+	EGRP("AUD_EXT_DAC_IFX0", 1, pins_edac)
+};
+
+static const unsigned int pins_spdi[] = { D(2, 4) };
+static const struct sppctlgrp_t sp7021grps_spdi[] = {
+	EGRP("AUD_IEC_RX0", 1, pins_spdi)
+};
+static const unsigned int pins_spdo[] = { D(3, 6) };
+static const struct sppctlgrp_t sp7021grps_spdo[] = {
+	EGRP("AUD_IEC_TX0", 1, pins_spdo)
+};
+
+static const unsigned int pins_tdmt[] = {
+	D(2, 5), D(2, 6), D(2, 7), D(3, 0), D(3, 1), D(3, 2)
+};
+static const struct sppctlgrp_t sp7021grps_tdmt[] = {
+	EGRP("TDMTX_IFX0", 1, pins_tdmt)
+};
+
+static const unsigned int pins_tdmr[] = { D(1, 7), D(2, 0), D(2, 1), D(2, 2) };
+static const struct sppctlgrp_t sp7021grps_tdmr[] = {
+	EGRP("TDMRX_IFX0", 1, pins_tdmr)
+};
+
+static const unsigned int pins_pdmr[] = {
+	D(1, 7), D(2, 0), D(2, 1), D(2, 2), D(2, 3)
+};
+static const struct sppctlgrp_t sp7021grps_pdmr[] = {
+	EGRP("PDMRX_IFX0", 1, pins_pdmr)
+};
+
+static const unsigned int pins_pcmt[] = {
+	D(3, 7), D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4)
+};
+static const struct sppctlgrp_t sp7021grps_pcmt[] = {
+	EGRP("PCM_IEC_TX", 1, pins_pcmt)
+};
+
+static const unsigned int pins_lcdi[] = {
+	D(1, 4), D(1, 5),
+	D(1, 6), D(1, 7), D(2, 0), D(2, 1), D(2, 2), D(2, 3),
+	D(2, 4), D(2, 5), D(2, 6), D(2, 7), D(3, 0), D(3, 1),
+	D(3, 2), D(3, 3), D(3, 4), D(3, 5), D(3, 6), D(3, 7),
+	D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4), D(4, 5),
+	D(4, 6), D(4, 7)
+};
+static const struct sppctlgrp_t sp7021grps_lcdi[] = {
+	EGRP("LCDIF", 1, pins_lcdi)
+};
+
+static const unsigned int pins_dvdd[] = {
+	D(7, 0), D(7, 1), D(7, 2), D(7, 3), D(7, 4), D(7, 5), D(7, 6), D(7, 7),
+	D(8, 0), D(8, 1), D(8, 2), D(8, 3), D(8, 4), D(8, 5)
+};
+static const struct sppctlgrp_t sp7021grps_dvdd[] = {
+	EGRP("DVD_DSP_DEBUG", 1, pins_dvdd)
+};
+
+static const unsigned int pins_i2cd[] = { D(1, 0), D(1, 1) };
+static const struct sppctlgrp_t sp7021grps_i2cd[] = {
+	EGRP("I2C_DEBUG", 1, pins_i2cd)
+};
+
+static const unsigned int pins_i2cs[] = { D(0, 0), D(0, 1) };
+static const struct sppctlgrp_t sp7021grps_i2cs[] = {
+	EGRP("I2C_SLAVE", 1, pins_i2cs)
+};
+
+static const unsigned int pins_wakp[] = { D(10, 5) };
+static const struct sppctlgrp_t sp7021grps_wakp[] = {
+	EGRP("WAKEUP", 1, pins_wakp)
+};
+
+static const unsigned int pins_u2ax[] = { D(2, 0), D(2, 1), D(3, 0), D(3, 1) };
+static const struct sppctlgrp_t sp7021grps_u2ax[] = {
+	EGRP("UART2AXI", 1, pins_u2ax)
+};
+
+static const unsigned int pins_u0ic[] = {
+	D(0, 0), D(0, 1), D(0, 4), D(0, 5), D(1, 0), D(1, 1)
+};
+static const struct sppctlgrp_t sp7021grps_u0ic[] = {
+	EGRP("USB0_I2C", 1, pins_u0ic)
+};
+
+static const unsigned int pins_u1ic[] = {
+	D(0, 2), D(0, 3), D(0, 6), D(0, 7), D(1, 2), D(1, 3)
+};
+static const struct sppctlgrp_t sp7021grps_u1ic[] = {
+	EGRP("USB1_I2C", 1, pins_u1ic)
+};
+
+static const unsigned int pins_u0ot[] = { D(11, 2) };
+static const struct sppctlgrp_t sp7021grps_u0ot[] = {
+	EGRP("USB0_OTG", 1, pins_u0ot)
+};
+
+static const unsigned int pins_u1ot[] = { D(11, 3) };
+static const struct sppctlgrp_t sp7021grps_u1ot[] = {
+	EGRP("USB1_OTG", 1, pins_u1ot)
+};
+
+static const unsigned int pins_uphd[] = {
+	D(0, 1), D(0, 2), D(0, 3), D(7, 4), D(7, 5), D(7, 6),
+	D(7, 7), D(8, 0), D(8, 1), D(8, 2), D(8, 3),
+	D(9, 7), D(10, 2), D(10, 3), D(10, 4)
+};
+static const struct sppctlgrp_t sp7021grps_up0d[] = {
+	EGRP("UPHY0_DEBUG", 1, pins_uphd)
+};
+static const struct sppctlgrp_t sp7021grps_up1d[] = {
+	EGRP("UPHY1_DEBUG", 1, pins_uphd)
+};
+
+static const unsigned int pins_upex[] = {
+	D(0, 0), D(0, 1), D(0, 2), D(0, 3), D(0, 4), D(0, 5), D(0, 6), D(0, 7),
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5), D(1, 6), D(1, 7),
+	D(2, 0), D(2, 1), D(2, 2), D(2, 3), D(2, 4), D(2, 5), D(2, 6), D(2, 7),
+	D(3, 0), D(3, 1), D(3, 2), D(3, 3), D(3, 4), D(3, 5), D(3, 6), D(3, 7),
+	D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4), D(4, 5), D(4, 6), D(4, 7),
+	D(5, 0), D(5, 1), D(5, 2), D(5, 3), D(5, 4), D(5, 5), D(5, 6), D(5, 7),
+	D(6, 0), D(6, 1), D(6, 2), D(6, 3), D(6, 4), D(6, 5), D(6, 6), D(6, 7),
+	D(7, 0), D(7, 1), D(7, 2), D(7, 3), D(7, 4), D(7, 5), D(7, 6), D(7, 7),
+	D(8, 0), D(8, 1), D(8, 2), D(8, 3), D(8, 4), D(8, 5), D(8, 6), D(8, 7),
+	D(9, 0), D(9, 1), D(9, 2), D(9, 3), D(9, 4), D(9, 5), D(9, 6), D(9, 7),
+	D(10, 0), D(10, 1), D(10, 2), D(10, 3), D(10, 4), D(10, 5), D(10, 6), D(10, 7)
+};
+static const struct sppctlgrp_t sp7021grps_upex[] = {
+	EGRP("UPHY0_EXT", 1, pins_upex)
+};
+
+static const unsigned int pins_prp1[] = {
+	D(0, 6), D(0, 7),
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5), D(1, 6), D(1, 7),
+	D(2, 1), D(2, 2), D(2, 3), D(2, 4), D(2, 5), D(2, 6), D(2, 7),
+	D(3, 0), D(3, 1), D(3, 2)
+};
+static const unsigned int pins_prp2[] = {
+	D(3, 4), D(3, 6), D(3, 7),
+	D(4, 0), D(4, 1), D(4, 2), D(4, 3), D(4, 4), D(4, 5), D(4, 6), D(4, 7),
+	D(5, 0), D(5, 1), D(5, 2), D(5, 3), D(5, 4), D(5, 5), D(5, 6), D(5, 7),
+	D(6, 4)
+};
+static const struct sppctlgrp_t sp7021grps_prbp[] = {
+	EGRP("PROBE_PORT1", 1, pins_prp1),
+	EGRP("PROBE_PORT2", 2, pins_prp2)
+};
+
+static const unsigned int pins_anai[] = { D(0, 4), D(0, 5) };
+static const struct sppctlgrp_t sp7021grps_anai[] = {
+	EGRP("ANA_I2C_IF", 1, pins_anai),
+};
+
+static const unsigned int pins_anat[] = {
+	D(0, 0), D(0, 1), D(0, 2), D(0, 3), D(0, 4), D(0, 5), D(0, 6), D(0, 7),
+	D(1, 0), D(1, 1), D(1, 2), D(1, 3), D(1, 4), D(1, 5), D(1, 6),
+	D(11, 0)
+};
+static const struct sppctlgrp_t sp7021grps_anat[] = {
+	EGRP("ANA_TEST_IF", 1, pins_anat)
+};
+
+struct func_t list_funcs[] = {
+	FNCN("GPIO",            fOFF_0, 0x00, 0, 0),
+	FNCN("IOP",             fOFF_0, 0x00, 0, 0),
+
+	FNCN("L2SW_CLK_OUT",        fOFF_M, 0x00, 0, 7),
+	FNCN("L2SW_MAC_SMI_MDC",    fOFF_M, 0x00, 8, 7),
+	FNCN("L2SW_LED_FLASH0",     fOFF_M, 0x01, 0, 7),
+	FNCN("L2SW_LED_FLASH1",     fOFF_M, 0x01, 8, 7),
+	FNCN("L2SW_LED_ON0",        fOFF_M, 0x02, 0, 7),
+	FNCN("L2SW_LED_ON1",        fOFF_M, 0x02, 8, 7),
+	FNCN("L2SW_MAC_SMI_MDIO",   fOFF_M, 0x03, 0, 7),
+	FNCN("L2SW_P0_MAC_RMII_TXEN",   fOFF_M, 0x03, 8, 7),
+	FNCN("L2SW_P0_MAC_RMII_TXD0",   fOFF_M, 0x04, 0, 7),
+	FNCN("L2SW_P0_MAC_RMII_TXD1",   fOFF_M, 0x04, 8, 7),
+	FNCN("L2SW_P0_MAC_RMII_CRSDV",  fOFF_M, 0x05, 0, 7),
+	FNCN("L2SW_P0_MAC_RMII_RXD0",   fOFF_M, 0x05, 8, 7),
+	FNCN("L2SW_P0_MAC_RMII_RXD1",   fOFF_M, 0x06, 0, 7),
+	FNCN("L2SW_P0_MAC_RMII_RXER",   fOFF_M, 0x06, 8, 7),
+	FNCN("L2SW_P1_MAC_RMII_TXEN",   fOFF_M, 0x07, 0, 7),
+	FNCN("L2SW_P1_MAC_RMII_TXD0",   fOFF_M, 0x07, 8, 7),
+	FNCN("L2SW_P1_MAC_RMII_TXD1",   fOFF_M, 0x08, 0, 7),
+	FNCN("L2SW_P1_MAC_RMII_CRSDV",  fOFF_M, 0x08, 8, 7),
+	FNCN("L2SW_P1_MAC_RMII_RXD0",   fOFF_M, 0x09, 0, 7),
+	FNCN("L2SW_P1_MAC_RMII_RXD1",   fOFF_M, 0x09, 8, 7),
+	FNCN("L2SW_P1_MAC_RMII_RXER",   fOFF_M, 0x0A, 0, 7),
+	FNCN("DAISY_MODE",      fOFF_M, 0x0A, 8, 7),    // mux has no effect now
+	FNCN("SDIO_CLK",        fOFF_M, 0x0B, 0, 7),
+	FNCN("SDIO_CMD",        fOFF_M, 0x0B, 8, 7),
+	FNCN("SDIO_D0",         fOFF_M, 0x0C, 0, 7),
+	FNCN("SDIO_D1",         fOFF_M, 0x0C, 8, 7),
+	FNCN("SDIO_D2",         fOFF_M, 0x0D, 0, 7),
+	FNCN("SDIO_D3",         fOFF_M, 0x0D, 8, 7),
+	FNCN("PWM0",            fOFF_M, 0x0E, 0, 7),
+	FNCN("PWM1",            fOFF_M, 0x0E, 8, 7),
+	FNCN("PWM2",            fOFF_M, 0x0F, 0, 7),
+	FNCN("PWM3",            fOFF_M, 0x0F, 8, 7),
+
+	FNCN("PWM4",            fOFF_M, 0x10, 0, 7),
+	FNCN("PWM5",            fOFF_M, 0x10, 8, 7),
+	FNCN("PWM6",            fOFF_M, 0x11, 0, 7),
+	FNCN("PWM7",            fOFF_M, 0x11, 8, 7),
+	FNCN("ICM0_D",          fOFF_M, 0x12, 0, 7),    // 4x Input captures
+	FNCN("ICM1_D",          fOFF_M, 0x12, 8, 7),
+	FNCN("ICM2_D",          fOFF_M, 0x13, 0, 7),
+	FNCN("ICM3_D",          fOFF_M, 0x13, 8, 7),
+	FNCN("ICM0_CLK",        fOFF_M, 0x14, 0, 7),
+	FNCN("ICM1_CLK",        fOFF_M, 0x14, 8, 7),
+	FNCN("ICM2_CLK",        fOFF_M, 0x15, 0, 7),
+	FNCN("ICM3_CLK",        fOFF_M, 0x15, 8, 7),
+	FNCN("SPIM0_INT",       fOFF_M, 0x16, 0, 7),    // 4x SPI masters
+	FNCN("SPIM0_CLK",       fOFF_M, 0x16, 8, 7),
+	FNCN("SPIM0_EN",        fOFF_M, 0x17, 0, 7),
+	FNCN("SPIM0_DO",        fOFF_M, 0x17, 8, 7),
+	FNCN("SPIM0_DI",        fOFF_M, 0x18, 0, 7),
+	FNCN("SPIM1_INT",       fOFF_M, 0x18, 8, 7),
+	FNCN("SPIM1_CLK",       fOFF_M, 0x19, 0, 7),
+	FNCN("SPIM1_EN",        fOFF_M, 0x19, 8, 7),
+	FNCN("SPIM1_DO",        fOFF_M, 0x1A, 0, 7),
+	FNCN("SPIM1_DI",        fOFF_M, 0x1A, 8, 7),
+	FNCN("SPIM2_INT",       fOFF_M, 0x1B, 0, 7),
+	FNCN("SPIM2_CLK",       fOFF_M, 0x1B, 8, 7),
+	FNCN("SPIM2_EN",        fOFF_M, 0x1C, 0, 7),
+	FNCN("SPIM2_DO",        fOFF_M, 0x1C, 8, 7),
+	FNCN("SPIM2_DI",        fOFF_M, 0x1D, 0, 7),
+	FNCN("SPIM3_INT",       fOFF_M, 0x1D, 8, 7),
+	FNCN("SPIM3_CLK",       fOFF_M, 0x1E, 0, 7),
+	FNCN("SPIM3_EN",        fOFF_M, 0x1E, 8, 7),
+	FNCN("SPIM3_DO",        fOFF_M, 0x1F, 0, 7),
+	FNCN("SPIM3_DI",        fOFF_M, 0x1F, 8, 7),
+
+	FNCN("SPI0S_INT",       fOFF_M, 0x20, 0, 7),    // 4x SPI slaves
+	FNCN("SPI0S_CLK",       fOFF_M, 0x20, 8, 7),
+	FNCN("SPI0S_EN",        fOFF_M, 0x21, 0, 7),
+	FNCN("SPI0S_DO",        fOFF_M, 0x21, 8, 7),
+	FNCN("SPI0S_DI",        fOFF_M, 0x22, 0, 7),
+	FNCN("SPI1S_INT",       fOFF_M, 0x22, 8, 7),
+	FNCN("SPI1S_CLK",       fOFF_M, 0x23, 0, 7),
+	FNCN("SPI1S_EN",        fOFF_M, 0x23, 8, 7),
+	FNCN("SPI1S_DO",        fOFF_M, 0x24, 0, 7),
+	FNCN("SPI1S_DI",        fOFF_M, 0x24, 8, 7),
+	FNCN("SPI2S_INT",       fOFF_M, 0x25, 0, 7),
+	FNCN("SPI2S_CLK",       fOFF_M, 0x25, 8, 7),
+	FNCN("SPI2S_EN",        fOFF_M, 0x26, 0, 7),
+	FNCN("SPI2S_DO",        fOFF_M, 0x26, 8, 7),
+	FNCN("SPI2S_DI",        fOFF_M, 0x27, 0, 7),
+	FNCN("SPI3S_INT",       fOFF_M, 0x27, 8, 7),
+	FNCN("SPI3S_CLK",       fOFF_M, 0x28, 0, 7),
+	FNCN("SPI3S_EN",        fOFF_M, 0x28, 8, 7),
+	FNCN("SPI3S_DO",        fOFF_M, 0x29, 0, 7),
+	FNCN("SPI3S_DI",        fOFF_M, 0x29, 8, 7),
+	FNCN("I2CM0_CLK",       fOFF_M, 0x2A, 0, 7),    // 4x I2C masters
+	FNCN("I2CM0_DAT",       fOFF_M, 0x2A, 8, 7),
+	FNCN("I2CM1_CLK",       fOFF_M, 0x2B, 0, 7),
+	FNCN("I2CM1_DAT",       fOFF_M, 0x2B, 8, 7),
+	FNCN("I2CM2_CLK",       fOFF_M, 0x2C, 0, 7),
+	FNCN("I2CM2_DAT",       fOFF_M, 0x2C, 8, 7),
+	FNCN("I2CM3_CLK",       fOFF_M, 0x2D, 0, 7),
+	FNCN("I2CM3_DAT",       fOFF_M, 0x2D, 8, 7),
+	FNCN("UA1_TX",          fOFF_M, 0x2E, 0, 7),    // +4x muxable UARTS
+	FNCN("UA1_RX",          fOFF_M, 0x2E, 8, 7),
+	FNCN("UA1_CTS",         fOFF_M, 0x2F, 0, 7),
+	FNCN("UA1_RTS",         fOFF_M, 0x2F, 8, 7),
+
+	FNCN("UA2_TX",          fOFF_M, 0x30, 0, 7),
+	FNCN("UA2_RX",          fOFF_M, 0x30, 8, 7),
+	FNCN("UA2_CTS",         fOFF_M, 0x31, 0, 7),
+	FNCN("UA2_RTS",         fOFF_M, 0x31, 8, 7),
+	FNCN("UA3_TX",          fOFF_M, 0x32, 0, 7),
+	FNCN("UA3_RX",          fOFF_M, 0x32, 8, 7),
+	FNCN("UA3_CTS",         fOFF_M, 0x33, 0, 7),
+	FNCN("UA3_RTS",         fOFF_M, 0x33, 8, 7),
+	FNCN("UA4_TX",          fOFF_M, 0x34, 0, 7),
+	FNCN("UA4_RX",          fOFF_M, 0x34, 8, 7),
+	FNCN("UA4_CTS",         fOFF_M, 0x35, 0, 7),
+	FNCN("UA4_RTS",         fOFF_M, 0x35, 8, 7),
+	FNCN("TIMER0_INT",      fOFF_M, 0x36, 0, 7),    // 4x timers interrupts
+	FNCN("TIMER1_INT",      fOFF_M, 0x36, 8, 7),
+	FNCN("TIMER2_INT",      fOFF_M, 0x37, 0, 7),
+	FNCN("TIMER3_INT",      fOFF_M, 0x37, 8, 7),
+	FNCN("GPIO_INT0",       fOFF_M, 0x38, 0, 7),    // 8x GPIO interrupts
+	FNCN("GPIO_INT1",       fOFF_M, 0x38, 8, 7),
+	FNCN("GPIO_INT2",       fOFF_M, 0x39, 0, 7),
+	FNCN("GPIO_INT3",       fOFF_M, 0x39, 8, 7),
+	FNCN("GPIO_INT4",       fOFF_M, 0x3A, 0, 7),
+	FNCN("GPIO_INT5",       fOFF_M, 0x3A, 8, 7),
+	FNCN("GPIO_INT6",       fOFF_M, 0x3B, 0, 7),
+	FNCN("GPIO_INT7",       fOFF_M, 0x3B, 8, 7),
+	// offset from 0x9C000080
+	FNCE("SPI_FLASH",       fOFF_G, 0x01,  0, 2, sp7021grps_spif),
+	FNCE("SPI_FLASH_4BIT",  fOFF_G, 0x01,  2, 2, sp7021grps_spi4),
+	FNCE("SPI_NAND",        fOFF_G, 0x01,  4, 1, sp7021grps_snan),
+	FNCE("CARD0_EMMC",      fOFF_G, 0x01,  5, 1, sp7021grps_emmc),
+	FNCE("SD_CARD",         fOFF_G, 0x01,  6, 1, sp7021grps_sdsd),
+	FNCE("UA0",             fOFF_G, 0x01,  7, 1, sp7021grps_uar0),
+	FNCE("ACHIP_DEBUG",     fOFF_G, 0x01,  8, 2, sp7021grps_adbg),
+	FNCE("ACHIP_UA2AXI",    fOFF_G, 0x01, 10, 2, sp7021grps_au2x),
+	FNCE("FPGA_IFX",        fOFF_G, 0x01, 12, 1, sp7021grps_fpga),
+	FNCE("HDMI_TX",         fOFF_G, 0x01, 13, 2, sp7021grps_hdmi),
+
+	FNCE("AUD_EXT_ADC_IFX0", fOFF_G, 0x01, 15, 1, sp7021grps_eadc), // I2S audio in
+	FNCE("AUD_EXT_DAC_IFX0", fOFF_G, 0x02,  0, 1, sp7021grps_edac), // I2S audio out
+	FNCE("SPDIF_RX",        fOFF_G, 0x02,  2, 1, sp7021grps_spdi),
+	FNCE("SPDIF_TX",        fOFF_G, 0x02,  3, 1, sp7021grps_spdo),
+	FNCE("TDMTX_IFX0",      fOFF_G, 0x02,  4, 1, sp7021grps_tdmt),
+	FNCE("TDMRX_IFX0",      fOFF_G, 0x02,  5, 1, sp7021grps_tdmr),
+	FNCE("PDMRX_IFX0",      fOFF_G, 0x02,  6, 1, sp7021grps_pdmr),
+	FNCE("PCM_IEC_TX",      fOFF_G, 0x02,  7, 1, sp7021grps_pcmt),
+	FNCE("LCDIF",           fOFF_G, 0x04,  6, 1, sp7021grps_lcdi),
+	FNCE("DVD_DSP_DEBUG",   fOFF_G, 0x02,  8, 1, sp7021grps_dvdd),
+	FNCE("I2C_DEBUG",       fOFF_G, 0x02,  9, 1, sp7021grps_i2cd),
+	FNCE("I2C_SLAVE",       fOFF_G, 0x02, 10, 1, sp7021grps_i2cs), // I2C slave
+	FNCE("WAKEUP",          fOFF_G, 0x02, 11, 1, sp7021grps_wakp),
+	FNCE("UART2AXI",        fOFF_G, 0x02, 12, 2, sp7021grps_u2ax),
+	FNCE("USB0_I2C",        fOFF_G, 0x02, 14, 2, sp7021grps_u0ic),
+	FNCE("USB1_I2C",        fOFF_G, 0x03,  0, 2, sp7021grps_u1ic),
+	FNCE("USB0_OTG",        fOFF_G, 0x03,  2, 1, sp7021grps_u0ot),
+	FNCE("USB1_OTG",        fOFF_G, 0x03,  3, 1, sp7021grps_u1ot),
+	FNCE("UPHY0_DEBUG",     fOFF_G, 0x03,  4, 1, sp7021grps_up0d),
+	FNCE("UPHY1_DEBUG",     fOFF_G, 0x03,  5, 1, sp7021grps_up1d),
+	FNCE("UPHY0_EXT",       fOFF_G, 0x03,  6, 1, sp7021grps_upex),
+	FNCE("PROBE_PORT",      fOFF_G, 0x03,  7, 2, sp7021grps_prbp),
+	FNCE("ANA_I2C_IF",      fOFF_G, 0x03,  7, 2, sp7021grps_anai),
+	FNCE("ANA_TEST_IF",     fOFF_G, 0x03,  7, 2, sp7021grps_anat)
+};
+
+const size_t list_funcsSZ = ARRAY_SIZE(list_funcs);
diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
new file mode 100644
index 0000000..ca135d0
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+#include "sppctl.h"
+#include "../core.h"
+
+
+void print_device_tree_node(struct device_node *node, int depth)
+{
+	int i = 0;
+	struct device_node *child;
+	struct property    *properties;
+	char                indent[255] = "";
+
+	for (i = 0; i < depth * 3; i++)
+		indent[i] = ' ';
+	indent[i] = '\0';
+
+	++depth;
+	if (depth == 1) {
+		pr_info("%s{ name = %s\n", indent, node->name);
+		for (properties = node->properties; properties != NULL;
+			properties = properties->next)
+			pr_info("%s  %s (%d)\n", indent, properties->name, properties->length);
+		pr_info("%s}\n", indent);
+	}
+
+	for_each_child_of_node(node, child) {
+		pr_info("%s{ name = %s\n", indent, child->name);
+		for (properties = child->properties; properties != NULL;
+			properties = properties->next)
+			pr_info("%s  %s (%d)\n", indent, properties->name, properties->length);
+		print_device_tree_node(child, depth);
+		pr_info("%s}\n", indent);
+	}
+}
+
+void sppctl_gmx_set(struct sppctl_pdata_t *_p, uint8_t _roff, uint8_t _boff, uint8_t _bsiz,
+		    uint8_t _rval)
+{
+	uint32_t *r;
+	struct sppctl_reg_t x = { .m = (~(~0 << _bsiz)) << _boff,
+				  .v = ((uint16_t)_rval) << _boff };
+
+	if (_p->debug > 1)
+		KDBG(_p->pcdp->dev, "%s(x%X,x%X,x%X,x%X) m:x%X v:x%X\n",
+		     __func__, _roff, _boff, _bsiz, _rval, x.m, x.v);
+	r = (uint32_t *)&x;
+	writel(*r, _p->baseI + (_roff << 2));
+}
+
+uint8_t sppctl_gmx_get(struct sppctl_pdata_t *_p, uint8_t _roff, uint8_t _boff, uint8_t _bsiz)
+{
+	uint8_t rval;
+	struct sppctl_reg_t *x;
+	uint32_t r = readl(_p->baseI + (_roff << 2));
+
+	x = (struct sppctl_reg_t *)&r;
+	rval = (x->v >> _boff) & (~(~0 << _bsiz));
+
+	if (_p->debug > 1)
+		KDBG(_p->pcdp->dev, "%s(x%X,x%X,x%X) v:x%X rval:x%X\n",
+		     __func__, _roff, _boff, _bsiz, x->v, rval);
+
+	return rval;
+}
+
+void sppctl_pin_set(struct sppctl_pdata_t *_p, uint8_t _pin, uint8_t _fun)
+{
+	uint32_t *r;
+	struct sppctl_reg_t x = { .m = 0x007F, .v = (uint16_t)_pin };
+	uint8_t func = (_fun >> 1) << 2;
+
+	if (_fun % 2 == 0)
+		;
+	else {
+		x.v <<= 8;
+		x.m <<= 8;
+	}
+
+	if (_p->debug > 1)
+		KDBG(_p->pcdp->dev, "%s(x%X,x%X) off:x%X m:x%X v:x%X\n",
+		     __func__, _pin, _fun, func, x.m, x.v);
+
+	r = (uint32_t *)&x;
+	writel(*r, _p->baseF + func);
+}
+
+uint8_t sppctl_fun_get(struct sppctl_pdata_t *_p,  uint8_t _fun)
+{
+	uint8_t pin = 0x00;
+	uint8_t func = (_fun >> 1) << 2;
+	struct sppctl_reg_t *x;
+	uint32_t r = readl(_p->baseF + func);
+
+	x = (struct sppctl_reg_t *)&r;
+	if (_fun % 2 == 0)
+		pin = x->v & 0x00FF;
+	else
+		pin = x->v >> 8;
+
+	if (_p->debug > 1)
+		KDBG(_p->pcdp->dev, "%s(x%X) off:x%X m:x%X v:x%X pin:x%X\n",
+		     __func__, _fun, func, x->m, x->v, pin);
+
+	return pin;
+}
+
+static void sppctl_fwload_cb(const struct firmware *_fw, void *_ctx)
+{
+	int i = -1, j = 0;
+	struct sppctl_pdata_t *p = (struct sppctl_pdata_t *)_ctx;
+
+	if (!_fw) {
+		KERR(p->pcdp->dev, "Firmware not found\n");
+		return;
+	}
+	if (_fw->size < list_funcsSZ-2) {
+		KERR(p->pcdp->dev, " fw size %zd < %zd\n", _fw->size, list_funcsSZ);
+		goto out;
+	}
+
+	for (i = 0; i < list_funcsSZ && i < _fw->size; i++) {
+		if (list_funcs[i].freg != fOFF_M)
+			continue;
+		sppctl_pin_set(p, _fw->data[i], i);
+		j++;
+	}
+
+out:
+	release_firmware(_fw);
+}
+
+void sppctl_loadfw(struct device *_dev, const char *_fwname)
+{
+	int ret;
+	struct sppctl_pdata_t *p = (struct sppctl_pdata_t *)_dev->platform_data;
+
+	if (!_fwname)
+		return;
+	if (strlen(_fwname) < 1)
+		return;
+	KINF(_dev, "fw:%s", _fwname);
+
+	ret = request_firmware_nowait(THIS_MODULE, true, _fwname, _dev, GFP_KERNEL, p,
+				      sppctl_fwload_cb);
+	if (ret)
+		KERR(_dev, "Can't load '%s'\n", _fwname);
+}
+
+int sppctl_pctl_resmap(struct platform_device *_pd, struct sppctl_pdata_t *_pc)
+{
+	struct resource *rp;
+
+	// resF
+	rp = platform_get_resource(_pd, IORESOURCE_MEM, 0);
+	if (IS_ERR(rp)) {
+		KERR(&(_pd->dev), "%s get res#F ERR\n", __func__);
+		return PTR_ERR(rp);
+	}
+	KDBG(&(_pd->dev), "mres #F:%p\n", rp);
+	if (!rp)
+		return -EFAULT;
+	KDBG(&(_pd->dev), "mapping [%pa-%pa]\n", &rp->start, &rp->end);
+
+	_pc->baseF = devm_ioremap_resource(&(_pd->dev), rp);
+	if (IS_ERR(_pc->baseF)) {
+		KERR(&(_pd->dev), "%s map res#F ERR\n", __func__);
+		return PTR_ERR(_pc->baseF);
+	}
+
+	// res0
+	rp = platform_get_resource(_pd, IORESOURCE_MEM, 1);
+	if (IS_ERR(rp)) {
+		KERR(&(_pd->dev), "%s get res#0 ERR\n", __func__);
+		return PTR_ERR(rp);
+	}
+	KDBG(&(_pd->dev), "mres #0:%p\n", rp);
+	if (!rp)
+		return -EFAULT;
+	KDBG(&(_pd->dev), "mapping [%pa-%pa]\n", &rp->start, &rp->end);
+
+	_pc->base0 = devm_ioremap_resource(&(_pd->dev), rp);
+	if (IS_ERR(_pc->base0)) {
+		KERR(&(_pd->dev), "%s map res#0 ERR\n", __func__);
+		return PTR_ERR(_pc->base0);
+	}
+
+	// res1
+	rp = platform_get_resource(_pd, IORESOURCE_MEM, 2);
+	if (IS_ERR(rp)) {
+		KERR(&(_pd->dev), "%s get res#1 ERR\n", __func__);
+		return PTR_ERR(rp);
+	}
+	KDBG(&(_pd->dev), "mres #1:%p\n", rp);
+	if (!rp)
+		return -EFAULT;
+	KDBG(&(_pd->dev), "mapping [%pa-%pa]\n", &rp->start, &rp->end);
+
+	_pc->base1 = devm_ioremap_resource(&(_pd->dev), rp);
+	if (IS_ERR(_pc->base1)) {
+		KERR(&(_pd->dev), "%s map res#1 ERR\n", __func__);
+		return PTR_ERR(_pc->base1);
+	}
+
+	// res2
+	rp = platform_get_resource(_pd, IORESOURCE_MEM, 3);
+	if (IS_ERR(rp)) {
+		KERR(&(_pd->dev), "%s get res#2 ERR\n", __func__);
+		return PTR_ERR(rp);
+	}
+	KDBG(&(_pd->dev), "mres #2:%p\n", rp);
+	if (!rp)
+		return -EFAULT;
+	KDBG(&(_pd->dev), "mapping [%pa-%pa]\n", &rp->start, &rp->end);
+
+	_pc->base2 = devm_ioremap_resource(&(_pd->dev), rp);
+	if (IS_ERR(_pc->base2)) {
+		KERR(&(_pd->dev), "%s map res#2 ERR\n", __func__);
+		return PTR_ERR(_pc->base2);
+	}
+
+	// iop
+	rp = platform_get_resource(_pd, IORESOURCE_MEM, 4);
+	if (IS_ERR(rp)) {
+		KERR(&(_pd->dev), "%s get res#I ERR\n", __func__);
+		return PTR_ERR(rp);
+	}
+	KDBG(&(_pd->dev), "mres #I:%p\n", rp);
+	if (!rp)
+		return -EFAULT;
+	KDBG(&(_pd->dev), "mapping [%pa-%pa]\n", &rp->start, &rp->end);
+
+	_pc->baseI = devm_ioremap_resource(&(_pd->dev), rp);
+	if (IS_ERR(_pc->baseI)) {
+		KERR(&(_pd->dev), "%s map res#I ERR\n", __func__);
+		return PTR_ERR(_pc->baseI);
+	}
+
+	return 0;
+}
+
+static int sppctl_dnew(struct platform_device *_pd)
+{
+	int ret = -ENODEV;
+	struct device_node *np = _pd->dev.of_node;
+	struct sppctl_pdata_t *p = NULL;
+	const char *fwfname = FW_DEFNAME;
+
+	if (!np) {
+		KERR(&(_pd->dev), "Invalid dtb node\n");
+		return -EINVAL;
+	}
+	if (!of_device_is_available(np)) {
+		KERR(&(_pd->dev), "dtb is not available\n");
+		return -ENODEV;
+	}
+
+	// print_device_tree_node(np, 0);
+
+	p = devm_kzalloc(&(_pd->dev), sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+	memset(p->name, 0, SPPCTL_MAX_NAM);
+	if (np)
+		strcpy(p->name, np->name);
+	else
+		strcpy(p->name, MNAME);
+	dev_set_name(&(_pd->dev), "%s", p->name);
+
+	ret = sppctl_pctl_resmap(_pd, p);
+	if (ret != 0)
+		return ret;
+
+	// set gpio_chip
+	_pd->dev.platform_data = p;
+	sppctl_sysfs_init(_pd);
+	of_property_read_string(np, "fwname", &fwfname);
+	if (fwfname)
+		strcpy(p->fwname, fwfname);
+	sppctl_loadfw(&(_pd->dev), p->fwname);
+
+	ret = sppctl_gpio_new(_pd, p);
+	if (ret != 0)
+		return ret;
+
+	ret = sppctl_pinctrl_init(_pd);
+	if (ret != 0)
+		return ret;
+
+	pinctrl_add_gpio_range(p->pcdp, &(p->gpio_range));
+	pr_info(M_NAM " by " M_ORG "" M_CPR);
+
+	return 0;
+}
+
+static int sppctl_ddel(struct platform_device *_pd)
+{
+	struct sppctl_pdata_t *p = (struct sppctl_pdata_t *)_pd->dev.platform_data;
+
+	sppctl_gpio_del(_pd, p);
+	sppctl_sysfs_clean(_pd);
+	sppctl_pinctrl_clea(_pd);
+	return 0;
+}
+
+static const struct of_device_id sppctl_dt_ids[] = {
+	{ .compatible = "sunplus,sp7021-pctl" },
+	{ /* zero */ }
+};
+
+MODULE_DEVICE_TABLE(of, sppctl_dt_ids);
+MODULE_ALIAS("platform:" MNAME);
+
+static struct platform_driver sppctl_driver = {
+	.driver = {
+		.name           = MNAME,
+		.owner          = THIS_MODULE,
+		.of_match_table = of_match_ptr(sppctl_dt_ids),
+	},
+	.probe  = sppctl_dnew,
+	.remove = sppctl_ddel,
+};
+
+static int __init sppctl_drv_reg(void)
+{
+	return platform_driver_register(&sppctl_driver);
+}
+postcore_initcall(sppctl_drv_reg);
+
+static void __exit sppctl_drv_exit(void)
+{
+	platform_driver_unregister(&sppctl_driver);
+}
+module_exit(sppctl_drv_exit);
+
+MODULE_AUTHOR(M_AUT1);
+MODULE_AUTHOR(M_AUT2);
+MODULE_DESCRIPTION(M_NAM);
+MODULE_LICENSE(M_LIC);
diff --git a/drivers/pinctrl/sunplus/sppctl.h b/drivers/pinctrl/sunplus/sppctl.h
new file mode 100644
index 0000000..c64a619
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef SPPCTL_H
+#define SPPCTL_H
+
+#define MNAME "sppctl"
+#define M_LIC "GPL v2"
+#define M_AUT1 "Dvorkin Dmitry <dvorkin@tibbo.com>"
+#define M_AUT2 "Wells Lu <wells.lu@sunplus.com>"
+#define M_NAM "SP7021 PinCtl"
+#define M_ORG "Sunplus/Tibbo Tech."
+#define M_CPR "(C) 2020"
+
+#define FW_DEFNAME NULL
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/sysfs.h>
+#include <linux/printk.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <dt-bindings/pinctrl/sppctl-sp7021.h>
+
+#define SPPCTL_MAX_NAM 64
+#define SPPCTL_MAX_BUF PAGE_SIZE
+
+#define KINF(pd, fmt, args...) \
+	do { \
+		if ((pd) != NULL) \
+			dev_info((pd), fmt, ##args); \
+		else \
+			pr_info(MNAME ": " fmt, ##args); \
+	} while (0)
+#define KERR(pd, fmt, args...) \
+	do { \
+		if ((pd) != NULL) \
+			dev_info((pd), fmt, ##args); \
+		else \
+			pr_err(MNAME ": " fmt, ##args); \
+	} while (0)
+#ifdef CONFIG_PINCTRL_SPPCTL_DEBUG
+#define KDBG(pd, fmt, args...) \
+	do { \
+		if ((pd) != NULL) \
+			dev_info((pd), fmt, ##args); \
+		else \
+			pr_debug(MNAME ": " fmt, ##args); \
+	} while (0)
+#else
+#define KDBG(pd, fmt, args...)
+#endif
+
+#include "sppctl_gpio.h"
+
+struct sppctl_pdata_t {
+	char name[SPPCTL_MAX_NAM];
+	uint8_t debug;
+	char fwname[SPPCTL_MAX_NAM];
+	void *sysfs_sdp;
+	void __iomem *baseF;    // functions
+	void __iomem *base0;    // MASTER , OE , OUT , IN
+	void __iomem *base1;    // I_INV , O_INV , OD
+	void __iomem *base2;    // GPIO_FIRST
+	void __iomem *baseI;    // IOP
+	// pinctrl-related
+	struct pinctrl_desc pdesc;
+	struct pinctrl_dev *pcdp;
+	struct pinctrl_gpio_range gpio_range;
+	struct sppctlgpio_chip_t *gpiod;
+};
+
+struct sppctl_reg_t {
+	uint16_t v;     // value part
+	uint16_t m;     // mask part
+};
+
+#include "sppctl_sysfs.h"
+#include "sppctl_pinctrl.h"
+
+void sppctl_gmx_set(struct sppctl_pdata_t *_p, uint8_t _roff, uint8_t _boff,
+		    uint8_t _bsiz, uint8_t _rval);
+uint8_t sppctl_gmx_get(struct sppctl_pdata_t *_p, uint8_t _roff, uint8_t _boff,
+		       uint8_t _bsiz);
+void sppctl_pin_set(struct sppctl_pdata_t *_p, uint8_t _pin, uint8_t _fun);
+uint8_t sppctl_fun_get(struct sppctl_pdata_t *_p, uint8_t _pin);
+void sppctl_loadfw(struct device *_dev, const char *_fwname);
+
+enum fOFF_t {
+	fOFF_0, // nowhere
+	fOFF_M, // in mux registers
+	fOFF_G, // mux group registers
+	fOFF_I, // in iop registers
+};
+
+struct sppctlgrp_t {
+	const char * const name;
+	const uint8_t gval;             // value for register
+	const unsigned * const pins;    // list of pins
+	const unsigned int pnum;        // number of pins
+};
+
+#define EGRP(n, v, p) { \
+	.name = n, \
+	.gval = (v), \
+	.pins = (p), \
+	.pnum = ARRAY_SIZE(p), \
+}
+
+struct func_t {
+	const char * const name;
+	const enum fOFF_t freg;     // function register type
+	const uint8_t roff;         // register offset
+	const uint8_t boff;         // bit offset
+	const uint8_t blen;         // number of bits
+	const struct sppctlgrp_t * const grps; // list of groups
+	const unsigned int gnum;    // number of groups
+	const char *grps_sa[5];     // array of pointers to func's grps names
+};
+
+#define FNCE(n, r, o, bo, bl, g) { \
+	.name = n, \
+	.freg = r, \
+	.roff = o, \
+	.boff = bo, \
+	.blen = bl, \
+	.grps = (g), \
+	.gnum = ARRAY_SIZE(g), \
+}
+
+#define FNCN(n, r, o, bo, bl) { \
+	.name = n, \
+	.freg = r, \
+	.roff = o, \
+	.boff = bo, \
+	.blen = bl, \
+	.grps = NULL, \
+	.gnum = 0, \
+}
+extern struct func_t list_funcs[];
+extern const size_t list_funcsSZ;
+
+extern const char * const sppctlpmux_list_s[];
+extern const size_t PMUX_listSZ;
+
+struct grp2fp_map_t {
+	uint16_t f_idx; // function index
+	uint16_t g_idx; // pins/group index inside function
+};
+
+// for debug
+void print_device_tree_node(struct device_node *node, int depth);
+
+#endif // SPPCTL_H
diff --git a/drivers/pinctrl/sunplus/sppctl_gpio.c b/drivers/pinctrl/sunplus/sppctl_gpio.c
new file mode 100644
index 0000000..31d11d6
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_gpio.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO Driver for Sunplus/Tibbo SP7021 controller
+ * Copyright (C) 2020 Sunplus Tech./Tibbo Tech.
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/seq_file.h>
+#include <linux/io.h>
+
+#include "sppctl_gpio_ops.h"
+#include "sppctl_gpio.h"
+
+__attribute((unused))
+static irqreturn_t gpio_int_0(int irq, void *data)
+{
+	pr_info("register gpio int0 trigger\n");
+	return IRQ_HANDLED;
+}
+
+int sppctl_gpio_new(struct platform_device *_pd, void *_datap)
+{
+	struct device_node *np = _pd->dev.of_node, *npi;
+	struct sppctlgpio_chip_t *pc = NULL;
+	struct gpio_chip *gchip = NULL;
+	int err = 0, i = 0, npins;
+	struct sppctl_pdata_t *_pctrlp = (struct sppctl_pdata_t *)_datap;
+
+	if (!np) {
+		KERR(&(_pd->dev), "invalid devicetree node\n");
+		return -EINVAL;
+	}
+
+	if (!of_device_is_available(np)) {
+		KERR(&(_pd->dev), "devicetree status is not available\n");
+		return -ENODEV;
+	}
+
+	// print_device_tree_node(np, 0);
+	for_each_child_of_node(np, npi) {
+		if (of_find_property(npi, "gpio-controller", NULL)) {
+			i = 1;
+			break;
+		}
+	}
+
+	if (of_find_property(np, "gpio-controller", NULL))
+		i = 1;
+	if (i == 0) {
+		KERR(&(_pd->dev), "is not gpio-controller\n");
+		return -ENODEV;
+	}
+
+	pc = devm_kzalloc(&(_pd->dev), sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+	gchip = &(pc->chip);
+
+	pc->base0 = _pctrlp->base0;
+	pc->base1 = _pctrlp->base1;
+	pc->base2 = _pctrlp->base2;
+	_pctrlp->gpiod = pc;
+
+	gchip->label =             MNAME;
+	gchip->parent =            &(_pd->dev);
+	gchip->owner =             THIS_MODULE;
+	gchip->request =           gpiochip_generic_request; // place new calls there
+	gchip->free =              gpiochip_generic_free;
+	gchip->get_direction =     sppctlgpio_f_gdi;
+	gchip->direction_input =   sppctlgpio_f_sin;
+	gchip->direction_output =  sppctlgpio_f_sou;
+	gchip->get =               sppctlgpio_f_get;
+	gchip->set =               sppctlgpio_f_set;
+	gchip->set_config =        sppctlgpio_f_scf;
+	gchip->dbg_show =          sppctlgpio_f_dsh;
+	gchip->base =              0; // it is main platform GPIO controller
+	gchip->ngpio =             GPIS_listSZ;
+	gchip->names =             sppctlgpio_list_s;
+	gchip->can_sleep =         0;
+#if defined(CONFIG_OF_GPIO)
+	gchip->of_node =           np;
+#ifdef CONFIG_PINCTRL_SPPCTL
+	gchip->of_gpio_n_cells =   2;
+#endif
+#endif
+	gchip->to_irq =            sppctlgpio_i_map;
+
+	_pctrlp->gpio_range.npins = gchip->ngpio;
+	_pctrlp->gpio_range.base =  gchip->base;
+	_pctrlp->gpio_range.name =  gchip->label;
+	_pctrlp->gpio_range.gc =    gchip;
+
+	// FIXME: can't set pc globally
+	err = devm_gpiochip_add_data(&(_pd->dev), gchip, pc);
+	if (err < 0) {
+		KERR(&(_pd->dev), "gpiochip add failed\n");
+		return err;
+	}
+
+	npins = platform_irq_count(_pd);
+	for (i = 0; i < npins && i < SPPCTL_GPIO_IRQS; i++) {
+		pc->irq[i] = irq_of_parse_and_map(np, i);
+		KDBG(&(_pd->dev), "setting up irq#%d -> %d\n", i, pc->irq[i]);
+	}
+
+	spin_lock_init(&(pc->lock));
+
+	return 0;
+}
+
+int sppctl_gpio_del(struct platform_device *_pd, void *_datap)
+{
+	//struct sppctlgpio_chip_t *cp;
+
+	// FIXME: can't use globally now
+	//cp = platform_get_drvdata(_pd);
+	//if (cp == NULL)
+	//	return -ENODEV;
+	//gpiochip_remove(&(cp->chip));
+	// FIX: remove spinlock_t ?
+	return 0;
+}
diff --git a/drivers/pinctrl/sunplus/sppctl_gpio.h b/drivers/pinctrl/sunplus/sppctl_gpio.h
new file mode 100644
index 0000000..4708d17
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_gpio.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * GPIO Driver for Sunplus/Tibbo SP7021 controller
+ * Copyright (C) 2020 Sunplus Tech./Tibbo Tech.
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef SPPCTL_GPIO_H
+#define SPPCTL_GPIO_H
+
+#define SPPCTL_GPIO_IRQS 8
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/stringify.h>
+#include "sppctl.h"
+
+struct sppctlgpio_chip_t {
+	spinlock_t lock;
+	struct gpio_chip chip;
+	void __iomem *base0;   // MASTER , OE , OUT , IN
+	void __iomem *base1;   // I_INV , O_INV , OD
+	void __iomem *base2;   // GPIO_FIRST
+	int irq[SPPCTL_GPIO_IRQS];
+};
+
+extern const char * const sppctlgpio_list_s[];
+extern const size_t GPIS_listSZ;
+
+int sppctl_gpio_new(struct platform_device *_pd, void *_datap);
+int sppctl_gpio_del(struct platform_device *_pd, void *_datap);
+
+#ifdef CONFIG_PINCTRL_SPPCTL
+#define D_PIS(x, y) "P" __stringify(x) "_0" __stringify(y)
+#else
+#define D_PIS(x) "GPIO" __stringify(x)
+#endif
+
+// FIRST: MUX=0, GPIO=1
+enum muxF_MG_t {
+	muxF_M = 0,
+	muxF_G = 1,
+	muxFKEEP = 2,
+};
+// MASTER: IOP=0,GPIO=1
+enum muxM_IG_t {
+	muxM_I = 0,
+	muxM_G = 1,
+	muxMKEEP = 2,
+};
+
+#endif // SPPCTL_GPIO_H
diff --git a/drivers/pinctrl/sunplus/sppctl_gpio_ops.c b/drivers/pinctrl/sunplus/sppctl_gpio_ops.c
new file mode 100644
index 0000000..9f68fb4
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_gpio_ops.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO Driver for Sunplus/Tibbo SP7021 controller
+ * Copyright (C) 2020 Sunplus Tech./Tibbo Tech.
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/seq_file.h>
+#include <linux/io.h>
+
+#include "sppctl_gpio.h"
+#include "sppctl_gpio_ops.h"
+
+#define SPPCTL_GPIO_OFF_GFR     0x00
+#define SPPCTL_GPIO_OFF_CTL     0x00
+#define SPPCTL_GPIO_OFF_OE      0x20
+#define SPPCTL_GPIO_OFF_OUT     0x40
+#define SPPCTL_GPIO_OFF_IN      0x60
+#define SPPCTL_GPIO_OFF_IINV    0x00
+#define SPPCTL_GPIO_OFF_OINV    0x20
+#define SPPCTL_GPIO_OFF_OD      0x40
+
+// (/16)*4
+#define R16_ROF(r)              (((r)>>4)<<2)
+#define R16_BOF(r)              ((r)%16)
+// (/32)*4
+#define R32_ROF(r)              (((r)>>5)<<2)
+#define R32_BOF(r)              ((r)%32)
+#define R32_VAL(r, boff)        (((r)>>(boff)) & BIT(0))
+
+// who is first: GPIO(1) | MUX(0)
+int sppctlgpio_u_gfrst(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = readl(pc->base2 + SPPCTL_GPIO_OFF_GFR + R32_ROF(_n));
+	//KINF(_c->parent, "u F r:%X = %d %px off:%d\n", r, R32_VAL(r,R32_BOF(_n)),
+	//	pc->base2, SPPCTL_GPIO_OFF_GFR + R32_ROF(_n));
+
+	return R32_VAL(r, R32_BOF(_n));
+}
+
+// who is master: GPIO(1) | IOP(0)
+int sppctlgpio_u_magpi(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = readl(pc->base0 + SPPCTL_GPIO_OFF_CTL + R16_ROF(_n));
+	//KINF(_c->parent, "u M r:%X = %d %px off:%d\n", r, R32_VAL(r,R16_BOF(_n)),
+	//	pc->base0, SPPCTL_GPIO_OFF_CTL + R16_ROF(_n));
+
+	return R32_VAL(r, R16_BOF(_n));
+}
+
+// set master: GPIO(1)|IOP(0), first:GPIO(1)|MUX(0)
+void sppctlgpio_u_magpi_set(struct gpio_chip *_c, unsigned int _n, enum muxF_MG_t _f,
+			    enum muxM_IG_t _m)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	// FIRST
+	if (_f != muxFKEEP) {
+		r = readl(pc->base2 + SPPCTL_GPIO_OFF_GFR + R32_ROF(_n));
+		//KINF(_c->parent, "F r:%X %px off:%d\n", r, pc->base2,
+		//	SPPCTL_GPIO_OFF_GFR + R32_ROF(_n));
+		if (_f != R32_VAL(r, R32_BOF(_n))) {
+			if (_f == muxF_G)
+				r |= BIT(R32_BOF(_n));
+			else
+				r &= ~BIT(R32_BOF(_n));
+			//KINF(_c->parent, "F w:%X\n", r);
+			writel(r, pc->base2 + SPPCTL_GPIO_OFF_GFR + R32_ROF(_n));
+		}
+	}
+
+	// MASTER
+	if (_m != muxMKEEP) {
+		r = (BIT(R16_BOF(_n))<<16);
+		if (_m == muxM_G)
+			r |= BIT(R16_BOF(_n));
+		//KINF(_c->parent, "M w:%X %px off:%d\n", r, pc->base0,
+		//	SPPCTL_GPIO_OFF_CTL + R16_ROF(_n));
+		writel(r, pc->base0 + SPPCTL_GPIO_OFF_CTL + R16_ROF(_n));
+	}
+}
+
+// is inv: INVERTED(1) | NORMAL(0)
+int sppctlgpio_u_isinv(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+	u16 inv_off = SPPCTL_GPIO_OFF_IINV;
+
+	if (sppctlgpio_f_gdi(_c, _n) == 0)
+		inv_off = SPPCTL_GPIO_OFF_OINV;
+
+	r = readl(pc->base1 + inv_off + R16_ROF(_n));
+
+	return R32_VAL(r, R16_BOF(_n));
+}
+
+void sppctlgpio_u_siinv(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+	u16 inv_off = SPPCTL_GPIO_OFF_IINV;
+
+	r = (BIT(R16_BOF(_n))<<16) | BIT(R16_BOF(_n));
+	writel(r, pc->base1 + inv_off + R16_ROF(_n));
+}
+
+void sppctlgpio_u_soinv(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+	u16 inv_off = SPPCTL_GPIO_OFF_OINV;
+
+	r = (BIT(R16_BOF(_n))<<16) | BIT(R16_BOF(_n));
+	writel(r, pc->base1 + inv_off + R16_ROF(_n));
+}
+
+// is open-drain: YES(1) | NON(0)
+int sppctlgpio_u_isodr(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = readl(pc->base1 + SPPCTL_GPIO_OFF_OD + R16_ROF(_n));
+
+	return R32_VAL(r, R16_BOF(_n));
+}
+
+void sppctlgpio_u_seodr(struct gpio_chip *_c, unsigned int _n, unsigned int _v)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = (BIT(R16_BOF(_n))<<16) | ((_v & BIT(0)) << R16_BOF(_n));
+	writel(r, pc->base1 + SPPCTL_GPIO_OFF_OD + R16_ROF(_n));
+}
+
+// get dir: 0=out, 1=in, -E =err (-EINVAL for ex): OE inverted on ret
+int sppctlgpio_f_gdi(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = readl(pc->base0 + SPPCTL_GPIO_OFF_OE + R16_ROF(_n));
+
+	return R32_VAL(r, R16_BOF(_n)) ^ BIT(0);
+}
+
+// set to input: 0:ok: OE=0
+int sppctlgpio_f_sin(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = (BIT(R16_BOF(_n))<<16);
+	writel(r, pc->base0 + SPPCTL_GPIO_OFF_OE + R16_ROF(_n));
+
+	return 0;
+}
+
+// set to output: 0:ok: OE=1,O=_v
+int sppctlgpio_f_sou(struct gpio_chip *_c, unsigned int _n, int _v)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = (BIT(R16_BOF(_n))<<16) | BIT(R16_BOF(_n));
+	writel(r, pc->base0 + SPPCTL_GPIO_OFF_OE + R16_ROF(_n));
+	if (_v < 0)
+		return 0;
+	r = (BIT(R16_BOF(_n))<<16) | ((_v & BIT(0)) << R16_BOF(_n));
+	writel(r, pc->base0 + SPPCTL_GPIO_OFF_OUT + R16_ROF(_n));
+
+	return 0;
+}
+
+// get value for signal: 0=low | 1=high | -err
+int sppctlgpio_f_get(struct gpio_chip *_c, unsigned int _n)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = readl(pc->base0 + SPPCTL_GPIO_OFF_IN + R32_ROF(_n));
+
+	return R32_VAL(r, R32_BOF(_n));
+}
+
+// OUT only: can't call set on IN pin: protected by gpio_chip layer
+void sppctlgpio_f_set(struct gpio_chip *_c, unsigned int _n, int _v)
+{
+	u32 r;
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	r = (BIT(R16_BOF(_n))<<16) | (_v & 0x0001) << R16_BOF(_n);
+	writel(r, pc->base0 + SPPCTL_GPIO_OFF_OUT + R16_ROF(_n));
+}
+
+// FIX: test in-depth
+int sppctlgpio_f_scf(struct gpio_chip *_c, unsigned int _n, unsigned long _conf)
+{
+	u32 r;
+	int ret = 0;
+	enum pin_config_param cp = pinconf_to_config_param(_conf);
+	u16 ca = pinconf_to_config_argument(_conf);
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	KDBG(_c->parent, "f_scf(%03d,%lX) p:%d a:%d\n", _n, _conf, cp, ca);
+	switch (cp) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		r = (BIT(R16_BOF(_n))<<16) | BIT(R16_BOF(_n));
+		writel(r, pc->base1 + SPPCTL_GPIO_OFF_OD + R16_ROF(_n));
+		break;
+
+	case PIN_CONFIG_INPUT_ENABLE:
+		KERR(_c->parent, "f_scf(%03d,%lX) input enable arg:%d\n", _n, _conf, ca);
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		ret = sppctlgpio_f_sou(_c, _n, 0);
+		break;
+
+	case PIN_CONFIG_PERSIST_STATE:
+		KDBG(_c->parent, "f_scf(%03d,%lX) not support pinconf:%d\n", _n, _conf, cp);
+		ret = -EOPNOTSUPP;
+		break;
+
+	default:
+		KDBG(_c->parent, "f_scf(%03d,%lX) unknown pinconf:%d\n", _n, _conf, cp);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+#ifdef CONFIG_DEBUG_FS
+void sppctlgpio_f_dsh(struct seq_file *_s, struct gpio_chip *_c)
+{
+	int i;
+	const char *label;
+
+	for (i = 0; i < _c->ngpio; i++) {
+		label = gpiochip_is_requested(_c, i);
+		if (!label)
+			label = "";
+
+		seq_printf(_s, " gpio-%03d (%-16.16s | %-16.16s)", i + _c->base,
+			   _c->names[i], label);
+		seq_printf(_s, " %c", sppctlgpio_f_gdi(_c, i) == 0 ? 'O' : 'I');
+		seq_printf(_s, ":%d", sppctlgpio_f_get(_c, i));
+		seq_printf(_s, " %s", (sppctlgpio_u_gfrst(_c, i) ? "gpi" : "mux"));
+		seq_printf(_s, " %s", (sppctlgpio_u_magpi(_c, i) ? "gpi" : "iop"));
+		seq_printf(_s, " %s", (sppctlgpio_u_isinv(_c, i) ? "inv" : "   "));
+		seq_printf(_s, " %s", (sppctlgpio_u_isodr(_c, i) ? "oDr" : ""));
+		seq_puts(_s, "\n");
+	}
+}
+#else
+#define sppctlgpio_f_dsh NULL
+#endif
+
+int sppctlgpio_i_map(struct gpio_chip *_c, unsigned int _off)
+{
+	struct sppctlgpio_chip_t *pc = (struct sppctlgpio_chip_t *)gpiochip_get_data(_c);
+
+	if (_off >= 8 && _off < 15)
+		return pc->irq[_off - 8];
+
+	return -ENXIO;
+}
diff --git a/drivers/pinctrl/sunplus/sppctl_gpio_ops.h b/drivers/pinctrl/sunplus/sppctl_gpio_ops.h
new file mode 100644
index 0000000..05928d4
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_gpio_ops.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * GPIO Driver for Sunplus/Tibbo SP7021 controller
+ * Copyright (C) 2020 Sunplus Tech./Tibbo Tech.
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef SPPCTL_GPIO_OPS_H
+#define SPPCTL_GPIO_OPS_H
+
+#include "sppctl_gpio.h"
+
+// who is first: GPIO(1) | MUX(0)
+int sppctlgpio_u_gfrst(struct gpio_chip *_c, unsigned int _n);
+
+// who is master: GPIO(1) | IOP(0)
+int sppctlgpio_u_magpi(struct gpio_chip *_c, unsigned int _n);
+
+// set MASTER and FIRST
+void sppctlgpio_u_magpi_set(struct gpio_chip *_c, unsigned int _n,
+			    enum muxF_MG_t _f, enum muxM_IG_t _m);
+
+// is inv: INVERTED(1) | NORMAL(0)
+int sppctlgpio_u_isinv(struct gpio_chip *_c, unsigned int _n);
+// set (I|O)inv
+void sppctlgpio_u_siinv(struct gpio_chip *_c, unsigned int _n);
+void sppctlgpio_u_soinv(struct gpio_chip *_c, unsigned int _n);
+
+// is open-drain: YES(1) | NON(0)
+int sppctlgpio_u_isodr(struct gpio_chip *_c, unsigned int _n);
+void sppctlgpio_u_seodr(struct gpio_chip *_c, unsigned int _n, unsigned int _v);
+
+// get dir: 0=out, 1=in, -E =err (-EINVAL for ex): OE inverted on ret
+int sppctlgpio_f_gdi(struct gpio_chip *_c, unsigned int _n);
+
+// set to input: 0:ok: OE=0
+int sppctlgpio_f_sin(struct gpio_chip *_c, unsigned int _n);
+
+// set to output: 0:ok: OE=1,O=_v
+int sppctlgpio_f_sou(struct gpio_chip *_c, unsigned int _n, int _v);
+
+// get value for signal: 0=low | 1=high | -err
+int sppctlgpio_f_get(struct gpio_chip *_c, unsigned int _n);
+
+// OUT only: can't call set on IN pin: protected by gpio_chip layer
+void sppctlgpio_f_set(struct gpio_chip *_c, unsigned int _n, int _v);
+
+// FIX: test in-depth
+int sppctlgpio_f_scf(struct gpio_chip *_c, unsigned int _n, unsigned long _conf);
+
+#ifdef CONFIG_DEBUG_FS
+void sppctlgpio_f_dsh(struct seq_file *_s, struct gpio_chip *_c);
+#else
+#define sppctlgpio_f_dsh NULL
+#endif
+
+#ifdef CONFIG_OF_GPIO
+int sppctlgpio_xlate(struct gpio_chip *_c, const struct of_phandle_args *_a,
+		     u32 *_flags);
+#endif
+
+int sppctlgpio_i_map(struct gpio_chip *_c, unsigned int _off);
+
+#endif // SPPCTL_GPIO_OPS_H
diff --git a/drivers/pinctrl/sunplus/sppctl_pinctrl.c b/drivers/pinctrl/sunplus/sppctl_pinctrl.c
new file mode 100644
index 0000000..e1bace5
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_pinctrl.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "../devicetree.h"
+#include "sppctl_pinctrl.h"
+#include "sppctl_gpio_ops.h"
+
+#ifdef CONFIG_PINCTRL_SPPCTL
+#define SUPPORT_PINMUX
+#endif
+
+char const **unq_grps;
+size_t unq_grpsSZ;
+struct grp2fp_map_t *g2fp_maps;
+
+int stpctl_c_p_get(struct pinctrl_dev *_pd, unsigned int _pin, unsigned long *_cfg)
+{
+	struct sppctl_pdata_t *pctrl = pinctrl_dev_get_drvdata(_pd);
+	unsigned int param = pinconf_to_config_param(*_cfg);
+	unsigned int arg = 0;
+
+	KDBG(_pd->dev, "%s(%d)\n", __func__, _pin);
+	switch (param) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		if (!sppctlgpio_u_isodr(&(pctrl->gpiod->chip), _pin))
+			return -EINVAL;
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		if (!sppctlgpio_u_gfrst(&(pctrl->gpiod->chip), _pin))
+			return -EINVAL;
+		if (!sppctlgpio_u_magpi(&(pctrl->gpiod->chip), _pin))
+			return -EINVAL;
+		if (sppctlgpio_f_gdi(&(pctrl->gpiod->chip), _pin) != 0)
+			return -EINVAL;
+		arg = sppctlgpio_f_get(&(pctrl->gpiod->chip), _pin);
+		break;
+
+	default:
+		//KINF(_pd->dev, "%s(%d) skipping:x%X\n", __FUNCTION__, _pin, param);
+		return -EOPNOTSUPP;
+	}
+	*_cfg = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+int stpctl_c_p_set(struct pinctrl_dev *_pd, unsigned int _pin, unsigned long *_ca,
+		   unsigned int _clen)
+{
+	struct sppctl_pdata_t *pctrl = pinctrl_dev_get_drvdata(_pd);
+	int i = 0;
+
+	KDBG(_pd->dev, "%s(%d,%ld,%d)\n", __func__, _pin, *_ca, _clen);
+	// special handling for IOP
+	if (_ca[i] == 0xFF) {
+		sppctlgpio_u_magpi_set(&(pctrl->gpiod->chip), _pin, muxF_G, muxM_I);
+		return 0;
+	}
+
+	for (i = 0; i < _clen; i++) {
+		if (_ca[i] & SPPCTL_PCTL_L_OUT) {
+			KDBG(_pd->dev, "%d:OUT\n", i);
+			sppctlgpio_f_sou(&(pctrl->gpiod->chip), _pin, 0);
+		}
+		if (_ca[i] & SPPCTL_PCTL_L_OU1) {
+			KDBG(_pd->dev, "%d:OU1\n", i);
+			sppctlgpio_f_sou(&(pctrl->gpiod->chip), _pin, 1);
+		}
+		if (_ca[i] & SPPCTL_PCTL_L_INV) {
+			KDBG(_pd->dev, "%d:INV\n", i);
+			sppctlgpio_u_siinv(&(pctrl->gpiod->chip), _pin);
+		}
+		if (_ca[i] & SPPCTL_PCTL_L_ONV) {
+			KDBG(_pd->dev, "%d:ONV\n", i);
+			sppctlgpio_u_soinv(&(pctrl->gpiod->chip), _pin);
+		}
+		if (_ca[i] & SPPCTL_PCTL_L_ODR) {
+			KDBG(_pd->dev, "%d:ODR\n", i);
+			sppctlgpio_u_seodr(&(pctrl->gpiod->chip), _pin, 1);
+		}
+		// FIXME: add pullup/pulldown, irq enable/disable
+	}
+
+	return 0;
+}
+
+int stpctl_c_g_get(struct pinctrl_dev *_pd, unsigned int _gid, unsigned long *_config)
+{
+	// KINF(_pd->dev, "%s(%d)\n", __FUNCTION__, _gid);
+	// FIXME: add data
+	return 0;
+}
+
+int stpctl_c_g_set(struct pinctrl_dev *_pd, unsigned int _gid, unsigned long *_configs,
+		   unsigned int _num_configs)
+{
+	// KINF(_pd->dev, "%s(%d,,%d)\n", __FUNCTION__, _gid, _num_configs);
+	// FIXME: delete ?
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+void stpctl_c_d_show(struct pinctrl_dev *_pd, struct seq_file *s, unsigned int _off)
+{
+	// KINF(_pd->dev, "%s(%d)\n", __FUNCTION__, _off);
+	seq_printf(s, " %s", dev_name(_pd->dev));
+}
+
+void stpctl_c_d_group_show(struct pinctrl_dev *_pd, struct seq_file *s, unsigned int _gid)
+{
+	// group: freescale/pinctrl-imx.c, 448
+	// KINF(_pd->dev, "%s(%d)\n", __FUNCTION__, _gid);
+}
+
+void stpctl_c_d_config_show(struct pinctrl_dev *_pd, struct seq_file *s, unsigned long _config)
+{
+	// KINF(_pd->dev, "%s(%ld)\n", __FUNCTION__, _config);
+}
+#else
+#define stpctl_c_d_show NULL
+#define stpctl_c_d_group_show NULL
+#define stpctl_c_d_config_show NULL
+#endif
+
+static struct pinconf_ops sppctl_pconf_ops = {
+	.is_generic                 = true,
+	.pin_config_get             = stpctl_c_p_get,
+	.pin_config_set             = stpctl_c_p_set,
+	//.pin_config_group_get       = stpctl_c_g_get,
+	//.pin_config_group_set       = stpctl_c_g_set,
+	.pin_config_dbg_show        = stpctl_c_d_show,
+	.pin_config_group_dbg_show  = stpctl_c_d_group_show,
+	.pin_config_config_dbg_show = stpctl_c_d_config_show,
+};
+
+int stpctl_m_req(struct pinctrl_dev *_pd, unsigned int _pin)
+{
+	KDBG(_pd->dev, "%s(%d)\n", __func__, _pin);
+	return 0;
+}
+
+int stpctl_m_fre(struct pinctrl_dev *_pd, unsigned int _pin)
+{
+	KDBG(_pd->dev, "%s(%d)\n", __func__, _pin);
+	return 0;
+}
+
+int stpctl_m_f_cnt(struct pinctrl_dev *_pd)
+{
+	return list_funcsSZ;
+}
+
+const char *stpctl_m_f_nam(struct pinctrl_dev *_pd, unsigned int _fid)
+{
+	return list_funcs[_fid].name;
+}
+
+int stpctl_m_f_grp(struct pinctrl_dev *_pd, unsigned int _fid, const char * const **grps,
+		   unsigned int *_gnum)
+{
+	struct func_t *f = &(list_funcs[_fid]);
+
+	*_gnum = 0;
+	switch (f->freg) {
+	case fOFF_I:
+	case fOFF_0:   // gen GPIO/IOP: all groups = all pins
+		*_gnum = GPIS_listSZ;
+		*grps = sppctlgpio_list_s;
+		break;
+
+	case fOFF_M:   // pin-mux
+		*_gnum = PMUX_listSZ;
+		*grps = sppctlpmux_list_s;
+		break;
+
+	case fOFF_G:   // pin-group
+		if (!f->grps)
+			break;
+		*_gnum = f->gnum;
+		*grps = (const char * const *)f->grps_sa;
+		break;
+
+	default:
+		KERR(_pd->dev, "%s(_fid:%d) unknown fOFF %d\n", __func__, _fid, f->freg);
+		break;
+	}
+
+	KDBG(_pd->dev, "%s(_fid:%d) %d\n", __func__, _fid, *_gnum);
+	return 0;
+}
+
+int stpctl_m_mux(struct pinctrl_dev *_pd, unsigned int _fid, unsigned int _gid)
+{
+	int i = -1, j = -1;
+	struct sppctl_pdata_t *pctrl = pinctrl_dev_get_drvdata(_pd);
+	struct func_t *f = &(list_funcs[_fid]);
+
+	struct grp2fp_map_t g2fpm = g2fp_maps[_gid];
+
+	KDBG(_pd->dev, "%s(fun:%d,grp:%d)\n", __func__, _fid, _gid);
+	switch (f->freg) {
+	case fOFF_0:   // GPIO. detouch from all funcs - ?
+		for (i = 0; i < list_funcsSZ; i++) {
+			if (list_funcs[i].freg != fOFF_M)
+				continue;
+			j++;
+			if (sppctl_fun_get(pctrl, j) != _gid)
+				continue;
+			sppctl_pin_set(pctrl, 0, j);
+		}
+		break;
+
+	case fOFF_M:   // MUX :
+		sppctlgpio_u_magpi_set(&(pctrl->gpiod->chip), _gid, muxF_M, muxMKEEP);
+		sppctl_pin_set(pctrl, (_gid == 0 ? _gid : _gid - 7), _fid - 2);    // pin, fun FIXME
+		break;
+
+	case fOFF_G:   // GROUP
+		for (i = 0; i < f->grps[g2fpm.g_idx].pnum; i++)
+			sppctlgpio_u_magpi_set(&(pctrl->gpiod->chip), f->grps[g2fpm.g_idx].pins[i],
+					       muxF_M, muxMKEEP);
+		sppctl_gmx_set(pctrl, f->roff, f->boff, f->blen, f->grps[g2fpm.g_idx].gval);
+		break;
+
+	case fOFF_I:   // IOP
+		sppctlgpio_u_magpi_set(&(pctrl->gpiod->chip), _gid, muxF_G, muxM_I);
+		break;
+
+	default:
+		KERR(_pd->dev, "%s(_fid:%d) unknown fOFF %d\n", __func__, _fid, f->freg);
+		break;
+	}
+
+	return 0;
+}
+
+int stpctl_m_gpio_req(struct pinctrl_dev *_pd, struct pinctrl_gpio_range *range, unsigned int _pin)
+{
+	struct sppctl_pdata_t *pctrl = pinctrl_dev_get_drvdata(_pd);
+	struct pin_desc *pdesc;
+	int g_f, g_m;
+
+	KDBG(_pd->dev, "%s(%d)\n", __func__, _pin);
+	g_f = sppctlgpio_u_gfrst(&(pctrl->gpiod->chip), _pin);
+	g_m = sppctlgpio_u_magpi(&(pctrl->gpiod->chip), _pin);
+	if (g_f == muxF_G && g_m == muxM_G)
+		return 0;
+
+	pdesc = pin_desc_get(_pd, _pin);
+	// in non-gpio state: is it claimed already?
+	if (pdesc->mux_owner)
+		return -EACCES;
+
+	sppctlgpio_u_magpi_set(&(pctrl->gpiod->chip), _pin, muxF_G, muxM_G);
+	return 0;
+}
+
+void stpctl_m_gpio_fre(struct pinctrl_dev *_pd, struct pinctrl_gpio_range *range,
+		       unsigned int _pin)
+{
+	KDBG(_pd->dev, "%s(%d)\n", __func__, _pin);
+}
+int stpctl_m_gpio_sdir(struct pinctrl_dev *_pd, struct pinctrl_gpio_range *range,
+		       unsigned int _pin, bool _in)
+{
+	KDBG(_pd->dev, "%s(%d,%d)\n", __func__, _pin, _in);
+	return 0;
+}
+
+static const struct pinmux_ops sppctl_pinmux_ops = {
+	.request             = stpctl_m_req,
+	.free                = stpctl_m_fre,
+	.get_functions_count = stpctl_m_f_cnt,
+	.get_function_name   = stpctl_m_f_nam,
+	.get_function_groups = stpctl_m_f_grp,
+	.set_mux             = stpctl_m_mux,
+	.gpio_request_enable = stpctl_m_gpio_req,
+	.gpio_disable_free   = stpctl_m_gpio_fre,
+	.gpio_set_direction  = stpctl_m_gpio_sdir,
+	.strict              = 1
+};
+
+// all groups
+int stpctl_o_g_cnt(struct pinctrl_dev *_pd)
+{
+	return unq_grpsSZ;
+}
+
+const char *stpctl_o_g_nam(struct pinctrl_dev *_pd, unsigned int _gid)
+{
+	return unq_grps[_gid];
+}
+
+int stpctl_o_g_pins(struct pinctrl_dev *_pd, unsigned int _gid, const unsigned int **pins,
+		    unsigned int *num_pins)
+{
+	struct grp2fp_map_t g2fpm = g2fp_maps[_gid];
+	struct func_t *f = &(list_funcs[g2fpm.f_idx]);
+
+	KDBG(_pd->dev, "grp-pins g:%d f_idx:%d,g_idx:%d freg:%d...\n", _gid, g2fpm.f_idx,
+	     g2fpm.g_idx, f->freg);
+	*num_pins = 0;
+
+	// MUX | GPIO | IOP: 1 pin -> 1 group
+	if (f->freg != fOFF_G) {
+		*num_pins = 1;
+		*pins = &sppctlpins_G[_gid];
+		return 0;
+	}
+
+	// IOP (several pins at once in a group)
+	if (!f->grps)
+		return 0;
+	if (f->gnum < 1)
+		return 0;
+	*num_pins = f->grps[g2fpm.g_idx].pnum;
+	*pins = f->grps[g2fpm.g_idx].pins;
+
+	return 0;
+}
+
+// /sys/kernel/debug/pinctrl/sppctl/pins add: gpio_first and ctrl_sel
+#ifdef CONFIG_DEBUG_FS
+void stpctl_o_show(struct pinctrl_dev *_pd, struct seq_file *_s, unsigned int _n)
+{
+	struct sppctl_pdata_t *p = pinctrl_dev_get_drvdata(_pd);
+	const char *tmpp;
+	uint8_t g_f, g_m;
+
+	seq_printf(_s, "%s", dev_name(_pd->dev));
+	g_f = sppctlgpio_u_gfrst(&(p->gpiod->chip), _n);
+	g_m = sppctlgpio_u_magpi(&(p->gpiod->chip), _n);
+
+	tmpp = "?";
+	if (g_f &&  g_m)
+		tmpp = "GPIO";
+	if (g_f && !g_m)
+		tmpp = " IOP";
+	if (!g_f)
+		tmpp = " MUX";
+	seq_printf(_s, " %s", tmpp);
+}
+#else
+#define stpctl_ops_show NULL
+#endif
+
+int stpctl_o_n2map(struct pinctrl_dev *_pd, struct device_node *_dn, struct pinctrl_map **_map,
+		   unsigned int *_nm)
+{
+	struct sppctl_pdata_t *pctrl = pinctrl_dev_get_drvdata(_pd);
+	struct device_node *parent;
+	u32 dt_pin, dt_fun;
+	u8 p_p, p_g, p_f, p_l;
+	unsigned long *configs;
+	int i, size = 0;
+	const __be32 *list = of_get_property(_dn, "pins", &size);
+	struct property *prop;
+	const char *s_f, *s_g;
+	int nmG = of_property_count_strings(_dn, "groups");
+	struct func_t *f = NULL;
+
+	//print_device_tree_node(_dn, 0);
+	if (nmG <= 0)
+		nmG = 0;
+
+	parent = of_get_parent(_dn);
+	*_nm = size/sizeof(*list);
+
+	// Check if out of range or invalid?
+	for (i = 0; i < (*_nm); i++) {
+		dt_pin = be32_to_cpu(list[i]);
+		p_p = SPPCTL_PCTLD_P(dt_pin);
+		p_g = SPPCTL_PCTLD_G(dt_pin);
+
+		if ((p_p >= sppctlpins_allSZ)
+#ifndef SUPPORT_PINMUX
+			|| (p_g == SPPCTL_PCTL_G_PMUX)
+#endif
+		) {
+			KDBG(_pd->dev, "Invalid pin property at index %d (0x%08x)\n", i, dt_pin);
+			return -EINVAL;
+		}
+	}
+
+	*_map = kcalloc(*_nm + nmG, sizeof(**_map), GFP_KERNEL);
+	for (i = 0; i < (*_nm); i++) {
+		dt_pin = be32_to_cpu(list[i]);
+		p_p = SPPCTL_PCTLD_P(dt_pin);
+		p_g = SPPCTL_PCTLD_G(dt_pin);
+		p_f = SPPCTL_PCTLD_F(dt_pin);
+		p_l = SPPCTL_PCTLD_L(dt_pin);
+		(*_map)[i].name = parent->name;
+		KDBG(_pd->dev, "map [%d]=%08x p=%d g=%d f=%d l=%d\n", i, dt_pin, p_p, p_g,
+		     p_f, p_l);
+
+		if (p_g == SPPCTL_PCTL_G_GPIO) {
+			// look into parse_dt_cfg(),
+			(*_map)[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
+			(*_map)[i].data.configs.num_configs = 1;
+			(*_map)[i].data.configs.group_or_pin = pin_get_name(_pd, p_p);
+			configs = kcalloc(1, sizeof(*configs), GFP_KERNEL);
+			*configs = p_l;
+			(*_map)[i].data.configs.configs = configs;
+
+			KDBG(_pd->dev, "%s(%d) = x%X\n", (*_map)[i].data.configs.group_or_pin,
+			     p_p, p_l);
+		} else if (p_g == SPPCTL_PCTL_G_IOPP) {
+			(*_map)[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
+			(*_map)[i].data.configs.num_configs = 1;
+			(*_map)[i].data.configs.group_or_pin = pin_get_name(_pd, p_p);
+			configs = kcalloc(1, sizeof(*configs), GFP_KERNEL);
+			*configs = 0xFF;
+			(*_map)[i].data.configs.configs = configs;
+
+			KDBG(_pd->dev, "%s(%d) = x%X\n", (*_map)[i].data.configs.group_or_pin,
+			     p_p, p_l);
+		} else {
+			(*_map)[i].type = PIN_MAP_TYPE_MUX_GROUP;
+			(*_map)[i].data.mux.function = list_funcs[p_f].name;
+			(*_map)[i].data.mux.group = pin_get_name(_pd, p_p);
+
+			KDBG(_pd->dev, "f->p: %s(%d)->%s(%d)\n", (*_map)[i].data.mux.function,
+			     p_f, (*_map)[i].data.mux.group, p_p);
+		}
+	}
+
+	// handle pin-group function
+	if (nmG > 0 && of_property_read_string(_dn, "function", &s_f) == 0) {
+		KDBG(_pd->dev, "found func: %s\n", s_f);
+		of_property_for_each_string(_dn, "groups", prop, s_g) {
+			KDBG(_pd->dev, " %s: %s\n", s_f, s_g);
+			(*_map)[*_nm].type = PIN_MAP_TYPE_MUX_GROUP;
+			(*_map)[*_nm].data.mux.function = s_f;
+			(*_map)[*_nm].data.mux.group = s_g;
+			KDBG(_pd->dev, "f->g: %s->%s\n", (*_map)[*_nm].data.mux.function,
+			     (*_map)[*_nm].data.mux.group);
+			(*_nm)++;
+		}
+	}
+
+	// handle zero function
+	list = of_get_property(_dn, "zero_func", &size);
+	if (list) {
+		for (i = 0; i < size/sizeof(*list); i++) {
+			dt_fun = be32_to_cpu(list[i]);
+			if (dt_fun >= list_funcsSZ) {
+				KERR(_pd->dev, "zero func %d out of range\n", dt_fun);
+				continue;
+			}
+
+			f = &(list_funcs[dt_fun]);
+			switch (f->freg) {
+			case fOFF_M:
+				KDBG(_pd->dev, "zero func: %d (%s)\n", dt_fun, f->name);
+				sppctl_pin_set(pctrl, 0, dt_fun - 2);
+				break;
+
+			case fOFF_G:
+				KDBG(_pd->dev, "zero group: %d (%s)\n", dt_fun, f->name);
+				sppctl_gmx_set(pctrl, f->roff, f->boff, f->blen, 0);
+				break;
+
+			default:
+				KERR(_pd->dev, "wrong zero group: %d (%s)\n", dt_fun, f->name);
+				break;
+			}
+		}
+	}
+
+	of_node_put(parent);
+	KDBG(_pd->dev, "%d pins mapped\n", *_nm);
+	return 0;
+}
+
+void stpctl_o_mfre(struct pinctrl_dev *_pd, struct pinctrl_map *_map, unsigned int num_maps)
+{
+	//KINF(_pd->dev, "%s(%d)\n", __FUNCTION__, num_maps);
+	// FIXME: test
+	pinctrl_utils_free_map(_pd, _map, num_maps);
+}
+
+static const struct pinctrl_ops sppctl_pctl_ops = {
+	.get_groups_count = stpctl_o_g_cnt,
+	.get_group_name   = stpctl_o_g_nam,
+	.get_group_pins   = stpctl_o_g_pins,
+#ifdef CONFIG_DEBUG_FS
+	.pin_dbg_show     = stpctl_o_show,
+#endif
+	.dt_node_to_map   = stpctl_o_n2map,
+	.dt_free_map      = stpctl_o_mfre,
+};
+
+// creates unq_grps[] uniq group names array char *
+// sets unq_grpsSZ
+// creates XXX[group_idx]{func_idx, pins_idx}
+void group_groups(struct platform_device *_pd)
+{
+	int i, k, j = 0;
+
+	// fill array of all groups
+	unq_grps = NULL;
+	unq_grpsSZ = GPIS_listSZ;
+
+	// calc unique group names array size
+	for (i = 0; i < list_funcsSZ; i++) {
+		if (list_funcs[i].freg != fOFF_G)
+			continue;
+		unq_grpsSZ += list_funcs[i].gnum;
+	}
+
+	// fill up unique group names array
+	unq_grps = devm_kzalloc(&(_pd->dev), (unq_grpsSZ + 1)*sizeof(char *), GFP_KERNEL);
+	g2fp_maps = devm_kzalloc(&(_pd->dev), (unq_grpsSZ + 1)*sizeof(struct grp2fp_map_t),
+				 GFP_KERNEL);
+
+	// groups == pins
+	j = 0;
+	for (i = 0; i < GPIS_listSZ; i++) {
+		unq_grps[i] = sppctlgpio_list_s[i];
+		g2fp_maps[i].f_idx = 0;
+		g2fp_maps[i].g_idx = i;
+	}
+	j = GPIS_listSZ;
+
+	// +IOP groups
+	for (i = 0; i < list_funcsSZ; i++) {
+		if (list_funcs[i].freg != fOFF_G)
+			continue;
+
+		for (k = 0; k < list_funcs[i].gnum; k++) {
+			list_funcs[i].grps_sa[k] = (char *)list_funcs[i].grps[k].name;
+			unq_grps[j] = list_funcs[i].grps[k].name;
+			g2fp_maps[j].f_idx = i;
+			g2fp_maps[j].g_idx = k;
+			j++;
+		}
+	}
+	KINF(&(_pd->dev), "funcs: %zd unq_grps: %zd\n", list_funcsSZ, unq_grpsSZ);
+}
+
+// ---------- main (exported) functions
+int sppctl_pinctrl_init(struct platform_device *_pd)
+{
+	int err;
+	struct device *dev = &_pd->dev;
+	struct device_node *np = of_node_get(dev->of_node);
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_pd->dev.platform_data;
+
+	// init pdesc
+	_p->pdesc.owner = THIS_MODULE;
+	_p->pdesc.name = dev_name(&(_pd->dev));
+	_p->pdesc.pins = &(sppctlpins_all[0]);
+	_p->pdesc.npins = sppctlpins_allSZ;
+	_p->pdesc.pctlops = &sppctl_pctl_ops;
+	_p->pdesc.confops = &sppctl_pconf_ops;
+	_p->pdesc.pmxops = &sppctl_pinmux_ops;
+
+	group_groups(_pd);
+
+	err = devm_pinctrl_register_and_init(&(_pd->dev), &(_p->pdesc), _p, &(_p->pcdp));
+	if (err) {
+		KERR(&(_pd->dev), "Failed to register\n");
+		of_node_put(np);
+		return err;
+	}
+
+	pinctrl_enable(_p->pcdp);
+	return 0;
+}
+
+void sppctl_pinctrl_clea(struct platform_device *_pd)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_pd->dev.platform_data;
+
+	devm_pinctrl_unregister(&(_pd->dev), _p->pcdp);
+}
diff --git a/drivers/pinctrl/sunplus/sppctl_pinctrl.h b/drivers/pinctrl/sunplus/sppctl_pinctrl.h
new file mode 100644
index 0000000..a634c41
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_pinctrl.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef SPPCTL_PINCTRL_H
+#define SPPCTL_PINCTRL_H
+
+#include "sppctl.h"
+
+
+int sppctl_pinctrl_init(struct platform_device *_pdev);
+void sppctl_pinctrl_clea(struct platform_device *_pdev);
+
+#define D(x, y) ((x)*8+(y))
+
+extern const struct pinctrl_pin_desc sppctlpins_all[];
+extern const size_t sppctlpins_allSZ;
+extern const unsigned int sppctlpins_G[];
+
+#endif // SPPCTL_PINCTRL_H
diff --git a/drivers/pinctrl/sunplus/sppctl_sysfs.c b/drivers/pinctrl/sunplus/sppctl_sysfs.c
new file mode 100644
index 0000000..7fe54bb
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_sysfs.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "sppctl_sysfs.h"
+#include "sppctl_gpio_ops.h"
+#include "sppctl_pinctrl.h"
+
+
+static ssize_t sppctl_sop_name_R(struct device *_d, struct device_attribute *_a, char *_b)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_d->platform_data;
+
+	return sprintf(_b, "%s\n", _p->name);
+}
+
+static ssize_t sppctl_sop_dbgi_R(struct device *_d, struct device_attribute *_a, char *_b)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_d->platform_data;
+
+	return sprintf(_b, "%d\n", _p->debug);
+}
+
+static ssize_t sppctl_sop_dbgi_W(struct device *_d, struct device_attribute *_a, const char *_b,
+				 size_t _c)
+{
+	int x;
+
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_d->platform_data;
+
+	if (kstrtoint(_b, 10, &x) < 0)
+		return -EIO;
+	_p->debug = x;
+
+	return _c;
+}
+
+static ssize_t sppctl_sop_fwname_R(struct device *_d, struct device_attribute *_a, char *_b)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_d->platform_data;
+
+	return sprintf(_b, "%s", _p->fwname);
+}
+
+static ssize_t sppctl_sop_fwname_W(struct device *_d, struct device_attribute *_a, const char *_b,
+				   size_t _c)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_d->platform_data;
+
+	strcpy(_p->fwname, _b);
+	if (_p->fwname[strlen(_p->fwname)-1] == 0x0A)
+		_p->fwname[strlen(_p->fwname)-1] = 0;
+	sppctl_loadfw(_d, _p->fwname);
+
+	return _c;
+}
+
+static ssize_t sppctl_sop_list_muxes_R(struct file *filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t off, size_t count)
+{
+	int i = -1, ret = 0, pos = off;
+	const char *tmpp;
+	struct sppctl_pdata_t *_p = NULL;
+	struct device *_pdev = container_of(_k, struct device, kobj);
+
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	for (i = 0; i < list_funcsSZ; i++) {
+		if (list_funcs[i].freg == fOFF_0)
+			continue;
+		if (list_funcs[i].freg == fOFF_I)
+			continue;
+		tmpp = list_funcs[i].name;
+		if (pos > 0) {
+			pos -= (strlen(tmpp) + 1);
+			continue;
+		}
+		sprintf(_b + ret, "%s\n", tmpp);
+		ret += strlen(tmpp) + 1;
+		if (ret > SPPCTL_MAX_BUF - SPPCTL_MAX_NAM)
+			break;
+	}
+
+	return ret;
+}
+
+static ssize_t sppctl_sop_txt_map_R(struct file *filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t off, size_t count)
+{
+	int i = -1, j = 0, ret = 0, pos = off;
+	char tmps[SPPCTL_MAX_NAM + 3];
+	uint8_t pin = 0;
+	struct sppctl_pdata_t *_p = NULL;
+	struct func_t *f;
+	struct device *_pdev = container_of(_k, struct device, kobj);
+
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	for (i = 0; i < list_funcsSZ; i++) {
+		f = &(list_funcs[i]);
+		pin = 0;
+		if (f->freg == fOFF_0)
+			continue;
+		if (f->freg == fOFF_I)
+			continue;
+		memset(tmps, 0, SPPCTL_MAX_NAM + 3);
+
+		// muxable pins are P1_xx, stored -7, absolute idx = +7
+		pin = sppctl_fun_get(_p, j++);
+		if (f->freg == fOFF_M && pin > 0)
+			pin += 7;
+		if (f->freg == fOFF_G)
+			pin = sppctl_gmx_get(_p, f->roff, f->boff, f->blen);
+		sprintf(tmps, "%03d %s", pin, f->name);
+
+		if (pos > 0) {
+			pos -= (strlen(tmps) + 1);
+			continue;
+		}
+		sprintf(_b + ret, "%s\n", tmps);
+		ret += strlen(tmps) + 1;
+		if (ret > SPPCTL_MAX_BUF - SPPCTL_MAX_NAM)
+			break;
+	}
+
+	return ret;
+}
+
+static ssize_t sppctl_sop_func_R(struct file *_filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t _off, size_t _count)
+{
+	struct device *_pdev = NULL;
+	struct sppctl_sdata_t *sdp = NULL;
+	struct sppctl_pdata_t *_p = NULL;
+	struct func_t *f;
+
+	if (_off > 0)
+		return 0;
+
+	_pdev = container_of(_k, struct device, kobj);
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	sdp = (struct sppctl_sdata_t *)_a->private;
+	if (!sdp)
+		return -ENXIO;
+
+	f = &(list_funcs[sdp->i]);
+	if (f->freg == fOFF_M)
+		_b[0] = sppctl_fun_get(_p, sdp->ridx);
+	if (f->freg == fOFF_G)
+		_b[0] = sppctl_gmx_get(_p, f->roff, f->boff, f->blen);
+	_b[1] = 0x00;
+	if (_p->debug)
+		KDBG(_pdev, "%s(%s,i:%d) _b:%d\n", __func__, _a->attr.name, sdp->ridx, _b[0]);
+
+	return 1;
+}
+
+static ssize_t sppctl_sop_func_W(struct file *_filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t _off, size_t _count)
+{
+	struct device *_pdev = NULL;
+	struct sppctl_sdata_t *sdp = NULL;
+	struct sppctl_pdata_t *_p = NULL;
+	struct func_t *f;
+
+	if (_off > 0)
+		return 0;
+
+	_pdev = container_of(_k, struct device, kobj);
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	sdp = (struct sppctl_sdata_t *)_a->private;
+	if (!sdp)
+		return -ENXIO;
+
+	f = &(list_funcs[sdp->i]);
+	// for mux it should be PIN-7, case muxable pins start from 8'th
+	if (f->freg == fOFF_M)
+		sppctl_pin_set(_p, (_b[0] < 8 ? 0 : _b[0] - 7), sdp->ridx);
+	if (f->freg == fOFF_G)
+		sppctl_gmx_set(_p, f->roff, f->boff, f->blen, _b[0]);
+	if (_p->debug)
+		KDBG(_pdev, "%s(%s,i:%d) _b:%d\n", __func__, _a->attr.name, sdp->ridx, _b[0]);
+
+	return _count;
+}
+
+static ssize_t sppctl_sop_fw_R(struct file *filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t _off, size_t _count)
+{
+	int i = 0, j = 0, ret = 0, pos = _off;
+	uint8_t pin = 0;
+	struct sppctl_pdata_t *_p = NULL;
+	struct func_t *f;
+	struct device *_pdev = container_of(_k, struct device, kobj);
+
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	for (i = 0; i < list_funcsSZ && ret < _count; i++) {
+		f = &(list_funcs[i]);
+		if (f->freg == fOFF_0)
+			continue;
+		if (f->freg == fOFF_I)
+			continue;
+		if (f->freg == fOFF_M)
+			pin = sppctl_fun_get(_p, j++);
+		if (f->freg == fOFF_G)
+			pin = sppctl_gmx_get(_p, f->roff, f->boff, f->blen);
+		if (pos > 0) {
+			pos -= sizeof(pin);
+			continue;
+		}
+		_b[ret] = pin;
+		ret += sizeof(pin);
+		if (ret > SPPCTL_MAX_BUF - SPPCTL_MAX_NAM)
+			break;
+	}
+
+	return ret;
+}
+
+static ssize_t sppctl_sop_fw_W(struct file *filp, struct kobject *_k,
+	struct bin_attribute *_a, char *_b, loff_t _off, size_t _count)
+{
+	int i = 0, j = 0, pos = 0;
+	struct sppctl_pdata_t *_p = NULL;
+	struct func_t *f;
+	struct device *_pdev = container_of(_k, struct device, kobj);
+
+	if (_off + _count < (list_funcsSZ - 2))
+		KINF(_pdev, "%s() fw size %zd < %zd\n", __func__, _count, list_funcsSZ);
+
+	if (!_pdev)
+		return -ENXIO;
+
+	_p = (struct sppctl_pdata_t *)_pdev->platform_data;
+	if (!_p)
+		return -ENXIO;
+
+	for (; i < list_funcsSZ && pos < _count; i++) {
+		f = &(list_funcs[i]);
+		if (f->freg == fOFF_0)
+			continue;
+		if (f->freg == fOFF_I)
+			continue;
+		if (j < _off) {
+			j++;
+			continue;
+		}
+
+		if (f->freg == fOFF_M)
+			sppctl_pin_set(_p, _b[pos], j++);
+		if (f->freg == fOFF_G)
+			sppctl_gmx_set(_p, f->roff, f->boff, f->blen, _b[pos]);
+
+		pos++;
+	}
+
+	return pos;
+}
+
+static struct device_attribute sppctl_sysfs_attrsD[] = {
+	__ATTR(name,   0444, sppctl_sop_name_R,   NULL),
+	__ATTR(dbgi,   0644, sppctl_sop_dbgi_R,   sppctl_sop_dbgi_W),
+	__ATTR(fwname, 0644, sppctl_sop_fwname_R, sppctl_sop_fwname_W),
+};
+
+static struct bin_attribute sppctl_sysfs_attrsB[] = {
+	__BIN_ATTR(list_muxes, 0444, sppctl_sop_list_muxes_R, NULL,            SPPCTL_MAX_BUF),
+	__BIN_ATTR(txt_map,    0444, sppctl_sop_txt_map_R,    NULL,            SPPCTL_MAX_BUF),
+	__BIN_ATTR(fw,         0644, sppctl_sop_fw_R,         sppctl_sop_fw_W, SPPCTL_MAX_BUF),
+};
+
+struct bin_attribute *sppctl_sysfs_Fap;
+
+// ---------- main (exported) functions
+void sppctl_sysfs_init(struct platform_device *_pd)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_pd->dev.platform_data;
+	struct sppctl_sdata_t *sdp = NULL;
+	int i, ret, ridx = 0;
+	const char *tmpp;
+
+	for (i = 0; i < ARRAY_SIZE(sppctl_sysfs_attrsD); i++) {
+		ret = device_create_file(&(_pd->dev), &sppctl_sysfs_attrsD[i]);
+		if (ret)
+			KERR(&(_pd->dev), "createD[%d] error\n", i);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sppctl_sysfs_attrsB); i++) {
+		ret = device_create_bin_file(&(_pd->dev), &sppctl_sysfs_attrsB[i]);
+		if (ret)
+			KERR(&(_pd->dev), "createB[%d] error\n", i);
+	}
+
+	i = -1;
+	sppctl_sysfs_Fap = kcalloc(list_funcsSZ, sizeof(struct bin_attribute), GFP_KERNEL);
+	sdp = kcalloc(list_funcsSZ, sizeof(struct sppctl_sdata_t), GFP_KERNEL);
+	for (i = 0; i < list_funcsSZ; i++) {
+		if (list_funcs[i].freg == fOFF_0)
+			continue;
+		if (list_funcs[i].freg == fOFF_I)
+			continue;
+
+		tmpp = list_funcs[i].name;
+		sdp[i].i = i;
+		sdp[i].ridx = ridx++;
+		sdp[i].pdata = _p;
+
+		sysfs_bin_attr_init(sppctl_sysfs_Fap[i]);
+		sppctl_sysfs_Fap[i].attr.name = tmpp;
+		sppctl_sysfs_Fap[i].attr.mode = 0644;
+		sppctl_sysfs_Fap[i].read  = sppctl_sop_func_R;
+		sppctl_sysfs_Fap[i].write = sppctl_sop_func_W;
+		sppctl_sysfs_Fap[i].size = SPPCTL_MAX_BUF;
+		sppctl_sysfs_Fap[i].private = &(sdp[i]);
+		ret = device_create_bin_file(&(_pd->dev), &(sppctl_sysfs_Fap[i]));
+
+		if (ret)
+			KERR(&(_pd->dev), "createF[%d,%s] error\n", i, tmpp);
+	}
+	_p->sysfs_sdp = sdp;
+}
+
+void sppctl_sysfs_clean(struct platform_device *_pd)
+{
+	struct sppctl_pdata_t *_p = (struct sppctl_pdata_t *)_pd->dev.platform_data;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sppctl_sysfs_attrsD); i++)
+		device_remove_file(&(_pd->dev), &sppctl_sysfs_attrsD[i]);
+	for (i = 0; i < ARRAY_SIZE(sppctl_sysfs_attrsB); i++)
+		device_remove_bin_file(&(_pd->dev), &sppctl_sysfs_attrsB[i]);
+
+	i = -1;
+	for (i = 0; i < list_funcsSZ; i++) {
+		if (list_funcs[i].freg == fOFF_0)
+			continue;
+		if (list_funcs[i].freg == fOFF_I)
+			continue;
+		device_remove_bin_file(&(_pd->dev), &(sppctl_sysfs_Fap[i]));
+	}
+
+	kfree(sppctl_sysfs_Fap);
+	kfree(_p->sysfs_sdp);
+}
diff --git a/drivers/pinctrl/sunplus/sppctl_sysfs.h b/drivers/pinctrl/sunplus/sppctl_sysfs.h
new file mode 100644
index 0000000..f37b8cf
--- /dev/null
+++ b/drivers/pinctrl/sunplus/sppctl_sysfs.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SP7021 pinmux controller driver.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef SPPCTL_SYSFS_H
+#define SPPCTL_SYSFS_H
+
+#include "sppctl.h"
+
+
+struct sppctl_sdata_t {
+	uint8_t i;
+	uint8_t ridx;
+	struct sppctl_pdata_t *pdata;
+};
+
+void sppctl_sysfs_init(struct platform_device *_pdev);
+void sppctl_sysfs_clean(struct platform_device *_pdev);
+
+#endif // SPPCTL_SYSFS_H
-- 
2.7.4

