Return-Path: <linux-gpio+bounces-36341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPhqDDRM/GmZNwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E44E4B91
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB6F304D5CF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AA337106A;
	Thu,  7 May 2026 08:18:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47A34B669;
	Thu,  7 May 2026 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141894; cv=none; b=qtffwow4V/b57JAv6X4zlx5hy9MUgUWeLcE7KA4NOi5z2fKcKkaGoaSaj1ZGExRXdrlECTd4nbvS/tsnYnl/lUnWM5EQDTXso82KKaMaCks2RGmTMLPHAWSzxFZvx2crfdspf/HA/mgzDnERlTByfT7hv24odw4fxwy4SpwI5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141894; c=relaxed/simple;
	bh=XYEg952b0hjEyzJ0OgEKo56+HxGgDbQSdgBO/pbUnIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n64Bz0jlv0BkNjLR9yy5oJczHYaIjHm7oz0zNtlF/UB6AIzrqsQ5m5QM2PgqKnl/ocJXcnyGwuukwFgCKitM+qxr9CNDCLUOqgmPlfwPqa+YQ3MHxpOpaHZIp5ruDGjm3kJp/+SXT1A9QUmgKW+kUJL9x0AQfstmRh9Q9IZYigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S4;
	Thu, 07 May 2026 16:17:21 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys clocks
Date: Thu,  7 May 2026 16:17:00 +0800
Message-ID: <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWftrW7XFW8GFWxtrWrZrb_yoWrJFyUpa
	yrGrWftF4kXF4rWay3Jr1IyFsxuF4SqFyqqa9rG34xKw4fWry5JFy0kayFyF4Fg34fCay7
	Jrs8KrW5CFs8GFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRipB-tUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: 907E44E4B91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36341-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The TH1520 SoC contains a MISC_SUBSYS clock controller, which allows
controlling of USB related clocks and MMC/SD controller AHB bus clocks.

Add support for this clock controller, in order to enable USB support.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/clk/thead/clk-th1520-ap.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 3a6847f1c950f..24f785f0b329a 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1266,6 +1266,41 @@ static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
 static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
 		0x4, 0, 0);
 
+static struct clk_fixed_factor usb_suspend_div_clk = {
+	.div		= 24,
+	.mult		= 1,
+	.hw.init	= CLK_HW_INIT_PARENTS_DATA("usb-suspend-div",
+						   osc_24m_clk,
+						   &clk_fixed_factor_ops,
+						   0),
+};
+
+static const struct clk_parent_data usb_suspend_parents[] = {
+	{ .hw = &usb_suspend_div_clk.hw },
+};
+
+static CCU_GATE(CLK_MISCSYS_ACLK, miscsys_aclk, "miscsys-aclk", axi_aclk_pd,
+		0x0, 0, CLK_IS_CRITICAL);
+
+static const struct clk_parent_data miscsys_aclk_pd[] = {
+	{ .hw = &miscsys_aclk.gate.hw },
+};
+
+static CCU_GATE(CLK_USB, usb_clk, "usb", miscsys_aclk_pd, 0x4, 0,
+		CLK_IS_CRITICAL);
+static CCU_GATE(CLK_USB_CTL_REF, usb_ctl_ref_clk, "usb-ctl-ref", osc_24m_clk,
+		0x4, 1, 0);
+static CCU_GATE(CLK_USB_PHY_REF, usb_phy_ref_clk, "usb-phy-ref", osc_24m_clk,
+		0x4, 2, 0);
+static CCU_GATE(CLK_USB_SUSPEND, usb_suspend_clk, "usb-suspend",
+		usb_suspend_parents, 0x4, 3, 0);
+static CCU_GATE(CLK_EMMC, emmc_clk, "emmc", perisys_ahb_hclk_pd, 0x8, 0,
+		0);
+static CCU_GATE(CLK_SDIO0, sdio0_clk, "sdio0", perisys_ahb_hclk_pd, 0xc, 0,
+		0);
+static CCU_GATE(CLK_SDIO1, sdio1_clk, "sdio1", perisys_ahb_hclk_pd, 0x10, 0,
+		0);
+
 static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
 			   &gmac_pll_clk.common.hw, 10, 1, 0);
 
@@ -1410,6 +1445,17 @@ static struct ccu_gate *th1520_vo_gate_clks[] = {
 	&hdmi_pixclk
 };
 
+static struct ccu_gate *th1520_misc_gate_clks[] = {
+	&miscsys_aclk,
+	&usb_clk,
+	&usb_ctl_ref_clk,
+	&usb_phy_ref_clk,
+	&usb_suspend_clk,
+	&emmc_clk,
+	&sdio0_clk,
+	&sdio1_clk
+};
+
 static const struct regmap_config th1520_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -1451,6 +1497,14 @@ static const struct th1520_plat_data th1520_vo_platdata = {
 	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
 };
 
+static const struct th1520_plat_data th1520_misc_platdata = {
+	.th1520_gate_clks = th1520_misc_gate_clks,
+
+	.nr_clks = CLK_SDIO1 + 1,
+
+	.nr_gate_clks = ARRAY_SIZE(th1520_misc_gate_clks),
+};
+
 /*
  * Maintain clock rate of c910_bus_clk below TH1520_C910_BUS_MAX_RATE (750MHz)
  * when its parent, c910_clk, changes the rate.
@@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (plat_data == &th1520_ap_platdata) {
+		ret = devm_clk_hw_register(dev, &usb_suspend_div_clk.hw);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
 	if (ret)
 		return ret;
@@ -1625,6 +1685,10 @@ static const struct of_device_id th1520_clk_match[] = {
 		.compatible = "thead,th1520-clk-vo",
 		.data = &th1520_vo_platdata,
 	},
+	{
+		.compatible = "thead,th1520-clk-misc",
+		.data = &th1520_misc_platdata,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, th1520_clk_match);
-- 
2.52.0


