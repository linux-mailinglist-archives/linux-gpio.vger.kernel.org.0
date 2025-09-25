Return-Path: <linux-gpio+bounces-26591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA3BA0439
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A1C1891434
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC9630BF4F;
	Thu, 25 Sep 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrGxSkdh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB61307ACA
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813454; cv=none; b=Q3JmPn1uYKrR9Hlk+44/XuklNk1t2AN5uBssNt6V3UfAf0y2LeJcgnbFrKZ9WjpZDOHLsbwWvjjqUHPFv/tzkSfr36wRukRJt8JQrtKP07DZPdMbtotUy9wBJnODIQLMXg7b7hV5NY/a1a7VE3ncKFWMc/txsugsv2IUJ+cr0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813454; c=relaxed/simple;
	bh=+vaguLiscLlY2wui/x0Pc+b0HHHunb2rL7xeIcPuIcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnD6+qCS9mS7m5/JRhtIa50xeWtOWZl5CmJRdEmsWfMX1XK1Jb1/3Tj/5xGoDZ11ibL/QxPyeD32ViXm2Ot7y6ZEl66jo7xC29pLHdcfIuSHiCTfWAq8HcIdXSCc1S5eTFHKsBmP16PRc6Hkd/GA0cEJ/Avr3OwAmDF0KICegLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrGxSkdh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57a960fe78fso1169239e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813448; x=1759418248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0Uqms/e6UmF0yeUD6oONuQebIlURzRqwaWDPzObW1o=;
        b=OrGxSkdh/bwlGnZOGtOyFGG8M0eUQT0QUnWwj2iLAt7VjLqtW14eHkyyuPOyGgdXkf
         dSQ+KpF9pd+Ubqt/aT8VYMYTAvPMuhkBrpv3OQ/wcMETEbYqRBh9ayLw9+MntHQR8s4F
         tlj1u7jAZQOzsEQ92DkVLEUIyRNUvTyPl9U0vEBjgkD3Jr04rI0mh7FCuMOrvxQj+0Qz
         4PzD6ACE8iK0r4gw40wKDo3KhidURSonwUWJc98ujMAu1Uu6tB9xtCWfYW2VN8/mJxHx
         YT7BoXsxyugeSD2w8c6FlsDtJiXfdwmdRioZvT3p8+1HoVeogmYX2LAk3MUN0G/zaZzt
         8Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813448; x=1759418248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0Uqms/e6UmF0yeUD6oONuQebIlURzRqwaWDPzObW1o=;
        b=ail+cW0Gz56QrX5TPKHEjFKvRD3uxGHCIyxyHhV7EpaoIHy0mZ1JfCK8J+Us+YSMlh
         mv6ti6xReSsPEmN/izPc6zPW8EmKZ82Hgbm6itkN3enp6A0T5a18BAogSSmrBTDO/r6v
         cNC/SFJ7/61258nP/bO4lN5nOF9Z/YpDWfafy0dQ95zjn/UQZD6j28tNLGSxQ7kZiB0K
         rLRM98gMOVo+ckF5Rlymq+6qmYNoFgnWMuweBEoGtfm+AFRfiv3FlQm9yQiUrzzv6QFx
         d6x3zgk8lgB1lj8y65r1vuMYVIhPL5reKcC3uTbWU/VdvLIsdDFUdKP32M/+xAKQypY6
         Xf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM1mqUGKBhshcW9iD0+nWt9u+dyx4v7qJ4OYGzflllN5jPi5cNSA0YOohCMP1N7v93a1unJc3iba8x@vger.kernel.org
X-Gm-Message-State: AOJu0YzRim+DcDAwGAibP87CBpk7+BQqzpcHlgAggE5bAFLn5p84HMc+
	OoKbsSG4OE1zi2Zu77Tg9KohnjPSMLp0DuAcGeEp45tc++wCnoQovtzh
