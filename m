Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EE5615967
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 04:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiKBDKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Nov 2022 23:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiKBDKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2022 23:10:21 -0400
X-Greylist: delayed 900 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Nov 2022 20:10:20 PDT
Received: from mxus.zte.com.cn (mxus.zte.com.cn [20.69.78.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350DB2317C
        for <linux-gpio@vger.kernel.org>; Tue,  1 Nov 2022 20:10:20 -0700 (PDT)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxus.zte.com.cn (FangMail) with ESMTPS id 4N2B9L3dS3zdmJQy;
        Wed,  2 Nov 2022 10:46:30 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N2B9G5KSCz4xVnK;
        Wed,  2 Nov 2022 10:46:26 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2A22kJMg065436;
        Wed, 2 Nov 2022 10:46:19 +0800 (+08)
        (envelope-from zhang.songyi@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Wed, 2 Nov 2022 10:46:20 +0800 (CST)
Date:   Wed, 2 Nov 2022 10:46:20 +0800 (CST)
X-Zmail-TransId: 2af96361d9fcffffffffc2aa439d
X-Mailer: Zmail v1.0
Message-ID: <202211021046202606659@zte.com.cn>
Mime-Version: 1.0
From:   <zhang.songyi@zte.com.cn>
To:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@somainline.org>
Cc:     <linus.walleij@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <xue.zhihong@zte.com.cn>,
        <jiang.xuexin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIHBpbmN0cmw6IHFjb206IHJlbW92ZSBkdXBsaWNhdGUgaW5jbHVkZQ==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2A22kJMg065436
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at 10-207-168-8 with ID 6361DA05.000 by FangMail milter!
X-FangMail-Envelope: 1667357190/4N2B9L3dS3zdmJQy/6361DA05.000/192.168.250.138/[192.168.250.138]/mxhk.zte.com.cn/<zhang.songyi@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6361DA05.000/4N2B9L3dS3zdmJQy
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From 6b941a80348b4d8b862072ecec4df41a43368c60 Mon Sep 17 00:00:00 2001
From: zhang songyi <zhang.songyi@zte.com.cn>
Date: Wed, 2 Nov 2022 10:21:53 +0800
Subject: [PATCH linux-next] pinctrl: qcom: remove duplicate include

'linux/seq_file.h' included in
'drivers/pinctrl/qcom/pinctrl-lpass-lpi.c,
drivers/pinctrl/qcom/pinctrl-msm.c,
drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c,
drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c' is duplicated.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 --
 drivers/pinctrl/qcom/pinctrl-msm.c       | 2 --
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 --
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index d5cfa91e2eff..90648fc11647 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -283,8 +283,6 @@ static void lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 }

 #ifdef CONFIG_DEBUG_FS
-#include <linux/seq_file.h>
-
 static unsigned int lpi_regval_to_drive(u32 val)
 {
    return (val + 1) * 2;
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8fbb953c4bbe..0d2d3e83e929 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -622,8 +622,6 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 }

 #ifdef CONFIG_DEBUG_FS
-#include <linux/seq_file.h>
-
 static void msm_gpio_dbg_show_one(struct seq_file *s,
                  struct pinctrl_dev *pctldev,
                  struct gpio_chip *chip,
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index b1748791a01e..cf69f208dfb8 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -536,8 +536,6 @@ static int pm8xxx_gpio_of_xlate(struct gpio_chip *chip,


 #ifdef CONFIG_DEBUG_FS
-#include <linux/seq_file.h>
-
 static void pm8xxx_gpio_dbg_show_one(struct seq_file *s,
                  struct pinctrl_dev *pctldev,
                  struct gpio_chip *chip,
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 30a934245c1b..71bbf1f1599a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -536,8 +536,6 @@ static int pm8xxx_mpp_of_xlate(struct gpio_chip *chip,


 #ifdef CONFIG_DEBUG_FS
-#include <linux/seq_file.h>
-
 static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
                  struct pinctrl_dev *pctldev,
                  struct gpio_chip *chip,
--
2.15.2
