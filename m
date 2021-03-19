Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158373420D3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhCSPWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:22:48 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:52964 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhCSPW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 11:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616167347; x=1647703347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bZYCEYFK2BrFVJH8IcIPGqu6SV4/lJaOJHYFc3NgpgA=;
  b=QsVGMc1tAsfcYXOczEiM8zbuCDquo2PwBWWxfZUU/Qvg7VRoqcAJELfO
   2lkNrqU4VM3ETegU1elvGxOKtAHYj7G6c4cJDNqjyv41mLwds9GO2Z33U
   aU+P8rUnsKddlZtUdCgrSaxUtuSfH1e1+Bw6/kY5c3w8hRF/XMZiOcJVq
   A=;
X-IronPort-AV: E=Sophos;i="5.81,262,1610409600"; 
   d="scan'208";a="98885188"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 19 Mar 2021 15:22:18 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS id BC556A2351;
        Fri, 19 Mar 2021 15:22:15 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.161.244) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Mar 2021 15:22:08 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <andy.shevchenko@gmail.com>, <tony@atomide.com>,
        <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH v4 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux is not zero
Date:   Fri, 19 Mar 2021 17:21:33 +0200
Message-ID: <20210319152133.28705-4-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319152133.28705-1-hhhawa@amazon.com>
References: <20210319152133.28705-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.244]
X-ClientProxiedBy: EX13D37UWA004.ant.amazon.com (10.43.160.23) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A System Error (SError, followed by kernel panic) was detected when
trying to print the supported pins in a pinctrl device which supports
multiple pins per register. This change fixes the pcs_pin_dbg_show() in
pinctrl-single driver when bits_per_mux is not zero. In addition move
offset calculation and pin offset in register to common function.

Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 55 ++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f3394517cb2e..39aac32ed09c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -270,20 +270,44 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
+					   unsigned int pin)
+{
+	unsigned int mux_bytes = pcs->width / BITS_PER_BYTE;
+
+	if (pcs->bits_per_mux) {
+		unsigned int pin_offset_bytes;
+
+		pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
+		return (pin_offset_bytes / mux_bytes) * mux_bytes;
+	}
+
+	return pin * mux_bytes;
+}
+
+static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
+					  unsigned int pin)
+{
+	return (pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin;
+}
+
 static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 					struct seq_file *s,
 					unsigned pin)
 {
 	struct pcs_device *pcs;
-	unsigned val, mux_bytes;
+	unsigned int val;
 	unsigned long offset;
 	size_t pa;
 
 	pcs = pinctrl_dev_get_drvdata(pctldev);
 
-	mux_bytes = pcs->width / BITS_PER_BYTE;
-	offset = pin * mux_bytes;
+	offset = pcs_pin_reg_offset_get(pcs, pin);
 	val = pcs->read(pcs->base + offset);
+
+	if (pcs->bits_per_mux)
+		val &= pcs->fmask << pcs_pin_shift_reg_get(pcs, pin);
+
 	pa = pcs->res->start + offset;
 
 	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
@@ -384,7 +408,6 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pcs_gpiofunc_range *frange = NULL;
 	struct list_head *pos, *tmp;
-	int mux_bytes = 0;
 	unsigned data;
 
 	/* If function mask is null, return directly. */
@@ -392,29 +415,27 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
 		return -ENOTSUPP;
 
 	list_for_each_safe(pos, tmp, &pcs->gpiofuncs) {
+		u32 offset;
+
 		frange = list_entry(pos, struct pcs_gpiofunc_range, node);
 		if (pin >= frange->offset + frange->npins
 			|| pin < frange->offset)
 			continue;
-		mux_bytes = pcs->width / BITS_PER_BYTE;
 
-		if (pcs->bits_per_mux) {
-			int byte_num, offset, pin_shift;
+		offset = pcs_pin_reg_offset_get(pcs, pin);
 
-			byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
-			offset = (byte_num / mux_bytes) * mux_bytes;
-			pin_shift = pin % (pcs->width / pcs->bits_per_pin) *
-				    pcs->bits_per_pin;
+		if (pcs->bits_per_mux) {
+			int pin_shift = pcs_pin_shift_reg_get(pcs, pin);
 
 			data = pcs->read(pcs->base + offset);
 			data &= ~(pcs->fmask << pin_shift);
 			data |= frange->gpiofunc << pin_shift;
 			pcs->write(data, pcs->base + offset);
 		} else {
-			data = pcs->read(pcs->base + pin * mux_bytes);
+			data = pcs->read(pcs->base + offset);
 			data &= ~pcs->fmask;
 			data |= frange->gpiofunc;
-			pcs->write(data, pcs->base + pin * mux_bytes);
+			pcs->write(data, pcs->base + offset);
 		}
 		break;
 	}
@@ -724,14 +745,8 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
 	for (i = 0; i < pcs->desc.npins; i++) {
 		unsigned offset;
 		int res;
-		int byte_num;
 
-		if (pcs->bits_per_mux) {
-			byte_num = (pcs->bits_per_pin * i) / BITS_PER_BYTE;
-			offset = (byte_num / mux_bytes) * mux_bytes;
-		} else {
-			offset = i * mux_bytes;
-		}
+		offset = pcs_pin_reg_offset_get(pcs, i);
 		res = pcs_add_pin(pcs, offset);
 		if (res < 0) {
 			dev_err(pcs->dev, "error adding pins: %i\n", res);
-- 
2.17.1