X-Gm-Gg: ASbGncvu1pvmJMdwBQlx3VMKTFNFSpSBGf41ERZcB7W8V2u2I2l1IkZOLHWy4tlJoUb
	9pjZM0sbsrd1J9UugC7JDAatRJMyfC+WHZjLEWeS2bt5EXsq6Sh+t4CMnKjVs/vg2sQ6lNFeCEt
	2DrZJLCzqZOAEanUUJggeEJ7TBvDGW/YQdZOIW6gD8eeLY8C+VnpYiOg4eNIzcsL+5LJp6EEUhy
	rtCQKBCYIfGQSBBEzCi8XMePy2lD8OomzNxcMSBYumZPRFFmE3g3AZxxgfd0PpuegOYiugUXAeD
	xDLt26hSusB70uc5Ux7qSFcubLEfnOl30ClSKDPvQ/S9o1iAhQJLO/Bbiy9DZk31dg4ouDg6OdX
	GGp/7KwuyRPsauA==
X-Google-Smtp-Source: AGHT+IFX1ZdY2cz58VocSZY1fSPcc1gcXq7OoXBGoQv9NhpHvkkKv4qu3+e0KtQDD4yCo/x14CJLXg==
X-Received: by 2002:ac2:51c6:0:b0:573:8044:a98c with SMTP id 2adb3069b0e04-582d12fe24dmr1261609e87.18.1758813447316;
        Thu, 25 Sep 2025 08:17:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 09/22] gpu: host1x: convert MIPI to use operation function pointers
Date: Thu, 25 Sep 2025 18:16:35 +0300
Message-ID: <20250925151648.79510-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing MIPI code to use operation function pointers, a necessary
step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
that is SoC-independent remains in mipi.c, while all SoC-specific code is
moved to tegra114-mipi.c (The naming matches the first SoC generation with
a dedicated calibration block). Shared structures and function calls are
placed into tegra-mipi-cal.h.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c             |   1 +
 drivers/gpu/host1x/Makefile             |   1 +
 drivers/gpu/host1x/dev.c                |   2 +
 drivers/gpu/host1x/dev.h                |   2 +
 drivers/gpu/host1x/mipi.c               | 501 +++---------------------
 drivers/gpu/host1x/tegra114-mipi.c      | 483 +++++++++++++++++++++++
 drivers/staging/media/tegra-video/csi.c |   1 +
 include/linux/host1x.h                  |  10 -
 include/linux/tegra-mipi-cal.h          |  56 +++
 9 files changed, 594 insertions(+), 463 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 64f12a85a9dd..278bf2c85524 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index ee5286ffe08d..fead483af0b4 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	tegra114-mipi.o \
 	fence.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0..6c403c8e867b 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -782,7 +782,9 @@ static struct platform_driver tegra_host1x_driver = {
 
 static struct platform_driver * const drivers[] = {
 	&tegra_host1x_driver,
+#if !defined(CONFIG_ARCH_TEGRA_2x_SOC) && !defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	&tegra_mipi_driver,
+#endif
 };
 
 static int __init tegra_host1x_init(void)
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index d3855a1c6b47..9be9669d3b1c 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -354,6 +354,8 @@ static inline void host1x_hw_show_mlocks(struct host1x *host, struct output *o)
 	host->debug_op->show_mlocks(host, o);
 }
 
+#if !defined(CONFIG_ARCH_TEGRA_2x_SOC) && !defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern struct platform_driver tegra_mipi_driver;
+#endif
 
 #endif
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..1695e6f3b0d0 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -21,195 +21,60 @@
  */
 
 #include <linux/clk.h>
-#include <linux/host1x.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/tegra-mipi-cal.h>
 
-#include "dev.h"
+/* only need to support one provider */
+static struct {
+	struct device_node *np;
+	const struct tegra_mipi_ops *ops;
+} provider;
 
