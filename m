Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259EBCBA4D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 14:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbfJDMX5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 08:23:57 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49565 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727451AbfJDMX5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 08:23:57 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x94C6SFo002761;
        Fri, 4 Oct 2019 14:23:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dn3SRm7He6o8fWRPcG/dCMdLktN0g0uPy1Ih8W/R/RU=;
 b=a9JaEf0MxZAwzo7nMA07qKyXGlCaouKJWTW1SdXRMtGGb5c3DraiCdErBx5WnRO2/Vdr
 6EPZxkiv/fnc4yNIFYvC5V9IrEvYTMy1eiW5YZka3zp/0fkWKarRpTz8ekF+zqY2Hbr5
 hmKR9tKpwvCFbBxH3hWj0aLRWyJQI5+mYZqaLM6YhpWWBEnj4/3wdeuwoargiqKHuCHe
 kzzMhKILnnM3MYbOFpBF+/pDaLHyZp7s7Vn16CMOE2J0R84uY7xPePyaXSaiacQO+qCx
 lgydOt80+ekIZ4N0XS83b2iZVOyZ2zUEGa64QCYufvhjleCqZUiKayh2wc/jL/wBU815 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2v9w9wavvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Oct 2019 14:23:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AD4A10002A;
        Fri,  4 Oct 2019 14:23:45 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D9D62BDA9A;
        Fri,  4 Oct 2019 14:23:45 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 4 Oct 2019
 14:23:45 +0200
Received: from localhost (10.201.22.141) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 4 Oct 2019 14:23:43
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/1] pinctrl: stmfx: fix null pointer on remove
Date:   Fri, 4 Oct 2019 14:23:42 +0200
Message-ID: <20191004122342.22018-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.22.141]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dev_get_platdata(&pdev->dev) returns a pointer on struct stmfx_pinctrl,
not on struct stmfx (platform_set_drvdata(pdev, pctl); in probe).
Pointer on struct stmfx is stored in driver data of pdev parent (in probe:
struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);).

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 974973777395..564660028fcc 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -705,7 +705,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 
 static int stmfx_pinctrl_remove(struct platform_device *pdev)
 {
-	struct stmfx *stmfx = dev_get_platdata(&pdev->dev);
+	struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
 
 	return stmfx_function_disable(stmfx,
 				      STMFX_FUNC_GPIO |
-- 
2.17.1

