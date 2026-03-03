Return-Path: <linux-gpio+bounces-32420-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL8YHEbnpmnjZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32420-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:51:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA01F0BE7
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF0D30F05A7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 13:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB5429817;
	Tue,  3 Mar 2026 13:40:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD142428482
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545219; cv=none; b=THD3av1AlRnGFYjto5+Z1Kg/JdPXZqGve4vOZdRG+1Q4TwZYMQfSuW34MllXxhFw2KDUnjMTxGAZ7K0a7r+2cDXoQa656z0GuXWZPUYySVZEIC/vwiJidNfgPphaLp7t9diE7yUVy67KKTvU2pA94SRhRBW7uc7T6Dk8m0yBoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545219; c=relaxed/simple;
	bh=zlkN37t3ie7E508/W53B8Cpl5n22x2+hNJpeou8Kk+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mnv68q96V36wnZYmfrvjwOm5XzALlxsIJN6n39zDiKtPASJufMlP6Gw370ZlH2neqHGw9mFBtha8xPHg8+r49OSCtPYMoEHsU5+CL/hY0ZdD/aBW1SVI4DfSOUHvZsY/8MSJz2u7wPqRYAtWm1TGEo0rSBTdCIJPwl8vR8V8rws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyX-0000VO-CK; Tue, 03 Mar 2026 14:39:49 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyV-003YXJ-2U;
	Tue, 03 Mar 2026 14:39:49 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyX-00000004ief-08N4;
	Tue, 03 Mar 2026 14:39:49 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v2 5/6] hwmon: add NXP MC33978/MC34978 driver
Date: Tue,  3 Mar 2026 14:39:45 +0100
Message-ID: <20260303133947.1123575-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303133947.1123575-1-o.rempel@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Queue-Id: 23FA01F0BE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-32420-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

Add hardware monitoring support for the NXP MC33978/MC34978 MSDI.

The driver exposes static operating thresholds (thermal, over-voltage,
under-voltage) and reports dynamic hardware fault alarms.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v2:
- Switch from OF match table to platform_device_id
---
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/mc33978-hwmon.c | 430 ++++++++++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)
 create mode 100644 drivers/hwmon/mc33978-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..c5d99510cc00 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -700,6 +700,16 @@ config SENSORS_MC13783_ADC
         help
           Support for the A/D converter on MC13783 and MC13892 PMIC.
 
+config SENSORS_MC33978
+	tristate "NXP MC33978/MC34978 fault monitoring"
+	depends on MFD_MC33978
+	help
+	  If you say yes here you get fault monitoring support for the
+	  NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).
+
+	  This driver can also be built as a module. If so, the module
+	  will be called mc33978-hwmon.
+
 config SENSORS_MC33XS2410
 	tristate "MC33XS2410 HWMON support"
 	depends on PWM_MC33XS2410
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..e40bc29b9850 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
 obj-$(CONFIG_MAX31827) += max31827.o
 obj-$(CONFIG_SENSORS_MAX77705) += max77705-hwmon.o
 obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
+obj-$(CONFIG_SENSORS_MC33978)	+= mc33978-hwmon.o
 obj-$(CONFIG_SENSORS_MC33XS2410) += mc33xs2410_hwmon.o
 obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