-#define MIPI_CAL_CTRL			0x00
-#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
-#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
-#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
-#define MIPI_CAL_CTRL_START		(1 << 0)
-
-#define MIPI_CAL_AUTOCAL_CTRL		0x01
-
-#define MIPI_CAL_STATUS			0x02
-#define MIPI_CAL_STATUS_DONE		(1 << 16)
-#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
-
-#define MIPI_CAL_CONFIG_CSIA		0x05
-#define MIPI_CAL_CONFIG_CSIB		0x06
-#define MIPI_CAL_CONFIG_CSIC		0x07
-#define MIPI_CAL_CONFIG_CSID		0x08
-#define MIPI_CAL_CONFIG_CSIE		0x09
-#define MIPI_CAL_CONFIG_CSIF		0x0a
-#define MIPI_CAL_CONFIG_DSIA		0x0e
-#define MIPI_CAL_CONFIG_DSIB		0x0f
-#define MIPI_CAL_CONFIG_DSIC		0x10
-#define MIPI_CAL_CONFIG_DSID		0x11
-
-#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
-#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
-#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
-#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
-#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
-#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
-#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
-
-/* for data and clock lanes */
-#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
-
-/* for data lanes */
-#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
-#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
-#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
-
-/* for clock lanes */
-#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
-#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
-
-#define MIPI_CAL_BIAS_PAD_CFG0		0x16
-#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
-#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
-
-#define MIPI_CAL_BIAS_PAD_CFG1		0x17
-#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
-#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
-
-#define MIPI_CAL_BIAS_PAD_CFG2		0x18
-#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
-#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
-#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
-
-struct tegra_mipi_pad {
-	unsigned long data;
-	unsigned long clk;
-};
-
-struct tegra_mipi_soc {
-	bool has_clk_lane;
-	const struct tegra_mipi_pad *pads;
-	unsigned int num_pads;
-
-	bool clock_enable_override;
-	bool needs_vclamp_ref;
-
-	/* bias pad configuration settings */
-	u8 pad_drive_down_ref;
-	u8 pad_drive_up_ref;
-
-	u8 pad_vclamp_level;
-	u8 pad_vauxp_level;
-
-	/* calibration settings for data lanes */
-	u8 hspdos;
-	u8 hspuos;
-	u8 termos;
-
-	/* calibration settings for clock lanes */
-	u8 hsclkpdos;
-	u8 hsclkpuos;
-};
-
-struct tegra_mipi {
-	const struct tegra_mipi_soc *soc;
-	struct device *dev;
-	void __iomem *regs;
-	struct mutex lock;
-	struct clk *clk;
-
-	unsigned long usage_count;
-};
-
-struct tegra_mipi_device {
-	struct platform_device *pdev;
-	struct tegra_mipi *mipi;
-	struct device *device;
-	unsigned long pads;
-};
-
-static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
-				   unsigned long offset)
+int tegra_mipi_enable(struct tegra_mipi_device *device)
 {
-	return readl(mipi->regs + (offset << 2));
-}
+	if (device->ops->enable)
+		return device->ops->enable(device);
 
-static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
-				     unsigned long offset)
-{
-	writel(value, mipi->regs + (offset << 2));
+	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_enable);
 
-static int tegra_mipi_power_up(struct tegra_mipi *mipi)
+int tegra_mipi_disable(struct tegra_mipi_device *device)
 {
-	u32 value;
-	int err;
-
-	err = clk_enable(mipi->clk);
-	if (err < 0)
-		return err;
-
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
-	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
-
-	if (mipi->soc->needs_vclamp_ref)
-		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
-
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
-
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	clk_disable(mipi->clk);
+	if (device->ops->disable)
+		return device->ops->disable(device);
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_disable);
 
-static int tegra_mipi_power_down(struct tegra_mipi *mipi)
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
-	u32 value;
-	int err;
+	if (device->ops->start_calibration)
+		return device->ops->start_calibration(device);
 
-	err = clk_enable(mipi->clk);
-	if (err < 0)
-		return err;
-
-	/*
-	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
-	 * supplies the DSI pads. This must be kept enabled until none of the
-	 * DSI lanes are used anymore.
-	 */
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value |= MIPI_CAL_BIAS_PAD_PDVREG;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	/*
-	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
-	 * control a regulator that supplies current to the pre-driver logic.
-	 * Powering down this regulator causes DSI to fail, so it must remain
-	 * powered on until none of the DSI lanes are used anymore.
-	 */
-	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
-
-	if (mipi->soc->needs_vclamp_ref)
-		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+	return 0;
+}
+EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
-	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
-	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
+{
+	if (device->ops->finish_calibration)
+		return device->ops->finish_calibration(device);
 
 	return 0;
 }
+EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
 struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 					     struct device_node *np)
 {
-	struct tegra_mipi_device *dev;
+	struct tegra_mipi_device *mipidev;
 	struct of_phandle_args args;
 	int err;
 
@@ -219,321 +84,51 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 	if (err < 0)
 		return ERR_PTR(err);
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
+	if (provider.np != args.np)
+		return ERR_PTR(-ENODEV);
+
+	mipidev = kzalloc(sizeof(*mipidev), GFP_KERNEL);
+	if (!mipidev) {
 		err = -ENOMEM;
 		goto out;
 	}
 
-	dev->pdev = of_find_device_by_node(args.np);
-	if (!dev->pdev) {
+	mipidev->pdev = of_find_device_by_node(args.np);
+	if (!mipidev->pdev) {
 		err = -ENODEV;
 		goto free;
 	}
 
-	dev->mipi = platform_get_drvdata(dev->pdev);
-	if (!dev->mipi) {
-		err = -EPROBE_DEFER;
-		goto put;
-	}
-
 	of_node_put(args.np);
 
-	dev->pads = args.args[0];
-	dev->device = device;
+	mipidev->ops = provider.ops;
+	mipidev->pads = args.args[0];
 
-	return dev;
+	return mipidev;
 
-put:
-	platform_device_put(dev->pdev);
 free:
-	kfree(dev);
+	kfree(mipidev);
 out:
 	of_node_put(args.np);
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(tegra_mipi_request);
 
-void tegra_mipi_free(struct tegra_mipi_device *device)
+void tegra_mipi_free(struct tegra_mipi_device *mipidev)
 {
-	platform_device_put(device->pdev);
-	kfree(device);
+	platform_device_put(mipidev->pdev);
+	kfree(mipidev);
 }
 EXPORT_SYMBOL(tegra_mipi_free);
 
-int tegra_mipi_enable(struct tegra_mipi_device *dev)
-{
-	int err = 0;
-
-	mutex_lock(&dev->mipi->lock);
-
-	if (dev->mipi->usage_count++ == 0)
-		err = tegra_mipi_power_up(dev->mipi);
-
-	mutex_unlock(&dev->mipi->lock);
-
-	return err;
-
-}
-EXPORT_SYMBOL(tegra_mipi_enable);
-
-int tegra_mipi_disable(struct tegra_mipi_device *dev)
+int tegra_mipi_add_provider(struct device_node *np, const struct tegra_mipi_ops *ops)
 {
-	int err = 0;
+	if (provider.np)
+		return -EBUSY;
 
-	mutex_lock(&dev->mipi->lock);
-
-	if (--dev->mipi->usage_count == 0)
-		err = tegra_mipi_power_down(dev->mipi);
-
-	mutex_unlock(&dev->mipi->lock);
-
-	return err;
-
-}
-EXPORT_SYMBOL(tegra_mipi_disable);
-
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
-{
-	struct tegra_mipi *mipi = device->mipi;
-	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
-	u32 value;
-	int err;
-
-	err = readl_relaxed_poll_timeout(status_reg, value,
-					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
-					 (value & MIPI_CAL_STATUS_DONE), 50,
-					 250000);
-	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
-
-	return err;
-}
-EXPORT_SYMBOL(tegra_mipi_finish_calibration);
-
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
-{
-	const struct tegra_mipi_soc *soc = device->mipi->soc;
-	unsigned int i;
-	u32 value;
-	int err;
-
-	err = clk_enable(device->mipi->clk);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&device->mipi->lock);
-
-	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
-		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
-	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
-	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
-	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
-	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-
-	for (i = 0; i < soc->num_pads; i++) {
-		u32 clk = 0, data = 0;
-
-		if (device->pads & BIT(i)) {
-			data = MIPI_CAL_CONFIG_SELECT |
-			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
-			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
-			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
-			clk = MIPI_CAL_CONFIG_SELECT |
-			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
-			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
-		}
-
-		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
-
-		if (soc->has_clk_lane && soc->pads[i].clk != 0)
-			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
-	}
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
-	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
-	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
-	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
-	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
-
-	if (!soc->clock_enable_override)
-		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
-	else
-		value |= MIPI_CAL_CTRL_CLKEN_OVR;
-
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
-
-	/* clear any pending status bits */
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
-
-	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
-	value |= MIPI_CAL_CTRL_START;
-	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
-
-	/*
-	 * Wait for min 72uS to let calibration logic finish calibration
-	 * sequence codes before waiting for pads idle state to apply the
-	 * results.
-	 */
-	usleep_range(75, 80);
-
-	return 0;
-}
-EXPORT_SYMBOL(tegra_mipi_start_calibration);
-
-static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA },
-	{ .data = MIPI_CAL_CONFIG_CSIB },
-	{ .data = MIPI_CAL_CONFIG_CSIC },
-	{ .data = MIPI_CAL_CONFIG_CSID },
-	{ .data = MIPI_CAL_CONFIG_CSIE },
-	{ .data = MIPI_CAL_CONFIG_DSIA },
-	{ .data = MIPI_CAL_CONFIG_DSIB },
-	{ .data = MIPI_CAL_CONFIG_DSIC },
-	{ .data = MIPI_CAL_CONFIG_DSID },
-};
-
-static const struct tegra_mipi_soc tegra114_mipi_soc = {
-	.has_clk_lane = false,
-	.pads = tegra114_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = true,
-	.pad_drive_down_ref = 0x2,
-	.pad_drive_up_ref = 0x0,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x4,
-	.termos = 0x5,
-	.hsclkpdos = 0x0,
-	.hsclkpuos = 0x4,
-};
-
-static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
-	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
-	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
-	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
-};
-
-static const struct tegra_mipi_soc tegra124_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra124_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = true,
-	.pad_drive_down_ref = 0x2,
-	.pad_drive_up_ref = 0x0,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x0,
-	.termos = 0x0,
-	.hsclkpdos = 0x1,
-	.hsclkpuos = 0x2,
-};
-
-static const struct tegra_mipi_soc tegra132_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra124_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
-	.clock_enable_override = false,
-	.needs_vclamp_ref = false,
-	.pad_drive_down_ref = 0x0,
-	.pad_drive_up_ref = 0x3,
-	.pad_vclamp_level = 0x0,
-	.pad_vauxp_level = 0x0,
-	.hspdos = 0x0,
-	.hspuos = 0x0,
-	.termos = 0x0,
-	.hsclkpdos = 0x3,
-	.hsclkpuos = 0x2,
-};
-
-static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
-	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
-	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
-	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
-};
-
-static const struct tegra_mipi_soc tegra210_mipi_soc = {
-	.has_clk_lane = true,
-	.pads = tegra210_mipi_pads,
-	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
-	.clock_enable_override = true,
-	.needs_vclamp_ref = false,
-	.pad_drive_down_ref = 0x0,
-	.pad_drive_up_ref = 0x3,
-	.pad_vclamp_level = 0x1,
-	.pad_vauxp_level = 0x1,
-	.hspdos = 0x0,
-	.hspuos = 0x2,
-	.termos = 0x0,
-	.hsclkpdos = 0x0,
-	.hsclkpuos = 0x2,
-};
-
-static const struct of_device_id tegra_mipi_of_match[] = {
-	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
-	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
-	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
-	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
-	{ },
-};
-
-static int tegra_mipi_probe(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-	struct tegra_mipi *mipi;
-
-	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
-	if (!match)
-		return -ENODEV;
-
-	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
-	if (!mipi)
-		return -ENOMEM;
-
-	mipi->soc = match->data;
-	mipi->dev = &pdev->dev;
-
-	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(mipi->regs))
-		return PTR_ERR(mipi->regs);
-
-	mutex_init(&mipi->lock);
-
-	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
-	if (IS_ERR(mipi->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(mipi->clk);
-	}
-
-	platform_set_drvdata(pdev, mipi);
+	provider.np = np;
+	provider.ops = ops;
 
 	return 0;
 }
