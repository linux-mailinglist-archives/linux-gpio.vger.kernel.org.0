Return-Path: <linux-gpio+bounces-35548-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG25KXs472mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35548-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:20:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE68470D9D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1E4930E6151
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216403B585F;
	Mon, 27 Apr 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYQiikmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxYaFSCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9E3B5319
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284900; cv=none; b=tWYOG8O49s4lTJ5uKF5ZqZmu2a1jSzMHTGuYSY8+2xiBPIh+dwftuF9OjwljvUO3PlfeTc8iruBSdCS6vDToxxzvERT9DeJaV7yfvDw7rSzDiRYYKKUyeio1yLMd/HvmZr5qD7tt25X6uYlrnNsreRXmPt67guvvlftlRNpgc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284900; c=relaxed/simple;
	bh=jxTrQNR4gpZPqvGR21t6SEYABvNS8GOQuHajItmONbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kA8WRJtArnDUbG1H2j4pbgkf7PUKv5PwXWETYdy3Y9i+mAt/ID4AhikI5LBhlhe/+ysFZ5KgG/THBJEkc0XTVRg4dPCWzeJRVOIZD9bDWeKm0UHV+PZNaNu1dfToThGVki+OLStlMaBKiTLlcgKNnkOYjU2S2ZO2IU2BDHX/DL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYQiikmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxYaFSCr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oh8T3825334
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=mYQiikmd+JD3Y2De
	sHT52q5kJSomDebXtiRX8Zv2hd09IZ2WswwarsyikmJ+AcvhgeLL3cSAAe0cN8XI
	ZXQraLrPEaTBqgucF8TDM1Hvy2bsWdTkOUxinJ2VlQSqnCdBddOMrsfH2glYpUht
	FDnJRqjCow3VCFM6tn6Xg9C0AMse52655JOzssnByoL+LldobTaA80Bwzm12xQ3t
	Qc5iLs1o6Bz61+kgbrAxaVoSBQYKqp7XJybM3vknQxuXvvzKCClxtO0rjWL75b39
	qcQjzaQs62pSPH5KObJKNAvkLUf2yRe0slVTk7Tj3mlsBeF3rwVXA3RJzSvDEawG
	1eDMTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt555084b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:14:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so182092211cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284895; x=1777889695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=PxYaFSCr5SUYhGuPqVX44ceaXmAUMlqW4bIjdbudFAZADQFlVdjk2BRX9pvVorlU3J
         AEvziIkIIa+Oej4UAzyN74b/dTtF+Pzm8qYTifjzYrHy5kdlApPYR3KyYUeLVCYx6VuZ
         bEjWVXTY3QGa8ELnRmx55jKpuki+wJ2uSBtXaTcOgg+9ymo+pBUrS/yMOjbMxTdoheJR
         7EVA5/J2VDnOflKzVdo1kGDkHzfpOPRO0u73/n+bqPg+30sQOpaTzN/H6mZV5Tw2qkAa
         6WhE8GesJ+qBn0p9MYFNZXXPaQHzQtyAgbWyuPRK+5+6LKJ65Ef/hgg7iALhcELzjbxB
         /L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284895; x=1777889695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=hihkJvO8tPVluQYW6OebASVgKBmvMCIbUbhS/b7KEO5AMT8yet3Of3AJnz0QBmBnR9
         9ReF4iVHRoHG6sVloVt4Fa/tVGTmOLgqSmmpF7o2ghQ8Ale7oBDm4MJ9oZTLAEsL3AFw
         99BLAybdgb+SfDxfk70Aa8WsD2/m2oSRk/febOBUNSazHtHbvx9+VOwVC7biCzke0WhU
         ExBz+38x4oBq+him4HrqiXSKtgwJsTVfbjDkd0aLWtby42Tba/OvqNRxotfybeoVmmsI
         LXjjiFcY1OatcIPtXRHFwLMwpp7vygtv9q6jIQ+21gACWAOzpOusHusHc5V70o9Gw25k
         +WbA==
X-Forwarded-Encrypted: i=1; AFNElJ+97tmAMQvTxZiOontjwHOu85ZqWCkwwhXzKNrjkjcxvqXooi+FwlQX5NrEs+Rj4KI65KPUArPO1c2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nyBmt7IjGNJQ3YLKZqz5nfioCXfvzGxOpkmem9S9bGYRO7Bt
	neNI3vLo17Ii06J3L/uvaeIq5sA6ilsOXvc+BsZ1U0Imuq+BGAr888ft8u8kGlpyGNQxemGe2Sv
	hTwNMZuPsk0vTagE4sDXUW6WlsjRFVh5q76tQ+awKBYyumBea4EKeoscipykdYMW3
X-Gm-Gg: AeBDieuTU8ZP0EO3ZsZmvHmAGUIFaw8B0c752FkRUr4aRUxhcY7r5e6NFiunPjVDfEx
	Xr5f0c5hcvpMen4vqfhEiyaZP5O4fIBK0kyhYRKrA2o2Ahqv9zvuj7wJh/W2x436btszmUUc8T3
	kbw8IeNktStKq4ICIr8KJuTFqIHGNcf2JvprZOr8lMr8fBkc15EVMiAWvyRs/o0WIOlL/hhBCBR
	b3XHc97zSfoXiaqRTYdPSM5Y/bI3MhUzzlpVaLHnqqPANuMYzZmdRfhLy8nZw9h9/1dS+N0CTCw
	4OCnm9HqQ6Whm5U8W46rpBpDC8xJsFth1od2i44+mX5i0s7Tc5o5G6UcedF4EeilJl5YRDo4MB0
	ci3DWnKAZoerdl0sHWgjLXfYshiVQGf+RJhQHTBpvgEyrMKNnDEqVqTCCITpxUA==
