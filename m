Return-Path: <linux-gpio+bounces-39660-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DKA/CMA6TmqTJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39660-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:55:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B399172610B
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:55:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=APr1W52l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39660-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39660-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72E2307CAF9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EC9434E2C;
	Wed,  8 Jul 2026 11:49:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CD36C59E;
	Wed,  8 Jul 2026 11:49:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511382; cv=none; b=apXsNXtQNZhVr4Qg9nXBGoHHxmCk2YyyOmL5Vu2eTUAtWFmE1PMlCod35yaMK1DjBEN2XI8cdocQ9YnCyVVc7Vuba9OluZNkxE21bun1opFgbWnStqk3sj68Dp1OnjX969JRzfO5sTUEL180rX6buugDHgyAp5Eu0AHlA238i8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511382; c=relaxed/simple;
	bh=18Wx+0CcD3cUo/VmTXhnVVwfYFqLaBraRAgXqc4+S9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K03tCnMbwJmN1IcW2k8wEynnvtZloGFgB+XUaSm3/6CfQoeDUzlpDWZRNmDHbXuw6SkmzUYr6mWNWv57jOFNr3HNBOXej9/QRT9JyBY+/B5PL3RWvNYZNAIFu0cLgbBkRl4E9edkzymhvdWWJJR+0+m3ykHUS3Z4kZYKkCwc7aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APr1W52l; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT8F92531059;
	Wed, 8 Jul 2026 11:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gKeXK7OymGs
	BBxEB0jiKx02xJnvkKMmhrWO0a/loYfc=; b=APr1W52lPNmnuiRsoEzqqzlevyU
	CIZZAN7WQBtD+Xf1EfJg6n/uWbda08dCToeMD8NbsrRXW80okkLP3eknZDXSGnE3
	raXDyFiJP1gvID9ClT/Gtc3WB4vwLtF6rKEtdakVCfFMV7XYSlSMefBHzCJhDSwK
	gZImTnHdn50W7QZ0FErrMiYhEC3Us3lrJsnaH0T3SjNV1E0TrnY8P4HLNv7qdpqS
	UzjV0T4RY+c1stgAkplztM52IeSg0Q3XoQymlAqDYILDGmJGitPw6n990PTvfjAv
	jFpGeYF4ji2G49YLiNcSVOu4DZ5v41XPe6mG3tcU2pkNvZqK6J45wprH8Ew==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5afe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 668BnR2X026285;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8k3yj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 668BnRBD026257;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 668BnRJH026253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 4509C63C; Wed,  8 Jul 2026 17:19:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 2/4] ASoC: qcom: q6prm: add support for LPASS LPR resource voting
Date: Wed,  8 Jul 2026 17:19:22 +0530
Message-Id: <20260708114924.1069239-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e394b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KXDUTxRkB_xfbm0XYe0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX1vlsD2FZUHUc
 jGgk44Rc2Rnll23CuodFqDjRwvDZAxqGDT1cxwN4umGLVLMC0Sjr3wACqKQouVKt+JorAWvJ7hL
 EaY2A+Ueeghk7DvgY6gxCZ/Mobn82HY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX7b1fDtRQL29I
 2srbX3FYlRA+fC6+ud4t9I27ylxDcNjkwx0XsJu+ddHOGuNcuqGlOiILeI7uzXAjDoQCfzMBSMc
 vk8bN/boCITXszeV7jTjq881nyUcXP68E3flgBJRCIlYAtXXxqKs4Kdj1okuugyrqsPe5p5ccgu
 wj9/9915BXYuXDHndeQlYZF6/uA7XdRzFJmD5uQfmRtteln4dXra+H/JkZWo0LF7aErMj7Xwh9+
 njyMS4u8WkycbEKxGZtY+Qj2qzPOkU5TnZ5cLiCwVpwOW8B/01cHFmM45YjWOusQSoP9ZY1Z7oB
 sEfs5hbOfes371F++CKiOeD09LP9HxV3TFFuTcR6DpFxrw+vl1oQxiqfVo5ViLSBKHIJ2QgmAET
 Bg6d7L2V4Ev9cdx785YXbrU6flutefF1SgyqZqaXcOTAuMAmsD8LiAHWdPiSkWxqSS1fSNg/NgI
 SWyHEjknLo1u4xFC/hQ==
X-Proofpoint-ORIG-GUID: tg10NDPd11DOtkx0a8MbDEq51PYVlnQE
X-Proofpoint-GUID: tg10NDPd11DOtkx0a8MbDEq51PYVlnQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39660-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B399172610B

Add support for issuing LPASS low-power resource (LPR) votes through
the PRM interface.

Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
resource voting instead of the existing hardware core vote mechanism.
Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
LPR vote clock ID is requested.

For LPR requests, use the appropriate parameter ID and payload format
to disable CPU subsystem sleep, ensuring that the LPASS register space
remains accessible.

Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
the q6dsp clock ID range consistent with the dt-bindings by deriving
it from Q6AFE_MAX_CLK_ID.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
 sound/soc/qcom/qdsp6/q6prm.c              | 18 ++++++++++++++----
 sound/soc/qcom/qdsp6/q6prm.h              |  1 +
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 03838582a..79527a367 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -12,7 +12,7 @@
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "q6dsp-lpass-clocks.h"
 
-#define Q6DSP_MAX_CLK_ID			104
+#define Q6DSP_MAX_CLK_ID			Q6AFE_MAX_CLK_ID
 #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
 
 
diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48a..2b2b3872e 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
 		       "LPASS_HW_DCODEC"),
+	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
+		       "LPASS_HW_LPR_VOTE"),
 };
 
 static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 04892fb44..22ace8bcb 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -31,10 +31,16 @@ struct q6prm {
 #define PARAM_ID_RSC_HW_CORE		0x08001032
 #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
 #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
+#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
+
+#define LPR_CPU_SS_SLEEP_DISABLED	0x1
 
 struct prm_cmd_request_hw_core {
 	struct apm_module_param_data param_data;
-	uint32_t hw_clk_id;
+	union {
+		u32 hw_clk_id;
+		u32 lpr_state;
+	};
 } __packed;
 
 struct prm_cmd_request_rsc {
@@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
 	uint32_t opcode, rsp_opcode;
+	bool lpr_req = hw_block_id == Q6PRM_HW_LPR_VOTE;
 
 	if (enable) {
 		opcode = PRM_CMD_REQUEST_HW_RSC;
@@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 
 	param_data->module_instance_id = GPR_PRM_MODULE_IID;
 	param_data->error_code = 0;
-	param_data->param_id = PARAM_ID_RSC_HW_CORE;
+	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
 	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
 
-	req->hw_clk_id = hw_block_id;
+	if (lpr_req)
+		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;
+	else
+		req->hw_clk_id = hw_block_id;
 
 	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
 }
@@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			     const char *client_name, uint32_t *client_handle)
 {
 	return q6prm_set_hw_core_req(dev, hw_block_id, true);
-
 }
 EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
 
@@ -210,6 +219,7 @@ static int prm_probe(gpr_device_t *gdev)
 	cc->gdev = gdev;
 	mutex_init(&cc->lock);
 	init_waitqueue_head(&cc->wait);
+
 	dev_set_drvdata(dev, cc);
 
 	if (!q6apm_is_adsp_ready())
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a3208..bd5ee0c40 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -87,6 +87,7 @@
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
 #define Q6PRM_HW_CORE_ID_DCODEC		2
+#define Q6PRM_HW_LPR_VOTE		3
 
 int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
 			  int clk_root, unsigned int freq);
-- 
2.34.1