-
-struct platform_driver tegra_mipi_driver = {
-	.driver = {
-		.name = "tegra-mipi",
-		.of_match_table = tegra_mipi_of_match,
-	},
-	.probe = tegra_mipi_probe,
-};
+EXPORT_SYMBOL(tegra_mipi_add_provider);
diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegra114-mipi.c
new file mode 100644
index 000000000000..158a0491f830
--- /dev/null
+++ b/drivers/gpu/host1x/tegra114-mipi.c
@@ -0,0 +1,483 @@
+/*
+ * Copyright (C) 2013 NVIDIA Corporation
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+
+#include <linux/clk.h>
+#include <linux/host1x.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/tegra-mipi-cal.h>
+
+#include "dev.h"
+
+#define MIPI_CAL_CTRL			0x00
+#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
+#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
+#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
+#define MIPI_CAL_CTRL_START		(1 << 0)
+
+#define MIPI_CAL_AUTOCAL_CTRL		0x01
+
+#define MIPI_CAL_STATUS			0x02
+#define MIPI_CAL_STATUS_DONE		(1 << 16)
+#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
+
+#define MIPI_CAL_CONFIG_CSIA		0x05
+#define MIPI_CAL_CONFIG_CSIB		0x06
+#define MIPI_CAL_CONFIG_CSIC		0x07
+#define MIPI_CAL_CONFIG_CSID		0x08
+#define MIPI_CAL_CONFIG_CSIE		0x09
+#define MIPI_CAL_CONFIG_CSIF		0x0a
+#define MIPI_CAL_CONFIG_DSIA		0x0e
+#define MIPI_CAL_CONFIG_DSIB		0x0f
+#define MIPI_CAL_CONFIG_DSIC		0x10
+#define MIPI_CAL_CONFIG_DSID		0x11
+
+#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
+#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
+#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
+#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
+#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
+#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
+#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
+
+/* for data and clock lanes */
+#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
+
+/* for data lanes */
+#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
+#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
+#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
+
+/* for clock lanes */
+#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
+#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
+
+#define MIPI_CAL_BIAS_PAD_CFG0		0x16
+#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
+#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
+
+#define MIPI_CAL_BIAS_PAD_CFG1		0x17
+#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
+#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
+
+#define MIPI_CAL_BIAS_PAD_CFG2		0x18
+#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
+#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
+#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
+
+struct tegra_mipi_pad {
+	unsigned long data;
+	unsigned long clk;
+};
+
+struct tegra_mipi_soc {
+	bool has_clk_lane;
+	const struct tegra_mipi_pad *pads;
+	unsigned int num_pads;
+
+	bool clock_enable_override;
+	bool needs_vclamp_ref;
+
+	/* bias pad configuration settings */
+	u8 pad_drive_down_ref;
+	u8 pad_drive_up_ref;
+
+	u8 pad_vclamp_level;
+	u8 pad_vauxp_level;
+
+	/* calibration settings for data lanes */
+	u8 hspdos;
+	u8 hspuos;
+	u8 termos;
+
+	/* calibration settings for clock lanes */
+	u8 hsclkpdos;
+	u8 hsclkpuos;
+};
+
+struct tegra_mipi {
+	const struct tegra_mipi_soc *soc;
+	struct device *dev;
+	void __iomem *regs;
+	struct mutex lock;
+	struct clk *clk;
+
+	unsigned long usage_count;
+};
+
+static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
+				   unsigned long offset)
+{
+	return readl(mipi->regs + (offset << 2));
+}
+
+static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
+				     unsigned long offset)
+{
+	writel(value, mipi->regs + (offset << 2));
+}
+
+static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
+{
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
+	value &= ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
+
+	if (mipi->soc->needs_vclamp_ref)
+		value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	clk_disable(mipi->clk);
+
+	return 0;
+}
+
+static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
+{
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	/*
+	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
+	 * supplies the DSI pads. This must be kept enabled until none of the
+	 * DSI lanes are used anymore.
+	 */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value |= MIPI_CAL_BIAS_PAD_PDVREG;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	/*
+	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
+	 * control a regulator that supplies current to the pre-driver logic.
+	 * Powering down this regulator causes DSI to fail, so it must remain
+	 * powered on until none of the DSI lanes are used anymore.
+	 */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
+
+	if (mipi->soc->needs_vclamp_ref)
+		value &= ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
+
+	value |= MIPI_CAL_BIAS_PAD_PDVCLAMP;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
+
+	return 0;
+}
+
+static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	int err = 0;
+
+	mutex_lock(&mipi->lock);
+
+	if (mipi->usage_count++ == 0)
+		err = tegra114_mipi_power_up(mipi);
+
+	mutex_unlock(&mipi->lock);
+
+	return err;
+}
+
+static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	int err = 0;
+
+	mutex_lock(&mipi->lock);
+
+	if (--mipi->usage_count == 0)
+		err = tegra114_mipi_power_down(mipi);
+
+	mutex_unlock(&mipi->lock);
+
+	return err;
+}
+
+static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
+	u32 value;
+	int err;
+
+	err = readl_relaxed_poll_timeout(status_reg, value,
+					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
+					 (value & MIPI_CAL_STATUS_DONE), 50,
+					 250000);
+	mutex_unlock(&mipi->lock);
+	clk_disable(mipi->clk);
+
+	return err;
+}
+
+static int tegra114_mipi_start_calibration(struct tegra_mipi_device *mipidev)
+{
+	struct tegra_mipi *mipi = platform_get_drvdata(mipidev->pdev);
+	const struct tegra_mipi_soc *soc = mipi->soc;
+	unsigned int i;
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&mipi->lock);
+
+	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
+		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
+	value &= ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
+	value &= ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
+	value |= MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
+	value |= MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
+
+	for (i = 0; i < soc->num_pads; i++) {
+		u32 clk = 0, data = 0;
+
+		if (mipidev->pads & BIT(i)) {
+			data = MIPI_CAL_CONFIG_SELECT |
+			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
+			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
+			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
+			clk = MIPI_CAL_CONFIG_SELECT |
+			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
+			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
+		}
+
+		tegra_mipi_writel(mipi, data, soc->pads[i].data);
+
+		if (soc->has_clk_lane && soc->pads[i].clk != 0)
+			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
+	}
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
+	value &= ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
+	value &= ~MIPI_CAL_CTRL_PRESCALE(0x3);
+	value |= MIPI_CAL_CTRL_NOISE_FILTER(0xa);
+	value |= MIPI_CAL_CTRL_PRESCALE(0x2);
+
+	if (!soc->clock_enable_override)
+		value &= ~MIPI_CAL_CTRL_CLKEN_OVR;
+	else
+		value |= MIPI_CAL_CTRL_CLKEN_OVR;
+
+	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
+
+	/* clear any pending status bits */
+	value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
+	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
+
+	value = tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
+	value |= MIPI_CAL_CTRL_START;
+	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
+
+	/*
+	 * Wait for min 72uS to let calibration logic finish calibration
+	 * sequence codes before waiting for pads idle state to apply the
+	 * results.
+	 */
+	usleep_range(75, 80);
+
+	return 0;
+}
+
+static const struct tegra_mipi_ops tegra114_mipi_ops = {
+	.enable = tegra114_mipi_enable,
+	.disable = tegra114_mipi_disable,
+	.start_calibration = tegra114_mipi_start_calibration,
+	.finish_calibration = tegra114_mipi_finish_calibration,
+};
+
+static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA },
+	{ .data = MIPI_CAL_CONFIG_CSIB },
+	{ .data = MIPI_CAL_CONFIG_CSIC },
+	{ .data = MIPI_CAL_CONFIG_CSID },
+	{ .data = MIPI_CAL_CONFIG_CSIE },
+	{ .data = MIPI_CAL_CONFIG_DSIA },
+	{ .data = MIPI_CAL_CONFIG_DSIB },
+	{ .data = MIPI_CAL_CONFIG_DSIC },
+	{ .data = MIPI_CAL_CONFIG_DSID },
+};
+
+static const struct tegra_mipi_soc tegra114_mipi_soc = {
+	.has_clk_lane = false,
+	.pads = tegra114_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = true,
+	.pad_drive_down_ref = 0x2,
+	.pad_drive_up_ref = 0x0,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x4,
+	.termos = 0x5,
+	.hsclkpdos = 0x0,
+	.hsclkpuos = 0x4,
+};
+
+static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = MIPI_CAL_CONFIG_CSIAB_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = MIPI_CAL_CONFIG_CSICD_CLK },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = MIPI_CAL_CONFIG_CSIE_CLK  },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK  },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK  },
+};
+
+static const struct tegra_mipi_soc tegra124_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra124_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = true,
+	.pad_drive_down_ref = 0x2,
+	.pad_drive_up_ref = 0x0,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x0,
+	.termos = 0x0,
+	.hsclkpdos = 0x1,
+	.hsclkpuos = 0x2,
+};
+
+static const struct tegra_mipi_soc tegra132_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra124_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
+	.clock_enable_override = false,
+	.needs_vclamp_ref = false,
+	.pad_drive_down_ref = 0x0,
+	.pad_drive_up_ref = 0x3,
+	.pad_vclamp_level = 0x0,
+	.pad_vauxp_level = 0x0,
+	.hspdos = 0x0,
+	.hspuos = 0x0,
+	.termos = 0x0,
+	.hsclkpdos = 0x3,
+	.hsclkpuos = 0x2,
+};
+
+static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
+	{ .data = MIPI_CAL_CONFIG_CSIA, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIB, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIC, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSID, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIE, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_CSIF, .clk = 0 },
+	{ .data = MIPI_CAL_CONFIG_DSIA, .clk = MIPI_CAL_CONFIG_DSIA_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIB, .clk = MIPI_CAL_CONFIG_DSIB_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSIC, .clk = MIPI_CAL_CONFIG_DSIC_CLK },
+	{ .data = MIPI_CAL_CONFIG_DSID, .clk = MIPI_CAL_CONFIG_DSID_CLK },
+};
+
+static const struct tegra_mipi_soc tegra210_mipi_soc = {
+	.has_clk_lane = true,
+	.pads = tegra210_mipi_pads,
+	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
+	.clock_enable_override = true,
+	.needs_vclamp_ref = false,
+	.pad_drive_down_ref = 0x0,
+	.pad_drive_up_ref = 0x3,
+	.pad_vclamp_level = 0x1,
+	.pad_vauxp_level = 0x1,
+	.hspdos = 0x0,
+	.hspuos = 0x2,
+	.termos = 0x0,
+	.hsclkpdos = 0x0,
+	.hsclkpuos = 0x2,
+};
+
+static const struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
+	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
+	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
+	{ .compatible = "nvidia,tegra210-mipi", .data = &tegra210_mipi_soc },
+	{ },
+};
+
+static int tegra_mipi_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct tegra_mipi *mipi;
+
+	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
+	if (!match)
+		return -ENODEV;
+
+	mipi = devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
+	if (!mipi)
+		return -ENOMEM;
+
+	mipi->soc = match->data;
+	mipi->dev = &pdev->dev;
+
+	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(mipi->regs))
+		return PTR_ERR(mipi->regs);
+
+	mutex_init(&mipi->lock);
+
+	mipi->clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(mipi->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(mipi->clk);
+	}
+
+	platform_set_drvdata(pdev, mipi);
+
+	return tegra_mipi_add_provider(pdev->dev.of_node,
+				       &tegra114_mipi_ops);
+}
+
+struct platform_driver tegra_mipi_driver = {
+	.driver = {
+		.name = "tegra-mipi",
+		.of_match_table = tegra_mipi_of_match,
+	},
+	.probe = tegra_mipi_probe,
+};
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 74c92db1032f..9e3bd6109781 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,6 +12,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9fa9c30a34e6..b1c6514859d3 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *client);
 int host1x_client_suspend(struct host1x_client *client);
 int host1x_client_resume(struct host1x_client *client);
 
