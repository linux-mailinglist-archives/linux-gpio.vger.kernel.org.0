Return-Path: <linux-gpio+bounces-15359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB0A27BAE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 20:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F40E4161858
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 19:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3353B21C192;
	Tue,  4 Feb 2025 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GpG8BGQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB121C16F;
	Tue,  4 Feb 2025 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698119; cv=none; b=iDnwAk62yM/VimUycE7gM5V5mP8degNlyeKohOB8L8Ldi4F3gkxrLsNUCzN7cu5aqCHi7h39ldteopuOchNtblm12NwbgXLM0rCWHHhpoC6IRUXwMfhRp1YFt7l9YPPT7WacMVCDqWybWD46urTBvJwUb3cj0SDrZwLyiTQ9tt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698119; c=relaxed/simple;
	bh=eiHngT5d7Ku8shMos7a90RUeYz4acaOVFNqwgwOzBjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QB9yvc02vYhs7YZ/mcRutLbt5AmXAW6zTZBi7jNG7ibbrz3NlSRLVT/HI7uscXZYY4XR/NSD+ZIXN8bnQb4qt5HQaKSZadr/BW/f2vG7K1shbhAufcW7YYDtgtmYfMQ6O2d3M7vqJgKOaarR0N5rFTvtW05z0waIAcVCjN1yQs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GpG8BGQ2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GF2Rv023992;
	Tue, 4 Feb 2025 19:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PYjjz1aWU4NtFt4XU
	xGKKc+IidttJLlsWDQxKQMaaKY=; b=GpG8BGQ2bg1ePSTMSyv9i0i1Fvsm22J8T
	novrhHQdbzjBMk2yn+1rFF+EGDUnDu3no+l51JkaaF4N7hjk1iNXbuSHazdeVmOX
	zPofmsT7cvtXbwaceph0LTtpXGNlONej9X11mjDoeLTsRo3H/jV49ztFRMF66BYN
	QE4ZQm24m/QqARKccwvUHCmVZ5w0ePS38T9WMz/pqStIVgmJwve8DNaVuHn93weq
	vZZCrefu7PPReXO0buYe6P2Zl/YmsQSa6YWtEpH1DwiOgEAimfaXXJUlfaFkAnR3
	vk5wRNgl9L0mR0SBE9GeJRhVmXbRyB7M9s7YArCWZXOyUvKVxeE+w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kn62hf0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 19:41:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514HcOAh021483;
	Tue, 4 Feb 2025 19:41:22 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n1ctyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 19:41:22 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514JfKUi28836498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 19:41:21 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D796058043;
	Tue,  4 Feb 2025 19:41:20 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89E375805F;
	Tue,  4 Feb 2025 19:41:20 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 19:41:20 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v9 9/9] ARM: dts: aspeed: system1: Disable gpio pull down
Date: Tue,  4 Feb 2025 13:41:12 -0600
Message-ID: <20250204194115.3899174-10-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204194115.3899174-1-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wCel5_KkprBcpT9DD2Ta_RIEm6A0JzSm
X-Proofpoint-ORIG-GUID: wCel5_KkprBcpT9DD2Ta_RIEm6A0JzSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_09,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=870 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040143

Disable internal pull down for the following GPIO lines.
- GPIOL4 - Reset PCH registers in the rtc.
- GPIOL5 - Reset portition of Intel ME
- GPIOL6 - FM smi active
- GPIOL7 - psu all dc power good.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 00b091bc7da9..c8267c97a44e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -355,7 +355,35 @@ &uhci {
 	status = "okay";
 };
 
+&pinctrl {
+	pinctrl_gpiol4_unbiased: gpiol4 {
+		pins = "C15";
+		bias-disable;
+	};
+
+	pinctrl_gpiol5_unbiased: gpiol5 {
+		pins = "F15";
+		bias-disable;
+	};
+
+	pinctrl_gpiol6_unbiased: gpiol6 {
+		pins = "B14";
+		bias-disable;
+	};
+
+	pinctrl_gpiol7_unbiased: gpiol7 {
+		pins = "C14";
+		bias-disable;
+	};
+};
+
 &gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpiol4_unbiased
+		&pinctrl_gpiol5_unbiased
+		&pinctrl_gpiol6_unbiased
+		&pinctrl_gpiol7_unbiased>;
+
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"","","","","bmc-tpm-reset","","","",
-- 
2.43.0


