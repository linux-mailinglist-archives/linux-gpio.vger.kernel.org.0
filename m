Return-Path: <linux-gpio+bounces-34612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAF2MMKrzml+pQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:47:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CD38CBBE
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F6A2307AFF5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 17:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25993ECBE7;
	Thu,  2 Apr 2026 17:44:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B03F164A
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151858; cv=none; b=UvwKZXFbKrKQ/fU7+TYQT8Ij2rDgw1k9a2caJ5tz8SolAyfFfvr6/7GXrJ3B/Br9vHd4KE90O/LEZD9Oy5xO9ZqSP8Jlk5m33w8R2MYkHiA/gfstQx7LbDRi+z1nXpshbOCSV+uH1wFknBUk1FEj0CuCn4qMtzU5EvGkfsDcDXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151858; c=relaxed/simple;
	bh=n3QsNqlF9Zg0zfyrgbmcvHBq22EZsivUW6dYyzZov3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=no8bUTmofqyRuCua64Qz+6dyN9n0893e0EncVsDi53aBjNr2T+jWHTL8f/26qmwYkweFlwADcjzQHZw+RjSclEcqfuH8hsBxAzgUB7Z3kAH62nAXhz2JAP4DJToHjXIF5/GZTiOBSANaJxAmgUDv9V5nlXwOQr098/OGId7xLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M59-000539-3n; Thu, 02 Apr 2026 19:43:51 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-003PUu-1C;
	Thu, 02 Apr 2026 19:43:50 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-0000000DVpp-1Cbt;
	Thu, 02 Apr 2026 19:43:50 +0200
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
Subject: [PATCH v11 5/6] hwmon: add NXP MC33978/MC34978 driver
Date: Thu,  2 Apr 2026 19:43:48 +0200
Message-ID: <20260402174349.3220518-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402174349.3220518-1-o.rempel@pengutronix.de>
References: <20260402174349.3220518-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34612-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,poll_work.work:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 2D0CD38CBBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add hardware monitoring support for the NXP MC33978/MC34978 Multiple
Switch Detection Interface (MSDI).

The hardware utilizes a clear-on-read FAULT register, but physical
faults remain asserted as long as the underlying condition exists. This
asserts a global FAULT_STAT bit on the SPI bus. To handle this without
trapping the CPU in an interrupt storm, this driver implements the
following architecture:
- Requests a rising-edge nested IRQ (IRQF_TRIGGER_RISING) from the MFD
  core to catch the initial 0 -> 1 transition of the global fault state.
- Caches hwmon-specific alarm bits and calculates state edges (XOR) to
  isolate alarm transitions from system integrity faults.
- Implements a 1Hz delayed workqueue that polls the hardware as long as
  any alarm is active. This compensates for the edge-triggered IRQ by
  discovering secondary faults that occur without a rising edge, and
  detecting when the hardware clears.

Assisted-by: Gemini:gemini-3.1-pro Sashiko
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
changes v11:
- no changes
changes v10:
- Use freezable polling
changes v9:
- add Acked-by: Guenter Roeck <linux@roeck-us.net>
changes v8:
- no changes
changes v7:
- Fix fault monitoring stall by unconditionally rearming on SPI read
  errors.
- Fix use-after-free race during unbind by correcting devm registration
  order.
changes v6:
- Protect clear-on-read FAULT register and state updates with hwmon_lock().
- Isolate hwmon alarm bits from system integrity bits to fix edge detection.
- Log system faults (SPI/HASH) as level-triggered and add temperature warning
  logs.
- Refactor sysfs read callback into smaller subsystem-specific helpers.
- Fix probe race condition by calling mc33978_hwmon_update_faults() at the end
  of probe instead of reading raw faults early.
- Expose static datasheet temperature limits via temp1_rated_min and
  temp1_rated_max
- Introduce variant-specific hw_info data to correctly report the max
  temperature
