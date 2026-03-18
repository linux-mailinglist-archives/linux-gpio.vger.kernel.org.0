Return-Path: <linux-gpio+bounces-33720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLhpI3NmumklWAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:46:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679C2B85A8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C86430AAE5D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B641386C20;
	Wed, 18 Mar 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqOuuOYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM8zfLDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01014386561
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823215; cv=none; b=gzjD6VwFewen6HwHGC7+wPAu8TuHEr+yfeEndSFJGN3d/TmETsE4YwlIvGTok9rKsptiqxGfEKX41s6noTCEighEEq8WsbpvJH4+oGjvSncRgTG1rM42y6PaBKds/IK+1JUu67LfOZgmqy9YmcQq4hcuX97CP168QxImet6/JcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823215; c=relaxed/simple;
	bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmvcZgx4/EgHT88ffyJGrJtBhMRPfmIYxKQX0/Rf79Pd92/hz/oiVFwuAbyzPHHQ7nR9Rk1ThZZOKvNmOkb96JV3QtqPx/pIGaXAY991Oc6SLqRR697QrPx9EoVuF/aUC1ckVgxh8vzcLMJPIdLrCe1Scr+zYBR7ATb6p8mqjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqOuuOYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM8zfLDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3eGkG1632371
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=; b=iqOuuOYlY08CPI0E
	nzwAzHwgJI8bmyVhe1ev8buDnoyexZMwzpKsGaGPT8oxFIz9DVRco+qheS0lfGOi
	ZFFN1FoDom8k+n4tiXxbbXjJ7FNHpQURnxCd1dCW43M0fVeXBXV5mHraA4CzGfkk
	MTmM3chqrjm9MSSWyP4eixQ/d1QXJz39VT/6EvheRQ5Wdqyr+W4pvY/ydC/7QevS
	mX2LyBG7KY0Mo/DJDsJJKB+rU8y5SQVyqpnaLMf8Nz4n1q9o3M2APp3TRDHG97MP
	EqFiwGOe729xYJkLYKBFwykgx6TAHwCAhS88S48N/P+YGjSwvjvlBs28JOO4VLz9
	+xRirA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapukamt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a07f4597aso3176465b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823212; x=1774428012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=SM8zfLDvYB55lOkdjqo47Gzagdmsj0X0UFzQwtNYlrXV6YspH+exuY/l1ZwEFwSBAL
         oUgMePntAWPRDnOF4YGoFVYR9pj0RHbR0v+2OcVaPUk3bA4+3Vjcrl1fTWBM6w6CdF+R
         vlVRMtySG+gkS2l2oPynigVLd1vAx8+YYWJRHFXy1voaq2Xk2Wt06F7yHetpzfy1Ilx9
         JGSB4tCrFkDaCa52+mh3Tl9v8upOsl/cqwh+/Dnvig6XJGbxSK24+dcds+tLnTOneCvD
         hj+zlrxaWcfJmKelo8KaGHw+rM6aQ0oUC3EwIVFt/mE2pUGo3k5dY/NFnrZ7cElI09nT
         76Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823212; x=1774428012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=Brt3hCiyG6lWwSviAEO6zBAts8EYvG1ryCNj3zPsgjt8RUs7uiFUlpAtoOmbJmIgKu
         bMe57+duV5I0h1OG9C00bEX26cGUDDbQXaUYBHiWqUCfHF6CchO0tFD+RdOzDSqgcIWR
         CfQhh9a3UE3Kd2luyRv/RbGchwC+OBH0WK3bZzSHstCnQv6E/cssLQcAZAYX2AtJYK1r
         fQDjgBSmP0N12eLtFlR04v8j/0iOOthRCndpPqRBmYqe2g4daN50/U6IK2oK0d/HkfeV
         OGfx7HwVH7r5UO+GKH+UDO/uSr9b4mJw6e5MD0C0LCHi3E3uut5jEuwDWqNxbKo4t5Hk
         Gwxw==
