Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5C3121B4D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 21:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfLPUvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 15:51:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45461 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727500AbfLPUvq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 15:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EPtGGtbmK8Ua4ihCISYN9ulc/oNUQiVsk18eHaZb2Ok=;
        b=VgOK8j7ttnXwYUbvSiO0vL4FQx38uhLu11uiQ4qLKBNA3AA4Xcz4lFis6IXiKnlbmlU9U5
        2iVrKEHX6JSkXO7E0a/s6KL02M3jglDWRLijLrr22kRbVQE4yOfME8FgRc7KSZRlbwPWtS
        ITo2vPDOSaQFVwZIPtBfFOcsbBPJ62Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-kAMdGsJIPkyoA21YfKjQVw-1; Mon, 16 Dec 2019 15:51:41 -0500
X-MC-Unique: kAMdGsJIPkyoA21YfKjQVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12B67800D5B;
        Mon, 16 Dec 2019 20:51:40 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D35201001B00;
        Mon, 16 Dec 2019 20:51:37 +0000 (UTC)
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
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/5] drm/i915/dsi: Control panel and backlight enable GPIOs on BYT
Date:   Mon, 16 Dec 2019 21:51:22 +0100
Message-Id: <20191216205122.1850923-6-hdegoede@redhat.com>
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

On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
do not control the LCD panel- and backlight-enable GPIOs. So far, when
the VBT indicates we should use the SoC for backlight control, we have
been relying on these GPIOs being configured as output and driven high by
the Video BIOS (GOP) when it initializes the panel.

This does not work when the device is booted with a HDMI monitor connecte=
d
as then the GOP will initialize the HDMI instead of the panel, leaving th=
e
panel black, even though the i915 driver tries to output an image to it.

Likewise on some device-models when the GOP does not initialize the DSI
panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
of muxing it to the PWM controller.

This commit makes the DSI code control the SoC GPIOs for panel- and
backlight-enable on BYT, when the VBT indicates the SoC should be used

for backlight control. It also ensures that the PWM0 pin is muxed to the
PWM controller in this case.

This fixes the LCD panel not lighting up on various devices when booted
with a HDMI monitor connected. This has been tested to fix this on the
following devices:

Peaq C1010
Point of View MOBII TAB-P800W
Point of View MOBII TAB-P1005W
Terra Pad 1061
Yours Y8W81

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     |  3 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 64 ++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
index 675771ea91aa..7481a5aa3084 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -45,8 +45,9 @@ struct intel_dsi {
 	struct intel_dsi_host *dsi_hosts[I915_MAX_PORTS];
 	intel_wakeref_t io_wakeref[I915_MAX_PORTS];
=20
-	/* GPIO Desc for CRC based Panel control */
+	/* GPIO Desc for panel and backlight control */
 	struct gpio_desc *gpio_panel;
+	struct gpio_desc *gpio_backlight;
=20
 	struct intel_connector *attached_connector;
=20
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
index 89558ccf79c8..0032161e0f76 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -27,6 +27,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/mfd/intel_soc_pmic.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
 #include <linux/slab.h>
=20
 #include <asm/intel-mid.h>
@@ -525,11 +527,15 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *=
intel_dsi,
 {
 	if (seq_id =3D=3D MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
 		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
+	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_ON && intel_dsi->gpio_backlight)
+		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 1);
=20
 	intel_dsi_vbt_exec(intel_dsi, seq_id);
=20
 	if (seq_id =3D=3D MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
 		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
+	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_OFF && intel_dsi->gpio_backlight)
+		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 0);
 }
=20
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
@@ -688,6 +694,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, =
u16 panel_id)
 /*
  * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
  * control some GPIOs. We need to add a GPIO lookup table before we get =
these.
+ * If the GOP did not initialize the panel (HDMI inserted) we may need t=
o also
+ * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
  */
 static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
 	/* Intel GFX is consumer */
@@ -699,23 +707,69 @@ static struct gpiod_lookup_table pmic_panel_gpio_ta=
ble =3D {
 	},
 };
=20
+static struct gpiod_lookup_table soc_panel_gpio_table =3D {
+	.dev_id =3D "0000:00:02.0",
+	.table =3D {
+		GPIO_LOOKUP("INT33FC:01", 10, "backlight", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:01", 11, "panel", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static const struct pinctrl_map soc_pwm_pinctrl_map[] =3D {
+	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
+			  "pwm0_grp", "pwm"),
+};
+
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
 {
 	struct drm_device *dev =3D intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv =3D to_i915(dev);
 	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
 	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW=
;
+	bool want_backlight_gpio =3D false;
+	bool want_panel_gpio =3D false;
+	struct pinctrl *pinctrl;
+	int ret;
=20
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC) {
 		gpiod_add_lookup_table(&pmic_panel_gpio_table);
+		want_panel_gpio =3D true;
+	}
+
+	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC)=
 {
+		gpiod_add_lookup_table(&soc_panel_gpio_table);
+		want_panel_gpio =3D true;
+		want_backlight_gpio =3D true;
=20
+		/* Ensure PWM0 pin is muxed as PWM instead of GPIO */
+		ret =3D pinctrl_register_mappings(soc_pwm_pinctrl_map,
+					     ARRAY_SIZE(soc_pwm_pinctrl_map));
+		if (ret)
+			DRM_ERROR("Failed to register pwm0 pinmux mapping\n");
+
+		pinctrl =3D devm_pinctrl_get_select(dev->dev, "soc_pwm0");
+		if (IS_ERR(pinctrl))
+			DRM_ERROR("Failed to set pinmux to PWM\n");
+	}
+
+	if (want_panel_gpio) {
 		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
 			intel_dsi->gpio_panel =3D NULL;
 		}
 	}
+
+	if (want_backlight_gpio) {
+		intel_dsi->gpio_backlight =3D
+			gpiod_get(dev->dev, "backlight", flags);
+		if (IS_ERR(intel_dsi->gpio_backlight)) {
+			DRM_ERROR("Failed to own gpio for backlight control\n");
+			intel_dsi->gpio_backlight =3D NULL;
+		}
+	}
 }
=20
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
@@ -729,7 +783,17 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *in=
tel_dsi)
 		intel_dsi->gpio_panel =3D NULL;
 	}
=20
+	if (intel_dsi->gpio_backlight) {
+		gpiod_put(intel_dsi->gpio_backlight);
+		intel_dsi->gpio_backlight =3D NULL;
+	}
+
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)
 		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
+
+	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC)=
 {
+		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
+		gpiod_remove_lookup_table(&soc_panel_gpio_table);
+	}
 }
--=20
2.23.0

