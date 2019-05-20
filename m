Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7710222D6A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 09:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfETHwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 03:52:32 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:54799 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727319AbfETHwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 May 2019 03:52:32 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4K7owVV024214;
        Mon, 20 May 2019 09:52:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AmLaTPn+4Y+PnO2cSAi1LC9tZLLiMimnsWha5pKlny8=;
 b=zyzJqh5vP+aveI2mQhAv7Ag2QoFpavLrSaMApQZSN9cAxXZdhg6aeig49lB0g5BR8zOn
 Rm6/+8XRMIhwB7oiEOgQeEqoW6mqADkW3HlYZVqyfaeMt4tnfH4p3FkTJhGJzGgKXRGQ
 BXsjLEUtYHWxWiqnbrTNwB401MyI2ttSeqy+tXXbOyuHKagD6qf2gjEZIb8Dz64jpY43
 01QEPQ5yVxVANbsIOqBHkCUmTn9T4DUL7XvCBXwZufXbSG2sbnMOBw/CbSpXWvgWwrsb
 I5MKAZ/vEsav5KYikZQlq1IAJvfDbvkw3j5wahF59uPByqIkQiGKTJ3/T8r2SFB52+TQ Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7ttt4nb-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 20 May 2019 09:52:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A11E3A;
        Mon, 20 May 2019 07:52:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40E3C1557;
        Mon, 20 May 2019 07:52:16 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 09:52:16 +0200
Received: from localhost (10.201.20.5) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 09:52:15 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <kbuild-all@01.org>,
        "Amelie Delaunay" <amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined
Date:   Mon, 20 May 2019 09:52:15 +0200
Message-ID: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-20_04:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
not exist:
drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
     pctl->gpio_chip.of_node = np;

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index eba872c..bb64aa0 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
 	pctl->gpio_chip.can_sleep = true;
+#ifdef CONFIG_OF_GPIO
 	pctl->gpio_chip.of_node = np;
+#endif
 	pctl->gpio_chip.need_valid_mask = true;
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
-- 
2.7.4

