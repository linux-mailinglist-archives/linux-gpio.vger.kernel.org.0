Return-Path: <linux-gpio+bounces-30246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E099D0149A
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD49308A428
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4495633C192;
	Thu,  8 Jan 2026 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="V2s8xB+F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981533D4E1;
	Thu,  8 Jan 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854622; cv=none; b=hyL6o+nwFpCn9rh3D4HXhhh5tnv14wHyDfINlIV6orBqjXRPXSfM4gTKblA/nyzQW9xh6Y37fABwLnrr0dzcy1z961/J7N418NjvBc1AJRkGmydixW13s1mcqHNhzE4lVtWInC5QaK2/FYhgUaF0CvMPoyVijLn73s/YsX0SJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854622; c=relaxed/simple;
	bh=f3Vz/FjB4IU2wC5YjnE37vrmig4UUrSSKIfocxwuzRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7gXfqpylC8soYA8b5Ne3sZ8I8Gpxu4ZxYXjlLGXDOi1bQi/AE1olSWWC+lSdMDQKAHoG7lNZ4qSHU9V33ZBVgJaOidL59G2nni0f4zdgJZX5hask2e+XiEeAXja3e3g6JSYklmJVbThIY8DtqBVZhy+BYsI+jGTWmDuKwWkyyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=V2s8xB+F; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854575;
	bh=xNICbiP93javbOYOEDOmSN3X3jhvGY5kWMSgKv9YUfA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=V2s8xB+FNxDwqpGroQh5CXq5a/LE0EM8WK8/o5R0buf0+Q01hioPuNBm1ymah5VFj
	 KvdPLIoT7L7ptQtQjv5ni+1HsMf+3hrCg7TA9FsPcg29TYUyAuvmZbVrVQ2X9cjNXp
	 bd4CTlwjQ8aj4PYZPKrccKTjI/kcwd8S14mOGgVI=
X-QQ-mid: zesmtpsz5t1767854570t791e66d6
X-QQ-Originating-IP: FL0t0Z4emkFy4QW8GHyjtFTOgPT7250QHxl78Qjcsmc=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7203640015464593998
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:39 +0800
Subject: [PATCH v2 2/3] pinctrl: spacemit: support I/O power domain
 configuration
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-2-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=8638;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=f3Vz/FjB4IU2wC5YjnE37vrmig4UUrSSKIfocxwuzRY=;
 b=d6NPg64FHGSq2o/rhbhpxLvagCFvRUxEu+py5KNltDFp6iskkEarTawgfma5Of07pwaFhs8DA
 e1WEOll82eBCy55JLbg46yJiit5ntQHX37r8kzkYg+mLuwFSPqhWl0M
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODcC84e+oTSh5uXCP5+KJ2K/HcAS8/qTnWGrwRsrL8kp1xyEevr3G2v3
	bpPNrGEBae73ofQsODajDzCZmmdLeMDBS7ZlEcppF9x5ConItaxpjaEqBpLqI0c2VgeOnKu
	lE5Edw+FCk2skuPKJr7zE/t4pxPlRqokRVXXsD5/xPGEim36zfiA7ICdKB5CZF2FzyZyS2+
	0tsD7hTmhtqh1YKJoyJqt1FuTD94vmuFB+WdPojW/gCd1e25gsz9Tvzk7h7SneiNaxTZBHl
	l7qfkAtSwYjYl+kSHZjBQzjMgX921NkCeiZTH9bGF38E0xyI8/PusdAB42qIGXEGL5DnmaH
	Bhqb+UAr1EKMCUesg80koOakWEGzNoqTTBsrFdbCKfz4Wpl6n8Dc5xkatJ0k0N0+wAKmPQl
	HbR00Q0Dc/IgejZeEnxPi8+euKN9ZweWoFo/mo4Csl6QWhyTG81azyGt5UKYRdoZjWPc4y6
	Qir1IzziMsZ1ejfOXZE+bK618GtTGx2esMEAA6caoBi+gjmsI6yBejqk4KgTuLwjaSmQFlr
	LWBx8tuT8/jglvTXYP8BSV8/pvTwwsngY+wfDlF0IPUU+FEX2nY8ObJV9h+ojGsRFZa+vmv
	ne0dHFWqBLFmssZZXHOjtq2nS3Tfq/wKTp/IEgn6nirkGThvtyEE2SdmnxXrzJddBW9a5jg
	EA4yjypu1y7O5aH9Qg5h99J/ayQiYMw1P/DIpGA/pq1udGNl/6M5aOU4DAhMAbF1W/TCtEB
	HgbxarEJ1KsKuD98i5OODaEErqoi0qlUCLy0yNdLSeW2lo2q9Hleodjme8LoSS0FkgzamO/
	wtWVSZzgBVLQOtehV7ifGl/91PUx4ApCKyrJnUtn2hqeuObOpDlXUblfFjoD/rUmNOsoIvA
	mU0OFyPIcnXVBNxF+1qZEMMcvGSD2ULbssxCO4GsZD2Enf0pdWHEQTCu6YdwMR3RQpmFKkp
	b+5prs3QH8H1su4WRKFiZmbipuJcC4li456YcGMU46IOwsFTLKwLkAAp3pK1WKhlAOm+rMc
	rujzcqOkwL8w44QPMm4xRRLlAURNt2K06TAoSgtFZcZ23GA4AUlto6WwHBvFMiUvQ2Zk7hl
	mTK0GjF7VbJS4B+zLRcFB5B9zdZL0JwqeO1R5H7GxhDagoT6yO+Vd3SSQzBXS/6TdXZr9Yu
	pL3l/flumEamhiGOG2iKccGarw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Dual-voltage GPIO banks default to 3.3V operation. Even when a bank is