X-Forwarded-Encrypted: i=1; AJvYcCX8uB6EjNySanqo0qeZAIHnfLtRTul9BikodKYzn7+85qmbOli0b/A47DLuWDV5ICQwxEq5ELBfj8qs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zZSNjXbdc65Ig4EPePCy0qDE1xUBuouXUqEjOO3CtxNhjqWm
	Y5p2gPiCYRPQt6i/nbnW6b4Tr0LYoXq+N5bsS2hZSp8zWqZYKsl5BbBg/rIXzVzi9n6pvugiARh
	ltW6Ly0NXZDa76pUIhI12sM+3z2FtgAhgWBuMIaAeTBq+N0O/1krJJz3f4lp/QkrgD/GVDkKN
X-Gm-Gg: ATEYQzz1PlFkwfXxxpY9ijzruicTS+HOy5MuBXtMK629fuGlFjO7MESylEzIaiB8jN5
	u5Dc+hO9TSPfIvkSUnUu3wMwz8sU0T8DvHo850bjIpF6b1oOQ1XS3agpsHJnfyfzxhuY69fq0mO
	e7+QSCnIAMz9Y3TLhZaQDjf8w+peLCd1TA+7/MiRSVUTiAn2mz2w9/hOLZRZBDlwiXIyHxv+gPf
	GpR4LfD/ZTuK9MpoR1yHVEC3Fv5cQP/aUEC2S2rb4N+brhEgU6IylvWE4UkLc5J4I+9mnUvwkmu
	WgNVkPlCBRbJkphLyRaP5i4HDp58CC5MOqNm3rvy+kYPQ4VgM5HnAVrjCR6H7hn7MeZLxiIicfC
	mFWZXKB7YuRyOTWynrvMZU09uOxQdQMRH/Oj8HqVFdP/fPZhqMTW6WXzJCqDq+6HuJ4aDOMiCSr
	pPTBJK+pgMVwjfGZQwtxM/FPzsjqZWPCSQS82ge3ViywJSMR/575mpXK0f
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323118b3a.59.1773823211875;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323083b3a.59.1773823211364;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:45 +0530
Subject: [PATCH v2 3/6] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-3-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=949;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
 b=GQupGMUhdSmoRswbGDv/Usp5qjiQYBR2bY9062OSCHWmkCFsZCKKdCus3Lu1RBG9LweDS2FgT
 9+pB2wFzxRlDTipe1PlHgpEwLg4i3CA4SmXzSbReWC42m/xYIPzJNHv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69ba64ed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7cFofPlDN1olvp7CM7gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX/BR6k/70/g6F
 O5TQbvs6q3AYa4adAKR6gKD/21+xl+IxJGinUwQyQEG2kOB4yKHAwcMWJw8y+llZpuFtS/0NoAi
 ONFP3uwNPZlj6BQwgLelZ3rZbWhR/3R3SSdCC5uyuqx+avXuMaXrzAget9e/DJDHMQnLbRkvT9r
 AV1iCWNsv6H6BP5h2x15Ek6g76Bo3+9Q1R7KVYWolREKOPM/PYwPAmfTm4nWBdG/Z84rESPDPGO
 Iv0hkDVB273JOE5Fni/L5wVYwYQcP7wzanL7eCI2yI5bY5irou1XerfuGR3j0lu6Z/U+rucUn6s
 tj2LYolJnMVwPXi5Vc5wJjdJea36IlZMAS7axDrRt3ybuQqgQSD0oHltmOXx6g9mWrC7oG2Lb2y
 RvNUYn3iw3h8pkgOeccJqqkL1STv5sseGOr6bmkX9Rcv3/EfGasFP/3ecjeS/r2JeJM1xtvwiTJ
 QIFnPwuwnvG6TlQfKZg==
X-Proofpoint-GUID: zgZjupDwktTrsX2FbDxBfi1RKDGIaS1M
X-Proofpoint-ORIG-GUID: zgZjupDwktTrsX2FbDxBfi1RKDGIaS1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33720-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3679C2B85A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d853509b7cd37f07f02473cf6bf71..7a36da412ab82b425479fbf6d81293f24e66ea36 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -309,6 +309,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1


