Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428771B129
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 09:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfEMHaV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 03:30:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40928 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727462AbfEMHaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 May 2019 03:30:21 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4D7QM1I009050;
        Mon, 13 May 2019 09:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bURCBAue+7AyVWgZbYBJxzJiyLeB1d3yp/jM0DfADTU=;
 b=w5r30mezaFZfl7jNNnVNJBezsOhfZikY7nVPMZ+/ame+5Zq/sSr42IqClHXTF/tKMbFV
 nfxMdgOdbchEB8YQb43ZjMJG4oIMjRa37j4A14DHo0YfSNfRdroepmCd6TMMEqLIHs4a
 95nQX7fU16DnnEgaS+7ntboGSc+API5ZZTWcpvhDLYFyoaWyK8LoeHSf3acYFdLdBe6j
 85lgjymtnF4UNA13xo8WhhvCFjDlrFqAISR76q1OOISpK9iMhfggirL7LA+AXYf32kpB
 BI7GmjLUKV02lmCbNiD4LZOTR4cuahQBBfJYY3tKDuKBLDYm7ROFT2441a3Se5jM9YoE mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sdn9fhe80-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 13 May 2019 09:30:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C69943A;
        Mon, 13 May 2019 07:30:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 987B5141A;
        Mon, 13 May 2019 07:30:08 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 09:30:08 +0200
Received: from localhost (10.201.20.5) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May 2019 09:30:07 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <kbuild-all@01.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH] pinctrl: stmfx: Fix comparison of unsigned expression warnings
Date:   Mon, 13 May 2019 09:30:06 +0200
Message-ID: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-13_05:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fixes the following warnings:

drivers/pinctrl/pinctrl-stmfx.c:225:5-8: WARNING: Unsigned expression
compared with zero: dir < 0
drivers/pinctrl/pinctrl-stmfx.c:231:5-9: WARNING: Unsigned expression
compared with zero: pupd < 0
drivers/pinctrl/pinctrl-stmfx.c:228:5-9: WARNING: Unsigned expression
compared with zero: type < 0

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index bcd8126..3bd5d6f 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -213,7 +213,7 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
 	struct stmfx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
 	struct pinctrl_gpio_range *range;
-	u32 dir, type, pupd;
+	int dir, type, pupd;
 	u32 arg = 0;
 	int ret;
 
-- 
2.7.4

