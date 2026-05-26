Return-Path: <linux-gpio+bounces-37528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBVANNl9FWqtWAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:02:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B05D4948
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256FD32EB2BB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE073E0C59;
	Tue, 26 May 2026 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL8oMREo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbTT8Aq7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC0A3DE450
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792938; cv=none; b=NkngutWJkIXAYWc/9GXdtGQn6TGKFoU14R9lUMxoVdV57HUAOM8eySu8zNRDYQVXiacagV3yI1eFQ/XP3pcbO1KUWAA6eE8ySp0inmhdxSH6I3eXDEzZXUMDjtF5XRGz7k2MMhBmBEoU/qC0dMkfcpxD2xZ8KFIS2wX4eRXa4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792938; c=relaxed/simple;
	bh=ncSgpINQfSR2H8FOkzLU5xcKeqgvoMaxPZDS0ayLT68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=draK8eAi9X+uyscQ1B+5UELBZaAheHdOOvH5FfeSyeBcyPQaW1ClcSzyrX0tLaNIkr9tIL7/vC3X0uDxpPYasKgnQHahD2n7bHziQrzUn3y1LtUQ9X2ptlYPCqikrGw5mqf+47SxvITruNNCtlQlUbwxaUMjYJub5UpAwMrxGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL8oMREo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbTT8Aq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8u7CC3658429
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=; b=mL8oMREoyvmmZW1Y
	YihlzssSVoCLJoF566z94HdRVPH9a14hgG2vjwhrBi3c+WQltzOV6tvaiy2CEO0X
	j5b2u2i/gavoNLmE8i28ooBtO+DaeJ0fuTe+pxh6s+w1tsbx5izgbTv+vK6sl0qy
	LRqg8WrX3CsYM5xcrEpXWtAgbcXePAxo4nG6mFSx4nH7OqZf2IJhTF7tqNdeMJpM
	NHUjMTSnyqnNq6mFHtXjexaqP+j8w3yGaKD3SVd4jBwML98DzmKYafyOLUH+j7Tn
	jgdtmmMPP8M2KtyZGmmxPBQC8IkS2aRdAzL08xHaXgkiZClcgs/9P3sP2QwXaSL+
	KxRAYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbekg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so72420315ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792935; x=1780397735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=;
        b=ZbTT8Aq7mpZySPzVTqmrJISDRH1Bkafkm3qVrjLRnXDj8T6pkdyphL8PB60YfrEBpu
         uPCqp0lZwgJl0Klnco1MVyGr/jGNFFm5I76Aw1n0VwgGUKGQHHk19OzcVEROVLs5Vfbl
         YJztbXOaBSQKAhgm+HX3JAXJ8qAQ+4yyK41JGjgVMz+JlF7zy8Uuk/68CRmNpx+i5TN/
         R6QbcltnBMU4NnHCfEHrsc7uvgoBYu8GoEgpRFn2N4cPjSyoc5jbxZqSXYR/hq8Vc3BA
         z7pH1rhO8AnFf649Ps64gXBZg9/gk9LKtZAmggnObIYiztOF2BHprkT6sjrKUE0Z1fYZ
         gjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792935; x=1780397735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W4+c6C0We7WiClnVljsopbVmn8vy7siK39IMH7Gy/MA=;
        b=YdsT7PSjzb+aK87kVl57lOfK44EvjM0dT8nojhfRz9e7KeIYQI1iY3JVrbAtt8oMN/
         DR/+4aefn8UYaVvyuXz70oybu8XXycDjZrbb6vWJu25hVPFHo+iKo1ZmHILFIAOqzD9X
         a0Nfiqtld0FpiDPYMhtAEnwrra8ReMeJnZmX+KqCrxMUW3Hn6+pKbJRJ6aOK7gZYlO6Z
         +axerUhrMNkU5Xfih/YSn0SQ+l+fbiU6l7C2JpxhhIWoP/XRHVhT6o7I/K6x42TSiNfc
         /maUpFMS2152Nmx8t8t+r1lz5MXcwP+YJkHGhOW5VKpCBq3NDxE413pdM/1daTR0JD/K
         on3w==
