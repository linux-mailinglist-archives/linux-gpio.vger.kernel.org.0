Return-Path: <linux-gpio+bounces-36008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLLWNptB+GnCrwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 08:50:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A24B9008
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 08:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC3503000FD8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 06:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64829AAEA;
	Mon,  4 May 2026 06:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gd+8XP1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1Jolmrb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99402194C95
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877399; cv=none; b=cYh35D1WxGLiHPB7FTrwOx2EzdBLje6YwnOTet5rcT2sJ3AzKLQqYuhsxlJFfPJoiiE4sCML+r1Dc714teNqCkGfLoeOqNN3O427y8NpimnhzlkXjY21L3CTVXhdme31X1579WNoaLCK9sMSMd/xxlOuuah5jI6x6FbwTEhmsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877399; c=relaxed/simple;
	bh=7RiyzX+zuh5Q9zvm7IyARRktAwMs7ElUM7tDz5Wv/bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ah33e/Xd2Pxp22s2DxifiofCJWoGoe8HRWhIiyg99dVCsE6IwnkLWKdM0DROReiUCLkA3NQ4biFSezGcAQomDT5nSJ8RZzcS1RJdKL1AL5yxjNMliKlyrieCr2OWmq+C73aC7jfx3EAHapScR1hnVXKTT4QsWLHlGCHEj/UDtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gd+8XP1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1Jolmrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DNl1098144
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 06:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O
	29Yv9hMw=; b=gd+8XP1QQwumofoAFeptFe3Xo8Gthg3QAhRJhRGuv5urXRPfIU7
	7VAo0VOgErV5RoAZTfIBWS9xuz8Gji7EP5jexQnOg1blTjDayRWkZRGIPga7hlwj
	yimQfTcEqZT5AoNp6/RPa2Up2N02JkMFAbHz/OaUVdiAMBTeGGcKch9NWVW+ye2l
	uCi99nP0zMdM76iOx2or+R57PW8CUQvPLYmDv70AU67tQLIGeFx3xPKHqmtqnTse
	s57k1QnxARNCVlZxK12Mxw83vxrvqOHnQWkVa4YU8GmZVvj5UMr0h9jEonnSNAec
	JAqyOVCcOUs1wAwLKXXzxT34b42W7Fuc9CQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg4nwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 06:49:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1742330a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 23:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777877385; x=1778482185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=A1Jolmrb1xTiwW6xpdsCL+ZAcsoo+8MIVg8NQm8G92zETOvnloJBPESwtYDynVBkdL
         8c3SaIFDVIHcXscBPXWM5Rm8JuLdV2YnWDQ33L95qyhdoiACp8O8n3/oFXEUyIMIBaGd
         PFTacgBwZIyS3jQHDppUy2tDaYZhoNqol8ww9P1G+IxVmo5eWe7Z/Dd51KkmkZBTC2RD
         i+88K0ixhcTsA4QDWSlrTolhDsFbmCTdNrAxFOJtvUCZIKgBSRRmHJSYhx+2Kk2Z9lMO
         ZZGB41gmc1l04kSOuljdeCADGR9Zv9mdnlRgyl5Y8bJgjgrEbZg/9T3kuO8Qp7gzNLOX
         KvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877385; x=1778482185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVsm+TRR/LSV+0LR5+0IS9wjC6UrD1tiA6O29Yv9hMw=;
        b=FYskCbgbxmv2pzYmKitPLsIc4/ju0cH1vTlpZ+8ly2VOVCfXBHvO6kg7ik0B/fE+Y/
         u/JZrhWJZGPVytG/oTdqQJGiZfoK3KweXXTEZgJ8EKAJ8k7vB7DPKZneDml1xNto3rjE
         hN6zpGmBsgyI69SNUBunnBVv2/POI44hidRfe5LG1J6FbkINa6+QYtdm2P5nXD8RVSVX
         mjHoP/Ce4gUJu43TSiSoBDr1SAbKLsNwKzor1mx8I9EKvPLweiM8HSgZPOA8xq+DFvr9
         Igq9/wOYzD7iDDl7lmUwpPi4vNDbKTEmtWOJpJbXvNpfowQb+UlvisVoWsXMRLPegXWk
         Er2g==
