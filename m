Return-Path: <linux-gpio+bounces-29779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66DCD2D3C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 11:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92C223040662
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 10:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A410230B51F;
	Sat, 20 Dec 2025 10:15:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B50130AAC9;
	Sat, 20 Dec 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225751; cv=none; b=NfT8VP2O8kBI9JP+28PTq77/okdlARbwRzco/Wz1QKyTdJ81oXhicUrI98kRQzYsDTHieaquMWsz3FYYUKhw1VyxP4rVM3Vz09umEcZcFOBBfCkFI7x0DJTP9kzEzf4JwX3nx0RETmcByMD4T6RXJ7g1lKVdXSo01hKU5VS8/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225751; c=relaxed/simple;
	bh=JrqpSztMIibxE6cOPrU6XYfvaR2rsM4120PwejlzsPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7ykOcN17StSM0iSzx57fIiKl5cKNV8mOiMWfBV2huq98/1dIBN45GRjw9Ayun1TeoI1ko2mJ6adKtGGaPduCtyi2GPtffzZVXcWsqgG+5y1TJYyFDoU8qJECVr9DkCCWiSafRSmb9Fv1DG51HLTrbLsQgX8u2rUPvPBIcBu0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1DE42341E7C;
	Sat, 20 Dec 2025 10:15:44 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 18:14:55 +0800
Subject: [PATCH RFC 3/3] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
In-Reply-To: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10394; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=JrqpSztMIibxE6cOPrU6XYfvaR2rsM4120PwejlzsPk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRnc+t23jSTJSmRIF7s0ok81iXPsLfQkb+GM9M
 BsC5fqHfD+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUZ3PhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3N/w/+N3ibpi9/Ma9fAofpeYYYn5BsvB6+joE/sAWxkbJ4YCM/N6v2Nhoz+
 sE6DWG21ndwFGbPkFHG1UFAN9QqjN/+XxcZQfMveb5SuQaB5g7vtE7i/MWLRYuJxJ1MAPvCCRDl
 D/r6OlcglPuof3GkGi3GGKnIEQTlmeDpWeb/iAnrehknx5UpVmlVVgy9f8rPkMuI/GRrm1MB2ni
 haD7bbxgf+UwEdsM1TKQsEqu3ZLHLr4o1HVd0lvcFSPpZVSh6Mo4ORfopaEOnBQ1QYYaFKajNa1
 nwoPNZZ3wishFxdwzh68kUVNrCunscR6V61PBZsvEeJ6a2xtiuN3bBbkB3mwH0FluYVNZD+agIS
 fzDF9pbRoIZshQAfmbZiEZkNb8RGtbHQhsjoI/oLcSiSqsT1ezUrk/O/p5c03FeWf3KLLejnLh9
 4ZrrX4PGLTYmH7KFb9ix2tEqDrrJIMZz7YHlxmvZnA4TfCvPzt6cu2ikJPTMl+PVZ/ZB+SzN2uL
 4nHMYTNrRJ9Uvhmql7ieMKWJ2fwpRPsZpnbzfRaMjiNTcCH0qpDBronwo1lAQKC/UE2N8oIfDMw
 GWWYIvDvuKopq8UfoSfnTz6TuqtA5XRGOhY0oSExys6HAK4IhGGcrRRI7z6iEBpLwIZqddSZ81K
 JeDDYO+JJnPDcAGIw3Dq05fWoB/wRI=
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
index 441817f539e3..8ca247fb8ba0 100644
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
+		v |= (arg << __ffs(dconf->drive_mask)) & dconf->drive_mask;
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


