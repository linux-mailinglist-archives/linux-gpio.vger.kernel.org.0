Return-Path: <linux-gpio+bounces-29810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4DCD885C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCB99303A0BF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1655F322C67;
	Tue, 23 Dec 2025 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="b25sziMa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FE3242B8;
	Tue, 23 Dec 2025 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481107; cv=none; b=hIQoop7db3EJaggJQq7+8KLeZHsj3yPoQBHrZLAqGbqbphZXmPIJ3snOUb8jo/QtNV5Phl2AgBcjuU1TaJKNwgA7XD8zlXwMA4QEOxV5sA3ktDikph2QGdM3BKLUcR1a3Y4NDtXdWxQDWmfi4XEkrBd5BfY4zUsv57WAK4qEXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481107; c=relaxed/simple;
	bh=H8MAD1flgSxo90tf4qKPSiR3GbcLMbZ+riVLpJiUFeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8MYOYuhbX0kf9YLY7ck/cvdZ2cxIrOBwV3HcquG+6vngbvOcUWF1h1/SsQS9bV8ztfQ4ARZLdvFBjG4xHBwFNGu3wv6hXBKTQY0PhNJYELhdcqVIVeG/MiX+pXsRDun1tRmYmMEUlezbRbv0Q40ua3+Az1n+AR9qUmnWm6fhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=b25sziMa; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481092;
	bh=VrMTiF3Zn2O9PQiW+qTsH5ZlSMA1veprIN9lAh4I/YY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=b25sziMaYkJj6TWS0rS8sEdVnQPfHQI1F3GvwzvnOy/MOof5HxrL5AzYgAwKTXW0E
	 wgp/vnPL8wnA5Lb9xq+w4ns8RgIUrSv2zwMjs6gvXYGL7jzCKNo4pAb1rTQS/jN5jS
	 khB7JdNqDKZWxHzGwuV7NMmFnmMQF3BDkm7YbyZc=
X-QQ-mid: zesmtpgz6t1766481084t16904670
X-QQ-Originating-IP: kcO+ntnvqeIk2ReWF769Ryi38sTAnoxbRaBrt9Wf5Cg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13884977633580607309
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 23 Dec 2025 17:11:12 +0800
Subject: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=9633;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=H8MAD1flgSxo90tf4qKPSiR3GbcLMbZ+riVLpJiUFeU=;
 b=Ryg7x+nRbvlWZcilYWuGa/45Bnr1Zz4dgKQfhGSaY7yKcvi1U/0C8htiYBTG/5qUhhyEILGRn
 Obe2NsP1zEBAt2meH8kGgwMXi2+xW2HFXSlP6Tbo4xac8NtGYHNolve
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8UYpcaD4/AyS8a3BcSFzGH5h+uKd/n2rApXT1TY9mXtNd18lSE09Pik
	sFfveubgSWNCOGXbcRsjKvOAnNwNUuqQB6pBn3TPVhDvJ8gn76yVSGP/SJaNnXvI9VV4DoW
	lKMTo+ZJvOER9mQGN7zE+sBXPJNkB76huFwcJZNrn9GtQGBB5CrKz2mpyktkeVVZp/CnwK7
	qOes+Omea0fOZ+jR9IwU7cX0HpJr8GAdWBI/ecX4oi1BBLddwP/+NniTR7WQMAOO5/ycwxX
	+GfcYAPzxpdRmuh2gHm4ZtOA5N58VB6NONeXEATSIRCVWZbVKEUAqCyPMZ06bubvisFJB1p
	i0TSZj6MPkwXap0BhlgMBBZtqvhlhAyssEc+nkvCtGUTH76x2Z/yJWQ8VLVTdpkpuU4AHc2
	TtrGcwiLWQuImHnwcKNHPxLiuhLlhQ78kVkf6W6xCnpM7qsupaznoY0HyMdFoGBAvZ2xk5D
	WCNUZ0apwBuraai8MkCwiUwOAiXXYeIkijWqWvFZXUmMCAXD3qMpa+U4wzvM3JMFZhREg+R
	Q7fh5a4ckiQvL2Y4Dd61URkMRPvs+pdWueVVQiRgxk2OiH7lQRj93RqR3JT2wVAVwvQzzKw
	ft3Xn3gV0PuVCZrqKaeYOith7PcJc0/iU0S1D9ZDwUq9C8bQVmzPVruIkBO4vaozT8rt85J
	Ly/0ExEpiQbGWSc9FViGYTTk9kQszXGASB5dLiMycMcI4Tw56FldDo2xS4+u1BdJNs5HpuS
	g9W8JDGLIXwbNdP8kidxupM+RICwKLapf8JmiqenBAYMIVlpMNBCE/F1LvvPV/+PYWO/zt2
	tPh1Zpk3bheVUUacEQsAr6ljVVhWrNptW45UIwp185+fdFjw8ArknUMXvcPZwG1F2h3qXzH
	kl32xJMDeEsj1az220TRFrGTO8UCbdY3A31zXE7Jao+yyBxRMYeZDrjMUiPgIwx5cBuLWDj
	n47Mkmo6RlAtsrJsTvpCC/SiF8TpdGL+0eO0g93zmqMQeYF5RW1kVDvOTxPeRBNVuZsxNoi
	bM3hyn33nkBrqJXDsRX+5KbTKzgY/knfOZo84lOkWgKUa11eWujuH2XZi6h58nRJXI93zRY
	o3O0H6yUq5gs6YEyWBle7q6pHEHjPu//muFHeNQhn36+h+iJu3RI3Lt3Luwrg0pp7NyHSG2
	zhtM10YgoVWCR8Q/Sdu7uucXdg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

