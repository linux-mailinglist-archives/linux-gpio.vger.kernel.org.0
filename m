Return-Path: <linux-gpio+bounces-33271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMLNIk3ksmkcQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:05:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E02752BB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09FA53264897
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659013F7E70;
	Thu, 12 Mar 2026 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLMLDU09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBlZdzLd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1203F7AB2
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331025; cv=none; b=IO1RsMKOT1c8jkQ9SSktTwC5nmnu90ERa6yk0i+FpcTicPqTXE/GlJno6GxQoKRutnsCTErUMqx8QbWhmXMD8H+vZ4FsXPNAKgBA8XOn7RsujPZATlVpuiD6QrbR3O6mVKLlpjalD8/HLqgL32IvQ2habGkPpvfUwpJAIzM/6E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331025; c=relaxed/simple;
	bh=yzm4LE/i0eUgrDI20KHh/zGs6KXb6rjOLlyDoM6yMxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ay0YKiPhl7ZXyuOueSUJURVqwADct5cy1tvZCxf6gKe/T3EaeCVlGw/dvzLUHmziA2iQCbRuAnRBKLM25AVbwSkpELgH/0R9S+X4YGaHpz/hQwaacFbDnBcfwQ2VLIYOHsx7Cf+qDjOe6fMnvu9Dsy3yZVEoC1ydz+3+FDrOR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLMLDU09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBlZdzLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7dnMe509441
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SySwvOCQ+/uuKwmMJa3pFWc/3ibW/F43OF5J2MD9T5A=; b=mLMLDU09hsSzGS4U
	huDQG5Fj+qAB/G3jP3WzcGDjuOEKjdwvcgvQtbLYoasw3idEs9aEu2vqrqVe2qJr
	4enIVdjVNW9rQDFeTPSQCMdaAKAroQ/3V+qvoHP4hMJc9bZP+6dsAgIXz2GTJaCM
	nSKAyLpWj0gmlkDlqwWrWHgjQFNnljTLyvwvli2pxGkfLGXKY2Mr6A/s1fNhE7CT
	7AEDRMH058SmVryySYf4BLFr9KuHqx4KA/8HsnMK13M9ziGeh+/QiLqcXJoR6r4y
	dH5jcsYB1NlojXkZrSQfUU8tYW/UyRB9DeGgS/9b3Dp1mnP32y7/Jp3aTHRFOi0k
	uEdjrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w1ayn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:57:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so729821a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331022; x=1773935822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SySwvOCQ+/uuKwmMJa3pFWc/3ibW/F43OF5J2MD9T5A=;
        b=JBlZdzLdA9y92fV65ni8p5CWongFzF4oJ6sY70P5Ke9qjUDOCGTCf0djyKcOKTRIDe
         wge4e20zeiNjIG4NWaLTdLPNk2aFEcA3tm5fAxFflDSChZ0RMGDFo9aULFUqctwDRhxT
         glez0LXjv5SSriAcwFPucIA5Te38d7BvFDKtj0Ft3NeW5dCh5aRlGA8gWC3Deya+w1xb
         U2DAmQel0Ugi1DQIhPDH4DWaCsr6WUeaJJ5qPUQyCwcUP+4oyTzcLHGSffy4/m9XOzr8
         Lg3rWI5ZkaUX+uhZObxSLfK77UgLL2GgsHXRWIAFvk/zO1GQZht+lUTiaVK1PJw4LocM
         prvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331022; x=1773935822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SySwvOCQ+/uuKwmMJa3pFWc/3ibW/F43OF5J2MD9T5A=;
        b=kYP5p+wdtA9G900hAsBe1jceITktGjFNiMySxRnPJ+alYz9rdjd2LpCYr7Ugv25T6w
         Q0fh3B1nGZGoPuZfymSrUrD3MEWvufBm5abDoSMO5UrJ/Ps7WiU56MPVVwdrh5KFQkhP
         jy0lR/scZRvR5XS+CEJ8bC87YpExdHuq2D5hJ5xMn7zZlTgiJdAOLqX/j15iMPOn4CTH
         I50gTtRFUyzMZtBBI4L4/4OTPcAtPabG4ZemoKKmbHu+/KMp9cv8tYncOmUoyDzR1cy9
         NokFb4isGuI93U+OVah3lOZqIZ+upS8PmR2oaZl4qCHM8DTzZOPpANZ/cUEWLVcOk6d0
         T5AA==
