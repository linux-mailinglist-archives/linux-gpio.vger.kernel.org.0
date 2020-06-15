Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEBC1F973B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgFOMy2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:54:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35382 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730219AbgFOMy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:54:26 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FCpwXj001459;
        Mon, 15 Jun 2020 14:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9nx0276RoWcw268oLnuqmY9yxeCQ4dI487TvwB0ac0s=;
 b=vedaUIffwULZMcZnGijPCCsdy9mrnEpkQAGVxilplUORvB570aTlNHZqYkCH9FcmjmxU
 mhY7dBtvxXlvgz4/05dKBMT8BtwpRbJdY3t2FPgpwslRdOj1rLd1JMHjzB/Zq6ZQ/dbj
 4MBz6FPleiPgjUVJuQMVGm7jnX04VkUvdm1sWfO2QVNCSqWdPIKT3FAhFsSW8F5hwZYh
 1SHjvgK3Es2bUdtDxWXgQ2JS6MvXJK6dk1QCV21QVQhyInvNcDHWmPVTe0LgBHGC+fY+
 2IyHNp2t3WqwJ881Pvfdf5qoQ4dQJ+JwbCBKpW2MpzwMGh0I4BMP/SiSNmBG/TOEQI7l 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mnph1g9c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 14:54:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F8AE10002A;
        Mon, 15 Jun 2020 14:54:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44CD22B35E0;
        Mon, 15 Jun 2020 14:54:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:54:21
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 1/2] pinctrl: stm32: don't print an error on probe deferral during clock get
Date:   Mon, 15 Jun 2020 14:54:06 +0200
Message-ID: <20200615125407.27632-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615125407.27632-1-alexandre.torgue@st.com>
References: <20200615125407.27632-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Change STM32 pinctrl driver to not print an error trace when probe is
deferred due to clock resource. Probe defer issue (for clocks) could
occur during bank registering when some banks have already been registered.
In this case banks already registered should be released. To not waste time
in this case, it is better to check first if all clocks are available
before registering banks.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a657cd829ce6..c15460ef2307 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1217,12 +1217,6 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	bank->clk = of_clk_get_by_name(np, NULL);
-	if (IS_ERR(bank->clk)) {
-		dev_err(dev, "failed to get clk (%ld)\n", PTR_ERR(bank->clk));
-		return PTR_ERR(bank->clk);
-	}
-
 	err = clk_prepare(bank->clk);
 	if (err) {
 		dev_err(dev, "failed to prepare clk (%d)\n", err);
@@ -1517,6 +1511,23 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	i = 0;
+	for_each_available_child_of_node(np, child) {
+		struct stm32_gpio_bank *bank = &pctl->banks[i];
+
+		if (of_property_read_bool(child, "gpio-controller")) {
+			bank->clk = of_clk_get_by_name(child, NULL);
+			if (IS_ERR(bank->clk)) {
+				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
+					dev_err(dev,
+						"failed to get clk (%ld)\n",
+						PTR_ERR(bank->clk));
+				return PTR_ERR(bank->clk);
+			}
+			i++;
+		}
+	}
+
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			ret = stm32_gpiolib_register_bank(pctl, child);
-- 
2.17.1