IO domain power control registers are used to configure the operating
voltage of dual-voltage GPIO banks. By default, these registers are
configured for 3.3V operation. As a result, even when a GPIO bank is
externally supplied with 1.8V, the internal logic continues to
operate in the 3.3V domain, which may lead to functional failures.

This patch adds support for programming the IO domain power control
registers, allowing dual-voltage GPIO banks to be explicitly configured
for 1.8V operation when required.

Care must be taken when configuring these registers. If a GPIO bank is
externally supplied with 3.3V while the corresponding IO power domain
is configured for 1.8V, external current injection (back-powering)
may occur, potentially causing damage to the GPIO pin.

Due to these hardware constraints and safety considerations, the IO
domain power control registers are implemented as secure registers.
Access to these registers requires unlocking via the AIB Secure Access
Register (ASAR) in the APBC block before a single read or write
operation can be performed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
 
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
-			reg = <0x0 0xd401e000 0x0 0x400>;
+			reg = <0x0 0xd401e000 0x0 0x400>,
+			      <0x0 0xd401e800 0x0 0x34>;
 			clocks = <&syscon_apbc CLK_AIB>,
 				 <&syscon_apbc CLK_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc 0x50>;
 		};
 
 		pwm8: pwm@d4020000 {
diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 8ca247fb8ba0321c02423f9739130e03277d1053..b3ffb32f88a79ebf6b64e62a7846df60b92799fe 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -7,8 +7,10 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -47,6 +49,25 @@
 #define PAD_PULLUP		BIT(14)
 #define PAD_PULL_EN		BIT(15)
 
+#define IO_PWR_DOMAIN_GPIO2_Kx  0x0c
+#define IO_PWR_DOMAIN_MMC_Kx    0x1c
+
+#define IO_PWR_DOMAIN_GPIO3_K1  0x10
+#define IO_PWR_DOMAIN_QSPI_K1   0x20
+
+#define IO_PWR_DOMAIN_GPIO1_K3  0x04
+#define IO_PWR_DOMAIN_GPIO5_K3  0x10
+#define IO_PWR_DOMAIN_GPIO4_K3  0x20
+#define IO_PWR_DOMAIN_QSPI_K3   0x2c
+
+#define IO_PWR_DOMAIN_V18EN	BIT(2)
+
+#define APBC_ASFAR		0x00
+#define APBC_ASSAR		0x04
+
+#define APBC_ASFAR_AKEY		0xbaba
+#define APBC_ASSAR_AKEY		0xeb10
+
 struct spacemit_pin_drv_strength {
 	u8		val;
 	u32		mA;
@@ -78,6 +99,10 @@ struct spacemit_pinctrl {
 	raw_spinlock_t				lock;
 
 	void __iomem				*regs;
+	void __iomem				*io_pd_reg;
+
+	struct regmap				*regmap_apbc;
+	u32					regmap_apbc_offset;
 };
 
 struct spacemit_pinctrl_data {
@@ -85,6 +110,7 @@ struct spacemit_pinctrl_data {
 	const struct spacemit_pin	*data;
 	u16				npins;
 	unsigned int			(*pin_to_offset)(unsigned int pin);
+	unsigned int			(*pin_to_io_pd_offset)(unsigned int pin);
 	const struct spacemit_pinctrl_dconf	*dconf;
 };
 
@@ -146,6 +172,56 @@ static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
 	return offset << 2;
 }
 
+static unsigned int spacemit_k1_pin_to_io_pd_offset(unsigned int pin)
+{
+	unsigned int offset = 0;
+
+	switch (pin) {
+	case 47 ... 52:
+		offset = IO_PWR_DOMAIN_GPIO3_K1;
+		break;
+	case 75 ... 80:
+		offset = IO_PWR_DOMAIN_GPIO2_Kx;
+		break;
+	case 98 ... 103:
+		offset = IO_PWR_DOMAIN_QSPI_K1;
+		break;
+	case 104 ... 109:
+		offset = IO_PWR_DOMAIN_MMC_Kx;
+		break;
+	}
+
+	return offset;
+}
+
+static unsigned int spacemit_k3_pin_to_io_pd_offset(unsigned int pin)
+{
+	unsigned int offset = 0;
+
+	switch (pin) {
+	case 0 ... 20:
+		offset = IO_PWR_DOMAIN_GPIO1_K3;
+		break;
+	case 21 ... 41:
+		offset = IO_PWR_DOMAIN_GPIO2_Kx;
+		break;
+	case 76 ... 98:
+		offset = IO_PWR_DOMAIN_GPIO4_K3;
+		break;
+	case 99 ... 127:
+		offset = IO_PWR_DOMAIN_GPIO5_K3;
+		break;
+	case 132 ... 137:
+		offset = IO_PWR_DOMAIN_MMC_Kx;
+		break;
+	case 138 ... 144:
+		offset = IO_PWR_DOMAIN_QSPI_K3;
+		break;
+	}
+
+	return offset;
+}
+
 static inline void __iomem *spacemit_pin_to_reg(struct spacemit_pinctrl *pctrl,
 						unsigned int pin)
 {
@@ -365,6 +441,38 @@ static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
+				      const struct spacemit_pin *spin,
+				      const enum spacemit_pin_io_type type)
+{
+	u32 offset = pctrl->data->pin_to_io_pd_offset(spin->pin);
+	u32 val = 0;
+
+	/* Other bits are reserved so don't need to save them */
+	if (type == IO_TYPE_1V8)
+		val = IO_PWR_DOMAIN_V18EN;
+
+	/*
+	 * IO power domain registers are protected and cannot be accessed
+	 * directly. Before performing any read or write to the IO power
+	 * domain registers, an explicit unlock sequence must be issued
+	 * via the AIB Secure Access Register (ASAR).
+	 *
+	 * The unlock sequence allows exactly one subsequent access to the
+	 * IO power domain registers. After that access completes, the ASAR
+	 * keys are automatically cleared, and the registers become locked
+	 * again.
+	 *
+	 * This mechanism ensures that IO power domain configuration is
+	 * performed intentionally, as incorrect voltage settings may
+	 * result in functional failures or hardware damage.
+	 */
+	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASFAR, APBC_ASFAR_AKEY);
+	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASSAR, APBC_ASSAR_AKEY);
+
+	writel_relaxed(val, pctrl->io_pd_reg + offset);
+}
+
 static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 struct device_node *np,
 					 struct pinctrl_map **maps,
