Return-Path: <linux-gpio+bounces-32640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNYzMhiJqmmjTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:58:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E121CB7D
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 08:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA2E3022948
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 07:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD037B3F5;
	Fri,  6 Mar 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="eSTa0Wxx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B4372ED1;
	Fri,  6 Mar 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783732; cv=none; b=keq6fZhh+lUr9PdW4WfdHBlu6YTIYCR2kPeUUvUaMGOpCL3AHu+qzWODlOVf05xQjboj/7Ne58WhBB5uagjPFa6jdHtJsASAaiWkazATS1EnpPcv99vMJu0U5kV9dkOf/RcZr/0BpvHtQ8YfK1MW3rvWTujnCYx0jzU88XaIOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783732; c=relaxed/simple;
	bh=pCIc2Y3VcgeHgHk4E4OqIci4FaI25FGOJOjSs6WWWak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/YTQGK3usZHXLqMURT2nQqu3Gr8KLupHaNqtO8FOdKKQ79EimL+yFRqPxsuwlhilC+zAo9WlEmVrPUh9wyCsyhiQDlSHsXeSYqsOGGDkkVhOqc3pg5d8eKq1NExjVmPxE4tqLeQ5CaIqwmx3xTT04D3pxoFZVuT/apnt0HZ7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=eSTa0Wxx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkheF2977159, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=kvsbkapSH1ZeXX8TYyMwoJWoLzro86VTxqRZYx/ykEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=eSTa0Wxx/mLvAFgYErtdMBsdUcc4CixH3kzWu2jOr5TzVqF+1/hetmEECucLgQYnc
	 URjfc+/HOByyiqGJWlHQ9C+lgI4utnD4XSm5yfbJKJ6BbbAh1uAu1FfE7edSM+sH0a
	 DCPVQbpzyH1PvZj83rjjRgB+V4EYCyxUVasJCkwt81lqN6RJbjIZWqWpH0FZegGxCV
	 4G4Yr7pAxd28/LjFWCjm8k04vKl0VINFLBv/RKVSeWQdvFoyguwnolBKF6Odn/2nXD
	 fC/wFRTUEPuKoRZslEvv50M0l3YGlckmuMKHMbHJtmUtnm7/I7y5ee26y7GYf8FsIs
	 k3EmSyiR1OLeA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkheF2977159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 06/14] pinctrl: realtek: Support system suspend and resume
Date: Fri, 6 Mar 2026 15:52:36 +0800
Message-ID: <20260306075244.1170399-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 6D9E121CB7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32640-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Tzuyi Chang <tychang@realtek.com>

Add system suspend and resume capabilities to the common Realtek pinctrl
library. This enables saving and restoring pin configurations during the
noirq phase for SoCs that define register ranges.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Remove stray newlines.
- Simplify rtd_pinctrl_init_pm() error handling: return -ENOMEM directly instead
of using dev_err_probe().

 drivers/pinctrl/realtek/pinctrl-rtd.c | 98 +++++++++++++++++++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd.h | 13 ++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 5888a36babba..60dfb39bc986 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -30,6 +30,7 @@ struct rtd_pinctrl {
 	struct pinctrl_desc desc;
 	const struct rtd_pinctrl_desc *info;
 	struct regmap *regmap_pinctrl;
+	u32 **saved_regs;
 };
 
 /* custom pinconf parameters */
@@ -540,6 +541,30 @@ static const struct regmap_config rtd_pinctrl_regmap_config = {
 	.use_relaxed_mmio = true,
 };
 
+static int rtd_pinctrl_init_pm(struct rtd_pinctrl *data)
+{
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	struct device *dev = data->pcdev->dev;
+	const struct rtd_reg_range *range;
+	size_t num_entries;
+	int i;
+
+	data->saved_regs = devm_kcalloc(dev, pin_range->num_ranges, sizeof(u32 *), GFP_KERNEL);
+	if (!data->saved_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		num_entries = range->len / 4;
+
+		data->saved_regs[i] = devm_kzalloc(dev, num_entries * sizeof(u32), GFP_KERNEL);
+		if (!data->saved_regs[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc)
 {
 	struct rtd_pinctrl *data;
@@ -579,9 +604,82 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 
 	dev_dbg(&pdev->dev, "probed\n");
 
+	if (data->info->pin_range) {
+		if (rtd_pinctrl_init_pm(data))
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
+static int realtek_pinctrl_suspend(struct device *dev)
+{
+	struct rtd_pinctrl *data = dev_get_drvdata(dev);
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	const struct rtd_reg_range *range;
+	u32 *range_regs;
+	int count;
+	int i, j;
+	int ret;
+
+	if (!data->saved_regs)
+		return 0;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		range_regs = data->saved_regs[i];
+		count = range->len / 4;
+
+		for (j = 0; j < count; j++) {
+			ret = regmap_read(data->regmap_pinctrl, range->offset + (j * 4),
+					  &range_regs[j]);
+			if (ret) {
+				dev_err(dev, "failed to store register 0x%x: %d\n",
+					range->offset + (j * 4), ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int realtek_pinctrl_resume(struct device *dev)
+{
+	struct rtd_pinctrl *data = dev_get_drvdata(dev);
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	const struct rtd_reg_range *range;
+	u32 *range_regs;
+	int count;
+	int i, j;
+	int ret;
+
+	if (!data->saved_regs)
+		return 0;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		range_regs = data->saved_regs[i];
+		count = range->len / 4;
+
+		for (j = 0; j < count; j++) {
+			ret = regmap_write(data->regmap_pinctrl, range->offset + (j * 4),
+					   range_regs[j]);
+			if (ret) {
+				dev_err(dev, "failed to restore register 0x%x: %d\n",
+					range->offset + (j * 4), ret);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+const struct dev_pm_ops realtek_pinctrl_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(realtek_pinctrl_suspend, realtek_pinctrl_resume)
+};
+EXPORT_SYMBOL_GPL(realtek_pinctrl_pm_ops);
+
 MODULE_DESCRIPTION("Realtek DHC SoC pinctrl driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index e15130896abc..7fb0955ce749 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -47,6 +47,16 @@ struct rtd_pin_sconfig_desc {
 	unsigned int pdrive_maskbits;
 };
 
+struct rtd_reg_range {
+	unsigned int offset;
+	size_t len;
+};
+
+struct rtd_pin_range {
+	const struct rtd_reg_range *ranges;
+	const int num_ranges;
+};
+
 struct rtd_pin_desc {
 	const char *name;
 	unsigned int mux_offset;
@@ -119,6 +129,9 @@ struct rtd_pinctrl_desc {
 	unsigned int num_sconfigs;
 	struct rtd_pin_reg_list *lists;
 	unsigned int num_regs;
+	const struct rtd_pin_range *pin_range;
 };
 
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc);
+
+extern const struct dev_pm_ops realtek_pinctrl_pm_ops;
-- 
2.34.1


