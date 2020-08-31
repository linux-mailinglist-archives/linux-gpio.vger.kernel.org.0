Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01559257DD6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 17:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgHaPoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 11:44:25 -0400
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:33153 "EHLO
        out28-146.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgHaPoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 11:44:24 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09063155|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0312564-0.000548159-0.968195;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IQnAArN_1598888641;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IQnAArN_1598888641)
          by smtp.aliyun-inc.com(10.147.41.143);
          Mon, 31 Aug 2020 23:44:15 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        aric.pzqi@ingenic.com, dongsheng.qiu@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v2 2/3] pinctrl: Ingenic: Correct the pullup and pulldown parameters of JZ4780
Date:   Mon, 31 Aug 2020 23:43:23 +0800
Message-Id: <20200831154324.64951-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
References: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct the pullup and pulldown parameters of JZ4780 to make them
consistent with the parameters on the datasheet.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 00f29fd684fa..ae7b8876d3b4 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1035,6 +1035,14 @@ static const struct ingenic_chip_info jz4770_chip_info = {
 	.pull_downs = jz4770_pull_downs,
 };
 
+static const u32 jz4780_pull_ups[6] = {
+	0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xffff7b7c, 0x7fa7f00f,
+};
+
+static const u32 jz4780_pull_downs[6] = {
+	0x00000000, 0x000f0c03, 0x00000000, 0x0000b000, 0x00000483, 0x00580ff0,
+};
+
 static int jz4780_uart2_data_pins[] = { 0x66, 0x67, };
 static int jz4780_uart2_hwflow_pins[] = { 0x65, 0x64, };
 static int jz4780_uart4_data_pins[] = { 0x54, 0x4a, };
@@ -1301,8 +1309,8 @@ static const struct ingenic_chip_info jz4780_chip_info = {
 	.num_groups = ARRAY_SIZE(jz4780_groups),
 	.functions = jz4780_functions,
 	.num_functions = ARRAY_SIZE(jz4780_functions),
-	.pull_ups = jz4770_pull_ups,
-	.pull_downs = jz4770_pull_downs,
+	.pull_ups = jz4780_pull_ups,
+	.pull_downs = jz4780_pull_downs,
 };
 
 static const u32 x1000_pull_ups[4] = {
-- 
2.11.0

