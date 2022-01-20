Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B9A4950C9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 16:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376363AbiATPBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 10:01:04 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:52661 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359801AbiATPA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jan 2022 10:00:57 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EC396200010;
        Thu, 20 Jan 2022 15:00:52 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v10 5/6] drm: Add support for the LogiCVC display controller
Date:   Thu, 20 Jan 2022 16:00:23 +0100
Message-Id: <20220120150024.646714-6-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
References: <20220120150024.646714-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduces a driver for the LogiCVC display controller, a programmable
logic controller optimized for use in Xilinx Zynq-7000 SoCs and other
Xilinx FPGAs. The controller is mostly configured at logic synthesis
time so only a subset of configuration is left for the driver to
handle.

The following features are implemented and tested:
- LVDS 4-bit interface;
- RGB565 pixel formats;
- Multiple layers and hardware composition;
- Layer-wide alpha mode;

The following features are implemented but untested:
- Other RGB pixel formats;
- Layer framebuffer configuration for version 4;
- Lowest-layer used as background color;
- Per-pixel alpha mode.

The following features are not implemented:
- YUV pixel formats;
- DVI, LVDS 3-bit, ITU656 and camera link interfaces;
- External parallel input for layer;
- Color-keying;
- LUT-based alpha modes.

Additional implementation-specific notes:
- Panels are only enabled after the first page flip to avoid flashing a
  white screen.
- Depth used in context of the LogiCVC driver only counts color components
  to match the definition of the synthesis parameters.

Support is implemented for both version 3 and 4 of the controller.

With version 3, framebuffers are stored in a dedicated contiguous
memory area, with a base address hardcoded for each layer. This requires
using a dedicated CMA pool registered at the base address and tweaking a
few offset-related registers to try to use any buffer allocated from
the pool. This is done on a best-effort basis to have the hardware cope
with the DRM framebuffer allocation model and there is no guarantee
that each buffer allocated by GEM CMA can be used for any layer.
In particular, buffers allocated below the base address for a layer are
guaranteed not to be configurable for that layer. See the implementation of
logicvc_layer_buffer_find_setup for specifics.

Version 4 allows configuring each buffer address directly, which
guarantees that any buffer can be configured.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS                                 |   6 +
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/Makefile                    |   1 +
 drivers/gpu/drm/logicvc/Kconfig             |   9 +
 drivers/gpu/drm/logicvc/Makefile            |   9 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c      | 280 +++++++++
 drivers/gpu/drm/logicvc/logicvc_crtc.h      |  21 +
 drivers/gpu/drm/logicvc/logicvc_drm.c       | 483 +++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_drm.h       |  64 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c | 214 +++++++
 drivers/gpu/drm/logicvc/logicvc_interface.h |  28 +
 drivers/gpu/drm/logicvc/logicvc_layer.c     | 628 ++++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_layer.h     |  64 ++
 drivers/gpu/drm/logicvc/logicvc_mode.c      |  80 +++
 drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
 drivers/gpu/drm/logicvc/logicvc_of.c        | 185 ++++++
 drivers/gpu/drm/logicvc/logicvc_of.h        |  46 ++
 drivers/gpu/drm/logicvc/logicvc_regs.h      |  88 +++
 18 files changed, 2223 insertions(+)
 create mode 100644 drivers/gpu/drm/logicvc/Kconfig
 create mode 100644 drivers/gpu/drm/logicvc/Makefile
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..5d20d6c6395f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6012,6 +6012,12 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
 F:	include/uapi/drm/i810_drm.h
 
+DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
+M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/logicvc/
+
 DRM DRIVER FOR LVDS PANELS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dfdd3ec5f793..b5b9bc84d63c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -373,6 +373,8 @@ source "drivers/gpu/drm/etnaviv/Kconfig"
 
 source "drivers/gpu/drm/hisilicon/Kconfig"
 
+source "drivers/gpu/drm/logicvc/Kconfig"
+
 source "drivers/gpu/drm/mediatek/Kconfig"
 
 source "drivers/gpu/drm/mxsfb/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..b38c606e5a68 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
 obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
+obj-$(CONFIG_DRM_LOGICVC) += logicvc/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
 obj-y			+= i2c/
diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
new file mode 100644
index 000000000000..300b2be07385
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -0,0 +1,9 @@
+config DRM_LOGICVC
+	tristate "LogiCVC DRM"
+	depends on DRM
+	depends on OF || COMPILE_TEST
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	help
+	  DRM display driver for the logiCVC programmable logic block from Xylon
diff --git a/drivers/gpu/drm/logicvc/Makefile b/drivers/gpu/drm/logicvc/Makefile
new file mode 100644
index 000000000000..6e4b01979d38
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/Makefile
@@ -0,0 +1,9 @@
+logicvc-drm-y += \
+	logicvc_crtc.o \
+	logicvc_drm.o \
+	logicvc_interface.o \
+	logicvc_layer.o \
+	logicvc_mode.o \
+	logicvc_of.o
+
+obj-$(CONFIG_DRM_LOGICVC) += logicvc-drm.o
diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
new file mode 100644
index 000000000000..c35ecd868ae9
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "logicvc_crtc.h"
+#include "logicvc_drm.h"
+#include "logicvc_interface.h"
+#include "logicvc_layer.h"
+#include "logicvc_regs.h"
+
+#define logicvc_crtc(c) \
+	container_of(c, struct logicvc_crtc, drm_crtc)
+
+static enum drm_mode_status
+logicvc_crtc_mode_valid(struct drm_crtc *drm_crtc,
+			const struct drm_display_mode *mode)
+{
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
+				      struct drm_atomic_state *state)
+{
+	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
+	struct drm_crtc_state *old_state =
+		drm_atomic_get_old_crtc_state(state, drm_crtc);
+	struct drm_device *drm_dev = drm_crtc->dev;
+	unsigned long flags;
+
+	/*
+	 * We need to grab the pending event here if vblank was already enabled
+	 * since we won't get a call to atomic_enable to grab it.
+	 */
+	if (drm_crtc->state->event && old_state->active) {
+		spin_lock_irqsave(&drm_dev->event_lock, flags);
+		WARN_ON(drm_crtc_vblank_get(drm_crtc) != 0);
+
+		crtc->event = drm_crtc->state->event;
+		drm_crtc->state->event = NULL;
+
+		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
+	}
+}
+
+static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
+				       struct drm_atomic_state *state)
+{
+	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct drm_crtc_state *old_state =
+		drm_atomic_get_old_crtc_state(state, drm_crtc);
+	struct drm_crtc_state *new_state =
+		drm_atomic_get_new_crtc_state(state, drm_crtc);
+	struct drm_display_mode *mode = &new_state->adjusted_mode;
+
+	struct drm_device *drm_dev = drm_crtc->dev;
+	unsigned int hact, hfp, hsl, hbp;
+	unsigned int vact, vfp, vsl, vbp;
+	unsigned long flags;
+	u32 ctrl;
+
+	/* Timings */
+
+	hact = mode->hdisplay;
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsl = mode->hsync_end - mode->hsync_start;
+	hbp = mode->htotal - mode->hsync_end;
+
+	vact = mode->vdisplay;
+	vfp = mode->vsync_start - mode->vdisplay;
+	vsl = mode->vsync_end - mode->vsync_start;
+	vbp = mode->vtotal - mode->vsync_end;
+
+	regmap_write(logicvc->regmap, LOGICVC_HSYNC_FRONT_PORCH_REG, hfp - 1);
+	regmap_write(logicvc->regmap, LOGICVC_HSYNC_REG, hsl - 1);
+	regmap_write(logicvc->regmap, LOGICVC_HSYNC_BACK_PORCH_REG, hbp - 1);
+	regmap_write(logicvc->regmap, LOGICVC_HRES_REG, hact - 1);
+
+	regmap_write(logicvc->regmap, LOGICVC_VSYNC_FRONT_PORCH_REG, vfp - 1);
+	regmap_write(logicvc->regmap, LOGICVC_VSYNC_REG, vsl - 1);
+	regmap_write(logicvc->regmap, LOGICVC_VSYNC_BACK_PORCH_REG, vbp - 1);
+	regmap_write(logicvc->regmap, LOGICVC_VRES_REG, vact - 1);
+
+	/* Signals */
+
+	ctrl = LOGICVC_CTRL_HSYNC_ENABLE | LOGICVC_CTRL_VSYNC_ENABLE |
+	       LOGICVC_CTRL_DE_ENABLE;
+
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		ctrl |= LOGICVC_CTRL_HSYNC_INVERT;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		ctrl |= LOGICVC_CTRL_VSYNC_INVERT;
+
+	if (logicvc->interface) {
+		struct drm_connector *connector =
+			&logicvc->interface->drm_connector;
+		struct drm_display_info *display_info =
+			&connector->display_info;
+
+		if (display_info->bus_flags & DRM_BUS_FLAG_DE_LOW)
+			ctrl |= LOGICVC_CTRL_DE_INVERT;
+
+		if (display_info->bus_flags &
+		    DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+			ctrl |= LOGICVC_CTRL_CLOCK_INVERT;
+	}
+
+	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
+			   LOGICVC_CTRL_HSYNC_ENABLE |
+			   LOGICVC_CTRL_HSYNC_INVERT |
+			   LOGICVC_CTRL_VSYNC_ENABLE |
+			   LOGICVC_CTRL_VSYNC_INVERT |
+			   LOGICVC_CTRL_DE_ENABLE |
+			   LOGICVC_CTRL_DE_INVERT |
+			   LOGICVC_CTRL_PIXEL_INVERT |
+			   LOGICVC_CTRL_CLOCK_INVERT, ctrl);
+
+	/* Generate internal state reset. */
+	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
+
+	drm_crtc_vblank_on(drm_crtc);
+
+	/* Register our event after vblank is enabled. */
+	if (drm_crtc->state->event && !old_state->active) {
+		spin_lock_irqsave(&drm_dev->event_lock, flags);
+		WARN_ON(drm_crtc_vblank_get(drm_crtc) != 0);
+
+		crtc->event = drm_crtc->state->event;
+		drm_crtc->state->event = NULL;
+		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
+	}
+}
+
+static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
+					struct drm_atomic_state *state)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct drm_device *drm_dev = drm_crtc->dev;
+
+	drm_crtc_vblank_off(drm_crtc);
+
+	/* Disable and clear CRTC bits. */
+	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
+			   LOGICVC_CTRL_HSYNC_ENABLE |
+			   LOGICVC_CTRL_HSYNC_INVERT |
+			   LOGICVC_CTRL_VSYNC_ENABLE |
+			   LOGICVC_CTRL_VSYNC_INVERT |
+			   LOGICVC_CTRL_DE_ENABLE |
+			   LOGICVC_CTRL_DE_INVERT |
+			   LOGICVC_CTRL_PIXEL_INVERT |
+			   LOGICVC_CTRL_CLOCK_INVERT, 0);
+
+	/* Generate internal state reset. */
+	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
+
+	/* Consume any leftover event since vblank is now disabled. */
+	if (drm_crtc->state->event && !drm_crtc->state->active) {
+		spin_lock_irq(&drm_dev->event_lock);
+
+		drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
+		drm_crtc->state->event = NULL;
+		spin_unlock_irq(&drm_dev->event_lock);
+	}
+}
+
+static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs = {
+	.mode_valid		= logicvc_crtc_mode_valid,
+	.atomic_begin		= logicvc_crtc_atomic_begin,
+	.atomic_enable		= logicvc_crtc_atomic_enable,
+	.atomic_disable		= logicvc_crtc_atomic_disable,
+};
+
+static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+
+	/* Clear any pending V_SYNC interrupt. */
+	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
+			  LOGICVC_INT_STAT_V_SYNC, LOGICVC_INT_STAT_V_SYNC);
+
+	/* Unmask V_SYNC interrupt. */
+	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
+			  LOGICVC_INT_MASK_V_SYNC, 0);
+
+	return 0;
+}
+
+static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+
+	/* Mask V_SYNC interrupt. */
+	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
+			  LOGICVC_INT_MASK_V_SYNC, LOGICVC_INT_MASK_V_SYNC);
+}
+
+static const struct drm_crtc_funcs logicvc_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= logicvc_crtc_enable_vblank,
+	.disable_vblank		= logicvc_crtc_disable_vblank,
+};
+
+void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct logicvc_crtc *crtc = logicvc->crtc;
+	unsigned long flags;
+
+	if (!crtc)
+		return;
+
+	drm_crtc_handle_vblank(&crtc->drm_crtc);
+
+	if (crtc->event) {
+		spin_lock_irqsave(&drm_dev->event_lock, flags);
+		drm_crtc_send_vblank_event(&crtc->drm_crtc, crtc->event);
+		drm_crtc_vblank_put(&crtc->drm_crtc);
+		crtc->event = NULL;
+		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
+	}
+}
+
+int logicvc_crtc_init(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct device_node *of_node = dev->of_node;
+	struct logicvc_crtc *crtc;
+	struct logicvc_layer *layer_primary;
+	int ret;
+
+	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
+	if (!crtc)
+		return -ENOMEM;
+
+	layer_primary = logicvc_layer_get_primary(logicvc);
+	if (!layer_primary) {
+		drm_err(drm_dev, "Failed to get primary layer\n");
+		return -EINVAL;
+	}
+
+	ret = drm_crtc_init_with_planes(drm_dev, &crtc->drm_crtc,
+					&layer_primary->drm_plane, NULL,
+					&logicvc_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize CRTC\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(&crtc->drm_crtc, &logicvc_crtc_helper_funcs);
+
+	crtc->drm_crtc.port = of_graph_get_port_by_id(of_node, 1);
+
+	logicvc->crtc = crtc;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/logicvc/logicvc_crtc.h
new file mode 100644
index 000000000000..6a1291c37704
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_CRTC_H_
+#define _LOGICVC_CRTC_H_
+
+struct drm_pending_vblank_event;
+struct logicvc_drm;
+
+struct logicvc_crtc {
+	struct drm_crtc drm_crtc;
+	struct drm_pending_vblank_event *event;
+};
+
+void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc);
+int logicvc_crtc_init(struct logicvc_drm *logicvc);
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
new file mode 100644
index 000000000000..02a7435f9806
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_print.h>
+
+#include "logicvc_crtc.h"
+#include "logicvc_drm.h"
+#include "logicvc_interface.h"
+#include "logicvc_mode.h"
+#include "logicvc_layer.h"
+#include "logicvc_of.h"
+#include "logicvc_regs.h"
+
+DEFINE_DRM_GEM_CMA_FOPS(logicvc_drm_fops);
+
+static int logicvc_drm_gem_cma_dumb_create(struct drm_file *file_priv,
+					   struct drm_device *drm_dev,
+					   struct drm_mode_create_dumb *args)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_dev);
+
+	/* Stride is always fixed to its configuration value. */
+	args->pitch = logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, 8);
+
+	return drm_gem_cma_dumb_create_internal(file_priv, drm_dev, args);
+}
+
+static struct drm_driver logicvc_drm_driver = {
+	.driver_features		= DRIVER_GEM | DRIVER_MODESET |
+					  DRIVER_ATOMIC,
+
+	.fops				= &logicvc_drm_fops,
+	.name				= "logicvc-drm",
+	.desc				= "Xylon LogiCVC DRM driver",
+	.date				= "20200403",
+	.major				= 1,
+	.minor				= 0,
+
+	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(logicvc_drm_gem_cma_dumb_create),
+};
+
+static struct regmap_config logicvc_drm_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.name		= "logicvc-drm",
+};
+
+static irqreturn_t logicvc_drm_irq_handler(int irq, void *data)
+{
+	struct logicvc_drm *logicvc = data;
+	irqreturn_t ret = IRQ_NONE;
+	u32 stat = 0;
+
+	/* Get pending interrupt sources. */
+	regmap_read(logicvc->regmap, LOGICVC_INT_STAT_REG, &stat);
+
+	/* Clear all pending interrupt sources. */
+	regmap_write(logicvc->regmap, LOGICVC_INT_STAT_REG, stat);
+
+	if (stat & LOGICVC_INT_STAT_V_SYNC) {
+		logicvc_crtc_vblank_handler(logicvc);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct device_node *of_node = dev->of_node;
+	struct logicvc_drm_config *config = &logicvc->config;
+	struct device_node *layers_node;
+	int ret;
+
+	logicvc_of_property_parse_bool(of_node, LOGICVC_OF_PROPERTY_DITHERING,
+				       &config->dithering);
+	logicvc_of_property_parse_bool(of_node,
+				       LOGICVC_OF_PROPERTY_BACKGROUND_LAYER,
+				       &config->background_layer);
+	logicvc_of_property_parse_bool(of_node,
+				       LOGICVC_OF_PROPERTY_LAYERS_CONFIGURABLE,
+				       &config->layers_configurable);
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_DISPLAY_INTERFACE,
+					    &config->display_interface);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_DISPLAY_COLORSPACE,
+					    &config->display_colorspace);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_DISPLAY_DEPTH,
+					    &config->display_depth);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_ROW_STRIDE,
+					    &config->row_stride);
+	if (ret)
+		return ret;
+
+	layers_node = of_get_child_by_name(of_node, "layers");
+	if (!layers_node) {
+		drm_err(drm_dev, "Missing non-optional layers node\n");
+		return -EINVAL;
+	}
+
+	config->layers_count = of_get_child_count(layers_node);
+	if (!config->layers_count) {
+		drm_err(drm_dev,
+			"Missing a non-optional layers children node\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void logicvc_version_print(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	u32 version;
+
+	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
+
+	drm_info(drm_dev, "LogiCVC version %d.%02d.%c\n",
+		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
+		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
+		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
+		 'a');
+}
+
+static int logicvc_clocks_prepare(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+
+	struct {
+		struct clk **clk;
+		char *name;
+		bool optional;
+	} clocks_map[] = {
+		{
+			.clk = &logicvc->vclk,
+			.name = "vclk",
+			.optional = false,
+		},
+		{
+			.clk = &logicvc->vclk2,
+			.name = "vclk2",
+			.optional = true,
+		},
+		{
+			.clk = &logicvc->lvdsclk,
+			.name = "lvdsclk",
+			.optional = true,
+		},
+		{
+			.clk = &logicvc->lvdsclkn,
+			.name = "lvdsclkn",
+			.optional = true,
+		},
+	};
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(clocks_map); i++) {
+		struct clk *clk;
+
+		clk = devm_clk_get(dev, clocks_map[i].name);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) == -ENOENT && clocks_map[i].optional)
+				continue;
+
+			drm_err(drm_dev, "Missing non-optional clock %s\n",
+				clocks_map[i].name);
+
+			ret = PTR_ERR(clk);
+			goto error;
+		}
+
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			drm_err(drm_dev,
+				"Failed to prepare and enable clock %s\n",
+				clocks_map[i].name);
+			goto error;
+		}
+
+		*clocks_map[i].clk = clk;
+	}
+
+	return 0;
+
+error:
+	for (i = 0; i < ARRAY_SIZE(clocks_map); i++) {
+		if (!*clocks_map[i].clk)
+			continue;
+
+		clk_disable_unprepare(*clocks_map[i].clk);
+		*clocks_map[i].clk = NULL;
+	}
+
+	return ret;
+}
+
+static int logicvc_clocks_unprepare(struct logicvc_drm *logicvc)
+{
+	struct clk **clocks[] = {
+		&logicvc->vclk,
+		&logicvc->vclk2,
+		&logicvc->lvdsclk,
+		&logicvc->lvdsclkn,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
+		if (!*clocks[i])
+			continue;
+
+		clk_disable_unprepare(*clocks[i]);
+		*clocks[i] = NULL;
+	}
+
+	return 0;
+}
+
+static int logicvc_drm_probe(struct platform_device *pdev)
+{
+	struct device_node *of_node = pdev->dev.of_node;
+	struct device_node *reserved_mem_node;
+	struct reserved_mem *reserved_mem = NULL;
+	const struct logicvc_drm_caps *caps;
+	struct logicvc_drm *logicvc;
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm_dev;
+	struct regmap *regmap;
+	struct resource res;
+	void __iomem *base;
+	int irq;
+	int ret;
+
+	caps = of_device_get_match_data(dev);
+	if (!caps)
+		return -EINVAL;
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret && ret != -ENODEV) {
+		dev_err(dev, "Failed to init memory region\n");
+		goto error_early;
+	}
+
+	reserved_mem_node = of_parse_phandle(of_node, "memory-region", 0);
+	if (reserved_mem_node) {
+		reserved_mem = of_reserved_mem_lookup(reserved_mem_node);
+		of_node_put(reserved_mem_node);
+	}
+
+	/* Get regmap from parent if available. */
+	if (of_node->parent)
+		regmap = syscon_node_to_regmap(of_node->parent);
+
+	/* Register our own regmap otherwise. */
+	if (IS_ERR_OR_NULL(regmap)) {
+		ret = of_address_to_resource(of_node, 0, &res);
+		if (ret) {
+			dev_err(dev, "Failed to get resource from address\n");
+			goto error_reserved_mem;
+		}
+
+		base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(base)) {
+			dev_err(dev, "Failed to map I/O base\n");
+			ret = PTR_ERR(base);
+			goto error_reserved_mem;
+		}
+
+		logicvc_drm_regmap_config.max_register = resource_size(&res) -
+							 4;
+
+		regmap = devm_regmap_init_mmio(dev, base,
+					       &logicvc_drm_regmap_config);
+		if (IS_ERR(regmap)) {
+			dev_err(dev, "Failed to create regmap for I/O\n");
+			ret = PTR_ERR(regmap);
+			goto error_reserved_mem;
+		}
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "Failed to get IRQ\n");
+		ret = -ENODEV;
+		goto error_reserved_mem;
+	}
+
+	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
+				     struct logicvc_drm, drm_dev);
+	if (IS_ERR(logicvc)) {
+		ret = PTR_ERR(logicvc);
+		goto error_reserved_mem;
+	}
+
+	platform_set_drvdata(pdev, logicvc);
+	drm_dev = &logicvc->drm_dev;
+
+	logicvc->caps = caps;
+	logicvc->regmap = regmap;
+	INIT_LIST_HEAD(&logicvc->layers_list);
+
+	if (reserved_mem)
+		logicvc->reserved_mem_base = reserved_mem->base;
+
+	ret = logicvc_clocks_prepare(logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to prepare clocks\n");
+		goto error_reserved_mem;
+	}
+
+	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
+			       dev_name(dev), logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to request IRQ\n");
+		goto error_clocks;
+	}
+
+	logicvc_version_print(logicvc);
+
+	ret = logicvc_drm_config_parse(logicvc);
+	if (ret && ret != -ENODEV) {
+		drm_err(drm_dev, "Failed to parse config\n");
+		goto error_clocks;
+	}
+
+	ret = drmm_mode_config_init(drm_dev);
+	if (ret) {
+		drm_err(drm_dev, "Failed to init mode config\n");
+		goto error_clocks;
+	}
+
+	ret = logicvc_layers_init(logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize layers\n");
+		goto error_clocks;
+	}
+
+	ret = logicvc_crtc_init(logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize CRTC\n");
+		goto error_clocks;
+	}
+
+	logicvc_layers_attach_crtc(logicvc);
+
+	ret = logicvc_interface_init(logicvc);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			drm_err(drm_dev, "Failed to initialize interface\n");
+
+		goto error_clocks;
+	}
+
+	logicvc_interface_attach_crtc(logicvc);
+
+	ret = logicvc_mode_init(logicvc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize KMS\n");
+		goto error_clocks;
+	}
+
+	ret = drm_dev_register(drm_dev, 0);
+	if (ret) {
+		drm_err(drm_dev, "Failed to register DRM device\n");
+		goto error_mode;
+	}
+
+	drm_fbdev_generic_setup(drm_dev, drm_dev->mode_config.preferred_depth);
+
+	return 0;
+
+error_mode:
+	logicvc_mode_fini(logicvc);
+
+error_clocks:
+	logicvc_clocks_unprepare(logicvc);
+
+error_reserved_mem:
+	of_reserved_mem_device_release(dev);
+
+error_early:
+	return ret;
+}
+
+static int logicvc_drm_remove(struct platform_device *pdev)
+{
+	struct logicvc_drm *logicvc = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+
+	drm_dev_unregister(drm_dev);
+	drm_atomic_helper_shutdown(drm_dev);
+
+	logicvc_mode_fini(logicvc);
+
+	logicvc_clocks_unprepare(logicvc);
+
+	of_reserved_mem_device_release(dev);
+
+	return 0;
+}
+
+static const struct logicvc_drm_caps logicvc_drm_caps_3 = {
+	.layer_address = false,
+};
+
+static const struct logicvc_drm_caps logicvc_drm_caps_4 = {
+	.layer_address = true,
+};
+
+static const struct of_device_id logicvc_drm_of_table[] = {
+	{
+		.compatible = "xylon,logicvc-3.02.a-display",
+		.data = &logicvc_drm_caps_3,
+	},
+	{
+		.compatible = "xylon,logicvc-3-display",
+		.data = &logicvc_drm_caps_3,
+	},
+	{
+		.compatible = "xylon,logicvc-4.01.a-display",
+		.data = &logicvc_drm_caps_4,
+	},
+	{
+		.compatible = "xylon,logicvc-4-display",
+		.data = &logicvc_drm_caps_4,
+	},
+	{
+		.compatible = "xylon,logicvc-5-display",
+		.data = &logicvc_drm_caps_4,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
+
+static struct platform_driver logicvc_drm_platform_driver = {
+	.probe		= logicvc_drm_probe,
+	.remove		= logicvc_drm_remove,
+	.driver		= {
+		.name		= "logicvc-drm",
+		.of_match_table	= logicvc_drm_of_table,
+	},
+};
+
+module_platform_driver(logicvc_drm_platform_driver);
+
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_DESCRIPTION("Xylon LogiCVC DRM driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logicvc/logicvc_drm.h
new file mode 100644
index 000000000000..68bbac6c4ab9
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_DRM_H_
+#define _LOGICVC_DRM_H_
+
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <drm/drm_device.h>
+
+#define LOGICVC_DISPLAY_INTERFACE_RGB			0
+#define LOGICVC_DISPLAY_INTERFACE_ITU656		1
+#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS		2
+#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA	3
+#define LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS		4
+#define LOGICVC_DISPLAY_INTERFACE_DVI			5
+
+#define LOGICVC_DISPLAY_COLORSPACE_RGB		0
+#define LOGICVC_DISPLAY_COLORSPACE_YUV422	1
+#define LOGICVC_DISPLAY_COLORSPACE_YUV444	2
+
+#define logicvc_drm(d) \
+	container_of(d, struct logicvc_drm, drm_dev)
+
+struct logicvc_crtc;
+struct logicvc_interface;
+
+struct logicvc_drm_config {
+	u32 display_interface;
+	u32 display_colorspace;
+	u32 display_depth;
+	u32 row_stride;
+	bool dithering;
+	bool background_layer;
+	bool layers_configurable;
+	u32 layers_count;
+};
+
+struct logicvc_drm_caps {
+	bool layer_address;
+};
+
+struct logicvc_drm {
+	const struct logicvc_drm_caps *caps;
+	struct logicvc_drm_config config;
+
+	struct drm_device drm_dev;
+	phys_addr_t reserved_mem_base;
+	struct regmap *regmap;
+
+	struct clk *vclk;
+	struct clk *vclk2;
+	struct clk *lvdsclk;
+	struct clk *lvdsclkn;
+
+	struct list_head layers_list;
+	struct logicvc_crtc *crtc;
+	struct logicvc_interface *interface;
+};
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
new file mode 100644
index 000000000000..b17a3168ad78
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "logicvc_crtc.h"
+#include "logicvc_drm.h"
+#include "logicvc_interface.h"
+#include "logicvc_regs.h"
+
+#define logicvc_interface_from_drm_encoder(c) \
+	container_of(c, struct logicvc_interface, drm_encoder)
+#define logicvc_interface_from_drm_connector(c) \
+	container_of(c, struct logicvc_interface, drm_connector)
+
+static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_encoder->dev);
+	struct logicvc_interface *interface =
+		logicvc_interface_from_drm_encoder(drm_encoder);
+
+	regmap_update_bits(logicvc->regmap, LOGICVC_POWER_CTRL_REG,
+			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
+			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
+
+	if (interface->drm_panel) {
+		drm_panel_prepare(interface->drm_panel);
+		drm_panel_enable(interface->drm_panel);
+	}
+}
+
+static void logicvc_encoder_disable(struct drm_encoder *drm_encoder)
+{
+	struct logicvc_interface *interface =
+		logicvc_interface_from_drm_encoder(drm_encoder);
+
+	if (interface->drm_panel) {
+		drm_panel_disable(interface->drm_panel);
+		drm_panel_unprepare(interface->drm_panel);
+	}
+}
+
+static const struct drm_encoder_helper_funcs logicvc_encoder_helper_funcs = {
+	.enable			= logicvc_encoder_enable,
+	.disable		= logicvc_encoder_disable,
+};
+
+static const struct drm_encoder_funcs logicvc_encoder_funcs = {
+	.destroy		= drm_encoder_cleanup,
+};
+
+static int logicvc_connector_get_modes(struct drm_connector *drm_connector)
+{
+	struct logicvc_interface *interface =
+		logicvc_interface_from_drm_connector(drm_connector);
+
+	if (interface->drm_panel)
+		return drm_panel_get_modes(interface->drm_panel, drm_connector);
+
+	WARN_ONCE(1, "Retrieving modes from a native connector is not implemented.");
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs logicvc_connector_helper_funcs = {
+	.get_modes		= logicvc_connector_get_modes,
+};
+
+static const struct drm_connector_funcs logicvc_connector_funcs = {
+	.reset			= drm_atomic_helper_connector_reset,
+	.fill_modes		= drm_helper_probe_single_connector_modes,
+	.destroy		= drm_connector_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+};
+
+static int logicvc_interface_encoder_type(struct logicvc_drm *logicvc)
+{
+	switch (logicvc->config.display_interface) {
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
+		return DRM_MODE_ENCODER_LVDS;
+	case LOGICVC_DISPLAY_INTERFACE_DVI:
+		return DRM_MODE_ENCODER_TMDS;
+	case LOGICVC_DISPLAY_INTERFACE_RGB:
+		return DRM_MODE_ENCODER_DPI;
+	default:
+		return DRM_MODE_ENCODER_NONE;
+	}
+}
+
+static int logicvc_interface_connector_type(struct logicvc_drm *logicvc)
+{
+	switch (logicvc->config.display_interface) {
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
+	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
+		return DRM_MODE_CONNECTOR_LVDS;
+	case LOGICVC_DISPLAY_INTERFACE_DVI:
+		return DRM_MODE_CONNECTOR_DVID;
+	case LOGICVC_DISPLAY_INTERFACE_RGB:
+		return DRM_MODE_CONNECTOR_DPI;
+	default:
+		return DRM_MODE_CONNECTOR_Unknown;
+	}
+}
+
+static bool logicvc_interface_native_connector(struct logicvc_drm *logicvc)
+{
+	switch (logicvc->config.display_interface) {
+	case LOGICVC_DISPLAY_INTERFACE_DVI:
+		return true;
+	default:
+		return false;
+	}
+}
+
+void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc)
+{
+	uint32_t possible_crtcs = drm_crtc_mask(&logicvc->crtc->drm_crtc);
+
+	logicvc->interface->drm_encoder.possible_crtcs = possible_crtcs;
+}
+
+int logicvc_interface_init(struct logicvc_drm *logicvc)
+{
+	struct logicvc_interface *interface;
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct device_node *of_node = dev->of_node;
+	int encoder_type = logicvc_interface_encoder_type(logicvc);
+	int connector_type = logicvc_interface_connector_type(logicvc);
+	bool native_connector = logicvc_interface_native_connector(logicvc);
+	int ret;
+
+	interface = devm_kzalloc(dev, sizeof(*interface), GFP_KERNEL);
+	if (!interface) {
+		ret = -ENOMEM;
+		goto error_early;
+	}
+
+	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &interface->drm_panel,
+					  &interface->drm_bridge);
+	if (ret == -EPROBE_DEFER)
+		goto error_early;
+
+	ret = drm_encoder_init(drm_dev, &interface->drm_encoder,
+			       &logicvc_encoder_funcs, encoder_type, NULL);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize encoder\n");
+		goto error_early;
+	}
+
+	drm_encoder_helper_add(&interface->drm_encoder,
+			       &logicvc_encoder_helper_funcs);
+
+	if (native_connector || interface->drm_panel) {
+		ret = drm_connector_init(drm_dev, &interface->drm_connector,
+					 &logicvc_connector_funcs,
+					 connector_type);
+		if (ret) {
+			drm_err(drm_dev, "Failed to initialize connector\n");
+			goto error_encoder;
+		}
+
+		drm_connector_helper_add(&interface->drm_connector,
+					 &logicvc_connector_helper_funcs);
+
+		ret = drm_connector_attach_encoder(&interface->drm_connector,
+						   &interface->drm_encoder);
+		if (ret) {
+			drm_err(drm_dev,
+				"Failed to attach connector to encoder\n");
+			goto error_encoder;
+		}
+	}
+
+	if (interface->drm_bridge) {
+		ret = drm_bridge_attach(&interface->drm_encoder,
+					interface->drm_bridge, NULL, 0);
+		if (ret) {
+			drm_err(drm_dev,
+				"Failed to attach bridge to encoder\n");
+			goto error_encoder;
+		}
+	}
+
+	logicvc->interface = interface;
+
+	return 0;
+
+error_encoder:
+	drm_encoder_cleanup(&interface->drm_encoder);
+
+error_early:
+	return ret;
+}
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.h b/drivers/gpu/drm/logicvc/logicvc_interface.h
new file mode 100644
index 000000000000..503e7615004c
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_INTERFACE_H_
+#define _LOGICVC_INTERFACE_H_
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_panel.h>
+
+struct logicvc_drm;
+
+struct logicvc_interface {
+	struct drm_encoder drm_encoder;
+	struct drm_connector drm_connector;
+
+	struct drm_panel *drm_panel;
+	struct drm_bridge *drm_bridge;
+};
+
+void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc);
+int logicvc_interface_init(struct logicvc_drm *logicvc);
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
new file mode 100644
index 000000000000..4345d29c61a7
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -0,0 +1,628 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
+
+#include "logicvc_crtc.h"
+#include "logicvc_drm.h"
+#include "logicvc_layer.h"
+#include "logicvc_of.h"
+#include "logicvc_regs.h"
+
+#define logicvc_layer(p) \
+	container_of(p, struct logicvc_layer, drm_plane)
+
+static uint32_t logicvc_layer_formats_rgb16[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_INVALID,
+};
+
+static uint32_t logicvc_layer_formats_rgb24[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_INVALID,
+};
+
+/*
+ * What we call depth in this driver only counts color components, not alpha.
+ * This allows us to stay compatible with the LogiCVC bistream definitions.
+ */
+static uint32_t logicvc_layer_formats_rgb24_alpha[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_INVALID,
+};
+
+static struct logicvc_layer_formats logicvc_layer_formats[] = {
+	{
+		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
+		.depth		= 16,
+		.formats	= logicvc_layer_formats_rgb16,
+	},
+	{
+		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
+		.depth		= 24,
+		.formats	= logicvc_layer_formats_rgb24,
+	},
+	{
+		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
+		.depth		= 24,
+		.alpha		= true,
+		.formats	= logicvc_layer_formats_rgb24_alpha,
+	},
+	{ }
+};
+
+static bool logicvc_layer_format_inverted(uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_BGR888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *drm_dev = drm_plane->dev;
+	struct logicvc_layer *layer = logicvc_layer(drm_plane);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_dev);
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_crtc_state *crtc_state;
+	int min_scale, max_scale;
+	bool can_position;
+	int ret;
+
+	if (!new_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
+							new_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	if (new_state->crtc_x < 0 || new_state->crtc_y < 0) {
+		drm_err(drm_dev,
+			"Negative on-CRTC positions are not supported.\n");
+		return -EINVAL;
+	}
+
+	if (!logicvc->caps->layer_address) {
+		ret = logicvc_layer_buffer_find_setup(logicvc, layer, new_state,
+						      NULL);
+		if (ret) {
+			drm_err(drm_dev, "No viable setup for buffer found.\n");
+			return ret;
+		}
+	}
+
+	min_scale = DRM_PLANE_HELPER_NO_SCALING;
+	max_scale = DRM_PLANE_HELPER_NO_SCALING;
+
+	can_position = (drm_plane->type == DRM_PLANE_TYPE_OVERLAY &&
+			layer->index != (logicvc->config.layers_count - 1) &&
+			logicvc->config.layers_configurable);
+
+	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						  min_scale, max_scale,
+						  can_position, true);
+	if (ret) {
+		drm_err(drm_dev, "Invalid plane state\n\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
+					struct drm_atomic_state *state)
+{
+	struct logicvc_layer *layer = logicvc_layer(drm_plane);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_crtc *drm_crtc = &logicvc->crtc->drm_crtc;
+	struct drm_display_mode *mode = &drm_crtc->state->adjusted_mode;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct logicvc_layer_buffer_setup setup = {};
+	u32 index = layer->index;
+	u32 reg;
+
+	/* Layer dimensions */
+
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_WIDTH_REG(index),
+		     new_state->crtc_w - 1);
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_HEIGHT_REG(index),
+		     new_state->crtc_h - 1);
+
+	if (logicvc->caps->layer_address) {
+		phys_addr_t fb_addr = drm_fb_cma_get_gem_addr(fb, new_state, 0);
+
+		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
+			     fb_addr);
+	} else {
+		/* Rely on offsets to configure the address. */
+
+		logicvc_layer_buffer_find_setup(logicvc, layer, new_state,
+						&setup);
+
+		/* Layer memory offsets */
+
+		regmap_write(logicvc->regmap, LOGICVC_BUFFER_SEL_REG,
+			     LOGICVC_BUFFER_SEL_VALUE(index, setup.buffer_sel));
+		regmap_write(logicvc->regmap, LOGICVC_LAYER_HOFFSET_REG(index),
+			     setup.hoffset);
+		regmap_write(logicvc->regmap, LOGICVC_LAYER_VOFFSET_REG(index),
+			     setup.voffset);
+	}
+
+	/* Layer position */
+
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_HPOSITION_REG(index),
+		     mode->hdisplay - 1 - new_state->crtc_x);
+
+	/* Vertical position must be set last to sync layer register changes. */
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_VPOSITION_REG(index),
+		     mode->vdisplay - 1 - new_state->crtc_y);
+
+	/* Layer alpha */
+
+	if (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_LAYER) {
+		u32 alpha_bits;
+		u32 alpha_max;
+		u32 alpha;
+
+		switch (layer->config.depth) {
+		case 8:
+			alpha_bits = 3;
+			break;
+		case 16:
+			if (layer->config.colorspace ==
+			    LOGICVC_LAYER_COLORSPACE_YUV)
+				alpha_bits = 8;
+			else
+				alpha_bits = 6;
+			break;
+		default:
+			alpha_bits = 8;
+			break;
+		}
+
+		alpha_max = BIT(alpha_bits) - 1;
+		alpha = new_state->alpha * alpha_max / DRM_BLEND_ALPHA_OPAQUE;
+
+		drm_dbg_kms(drm_dev, "Setting layer %d alpha to %d/%d\n", index,
+				 alpha, alpha_max);
+
+		regmap_write(logicvc->regmap, LOGICVC_LAYER_ALPHA_REG(index),
+			     alpha);
+	}
+
+	/* Layer control */
+
+	reg = LOGICVC_LAYER_CTRL_ENABLE;
+
+	if (logicvc_layer_format_inverted(fb->format->format))
+		reg |= LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
+
+	reg |= LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
+
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
+}
+
+static void logicvc_plane_atomic_disable(struct drm_plane *drm_plane,
+					 struct drm_atomic_state *state)
+{
+	struct logicvc_layer *layer = logicvc_layer(drm_plane);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	u32 index = layer->index;
+
+	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), 0);
+}
+
+static struct drm_plane_helper_funcs logicvc_plane_helper_funcs = {
+	.atomic_check		= logicvc_plane_atomic_check,
+	.atomic_update		= logicvc_plane_atomic_update,
+	.atomic_disable		= logicvc_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs logicvc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
+				    struct logicvc_layer *layer,
+				    struct drm_plane_state *state,
+				    struct logicvc_layer_buffer_setup *setup)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct drm_framebuffer *fb = state->fb;
+	/* All the supported formats have a single data plane. */
+	u32 layer_bytespp = fb->format->cpp[0];
+	u32 layer_stride = layer_bytespp * logicvc->config.row_stride;
+	u32 base_offset = layer->config.base_offset * layer_stride;
+	u32 buffer_offset = layer->config.buffer_offset * layer_stride;
+	u8 buffer_sel = 0;
+	u16 voffset = 0;
+	u16 hoffset = 0;
+	phys_addr_t fb_addr;
+	u32 fb_offset;
+	u32 gap;
+
+	if (!logicvc->reserved_mem_base) {
+		drm_err(drm_dev, "No reserved memory base was registered!\n");
+		return -ENOMEM;
+	}
+
+	fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
+	if (fb_addr < logicvc->reserved_mem_base) {
+		drm_err(drm_dev,
+			"Framebuffer memory below reserved memory base!\n");
+		return -EINVAL;
+	}
+
+	fb_offset = (u32) (fb_addr - logicvc->reserved_mem_base);
+
+	if (fb_offset < base_offset) {
+		drm_err(drm_dev,
+			"Framebuffer offset below layer base offset!\n");
+		return -EINVAL;
+	}
+
+	gap = fb_offset - base_offset;
+
+	/* Use the possible video buffers selection. */
+	if (gap && buffer_offset) {
+		buffer_sel = gap / buffer_offset;
+		if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
+			buffer_sel = LOGICVC_BUFFER_SEL_MAX;
+
+		gap -= buffer_sel * buffer_offset;
+	}
+
+	/* Use the vertical offset. */
+	if (gap && layer_stride && logicvc->config.layers_configurable) {
+		voffset = gap / layer_stride;
+		if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
+			voffset = LOGICVC_LAYER_VOFFSET_MAX;
+
+		gap -= voffset * layer_stride;
+	}
+
+	/* Use the horizontal offset. */
+	if (gap && layer_bytespp && logicvc->config.layers_configurable) {
+		hoffset = gap / layer_bytespp;
+		if (hoffset > LOGICVC_DIMENSIONS_MAX)
+			hoffset = LOGICVC_DIMENSIONS_MAX;
+
+		gap -= hoffset * layer_bytespp;
+	}
+
+	if (gap) {
+		drm_err(drm_dev,
+			"Unable to find layer %d buffer setup for 0x%x byte gap\n",
+			layer->index, fb_offset - base_offset);
+		return -EINVAL;
+	}
+
+	drm_dbg_kms(drm_dev, "Found layer %d buffer setup for 0x%x byte gap:\n",
+			 layer->index, fb_offset - base_offset);
+
+	drm_dbg_kms(drm_dev, "- buffer_sel = 0x%x chunks of 0x%x bytes\n",
+			 buffer_sel, buffer_offset);
+	drm_dbg_kms(drm_dev, "- voffset = 0x%x chunks of 0x%x bytes\n", voffset,
+			 layer_stride);
+	drm_dbg_kms(drm_dev, "- hoffset = 0x%x chunks of 0x%x bytes\n", hoffset,
+			 layer_bytespp);
+
+	if (setup) {
+		setup->buffer_sel = buffer_sel;
+		setup->voffset = voffset;
+		setup->hoffset = hoffset;
+	}
+
+	return 0;
+}
+
+static struct logicvc_layer_formats *logicvc_layer_formats_lookup(struct logicvc_layer *layer)
+{
+	bool alpha;
+	unsigned int i = 0;
+
+	alpha = (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_PIXEL);
+
+	while (logicvc_layer_formats[i].formats) {
+		if (logicvc_layer_formats[i].colorspace == layer->config.colorspace &&
+		    logicvc_layer_formats[i].depth == layer->config.depth &&
+		    logicvc_layer_formats[i].alpha == alpha)
+			return &logicvc_layer_formats[i];
+
+		i++;
+	}
+
+	return NULL;
+}
+
+static unsigned int logicvc_layer_formats_count(struct logicvc_layer_formats *formats)
+{
+	unsigned int count = 0;
+
+	while (formats->formats[count] != DRM_FORMAT_INVALID)
+		count++;
+
+	return count;
+}
+
+static int logicvc_layer_config_parse(struct logicvc_drm *logicvc,
+				      struct logicvc_layer *layer)
+{
+	struct device_node *of_node = layer->of_node;
+	struct logicvc_layer_config *config = &layer->config;
+	int ret;
+
+	logicvc_of_property_parse_bool(of_node,
+				       LOGICVC_OF_PROPERTY_LAYER_PRIMARY,
+				       &config->primary);
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_LAYER_COLORSPACE,
+					    &config->colorspace);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_LAYER_DEPTH,
+					    &config->depth);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_LAYER_ALPHA_MODE,
+					    &config->alpha_mode);
+	if (ret)
+		return ret;
+
+	/*
+	 * Memory offset is only relevant without layer address configuration.
+	 */
+	if (logicvc->caps->layer_address)
+		return 0;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_LAYER_BASE_OFFSET,
+					    &config->base_offset);
+	if (ret)
+		return ret;
+
+	ret = logicvc_of_property_parse_u32(of_node,
+					    LOGICVC_OF_PROPERTY_LAYER_BUFFER_OFFSET,
+					    &config->buffer_offset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *logicvc,
+						   u32 index)
+{
+	struct logicvc_layer *layer;
+
+	list_for_each_entry(layer, &logicvc->layers_list, list)
+		if (layer->index == index)
+			return layer;
+
+	return NULL;
+}
+
+struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *logicvc,
+						  enum drm_plane_type type)
+{
+	struct logicvc_layer *layer;
+
+	list_for_each_entry(layer, &logicvc->layers_list, list)
+		if (layer->drm_plane.type == type)
+			return layer;
+
+	return NULL;
+}
+
+struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logicvc)
+{
+	return logicvc_layer_get_from_type(logicvc, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static int logicvc_layer_init(struct logicvc_drm *logicvc,
+			      struct device_node *of_node, u32 index)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct logicvc_layer *layer = NULL;
+	struct logicvc_layer_formats *formats;
+	unsigned int formats_count;
+	enum drm_plane_type type;
+	unsigned int zpos;
+	int ret;
+
+	layer = devm_kzalloc(dev, sizeof(*layer), GFP_KERNEL);
+	if (!layer) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	layer->of_node = of_node;
+	layer->index = index;
+
+	ret = logicvc_layer_config_parse(logicvc, layer);
+	if (ret) {
+		drm_err(drm_dev, "Failed to parse config for layer #%d\n",
+			index);
+		goto error;
+	}
+
+	formats = logicvc_layer_formats_lookup(layer);
+	if (!formats) {
+		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
+			index);
+		goto error;
+	}
+
+	formats_count = logicvc_layer_formats_count(formats);
+
+	/* The final layer can be configured as a background layer. */
+	if (logicvc->config.background_layer &&
+	    index == (logicvc->config.layers_count - 1)) {
+		/*
+		 * A zero value for black is only valid for RGB, not for YUV,
+		 * so this will need to take the format in account for YUV.
+		 */
+		u32 background = 0;
+
+		drm_dbg_kms(drm_dev, "Using layer #%d as background layer\n",
+				 index);
+
+		regmap_write(logicvc->regmap, LOGICVC_BACKGROUND_COLOR_REG,
+			     background);
+
+		devm_kfree(dev, layer);
+
+		return 0;
+	}
+
+	if (layer->config.primary)
+		type = DRM_PLANE_TYPE_PRIMARY;
+	else
+		type = DRM_PLANE_TYPE_OVERLAY;
+
+	ret = drm_universal_plane_init(drm_dev, &layer->drm_plane, 0,
+				       &logicvc_plane_funcs, formats->formats,
+				       formats_count, NULL, type, NULL);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize layer plane\n");
+		return ret;
+	}
+
+	drm_plane_helper_add(&layer->drm_plane, &logicvc_plane_helper_funcs);
+
+	zpos = logicvc->config.layers_count - index - 1;
+	drm_dbg_kms(drm_dev, "Giving layer #%d zpos %d\n", index, zpos);
+
+	if (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_LAYER)
+		drm_plane_create_alpha_property(&layer->drm_plane);
+
+	drm_plane_create_zpos_immutable_property(&layer->drm_plane, zpos);
+
+	drm_dbg_kms(drm_dev, "Registering layer #%d\n", index);
+
+	layer->formats = formats;
+
+	list_add_tail(&layer->list, &logicvc->layers_list);
+
+	return 0;
+
+error:
+	if (layer)
+		devm_kfree(dev, layer);
+
+	return ret;
+}
+
+static void logicvc_layer_fini(struct logicvc_drm *logicvc,
+			       struct logicvc_layer *layer)
+{
+	struct device *dev = logicvc->drm_dev.dev;
+
+	list_del(&layer->list);
+	devm_kfree(dev, layer);
+}
+
+void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc)
+{
+	uint32_t possible_crtcs = drm_crtc_mask(&logicvc->crtc->drm_crtc);
+	struct logicvc_layer *layer;
+
+	list_for_each_entry(layer, &logicvc->layers_list, list) {
+		if (layer->drm_plane.type != DRM_PLANE_TYPE_OVERLAY)
+			continue;
+
+		layer->drm_plane.possible_crtcs = possible_crtcs;
+	}
+}
+
+int logicvc_layers_init(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct device_node *of_node = dev->of_node;
+	struct device_node *layer_node = NULL;
+	struct device_node *layers_node;
+	struct logicvc_layer *layer;
+	struct logicvc_layer *next;
+	int ret = 0;
+
+	layers_node = of_get_child_by_name(of_node, "layers");
+	if (!layers_node) {
+		drm_err(drm_dev, "No layers node found in the description\n");
+		ret = -ENODEV;
+		goto error;
+	}
+
+	for_each_child_of_node(layers_node, layer_node) {
+		u32 index = 0;
+
+		if (!logicvc_of_node_is_layer(layer_node))
+			continue;
+
+		ret = of_property_read_u32(layer_node, "reg", &index);
+		if (ret)
+			continue;
+
+		layer = logicvc_layer_get_from_index(logicvc, index);
+		if (layer) {
+			drm_err(drm_dev, "Duplicated entry for layer #%d\n",
+				index);
+			continue;
+		}
+
+		ret = logicvc_layer_init(logicvc, layer_node, index);
+		if (ret)
+			goto error;
+
+		of_node_put(layer_node);
+	}
+
+	of_node_put(layers_node);
+
+	return 0;
+
+error:
+	list_for_each_entry_safe(layer, next, &logicvc->layers_list, list)
+		logicvc_layer_fini(logicvc, layer);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/logicvc/logicvc_layer.h
new file mode 100644
index 000000000000..c5767c81f446
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_LAYER_H_
+#define _LOGICVC_LAYER_H_
+
+#include <linux/of.h>
+#include <linux/types.h>
+#include <drm/drm_plane.h>
+
+#define LOGICVC_LAYER_COLORSPACE_RGB		0
+#define LOGICVC_LAYER_COLORSPACE_YUV		1
+
+#define LOGICVC_LAYER_ALPHA_LAYER		0
+#define LOGICVC_LAYER_ALPHA_PIXEL		1
+
+struct logicvc_layer_buffer_setup {
+	u8 buffer_sel;
+	u16 voffset;
+	u16 hoffset;
+};
+
+struct logicvc_layer_config {
+	u32 colorspace;
+	u32 depth;
+	u32 alpha_mode;
+	u32 base_offset;
+	u32 buffer_offset;
+	bool primary;
+};
+
+struct logicvc_layer_formats {
+	u32 colorspace;
+	u32 depth;
+	bool alpha;
+	uint32_t *formats;
+};
+
+struct logicvc_layer {
+	struct logicvc_layer_config config;
+	struct logicvc_layer_formats *formats;
+	struct device_node *of_node;
+
+	struct drm_plane drm_plane;
+	struct list_head list;
+	u32 index;
+};
+
+int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
+				    struct logicvc_layer *layer,
+				    struct drm_plane_state *state,
+				    struct logicvc_layer_buffer_setup *setup);
+struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *logicvc,
+						   u32 index);
+struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *logicvc,
+						  enum drm_plane_type type);
+struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logicvc);
+void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc);
+int logicvc_layers_init(struct logicvc_drm *logicvc);
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
new file mode 100644
index 000000000000..90642639a087
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mode_config.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "logicvc_drm.h"
+#include "logicvc_interface.h"
+#include "logicvc_layer.h"
+#include "logicvc_mode.h"
+
+static const struct drm_mode_config_funcs logicvc_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create,
+	.output_poll_changed	= drm_fb_helper_output_poll_changed,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+int logicvc_mode_init(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+	struct logicvc_layer *layer_primary;
+	uint32_t preferred_depth;
+	int ret;
+
+	ret = drm_vblank_init(drm_dev, mode_config->num_crtc);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize vblank\n");
+		return ret;
+	}
+
+	layer_primary = logicvc_layer_get_primary(logicvc);
+	if (!layer_primary) {
+		drm_err(drm_dev, "Failed to get primary layer\n");
+		return -EINVAL;
+	}
+
+	preferred_depth = layer_primary->formats->depth;
+
+	/* DRM counts alpha in depth, our driver doesn't. */
+	if (layer_primary->formats->alpha)
+		preferred_depth += 8;
+
+	mode_config->min_width = 64;
+	mode_config->max_width = 2048;
+	mode_config->min_height = 1;
+	mode_config->max_height = 2048;
+	mode_config->preferred_depth = preferred_depth;
+	mode_config->funcs = &logicvc_mode_config_funcs;
+
+	drm_mode_config_reset(drm_dev);
+
+	drm_kms_helper_poll_init(drm_dev);
+
+	return 0;
+}
+
+void logicvc_mode_fini(struct logicvc_drm *logicvc)
+{
+	struct drm_device *drm_dev = &logicvc->drm_dev;
+
+	drm_kms_helper_poll_fini(drm_dev);
+}
diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.h b/drivers/gpu/drm/logicvc/logicvc_mode.h
new file mode 100644
index 000000000000..690def1619a6
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_mode.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_MODE_H_
+#define _LOGICVC_MODE_H_
+
+struct logicvc_drm;
+
+int logicvc_mode_init(struct logicvc_drm *logicvc);
+void logicvc_mode_fini(struct logicvc_drm *logicvc);
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_of.c b/drivers/gpu/drm/logicvc/logicvc_of.c
new file mode 100644
index 000000000000..aade85e879db
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_of.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <drm/drm_print.h>
+
+#include "logicvc_drm.h"
+#include "logicvc_layer.h"
+#include "logicvc_of.h"
+
+static struct logicvc_of_property_sv logicvc_of_display_interface_sv[] = {
+	{ "lvds-4bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS },
+	{ "lvds-3bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS },
+	{ },
+};
+
+static struct logicvc_of_property_sv logicvc_of_display_colorspace_sv[] = {
+	{ "rgb",	LOGICVC_DISPLAY_COLORSPACE_RGB },
+	{ "yuv422",	LOGICVC_DISPLAY_COLORSPACE_YUV422 },
+	{ "yuv444",	LOGICVC_DISPLAY_COLORSPACE_YUV444 },
+	{ },
+};
+
+static struct logicvc_of_property_sv logicvc_of_layer_colorspace_sv[] = {
+	{ "rgb",	LOGICVC_LAYER_COLORSPACE_RGB },
+	{ "yuv",	LOGICVC_LAYER_COLORSPACE_YUV },
+	{ },
+};
+
+static struct logicvc_of_property_sv logicvc_of_layer_alpha_mode_sv[] = {
+	{ "layer",	LOGICVC_LAYER_ALPHA_LAYER },
+	{ "pixel",	LOGICVC_LAYER_ALPHA_PIXEL },
+	{ },
+};
+
+static struct logicvc_of_property logicvc_of_properties[] = {
+	[LOGICVC_OF_PROPERTY_DISPLAY_INTERFACE] = {
+		.name		= "xylon,display-interface",
+		.sv		= logicvc_of_display_interface_sv,
+		.range		= {
+			LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS,
+			LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS,
+		},
+	},
+	[LOGICVC_OF_PROPERTY_DISPLAY_COLORSPACE] = {
+		.name		= "xylon,display-colorspace",
+		.sv		= logicvc_of_display_colorspace_sv,
+		.range		= {
+			LOGICVC_DISPLAY_COLORSPACE_RGB,
+			LOGICVC_DISPLAY_COLORSPACE_YUV444,
+		},
+	},
+	[LOGICVC_OF_PROPERTY_DISPLAY_DEPTH] = {
+		.name		= "xylon,display-depth",
+		.range		= { 8, 24 },
+	},
+	[LOGICVC_OF_PROPERTY_ROW_STRIDE] = {
+		.name		= "xylon,row-stride",
+	},
+	[LOGICVC_OF_PROPERTY_DITHERING] = {
+		.name		= "xylon,dithering",
+		.optional	= true,
+	},
+	[LOGICVC_OF_PROPERTY_BACKGROUND_LAYER] = {
+		.name		= "xylon,background-layer",
+		.optional	= true,
+	},
+	[LOGICVC_OF_PROPERTY_LAYERS_CONFIGURABLE] = {
+		.name		= "xylon,layers-configurable",
+		.optional	= true,
+	},
+	[LOGICVC_OF_PROPERTY_LAYERS_COUNT] = {
+		.name		= "xylon,layers-count",
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_DEPTH] = {
+		.name		= "xylon,layer-depth",
+		.range		= { 8, 24 },
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_COLORSPACE] = {
+		.name		= "xylon,layer-colorspace",
+		.sv		= logicvc_of_layer_colorspace_sv,
+		.range		= {
+			LOGICVC_LAYER_COLORSPACE_RGB,
+			LOGICVC_LAYER_COLORSPACE_RGB,
+		},
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_ALPHA_MODE] = {
+		.name		= "xylon,layer-alpha-mode",
+		.sv		= logicvc_of_layer_alpha_mode_sv,
+		.range		= {
+			LOGICVC_LAYER_ALPHA_LAYER,
+			LOGICVC_LAYER_ALPHA_PIXEL,
+		},
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_BASE_OFFSET] = {
+		.name		= "xylon,layer-base-offset",
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_BUFFER_OFFSET] = {
+		.name		= "xylon,layer-buffer-offset",
+	},
+	[LOGICVC_OF_PROPERTY_LAYER_PRIMARY] = {
+		.name		= "xylon,layer-primary",
+		.optional	= true,
+	},
+};
+
+static int logicvc_of_property_sv_value(struct logicvc_of_property_sv *sv,
+					const char *string, u32 *value)
+{
+	unsigned int i = 0;
+
+	while (sv[i].string) {
+		if (!strcmp(sv[i].string, string)) {
+			*value = sv[i].value;
+			return 0;
+		}
+
+		i++;
+	}
+
+	return -EINVAL;
+}
+
+int logicvc_of_property_parse_u32(struct device_node *of_node,
+				  unsigned int index, u32 *target)
+{
+	struct logicvc_of_property *property;
+	const char *string;
+	u32 value;
+	int ret;
+
+	if (index >= LOGICVC_OF_PROPERTY_MAXIMUM)
+		return -EINVAL;
+
+	property = &logicvc_of_properties[index];
+
+	if (!property->optional &&
+	    !of_property_read_bool(of_node, property->name))
+		return -ENODEV;
+
+	if (property->sv) {
+		ret = of_property_read_string(of_node, property->name, &string);
+		if (ret)
+			return ret;
+
+		ret = logicvc_of_property_sv_value(property->sv, string,
+						   &value);
+		if (ret)
+			return ret;
+	} else {
+		ret = of_property_read_u32(of_node, property->name, &value);
+		if (ret)
+			return ret;
+	}
+
+	if (property->range[0] || property->range[1])
+		if (value < property->range[0] || value > property->range[1])
+			return -ERANGE;
+
+	*target = value;
+
+	return 0;
+}
+
+void logicvc_of_property_parse_bool(struct device_node *of_node,
+				    unsigned int index, bool *target)
+{
+	struct logicvc_of_property *property;
+
+	if (index >= LOGICVC_OF_PROPERTY_MAXIMUM) {
+		/* Fallback. */
+		*target = false;
+		return;
+	}
+
+	property = &logicvc_of_properties[index];
+	*target = of_property_read_bool(of_node, property->name);
+}
+
+bool logicvc_of_node_is_layer(struct device_node *of_node)
+{
+	return !of_node_cmp(of_node->name, "layer");
+}
diff --git a/drivers/gpu/drm/logicvc/logicvc_of.h b/drivers/gpu/drm/logicvc/logicvc_of.h
new file mode 100644
index 000000000000..018731d411f6
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_of.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _LOGICVC_OF_H_
+#define _LOGICVC_OF_H_
+
+enum logicvc_of_property_index {
+	LOGICVC_OF_PROPERTY_DISPLAY_INTERFACE = 0,
+	LOGICVC_OF_PROPERTY_DISPLAY_COLORSPACE,
+	LOGICVC_OF_PROPERTY_DISPLAY_DEPTH,
+	LOGICVC_OF_PROPERTY_ROW_STRIDE,
+	LOGICVC_OF_PROPERTY_DITHERING,
+	LOGICVC_OF_PROPERTY_BACKGROUND_LAYER,
+	LOGICVC_OF_PROPERTY_LAYERS_CONFIGURABLE,
+	LOGICVC_OF_PROPERTY_LAYERS_COUNT,
+	LOGICVC_OF_PROPERTY_LAYER_DEPTH,
+	LOGICVC_OF_PROPERTY_LAYER_COLORSPACE,
+	LOGICVC_OF_PROPERTY_LAYER_ALPHA_MODE,
+	LOGICVC_OF_PROPERTY_LAYER_BASE_OFFSET,
+	LOGICVC_OF_PROPERTY_LAYER_BUFFER_OFFSET,
+	LOGICVC_OF_PROPERTY_LAYER_PRIMARY,
+	LOGICVC_OF_PROPERTY_MAXIMUM,
+};
+
+struct logicvc_of_property_sv {
+	const char *string;
+	u32 value;
+};
+
+struct logicvc_of_property {
+	char *name;
+	bool optional;
+	struct logicvc_of_property_sv *sv;
+	u32 range[2];
+};
+
+int logicvc_of_property_parse_u32(struct device_node *of_node,
+				  unsigned int index, u32 *target);
+void logicvc_of_property_parse_bool(struct device_node *of_node,
+				    unsigned int index, bool *target);
+bool logicvc_of_node_is_layer(struct device_node *of_node);
+
+#endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_regs.h b/drivers/gpu/drm/logicvc/logicvc_regs.h
new file mode 100644
index 000000000000..d0be5fe84856
--- /dev/null
+++ b/drivers/gpu/drm/logicvc/logicvc_regs.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ *
+ * Copyright (C) 2014 Xylon d.o.o.
+ * Author: Davor Joja <davor.joja@logicbricks.com>
+ */
+
+#ifndef _LOGICVC_REGS_H_
+#define _LOGICVC_REGS_H_
+
+#define LOGICVC_FIELD_GET(field, value) \
+	(((value) & field##_MASK) >> field##_SHIFT)
+#define LOGICVC_FIELD_SET(field, value) \
+	(((value) << field##_SHIFT) & field##_MASK)
+
+#define LOGICVC_DIMENSIONS_MAX		(BIT(16) - 1)
+
+#define LOGICVC_HSYNC_FRONT_PORCH_REG	0x00
+#define LOGICVC_HSYNC_REG		0x08
+#define LOGICVC_HSYNC_BACK_PORCH_REG	0x10
+#define LOGICVC_HRES_REG		0x18
+#define LOGICVC_VSYNC_FRONT_PORCH_REG	0x20
+#define LOGICVC_VSYNC_REG		0x28
+#define LOGICVC_VSYNC_BACK_PORCH_REG	0x30
+#define LOGICVC_VRES_REG		0x38
+
+#define LOGICVC_CTRL_REG		0x40
+#define LOGICVC_CTRL_CLOCK_INVERT	BIT(8)
+#define LOGICVC_CTRL_PIXEL_INVERT	BIT(7)
+#define LOGICVC_CTRL_DE_INVERT		BIT(5)
+#define LOGICVC_CTRL_DE_ENABLE		BIT(4)
+#define LOGICVC_CTRL_VSYNC_INVERT	BIT(3)
+#define LOGICVC_CTRL_VSYNC_ENABLE	BIT(2)
+#define LOGICVC_CTRL_HSYNC_INVERT	BIT(1)
+#define LOGICVC_CTRL_HSYNC_ENABLE	BIT(0)
+
+#define LOGICVC_DTYPE_REG		0x48
+#define LOGICVC_BACKGROUND_COLOR_REG	0x50
+
+#define LOGICVC_BUFFER_SEL_REG		0x58
+#define LOGICVC_BUFFER_SEL_VALUE(i, v) \
+	(BIT(10 + (i)) | ((v) << (2 * (i))))
+#define LOGICVC_BUFFER_SEL_MAX		2
+
+#define LOGICVC_DOUBLE_CLUT_REG		0x60
+
+#define LOGICVC_INT_STAT_REG		0x68
+#define LOGICVC_INT_STAT_V_SYNC		BIT(5)
+
+#define LOGICVC_INT_MASK_REG		0x70
+#define LOGICVC_INT_MASK_V_SYNC		BIT(5)
+
+#define LOGICVC_POWER_CTRL_REG		0x78
+#define LOGICVC_POWER_CTRL_BACKLIGHT_ENABLE	BIT(0)
+#define LOGICVC_POWER_CTRL_VDD_ENABLE		BIT(1)
+#define LOGICVC_POWER_CTRL_VEE_ENABLE		BIT(2)
+#define LOGICVC_POWER_CTRL_VIDEO_ENABLE		BIT(3)
+
+#define LOGICVC_IP_VERSION_REG		0xf8
+#define LOGICVC_IP_VERSION_MAJOR_MASK	GENMASK(16, 11)
+#define LOGICVC_IP_VERSION_MAJOR_SHIFT	11
+#define LOGICVC_IP_VERSION_MINOR_MASK	GENMASK(10, 5)
+#define LOGICVC_IP_VERSION_MINOR_SHIFT	5
+#define LOGICVC_IP_VERSION_LEVEL_MASK	GENMASK(4, 0)
+#define LOGICVC_IP_VERSION_LEVEL_SHIFT	0
+
+#define LOGICVC_LAYER_ADDRESS_REG(i)	(0x100 + (i) * 0x80)
+#define LOGICVC_LAYER_HOFFSET_REG(i)	(0x100 + (i) * 0x80)
+
+#define LOGICVC_LAYER_VOFFSET_REG(i)	(0x108 + (i) * 0x80)
+#define LOGICVC_LAYER_VOFFSET_MAX	4095
+
+#define LOGICVC_LAYER_HPOSITION_REG(i)	(0x110 + (i) * 0x80)
+#define LOGICVC_LAYER_VPOSITION_REG(i)	(0x118 + (i) * 0x80)
+#define LOGICVC_LAYER_WIDTH_REG(i)	(0x120 + (i) * 0x80)
+#define LOGICVC_LAYER_HEIGHT_REG(i)	(0x128 + (i) * 0x80)
+#define LOGICVC_LAYER_ALPHA_REG(i)	(0x130 + (i) * 0x80)
+
+#define LOGICVC_LAYER_CTRL_REG(i)	(0x138 + (i) * 0x80)
+#define LOGICVC_LAYER_CTRL_ENABLE	BIT(0)
+#define LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE	BIT(1)
+#define LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT	BIT(4)
+
+#define LOGICVC_LAYER_COLOR_KEY_REG(i)	(0x140 + (i) * 0x80)
+
+#endif
-- 
2.34.1