X-Forwarded-Encrypted: i=1; AFNElJ/l199hHHy6hDMA9n6JwYZDo47cIj4H9yrauAFdAIWiIix6X8dzRE/JUuqjB3cTO3jWlKMsRDt20IMS@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNcuHVsjMLswVTV+I3k1RiNr+6ijdjYO4dQZ39PU4Q2KtxtjU
	78q8JVQ8IgBL85QcbHQyqDQH9MOflQWUDi0qtd8CNi1RNcvEF1uN+XGDhn31gdhXdCWcIgLJSGp
	6i9/sJSqmVDZK56NaECDCWlYsukIRHn8M7TA2Cs+iHHKvyyfr76+U1ds9jH9Yxzx4
X-Gm-Gg: Acq92OHV9a4ZxJlcZij6htG1V4kGhfYrzFrXVjOIlHiDkJPuYI/bJkLCyK4n/8q9bnB
	6roOvTZCxLTgskBr71jODWEg2EXF4IBN35jPTjIy7BLCx+ECu+pjqTTnJ9+uyHXWdyjDsOwGoE+
	FR6AgSEXua7wN1aebK7mZaZEcS9yO0yINxnYjU099n0xRA/6Pz6pCpXW2GsgQ6HRkt1bIrLh7ud
	XbvCLTKE6l8+BuuYfS996rvWoHuMm0G3DV1EabXxiy/ry3AgadKeKNNNVoUX99p2zWSzVAGuMIB
	hjBqtF/geyLO6f/FncmVMJKosfJxRFqyRBC1NY5y4fUGl0koX+NocAHPGqZ30I+PaDena5wrtmE
	Zj9jh5V8PW6DLMzYR2yry637Gz37In6q2qUkBxBnHvulc0N9Rpw==
X-Received: by 2002:a17:903:15c3:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2beb035757amr226478865ad.13.1779792935248;
        Tue, 26 May 2026 03:55:35 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2bd:936c:8155 with SMTP id d9443c01a7336-2beb035757amr226478455ad.13.1779792934761;
        Tue, 26 May 2026 03:55:34 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:34 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:44 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-8-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1102;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ncSgpINQfSR2H8FOkzLU5xcKeqgvoMaxPZDS0ayLT68=;
 b=qvVuCgKBGg7BU+5jSWLORcD0ZIAWBsGoQwTu9pb9si1pvIXRCq5xViTBulIfWelod82FCOxHU
 z+JVxC13lkfCcfcCf+dNFS0UnyjCH17beal+ucoCuwarto3J3iGBfFS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a157c28 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: pmYcxs3c3_cvCovRBYWcyE3tgPu3KfQ8
X-Proofpoint-ORIG-GUID: pmYcxs3c3_cvCovRBYWcyE3tgPu3KfQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX4Soq8bCBKm3R
 C2R1XYiYm076yFnUlZgzhZfnsykhtA5DkZM0PcNW1+uEo+EXDSCwMR1RBNg2HHfPH32FAMeW3Fm
 uAqJz+AXxPrFB6mZ28b3k50AfYuriAikmKrAnJee0WbYSpk9+4O1CIFw5qGr0qHbUzamdKPk8Ai
 +OUgkQcc+isdYaFJFJOtt1uYUzkvOM+1/NErpB1yRltQDOIbbPBBums8PZYXFF7CPCTOE8zTbDu
 VJHusHFO4fANTV4uGIeu8D8kQzucnL2SZ7MhuF0ahRT/AtoFgjBStZ/71P8zyySXkcGz4zSmD4o
 emxgyJrRPw1NlIxZfcbZlysH4EyFcJN3cxoMXVJbOFILf7RnsISxR3H1kZ23c+ppLu7sT3IuwFq
 d1iiZ5/TBiWXWXsVqlz3bOk1JzgFI9u/Uk13M9pwMQd5+Edplhm3TEhuTljywtGDODF4Se46TT4
 hd/5ZRiYMEhm7dNr6dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37528-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 474B05D4948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index b5516655db8c..5a1b041ea768 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -460,7 +468,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0


