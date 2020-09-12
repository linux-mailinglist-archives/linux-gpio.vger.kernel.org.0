Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2536E26781A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 08:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgILGFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 02:05:30 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:54901 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgILGFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 02:05:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08609997|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0356243-0.00072368-0.963652;FP=0|0|0|0|0|-1|-1|-1;HT=e01l04362;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IW5skju_1599890708;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IW5skju_1599890708)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 12 Sep 2020 14:05:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 2/3] pinctrl: Ingenic: Correct the pullup and pulldown parameters of JZ4780
Date:   Sat, 12 Sep 2020 14:04:24 +0800
Message-Id: <20200912060425.30423-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200912060425.30423-1-zhouyanjie@wanyeetech.com>
References: <20200912060425.30423-1-zhouyanjie@wanyeetech.com>
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
    
    v2->v3:
    Fix bug about PE15's pull-up parameter.

 drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 00f29fd684fa..d5ac8489ba3d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1035,6 +1035,14 @@ static const struct ingenic_chip_info jz4770_chip_info = {
 	.pull_downs = jz4770_pull_downs,
 };
 
+static const u32 jz4780_pull_ups[6] = {
+	0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xfffffb7c, 0x7fa7f00f,
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