@@ -572,7 +680,8 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 
 #define ENABLE_DRV_STRENGTH	BIT(1)
 #define ENABLE_SLEW_RATE	BIT(2)
-static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
+static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
+					    const struct spacemit_pin *spin,
 					    const struct spacemit_pinctrl_dconf *dconf,
 					    unsigned long *configs,
 					    unsigned int num_configs,
@@ -646,6 +755,7 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			default:
 				return -EINVAL;
 			}
+			spacemit_set_io_pwr_domain(pctrl, spin, type);
 		}
 
 		val = spacemit_get_driver_strength(type, dconf, drv_strength);
@@ -701,7 +811,7 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
 
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -724,7 +834,7 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -795,6 +905,7 @@ static const struct pinconf_ops spacemit_pinconf_ops = {
 
 static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
 	struct clk *func_clk, *bus_clk;
@@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pctrl->io_pd_reg))
+		return PTR_ERR(pctrl->io_pd_reg);
+
+	pctrl->regmap_apbc =
+		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
+						     &pctrl->regmap_apbc_offset);
+
+	if (IS_ERR(pctrl->regmap_apbc))
+		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
+				     "failed to get syscon\n");
+
 	func_clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(func_clk))
 		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
@@ -1118,6 +1241,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
 	.data = k1_pin_data,
 	.npins = ARRAY_SIZE(k1_pin_desc),
 	.pin_to_offset = spacemit_k1_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k1_pin_to_io_pd_offset,
 	.dconf = &k1_drive_conf,
 };
 
@@ -1455,6 +1579,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
 	.data = k3_pin_data,
 	.npins = ARRAY_SIZE(k3_pin_desc),
 	.pin_to_offset = spacemit_k3_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k3_pin_to_io_pd_offset,
 	.dconf = &k3_drive_conf,
 };
 

-- 
2.52.0


