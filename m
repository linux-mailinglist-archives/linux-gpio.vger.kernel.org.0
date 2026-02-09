Return-Path: <linux-gpio+bounces-31531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGMuF0jliWnpDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:46:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7410FDE1
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 14:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCB61300877D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 13:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70CE3793BC;
	Mon,  9 Feb 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSA90deV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iB4fvRAE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA202040B6
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644802; cv=none; b=krI0K6jR8gpkI9Y3nfK33yNKZNUP3VSjmu093/Z5LeGSgJWS2/GnspUOLWsj8PnrAShPsog2G0YJE9aTpktZ8l+NrJi7fLRiZvsM/Kmhop9qp/q5Q9jArbLImQ2DXZTIfPwtmXzsNHbJqwySPckP0jALYB9jZBhKNba3uLdF2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644802; c=relaxed/simple;
	bh=fnOQnLODNQIhr6CssUQwPBrgabH81UaqvBrFTwQDb/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YNg8l/2aq5mtHQuCsd7VYyuxOxCrWuH2Dcsh4THfJYtFYDmltjFijGR7qcGouUTEeiXkN7/4qcjJv/OmMdBPKgf4TsQ0Ix+uhjLac0qlPSDVYZBs+DAletnNSYLfQtX4DbyuCgjylvtvCAiCThcst4AwLQ3Y1ilrl3nHka9WZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSA90deV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iB4fvRAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DGcaq3081553
	for <linux-gpio@vger.kernel.org>; Mon, 9 Feb 2026 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2cl
	OaWbtEU4=; b=KSA90deVh4vEJV+NKnwqlXPGLFidRB91KI0OhFDwpKdOQ8tICOc
	5fo+vOIpLr3ouf7FH2tx97UeL5J7eUlx1K/poinN0otIsk1Tax4GPz24ZCDkDaN4
	3QnEvUIYSYQorpvlI/bkkSqL9j6a5+fYyrlEqENDUQTD/04nrsbxIT9LHmveBh4F
	jawfI0Vqk/Veu+8g/0Fx+TN/cnJLjKzf6zuhXLfMELbRnfWrIiiOoPK4WV2MpGex
	wWbwxIQcIxvcb9fggNjO4ODcwA1QVa2x3UGeFhwZdHEg49VBgbS35maM3bfXUw5/
	KOYYJ2ZbY4aYq73Tj/eydaYtr3xreGukf8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7gau8317-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 13:46:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bf10ec2aso2110792a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770644800; x=1771249600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2clOaWbtEU4=;
        b=iB4fvRAEcv/2qZI6QGrEqlLo+kYL6KqE0FzpUpc8YyT15V4c6ZZzjCM/Yn27vbA4zX
         jRYUpqtA4w9TbvCC+kcYvjA14PgdzuHeGlPXEnmgphzYnDSU4FzxSzW5Q+fEZtAfmhIK
         0bGk2TNR+JwjtUiPJiSfYdGWV9VkQ5MFq726YOwLLYmbxlW4YfwlTW0or5iGcbP+DT5D
         gvM3AmAu97WHx5krsyw9uwgReuxhshg+6K4/rq18s7V32iNgl+vkovUJIhx001sSpWqr
         6YtjtHQUedTjtYz4AuVHOBY8q1YgK1F1G3fJs2/zqYkGtj9EkoYzIONLj2TtguLt1VXg
         z2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770644800; x=1771249600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOk6xSYzwz58WXyx+KwiUtL/RsTQgy5B2clOaWbtEU4=;
        b=Tgt1dJicTnGW6WyNeHEL2SGou6DCZ/UPCwx2pjTjWQkJCsS0h3vMGQ/tVihyVKUJWl
         mYuvcO8/WplZGVFQ71ZyVZ87X29BaWV0ZpqQ88fH+Dk0KEMWWCLMLTys9buzgxOsKyFC
         90S6CybQ7L/2WnJzAZ91J/Rfm7lHg/y/6xjUe9/FTzp/WJLzzyclu+7TKaGi+MtHpIla
         WUZDrmcJu+qd/GKu+VXyjqcwgM47gYekd5+DifiqHXJiHwYs4rt3m79ORWERlIvBKbg2
         xgeyTJgmvdAD9UNQo3oT9hZH6RlJEN9rOTZZMizACC3c1lF0LMsNE3Li2W9CqU5erAUL
         7jIw==
