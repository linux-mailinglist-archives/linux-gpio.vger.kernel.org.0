Return-Path: <linux-gpio+bounces-16741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E4A48C9D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1023AB3CD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290DE2862A8;
	Thu, 27 Feb 2025 23:17:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2702728135D;
	Thu, 27 Feb 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698246; cv=none; b=UsHt8i8XRkB2LWsO7g0gKqJnXnaZmqfy84eXcSmLs2dHdWk0kv6SZnWxJgkoi4dnNn9hxqkKBqpm60WUGKM3h/WVKw308QSNr547gwzU2R2+xv/lB6b57I6gGf6/jhjntFZLCBLFKQ1RBB2PMIMQV+K+c9xeXFXVC8YWOLEuHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698246; c=relaxed/simple;
	bh=k7m0n9FkEoBrCzmgcoX2ejvjy0c7WsmZEsIhWXUowh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3tdKZGO/CnyO9jiuMrx986EG6XfaAOr82uDalXphcznVOK6Gql3M98kqYD+/3DUlWsZV5MlJ+2C2Uw+O/wgQ/WxFmrkRFKLFHJpmo9BJOuci6Hs28L0sVR5Tv4YUFYCUICUnLAvYj85q3Q35b7ZExeXigBPU785i6ypyCbSbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387831688;
	Thu, 27 Feb 2025 15:17:38 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AD423F673;
	Thu, 27 Feb 2025 15:17:20 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] pinctrl: sunxi: allow reading mux values from DT
Date: Thu, 27 Feb 2025 23:14:44 +0000
Message-ID: <20250227231447.20161-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250227231447.20161-1-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far every Allwinner SoC needs a large table in the kernel code, to
describe the mapping between the pinctrl function names ("uart") and
the actual pincontroller mux value to be written into the registers.
This adds a lot of data into a single image kernel, and also looks
somewhat weird, as the DT can easily store the mux value.

Add some code that allows to avoid that table: the struct that describes
the existing pins will be build at *runtime*, based on very basic
information provided by the respective SoC's pinctrl driver. This
consists of the number of pins per bank, plus information which bank
provides IRQ support, along with the mux value to use for that.
The code will then iterate over all children of the pincontroller DT
node (which describe each pin group), and populate that struct with the
mapping between function names and mux values. The only thing that needs
adding in the DT is a property with that value, per pin group.

When this table is built, it will be handed over to the existing sunxi
pinctrl driver, which cannot tell a difference between a hardcoded
struct and this new one built at runtime. It will take care of
registering the pinctrl device with the pinctrl subsystem.

All a new SoC driver would need to do is to provide two arrays, and then
call the sunxi_pinctrl_dt_table_init() function.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/pinctrl/sunxi/Makefile           |   1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 374 +++++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h    |   9 +
 3 files changed, 384 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 2ff5a55927ad6..f5bad7a529519 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Core
 obj-y					+= pinctrl-sunxi.o
+obj-y					+= pinctrl-sunxi-dt.o
 
 # SoC Drivers
 obj-$(CONFIG_PINCTRL_SUNIV_F1C100S)	+= pinctrl-suniv-f1c100s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
