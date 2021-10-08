Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E3F426AAB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 14:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240457AbhJHM1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 08:27:38 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:34932 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230197AbhJHM1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 08:27:37 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1989Zvn3032584;
        Fri, 8 Oct 2021 14:25:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=au7Ek/5U1T6AULbN6EfVLxcM0LGgQliVI5/SbjC2bS0=;
 b=mAc4Fbc/nRAk6yw0QopQN6vsY+j7t/kkm6FiW5UbwlikHd0dwRrIvNPO2Gx3jd8TCPz2
 ENWc2V+ku1Sfp0lJOig5x+RW1V/sNrTHIMhgD7ebogrD66OeFfcVRexP4FJREuzRB/TJ
 7Ae0b3XxRET3/OrA7F5ls4/ccz4WyqDqoCjdm6UxT7Sj+qHMgpiToKcDDf9EK03WdK1P
 nSUMKCnyMYtIJv0IF20BvgQxwyxWWuf8NpEq0MgarUGZBsbeRIveXEhm9gbppmTk7fo3
 3omahBaDOxm+FM5Kxf9rwead+cTgwm91HM59bM9D5/uz2EYzSlH/v4JsKW3c6USTZaIf Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bjem12svt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Oct 2021 14:25:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4182710002A;
        Fri,  8 Oct 2021 14:25:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 371EB227F4C;
        Fri,  8 Oct 2021 14:25:35 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 14:25:27
 +0200
From:   Fabien Dessenne <fabien.dessenne@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH] pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()
Date:   Fri, 8 Oct 2021 14:25:17 +0200
Message-ID: <20211008122517.617633-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When resuming from low power, the driver attempts to restore the
configuration of some pins. This is done by a call to:
  stm32_pinctrl_restore_gpio_regs(struct stm32_pinctrl *pctl, u32 pin)
where 'pin' must be a valid pin value (i.e. matching some 'groups->pin').
Fix the current implementation which uses some wrong 'pin' value.

Fixes: e2f3cf18c3e2 ("pinctrl: stm32: add suspend/resume management")
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 68b3886f9f0f..dfd8888a222a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1644,8 +1644,8 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 	struct stm32_pinctrl_group *g = pctl->groups;
 	int i;
 
-	for (i = g->pin; i < g->pin + pctl->ngroups; i++)
-		stm32_pinctrl_restore_gpio_regs(pctl, i);
+	for (i = 0; i < pctl->ngroups; i++, g++)
+		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
 
 	return 0;
 }
-- 
2.25.1

