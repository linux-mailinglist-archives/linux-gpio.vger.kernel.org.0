Return-Path: <linux-gpio+bounces-14192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39A9FBA9B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA2F188440D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740F01925AE;
	Tue, 24 Dec 2024 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFVzeQx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149837160
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029902; cv=none; b=mT8REIE2hu3st0AtLY9OQlEs8XVtbwKpnvOOoIDvl9EXtAujV9VOaSo9MvQTeKiKEoYrTZB5GkiaC+hsVxODvi7z9TqkIfs33O4mTYoNUgdKChzjxMv5kjPeGpFb8YRCYiAu7LPAu7eFKjY5cLypLAB8CUSETyzipKgTxHnvfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029902; c=relaxed/simple;
	bh=b3vDNvjEDSn6HydS1+jt8XmBcW5CAIUo/KGGpHNwWp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mYu0mAqYtGIeRgNEXT5n7M0jplWVme15WoHsofB4d9Br4C2kYazRjfkgFds2FpFSIz3s6JpCFp9NCU3YvY1TmyFEovSLd3+Ivlmc7j62SO7p2ZeD5S/Yg+Um9Mmu3dNo5SlQXVVSWdHo0wEVFiqBg0gFXEGnZFQKHytB84JA86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFVzeQx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNNU2hd013625
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 08:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zOVHygUGad6H+dgr/kJ0vfuDfQ1ghbja1g/
	SWA6HPfw=; b=dFVzeQx6ii0k2TqNjC7A0n4ZkDMSe0LkJAkhrR/aNHNmUhpTcZT
	WAUatHAXhVh8Y2opTNlATNoQXWvqyIP8tgfGNxUHmCsW6Bvfim3/C0VaQRtNpxqk
	Tc69zVxJRCNwLzcHmRLdhfuknB7NWHyT2J+ajbj6FxSG5qZSDORxNeRUGamIYmun
	mK61rsbOUyqGVQjNOyVEPT9GgKlLZZwVaEepf6cwlMrzm5QEVL1zHu7nJqjgko5I
	f+OlD6HWGW9Xi9bPWfTmiuRiJ72MufaTe0Q8ByyYzat3p7jUF+rWwRG2+mhjL2g2
	IKJSu8EOzG1sXvRP2tiO5kQ3u6PdEAw18ZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qhk61v42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 08:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21648ddd461so60120225ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 00:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029898; x=1735634698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOVHygUGad6H+dgr/kJ0vfuDfQ1ghbja1g/SWA6HPfw=;
        b=IxOTShVn1Ur9UPyJr8MmAlsxl9MBaSoDexBVZsnp/ZgrqvPuX/8MGvWYVEHAKrpvQ1
         J77hZ03TgNE/rx8NEqiQEchdjtLEFAwmlFUcUJkqSw72bPf/moq/Fu2DtwnVYnUAYzUc
         04LSvo2KONaGXbJIC3m7Ctj7VjQIsQ0G4zhOem7208zxQPUGI/kgaQL2v4vLbU41krd3
         hawhsLWfiMdUzPhe7N2sczZS6XPMBQR7e6XlGesTPOuFWjk+ORAINPOIzBQ4KC1Oz9jP
         gK/DuI27pnFuYr6qJNXUBwjdEglah66wbEpJddvfVIIlMQ386B5u+WPQfv/BBvd++F/q
         n2/Q==
X-Gm-Message-State: AOJu0YzFcLQ6XlAF4SgCkTPSUfN3nNAAGPMFnFcwk4hA4bvlT1hwW9K3
	qDEF7+oCEnCX7H+gbDrii0SmYPTonJ86g2d6D/qHYl7Ome30lgR7TQABfI03FTDNhw9PG43EIgR
	AI6/4Qm4OtyQAcbdJC3ZahdhLmnlQi5uDPnLRyToFLAbpbvJVDB6nd5cfZMHk
X-Gm-Gg: ASbGncv2QoGBluGLYFwE7puuxF6WO1cYccOQAGui4Kb359UqKV5jvQ3f9t0KgkuW4XY
	cusYKvcl4XRGc1yJLe/8hhqVCKguhVr1aRkfSVa0vF9JKBAM4/nRdPdfWqmTlabwuKEElLZsG0x
	ak2OSoRyD3LH6KNvtXS/oFh27/UXRuzuIrg4n3BKP4NYIDlYU4kdbajQ1BcYKRdFlaLfyBmgWku
	NJRL8uhOAb9bW+Yb4MurobXu34TbWW8L8ZQ/Xm5HFInizwq+jq2eef6UMuWydAlTVs+4Edq+4p4
	TayXa8gV
