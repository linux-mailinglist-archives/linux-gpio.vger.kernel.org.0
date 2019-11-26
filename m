Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC761098BF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2019 06:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfKZFe4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Nov 2019 00:34:56 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25771 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfKZFe4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2019 00:34:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574746471; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=bDJ7rhqqo+q7y4wjoPpUgl6sVgbb7s275L7kJJ8/AiNAG3FCYskhoitHCN0gxoKpRm3LDDs26GtW9/yN7okOEmgzTW0I7Xkz95ERGwsiKhaIC8aOoNZVcgE8TW2PqE9IFn5e1ADYO3tzC2Ak89V4tcT5Pq89ftba5uZZ/ZtF5Ic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574746471; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=/QMD88qQEcXxUJzl41OPm1vzqf0cyV83PN/jmSOWwtY=; 
        b=IbL3CVKycXjytvGIWb1N6689AvRc+hUcAFEque6bDD+nBqaOd/uMp6LZfCom7WKKhszpB/A59wwA5opVnCYRRvIIaj+wIh9MlhkGQSkIDE86Yz6+y2Vf+VH6CcAreAKVeZVHstUGNf4/1pG7ncxC/BxJy+19Abc2d8vzmSMl/Ew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=qxcU46WJC9V++7RC0Zb+XwEtUIEPl1aiAMK7sV6MwwedE0jo+Kns7U7krCX0BGpuJkSoHGAHIybX
    vImJjECym4SsRMZevD/XidVbLUPJpH6CY4XBVQX7v+7vMa6kKF2z  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574746471;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=/QMD88qQEcXxUJzl41OPm1vzqf0cyV83PN/jmSOWwtY=;
        b=I9m2zahMOU+VsyhIcoQfb7V/8FahJcGt/UbFum/N0OOkuku6DlxNQdDRyMtzEI1d
        3EeGUBdDW+HyDDB8XGaHHVl4LZ1rUBvh+IJmY9eLHcS9JPkacnJz06JWHkM5SHmisKC
        /39vdzboTOXaqK3QAxsFXApBQACVi9YSYcYw67JU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574746470595984.5123765428431; Mon, 25 Nov 2019 21:34:30 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: [PATCH v6 2/4] pinctrl: Ingenic: Add missing parts for X1000 and X1500.
Date:   Tue, 26 Nov 2019 13:33:54 +0800
Message-Id: <1574746436-80066-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
References: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

1.Add pinctrl drivers for the SPI flash controller (SFC) of
  X1000 and X1500.
2.Add pinctrl driver for the synchronous serial interface (SSI)
  of X1000.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Fix typo.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    Remove duplicates "ssi-ce0-d".

 drivers/pinctrl/pinctrl-ingenic.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 059e39a..38f7f147 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1031,6 +1031,23 @@ static int x1000_uart1_data_d_pins[] = { 0x62, 0x63, };
 static int x1000_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1000_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1000_uart2_data_d_pins[] = { 0x65, 0x64, };
+static int x1000_sfc_pins[] = { 0x1d, 0x1c, 0x1e, 0x1f, 0x1a, 0x1b, };
+static int x1000_ssi_dt_a_22_pins[] = { 0x16, };
+static int x1000_ssi_dt_a_29_pins[] = { 0x1d, };
+static int x1000_ssi_dt_d_pins[] = { 0x62, };
+static int x1000_ssi_dr_a_23_pins[] = { 0x17, };
+static int x1000_ssi_dr_a_28_pins[] = { 0x1c, };
+static int x1000_ssi_dr_d_pins[] = { 0x63, };
+static int x1000_ssi_clk_a_24_pins[] = { 0x18, };
+static int x1000_ssi_clk_a_26_pins[] = { 0x1a, };
+static int x1000_ssi_clk_d_pins[] = { 0x60, };
+static int x1000_ssi_gpc_a_20_pins[] = { 0x14, };
+static int x1000_ssi_gpc_a_31_pins[] = { 0x1f, };
+static int x1000_ssi_ce0_a_25_pins[] = { 0x19, };
+static int x1000_ssi_ce0_a_27_pins[] = { 0x1b, };
+static int x1000_ssi_ce0_d_pins[] = { 0x61, };
+static int x1000_ssi_ce1_a_21_pins[] = { 0x15, };
+static int x1000_ssi_ce1_a_30_pins[] = { 0x1e, };
 static int x1000_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
 static int x1000_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
 static int x1000_mmc0_8bit_pins[] = { 0x13, 0x12, 0x11, 0x10, };
@@ -1081,6 +1098,23 @@ static int x1000_uart1_data_d_funcs[] = { 1, 1, };
 static int x1000_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1000_uart2_data_a_funcs[] = { 2, 2, };
 static int x1000_uart2_data_d_funcs[] = { 0, 0, };
