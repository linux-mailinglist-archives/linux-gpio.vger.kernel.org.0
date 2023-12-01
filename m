Return-Path: <linux-gpio+bounces-841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FA800E98
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5E1281B8C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34A14AF69;
	Fri,  1 Dec 2023 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="COnBI6Wx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7ED10E4;
	Fri,  1 Dec 2023 07:29:53 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1BUNui013936;
	Fri, 1 Dec 2023 15:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=q3bEk0jgRGlHbYEBNYLlCZUrcpZe0e6Cv9QCLmPDcqQ=;
 b=COnBI6WxIkbMrkETC9YX7IdBNt2xXaCprcAvEjs2FXYJLgI5f7QU6lweNrNbPVfWqfkf
 P3I19lWG3iin6m9yv5RC0K9REhGFTm0ubRvLslTLLFro68rWn4PYjvJQiqAAwW8MjqY1
 /N/IjXanyR8g2CZOnSBtHjg8w7Ema2FytpDF86jsheksHQAGS8b3NtFqB5nhgYPgQoTm
 q2/4ER9Z5unIxd1wpgf61wdWIcL2N1XHaNjxuYnPCcLGYMFvxTJJ6Cj9lh8IpoucjGa3
 8N5Zt61OiiPxgV+5Mdt7DP6lBkSJTUdtSiJsQmup5OZRkxQge1sSN2AAZgucoI4UeqGN NQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq2kpa6vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 15:29:51 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1FToPp004863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 15:29:50 GMT
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 07:29:45 -0800
From: Maria Yu <quic_aiquny@quicinc.com>
To: <linus.walleij@linaro.org>
CC: Maria Yu <quic_aiquny@quicinc.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <torvalds@linux-foundation.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] pinctrl: Add lock to ensure the state atomization
Date: Fri, 1 Dec 2023 23:29:31 +0800
Message-ID: <20231201152931.31161-1-quic_aiquny@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Wm301lwrpI7xCONVAXFQC28SP4NYl-zr
X-Proofpoint-GUID: Wm301lwrpI7xCONVAXFQC28SP4NYl-zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_13,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=756 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010108

Currently pinctrl_select_state is an export symbol and don't have
effective re-entrance protect design. And possible of pinctrl state
changed during pinctrl_commit_state handling. Add per pinctrl lock to
ensure the old state and new state transition atomization.
Move dev error print message right before old_state pinctrl_select_state
and out of lock protection to avoid console related driver call
pinctrl_select_state recursively.

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

base-commit: 994d5c58e50e91bb02c7be4a91d5186292a895c8
-- 
2.17.1


