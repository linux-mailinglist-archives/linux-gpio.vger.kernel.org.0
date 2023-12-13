Return-Path: <linux-gpio+bounces-1289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E380E70E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD2A1F21B43
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D0158125;
	Tue, 12 Dec 2023 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BLqpe9uC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE87B7;
	Tue, 12 Dec 2023 01:06:40 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC4FqQl012890;
	Tue, 12 Dec 2023 09:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=s1dBI9/E3rx9/JOjkcgCAjP1EckoNhhcDmODPaccMws=; b=BL
	qpe9uCg8JL8QZWaret70aPnnT31QOwh+rgVt2H5jcDRmQsnMMnmaAOqCiZ3LkBJi
	AGWBCAuuShqT/fwNn9wdRaO72FPzvHhfO8f5DwEJMKXX3Mp8TN6MQWEuEWrSkMxO
	yfIBMH6oSjIf3iax1a0z0nSj54eu3BBMwCvtGIMAr8TIRadhlDCQupK3olUejDM9
	TkhZie0F8DeBi2WpdzRnanGqdvrSVdeyP8fkt+X3OumKZNLCZ9DCZDBEOXQKSA9h
	4eIlI8lKUczonCA7g9N+DroMcvDSCM1gBFwOQnKaMt345/QQlKNYhiXTlI2s4bYR
	T66g9yaFycWXTRiPbQpA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxgbb0j0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 09:06:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC96aBC030091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 09:06:36 GMT
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 01:06:30 -0800
From: Maria Yu <quic_aiquny@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>
CC: Maria Yu <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2] pinctrl: Add lock to ensure the state atomization
Date: Tue, 12 Dec 2023 17:06:11 +0800
Message-ID: <20231212090611.950-1-quic_aiquny@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G0TUX0OI5oYT2_hlsST-JrJWUVlHd4lm
X-Proofpoint-ORIG-GUID: G0TUX0OI5oYT2_hlsST-JrJWUVlHd4lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=976 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120071

Currently pinctrl_select_state is an export symbol and don't have
effective re-entrance protect design. During async probing of devices
it's possible to end up in pinctrl_select_state() from multiple
contexts simultaneously, so make it thread safe.
More over, when the real racy happened, the system frequently have
printk message like:
  "not freeing pin xx (xxx) as part of deactivating group xxx - it is
already used for some other setting".
Finally the system crashed after the flood log.
Add per pinctrl lock to ensure the old state and new state transition
atomization.
Also move dev error print message outside the region with interrupts
disabled.

Fixes: 4198a9b57106 ("pinctrl: avoid reload of p state in list iteration")
Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
---
 drivers/pinctrl/core.c | 11 +++++++++--
 drivers/pinctrl/core.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index f2977eb65522..a19c286bf82e 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1066,6 +1066,7 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	p->dev = dev;
 	INIT_LIST_HEAD(&p->states);
 	INIT_LIST_HEAD(&p->dt_maps);
+	spin_lock_init(&p->lock);
 
 	ret = pinctrl_dt_to_map(p, pctldev);
 	if (ret < 0) {
@@ -1262,9 +1263,12 @@ static void pinctrl_link_add(struct pinctrl_dev *pctldev,
 static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 {
 	struct pinctrl_setting *setting, *setting2;
-	struct pinctrl_state *old_state = READ_ONCE(p->state);
+	struct pinctrl_state *old_state;
 	int ret;
+	unsigned long flags;
 
+	spin_lock_irqsave(&p->lock, flags);
+	old_state = p->state;
 	if (old_state) {
 		/*
 		 * For each pinmux setting in the old state, forget SW's record
@@ -1329,11 +1333,11 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 	}
 
 	p->state = state;
+	spin_unlock_irqrestore(&p->lock, flags);
 
 	return 0;
 
 unapply_new_state:
-	dev_err(p->dev, "Error applying setting, reverse things back\n");
 
 	list_for_each_entry(setting2, &state->settings, node) {
 		if (&setting2->node == &setting->node)
@@ -1349,6 +1353,9 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 			pinmux_disable_setting(setting2);
 	}
 
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	dev_err(p->dev, "Error applying setting, reverse things back\n");
 	/* There's no infinite recursive loop here because p->state is NULL */
 	if (old_state)
 		pinctrl_select_state(p, old_state);
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 530370443c19..86fc41393f7b 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/radix-tree.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include <linux/pinctrl/machine.h>
@@ -91,6 +92,7 @@ struct pinctrl {
 	struct pinctrl_state *state;
 	struct list_head dt_maps;
 	struct kref users;
+	spinlock_t lock;
 };
 
 /**

base-commit: 26aff849438cebcd05f1a647390c4aa700d5c0f1
-- 
2.17.1


