Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D951F973F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbgFOMyf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:54:35 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:39371 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730221AbgFOMy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:54:26 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05FCqnb8011050;
        Mon, 15 Jun 2020 14:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bXos72rf0lg0iLm1zdmI8TWdbgoRub9K+Cl/CRJ6gjQ=;
 b=JmVIt0c2JGG9uc+PwWibzxVu6zQt6ygLyh7T4qihAFz+Rv3fOo1p/B4DHmvF/tozifkT
 7hmV5v9/hgm5c38E7qzIKMOcLmaTMrrOFsVLI9jCAZNrOzjD2ixwfppqUqF1ySK8xPY/
 o93ArBWaUymS/BP8LsiAIYzbrLjG9ouuxKM1eHqzc1l2Z84qcb8ptZaHF8PRe1eqjEe4
 20wRmOfY/erASbEVRlzZNfXjlhRTZl+AcNLeTF9kbvVv8sMH/OgKvBkXiEuNfyoNzb6J
 tNoJF/z+6qSb3uEDDHirsV1jYfb5H4cABCSdvHIj0Tjp6zXG61JkyJdut8a1wU9OIiCq QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvspcu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 14:54:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01069100034;
        Mon, 15 Jun 2020 14:54:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA9812B35E0;
        Mon, 15 Jun 2020 14:54:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:54:22
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH 2/2] pinctrl: stm32: defer probe if reset resource is not yet ready
Date:   Mon, 15 Jun 2020 14:54:07 +0200
Message-ID: <20200615125407.27632-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615125407.27632-1-alexandre.torgue@st.com>
References: <20200615125407.27632-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_02:2020-06-15,2020-06-15 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Defer probe when pin controller reset is defined in the system resources
but not yet probed.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index c15460ef2307..162535e7c94d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -84,6 +84,7 @@ struct stm32_pinctrl_group {
 struct stm32_gpio_bank {
 	void __iomem *base;
 	struct clk *clk;
+	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range range;
@@ -1202,13 +1203,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	struct of_phandle_args args;
 	struct device *dev = pctl->dev;
 	struct resource res;
-	struct reset_control *rstc;
 	int npins = STM32_GPIO_PINS_PER_BANK;
 	int bank_nr, err;
 
-	rstc = of_reset_control_get_exclusive(np, NULL);
-	if (!IS_ERR(rstc))
-		reset_control_deassert(rstc);
+	if (!IS_ERR(bank->rstc))
+		reset_control_deassert(bank->rstc);
 
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
@@ -1516,6 +1515,11 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
 
 		if (of_property_read_bool(child, "gpio-controller")) {
+			bank->rstc = of_reset_control_get_exclusive(child,
+								    NULL);
+			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+
 			bank->clk = of_clk_get_by_name(child, NULL);
 			if (IS_ERR(bank->clk)) {
 				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
-- 
2.17.1

