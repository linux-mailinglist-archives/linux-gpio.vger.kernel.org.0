Return-Path: <linux-gpio+bounces-38365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c87xJ9fLK2qxFAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 11:05:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A132C6780CA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 11:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WpIbUnOf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g6gWjD92;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38365-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38365-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D25F300E15A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 09:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9882735F615;
	Fri, 12 Jun 2026 09:04:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2A3364059
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 09:04:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255090; cv=none; b=mEDctO8GHXAvKn4uyu/QoVjVInjLSc+EFXjfhyTyVB93lPBEV53XHx2FnhpMKQIgXA0/Di7pl4VQzO29/ym2IrgHPjPwBsmkqiSmntUYwxc906ij3acjASmwtRAGOCh2aP98wFaJM34j68o0bU+Mf+JFGRpcDcSIGHOKRxrtbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255090; c=relaxed/simple;
	bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQHfvINTd2WmKqSB/Ln26NpkSdtKYst7Soved+Bzem+4y+ShrLNPZ4vyxwYgpcDlc6twjH0CtJCZfK64A0Kr4DB6L5d5NVycQKkW9n13/3vW1oDX4JWjKb8hvGbZULjtP4fghogOAz+MrDqi2ZfMZA+8y+eqd/FdjVJwLRW56tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpIbUnOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6gWjD92; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C6V62534717
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5
	GRIPrZQM=; b=WpIbUnOfeDeeqW3Geih9HJ9pQmNp1TjaLLoQsCLmVRDcKcwAeIK
	Sp7lxq8il+vBlTPbPLzp75Cy6PAGqccs3l2IRPFm+6fX41SmlJPXcuMvzFwfqcwp
	zuG8OaX8AcIPs7ON8eWVVqvHT+ysMm+IZeyej6PQXU2zcexL+Tibz2T9wQLqn5oC
	mno98Gfu+Qa0vCXQOtvrg3JGvsBn2vDpaJszTXe0JZLq4hmrnFLo84qB5bLMV9iD
	djy1pd4a7rGXDy8j44Dn9uKiuK2Tw7Nr9Rz5+0R8xkwMoEw1BKnMOgcd9fxnIspb
	VbGS/fYXBEzY7nbw+dEZ1dZQMblNBaWuF/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehbbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 09:04:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517d766e05aso16481211cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255087; x=1781859887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=g6gWjD920JXUPSIY4eKBhQ4UmpMDAepZKhKzfe0rH9bkJHfBMTH20J9i76svJSK5om
         rIO7Oa2hWaAcUBSw+R9MWQYk8oE4KqMjkxTpH4j4ysRZD78DB3OLevaXXJw19/tItFRh
         oPlXmUB83O13Wjtt5mPJI0VBPE46AAnIHtSbmqBCCBYJkc+T1Y/cyf6yTgKD5d363Ug3
         3nuvXFfVPGvnT/fLAubTOARxBwljc5QQJM88fG1HYysGbamBc2uFfflvEOtQ4C+2t7kw
         8qn1kBm6uuDjD8hlVuIyYpI0LODPpvX/KqISJVec55OAMBRs/QqAhSMCd5VtMyk1tLMi
         t0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255087; x=1781859887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLa9vOH6AETk8tl4PRPIwLQPPyC432A2nz5GRIPrZQM=;
        b=no1NXu7leDLDk/FhOyT0MioMqGRopaY1MZKcRgv23FtocjfmlnKBrNj7v5OcZuH6XO
         MSJ9VdVAEjtNohaiWZWEaV8ddRG93xAkE+ODEFx1nNMIfRanQNhpwuLzYMy9XETJ45Pm
         GoeGk5ymwCcgrmjTJmjVnjeuVsYsBcVdVem051Wj54Xw6Lw+awzDdrZqLl39vgFJ203t
         iW0MFhTL/Fg+8/gvWt2tecTxCmXhWJ3TOHn6HJrrhW7mX77b/M3c8LsXgEoK3HSw0liJ
         BLbUbZTgwjKb52LN3juSAHj5pMmXQ3DMo7moFbkVGOjSQiJZ0c3k3Z3YciPZSiFSC+SS
         VzTw==