-struct tegra_mipi_device;
-
-struct tegra_mipi_device *tegra_mipi_request(struct device *device,
-					     struct device_node *np);
-void tegra_mipi_free(struct tegra_mipi_device *device);
-int tegra_mipi_enable(struct tegra_mipi_device *device);
-int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
-
 /* host1x memory contexts */
 
 struct host1x_memory_context {
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
new file mode 100644
index 000000000000..77342ee7674f
--- /dev/null
+++ b/include/linux/tegra-mipi-cal.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TEGRA_MIPI_CAL_H_
+#define __TEGRA_MIPI_CAL_H_
+
+struct tegra_mipi_device {
+	const struct tegra_mipi_ops *ops;
+	struct platform_device *pdev;
+	unsigned long pads;
+};
+
+/**
+ * Operations for Tegra MIPI calibration device
+ */
+struct tegra_mipi_ops {
+	/**
+	 * @enable:
+	 *
+	 * Enable MIPI calibration device
+	 */
+	int (*enable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @disable:
+	 *
+	 * Disable MIPI calibration device
+	 */
+	int (*disable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @start_calibration:
+	 *
+	 * Start MIPI calibration
+	 */
+	int (*start_calibration)(struct tegra_mipi_device *device);
+
+	/**
+	 * @finish_calibration:
+	 *
+	 * Finish MIPI calibration
+	 */
+	int (*finish_calibration)(struct tegra_mipi_device *device);
+};
+
+int tegra_mipi_add_provider(struct device_node *np, const struct tegra_mipi_ops *ops);
+
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np);
+void tegra_mipi_free(struct tegra_mipi_device *device);
+
+int tegra_mipi_enable(struct tegra_mipi_device *device);
+int tegra_mipi_disable(struct tegra_mipi_device *device);
+int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
+int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
+
+#endif /* __TEGRA_MIPI_CAL_H_ */
-- 
2.48.1