X-Received: by 2002:a05:622a:1a91:b0:50f:b61c:ec65 with SMTP id d75a77b69052e-50fb61cf107mr388256511cf.23.1777284895471;
        Mon, 27 Apr 2026 03:14:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1a91:b0:50f:b61c:ec65 with SMTP id d75a77b69052e-50fb61cf107mr388256211cf.23.1777284895067;
        Mon, 27 Apr 2026 03:14:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:33 +0200
Subject: [PATCH v2 2/4] ARM: pxa: spitz: attach software nodes to their
 target GPIO controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-2-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jxTrQNR4gpZPqvGR21t6SEYABvNS8GOQuHajItmONbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcUKwvPo+ocrnJDRQFVq6Va2JiCEsp4/yTZV
 gtmYIqDXqWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FAAKCRAFnS7L/zaE
 w5l8D/9c0LfnfS8OD6Iif9B/tbOf1OixaL3QtLb3bHb08/+jQw4TDSKnGFg0XMsD0npmpVmXn7m
 OjuCghKC1kj6/QaD3LHRvxbOLZCmDnbxfMtaxeY5LU/N2xFx4nEiFfVyfFz3kfcbwEtlyqCrLyu
 +kCaHadxKNer89/t0OrRxipffmM6GXRyUsjfQIHzzP3JiVevHqWjzU+5wUZvIgARZx0DAZn/w9H
 /mgn3JNlFq6SqQb4ejc7KEyvNKKeGJBAiYuJN+/Yo6obsa7N5oUpktzXXM8WB5LydlFfFzySx3A
 U0Fmhh+4yZV1pCbseVFW0yWeZGlbi6O7PKtfkT8QpL71+ZLITkrrlTbhyx36WAjroGhd4zf/fli
 Gf45lghY4f3USUDpUPoG1V9orrk2bnPEDTsyWUpwUwnQxCzT9ewNZkClkFAwdbRlkBho3wtHTQz
 cmCLlwVHCED1bCRW93TeCNZ9ccOmVw6aKR1bulOD08F/FGo8IeDNOclvXRHSAtjO4hkJQmrLCsH
 TSugINPAq9dgpRtNQXkHrW9BVtJHxakemY6SkBWHQUvdJkSXc79gNwkOK9HFcgDiZYnh0+Zue7o
 krtaq6rTeZw3ITpGF4fi/o7f27mKR1VHj2AymWYUC7pALaVkpE/C5PW65lWuM1Vo3zKnG5r/4Ry
 ZsIoH4qxg8ryBeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: bQAkn4LpRnNzfFsNctBUTbua7z6mjIeG
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef3720 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX8ylCiXDVO9k6
 XuUajKpUc6lLYqRp1G40iG+owZ2ULVW1+I3dBgS3seS3PE2KzSUFppd/1X+GUW2orozLkNRBwTF
 /G82ciSFw76lYENxZmWQ0otIblYFMuQTFaH9bSdyWNtq7RRPLJkrkApB/bCaQyV8HpvCHU5AdAI
 MpJun90smDdkV3dpDRvwK7cwEKh7SsephETvRy9/xovAui5lWhzrPOzhjRBKXjmkY/vsXvb6hFe
 5srRoSIODknDXZmbT85uAzsClqiKn8Y684uWAiKodYX6syBSOmEeMgeyS3jPak9TyyqQe3VaUwj
 ZByQD3omHQ86ILhi747OeuQzgb3Fv7fuIPXnsx5sLnFTCo9xogbvM5KRSa+gl+vIUq8k6nrh+0D
 3mCAVvp/dKuSfYa+sSwRtlgyIqIEKPgS3gYYDuv16Wjs7vnhhzrD8W+miNX2Vl78AowGBpyM4t9
 OvMUuGaylLrwlnZdqdA==
X-Proofpoint-ORIG-GUID: bQAkn4LpRnNzfFsNctBUTbua7z6mjIeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-Rspamd-Queue-Id: 0CE68470D9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35548-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Software nodes describing the GPIO controllers for the spitz platform
are currently "dangling" - they're not actually attached to the relevant
controllers and don't allow real fwnode lookup. Attach them either by
directly assigning them to the struct device or by using the i2c board
info struct.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 3284b9f62be970555042a7292993e45d56fde47e..5091b601c4e1bf25cfee07429881894929853dfe 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -204,11 +204,15 @@ static struct platform_device spitz_scoop_2_device = {
 
 static void __init spitz_scoop_init(void)
 {
+	spitz_scoop_1_device.dev.fwnode = software_node_fwnode(&spitz_scoop_1_gpiochip_node);
 	platform_device_register(&spitz_scoop_1_device);
 
 	/* Akita doesn't have the second SCOOP chip */
-	if (!machine_is_akita())
+	if (!machine_is_akita()) {
+		spitz_scoop_2_device.dev.fwnode = software_node_fwnode(
+							&spitz_scoop_2_gpiochip_node);
 		platform_device_register(&spitz_scoop_2_device);
+	}
 }
 
 /* Power control is shared with between one of the CF slots and SD */
@@ -988,6 +992,7 @@ static struct i2c_board_info spitz_i2c_devs[] = {
 		.type		= "max7310",
 		.addr		= 0x18,
 		.platform_data	= &akita_pca953x_pdata,
+		.swnode		= &akita_max7310_gpiochip_node,
 	},
 };
 

-- 
2.47.3


