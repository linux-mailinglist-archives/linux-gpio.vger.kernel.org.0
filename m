Return-Path: <linux-gpio+bounces-23534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3402B0B775
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BC687A4A9C
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 17:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FD9221F06;
	Sun, 20 Jul 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pYaoNyL+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971EE1CA81;
	Sun, 20 Jul 2025 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753033325; cv=none; b=ZzAFNiIH3LBtVx9iYt72Zb1r59cYOeiSzw6K67+FBbqE5QKjIcsH19A4MkUHaSQ2P/+gSarvojDnzBK7mZd+WFmgCFArLbnBx5YYZcbfgPeUzY3Q1y7ZaXI2iMeE1EgH8TjjAhe08mBeIH0BR6tfhNZ2HxrlFecWTopHF85xVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753033325; c=relaxed/simple;
	bh=sxRR6myuDhJtWpvDtMkqiYmloHrbHQ4QiPu3giKLFtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ANJwmGP0AqCn0EgYh51FnmLgHwcy7ueEZ32K0VMy9LubSrhXq6IRaIYVoExzqxbKhVujBxrvv8p7digddNiX+y5vVkDLnJGA2mlmjWvFJrSDz/Jrlqz43+ACIBE/YjHksSFNdDYs9taA0am0KZyCLe2GaTJntuYdWFRuAmrRwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pYaoNyL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KErHEI021328;
	Sun, 20 Jul 2025 17:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sJpfivHUr8x
	AKKtayQLu5vacWUggO/pOUnlphHMBgns=; b=pYaoNyL+6kHpMsWv3r/s20EDwA0
	PG6J2CnjPrYi4j3z3nsjyC7VWNm2Xum+PX2PNGC/HJeshFofVg7l+eIpGxWH7+bE
	m6IfZuhkF8C0eKJdOYvjMKRNqAhr2qtCgdwCbOU9qfIEe735nIdr623F8Q0NoaUB
	6vX74HvQEgASZS1xnvRIcuEIUojvmLlLZEBSUbvqKJf8o6APSfT5nLh0v0NolCja
	mxhnnX8yTv23oXDncd2CiaRZlr9xl5FGRKDDaW7Le+3DOaeDKDvPS2c5Hx/gjAkB
	eYceu13skR9DH3H0h/pD1+hgLHiE0HZI2khYwQAtgtGBp749POKSSfVO9yg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tah0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:41:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHfuPt023006;
	Sun, 20 Jul 2025 17:41:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ek8mcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:41:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56KHfuHa023000;
	Sun, 20 Jul 2025 17:41:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56KHfsv8022998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:41:56 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 165115CD; Sun, 20 Jul 2025 23:02:18 +0530 (+0530)
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
Subject: [PATCH v7 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
Date: Sun, 20 Jul 2025 23:02:09 +0530
Message-Id: <20250720173215.3075576-4-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE3MCBTYWx0ZWRfX51g3TgGFuVso
 5UJvm/i/MeQBArRfJne/F8TCC9Tc7L8QnwoXDIDtUDpxlrgthFScC56u4F3LAa6IukOZS6z+Axm
 zePZmVa+scAsWjhyr76sBqbV9rK/XlibBiNCzFnd2fgUR4SJDhd8ZIhf8vh015f4t2BO4iOmq84
 YR5Q1b7emXvvXu0V6oHtMvkiKmuTbm7U5UzafIU82RIzjIaOo4G48VFSeIFA1kLMe76l0SaTQH4
 3d6kcTdCF/7PnX+oGnzZ6ikdFRescLs+QaQSRKBum/EPSUrk3Kazwv+8sPoJD/F+UUJQ1XhUB+a
 wAlT/1jg9dIxHjFPIcAjrUbkL7XfpHVeFiIRmiemN5EGZvKXPyp38k055M+qlZF/m6oUFrwEt9w
 pKy6rr6+4lFaVqCflo7CCgmRRFqNnIwvu2+hMOn5Y42pooFuR2a2QyYN81Em1SLa0AOU1QJm
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687d2a67 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZRTT_DJxv7dltqHrpccA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XSlNbHjAjn7P0ElBQ4pLUW-Axlva0l77
X-Proofpoint-ORIG-GUID: XSlNbHjAjn7P0ElBQ4pLUW-Axlva0l77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200170

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Manage clock settings for ADSP solution. On Existing ADSP bypass
solutions, the macro and dcodec GDSCs are enabled using power domains
in lpass-va-macro which is not applicable for ADSP based platform.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index dd549db6c841..3bfb0538dba2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -79,12 +79,25 @@ allOf:
         compatible:
           contains:
             const: qcom,sc7280-lpass-va-macro
+
     then:
-      properties:
-        clocks:
-          maxItems: 1
-        clock-names:
-          maxItems: 1
+      if:
+        required:
+          - power-domains
+      then:
+        properties:
+          clocks:
+            maxItems: 1
+          clock-names:
+            maxItems: 1
+      else:
+        properties:
+          clocks:
+            minItems: 3
+            maxItems: 3
+          clock-names:
+            minItems: 3
+            maxItems: 3
 
   - if:
       properties:
-- 
2.34.1


