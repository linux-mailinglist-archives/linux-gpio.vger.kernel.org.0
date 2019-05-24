Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 894D6291C6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 09:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388889AbfEXHc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 03:32:26 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:55158 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388847AbfEXHc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 May 2019 03:32:26 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4O7SaIv023093;
        Fri, 24 May 2019 09:32:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rSgRCWj1dSxytynGUKRNJBEIpJ83+teCJf2ciuwtYiQ=;
 b=V+op6iY5LZ12igQ1k5lJV/4rwtgsRGnCU2l9TQlPntKFuzyMiiKdYsGYdNE6lISEGZ6u
 Y3/157O9jRDY5kDWnsiNVN8Ax4/3N0NFAGMBw327HBQFZE5riXbE+gGPx6aDTzTQJLXc
 Y0faPPyoRbmT6TQmlLgUxTrqdc8A/dLcRt6ah6th3G+CJqpO6soKXGnrNYN9lPiWOUZx
 78QdY3ZuPxWM26FCwezx7E3308RLIaNrk1Exbr2MHN3X6SUz/HXf/6EZ95Ve8qtu/vd5
 cvaEOFVRu+ZJT7j+Xh5+XM8K22sF2U+3DXH4rpN+TdV8SCNOC96w3AqwIzm+hwkxOFmd vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7h1c9y2-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 24 May 2019 09:32:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31EC059;
        Fri, 24 May 2019 07:32:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8076C1658;
        Fri, 24 May 2019 07:32:07 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 24 May
 2019 09:32:06 +0200
Received: from localhost (10.201.20.5) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 24 May 2019 09:32:06 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <kbuild-all@01.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined
Date:   Fri, 24 May 2019 09:32:05 +0200
Message-ID: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-24_02:,,
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
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1f380ca..7a33207 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -268,7 +268,7 @@ config PINCTRL_ST
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
-	depends on OF || COMPILE_TEST
+	depends on OF_GPIO
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select MFD_STMFX
-- 
2.7.4

