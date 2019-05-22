Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF9B266DD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 17:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfEVP3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 11:29:42 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:16926 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729758AbfEVP3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 May 2019 11:29:41 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4MFQqg9026162;
        Wed, 22 May 2019 17:29:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JrVfzO8I0FUdBcA3/JLpbsGbKJMCTTSle83Drqd40I0=;
 b=jSsr6s7jVaQbMt8kPO4pRmSUhH/+HT6oOwLe/dK8+tiiVoABSwi84tfdkDxRodCa/Imi
 Pfvf2epLhjBGK2VXZ30vNPpFux7ljEFUk7VdwmbHAPHGEKNm5ePQuDhhK5foqa0BTQDl
 0wmF8YO3QfllpXpTtlEvhaYn/WoTjUIPeYdgfNcwmDoi+JuRjPBT0xX80omOT8dT6T3R
 1kham35TZYpJACb7syn/erZH799wOpLhl6wi6DEwWy6rV5A3/a3mVMEOEJA7kQrnY9Zj
 xWymIlL6UZCdXiufj7KytYk0TvEaekYjMaTSkc9AvQ0UHvEHUEJuns78NIBddNt4vUcS jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7tu979k-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 22 May 2019 17:29:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AF0A3F;
        Wed, 22 May 2019 15:29:30 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 019DB2CD7;
        Wed, 22 May 2019 15:29:29 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 17:29:30 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 17:29:29
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <linus.walleij@linaro.org>, <alexandre.torgue@st.com>,
        <amelie.delaunay@st.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <benjamin.gaignard@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 1/2] pinctrl: Allow to create link between controller and consumer
Date:   Wed, 22 May 2019 17:29:24 +0200
Message-ID: <20190522152925.12419-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_08:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin controller may want to create a link between itself and its clients
to be sure of suspend/resume call ordering.
Introduce create_link field in pinctrl_desc structure to let pinctrl core
knows that controller expect to create a link.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pinctrl/core.c          | 11 +++++++++++
 include/linux/pinctrl/pinctrl.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c6ff4d5fa482..40b647f3dc7d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1216,6 +1216,15 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
 }
 EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
 
+static void pinctrl_link_add(struct pinctrl_dev *pctldev,
+			     struct device *consumer)
+{
+	if (pctldev->desc->create_link)
+		device_link_add(consumer, pctldev->dev,
+				DL_FLAG_PM_RUNTIME |
+				DL_FLAG_AUTOREMOVE_CONSUMER);
+}
+
 /**
  * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
@@ -1261,6 +1270,8 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		if (ret < 0) {
 			goto unapply_new_state;
 		}
+
+		pinctrl_link_add(setting->pctldev, p->dev);
 	}
 
 	p->state = state;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 8f5dbb84547a..11a42ccf4b0a 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -125,6 +125,7 @@ struct pinctrl_ops {
  *	the hardware description
  * @custom_conf_items: Information how to print @params in debugfs, must be
  *	the same size as the @custom_params, i.e. @num_custom_params
+ * @create_link: If true create a link between pinctrl and it consumer
  */
 struct pinctrl_desc {
 	const char *name;
@@ -139,6 +140,7 @@ struct pinctrl_desc {
 	const struct pinconf_generic_params *custom_params;
 	const struct pin_config_item *custom_conf_items;
 #endif
+	bool create_link;
 };
 
 /* External interface to pin controller */
-- 
2.15.0

