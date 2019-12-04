Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67292112D9B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 15:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDOlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 09:41:12 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:29992 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727828AbfLDOlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 09:41:12 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB4EbKn0030002;
        Wed, 4 Dec 2019 15:41:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=msnzT3bQjxBXfDW7XN2FR7skV/AYmG1hk4DFFqU0wpc=;
 b=pOs7dczTKvqC/9Du7x6CWF3YZJjgeeprVGuLq5y7kGfb+KdJM6uD7592+tr+Cuh/hJW/
 GxddjcjJ72MRUfvbOpYLrxCwJTK0pd//apX1VOOmjUsKlipWY+mj4wJMnbNQvC8nZWDG
 /vMhMFnyS0Mst6PSMoBcj6viPuAQ0+AmxkUoMSqJ6iTiAwX9qm9p/jo8LhiRLQQP3bWn
 JDvCyLQpfJ5xpQTbDptwhz62EQO0F2nC99IF5TzfCpDDtdRH1mQMLtGl5ByE9QRDmvp9
 uT5ZVoN8uTeJyZlIT9UqrfqYwJJcnklsWcepzzJj4rTkuDW7U8Mq6O3motHUlzLE23so vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wkes2wmqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Dec 2019 15:41:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 293E210003D;
        Wed,  4 Dec 2019 15:41:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 193A42BEC77;
        Wed,  4 Dec 2019 15:41:07 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Dec 2019 15:41:06
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] pinctrl: pinmux: fix a possible null pointer in pinmux_can_be_used_for_gpio
Date:   Wed, 4 Dec 2019 15:41:06 +0100
Message-ID: <20191204144106.10876-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This commit adds a check on ops pointer to avoid a kernel panic when
ops->strict is used. Indeed, on some pinctrl driver (at least for
pinctrl-stmfx) the pinmux ops is not implemented. Let's assume than gpio
can be used in this case.

Fixes: 472a61e777fe ("pinctrl/gpio: Take MUX usage into account")

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index e914f6efd39e..9503ddf2edc7 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -85,7 +85,7 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin)
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
 
 	/* Can't inspect pin, assume it can be used */
-	if (!desc)
+	if (!desc || !ops)
 		return true;
 
 	if (ops->strict && desc->mux_usecount)
-- 
2.17.1