X-Forwarded-Encrypted: i=1; AFNElJ81mmB1+STK67J+KmRtdKUWo5I6p/4kb/NtacdosTptCJ3H92J3RBGa8HbpG1+h0Put42PcJB7nDDb8@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbpKg6xBg3HiqWbQ0FBP+g+TyE63xv6dfY+12Phgd6sBK17Br
	mp8p59dkYcnzc4gzFPkEWsXYiUZpDZsiHMtmmIVInupRsD5jKykycaWpreGkp9ITKNtHcKOQgiM
	wXjAtItHc37xnQjnQ9rzlWRsLH1qhMFi0prL88H1mGkEYM3fx/q3lnjWYXlkt+IyF
X-Gm-Gg: AeBDietyfAdvGbvj1Rsdnmy4UgXDhEtveG3ecdA6EfR8lT9oK+rdApPg0hDHQCZTa8E
	Cj0kR8XB+5HFyqqH3sTye+mnyCkWi4KJ5iZfkEekGi9BFI+yenLL1NlmDbknk4pkg8q0h8m/CsG
	jBPpznTKAeJ7YEgAvwqKJmbYDngOwxMejyVjfv63q5aA5ci39dwbjqOJaM8mhHIVyXowT0LQE3g
	UeybheeJ6gkzDHQ0TMid8IsizpCpocwqq6hSz32w43n+D7QEHVVj3XRbRmvFwvHJ/Nb7nEF8tgh
	0wSx6vBMYZ/ORc+Ob8rTiiis7MJ4zeWXYtta1J+EfEeumD/gCMrrzOMnk9vQogowIZhIphb9Nv+
	NTFOxTcYNfKDsNrspNMdnvXxgVS3XG1KPzJXixmmreVToEbmC0ysE3dywLwXwFP9/WQ==
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7117007637.4.1777877384594;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a26:b0:3a3:21db:8ef1 with SMTP id adf61e73a8af0-3a7f00dc3f9mr7116989637.4.1777877384060;
        Sun, 03 May 2026 23:49:44 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba73e1sm8470681a12.1.2026.05.03.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:49:43 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Mon,  4 May 2026 12:19:36 +0530
Message-Id: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f84194 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nYjtv9ulD0oZlCtruZkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FDSnLzVw_PXLTxhGLdCp4Uuma_cZliM6
X-Proofpoint-ORIG-GUID: FDSnLzVw_PXLTxhGLdCp4Uuma_cZliM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3MCBTYWx0ZWRfX3zb2HiGLtVWe
 m+oxSej00l2PWFmpq6t7X7peufCp0ZH3Ky0ppjRtETUTl3r10Pe22ic72JB1J0laTz2vPlRyVqp
 HRotXuZovTkx+ahXwYFinUZ4h6M9pBD3SoAM76gsPayRkYWFdXSfzoKrUBftQBySyHevy9WOGQe
 0ZfmlgJjgCmmhXNJW4h7gQ0HHrniIrLAuEBi1J2mJjMj6SmVQt41VHqM++1vwGhQp9b9HwL21Bh
 jouA6xPpY65Ob8fA4AJXdbiQffDF37dxcxRJqiqr0oACgyi3ZeuTqE3FKUgEDj3N9L7bpec+qAk
 nVagMlUVhALT2ZWET+/vnrS67AGBqRFqjZqEH9Agy9ghH4tNPSArtRRMqMRwd7N3M5yIVUYfhBz
 PpOEygSNH0AuupEdF3e+bz8PIH0RtxnCYzEGPGvtKus49ChJXYBoNmvq385zrAyMhijWVPi0x/X
 s8vlG6nGgRII0ISzaFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040070
X-Rspamd-Queue-Id: 6A1A24B9008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36008-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specific
and applies to all TLMM controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
schema duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v3:
Move the gpio-hog patternProperties for qcom,ipq4019-pinctrl.yaml to
qcom,tlmm-common.yaml.

Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v2:
https://lore.kernel.org/all/20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml   | 5 -----
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
index cc5de9f77680..de9a3e67e1bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
@@ -36,11 +36,6 @@ patternProperties:
             $ref: "#/$defs/qcom-ipq4019-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-ipq4019-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1


