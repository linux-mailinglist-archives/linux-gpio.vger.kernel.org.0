Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4F7121B4E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 21:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLPUvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 15:51:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43022 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727338AbfLPUvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 15:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z8T4172WDbHP38/LNRIKQ98QP5O9HGLPqYMQ7D5S2CM=;
        b=O2b8+60aOtLtF/Rvgexhb85nMI4+ePwbgiZb+HOinR1Ovlvqy9tSVZVY/NFG4dsgDjQrNs
        /vAGT0EDWGXte4japRma7vKV13DJDvMUukEMD746oQr1a5YbPCuRh9pyLVaDedVdavus17
        m22Td1tKiCHfV662g7lSE8K1ouWHSy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-oYiYyOFdNYilDOZhmFMUaw-1; Mon, 16 Dec 2019 15:51:39 -0500
X-MC-Unique: oYiYyOFdNYilDOZhmFMUaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9A5107ACC4;
        Mon, 16 Dec 2019 20:51:37 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 39C791001B00;
        Mon, 16 Dec 2019 20:51:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO lookup from mfd to the i915 driver
Date:   Mon, 16 Dec 2019 21:51:21 +0100
Message-Id: <20191216205122.1850923-5-hdegoede@redhat.com>
In-Reply-To: <20191216205122.1850923-1-hdegoede@redhat.com>
References: <20191216205122.1850923-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the Crystal Cove PMIC panel GPIO lookup-table from
drivers/mfd/intel_soc_pmic_core.c to the i915 driver.

The moved looked-up table is adding a GPIO lookup to the i915 PCI
device and the GPIO subsys allows only one lookup table per device,

The intel_soc_pmic_core.c code only adds lookup-table entries for the
PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
able to access some GPIOs on the SoC itself, which requires entries for
these GPIOs in the lookup-table.

Since the lookup-table is attached to the i915 PCI device it really
should be part of the i915 driver, this will also allow us to extend
it with GPIOs from other sources when necessary.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
 drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
index 4210f449553e..89558ccf79c8 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -25,6 +25,7 @@
  */
=20
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/slab.h>
=20
@@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi,=
 u16 panel_id)
=20
 /*
  * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
- * control some GPIOs.
+ * control some GPIOs. We need to add a GPIO lookup table before we get =
these.
  */
+static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
+	/* Intel GFX is consumer */
+	.dev_id =3D "0000:00:02.0",
+	.table =3D {
+		/* Panel EN/DISABLE */
+		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
 {
 	struct drm_device *dev =3D intel_dsi->base.base.dev;
@@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_=
dsi, bool panel_is_on)
=20
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC) {
+		gpiod_add_lookup_table(&pmic_panel_gpio_table);
+
 		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
@@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel=
_dsi, bool panel_is_on)
=20
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
+	struct drm_device *dev =3D intel_dsi->base.base.dev;
+	struct drm_i915_private *dev_priv =3D to_i915(dev);
+	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
+
 	if (intel_dsi->gpio_panel) {
 		gpiod_put(intel_dsi->gpio_panel);
 		intel_dsi->gpio_panel =3D NULL;
 	}
+
+	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
+	    mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)
+		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
 }
diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pm=
ic_core.c
index 47188df3080d..ddd64f9e3341 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -9,8 +9,6 @@
  */
=20
 #include <linux/acpi.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -25,17 +23,6 @@
 #define BYT_CRC_HRV		2
 #define CHT_CRC_HRV		3
=20
-/* Lookup table for the Panel Enable/Disable line as GPIO signals */
-static struct gpiod_lookup_table panel_gpio_table =3D {
-	/* Intel GFX is consumer */
-	.dev_id =3D "0000:00:02.0",
-	.table =3D {
-		/* Panel EN/DISABLE */
-		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 /* PWM consumed by the Intel GFX */
 static struct pwm_lookup crc_pwm_lookup[] =3D {
 	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight",=
 0, PWM_POLARITY_NORMAL),
@@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *=
i2c,
 	if (ret)
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
=20
-	/* Add lookup table binding for Panel Control to the GPIO Chip */
-	gpiod_add_lookup_table(&panel_gpio_table);
-
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
=20
@@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_clien=
t *i2c)
=20
 	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
=20
-	/* Remove lookup table for Panel Control from the GPIO Chip */
-	gpiod_remove_lookup_table(&panel_gpio_table);
-
 	/* remove crc-pwm lookup table */
 	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
=20
--=20
2.23.0

