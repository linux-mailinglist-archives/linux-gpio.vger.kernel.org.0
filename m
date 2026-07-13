Return-Path: <linux-gpio+bounces-40001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EFDkN7kyVWo0lQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 20:47:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66B74E952
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 20:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EJh0aO+G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40001-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40001-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C496304DFCC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 18:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEE3356770;
	Mon, 13 Jul 2026 18:46:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29943546C2;
	Mon, 13 Jul 2026 18:46:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968370; cv=none; b=b8hOw9k0RXj1fBx8knWW2unfF9uY3UufbhSp0zZoR+5M5ukOykgHfhXKmxK7GLsaZ05oa/DUbdDG947vsKZsWtyeS874OOHuKKBpbYJjO3o7PPE0fZPI4YE++sT1O7QK8R6eKUdn1zbcdlyZPUaLqK8l5cnPw2Hzm+KPt6TBqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968370; c=relaxed/simple;
	bh=QiC3EbkfOPSibROEQO4o2nSqBN0cPJanMXALcOBe46c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b32uDGBkZMbVzwxJsdV8G4ZJnU22CawSH4sbXFw2YPT7QvdaM0jSxLC8IB0rW9Ox573iecbeCtCRS6y+lZlkfXbEBT2Y5xNpJJHSUSmO5qRXRyXnPo+1h4DOKcxq9z/9SgsL9N9SbPBz4fntBYb+ik8dK5pfr24u2XqQEk6gcus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJh0aO+G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DG5H4W2030810;
	Mon, 13 Jul 2026 18:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/xj1NvpXgL
	3DgSHsl/6JogCckTdDQ6XuTBSmvqcxog=; b=EJh0aO+GvcRPrNLXPEUFXkWw1Gf
	I5msyphEDRG/FEnXlEbDjqlLOzgqHUOyO5CltSZ7PzSUQBVJjuUIbv7u4E7ZfFa3
	VJbxqXQhjrciLFIyXTlAftNuUgsRl4kG0UUkwdfSCDxgZ8G9ee7eXXKEqqUp5bxX
	Mo+ba5m7MXJtapp2rGIqrwq/cnmp8zWmBFj64ozJpetxeYU98fpWBnLghg/GVfeV
	mRmQQXC6MAidRT6tubOcv8NgTe/pvfKlBJrGlsjYE3GNOUSIWe+xuaaY9Men/El7
	+CZtQqPLZMu1WjbWP+s6rhVbiz8gJnLxdrhGaTSFVzhJlLIQPGCOnqR8/yA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x8m5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DIjsne010051;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjb42e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:54 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DIjr5Q010028;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66DIjrHN010019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:53 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id DD23C63F; Tue, 14 Jul 2026 00:15:51 +0530 (+0530)
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
Subject: [PATCH v2 3/5] ASoC: qcom: q6prm: add support for LPASS LPR resource voting
Date: Tue, 14 Jul 2026 00:15:47 +0530
Message-Id: <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfX2F+jmRQ4KR6Q
 BZF8XDkZyuPUQhKG1lfXch5U5mJKyRbyByuE1+dnICu+s4/QWSOg8I9RN64N7pPjs8bzdvCVvNI
 ReGrswlPtnY26bBvcwi4nLMrtnLaWFSnN5/XE/fXHF53jdnSmm39KusFG3NBFaa2L/hT0f/fGdO
 PlKpEvwiCZH8LDMowLaTSvl5JPM4QwYCWodkOqpwGWp5df2Y+B80UikbXScHcdmOm1wqajpck6V
 8SXuDGELxhB/OeWQrEim7/xSoRjcjPUH9RPHsrv9BSnD5HRgOgKV+7+gcWsX3F+6nPHR2WD8mlR
 tVcV2JFQvuuPitJ+G4PTwYakLGWa2rabIT/ShDsMlLzgzA47rveuoTAECA5iwWB/YaRZlexEfTF
 tpjcA470ugaDoKtugYyAtVNaBIpMkKSYC3CX0yICO4UEvoCF5hBaUIAnZAfopUsLSjH1uFq0HHZ
 5+26yLYkTWEdpBkrnNw==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a553266 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=KXDUTxRkB_xfbm0XYe0A:9
X-Proofpoint-ORIG-GUID: p3I4WzvWoMd6N_h34fEUtfUvMrTu_11o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfXyh3Nbmu/5z67
 xvTspTDtcOTX+2A6TSzhgpXGpT4s4pn3CrZG3xeYdRQ3q40UHjrg2G3IMBlGBT7Y6sAO+C3Dzl4
 K283+H/J9Ta3JtAvGRwIDFj6lhNxO2Q=
X-Proofpoint-GUID: p3I4WzvWoMd6N_h34fEUtfUvMrTu_11o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130194
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
	TAGGED_FROM(0.00)[bounces-40001-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A66B74E952

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
 sound/soc/qcom/qdsp6/q6prm.c              | 17 +++++++++++++----
 sound/soc/qcom/qdsp6/q6prm.h              |  1 +
 4 files changed, 17 insertions(+), 5 deletions(-)

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
index 04892fb44..7a7a1d3d5 100644
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
+	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
 
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