X-Received: by 2002:a05:6a20:7487:b0:1e1:b023:6c98 with SMTP id adf61e73a8af0-1e5e0482bd2mr26657455637.26.1735029897755;
        Tue, 24 Dec 2024 00:44:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhCH2Etix+pcFQH4tLLchx6eTlRUvl7Zqan7z7//oAChJdIFWkZKWXSQRavLSylwCSSpJJuQ==
X-Received: by 2002:a05:6a20:7487:b0:1e1:b023:6c98 with SMTP id adf61e73a8af0-1e5e0482bd2mr26657434637.26.1735029897372;
        Tue, 24 Dec 2024 00:44:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842abd593bcsm8430809a12.16.2024.12.24.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:44:56 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] pinctrl: Fix the clean up on pinconf_apply_setting failure
Date: Tue, 24 Dec 2024 14:14:41 +0530
Message-Id: <20241224084441.515870-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 74QAvtFwQuuqOzlejTZUTb0KgveBYQVo
X-Proofpoint-GUID: 74QAvtFwQuuqOzlejTZUTb0KgveBYQVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 adultscore=0 mlxlogscore=980 priorityscore=1501
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240072

When some client does devm_pinctrl_get() followed by
pinctrl_select_state() that does pinmux first successfully and later
during config setting it sets the wrong drive strenght to the pin due to
which pinconf_apply_setting fails. Currently, on failure during config
setting is implemented as if pinmux has failed for one of the pin but
that does not seem right and need to undo the pinmux for all the pin if
config setting fails.

Current commit does a bit refactor to reuse the code and tries to clean
up mux setting on config setting failure.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/core.c | 50 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b3eec63c00ba..4bdbf6bb26e2 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1256,6 +1256,20 @@ static void pinctrl_link_add(struct pinctrl_dev *pctldev,
 				DL_FLAG_AUTOREMOVE_CONSUMER);
 }
 
+static void pinctrl_cond_disable_mux_setting(struct pinctrl_state *state,
+					     struct pinctrl_setting *target_setting)
+{
+	struct pinctrl_setting *setting;
+
+	list_for_each_entry(setting, &state->settings, node) {
+		if (target_setting && (&setting->node == &target_setting->node))
+			break;
+
+		if (setting->type == PIN_MAP_TYPE_MUX_GROUP)
+			pinmux_disable_setting(setting);
+	}
+}
+
 /**
  * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
@@ -1263,7 +1277,7 @@ static void pinctrl_link_add(struct pinctrl_dev *pctldev,
  */
 static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 {
-	struct pinctrl_setting *setting, *setting2;
+	struct pinctrl_setting *setting;
 	struct pinctrl_state *old_state = READ_ONCE(p->state);
 	int ret;
 
@@ -1274,11 +1288,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		 * still owned by the new state will be re-acquired by the call
 		 * to pinmux_enable_setting() in the loop below.
 		 */
-		list_for_each_entry(setting, &old_state->settings, node) {
-			if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
-				continue;
-			pinmux_disable_setting(setting);
-		}
+		pinctrl_cond_disable_mux_setting(old_state, NULL);
 	}
 
 	p->state = NULL;
@@ -1322,7 +1332,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		}
 
 		if (ret < 0) {
-			goto unapply_new_state;
+			goto unapply_mux_setting;
 		}
 
 		/* Do not link hogs (circular dependency) */
@@ -1334,23 +1344,23 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 
 	return 0;
 
+unapply_mux_setting:
+	pinctrl_cond_disable_mux_setting(state, NULL);
+	goto restore_old_state;
+
 unapply_new_state:
 	dev_err(p->dev, "Error applying setting, reverse things back\n");
 
-	list_for_each_entry(setting2, &state->settings, node) {
-		if (&setting2->node == &setting->node)
-			break;
-		/*
-		 * All we can do here is pinmux_disable_setting.
-		 * That means that some pins are muxed differently now
-		 * than they were before applying the setting (We can't
-		 * "unmux a pin"!), but it's not a big deal since the pins
-		 * are free to be muxed by another apply_setting.
-		 */
-		if (setting2->type == PIN_MAP_TYPE_MUX_GROUP)
-			pinmux_disable_setting(setting2);
-	}
+	/*
+	 * All we can do here is pinmux_disable_setting.
+	 * That means that some pins are muxed differently now
+	 * than they were before applying the setting (We can't
+	 * "unmux a pin"!), but it's not a big deal since the pins
+	 * are free to be muxed by another apply_setting.
+	 */
+	pinctrl_cond_disable_mux_setting(state, setting);
 
+restore_old_state:
 	/* There's no infinite recursive loop here because p->state is NULL */
 	if (old_state)
 		pinctrl_select_state(p, old_state);
-- 
2.34.1


