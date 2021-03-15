Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F063033BF4B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbhCOPAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:00:31 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:43129 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbhCOPAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615820423; x=1647356423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vz8bh1TIcb8YUPIQ707G/A5kNUPOqo9Buwx7hhjsjfk=;
  b=qFQThFgX71IhWzkTAGBSKlDbs3843PGPTf4raUk+rR70gT/QSTwvYs4V
   hgprsu09gzC8HHiCgUgM9xZm1mZilAGCxweihQnPS914FzilPIqz41Bd/
   XpZlK6C8ZnxN/jylx84eXlGz9REFfLcjDoTON2Zr2w8ugDiD0/CeHvGnx
   A=;
IronPort-HdrOrdr: A9a23:WObm/qwYfTeu5U7EMhOkKrPw1r1zdoIgy1knxilNYDZSddGVkN
 3roeQD2XbP+VUscVwphNzoAsO9aFzG85od2+QsFJODeCWjh2eyNoFl6uLZowHIPyHl7OZS2e
 NBXsFFZuHYK0N1hcH78wGkE9AmqeP3lZyAvuvVw3dzQQwCUcgJhDtRMQqDF10zeQ8uP/YEPa
 CB7clKrSfIQxUqR/m8b0NrY8Hz4+TRlJT8YQMXbiRXijWzsQ==
X-IronPort-AV: E=Sophos;i="5.81,249,1610409600"; 
   d="scan'208";a="97431294"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 15 Mar 2021 15:00:22 +0000
Received: from EX13D19EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS id 87D9DA069E;
        Mon, 15 Mar 2021 15:00:19 +0000 (UTC)
Received: from u8a88181e7b2355.ant.amazon.com (10.43.160.180) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Mar 2021 15:00:12 +0000
From:   Hanna Hawa <hhhawa@amazon.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <tgershi@amazon.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hhhawa@amazon.com>
Subject: [PATCH 2/2] pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux != 0
Date:   Mon, 15 Mar 2021 16:59:44 +0200
Message-ID: <20210315145944.20412-3-hhhawa@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315145944.20412-1-hhhawa@amazon.com>
References: <20210315145944.20412-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.180]
X-ClientProxiedBy: EX13D32UWB002.ant.amazon.com (10.43.161.139) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

An SError was detected when trying to print the supported pins in a
pinctrl device which supports multiple pins per register. This change
fixes the pcs_pin_dbg_show() in pinctrl-single driver when
bits_per_mux != 0. In addition move offset calculation and pin offset in
register to common function.

Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
---
 drivers/pinctrl/pinctrl-single.c | 66 ++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 8a7922459896..0288bf430916 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -270,20 +270,53 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
+					   unsigned int pin)
+{
+	unsigned int offset, mux_bytes;
+
+	mux_bytes = pcs->width / BITS_PER_BYTE;
+
+	if (pcs->bits_per_mux) {
+		unsigned int pin_offset_bytes;
+
+		pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
+		offset = (pin_offset_bytes / mux_bytes) * mux_bytes;
+	} else {
+		offset = pin * mux_bytes;
+	}
+
+	return offset;
+}
+
+static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
+					  unsigned int pin)
+{
+	return ((pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin);
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
-	val = pcs->read(pcs->base + offset);
+	offset = pcs_pin_reg_offset_get(pcs, pin);
+
+	if (pcs->bits_per_mux) {
+		unsigned int pin_shift_in_reg = pcs_pin_shift_reg_get(pcs, pin);
+
+		val = pcs->read(pcs->base + offset)
+			& (pcs->fmask << pin_shift_in_reg);
+	} else {
+		val = pcs->read(pcs->base + offset);
+	}
+
 	pa = pcs->res->start + offset;
 
 	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
@@ -384,7 +417,6 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pcs_gpiofunc_range *frange = NULL;
 	struct list_head *pos, *tmp;
-	int mux_bytes = 0;
 	unsigned data;
 
 	/* If function mask is null, return directly. */
@@ -392,29 +424,27 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
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
@@ -726,14 +756,8 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
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

