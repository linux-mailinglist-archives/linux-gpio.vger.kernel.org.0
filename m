Return-Path: <linux-gpio+bounces-23309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23441B0657C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45FC01AA477A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E521D293C47;
	Tue, 15 Jul 2025 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cd6/kn/+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B64292B2D;
	Tue, 15 Jul 2025 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602470; cv=none; b=gPI7Ab31ufUV2sLQeCsiLtZW1WqFNJYdOTqmWcmynw101s33f7VXN6PTTZgukIV6Y1nrlDB6xRTou6kybSJTxTXmNLp3Ig0ARcw6NtEbQ5dmXBtakdV19oWTW9EWn522/GOcwstYO+lr6u3FLn8WsOkQE17uTL04vfJneE3zThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602470; c=relaxed/simple;
	bh=uiXVK0N0RglIsQBpmXcSuiKlPf0lE+Qny6cNy4erXow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hHutv4hdo12Hgy4uDrusL7HMtkUmDi0Ldqk/Kwxf7FQz2Q0Du/ftl1CMZZQlKmWAUo8FaCzQPeI9ecLWJ/IHrShOhHKyeCJgODQqIo/mlD7JZckg21h8H9TMFK69seR3dcU9TPlGXPJPUCtm1QiBVPfnY3frbNRv8Xf892XD8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cd6/kn/+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDeHf023949;
	Tue, 15 Jul 2025 18:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZsW1mgw+y4
	TaRNG+cvtjuwE+5q7LUKGCtROTNCU/D0=; b=Cd6/kn/+7QDdDaN9CMnSW46mQF+
	7XHGJx445K1MtCH9VGJenKxE36tgx0CyAe2MmWU+6jvT6UlUNbgaqGYnZcAxstKz
	4i70665gn5kYfXtSpbaIImRcMehHN4tAWUbTZwfmDlBRvqH2KEuJwd5U8gsXS8ql
	pnRHEk+afsxuyh1s/vIV/A+ySL0H9hF9ZMyF16xbT+NXm40WKQN2sUSRIRV3xrJy
	xRpuY8W+R0QhtYmOIBSQmvx1kGMJq3aLUPgI9VBp3FsamXT95NpyeTIFjPWJUPGE
	sGJJ9+bVqvgsl0BQmafO0uBxnS3H9HIgq7rhVQ7GMmcb7dzuByeS8U7+Ouw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruhtuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:00:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56FI0swc021462;
	Tue, 15 Jul 2025 18:00:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47ugsm45hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:00:54 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56FI0rAa021451;
	Tue, 15 Jul 2025 18:00:53 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56FI0rvF021448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:00:53 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id AD3425CC; Tue, 15 Jul 2025 23:30:52 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v6 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
Date: Tue, 15 Jul 2025 23:30:44 +0530
Message-Id: <20250715180050.3920019-4-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0Dv6_QeprzotiqT_T_t-LfkcwfUQGq16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2NSBTYWx0ZWRfX/EwSPDYTeq60
 WXzBTdPoC3o+dczMmgThbetH81/Q122K4x0uC79uEYczUbhZniTt11ohZZ+54tV6qudDvTfTTpf
 11kq63hpC0vDkcPNNjD4OhKL7xWcMcWFIapn6w9BWnfvdWkkJ1dSbzzraWN4phQnhybTDKAKDKR
 pF0uixi2dKkFVkyfSa7XGMt4FCC+SkK6AjBAlpmmjnhRqGu22tDoGxrL4UXUqBY1O+N21qbybk/
 LzOkU0INk14NgPkd8oh3CLKup3oUmCS2lPqHTbFA7h0NXycLkV+GpdW67xMhQWlBUErdd1xGMWU
 yqhzGqXgU4Z8yHgpjfsGu1Ui5f1MjEFS6fdsFH+FyidWdE21XeQdsNpIMmf5d+ezbU/1ti+4ibB
 xFuqW4NV/gimbXpeDTmIGJ1zpmaJrGTyjeL5GqlewxIJBtFUTJl/mU682CDJ0IS/dP7PgAFe
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6876975a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZRTT_DJxv7dltqHrpccA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0Dv6_QeprzotiqT_T_t-LfkcwfUQGq16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150165

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Manage clock settings for ADSP solution. On Existing ADSP bypass
solutions, the macro and dcodec GDSCs are enabled using power domains
in lpass-va-macro which is not applicable for ADSP based platform.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df..aec654e6567e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -76,12 +76,29 @@ allOf:
           contains:
             const: qcom,sc7280-lpass-va-macro
     then:
-      properties:
-        clocks:
-          maxItems: 1
-        clock-names:
-          items:
-            - const: mclk
+      if:
+        required:
+          - power-domains
+      then:
+        properties:
+          clocks:
+            minItems: 1
+            maxItems: 1
+          clock-names:
+            oneOf:
+              - items:  # for ADSP based platforms
+                  - const: mclk
+      else:
+        properties:
+          clocks:
+            minItems: 1
+            maxItems: 3
+          clock-names:
+            oneOf:
+              - items:  # for ADSP bypass based platforms
+                  - const: mclk
+                  - const: macro
+                  - const: dcodec
 
   - if:
       properties:
-- 
2.34.1


