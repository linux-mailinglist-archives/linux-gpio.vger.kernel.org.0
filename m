Return-Path: <linux-gpio+bounces-40131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIgmKaONV2o/WwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2975EC89
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X08xoIgV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40131-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40131-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AB1D308C1CE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AAF2EEE8C;
	Wed, 15 Jul 2026 13:33:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214892C027F;
	Wed, 15 Jul 2026 13:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122381; cv=none; b=sTXnE60RhmktkPFfPmkA9yZk71T/swivxD9CDuc/ez+FUXdkk9ODRgnoxhit9yDBiFsMY0GaYtmazCXQluSSmD0f7c+mleVQEv4dxVTX87WFTnViQwlVtNwxlxSuGElJVubDwk6ovN1JGCYVFPPsyz9H62Z4ORi8+aUjLkJOaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122381; c=relaxed/simple;
	bh=MgHtkaN+TUS2cAh1lmkWp4RrWrbXhm3KdmXh2IaTtBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=teDdea0Y/mTZjT5R+lLB2reB36Co0agqS64S3nJ4ENnywnHDcmN/OO/gEyNaEvtgyh9qayTfJBFcDvKjod706e/BsrO5tlqiYmyq4o16Dj2fOHnKqZQGsu7pZFM3pWwNGPmTim77B+hmCFirrzpa1prZkgaUTca4O6cPSspOAXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X08xoIgV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDHrkP3851774;
	Wed, 15 Jul 2026 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CQjBM+UkCyO
	6iY/yFECNS9UKY+n1is2GDzbLH+wKU90=; b=X08xoIgVHbIArQ3Lmxjsl0dk/ZJ
	wbbTgwWQotoxsrYXoNTMjAf+0Y95sOtCoh6Wuir6snAqGTfAkdsXWK/mHQfUReTW
	ebJIuIzmfL7F+qXbm+K1j6aTlfxxqMF+M096jYI9Wf4daXLkngNdGiZcHHsP7Yg7
	Fg2XOUe0FfKByuZhQrsxkjqNdIyGyI2eYrw9YywgVXz5o8KRdcGP0NO3d6TW2upZ
	hV+o5YWPnN7domREjYzlYP1Y9EURm+LgIUhEp1fHZ62MZshkUtZPnTggWTN2RZTj
	6zajYbYTWm397HJ8kyIoze0S6JWQY3vY7OEnTNPQEtU1tVXYSP70YEbmzDw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg1u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FDWkPn030472;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewk39sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FDWksO030441;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66FDWjBl030434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D298B63C; Wed, 15 Jul 2026 19:02:44 +0530 (+0530)
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
Subject: [PATCH v3 2/4] ASoC: qcom: q6prm: add support for LPASS LPR resource voting
Date: Wed, 15 Jul 2026 19:02:41 +0530
Message-Id: <20260715133243.3170821-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 10dAssAsysJB2vtyvC-Xs7GhrRBkVc_1
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a578c02 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=AiEp7IXl2_k0sn4W3poA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX5DVTMhlcijVz
 +FRMcy2TLB9O8TvRgklODoFFvRjIHGSd5n1gd9PJPK7Zis+HxHOCrASZEDhrOfPO84qmTEo6MbF
 dnnShRTDTSrAXVcgWnGevkw8afQ2Z+FlYNNa1+bYZNDioAyVfq5RkE1FO+4MEQh9GZ81YuO/ele
 04ZEKVtDKIfZ+88lVP/07nhzArZBK7hENGVrzeJC3TufTizObqzE0l2E94OtRM933bOr+tF1aYx
 LQt9F/2iokYBqCMjnWtpGsDdfRf/tuE/EUqOje3bJIuouOLxwBOL7S6OhaIoXa7s9gzvq6/pgvj
 7O+m+39iIZ0lb2F38Od83UKfhg0J4z+AYR8dJ5htGw/DTbultlP6qqrcH4Hvlc6o8Gu3fIG8d+g
 bsK3VdSYC6+Np7MWtWmXpASuvI+jcCEMKwh7DcsJL0NNAVpLZeMTc6eD9u52Uanx/jtHKKDQVb7
 UdxYmf1PYdtZIRUrMjA==
X-Proofpoint-ORIG-GUID: 10dAssAsysJB2vtyvC-Xs7GhrRBkVc_1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX2e6VxylOkdyo
 ucule2jb/W3awl32Wx3sW9wX/Nq2fDt+EMmO0i/rzgtwUGLL8RxE1M5rNRLM2R3tfKcAE9J2/E/
 E6nEHxB7fYvEQr8K5Q6oFByIH6lhc5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150135
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
	TAGGED_FROM(0.00)[bounces-40131-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42B2975EC89
X-Rspamd-Action: no action

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
 sound/soc/qcom/qdsp6/q6prm.c              | 16 +++++++++++++---
 sound/soc/qcom/qdsp6/q6prm.h              |  1 +
 4 files changed, 17 insertions(+), 4 deletions(-)

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
index 04892fb44..1f3ce4cc0 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -31,10 +31,16 @@ struct q6prm {
 #define PARAM_ID_RSC_HW_CORE		0x08001032
 #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
 #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
+#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
+
+#define LPR_CPU_SS_SLEEP_DISABLE	0x1
 
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
+		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLE;
+	else
+		req->hw_clk_id = hw_block_id;
 
 	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
 }
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


