Return-Path: <linux-gpio+bounces-13392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05F9E00E0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F701B24515
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BBC200BB7;
	Mon,  2 Dec 2024 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DAw+uCJF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F181FDE3B
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138356; cv=none; b=fNEUC7wt8mdG9PMBdDFh6a7fjFmFJFbwEWCvv5p6/QFhJmIlhyNziUFp7/BL0QN6o/2hzSiSltzV11NXwzJYikplWU+CnVXaurBgyDQ0/pmj4bhRn+i6rAPSanFNbz/mMfnCO6L7A2rKY2ibCuQVwH/B2iSJnCA6hVtIb1LxzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138356; c=relaxed/simple;
	bh=xDnXhO9COxgFKn02+YWWi2wEMKjv/oJ/adZWXz9u3Co=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keU2Xr21pDQQsc8Q4KnTB74I48bIBTwhZeNNHQ74p7cUQzblbKRGbGo9ClESNoLBzqkdNbRc5QsT2CPFkref1mZlowR/craDk2eg1m0441nnTVqQEIuufxIIcKE5skduj/9bWj5OJBQIJM9bmtZWMMThJW0qJRi7bdJTrcJ/T4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DAw+uCJF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so5288659a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138350; x=1733743150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ckGwUGUfZdRO8tFLS8Cj4+oftR8KkpMv0y3Ar50T68=;
        b=DAw+uCJFlRVqJCswWOhjpbeNOEmBsM1rvsJXD5t72nGfjEouxrvLlgWpQZesMF4m1D
         X9hgaa+7P6A42XJgnyUHQxmsuIZzhKbWRlxC7yM+JfSYeyj9hFOhks1OJ0d9qHQvgqn2
         2iAt+uE72vK6/0/rqGCKuhzxOLSYnjWGZQ9vUYxt5Mylz6ZEMWLCOpj+YRrjBciCUQRb
         3i3Azqab9y07npPpazJ++aK4iJvdscKIqyjUgD1ul+EB/TLbOfpj6SXhHKxfiC7NLCGC
         9S/jHPcw7Xj/x8rrBbekybbBrM+UCP+ioJlKrs1fR6elrlfR5PWAM9/XPDCy2hUXC3KC
         z2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138350; x=1733743150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ckGwUGUfZdRO8tFLS8Cj4+oftR8KkpMv0y3Ar50T68=;
        b=p+YNm0WXMgYaqvCwJP0Jce39W6Yzy2OKHwpbQyLE+sRA8f1KBfKZ1V99pN5NPB7eT5
         2B3xb4A5sN+297glfYEF0YXT7FAyI240w1Er6Q/zpcX6a0Wwm5oi35zANLeJyOKsRAhY
         F5XCiU5fRKPuc1TBYjKn/wJgPN8/TQ0/UxNgOKOlQohyhlo26Vhj487wqhyrGHDd4+oJ
         gOnorV8b4OY38Lj8VB+sNUH2uhXs8MdlscYFluGniu8tGFfyeXwHUPOClJ/ZlNMGBdG/
         J4StskhQa/A9hMt8uOeSrAsSUjScZYcB6a0FVlEh4xD3fDuMf3WYrgqnSg5U0UbImYqy
         4ZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlWQU0++mDhQOg/Hzy0AP1RZg0tJVhorYmN23MDYxMr/sQrfZmGuvu/L2caDR/WRCnVXZEJydnrgNO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qnBuBnDEkHO355DU86agfLfOXvP3VenofCLC/NrryDazlOqC
	e9voNTic+sTMIhvXmb9mXWLcTfqf6xoBZn4aHcq9sbhPxAxXyAgB9xEBneo2Uno=
X-Gm-Gg: ASbGncttsozGx3eNFv+RR73STMZahciHjJvJ5DDqj2HZXn3aSZgmb9GLJP2TflAaTPe
	FfF4jTjyaTxZrnDW89ykXBPVsjxJK7vulIbbc/eK11z0ipZCsrd7Xit4PkWaOs+rBYOzHuGFxkE
	+LWTZTgRZYOMGkEvFdxB9qOXasO8wQaOuNTlFCtMkM3jUbKOojYQfZilK5oBGj2tlD5gRpUNETS
	2cudMqJU0lqLHHxeS6snFPAqYmNu0QTtTKqkKH+S0HK7bwYj+qHoTNqskNtHKR8nrCIlnE25mDj
	9JdtwXs5Sjec7yqytt4X