X-Forwarded-Encrypted: i=1; AJvYcCV+3/hEgzU/8Ih0EB02QqUVxS/61hKNzjo5OyTa0qCKB5JIdd544p7nDWpfYv2D+4RecKT1yx49Ps1X@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRnFvOHjRLgrlAW8vMJ3ofTW7KN08BA566t01uSqplcQGr/7N
	FdZpvW3BZw1/1HFb0aKJHy8u8PHBttPG6j0vcwtI7sM9HVHDkQcJawU6h1v2Yd19uHMDTZ/1JeQ
	7jYjZOIFWY+BAP+uF53o6ajB5oMDlJ3l6ISgutD3dfRVGGeeEIm+fYqv9/joKbA+pW66BShhk
X-Gm-Gg: ATEYQzxCOTtu3Zu8BaN+AsDjeHJudQgEIvkC3iz9jRp5XcO9oTzQDd0AUjAi50+wV4q
	06b0PKWyViAreCNI92OITScKhAr3IvM7wpzwJCwWiODGd/CNWIxRzDoNsJteRg9TPGhmkkAIHOy
	+MOiMo/jK5S6b72DVTXu7OEnTPFElLoEb0cquiUMeV/9pqyQVksiJk4fU7/jjTjAwSg0oCuloxr
	LpTcMss1ZksAwiWpxn1JadSZu9SugzWXsL13+3H3EVhxGOb4nsAjOMAxyZP53Ky19L6rwvwLpCJ
	moGw8hQljmokLlmH7UxsS0kk1LxcFA8wwHi9MJtblW05b0Q8PA9B6UGKLjEmk/yBxcjWjb7r7ao
	435Lwux9g1DGFo4EPlBgH9gy1xz/Z+mE/qw3/KwT3VlW3ezbK0A==
X-Received: by 2002:a05:6a20:12c6:b0:398:8a0a:28f8 with SMTP id adf61e73a8af0-398c5f4a17bmr6126657637.24.1773331021711;
        Thu, 12 Mar 2026 08:57:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c6:b0:398:8a0a:28f8 with SMTP id adf61e73a8af0-398c5f4a17bmr6126636637.24.1773331021215;
        Thu, 12 Mar 2026 08:57:01 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:57:00 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:38 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=1749;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=yzm4LE/i0eUgrDI20KHh/zGs6KXb6rjOLlyDoM6yMxM=;
 b=JKAWvWFz5sX7XgU7PF5rGftEOKi56jiZRWIeR1l8Wk9T0TY3Znmn1jZlj2i5AjiOn2t2o/kYW
 xbG2Prm+MeDB53WZBwsUWuFPEJNJz5JTeUyDGzhbyHz7QaBclBi7bj5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: FM-wHoIhXIh9O55EKunLxXBNjPkTEU9V
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2e24e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfX+0ZcvhYUswFQ
 q7E7YALfooFLpScpKEBwhBoDI4gSyjgQwxBz6RqWUK6RvckJbhke/mMG+NN2em/M/uVdM+EvpbC
 ww6y/1LTussOKTXu9XVE9jAdzTciSPd/2+8sdW2WdXDnElpEpOOfIFU1d2D+4Fha8LcLCFJnGd2
 /4KfLzB3xS/dK2tBwwy0Q0zQdVnuxGB2yuhCmva2yBxtrYDWFY1+isUrU+Mi4KGBvZzIWaWhegR
 N7M1RGv++9KBqSda6eHYMymRPe7JTfPYTAPzcMfWuMVr6UGuSR/MUbgOU3x6BncfIyjwCRGlfzW
 ebthJypqjA4aMrNIggu87ud0SHbz9d8WTlAxroJu5TIj0w5uPjglGhibqilT8Ez4fhG3CepzCaN
 5RrWwybz430MGXpTpBFMWYvRaQ0262MpxdRNGLH87Sz6IFCVH2DilqizMyLiG3uqK5w3czxB8v1
 lxIfjmUuyN2rjuyNjTg==
X-Proofpoint-ORIG-GUID: FM-wHoIhXIh9O55EKunLxXBNjPkTEU9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
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
	TAGGED_FROM(0.00)[bounces-33271-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 0B4E02752BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add deepest idle state along with pdc config reg to make GPIO IRQs work
as wakeup capable interrupts in deepest idle state.

Add QMP handle to allow PDC device to place a SoC level low power mode
restriction.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index ebecf43e0d462c431540257e299e3ace054901fd..8f560fd140661ad720fec979eabe3ca8ffb34273 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
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
 
@@ -447,7 +455,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 
@@ -6013,8 +6021,10 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-
+			reg = <0 0x0b220000 0 0x30000>,
+			      <0 0x174000f0 0 0x64>,
+			      <0 0x0b2045e8 0 0x4>;
+			qcom,qmp = <&aoss_qmp>;
 			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
 					  <47 522 52>, <99 609 32>,
 					  <131 717 12>, <143 816 19>;

-- 
2.34.1


