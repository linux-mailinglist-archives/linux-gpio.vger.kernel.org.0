Return-Path: <linux-gpio+bounces-30042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CECEDE8F
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 08:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B95BB3004E02
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 07:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958B02D5C8E;
	Fri,  2 Jan 2026 07:01:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B42D5950;
	Fri,  2 Jan 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337291; cv=none; b=FW+aobCgQUIAJw+w93QCjP6Y5R+c+95A4sQBulkY8WOh+ql2iiBu69HGb5iWZspgICQjqouLd+gy4vI1f6ffqATCrAxRvmt6Cbp5aWFKUflnojk4dApoflH3PBONEPFSiwEXiZZH0iwsF4R4chPJsJD7SH2BZuE9uGjK4yTgQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337291; c=relaxed/simple;
	bh=NLUQ+bvVOCaNTkqoksoZUBzNK0bLwckRSG+XlsNzJ+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9Nzj5EelJMFjv/pueCX0FAuoaPZA7azQmBq47fY18y25nLRoBPdhRw0HeuCemPYd2MyFoGIM0wlAeU0xl1/ZThpGcNzVFONrX1yKegw4NVroh+S+sW6L5L4wtrvG3sRj/xnwDxMn3hZVx1GJyTpHqKg6Mm6rEMxe4ExCMfzJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ED80D341EA1;
	Fri, 02 Jan 2026 07:01:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 02 Jan 2026 15:00:25 +0800
Subject: [PATCH v3 4/4] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-02-k3-pinctrl-v3-4-30aa104e2847@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10394; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=NLUQ+bvVOCaNTkqoksoZUBzNK0bLwckRSG+XlsNzJ+E=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20s4zOqhv4Err0ZDFpZOL8d67sXAKnjy/UTJ
 9c1+X5YjAKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtLBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0EKxAAn/oKXYozSbPmoDfsZ22tHL/Q0Km5LwLRMvGPhlt4wC2Ol0IJThkA7
 izz3jWVGg+jJdQLNKLyV3qY4HLsle0XjeSKVhmuTLsVKIEr3i5BZGAXasgF4fh9nopOGvdrxev/
 2+JKUQaZfNOtkeNZvre77dGNBlxVPZ0uPvUZAmgyLpPBT+NLLofieJ23Ko4epgcbRUU1uA+2Czk
 5HJ2nAEykkf3Axt5XG4/esNiD/ngx6gSEfyzj7E3aYK/42EeuAi52J9mnzNZKJMM1ld3tQcWocd
 HURJRK6xouCNdhT304aBrunKU7myG5wNuVqMlDCx70u/aA3+mzwMvG1qJd2CMjwSNc3z8OuHEGr
 JpyQJ7JAextQuorL0SLG0WZuS1ahz6FMlOP1EYh7HlNIZGTbknoVbe6yHqG2KjdHFVuej9e5y9J
 g9ZHcqyn8GFzJM11Ka5BFPY7Fp5YSHXA6GZB4svVuQJAyjAcALaMdQakpg94jng67FX3S4tCCHE
 C7I1Yzq++RCxkP6JQtUV8KMs+jlW0jB949aLxcxLcDrsRZdRTe5HKASg+R06xsA8unesqgnBVWh
 Zv28AhUrluFd5ZjoR/025ju5COMsZaQWfnJ6UjybNyZP9drVBNos7y4HYwYktQ7IQ31XIupkaYe
 lU23WkduIf+ujPA5DZ1wYitHJ3+LiM=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