diff --git a/drivers/hwmon/mc33978-hwmon.c b/drivers/hwmon/mc33978-hwmon.c
new file mode 100644
index 000000000000..8740523773f7
--- /dev/null
+++ b/drivers/hwmon/mc33978-hwmon.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+/*
+ * MC33978/MC34978 Hardware Monitor Driver
+ *
+ * CRITICAL HARDWARE BEHAVIOR - THERMAL (tLIM):
+ * When the thermal limit (>155°C) is reached, the IC autonomously
+ * reduces the continuous wetting current (CWET) to 2.0 mA to prevent
+ * thermal destruction. This throttling persists until the silicon cools
+ * down below 140°C (15°C hysteresis).
+ *
+ * WARNING FOR PINCTRL/GPIO CONSUMERS:
+ * During an active tLIM fault, the switch state detection becomes
+ * inherently unreliable. A throttled wetting current of 2.0 mA may
+ * be insufficient to break through the oxide layer of mechanical
+ * contacts in the field, leading to false-open GPIO readings.
+ *
+ * VOLTAGE DEGRADATION WARNING (VBATP):
+ * While the hard Undervoltage Lockout (UVLO) asserts strictly at 4.5V,
+ * the silicon operates with degraded parametrics whenever the supply
+ * drops below 6.0V. System designers must be aware that analog routing
+ * (AMUX) and switch detection logic may behave non-deterministically
+ * before the actual UV alarm triggers.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/mc33978.h>
+
+/* Thermal Warning threshold (~120C) */
+#define MC33978_TEMP_WARN_MC		120000
+
+/* Thermal Limit / tLIM (>155C) - Hardware enters CWET throttling */
+#define MC33978_TEMP_CRIT_MC		155000
+
+/* Hysteresis for tLIM recovery (Silicon must cool to <140C) */
+#define MC33978_TEMP_HYST_MC		15000
+
+/* VBATP (in0) IC Level thresholds */
+#define MC33978_VBATP_OV_MV		36000 /* Overvoltage limit */
+#define MC33978_VBATP_FUNC_MV		28000 /* Functional/Normal boundary */
+#define MC33978_VBATP_DEGRADED_MV	6000 /* Degraded parametrics start */
+#define MC33978_VBATP_UVLO_MV		4500 /* UV Rising Threshold max */
+
+/* VDDQ (in1) Logic Supply thresholds */
+#define MC33978_VDDQ_MAX_MV		5250 /* Operating Condition max */
+#define MC33978_VDDQ_MIN_MV		3000 /* Operating Condition min */
+#define MC33978_VDDQ_UV_MV		2800 /* UV Falling Threshold max */
+
+enum mc33978_hwmon_in_channels {
+	MC33978_IN_VBATP,
+	MC33978_IN_VDDQ,
+};
+
+struct mc33978_hwmon_priv {
+	struct device *dev;
+	struct device *hwmon_dev;
+	struct regmap *map;
+	int fault_irq;
+	u32 last_faults;
+};
+
+static int mc33978_hwmon_read_fault(struct mc33978_hwmon_priv *priv,
+				    u32 *faults)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->map, MC33978_REG_FAULT, &val);
+	if (ret)
+		return ret;
+
+	*faults = val;
+
+	return 0;
+}
+
+static void mc33978_hwmon_report_faults(struct mc33978_hwmon_priv *priv,
+					u32 new_faults)
+{
+	/*
+	 * Log only newly asserted critical faults to prevent kernel log spam
+	 * during persistent hardware fault conditions.
+	 * dev_*_ratelimited provides an additional safety net against noisy IRQs.
+	 */
+	if (!new_faults)
+		return;
+
+	if (new_faults & MC33978_FAULT_OT)
+		dev_crit_ratelimited(priv->dev, "Over-temperature fault detected!\n");
+
+	if (new_faults & MC33978_FAULT_OV)
+		dev_crit_ratelimited(priv->dev, "Over-voltage fault detected!\n");
+
+	if (new_faults & MC33978_FAULT_UV)
+		dev_err_ratelimited(priv->dev, "Under-voltage fault detected!\n");
+}
+
+static irqreturn_t mc33978_hwmon_fault_irq(int irq, void *data)
+{
+	struct mc33978_hwmon_priv *priv = data;
+	u32 faults, new_faults, changed_faults;
+	int ret;
+
+	ret = mc33978_hwmon_read_fault(priv, &faults);
+	if (ret) {
+		dev_err_ratelimited(priv->dev, "Failed to read fault register: %pe\n",
+				    ERR_PTR(ret));
+		return IRQ_NONE;
+	}
+
+	changed_faults = faults ^ priv->last_faults;
+	if (!changed_faults)
+		return IRQ_HANDLED;
+
+	new_faults = faults & ~priv->last_faults;
+	if (new_faults)
+		mc33978_hwmon_report_faults(priv, new_faults);
+
+	priv->last_faults = faults;
+
+	if (changed_faults & MC33978_FAULT_UV)
+		hwmon_notify_event(priv->hwmon_dev, hwmon_in,
+				   hwmon_in_lcrit_alarm, MC33978_IN_VBATP);
+
+	if (changed_faults & MC33978_FAULT_OV)
+		hwmon_notify_event(priv->hwmon_dev, hwmon_in,
+				   hwmon_in_crit_alarm, MC33978_IN_VBATP);
+
+	if (changed_faults & MC33978_FAULT_TEMP_WARN)
+		hwmon_notify_event(priv->hwmon_dev, hwmon_temp,
+				   hwmon_temp_max_alarm, 0);
+
+	if (changed_faults & MC33978_FAULT_OT)
+		hwmon_notify_event(priv->hwmon_dev, hwmon_temp,
+				   hwmon_temp_crit_alarm, 0);
+
+	/* Push a chip-level alarm on any hardware status change */
+	hwmon_notify_event(priv->hwmon_dev, hwmon_chip,
+			   hwmon_chip_alarms, 0);
+
+	return IRQ_HANDLED;
+}
+
+static umode_t mc33978_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		if (attr == hwmon_chip_alarms)
+			return 0444;
+		break;
+
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+		case hwmon_in_max:
+		case hwmon_in_min:
+		case hwmon_in_lcrit:
+			return 0444;
+		case hwmon_in_crit:
+			if (channel == MC33978_IN_VBATP)
+				return 0444;
+			break;
+		case hwmon_in_crit_alarm:
+		case hwmon_in_lcrit_alarm:
+			if (channel == MC33978_IN_VBATP)
+				return 0444;
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mc33978_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct mc33978_hwmon_priv *priv = dev_get_drvdata(dev);
+	u32 faults;
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		if (channel == MC33978_IN_VBATP) {
+			switch (attr) {
+			case hwmon_in_crit:
+				*val = MC33978_VBATP_OV_MV;
+				return 0;
+			case hwmon_in_max:
+				*val = MC33978_VBATP_FUNC_MV;
+				return 0;
+			case hwmon_in_min:
+				*val = MC33978_VBATP_DEGRADED_MV;
+				return 0;
+			case hwmon_in_lcrit:
+				*val = MC33978_VBATP_UVLO_MV;
+				return 0;
+			default:
+				break;
+			}
+		} else if (channel == MC33978_IN_VDDQ) {
+			switch (attr) {
+			case hwmon_in_max:
+				*val = MC33978_VDDQ_MAX_MV;
+				return 0;
+			case hwmon_in_min:
+				*val = MC33978_VDDQ_MIN_MV;
+				return 0;
+			case hwmon_in_lcrit:
+				*val = MC33978_VDDQ_UV_MV;
+				return 0;
+			default:
+				break;
+			}
+		}
+		break;
+
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+			*val = MC33978_TEMP_WARN_MC;
+			return 0;
+		case hwmon_temp_crit:
+			*val = MC33978_TEMP_CRIT_MC;
+			return 0;
+		case hwmon_temp_crit_hyst:
+			*val = MC33978_TEMP_CRIT_MC - MC33978_TEMP_HYST_MC;
+			return 0;
+		default:
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	/* 2. Dynamic alarms (read hardware flags) */
+	ret = mc33978_hwmon_read_fault(priv, &faults);
+	if (ret)
+		return ret;
+
+	switch (type) {
+	case hwmon_chip:
+		if (attr == hwmon_chip_alarms) {
+			*val = faults;
+			return 0;
+		}
+		break;
+
+	case hwmon_in:
+		if (channel == MC33978_IN_VBATP) {
+			switch (attr) {
+			case hwmon_in_crit_alarm:
+				*val = !!(faults & MC33978_FAULT_OV);
+				return 0;
+			case hwmon_in_lcrit_alarm:
+				*val = !!(faults & MC33978_FAULT_UV);
+				return 0;
+			default:
+				*val = 0;
+				return 0;
+			}
+		}
+		/* VDDQ has no dedicated hardware fault flags */
+		*val = 0;
+		return 0;
+
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max_alarm:
+			*val = !!(faults & MC33978_FAULT_TEMP_WARN);
+			return 0;
+		case hwmon_temp_crit_alarm:
+			*val = !!(faults & MC33978_FAULT_OT);
+			return 0;
+		default:
+			break;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read_string(struct device *dev,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	/* Only in_label is supported for string reads */
+	if (type != hwmon_in || attr != hwmon_in_label)
+		return -EOPNOTSUPP;
+
+	switch (channel) {
+	case MC33978_IN_VBATP:
+		*str = "VBATP";
+		return 0;
+	case MC33978_IN_VDDQ:
+		*str = "VDDQ";
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct hwmon_channel_info * const mc33978_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM),
+	HWMON_CHANNEL_INFO(in,
+			   /* Index 0: MC33978_IN_VBATP */
+			   HWMON_I_LABEL | HWMON_I_CRIT | HWMON_I_MAX |
+			   HWMON_I_MIN | HWMON_I_LCRIT |
+			   HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM,
+
+			   /* Index 1: MC33978_IN_VDDQ */
+			   HWMON_I_LABEL | HWMON_I_MAX | HWMON_I_MIN |
+			   HWMON_I_LCRIT),
+	NULL
+};
+
+static const struct hwmon_ops mc33978_hwmon_ops = {
+	.is_visible = mc33978_hwmon_is_visible,
+	.read_string = mc33978_hwmon_read_string,
+	.read = mc33978_hwmon_read,
+};
+
+static const struct hwmon_chip_info mc33978_hwmon_chip_info = {
+	.ops = &mc33978_hwmon_ops,
+	.info = mc33978_hwmon_info,
+};
+
+static int mc33978_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mc33978_hwmon_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv->map)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->fault_irq = platform_get_irq(pdev, 0);
+	if (priv->fault_irq < 0)
+		return priv->fault_irq;
+
+	ret = mc33978_hwmon_read_fault(priv, &priv->last_faults);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read initial faults\n");
+
+	if (priv->last_faults & MC33978_FAULT_CRITICAL)
+		mc33978_hwmon_report_faults(priv, priv->last_faults);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "mc33978", priv,
+							 &mc33978_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
+				     "failed to register hwmon device\n");
+
+	priv->hwmon_dev = hwmon_dev;
+
+	ret = devm_request_threaded_irq(dev, priv->fault_irq, NULL,
+					mc33978_hwmon_fault_irq, IRQF_ONESHOT,
+					dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request fault IRQ\n");
+
+	return 0;
+}
+
+static const struct platform_device_id mc33978_hwmon_id[] = {
+	{ "mc33978-hwmon", },
+	{ "mc34978-hwmon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, mc33978_hwmon_id);
+
+static struct platform_driver mc33978_hwmon_driver = {
+	.driver = {
+		.name = "mc33978-hwmon",
+	},
+	.probe = mc33978_hwmon_probe,
+	.id_table = mc33978_hwmon_id,
+};
+module_platform_driver(mc33978_hwmon_driver);
+
+MODULE_AUTHOR("Oleksij Rempel <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("NXP MC33978/MC34978 Hardware Monitor Driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