+static int x1000_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
+static int x1000_ssi_dt_a_22_funcs[] = { 2, };
+static int x1000_ssi_dt_a_29_funcs[] = { 2, };
+static int x1000_ssi_dt_d_funcs[] = { 0, };
+static int x1000_ssi_dr_a_23_funcs[] = { 2, };
+static int x1000_ssi_dr_a_28_funcs[] = { 2, };
+static int x1000_ssi_dr_d_funcs[] = { 0, };
+static int x1000_ssi_clk_a_24_funcs[] = { 2, };
+static int x1000_ssi_clk_a_26_funcs[] = { 2, };
+static int x1000_ssi_clk_d_funcs[] = { 0, };
+static int x1000_ssi_gpc_a_20_funcs[] = { 2, };
+static int x1000_ssi_gpc_a_31_funcs[] = { 2, };
+static int x1000_ssi_ce0_a_25_funcs[] = { 2, };
+static int x1000_ssi_ce0_a_27_funcs[] = { 2, };
+static int x1000_ssi_ce0_d_funcs[] = { 0, };
+static int x1000_ssi_ce1_a_21_funcs[] = { 2, };
+static int x1000_ssi_ce1_a_30_funcs[] = { 2, };
 static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
 static int x1000_mmc0_4bit_funcs[] = { 1, 1, 1, };
 static int x1000_mmc0_8bit_funcs[] = { 1, 1, 1, 1, 1, };
@@ -1119,6 +1153,23 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
+	INGENIC_PIN_GROUP("sfc", x1000_sfc),
+	INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22),
+	INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29),
+	INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d),
+	INGENIC_PIN_GROUP("ssi-dr-a-23", x1000_ssi_dr_a_23),
+	INGENIC_PIN_GROUP("ssi-dr-a-28", x1000_ssi_dr_a_28),
+	INGENIC_PIN_GROUP("ssi-dr-d", x1000_ssi_dr_d),
+	INGENIC_PIN_GROUP("ssi-clk-a-24", x1000_ssi_clk_a_24),
+	INGENIC_PIN_GROUP("ssi-clk-a-26", x1000_ssi_clk_a_26),
+	INGENIC_PIN_GROUP("ssi-clk-d", x1000_ssi_clk_d),
+	INGENIC_PIN_GROUP("ssi-gpc-a-20", x1000_ssi_gpc_a_20),
+	INGENIC_PIN_GROUP("ssi-gpc-a-31", x1000_ssi_gpc_a_31),
+	INGENIC_PIN_GROUP("ssi-ce0-a-25", x1000_ssi_ce0_a_25),
+	INGENIC_PIN_GROUP("ssi-ce0-a-27", x1000_ssi_ce0_a_27),
+	INGENIC_PIN_GROUP("ssi-ce0-d", x1000_ssi_ce0_d),
+	INGENIC_PIN_GROUP("ssi-ce1-a-21", x1000_ssi_ce1_a_21),
+	INGENIC_PIN_GROUP("ssi-ce1-a-30", x1000_ssi_ce1_a_30),
 	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
 	INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit),
 	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
@@ -1152,6 +1203,15 @@ static const char *x1000_uart1_groups[] = {
 	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
 };
 static const char *x1000_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
+static const char *x1000_sfc_groups[] = { "sfc", };
+static const char *x1000_ssi_groups[] = {
+	"ssi-dt-a-22", "ssi-dt-a-29", "ssi-dt-d",
+	"ssi-dr-a-23", "ssi-dr-a-28", "ssi-dr-d",
+	"ssi-clk-a-24", "ssi-clk-a-26", "ssi-clk-d",
+	"ssi-gpc-a-20", "ssi-gpc-a-31",
+	"ssi-ce0-a-25", "ssi-ce0-a-27", "ssi-ce0-d",
+	"ssi-ce1-a-21", "ssi-ce1-a-30",
+};
 static const char *x1000_mmc0_groups[] = {
 	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
 };
@@ -1182,6 +1242,8 @@ static const struct function_desc x1000_functions[] = {
 	{ "uart0", x1000_uart0_groups, ARRAY_SIZE(x1000_uart0_groups), },
 	{ "uart1", x1000_uart1_groups, ARRAY_SIZE(x1000_uart1_groups), },
 	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
+	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
+	{ "ssi", x1000_ssi_groups, ARRAY_SIZE(x1000_ssi_groups), },
 	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
 	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
 	{ "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
@@ -1271,6 +1333,7 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
+	INGENIC_PIN_GROUP("sfc", x1000_sfc),
 	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
 	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
 	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
@@ -1307,6 +1370,7 @@ static const struct function_desc x1500_functions[] = {
 	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
 	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
 	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
+	{ "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
 	{ "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
 	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
 	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
-- 
2.7.4


