Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD15911F920
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 17:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfLOQiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 11:38:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51795 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726536AbfLOQiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Dec 2019 11:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576427904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4jsQeTa9+tKAcks/nLyZi1gT8Q5NqYoTibMwTcABwCY=;
        b=PIxvXaIzlq6WhpPdwXtWkR+8/mAMRnFZzLX6BJsA3zaFJly4/nAlOKICietyireCdc1ok2
        mYiG87GULvi/5z13t6YgYWSv3VYePNQ+iXKUD1mpLD7KCmMLFocG91aWqmkyzbwgcp/KTt
        pQKMYmhlKkX1BHlwZepfnptpCJGpLFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-MbXVefckNIaFhU7aH_IJYA-1; Sun, 15 Dec 2019 11:38:22 -0500
X-MC-Unique: MbXVefckNIaFhU7aH_IJYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ABAB107ACC4;
        Sun, 15 Dec 2019 16:38:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4345D9C9;
        Sun, 15 Dec 2019 16:38:18 +0000 (UTC)
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
Subject: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the LCD is initially off
Date:   Sun, 15 Dec 2019 17:38:08 +0100
Message-Id: <20191215163810.52356-4-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When the LCD has not been turned on by the firmware/GOP, because e.g. the
device was booted with an external monitor connected over HDMI, we should
not turn on the panel-enable GPIO when we request it.

Turning on the panel-enable GPIO when we request it, means we turn it on
too early in the init-sequence, which causes some panels to not correctly
light up.

This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingl=
y.

This fixes the panel not lighting up on a Thundersoft TST168 tablet when
booted with an external monitor connected over HDMI.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
index de7e51cd3460..675771ea91aa 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encod=
er, enum port port);
=20
 /* intel_dsi_vbt.c */
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
-void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on);
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
 void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
index 5352e8c9eca5..027970348b22 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi=
, u16 panel_id)
  * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
  * control some GPIOs.
  */
-void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
 {
 	struct drm_device *dev =3D intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv =3D to_i915(dev);
 	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
+	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW=
;
=20
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
-		intel_dsi->gpio_panel =3D
-			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
-
+		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
 			intel_dsi->gpio_panel =3D NULL;
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
index 178d0fffba5b..e86e4a11e199 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1910,7 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv=
)
=20
 	vlv_dphy_param_init(intel_dsi);
=20
-	intel_dsi_vbt_gpio_init(intel_dsi);
+	intel_dsi_vbt_gpio_init(intel_dsi, current_mode !=3D NULL);
=20
 	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DSI);
--=20
2.23.0