X-Forwarded-Encrypted: i=1; AFNElJ/XJPhxp+WLdol/MUwXm84C9T4AYd5soMYDpGjhVKc1zThvlhoyHenM+WoZJD+U3+vp6pmC4NxK7X6B@vger.kernel.org
X-Gm-Message-State: AOJu0YzlthcR9GEhrJnqkd33nWZaB0jjC2D51k93Tn88bCEvQGK9sdtA
	f/5NHMLCJpPddBSxqyalEXib8EdwumFLFUddUMCTAbq+sqLXGVOe01tb5tUKMbqvDKBuep1RE6T
	pBn7nkdN2LiGVjan7IlMqZJUuSnx6muI8QQZFABOmDEp3CgxFBVP0vF0bo30ZWPg6FfKHPqii
X-Gm-Gg: Acq92OExBbGUxNlLfWan8ALlCl9Wbz6InWTb6wTrD5gpYRmV+f+lGtO7zmL5VPNRTeP
	FupwhZqD0GTNrFvkHxA0r7iCriq+J6SKkzwaR+TUrL+1hSlgErYmmw3yL+9bReqwWQZUEhz1vFL
	Bqn7BrQyFfm/d1kmUMVKlGj3yVPW4LE7NnLxgdiKlsKczXkiRhuQoOuhGPwA1KfV9cgeD0s/il+
	6h1GcqVNOH1HKRtnSGpdIu8bkaqoEntmO3e5shsUowXuR9XZd/Aqdoa4FDguPnpdXoq4Hlx+LXv
	ITQnE+q5HrMVns52HZS543qy3YQX/rLry5xM0h5YFWIX7o2SVvHAi94ci9jQ2bfZdRzEuXgC53M
	Ad4tDV4kc86AmBICdNcTyf12MtFNyerj6NFe3EQ==
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26573441cf.15.1781255087106;
        Fri, 12 Jun 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr26572851cf.15.1781255086480;
        Fri, 12 Jun 2026 02:04:46 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c8f49sm56318085e9.6.2026.06.12.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:04:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Fri, 12 Jun 2026 11:04:27 +0200
Message-ID: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=obLsNbstVPAwrtem9SkKGZENOSohwZyhu6y8SUHNiTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqK8uab2y+ctPk+un5YikehDDsB11CXdCu9AHV7
 ttFg7khI7uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaivLmgAKCRDBN2bmhouD
 1wPID/4pss+s8qe5a0hilYLeffX2/W9AwAtqtxnHiDHapqYw/aJ/fGNrtbZX7ooBFT6X75j8XT6
 2+qP85fAlmJXT2XGPP13H2uGBGb3uLMCJwJXrV2Aik6J1ZitY3H+KF8N5t2xWTYNnjUxjJYKw9R
 o2N5h4nqpXyiafdMvFv+4kXwIuERwGmktWPImMj3yCkskTTWuSog3PMPy3p1n+zygAQe60Yk0q6
 a8H5mxSjRI7yyeg15Jh9gLjbnYo3plwiPObhHoqtZW32u4FATaATRMFojyVLbGtA90oTdftzg3q
 Ga3vtl39F1uVnMP76gOAsgS6AO21qDy54UOa3p+OQU7N8opp193eifToHcizecmDGTavTxR3CPK
 fVXHbSl92OS61os9+wSyldx9S9CNBeBT9wtCtuUDshpW8qMPC7WXPnUoY4+/ZpYu4f3syAWHQNB
 0dIW/Ly/0V4WO079GR5fUuAxzjMGI6BN6UE5IGLA8ZqFpRt3PFfdHKAr++euFGBQzYytIjUMu80
 bVYlspZJXECHtPmGvmcBrqg5fmY/jdElQn7hnRew6AQ+aAa+PuMpHynQvLVAKDIluhl0KhywXRf
 X2q+tivndzZfNgin/gfbtRcBKF8mqA50hiHRMrT2wa17Wj8q4XtgwU+ptqAj6PGxV6uIpncw2sy 1ox63wRvY6pAkMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bcbaf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Bpo9OX9RG45pMRazLfIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gOSsTgUooAdhi-U9b-R7aaO1-MvR_KE6