K3 SoC expand drive strength to 4 bits which support even larger
settings table comparing to old SoC generation. Also schmitter trigger
setting is changed to 1 bit.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 163 ++++++++++++++++++++++++----------
 1 file changed, 116 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 441817f539e3..07267c5f0f44 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -24,11 +24,12 @@
 #include "pinctrl-k1.h"
 
 /*
- * +---------+----------+-----------+--------+--------+----------+--------+
- * |   pull  |   drive  | schmitter |  slew  |  edge  |  strong  |   mux  |
- * | up/down | strength |  trigger  |  rate  | detect |   pull   |  mode  |
- * +---------+----------+-----------+--------+--------+----------+--------+
- *   3 bits     3 bits     2 bits     1 bit    3 bits     1 bit    3 bits
+ *     |   pull  |   drive  | schmitter | slew  |  edge  | strong |   mux  |
+ * SoC | up/down | strength |  trigger  | rate  | detect |  pull  |  mode  |
+ *-----+---------+----------+-----------+-------+--------+--------+--------+
+ * K1  | 3 bits  |  3 bits  |   2 bits  | 1 bit | 3 bits |  1 bit | 3 bits |
+ *-----+---------+----------+-----------+-------+--------+--------+--------+
+ * K3  | 3 bits  |  4 bits  |   1 bits  | 1 bit | 3 bits |  1 bit | 3 bits |
  */
 
 #define PAD_MUX			GENMASK(2, 0)
@@ -38,12 +39,29 @@
 #define PAD_EDGE_CLEAR		BIT(6)
 #define PAD_SLEW_RATE		GENMASK(12, 11)
 #define PAD_SLEW_RATE_EN	BIT(7)
-#define PAD_SCHMITT		GENMASK(9, 8)
-#define PAD_DRIVE		GENMASK(12, 10)
+#define PAD_SCHMITT_K1		GENMASK(9, 8)
+#define PAD_DRIVE_K1		GENMASK(12, 10)
+#define PAD_SCHMITT_K3		BIT(8)
+#define PAD_DRIVE_K3		GENMASK(12, 9)
 #define PAD_PULLDOWN		BIT(13)
 #define PAD_PULLUP		BIT(14)
 #define PAD_PULL_EN		BIT(15)
 