X-Forwarded-Encrypted: i=1; AJvYcCXGN+Mnw4Z7mWEQ3LKBWFXzgCruQUe5SkdRHUHTvWOFE7z8Mvr+VyGLcb7R7eSo6gzxGdcd2ihjmQm8@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmnzm/4DMoSW8a8EzQsfSX1CRwrx6h5cd8sMutAEE8GGbwcW8
	vERb5C45H7/Qi2X05etbrNyut/3fnAcuOw6udE5BN35v3xuBtXv0qxrKIh7YkNqYDALUEpEtuOu
	dmLwkX45cniF51TmLy5WfA27pZZFJPctvpjAcXoWT5a9CfAzSQzDsO+iaCXtU0b5D
X-Gm-Gg: AZuq6aJXj7nwQFTy3P++y1eYnUP7g+4g/Kp7TqMPr4cyDMr032ZkDoYP3VDmY5WRvFV
	NYeyOOTtKR1onwOeiN2ABnkI6qgBQZs2yX9UBfYl86lq6Ef7n8fV9XZIfr0k7HJzE6l6K0xkPKq
	arSNdu2b1aWSdujLZUzpTOTvJlQL8hKqCcE9NjCnJGMig2livEYkYeilHQe6f+9po1V2quozgGM
	ZuFGVBy4Gb4f94fhfMw3IvqYjHR2Tx26qW9BuEc4XqHkvdZSfAKuFWnIS0NVYP7+HQIf1NOvs5V
	BRNNU4kYln4NEVNNEsPw06HVVbJRxfFlIROXd4XeOqK+LFNgCVROk2FAXm3FnBH/O2ffKu6Kiyp
	Qelbfg3Sy2s5gysjp9SRgK+Mg5I/egpUG5VaeaP6orsdgtLEZYa24U+CaAA==
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr11289315a91.12.1770644800263;
        Mon, 09 Feb 2026 05:46:40 -0800 (PST)
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr11289289a91.12.1770644799772;
        Mon, 09 Feb 2026 05:46:39 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3561f4e0dffsm8238024a91.11.2026.02.09.05.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:46:39 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl: Add SA8775P and QCS8300 pinctrl
Date: Mon,  9 Feb 2026 19:15:29 +0530
Message-Id: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: asSQ4etFrbbwY7lw_dcyth2n1FdmUPJR
X-Authority-Analysis: v=2.4 cv=eP4eTXp1 c=1 sm=1 tr=0 ts=6989e541 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a0HnErEHd3o58QWwnPEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: asSQ4etFrbbwY7lw_dcyth2n1FdmUPJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExNiBTYWx0ZWRfXyfvw9VWfkQFf
 N6ykb29uS13Gt7NKtYrZ49mvd0pmlqs6818yWfmgvMq25dWCcUYdYqwBMl6xxCcCSP3p/20hlQq
 TMrX0uhot+b7/Gy3uYRsoi7s/3HHaLwOH6sc367IAEbObe/XZJExnqZwf5XP3TcfGHwQK9IuIpo
 pvxYDUgloXMc93dZGdKK4yvPO78AmMvv5TtbicLRdEGqnjfwsvWWDLYO6OsVCa5J9+x7PKC31R3
 BxmAcQnUWBTas/sa9GH9jm1vJpWKFVgQMe0XEyi3+QFrwCDDrzw5IkO+4t9j86nFdxnHDwE2rDC
 r0iFPXV1AGBJ2cTTCMH1Hhh7vqLL4Ww4cBjzhr5zSuHR5VncUyoH8WO4kHzqgiRHR6qqYVAXmD4
 Vy9PG1BqpWWTjh5MKUK38cFGTO86czch1wW7Dm1NsQOg2zV3h4l20o9vUVYOVKdxG7aty3jvp3m
 Pgr8YmoAR1XTNMtPaZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31531-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6B7410FDE1
X-Rspamd-Action: no action

Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
pin controller, fully compatible with previous SM8450 generation
(same amount of pins and functions).

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
changes in [v4]:
 - Fixed dt-binding errors reported by Rob.
 - Link to V3: https://lore.kernel.org/all/176951636220.1230755.4335541729269457450.robh@kernel.org/

changes in [v3]:
 - Removed the duplicate driver code patch as suggested by Krzysztof.
 - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
 - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
 - Fixed dt-binding errors reported by Krzysztof and Rob.
 - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
 - Documented Monaco compatible as suggested by Konrad.
 - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index e7565592d..541c1c54d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -15,7 +15,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm8450-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8450-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcs8300-lpass-lpi-pinctrl
+              - qcom,sa8775p-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl
 
   reg:
     items:
-- 
2.34.1