X-Google-Smtp-Source: AGHT+IFlufv4H4e7KaFKaBE0FgQdFZwctfFr+3JXxRh1Hcx4kervak7AS5FbuzIocTxZMLIu+07pKg==
X-Received: by 2002:a05:6402:322a:b0:5d0:bcdd:ffa1 with SMTP id 4fb4d7f45d1cf-5d0bcde02e5mr14414397a12.2.1733138350264;
        Mon, 02 Dec 2024 03:19:10 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097db0be1sm4930370a12.31.2024.12.02.03.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:09 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 06/10] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
Date: Mon,  2 Dec 2024 12:19:30 +0100
Message-ID: <382d56db9ab749a99f142fc65eeacdbd6c44be93.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
Add minimum support for the gpio only portion. The driver is in
pinctrl folder since upcoming patches will add the pinmux/pinctrl
support where the gpio part can be seen as an addition.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 MAINTAINERS                   |   1 +
 drivers/pinctrl/Kconfig       |  11 +
 drivers/pinctrl/Makefile      |   1 +
 drivers/pinctrl/pinctrl-rp1.c | 789 ++++++++++++++++++++++++++++++++++
 4 files changed, 802 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ad37eb45a51..9b8e87b8d6de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19582,6 +19582,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	drivers/clk/clk-rp1.c
+F:	drivers/pinctrl/pinctrl-rp1.c
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
 
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 95a8e2b9a614..53b265cabc26 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -612,6 +612,17 @@ config PINCTRL_MLXBF3
 	  each pin. This driver can also be built as a module called
 	  pinctrl-mlxbf3.
 
+config PINCTRL_RP1
+	tristate "Pinctrl driver for RP1"
+	depends on MISC_RP1
+	default MISC_RP1
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
+	  multi function device.
+
 source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index fba1c56624c0..6fb77de58545 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
 obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
