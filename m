Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA36C64E337
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 22:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiLOVcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 16:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiLOVcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 16:32:45 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D2C7C5C0E9;
        Thu, 15 Dec 2022 13:32:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,248,1665414000"; 
   d="scan'208";a="143493797"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2022 06:32:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7F44440071FC;
        Fri, 16 Dec 2022 06:32:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [DO NOT APPLY PATCH v5 8/9] pinctrl: renesas: rzg2l-poeg: output-disable request from GPT on dead time error
Date:   Thu, 15 Dec 2022 21:32:05 +0000
Message-Id: <20221215213206.56666-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for output-disable requests from GPT,
when dead time error occurs.

Added sysfs to enable/disable for configuring GPT output disable request
for dead time error.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../ABI/testing/sysfs-platform-rzg2l-poeg     | 23 ++++++++++++
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 37 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-rzg2l-poeg b/Documentation/ABI/testing/sysfs-platform-rzg2l-poeg
index 45a7f44dccdd..4ad421fef3b9 100644
--- a/Documentation/ABI/testing/sysfs-platform-rzg2l-poeg
+++ b/Documentation/ABI/testing/sysfs-platform-rzg2l-poeg
@@ -62,3 +62,26 @@ Description:
 		        output level low is enabled.
 		- "0" - Output-disable request from gpt when same time
 		        output level low is disabled.
+
+What:		/sys/devices/platform/<rzg2l-poeg's name>/gpt_req_deadtime_err
+Date:		November 2022
+KernelVersion:	6.3
+Contact:	Biju Das <biju.das.jz@bp.renesas.com>
+Description:
+		This file can be read and write.
+		The file used to configure the output disable request from
+		gpt when dead time error occurred.
+
+		Write the following string to control the output disable:
+
+		- "1" - Enables output-disable request from gpt when dead time
+		        error occurs.
+		- "0" - Disables output-disable request from gpt when dead time
+		        error occurs.
+
+		Read the file, then it shows the following strings:
+
+		- "1" - Output-disable request from gpt when dead time
+		        error occurs is enabled.
+		- "0" - Output-disable request from gpt when dead time
+		        error occurs is disabled.
diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
index 58a2cc9519e5..c712d26c4282 100644
--- a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
@@ -155,14 +155,51 @@ static ssize_t gpt_req_both_low_show(struct device *dev,
 	return sysfs_emit(buf, "%u\n", test_bit(RZG2L_GPT_OABLF, chip->gpt_irq));
 }
 
+static ssize_t gpt_req_deadtime_err_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct rzg2l_poeg_chip *chip;
+	unsigned int val;
+	int ret;
+
+	chip = dev_get_drvdata(dev);
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val)
+		set_bit(RZG2L_GPT_DTEF, chip->gpt_irq);
+	else
+		clear_bit(RZG2L_GPT_DTEF, chip->gpt_irq);
+
+	rzg2l_gpt_poeg_disable_req_deadtime_error(chip->gpt_dev, chip->index,
+						  test_bit(RZG2L_GPT_DTEF, chip->gpt_irq));
+
+	return count;
+}
+
+static ssize_t gpt_req_deadtime_err_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct rzg2l_poeg_chip *chip;
+
+	chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", test_bit(RZG2L_GPT_DTEF, chip->gpt_irq));
+}
+
 static DEVICE_ATTR_RW(output_disable);
 static DEVICE_ATTR_RW(gpt_req_both_high);
 static DEVICE_ATTR_RW(gpt_req_both_low);
+static DEVICE_ATTR_RW(gpt_req_deadtime_err);
 
 static struct attribute *poeg_attrs[] = {
 	&dev_attr_output_disable.attr,
 	&dev_attr_gpt_req_both_high.attr,
 	&dev_attr_gpt_req_both_low.attr,
+	&dev_attr_gpt_req_deadtime_err.attr,
 	NULL,
 };
 
-- 
2.25.1