- Add a 1Hz delayed workqueue that polls the SPI bus while any alarm is active.
changes v5:
- no changes
changes v4:
- no changes
changes v3:
- no changes
changes v2:
- Switch from OF match table to platform_device_id
---
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/mc33978-hwmon.c | 549 ++++++++++++++++++++++++++++++++++
 3 files changed, 560 insertions(+)
 create mode 100644 drivers/hwmon/mc33978-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 328867242cb3..0c52e8268a20 100644
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
index 5833c807c688..4c3db5433a10 100644
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
index 000000000000..498ea85064ea
--- /dev/null
+++ b/drivers/hwmon/mc33978-hwmon.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+/*
+ * MC33978/MC34978 Hardware Monitor Driver
+ *
+ * Fault handling model:
+ *
+ * The FAULT register is clear-on-read for most bits, but persistent fault
+ * conditions remain asserted. The MFD core only harvests the aggregate
+ * FAULT_STAT indication from SPI responses and dispatches the hwmon child
+ * IRQ on that basis. Because a persistent fault can keep FAULT_STAT asserted,
+ * secondary fault assertions and fault clear events may not generate a fresh
+ * interrupt edge visible to the hwmon child.
+ *
+ * To provide stable hwmon alarm state, this driver:
+ * - caches only hwmon-relevant alarm bits
+ * - serializes FAULT register reads with cache updates
+ * - polls while any alarm remains active to detect secondary alarms and
+ *   clearing edges
+ *
+ * Raw integrity bits such as SPI_ERROR and HASH are logged, but are not
+ * exported through hwmon alarm attributes.
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
+/* Operating Temperature Ranges (Datasheet Rated) */
+#define MC33978_TEMP_MIN_MC		(-40000)
+#define MC33978_TEMP_MAX_MC		125000
+#define MC34978_TEMP_MAX_MC		105000
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
+#define MC33978_FAULT_POLL_INTERVAL_MS	1000
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
+
+	const struct mc33978_hwmon_hw_info *hw_info;
+
+	int fault_irq;
+
+	/* Cached hwmon alarm bits, serialized by hwmon_lock(). */
+	u32 last_faults;
+
+	/*
+	 * Background polling worker. Active only when faults are present
+	 * to compensate for the lack of clearing/secondary edge interrupts.
+	 */
+	struct delayed_work poll_work;
+};
+
+struct mc33978_hwmon_hw_info {
+	long rated_max_temp;
+};
+
+static const struct mc33978_hwmon_hw_info hwmon_hwinfo_mc33978 = {
+	.rated_max_temp = MC33978_TEMP_MAX_MC,
+};
+
+static const struct mc33978_hwmon_hw_info hwmon_hwinfo_mc34978 = {
+	.rated_max_temp = MC34978_TEMP_MAX_MC,
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
+	if (!new_faults)
+		return;
+
+	if (new_faults & MC33978_FAULT_TEMP_WARN)
+		dev_warn_ratelimited(priv->dev, "Temperature warning threshold reached\n");
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
+static int mc33978_hwmon_update_faults(struct mc33978_hwmon_priv *priv)
+{
+	u32 old_faults, new_faults, changed_faults;
+	u32 alarm_faults = 0;
+	u32 faults = 0;
+	bool rearm;
+	int ret;
+
+	/*
+	 * Serialize clear-on-read FAULT register access with cached alarm state
+	 * updates and hwmon sysfs readers.
+	 */
+	hwmon_lock(priv->hwmon_dev);
+	old_faults = priv->last_faults;
+
+	ret = mc33978_hwmon_read_fault(priv, &faults);
+	if (ret) {
+		hwmon_unlock(priv->hwmon_dev);
+		dev_err_ratelimited(priv->dev,
+				    "failed to read fault register: %pe\n",
+				    ERR_PTR(ret));
+		/*
+		 * Always retry on read failure. If we drop the heartbeat during
+		 * the initial fault before caching it, the edge-triggered IRQ
+		 * will never fire again and permanently stall fault monitoring.
+		 */
+		rearm = true;
+		goto out_poll;
+	}
+
+	/* Isolate hwmon alarm bits from system integrity bits */
+	alarm_faults = faults & MC33978_FAULT_ALARM_MASK;
+	changed_faults = alarm_faults ^ old_faults;
+	new_faults = alarm_faults & ~old_faults;
+	priv->last_faults = alarm_faults;
+
+	hwmon_unlock(priv->hwmon_dev);
+
+	if (faults & MC33978_FAULT_SPI_ERROR)
+		dev_err_ratelimited(priv->dev, "SPI communication error detected\n");
+	if (faults & MC33978_FAULT_HASH)
+		dev_err_ratelimited(priv->dev, "SPI register hash mismatch detected\n");
+
+	if (new_faults)
+		mc33978_hwmon_report_faults(priv, new_faults);
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
+	if (changed_faults)
+		hwmon_notify_event(priv->hwmon_dev, hwmon_chip,
+				   hwmon_chip_alarms, 0);
+
+	rearm = !!alarm_faults;
+
+out_poll:
+	/*
+	 * If any alarms are currently active, the global FAULT_STAT bit remains
+	 * asserted. The hardware will not generate a new rising edge interrupt
+	 * if a secondary fault occurs, nor will it interrupt when faults clear.
+	 * Schedule a poll to detect both clearing edges and secondary alarms.
+	 */
+	if (rearm)
+		/* Use freezable polling to pause while the system is suspended. */
+		mod_delayed_work(system_freezable_wq, &priv->poll_work,
+				 msecs_to_jiffies(MC33978_FAULT_POLL_INTERVAL_MS));
+
+	return ret;
+}
+
+static irqreturn_t mc33978_hwmon_fault_irq(int irq, void *data)
+{
+	struct mc33978_hwmon_priv *priv = data;
+
+	mc33978_hwmon_update_faults(priv);
+
+	return IRQ_HANDLED;
+}
+
+static void mc33978_hwmon_poll_work(struct work_struct *work)
+{
+	struct mc33978_hwmon_priv *priv =
+		container_of(work, struct mc33978_hwmon_priv, poll_work.work);
+
+	mc33978_hwmon_update_faults(priv);
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
+		case hwmon_temp_rated_min:
+		case hwmon_temp_rated_max:
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
+static int mc33978_hwmon_read_chip(struct mc33978_hwmon_priv *priv, u32 attr,
+				   long *val)
+{
+	if (attr == hwmon_chip_alarms) {
+		*val = priv->last_faults;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read_in_vbatp(struct mc33978_hwmon_priv *priv,
+				       u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_in_crit:
+		*val = MC33978_VBATP_OV_MV;
+		return 0;
+	case hwmon_in_max:
+		*val = MC33978_VBATP_FUNC_MV;
+		return 0;
+	case hwmon_in_min:
+		*val = MC33978_VBATP_DEGRADED_MV;
+		return 0;
+	case hwmon_in_lcrit:
+		*val = MC33978_VBATP_UVLO_MV;
+		return 0;
+	case hwmon_in_crit_alarm:
+		*val = !!(priv->last_faults & MC33978_FAULT_OV);
+		return 0;
+	case hwmon_in_lcrit_alarm:
+		*val = !!(priv->last_faults & MC33978_FAULT_UV);
+		return 0;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read_in_vddq(u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_in_max:
+		*val = MC33978_VDDQ_MAX_MV;
+		return 0;
+	case hwmon_in_min:
+		*val = MC33978_VDDQ_MIN_MV;
+		return 0;
+	case hwmon_in_lcrit:
+		*val = MC33978_VDDQ_UV_MV;
+		return 0;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read_in(struct mc33978_hwmon_priv *priv, u32 attr,
+				 int channel, long *val)
+{
+	switch (channel) {
+	case MC33978_IN_VBATP:
+		return mc33978_hwmon_read_in_vbatp(priv, attr, val);
+	case MC33978_IN_VDDQ:
+		return mc33978_hwmon_read_in_vddq(attr, val);
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read_temp(struct mc33978_hwmon_priv *priv, u32 attr,
+				   long *val)
+{
+	switch (attr) {
+	case hwmon_temp_max:
+		*val = MC33978_TEMP_WARN_MC;
+		return 0;
+	case hwmon_temp_crit:
+		*val = MC33978_TEMP_CRIT_MC;
+		return 0;
+	case hwmon_temp_crit_hyst:
+		*val = MC33978_TEMP_CRIT_MC - MC33978_TEMP_HYST_MC;
+		return 0;
+	case hwmon_temp_max_alarm:
+		*val = !!(priv->last_faults & MC33978_FAULT_TEMP_WARN);
+		return 0;
+	case hwmon_temp_crit_alarm:
+		*val = !!(priv->last_faults & MC33978_FAULT_OT);
+		return 0;
+	case hwmon_temp_rated_min:
+		*val = MC33978_TEMP_MIN_MC;
+		return 0;
+	case hwmon_temp_rated_max:
+		*val = priv->hw_info->rated_max_temp;
+		return 0;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int mc33978_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct mc33978_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_chip:
+		return mc33978_hwmon_read_chip(priv, attr, val);
+	case hwmon_in:
+		return mc33978_hwmon_read_in(priv, attr, channel, val);
+	case hwmon_temp:
+		return mc33978_hwmon_read_temp(priv, attr, val);
+	default:
+		break;
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
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_RATED_MIN | HWMON_T_RATED_MAX),
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
+static void mc33978_hwmon_action_cancel_work(void *data)
+{
+	struct mc33978_hwmon_priv *priv = data;
+
+	cancel_delayed_work_sync(&priv->poll_work);
+}
+
+static int mc33978_hwmon_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id;
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
+	id = platform_get_device_id(pdev);
+	if (!id || !id->driver_data)
+		return dev_err_probe(dev, -EINVAL, "missing device match data\n");
+
+	priv->hw_info = (const struct mc33978_hwmon_hw_info *)id->driver_data;
+
+	priv->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv->map)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	INIT_DELAYED_WORK(&priv->poll_work, mc33978_hwmon_poll_work);
+
+	priv->fault_irq = platform_get_irq(pdev, 0);
+	if (priv->fault_irq < 0)
+		return priv->fault_irq;
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
+	ret = devm_add_action_or_reset(dev, mc33978_hwmon_action_cancel_work,
+				       priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * The FAULT child IRQ is generated by the MFD core from transitions of
+	 * the aggregated FAULT_STAT bus state. Request a rising-edge nested
+	 * IRQ so the core dispatches the hwmon fault handler when faults become
+	 * active.
+	 *
+	 * Fault clearing and secondary faults while FAULT_STAT remains asserted
+	 * are handled by the hwmon polling path.
+	 */
+	ret = devm_request_threaded_irq(dev, priv->fault_irq, NULL,
+					mc33978_hwmon_fault_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request fault IRQ\n");
+
+	return mc33978_hwmon_update_faults(priv);
+}
+
+static const struct platform_device_id mc33978_hwmon_id[] = {
+	{ "mc33978-hwmon", (kernel_ulong_t)&hwmon_hwinfo_mc33978 },
+	{ "mc34978-hwmon", (kernel_ulong_t)&hwmon_hwinfo_mc34978 },
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