new file mode 100644
index 000000000000..0d081f75d2ec
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -0,0 +1,789 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Raspberry Pi RP1 GPIO unit
+ *
+ * Copyright (C) 2023 Raspberry Pi Ltd.
+ *
+ * This driver is inspired by:
+ * pinctrl-bcm2835.c, please see original file for copyright information
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MODULE_NAME "pinctrl-rp1"
+#define RP1_NUM_GPIOS	54
+#define RP1_NUM_BANKS	3
+
+#define RP1_INT_EDGE_FALLING		BIT(0)
+#define RP1_INT_EDGE_RISING		BIT(1)
+#define RP1_INT_LEVEL_LOW		BIT(2)
+#define RP1_INT_LEVEL_HIGH		BIT(3)
+#define RP1_INT_MASK			GENMASK(3, 0)
+#define RP1_INT_EDGE_BOTH		(RP1_INT_EDGE_FALLING |	\
+					 RP1_INT_EDGE_RISING)
+
+#define RP1_FSEL_COUNT			9
+
+#define RP1_FSEL_ALT0			0x00
+#define RP1_FSEL_GPIO			0x05
+#define RP1_FSEL_NONE			0x09
+#define RP1_FSEL_NONE_HW		0x1f
+
+#define RP1_PAD_DRIVE_2MA		0x0
+#define RP1_PAD_DRIVE_4MA		0x1
+#define RP1_PAD_DRIVE_8MA		0x2
+#define RP1_PAD_DRIVE_12MA		0x3
+
+enum {
+	RP1_PUD_OFF			= 0,
+	RP1_PUD_DOWN			= 1,
+	RP1_PUD_UP			= 2,
+};
+
+enum {
+	RP1_DIR_OUTPUT			= 0,
+	RP1_DIR_INPUT			= 1,
+};
+
+enum {
+	RP1_OUTOVER_PERI		= 0,
+	RP1_OUTOVER_INVPERI		= 1,
+	RP1_OUTOVER_LOW			= 2,
+	RP1_OUTOVER_HIGH		= 3,
+};
+
+enum {
+	RP1_OEOVER_PERI			= 0,
+	RP1_OEOVER_INVPERI		= 1,
+	RP1_OEOVER_DISABLE		= 2,
+	RP1_OEOVER_ENABLE		= 3,
+};
+
+enum {
+	RP1_INOVER_PERI			= 0,
+	RP1_INOVER_INVPERI		= 1,
+	RP1_INOVER_LOW			= 2,
+	RP1_INOVER_HIGH			= 3,
+};
+
+enum {
+	RP1_GPIO_CTRL_IRQRESET_SET		= 0,
+	RP1_GPIO_CTRL_INT_CLR			= 1,
+	RP1_GPIO_CTRL_INT_SET			= 2,
+	RP1_GPIO_CTRL_OEOVER			= 3,
+	RP1_GPIO_CTRL_FUNCSEL			= 4,
+	RP1_GPIO_CTRL_OUTOVER			= 5,
+	RP1_GPIO_CTRL				= 6,
+};
+
+enum {
+	RP1_INTE_SET			= 0,
+	RP1_INTE_CLR			= 1,
+};
+
+enum {
+	RP1_RIO_OUT_SET			= 0,
+	RP1_RIO_OUT_CLR			= 1,
+	RP1_RIO_OE			= 2,
+	RP1_RIO_OE_SET			= 3,
+	RP1_RIO_OE_CLR			= 4,
+	RP1_RIO_IN			= 5,
+};
+
+enum {
+	RP1_PAD_SLEWFAST		= 0,
+	RP1_PAD_SCHMITT			= 1,
+	RP1_PAD_PULL			= 2,
+	RP1_PAD_DRIVE			= 3,
+	RP1_PAD_IN_ENABLE		= 4,
+	RP1_PAD_OUT_DISABLE		= 5,
+};
+
+static const struct reg_field rp1_gpio_fields[] = {
+	[RP1_GPIO_CTRL_IRQRESET_SET]	= REG_FIELD(0x2004, 28, 28),
+	[RP1_GPIO_CTRL_INT_CLR]		= REG_FIELD(0x3004, 20, 23),
+	[RP1_GPIO_CTRL_INT_SET]		= REG_FIELD(0x2004, 20, 23),
+	[RP1_GPIO_CTRL_OEOVER]		= REG_FIELD(0x0004, 14, 15),
+	[RP1_GPIO_CTRL_FUNCSEL]		= REG_FIELD(0x0004, 0, 4),
+	[RP1_GPIO_CTRL_OUTOVER]		= REG_FIELD(0x0004, 12, 13),
+	[RP1_GPIO_CTRL]			= REG_FIELD(0x0004, 0, 31),
+};
+
+static const struct reg_field rp1_inte_fields[] = {
+	[RP1_INTE_SET]			= REG_FIELD(0x2000, 0, 0),
+	[RP1_INTE_CLR]			= REG_FIELD(0x3000, 0, 0),
+};
+
+static const struct reg_field rp1_rio_fields[] = {
+	[RP1_RIO_OUT_SET]		= REG_FIELD(0x2000, 0, 0),
+	[RP1_RIO_OUT_CLR]		= REG_FIELD(0x3000, 0, 0),
+	[RP1_RIO_OE]			= REG_FIELD(0x0004, 0, 0),
+	[RP1_RIO_OE_SET]		= REG_FIELD(0x2004, 0, 0),
+	[RP1_RIO_OE_CLR]		= REG_FIELD(0x3004, 0, 0),
+	[RP1_RIO_IN]			= REG_FIELD(0x0008, 0, 0),
+};
+
+static const struct reg_field rp1_pad_fields[] = {
+	[RP1_PAD_SLEWFAST]		= REG_FIELD(0, 0, 0),
+	[RP1_PAD_SCHMITT]		= REG_FIELD(0, 1, 1),
+	[RP1_PAD_PULL]			= REG_FIELD(0, 2, 3),
+	[RP1_PAD_DRIVE]			= REG_FIELD(0, 4, 5),
+	[RP1_PAD_IN_ENABLE]		= REG_FIELD(0, 6, 6),
+	[RP1_PAD_OUT_DISABLE]		= REG_FIELD(0, 7, 7),
+};
+
+struct rp1_iobank_desc {
+	int min_gpio;
+	int num_gpios;
+	int gpio_offset;
+	int inte_offset;
+	int ints_offset;
+	int rio_offset;
+	int pads_offset;
+};
+
+struct rp1_pin_info {
+	u8 num;
+	u8 bank;
+	u8 offset;
+	u8 fsel;
+	u8 irq_type;
+
+	struct regmap_field *gpio[ARRAY_SIZE(rp1_gpio_fields)];
+	struct regmap_field *rio[ARRAY_SIZE(rp1_rio_fields)];
+	struct regmap_field *inte[ARRAY_SIZE(rp1_inte_fields)];
+	struct regmap_field *pad[ARRAY_SIZE(rp1_pad_fields)];
+};
+
+struct rp1_pinctrl {
+	struct device *dev;
+	void __iomem *gpio_base;
+	void __iomem *rio_base;
+	void __iomem *pads_base;
+	int irq[RP1_NUM_BANKS];
+	struct rp1_pin_info pins[RP1_NUM_GPIOS];
+
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	struct pinctrl_gpio_range gpio_range;
+
+	raw_spinlock_t irq_lock[RP1_NUM_BANKS];
+};
+
+static const struct rp1_iobank_desc rp1_iobanks[RP1_NUM_BANKS] = {
+	/*         gpio   inte    ints     rio    pads */
+	{  0, 28, 0x0000, 0x011c, 0x0124, 0x0000, 0x0004 },
+	{ 28,  6, 0x4000, 0x411c, 0x4124, 0x4000, 0x4004 },
+	{ 34, 20, 0x8000, 0x811c, 0x8124, 0x8000, 0x8004 },
+};
+
+static int rp1_pinconf_set(struct rp1_pin_info *pin,
+			   unsigned int offset, unsigned long *configs,
+			   unsigned int num_configs);
+
+static struct rp1_pin_info *rp1_get_pin(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+
+	if (pc && offset < RP1_NUM_GPIOS)
+		return &pc->pins[offset];
+	return NULL;
+}
+
+static void rp1_input_enable(struct rp1_pin_info *pin, int value)
+{
+	regmap_field_write(pin->pad[RP1_PAD_IN_ENABLE], !!value);
+}
+
+static void rp1_output_enable(struct rp1_pin_info *pin, int value)
+{
+	regmap_field_write(pin->pad[RP1_PAD_OUT_DISABLE], !value);
+}
+
+static u32 rp1_get_fsel(struct rp1_pin_info *pin)
+{
+	u32 oeover, fsel;
+
+	regmap_field_read(pin->gpio[RP1_GPIO_CTRL_OEOVER], &oeover);
+	regmap_field_read(pin->gpio[RP1_GPIO_CTRL_FUNCSEL], &fsel);
+
+	if (oeover != RP1_OEOVER_PERI || fsel >= RP1_FSEL_COUNT)
+		fsel = RP1_FSEL_NONE;
+
+	return fsel;
+}
+
+static void rp1_set_fsel(struct rp1_pin_info *pin, u32 fsel)
+{
+	if (fsel >= RP1_FSEL_COUNT)
+		fsel = RP1_FSEL_NONE_HW;
+
+	rp1_input_enable(pin, 1);
+	rp1_output_enable(pin, 1);
+
+	if (fsel == RP1_FSEL_NONE) {
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OEOVER], RP1_OEOVER_DISABLE);
+	} else {
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OUTOVER], RP1_OUTOVER_PERI);
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_OEOVER], RP1_OEOVER_PERI);
+	}
+
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_FUNCSEL], fsel);
+}
+
+static int rp1_get_dir(struct rp1_pin_info *pin)
+{
+	unsigned int val;
+
+	regmap_field_read(pin->rio[RP1_RIO_OE], &val);
+
+	return !val ? RP1_DIR_INPUT : RP1_DIR_OUTPUT;
+}
+
+static void rp1_set_dir(struct rp1_pin_info *pin, bool is_input)
+{
+	int reg = is_input ? RP1_RIO_OE_CLR : RP1_RIO_OE_SET;
+
+	regmap_field_write(pin->rio[reg], 1);
+}
+
+static int rp1_get_value(struct rp1_pin_info *pin)
+{
+	unsigned int val;
+
+	regmap_field_read(pin->rio[RP1_RIO_IN], &val);
+
+	return !!val;
+}
+
+static void rp1_set_value(struct rp1_pin_info *pin, int value)
+{
+	/* Assume the pin is already an output */
+	int reg = value ? RP1_RIO_OUT_SET : RP1_RIO_OUT_CLR;
+
+	regmap_field_write(pin->rio[reg], 1);
+}
+
+static int rp1_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	ret = rp1_get_value(pin);
+
+	return ret;
+}
+
+static void rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (pin)
+		rp1_set_value(pin, value);
+}
+
+static int rp1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	u32 fsel;
+
+	if (!pin)
+		return -EINVAL;
+
+	fsel = rp1_get_fsel(pin);
+	if (fsel != RP1_FSEL_GPIO)
+		return -EINVAL;
+
+	return (rp1_get_dir(pin) == RP1_DIR_OUTPUT) ?
+		GPIO_LINE_DIRECTION_OUT :
+		GPIO_LINE_DIRECTION_IN;
+}
+
+static int rp1_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (!pin)
+		return -EINVAL;
+	rp1_set_dir(pin, RP1_DIR_INPUT);
+	rp1_set_fsel(pin, RP1_FSEL_GPIO);
+
+	return 0;
+}
+
+static int rp1_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+				     int value)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+
+	if (!pin)
+		return -EINVAL;
+	rp1_set_value(pin, value);
+	rp1_set_dir(pin, RP1_DIR_OUTPUT);
+	rp1_set_fsel(pin, RP1_FSEL_GPIO);
+
+	return 0;
+}
+
+static int rp1_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+			       unsigned long config)
+{
+	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
+	unsigned long configs[] = { config };
+
+	return rp1_pinconf_set(pin, offset, configs,
+			       ARRAY_SIZE(configs));
+}
+
+static const struct gpio_chip rp1_gpio_chip = {
+	.label = MODULE_NAME,
+	.owner = THIS_MODULE,
+	.request = gpiochip_generic_request,
+	.free = gpiochip_generic_free,
+	.direction_input = rp1_gpio_direction_input,
+	.direction_output = rp1_gpio_direction_output,
+	.get_direction = rp1_gpio_get_direction,
+	.get = rp1_gpio_get,
+	.set = rp1_gpio_set,
+	.base = -1,
+	.set_config = rp1_gpio_set_config,
+	.ngpio = RP1_NUM_GPIOS,
+	.can_sleep = false,
+};
+
+static void rp1_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+	const struct rp1_iobank_desc *bank;
+	int irq = irq_desc_get_irq(desc);
+	unsigned long ints;
+	int bit_pos;
+
+	if (pc->irq[0] == irq)
+		bank = &rp1_iobanks[0];
+	else if (pc->irq[1] == irq)
+		bank = &rp1_iobanks[1];
+	else
+		bank = &rp1_iobanks[2];
+
+	chained_irq_enter(host_chip, desc);
+
+	ints = readl(pc->gpio_base + bank->ints_offset);
+	for_each_set_bit(bit_pos, &ints, 32) {
+		struct rp1_pin_info *pin = rp1_get_pin(chip, bit_pos);
+
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
+						     bank->gpio_offset + bit_pos));
+	}
+
+	chained_irq_exit(host_chip, desc);
+}
+
+static void rp1_gpio_irq_config(struct rp1_pin_info *pin, bool enable)
+{
+	int reg = enable ? RP1_INTE_SET : RP1_INTE_CLR;
+
+	regmap_field_write(pin->inte[reg], 1);
+	if (!enable)
+		/* Clear any latched events */
+		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+}
+
+static void rp1_gpio_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	rp1_gpio_irq_config(pin, true);
+}
+
+static void rp1_gpio_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	rp1_gpio_irq_config(pin, false);
+}
+
+static int rp1_irq_set_type(struct rp1_pin_info *pin, unsigned int type)
+{
+	u32 irq_flags;
+
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		irq_flags = 0;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		irq_flags = RP1_INT_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_flags = RP1_INT_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_flags = RP1_INT_EDGE_RISING | RP1_INT_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_flags = RP1_INT_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_flags = RP1_INT_LEVEL_LOW;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Clear them all */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_INT_CLR], RP1_INT_MASK);
+
+	/* Set those that are needed */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_INT_SET], irq_flags);
+	pin->irq_type = type;
+
+	return 0;
+}
+
+static int rp1_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
+	int bank = pin->bank;
+	unsigned long flags;
+	int ret;
+
+	raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
+
+	ret = rp1_irq_set_type(pin, type);
+	if (!ret) {
+		if (type & IRQ_TYPE_EDGE_BOTH)
+			irq_set_handler_locked(data, handle_edge_irq);
+		else
+			irq_set_handler_locked(data, handle_level_irq);
+	}
+
+	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+
+	return ret;
+}
+
+static void rp1_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct rp1_pin_info *pin = rp1_get_pin(chip, gpio);
+
+	/* Clear any latched events */
+	regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
+}
+
+static struct irq_chip rp1_gpio_irq_chip = {
+	.name = MODULE_NAME,
+	.irq_enable = rp1_gpio_irq_enable,
+	.irq_disable = rp1_gpio_irq_disable,
+	.irq_set_type = rp1_gpio_irq_set_type,
+	.irq_ack = rp1_gpio_irq_ack,
+	.irq_mask = rp1_gpio_irq_disable,
+	.irq_unmask = rp1_gpio_irq_enable,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static void rp1_pull_config_set(struct rp1_pin_info *pin, unsigned int arg)
+{
+	regmap_field_write(pin->pad[RP1_PAD_PULL], arg & 0x3);
+}
+
+static int rp1_pinconf_set(struct rp1_pin_info *pin, unsigned int offset,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	u32 param, arg;
+	int i;
+
+	if (!pin)
+		return -EINVAL;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			rp1_pull_config_set(pin, RP1_PUD_OFF);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			rp1_pull_config_set(pin, RP1_PUD_DOWN);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			rp1_pull_config_set(pin, RP1_PUD_UP);
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			rp1_input_enable(pin, arg);
+			break;
+
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			rp1_output_enable(pin, arg);
+			break;
+
+		case PIN_CONFIG_OUTPUT:
+			rp1_set_value(pin, arg);
+			rp1_set_dir(pin, RP1_DIR_OUTPUT);
+			rp1_set_fsel(pin, RP1_FSEL_GPIO);
+			break;
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			regmap_field_write(pin->pad[RP1_PAD_SCHMITT], !!arg);
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			regmap_field_write(pin->pad[RP1_PAD_SLEWFAST], !!arg);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			switch (arg) {
+			case 2:
+				arg = RP1_PAD_DRIVE_2MA;
+				break;
+			case 4:
+				arg = RP1_PAD_DRIVE_4MA;
+				break;
+			case 8:
+				arg = RP1_PAD_DRIVE_8MA;
+				break;
+			case 12:
+				arg = RP1_PAD_DRIVE_12MA;
+				break;
+			default:
+				return -ENOTSUPP;
+			}
+			regmap_field_write(pin->pad[RP1_PAD_DRIVE], arg);
+			break;
+
+		default:
+			return -ENOTSUPP;
+
+		} /* switch param type */
+	} /* for each config */
+
+	return 0;
+}
+
+static const struct of_device_id rp1_pinctrl_match[] = {
+	{ .compatible = "raspberrypi,rp1-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rp1_pinctrl_match);
+
+static struct rp1_pinctrl rp1_pinctrl_data = {};
+
+static const struct regmap_config rp1_pinctrl_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.name = "rp1-pinctrl",
+};
+
+static int rp1_gen_regfield(struct device *dev,
+			    const struct reg_field *array,
+			    size_t array_size,
+			    int reg_off,
+			    int pin_off,
+			    bool additive_offset,
+			    struct regmap *regmap,
+			    struct regmap_field *out[])
+{
+	struct reg_field regfield;
+	int k;
+
+	for (k = 0; k < array_size; k++) {
+		regfield = array[k];
+		regfield.reg = (additive_offset ? regfield.reg : 0) + reg_off;
+		if (pin_off >= 0) {
+			regfield.lsb = pin_off;
+			regfield.msb = regfield.lsb;
+		}
+		out[k] = devm_regmap_field_alloc(dev, regmap, regfield);
+
+		if (IS_ERR(out[k]))
+			return PTR_ERR(out[k]);
+	}
+
+	return 0;
+}
+
+static int rp1_pinctrl_probe(struct platform_device *pdev)
+{
+	struct regmap *gpio_regmap, *rio_regmap, *pads_regmap;
+	struct rp1_pinctrl *pc = &rp1_pinctrl_data;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct gpio_irq_chip *girq;
+	int err, i;
+
+	pc->dev = dev;
+	pc->gpio_chip = rp1_gpio_chip;
+	pc->gpio_chip.parent = dev;
+
+	pc->gpio_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->gpio_base))
+		return dev_err_probe(dev, PTR_ERR(pc->gpio_base), "could not get GPIO IO memory\n");
+
+	pc->rio_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pc->rio_base))
+		return dev_err_probe(dev, PTR_ERR(pc->rio_base), "could not get RIO IO memory\n");
+
+	pc->pads_base = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(pc->pads_base))
+		return dev_err_probe(dev, PTR_ERR(pc->pads_base), "could not get PADS IO memory\n");
+
+	gpio_regmap = devm_regmap_init_mmio(dev, pc->gpio_base,
+					    &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(gpio_regmap))
+		return dev_err_probe(dev, PTR_ERR(gpio_regmap), "could not init GPIO regmap\n");
+
+	rio_regmap = devm_regmap_init_mmio(dev, pc->rio_base,
+					   &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(rio_regmap))
+		return dev_err_probe(dev, PTR_ERR(rio_regmap), "could not init RIO regmap\n");
+
+	pads_regmap = devm_regmap_init_mmio(dev, pc->pads_base,
+					    &rp1_pinctrl_regmap_cfg);
+	if (IS_ERR(pads_regmap))
+		return dev_err_probe(dev, PTR_ERR(pads_regmap), "could not init PADS regmap\n");
+
+	for (i = 0; i < RP1_NUM_BANKS; i++) {
+		const struct rp1_iobank_desc *bank = &rp1_iobanks[i];
+		int j;
+
+		for (j = 0; j < bank->num_gpios; j++) {
+			struct rp1_pin_info *pin =
+				&pc->pins[bank->min_gpio + j];
+			int reg_off;
+
+			pin->num = bank->min_gpio + j;
+			pin->bank = i;
+			pin->offset = j;
+
+			reg_off = bank->gpio_offset + pin->offset *
+				  sizeof(u32) * 2;
+			err = rp1_gen_regfield(dev,
+					       rp1_gpio_fields,
+					       ARRAY_SIZE(rp1_gpio_fields),
+					       reg_off,
+					       -1,
+					       true,
+					       gpio_regmap,
+					       pin->gpio);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for gpio\n");
+
+			reg_off = bank->inte_offset;
+			err = rp1_gen_regfield(dev,
+					       rp1_inte_fields,
+					       ARRAY_SIZE(rp1_inte_fields),
+					       reg_off,
+					       pin->offset,
+					       true,
+					       gpio_regmap,
+					       pin->inte);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for inte\n");
+
+			reg_off = bank->rio_offset;
+			err = rp1_gen_regfield(dev,
+					       rp1_rio_fields,
+					       ARRAY_SIZE(rp1_rio_fields),
+					       reg_off,
+					       pin->offset,
+					       true,
+					       rio_regmap,
+					       pin->rio);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for rio\n");
+
+			reg_off = bank->pads_offset + pin->offset * sizeof(u32);
+			err = rp1_gen_regfield(dev,
+					       rp1_pad_fields,
+					       ARRAY_SIZE(rp1_pad_fields),
+					       reg_off,
+					       -1,
+					       false,
+					       pads_regmap,
+					       pin->pad);
+
+			if (err)
+				return dev_err_probe(dev, err,
+						     "Unable to allocate regmap for pad\n");
+		}
+
+		raw_spin_lock_init(&pc->irq_lock[i]);
+	}
+
+	girq = &pc->gpio_chip.irq;
+	girq->chip = &rp1_gpio_irq_chip;
+	girq->parent_handler = rp1_gpio_irq_handler;
+	girq->num_parents = RP1_NUM_BANKS;
+	girq->parents = pc->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	/*
+	 * Use the same handler for all groups: this is necessary
+	 * since we use one gpiochip to cover all lines - the
+	 * irq handler then needs to figure out which group and
+	 * bank that was firing the IRQ and look up the per-group
+	 * and bank data.
+	 */
+	for (i = 0; i < RP1_NUM_BANKS; i++) {
+		pc->irq[i] = irq_of_parse_and_map(np, i);
+		if (!pc->irq[i]) {
+			girq->num_parents = i;
+			break;
+		}
+	}
+
+	platform_set_drvdata(pdev, pc);
+
+	err = devm_gpiochip_add_data(dev, &pc->gpio_chip, pc);
+	if (err)
+		return dev_err_probe(dev, err, "could not add GPIO chip\n");
+
+	return 0;
+}
+
+static struct platform_driver rp1_pinctrl_driver = {
+	.probe = rp1_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = rp1_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(rp1_pinctrl_driver);
+
+MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("RP1 pinctrl/gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3


