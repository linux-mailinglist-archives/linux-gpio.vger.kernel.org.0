Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760F5EDC1F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfKDKJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:09:22 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40668 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726526AbfKDKJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 05:09:22 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA49v3Rs000518;
        Mon, 4 Nov 2019 11:09:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=U9KCydVK6sJdJRHNSjl7mEURKAb4YJru4EdsVNMkITQ=;
 b=dOYmOnFANYCPUzeQaGiW+FvY8wehFx+hNgUF+fUTevgw9/BnWaZL8tOJD7gr1UtjVPqA
 Bh9kp/YVV9AKIZpRLpv/nZ2EWTsYuwMGeRwZz2kgFUGBJ27G7bpJfwjE+DtO9ID7SoLl
 5t6VPD7wHC4oWVvW3QBfpipTDgKiiqWAv1J1VelefuUczOLVmx+Xued0h30O06P7mokI
 DMgN4sNPoQ26GRNUxh5eB1NKHuHm3yT2RO2PNIQAy9B98qAW24TSqp0qdlBtkxnLMJKj
 kvyM7Un/rysfr/BQ7tRzFh0vnQGnAtLbcmtt4w4PTG/zWgJwac4G9HWMYqvaty8HxZH9 aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2w11jn12g1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Nov 2019 11:09:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D547010002A;
        Mon,  4 Nov 2019 11:09:09 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C65EA2BB05D;
        Mon,  4 Nov 2019 11:09:09 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019
 11:09:09 +0100
Received: from localhost (10.201.22.141) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 11:09:09
 +0100
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/1] pinctrl: stmfx: fix valid_mask init sequence
Date:   Mon, 4 Nov 2019 11:09:08 +0100
Message-ID: <20191104100908.10880-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.22.141]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_06:2019-11-01,2019-11-04 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
yet initialized. gpio_valid_mask required gpio-ranges to be registered,
this is the case after gpiochip_add_data call. But init_valid_mask
callback is also called under gpiochip_add_data. gpio_valid_mask
initialization cannot be moved before gpiochip_add_data because
gpio-ranges are not registered.
So, it is not possible to use init_valid_mask callback.
To avoid this issue, get rid of valid_mask and rely on ranges.

Fixes: da9b142ab2c5 ("pinctrl: stmfx: Use the callback to populate valid_mask")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 564660028fcc..ccdf0bb21414 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -585,19 +585,6 @@ static int stmfx_pinctrl_gpio_function_enable(struct stmfx_pinctrl *pctl)
 	return stmfx_function_enable(pctl->stmfx, func);
 }
 
-static int stmfx_pinctrl_gpio_init_valid_mask(struct gpio_chip *gc,
-					      unsigned long *valid_mask,
-					      unsigned int ngpios)
-{
-	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
-	u32 n;
-
-	for_each_clear_bit(n, &pctl->gpio_valid_mask, ngpios)
-		clear_bit(n, valid_mask);
-
-	return 0;
-}
-
 static int stmfx_pinctrl_probe(struct platform_device *pdev)
 {
 	struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
@@ -660,7 +647,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
 	pctl->gpio_chip.can_sleep = true;
 	pctl->gpio_chip.of_node = np;
-	pctl->gpio_chip.init_valid_mask = stmfx_pinctrl_gpio_init_valid_mask;
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
 	if (ret) {
-- 
2.17.1