+struct spacemit_pin_drv_strength {
+	u8		val;
+	u32		mA;
+};
+
+struct spacemit_pinctrl_dconf {
+	u64				schmitt_mask;
+	u64				drive_mask;
+
+	struct spacemit_pin_drv_strength *ds_1v8_tbl;
+	size_t				 ds_1v8_tbl_num;
+	struct spacemit_pin_drv_strength *ds_3v3_tbl;
+	size_t				 ds_3v3_tbl_num;
+};
+
 struct spacemit_pin {
 	u16				pin;
 	u16				flags;
@@ -67,6 +85,7 @@ struct spacemit_pinctrl_data {
 	const struct spacemit_pin	*data;
 	u16				npins;
 	unsigned int			(*pin_to_offset)(unsigned int pin);
+	const struct spacemit_pinctrl_dconf	*dconf;
 };
 
 struct spacemit_pin_mux_config {
@@ -74,11 +93,6 @@ struct spacemit_pin_mux_config {
 	u32				config;
 };
 
-struct spacemit_pin_drv_strength {
-	u8		val;
-	u32		mA;
-};
-
 /* map pin id to pinctrl register offset, refer MFPR definition */
 static unsigned int spacemit_k1_pin_to_offset(unsigned int pin)
 {
@@ -193,23 +207,70 @@ static void spacemit_pctrl_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(seq, "mux: %ld reg: 0x%04x", (value & PAD_MUX), value);
 }
 
-/* use IO high level output current as the table */
-static struct spacemit_pin_drv_strength spacemit_ds_1v8_tbl[4] = {
-	{ 0, 11 },
-	{ 2, 21 },
-	{ 4, 32 },
-	{ 6, 42 },
+static const struct spacemit_pinctrl_dconf k1_drive_conf = {
+	.drive_mask = PAD_DRIVE_K1,
+	.schmitt_mask = PAD_SCHMITT_K1,
+	.ds_1v8_tbl = (struct spacemit_pin_drv_strength[]) {
+		{ 0, 11 },
+		{ 2, 21 },
+		{ 4, 32 },
+		{ 6, 42 },
+	},
+	.ds_1v8_tbl_num = 4,
+	.ds_3v3_tbl = (struct spacemit_pin_drv_strength[]) {
+		{ 0,  7 },
+		{ 2, 10 },
+		{ 4, 13 },
+		{ 6, 16 },
+		{ 1, 19 },
+		{ 3, 23 },
+		{ 5, 26 },
+		{ 7, 29 },
+	},
+	.ds_3v3_tbl_num = 8,
 };
 
-static struct spacemit_pin_drv_strength spacemit_ds_3v3_tbl[8] = {
-	{ 0,  7 },
-	{ 2, 10 },
-	{ 4, 13 },
-	{ 6, 16 },
-	{ 1, 19 },
-	{ 3, 23 },
-	{ 5, 26 },
-	{ 7, 29 },
+static const struct spacemit_pinctrl_dconf k3_drive_conf = {
+	.drive_mask = PAD_DRIVE_K3,
+	.schmitt_mask = PAD_SCHMITT_K3,
+	.ds_1v8_tbl = (struct spacemit_pin_drv_strength[]) {
+		{ 0,  2 },
+		{ 1,  4 },
+		{ 2,  6 },
+		{ 3,  7 },
+		{ 4,  9 },
+		{ 5,  11 },
+		{ 6,  13 },
+		{ 7,  14 },
+		{ 8,  21 },
+		{ 9,  23 },
+		{ 10, 25 },
+		{ 11, 26 },
+		{ 12, 28 },
+		{ 13, 30 },
+		{ 14, 31 },
+		{ 15, 33 },
+	},
+	.ds_1v8_tbl_num = 16,
+	.ds_3v3_tbl = (struct spacemit_pin_drv_strength[]) {
+		{ 0,  3 },
+		{ 1,  5 },
+		{ 2,  7 },
+		{ 3,  9 },
+		{ 4,  11 },
+		{ 5,  13 },
+		{ 6,  15 },
+		{ 7,  17 },
+		{ 8,  25 },
+		{ 9,  27 },
+		{ 10, 29 },
+		{ 11, 31 },
+		{ 12, 33 },
+		{ 13, 35 },
+		{ 14, 37 },
+		{ 15, 38 },
+	},
+	.ds_3v3_tbl_num = 16,
 };
 
 static inline u8 spacemit_get_ds_value(struct spacemit_pin_drv_strength *tbl,
@@ -237,16 +298,17 @@ static inline u32 spacemit_get_ds_mA(struct spacemit_pin_drv_strength *tbl,
 }
 
 static inline u8 spacemit_get_driver_strength(enum spacemit_pin_io_type type,
+					      const struct spacemit_pinctrl_dconf *dconf,
 					      u32 mA)
 {
 	switch (type) {
 	case IO_TYPE_1V8:
-		return spacemit_get_ds_value(spacemit_ds_1v8_tbl,
-					     ARRAY_SIZE(spacemit_ds_1v8_tbl),
+		return spacemit_get_ds_value(dconf->ds_1v8_tbl,
+					     dconf->ds_1v8_tbl_num,
 					     mA);
 	case IO_TYPE_3V3:
-		return spacemit_get_ds_value(spacemit_ds_3v3_tbl,
-					     ARRAY_SIZE(spacemit_ds_3v3_tbl),
+		return spacemit_get_ds_value(dconf->ds_3v3_tbl,
+					     dconf->ds_3v3_tbl_num,
 					     mA);
 	default:
 		return 0;
@@ -254,16 +316,17 @@ static inline u8 spacemit_get_driver_strength(enum spacemit_pin_io_type type,
 }
 
 static inline u32 spacemit_get_drive_strength_mA(enum spacemit_pin_io_type type,
+						 const struct spacemit_pinctrl_dconf *dconf,
 						 u32 value)
 {
 	switch (type) {
 	case IO_TYPE_1V8:
-		return spacemit_get_ds_mA(spacemit_ds_1v8_tbl,
-					  ARRAY_SIZE(spacemit_ds_1v8_tbl),
-					  value & 0x6);
+		return spacemit_get_ds_mA(dconf->ds_1v8_tbl,
+					  dconf->ds_1v8_tbl_num,
+					  value);
 	case IO_TYPE_3V3:
-		return spacemit_get_ds_mA(spacemit_ds_3v3_tbl,
-					  ARRAY_SIZE(spacemit_ds_3v3_tbl),
+		return spacemit_get_ds_mA(dconf->ds_3v3_tbl,
+					  dconf->ds_3v3_tbl_num,
 					  value);
 	default:
 		return 0;
@@ -510,6 +573,7 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 #define ENABLE_DRV_STRENGTH	BIT(1)
 #define ENABLE_SLEW_RATE	BIT(2)
 static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
+					    const struct spacemit_pinctrl_dconf *dconf,
 					    unsigned long *configs,
 					    unsigned int num_configs,
 					    u32 *value)
@@ -547,8 +611,8 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			drv_strength = arg;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT:
-			v &= ~PAD_SCHMITT;
-			v |= FIELD_PREP(PAD_SCHMITT, arg);
+			v &= ~dconf->schmitt_mask;
+			v |= (arg << __ffs(dconf->schmitt_mask)) & dconf->schmitt_mask;
 			break;
 		case PIN_CONFIG_POWER_SOURCE:
 			voltage = arg;
@@ -584,10 +648,10 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			}
 		}
 
-		val = spacemit_get_driver_strength(type, drv_strength);
+		val = spacemit_get_driver_strength(type, dconf, drv_strength);
 
-		v &= ~PAD_DRIVE;
-		v |= FIELD_PREP(PAD_DRIVE, val);
+		v &= ~dconf->drive_mask;
+		v |= (val << __ffs(dconf->drive_mask)) & dconf->drive_mask;
 	}
 
 	if (flag & ENABLE_SLEW_RATE) {
@@ -637,7 +701,8 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
 
-	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
+	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+					     configs, num_configs, &value))
 		return -EINVAL;
 
 	return spacemit_pin_set_config(pctrl, pin, value);
@@ -659,7 +724,8 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
+	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+					     configs, num_configs, &value))
 		return -EINVAL;
 
 	for (i = 0; i < group->grp.npins; i++)
@@ -693,6 +759,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				      struct seq_file *seq, unsigned int pin)
 {
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct spacemit_pinctrl_dconf *dconf = pctrl->data->dconf;
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
 	void __iomem *reg = spacemit_pin_to_reg(pctrl, pin);
@@ -703,17 +770,17 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 
 	seq_printf(seq, ", io type (%s)", io_type_desc[type]);
 
-	tmp = FIELD_GET(PAD_DRIVE, value);
+	tmp = (value & dconf->drive_mask) >> __ffs(dconf->drive_mask);
 	if (type == IO_TYPE_1V8 || type == IO_TYPE_3V3) {
-		mA = spacemit_get_drive_strength_mA(type, tmp);
+		mA = spacemit_get_drive_strength_mA(type, dconf, tmp);
 		seq_printf(seq, ", drive strength (%d mA)", mA);
 	}
 
 	/* drive strength depend on power source, so show all values */
 	if (type == IO_TYPE_EXTERNAL)
 		seq_printf(seq, ", drive strength (%d or %d mA)",
-			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
-			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
+			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, dconf, tmp),
+			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, dconf, tmp));
 
 	seq_printf(seq, ", register (0x%04x)", value);
 }
@@ -1051,6 +1118,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
 	.data = k1_pin_data,
 	.npins = ARRAY_SIZE(k1_pin_desc),
 	.pin_to_offset = spacemit_k1_pin_to_offset,
+	.dconf = &k1_drive_conf,
 };
 
 static const struct pinctrl_pin_desc k3_pin_desc[] = {
@@ -1387,6 +1455,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
 	.data = k3_pin_data,
 	.npins = ARRAY_SIZE(k3_pin_desc),
 	.pin_to_offset = spacemit_k3_pin_to_offset,
+	.dconf = &k3_drive_conf,
 };
 
 static const struct of_device_id k1_pinctrl_ids[] = {

-- 
2.52.0