X-Proofpoint-GUID: gOSsTgUooAdhi-U9b-R7aaO1-MvR_KE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfX+nXcFFfpYvs+
 mqkoS2sbsifj2XA5afdvvsZN6UzBCozvsoT+Jtd3jjlXtMw+vyxDq6nmgzwBfpnyX9FnQzVAmHc
 ufoVhe6vsgeQ/KuP9i2z9tlUzxYsXGj8Ehj4gWuRHAX+UPsOanzkVEn1a24m6tlQDLd3mAxfpeh
 qNt8rF7qvb4Eip41mYh0o7ZlbnqwtFMZ8E2BRt/LH075EJGjtHu1B7HoDzysNqf9U/zP3XAsQ+9
 cQDwUVsqt1HC52Zz5oGcNhUMG4AFuJBiIT3ZPjgRtthhI8eTZdDmXmeZpx2WJoq0s+yB+Efpp26
 NyeiGtHM3sbHLYMBdulJ0BJ+04RiaAbMVlc3oczy8uCvRSNinsuO+nzvmlMLbrniM028nNsbJgo
 gqk1Aiail6pC2CREM9JqNi1g7b8mr5kGxqgqhja4mgi4IDTk63/gaa/oK4SfV6hvmUfwFUKYyKa
 kJ0F+4D4YXyo7YMRkMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MSBTYWx0ZWRfX1kI6JCUHmyOA
 SqWoBvBDn8rLgb/PUaL6eNfjRhmxxBm7KMsIxzN3oGjEYe+aO45d8Tw5WzXBvLvFxT2FQqRW9PK
 PAQzwiuzqsEPvWSYwc//CdMqu/V9W5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38365-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A132C6780CA

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
   previous version

Changes in v2:
1. Add fallback compatible.
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
 1 file changed, 78 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..5ecf5da3d100 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -15,79 +15,84 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm2250-gpio
