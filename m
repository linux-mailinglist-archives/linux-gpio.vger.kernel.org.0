Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E83111F926
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 17:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfLOQij (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 11:38:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39457 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726299AbfLOQiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 11:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576427903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cdgN+bSwsf7iwrrVgFICT+X6bGsqP0dSoNkgexmb0Xw=;
        b=D2UqdiiH/EN5FzctvBhO5hdiD4VOgHZJOs6KiaSR7GlmoX9TVlLxv5I/jDOGVH03fOm9GP
        ZAbYgUaxAcK8rus3FNKWnrR8laykBSOxxCzks4yYM9wFFhTwUuLzjmluG4y38mDCMqf+ES
        zid6hzhhC5uqUmX6P9xbZtt8ybE5d7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-9inXzyAJPUCULcljvJeZPA-1; Sun, 15 Dec 2019 11:38:20 -0500
X-MC-Unique: 9inXzyAJPUCULcljvJeZPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADE1800D50;
        Sun, 15 Dec 2019 16:38:18 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BC9395D9C9;
        Sun, 15 Dec 2019 16:38:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/5] drm/i915/dsi: Move poking of panel-enable GPIO to intel_dsi_vbt.c
Date:   Sun, 15 Dec 2019 17:38:07 +0100
Message-Id: <20191215163810.52356-3-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On some older devices (BYT, CHT) which may use v2 VBT MIPI-sequences,
we need to manually control the panel enable GPIO as v2 sequences do
not do this.

So far we have been carrying the code to do this on BYT/CHT devices
with a Crystal Cove PMIC in vlv_dsi.c, but as this really is a shortcomin=
g
of the VBT MIPI-sequences, intel_dsi_vbt.c is a better place for this,
so move it there.

This is a preparation patch for adding panel-enable and backlight-enable
GPIO support for BYT devices where instead of the PMIC the SoC is used
for backlight control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     |  2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 46 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 27 +-----------
 3 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
index b15be5814599..de7e51cd3460 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -203,6 +203,8 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encod=
er, enum port port);
=20
 /* intel_dsi_vbt.c */
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
+void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
 void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id);
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
index f90946c912ee..5352e8c9eca5 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -453,8 +453,8 @@ static const char *sequence_name(enum mipi_seq seq_id=
)
 		return "(unknown)";
 }
=20
-void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
-				 enum mipi_seq seq_id)
+static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
+			       enum mipi_seq seq_id)
 {
 	struct drm_i915_private *dev_priv =3D to_i915(intel_dsi->base.base.dev)=
;
 	const u8 *data;
@@ -519,6 +519,18 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *i=
ntel_dsi,
 	}
 }
=20
+void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
+				 enum mipi_seq seq_id)
+{
+	if (seq_id =3D=3D MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
+		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
+
+	intel_dsi_vbt_exec(intel_dsi, seq_id);
+
+	if (seq_id =3D=3D MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
+		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
+}
+
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
 {
 	struct drm_i915_private *dev_priv =3D to_i915(intel_dsi->base.base.dev)=
;
@@ -671,3 +683,33 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi,=
 u16 panel_id)
=20
 	return true;
 }
+
+/*
+ * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
+ * control some GPIOs.
+ */
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
+{
+	struct drm_device *dev =3D intel_dsi->base.base.dev;
+	struct drm_i915_private *dev_priv =3D to_i915(dev);
+	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
+
+	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
+	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
+		intel_dsi->gpio_panel =3D
+			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
+
+		if (IS_ERR(intel_dsi->gpio_panel)) {
+			DRM_ERROR("Failed to own gpio for panel control\n");
+			intel_dsi->gpio_panel =3D NULL;
+		}
+	}
+}
+
+void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
+{
+	if (intel_dsi->gpio_panel) {
+		gpiod_put(intel_dsi->gpio_panel);
+		intel_dsi->gpio_panel =3D NULL;
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
index 6865fd4b5883..178d0fffba5b 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -23,7 +23,6 @@
  * Author: Jani Nikula <jani.nikula@intel.com>
  */
=20
-#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
=20
 #include <drm/drm_atomic_helper.h>
@@ -797,9 +796,6 @@ static void intel_dsi_pre_enable(struct intel_encoder=
 *encoder,
 	if (!IS_GEMINILAKE(dev_priv))
 		intel_dsi_prepare(encoder, pipe_config);
=20
-	/* Power on, try both CRC pmic gpio and VBT */
-	if (intel_dsi->gpio_panel)
-		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
 	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
=20
@@ -943,11 +939,8 @@ static void intel_dsi_post_disable(struct intel_enco=
der *encoder,
 	/* Assert reset */
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_ASSERT_RESET);
=20
-	/* Power off, try both CRC pmic gpio and VBT */
 	intel_dsi_msleep(intel_dsi, intel_dsi->panel_off_delay);
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_OFF);
-	if (intel_dsi->gpio_panel)
-		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
=20
 	/*
 	 * FIXME As we do with eDP, just make a note of the time here
@@ -1539,10 +1532,7 @@ static void intel_dsi_encoder_destroy(struct drm_e=
ncoder *encoder)
 {
 	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
=20
-	/* dispose of the gpios */
-	if (intel_dsi->gpio_panel)
-		gpiod_put(intel_dsi->gpio_panel);
-
+	intel_dsi_vbt_gpio_cleanup(intel_dsi);
 	intel_encoder_destroy(encoder);
 }
=20
@@ -1920,20 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_pri=
v)
=20
 	vlv_dphy_param_init(intel_dsi);
=20
-	/*
-	 * In case of BYT with CRC PMIC, we need to use GPIO for
-	 * Panel control.
-	 */
-	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
-	    (dev_priv->vbt.dsi.config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
-		intel_dsi->gpio_panel =3D
-			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
-
-		if (IS_ERR(intel_dsi->gpio_panel)) {
-			DRM_ERROR("Failed to own gpio for panel control\n");
-			intel_dsi->gpio_panel =3D NULL;
-		}
-	}
+	intel_dsi_vbt_gpio_init(intel_dsi);
=20
 	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DSI);
--=20
2.23.0