externally supplied with 1.8V, the internal logic remains in the 3.3V
domain, leading to functional failures.

Add support for programming the IO domain power control registers to
allow explicit configuration for 1.8V operation.

These registers are secure due to hardware safety constraints.
Specifically, configuring the domain for 1.8V while externally supplying
3.3V causes back-powering and potential pin damage. Consequently, access
requires unlocking the AIB Secure Access Register (ASAR) in the APBC
block before any read or write operation.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- drop the offset argument from 'spacemit,apbc' property parsing
- make the syscon optional: disable voltage switching feature instead of failing probe if syscon is missing
- modify commit msg
- remove changes to dts
- remove io_pd_reg
- Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m256523b10c85dacd179b42ef42ae83c3b7b9699f
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 129 +++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 07267c5f0f4453bcdf5eb2d267eb3148a18bd038..71390402aaa63362706ace9e72c6d506c49e196d 100644
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
 
@@ -47,6 +49,27 @@
 #define PAD_PULLUP		BIT(14)
 #define PAD_PULL_EN		BIT(15)
 
+#define IO_PWR_DOMAIN_OFFSET	0x800
+
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
+#define APBC_ASFAR		0x50
+#define APBC_ASSAR		0x54
+
+#define APBC_ASFAR_AKEY		0xbaba
+#define APBC_ASSAR_AKEY		0xeb10
+
 struct spacemit_pin_drv_strength {
 	u8		val;
 	u32		mA;
@@ -78,6 +101,8 @@ struct spacemit_pinctrl {
 	raw_spinlock_t				lock;
 
 	void __iomem				*regs;
+
+	struct regmap				*regmap_apbc;
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
@@ -365,6 +441,42 @@ static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
+				      const struct spacemit_pin *spin,
+				      const enum spacemit_pin_io_type type)
+{
+	u32 offset, val = 0;
+
+	if (!pctrl->regmap_apbc)
+		return;
+
+	offset = pctrl->data->pin_to_io_pd_offset(spin->pin);
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
+	regmap_write(pctrl->regmap_apbc, APBC_ASFAR, APBC_ASFAR_AKEY);
+	regmap_write(pctrl->regmap_apbc, APBC_ASSAR, APBC_ASSAR_AKEY);
+
+	writel_relaxed(val, pctrl->regs + IO_PWR_DOMAIN_OFFSET + offset);
+}
+
 static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 struct device_node *np,
 					 struct pinctrl_map **maps,
@@ -572,7 +684,8 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 
 #define ENABLE_DRV_STRENGTH	BIT(1)
 #define ENABLE_SLEW_RATE	BIT(2)
-static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
+static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
+					    const struct spacemit_pin *spin,
 					    const struct spacemit_pinctrl_dconf *dconf,
 					    unsigned long *configs,
 					    unsigned int num_configs,
@@ -646,6 +759,7 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			default:
 				return -EINVAL;
 			}
+			spacemit_set_io_pwr_domain(pctrl, spin, type);
 		}
 
 		val = spacemit_get_driver_strength(type, dconf, drv_strength);
@@ -701,7 +815,7 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
 
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -724,7 +838,7 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -795,6 +909,7 @@ static const struct pinconf_ops spacemit_pinconf_ops = {
 
 static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
 	struct clk *func_clk, *bus_clk;
@@ -816,6 +931,12 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	pctrl->regmap_apbc = syscon_regmap_lookup_by_phandle(np, "spacemit,apbc");
+	if (IS_ERR(pctrl->regmap_apbc)) {
+		dev_warn(dev, "no syscon found, disable power voltage switch functionality\n");
+		pctrl->regmap_apbc = NULL;
+	}
+
 	func_clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(func_clk))
 		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
@@ -1118,6 +1239,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
 	.data = k1_pin_data,
 	.npins = ARRAY_SIZE(k1_pin_desc),
 	.pin_to_offset = spacemit_k1_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k1_pin_to_io_pd_offset,
 	.dconf = &k1_drive_conf,
 };
 
@@ -1455,6 +1577,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
 	.data = k3_pin_data,
 	.npins = ARRAY_SIZE(k3_pin_desc),
 	.pin_to_offset = spacemit_k3_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k3_pin_to_io_pd_offset,
 	.dconf = &k3_drive_conf,
 };
 

-- 
2.52.0