-          - qcom,pm660-gpio
-          - qcom,pm660l-gpio
-          - qcom,pm6125-gpio
-          - qcom,pm6150-gpio
-          - qcom,pm6150l-gpio
-          - qcom,pm6350-gpio
-          - qcom,pm6450-gpio
-          - qcom,pm7250b-gpio
-          - qcom,pm7325-gpio
-          - qcom,pm7550-gpio
-          - qcom,pm7550ba-gpio
-          - qcom,pm8005-gpio
-          - qcom,pm8018-gpio
-          - qcom,pm8019-gpio
-          - qcom,pm8038-gpio
-          - qcom,pm8058-gpio
-          - qcom,pm8150-gpio
-          - qcom,pm8150b-gpio
-          - qcom,pm8150l-gpio
-          - qcom,pm8226-gpio
-          - qcom,pm8350-gpio
-          - qcom,pm8350b-gpio
-          - qcom,pm8350c-gpio
-          - qcom,pm8450-gpio
-          - qcom,pm8550-gpio
-          - qcom,pm8550b-gpio
-          - qcom,pm8550ve-gpio
-          - qcom,pm8550vs-gpio
-          - qcom,pm8916-gpio
-          - qcom,pm8917-gpio
-          - qcom,pm8921-gpio
-          - qcom,pm8937-gpio
-          - qcom,pm8941-gpio
-          - qcom,pm8950-gpio
-          - qcom,pm8953-gpio
-          - qcom,pm8994-gpio
-          - qcom,pm8998-gpio
-          - qcom,pma8084-gpio
-          - qcom,pmc8180-gpio
-          - qcom,pmc8180c-gpio
-          - qcom,pmc8380-gpio
-          - qcom,pmcx0102-gpio
-          - qcom,pmd8028-gpio
-          - qcom,pmh0101-gpio
-          - qcom,pmh0104-gpio
-          - qcom,pmh0110-gpio
-          - qcom,pmi632-gpio
-          - qcom,pmi8950-gpio
-          - qcom,pmi8994-gpio
-          - qcom,pmi8998-gpio
-          - qcom,pmih0108-gpio
-          - qcom,pmiv0104-gpio
-          - qcom,pmk8350-gpio
-          - qcom,pmk8550-gpio
-          - qcom,pmk8850-gpio
-          - qcom,pmm8155au-gpio
-          - qcom,pmm8654au-gpio
-          - qcom,pmp8074-gpio
-          - qcom,pmr735a-gpio
-          - qcom,pmr735b-gpio
-          - qcom,pmr735d-gpio
-          - qcom,pms405-gpio
-          - qcom,pmx55-gpio
-          - qcom,pmx65-gpio
-          - qcom,pmx75-gpio
-          - qcom,pmxr2230-gpio
-
-      - enum:
-          - qcom,spmi-gpio
-          - qcom,ssbi-gpio
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm2250-gpio
+              - qcom,pm660-gpio
+              - qcom,pm660l-gpio
+              - qcom,pm6125-gpio
+              - qcom,pm6150-gpio
+              - qcom,pm6150l-gpio
+              - qcom,pm6350-gpio
+              - qcom,pm6450-gpio
+              - qcom,pm7250b-gpio
+              - qcom,pm7325-gpio
+              - qcom,pm7550-gpio
+              - qcom,pm7550ba-gpio
+              - qcom,pm8005-gpio
+              - qcom,pm8018-gpio
+              - qcom,pm8019-gpio
+              - qcom,pm8038-gpio
+              - qcom,pm8058-gpio
+              - qcom,pm8150-gpio
+              - qcom,pm8150b-gpio
+              - qcom,pm8150l-gpio
+              - qcom,pm8226-gpio
+              - qcom,pm8350-gpio
+              - qcom,pm8350b-gpio
+              - qcom,pm8350c-gpio
+              - qcom,pm8450-gpio
+              - qcom,pm8550-gpio
+              - qcom,pm8550b-gpio
+              - qcom,pm8550ve-gpio
+              - qcom,pm8550vs-gpio
+              - qcom,pm8916-gpio
+              - qcom,pm8917-gpio
+              - qcom,pm8921-gpio
+              - qcom,pm8937-gpio
+              - qcom,pm8941-gpio
+              - qcom,pm8950-gpio
+              - qcom,pm8953-gpio
+              - qcom,pm8994-gpio
+              - qcom,pm8998-gpio
+              - qcom,pma8084-gpio
+              - qcom,pmc8180-gpio
+              - qcom,pmc8180c-gpio
+              - qcom,pmc8380-gpio
+              - qcom,pmcx0102-gpio
+              - qcom,pmd8028-gpio
+              - qcom,pmh0101-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmh0110-gpio
+              - qcom,pmi632-gpio
+              - qcom,pmi8950-gpio
+              - qcom,pmi8994-gpio
+              - qcom,pmi8998-gpio
+              - qcom,pmih0108-gpio
+              - qcom,pmiv0104-gpio
+              - qcom,pmk8350-gpio
+              - qcom,pmk8550-gpio
+              - qcom,pmk8850-gpio
+              - qcom,pmm8155au-gpio
+              - qcom,pmm8654au-gpio
+              - qcom,pmp8074-gpio
+              - qcom,pmr735a-gpio
+              - qcom,pmr735b-gpio
+              - qcom,pmr735d-gpio
+              - qcom,pms405-gpio
+              - qcom,pmx55-gpio
+              - qcom,pmx65-gpio
+              - qcom,pmx75-gpio
+              - qcom,pmxr2230-gpio
+          - enum:
+              - qcom,spmi-gpio
+              - qcom,ssbi-gpio
+      - items:
+          - enum:
+              - qcom,pmk7750-gpio
+          - const: qcom,pmk8550-gpio
+          - const: qcom,spmi-gpio
 
   reg:
     maxItems: 1
-- 
2.53.0