new file mode 100644
index 0000000000000..1833078f68776
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017-2025 Arm Ltd.
+ *
+ * Generic DT driven Allwinner pinctrl driver routines.
+ * Builds the pin tables from minimal driver information and pin groups
+ * described in the DT. Then hands those tables of to the traditional
+ * sunxi pinctrl driver.
+ * sunxi_pinctrl_init() expects a table like shown below, previously spelled
+ * out in a per-SoC .c file. This code generates this table, like so:
+ *
+ *  SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),	// code iterates over every implemented
+ *				// pin, based on pins_per_bank[] array passed in
+ *
+ *    SUNXI_FUNCTION(0x0, "gpio_in"),	// always added, for every pin
+ *    SUNXI_FUNCTION(0x1, "gpio_out"),	// always added, for every pin
+ *
+ *    SUNXI_FUNCTION(0x2, "mmc0"),	// based on pingroup found in DT:
+ *				//   mmc0-pins {
+ *				//       pins = "PF0", "PF1", ...
+ *				//       function = "mmc0";
+ *				//       allwinner,pinmux = <2>;
+ *
+ *    SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),	// derived by irq_bank_muxes[]
+ *						// array passed in
+ */
+
+#include <linux/export.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "pinctrl-sunxi.h"
+
+#define INVALID_MUX	0xff
+
+/*
+ * Return the "index"th element from the "allwinner,pinmux" property. If the
+ * property does not hold enough entries, return the last one instead.
+ * For almost every group the pinmux value is actually the same, so this
+ * allows to just list one value in the property.
+ */
+static u8 sunxi_pinctrl_dt_read_pinmux(const struct device_node *node,
+				       int index)
+{
+	int ret, num_elems;
+	u32 value;
+
+	num_elems = of_property_count_u32_elems(node, "allwinner,pinmux");
+	if (num_elems <= 0)
+		return INVALID_MUX;
+
+	if (index >= num_elems)
+		index = num_elems - 1;
+
+	ret = of_property_read_u32_index(node, "allwinner,pinmux", index,
+					 &value);
+	if (ret)
+		return INVALID_MUX;
+
+	return value;
+}
+
+/*
+ * Allocate a table with a sunxi_desc_pin structure for every pin needed.
+ * Fills in the respective pin names ("PA0") and their pin numbers.
+ * Returns the pins array. We cannot use the member in *desc yet, as this
+ * is marked as const, and we will need to change the array still.
+ */
+static struct sunxi_desc_pin *init_pins_table(struct device *dev,
+					      const u8 *pins_per_bank,
+					      struct sunxi_pinctrl_desc *desc)
+{
+	struct sunxi_desc_pin *pins, *cur_pin;
+	int name_size = 0;
+	int port_base = desc->pin_base / PINS_PER_BANK;
+	char *pin_names, *cur_name;
+	int i, j;
+
+	/*
+	 * Find the total number of pins.
+	 * Also work out how much memory we need to store all the pin names.
+	 */
+	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
+		desc->npins += pins_per_bank[i];
+		if (pins_per_bank[i] < 10) {
+			/* 4 bytes for "PXy\0" */
+			name_size += pins_per_bank[i] * 4;
+		} else {
+			/* 4 bytes for each "PXy\0" */
+			name_size += 10 * 4;
+
+			/* 5 bytes for each "PXyy\0" */
+			name_size += (pins_per_bank[i] - 10) * 5;
+		}
+	}
+
+	if (desc->npins == 0) {
+		dev_err(dev, "no ports defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pins = devm_kzalloc(dev, desc->npins * sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return ERR_PTR(-ENOMEM);
+
+	/* Allocate memory to store the name for every pin. */
+	pin_names = devm_kmalloc(dev, name_size, GFP_KERNEL);
+	if (!pin_names)
+		return ERR_PTR(-ENOMEM);
+
+	/* Fill the pins array with the name and the number for each pin. */
+	cur_name = pin_names;
+	cur_pin = pins;
+	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
+		for (j = 0; j < pins_per_bank[i]; j++, cur_pin++) {
+			int nchars = sprintf(cur_name, "P%c%d",
+					     port_base + 'A' + i, j);
+
+			cur_pin->pin.number = (port_base + i) * PINS_PER_BANK + j;
+			cur_pin->pin.name = cur_name;
+			cur_name += nchars + 1;
+		}
+	}
+
+	return pins;
+}
+
+/*
+ * Work out the number of functions for each pin. This will visit every
+ * child node of the pinctrl DT node to find all advertised functions.
+ * Provide memory to hold the per-function information and assign it to
+ * the pin table.
+ * Fill in the GPIO in/out functions already (that every pin has), also add
+ * an "irq" function at the end, for those pins in IRQ-capable ports.
+ * We do not fill in the extra functions (those describe in DT nodes) yet.
+ * We (ab)use the "variant" member in each pin to keep track of the number of
+ * extra functions needed. At the end this will get reset to 2, so that we
+ * can add extra function later, after the two GPIO functions.
+ */
+static int prepare_function_table(struct device *dev, struct device_node *pnode,
+				  struct sunxi_desc_pin *pins, int npins,
+				  const u8 *irq_bank_muxes)
+{
+	struct device_node *node;
+	struct property *prop;
+	struct sunxi_desc_function *func;
+	int num_funcs, irq_bank, last_bank, i;
+
+	/*
+	 * We need at least three functions per pin:
+	 * - one for GPIO in
+	 * - one for GPIO out
+	 * - one for the sentinel signalling the end of the list
+	 */
+	num_funcs = 3 * npins;
+
+	/*
+	 * Add a function for each pin in a bank supporting interrupts.
+	 * We temporarily (ab)use the variant field to store the number of
+	 * functions per pin. This will be cleaned back to 0 before we hand
+	 * over the whole structure to the generic sunxi pinctrl setup code.
+	 */
+	for (i = 0; i < npins; i++) {
+		struct sunxi_desc_pin *pin = &pins[i];
+		int bank = pin->pin.number / PINS_PER_BANK;
+
+		if (irq_bank_muxes[bank]) {
+			pin->variant++;
+			num_funcs++;
+		}
+	}
+
+	/*
+	 * Go over each pin group (every child of the pinctrl DT node) and
+	 * add the number of special functions each pins has. Also update the
+	 * total number of functions required.
+	 * We might slightly overshoot here in case of double definitions.
+	 */
+	for_each_child_of_node(pnode, node) {
+		const char *name;
+
+		of_property_for_each_string(node, "pins", prop, name) {
+			for (i = 0; i < npins; i++) {
+				if (strcmp(pins[i].pin.name, name))
+					continue;
+
+				pins[i].variant++;
+				num_funcs++;
+				break;
+			}
+		}
+	}
+
+	/*
+	 * Allocate the memory needed for the functions in one table.
+	 * We later use pointers into this table to mark each pin.
+	 */
+	func = devm_kzalloc(dev, num_funcs * sizeof(*func), GFP_KERNEL);
+	if (!func)
+		return -ENOMEM;
+
+	/*
+	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
+	 * The extra functions will be filled in later.
+	 */
+	irq_bank = 0;
+	last_bank = 0;
+	for (i = 0; i < npins; i++) {
+		struct sunxi_desc_pin *pin = &pins[i];
+		int bank = pin->pin.number / PINS_PER_BANK;
+		int lastfunc = pin->variant + 1;
+		int irq_mux = irq_bank_muxes[bank];
+
+		func[0].name = "gpio_in";
+		func[0].muxval = 0;
+		func[1].name = "gpio_out";
+		func[1].muxval = 1;
+
+		if (irq_mux) {
+			if (bank > last_bank)
+				irq_bank++;
+			func[lastfunc].muxval = irq_mux;
+			func[lastfunc].irqbank = irq_bank;
+			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
+			func[lastfunc].name = "irq";
+		}
+
+		if (bank > last_bank)
+			last_bank = bank;
+
+		pin->functions = func;
+
+		/* Skip over the other needed functions and the sentinel. */
+		func += pin->variant + 3;
+
+		/*
+		 * Reset the value for filling in the remaining functions
+		 * behind the GPIOs later.
+		 */
+		pin->variant = 2;
+	}
+
+	return 0;
+}
+
+/*
+ * Iterate over all pins in a single group and add the function name and its
+ * mux value to the respective pin.
+ * The "variant" member is again used to temporarily track the number of
+ * already added functions.
+ */
+static void fill_pin_function(struct device *dev, struct device_node *node,
+			      struct sunxi_desc_pin *pins, int npins)
+{
+	const char *name, *funcname;
+	struct sunxi_desc_function *func;
+	struct property *prop;
+	int pin, i, index;
+	u8 muxval;
+
+	if (of_property_read_string(node, "function", &funcname)) {
+		dev_warn(dev, "missing \"function\" property\n");
+		return;
+	}
+
+	index = 0;
+	of_property_for_each_string(node, "pins", prop, name) {
+		/* Find the index of this pin in our table. */
+		for (pin = 0; pin < npins; pin++)
+			if (!strcmp(pins[pin].pin.name, name))
+				break;
+		if (pin == npins) {
+			dev_warn(dev, "%s: cannot find pin %s\n",
+				 of_node_full_name(node), name);
+			index++;
+			continue;
+		}
+
+		/* Read the associated mux value. */
+		muxval = sunxi_pinctrl_dt_read_pinmux(node, index);
+		if (muxval == INVALID_MUX) {
+			dev_warn(dev, "%s: invalid mux value for pin %s\n",
+				 of_node_full_name(node), name);
+			index++;
+			continue;
+		}
+
+		/*
+		 * Check for double definitions by comparing the to-be-added
+		 * function with already assigned ones.
+		 * Ignore identical pairs (function name and mux value the
+		 * same), but warn about conflicting assignments.
+		 */
+		for (i = 2; i < pins[pin].variant; i++) {
+			func = &pins[pin].functions[i];
+
+			/* Skip over totally unrelated functions. */
+			if (strcmp(func->name, funcname) &&
+			    func->muxval != muxval)
+				continue;
+
+			/* Ignore (but skip below) any identical functions. */
+			if (!strcmp(func->name, funcname) &&
+			    muxval == func->muxval)
+				break;
+
+			dev_warn(dev,
+				 "pin %s: function %s redefined to mux %d\n",
+				 name, funcname, muxval);
+			break;
+		}
+
+		/* Skip any pins with that function already assigned. */
+		if (i < pins[pin].variant) {
+			index++;
+			continue;
+		}
+
+		/* Assign function and muxval to the next free slot. */
+		func = &pins[pin].functions[pins[pin].variant];
+		func->muxval = muxval;
+		func->name = funcname;
+
+		pins[pin].variant++;
+		index++;
+	}
+}
+
+/*
+ * Initialise the pinctrl table, by building it from driver provided
+ * information: the number of pins per bank, the IRQ capable banks and their
+ * IRQ mux value.
+ * Then iterate over all pinctrl DT node children to enter the function name
+ * and mux values for each mentioned pin.
+ * At the end hand over this structure to the actual sunxi pinctrl driver.
+ */
+int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
+				const u8 *pins_per_bank,
+				const u8 *irq_bank_muxes,
+				struct sunxi_pinctrl_desc *desc,
+				unsigned long flags)
+{
+	struct device_node *pnode = pdev->dev.of_node, *node;
+	struct sunxi_desc_pin *pins;
+	int ret, i;
+
+	pins = init_pins_table(&pdev->dev, pins_per_bank, desc);
+	if (IS_ERR(pins))
+		return PTR_ERR(pins);
+
+	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
+				     irq_bank_muxes);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now iterate over all groups and add the respective function name
+	 * and mux values to each pin listed within.
+	 */
+	for_each_child_of_node(pnode, node)
+		fill_pin_function(&pdev->dev, node, pins, desc->npins);
+
+	/* Clear the temporary storage. */
+	for (i = 0; i < desc->npins; i++)
+		pins[i].variant = 0;
+
+	desc->pins = pins;
+
+	return sunxi_pinctrl_init_with_flags(pdev, desc, flags);
+}
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 742fc795c7664..ad26e4de16a85 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -31,6 +31,9 @@
 #define PM_BASE	384
 #define PN_BASE	416
 
+/* maximum number of banks per controller (PA -> PK) */
+#define SUNXI_PINCTRL_MAX_BANKS	11
+
 #define SUNXI_PINCTRL_PIN(bank, pin)		\
 	PINCTRL_PIN(P ## bank ## _BASE + (pin), "P" #bank #pin)
 
@@ -304,4 +307,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 #define sunxi_pinctrl_init(_dev, _desc) \
 	sunxi_pinctrl_init_with_flags(_dev, _desc, 0)
 
+int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
+				const u8 *pins_per_bank,
+				const u8 *irq_bank_muxes,
+				struct sunxi_pinctrl_desc *desc,
+				unsigned long flags);
+
 #endif /* __PINCTRL_SUNXI_H */
-- 
2.46.3


