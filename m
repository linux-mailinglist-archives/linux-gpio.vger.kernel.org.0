Return-Path: <linux-gpio+bounces-35921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEYfOeRR82lnzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:58:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8674A309C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA722300D56A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5740F8F9;
	Thu, 30 Apr 2026 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy7XT626";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtVfJfyV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1E40F8D6
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553860; cv=none; b=Z0hhQnI31E0wMk69dabteVB8sLWy42KK0F5eXahCtcRWSi9RWwbkq8R2iQ+tuuk5QGrLzdpaCk2VXRz8l8ojOEY7kB/HnFxTEYf27nRiYjMhuZ/LPTeR3+yVPEPrRS4i0K5yYnr8WCqrKdMESskD6Pn+EcPMiNPJhJWpRPiee+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553860; c=relaxed/simple;
	bh=jxTrQNR4gpZPqvGR21t6SEYABvNS8GOQuHajItmONbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch2JWWPk0fN4/h5Z0ZNv6BeNI6nleZGi/1VZG2Yr8dum+gtLi4bgPV57h43bQ9cuuTijM85xO5EgdFoCkGBoVFY5K9cr2lZBqHlsim+37y2zVPxIRWdH7fgKW0qdwKjR6BSJVe+Vhs7rZ1fGUt02j5GmQhk109IhuNODXcJtZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy7XT626; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtVfJfyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk8JX1820460
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=Yy7XT626PHb6gbwl
	GR4racNZu6IoNPwFSzsOiqlzvKT5+56sIAwnqutLg2Z0sue8RgHadm0Nu1WVhNvC
	+1a8QDZMnfbDM1gmSIqF32Sb0Ux0S7VYC1qx96lfvK6whA+NptSGHXiQ5AVI8rFW
	RhrKmK/pgcqoRmtHiLaPlen3WXkdNalMOHrPGjSKt9i56EOwE4OjEelnw++7Oh7t
	Kiauf7jasgFAmq/5F96cLO0tGrrDsnc3BFIIj/1REdKPYnczp0B67ClKEaEWUzsG
	N780cHytshZDEDSuuY6aKqE6yvJAdvg7MYKlt2zt+KroQVa+P7VLqh+u3a2lGy//
	VX6UsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6geraeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:57:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8e8950b3ee1so228497185a.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553858; x=1778158658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=CtVfJfyVRGjWNfZanlnpAIQ+PkYn7UcTEU/KwgoS/Yu5ZNpaUBU9GwWS6wjA5QkpR8
         iGYCkPc6AtuisoDb1nu79kOMnBCwl03mzlZd5CLIIWraBPB5/TGO472nKSrijW03+4ax
         i6jvmtRfBtikD4otpZHiRWWM2oG2kRDYFxwy4bqvJnLJxhIbQmjEa8DJ1x+ZeEJ6Hfkf
         MD5yzIz2n7AzapTdrNT5PjzeVmOG9aqep9Pi3KMuuYIjcWl9yZs6qXnsysdLx78qgzYk
         n78OLf5oxHz/l64cBVJ8wJ2THY81pX5AmlUWeACbPu/YSlB8aVYmZ+ma6oi5yEgiywhE
         5TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553858; x=1778158658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=b252QhM1pASFMmOUFEB1BmhzGfk2an1CMFowbapmpuQSBvFM/mWv5xE7Obov1/jvIi
         RB02CRgOggtOeL0yDHGuGpQLBDmdkKZoyONgbJissVIM9Ak1sxfeh9qIb/wXpmcf0wMI
         Y2peG9nzRvSiHfvOf4riiQ+7Nshb8ONDIZVP8c0xhjWP0Ys5cfjZl//CWN0WJMd1PIik
         KLQ/A0yIvDMdyy5Ypc5Z4Iq0wG7uXcsaMh2/fBKq/rFqat4PsB9fEo52hE2hmdgRsCWf
         GOZjwYnxrfJ1aVvAs1H7XmlUX2Ck2G2oQ962LUtGLpr/TNIM0dZkkfMfocdVAEpAei59
         O07w==
X-Forwarded-Encrypted: i=1; AFNElJ8nMe4EKH0vgd/VYLJpzvLW5sHfkcAI0fNLRQZMqLx6HqlNW8WEkBjaVH9+Lu3dlz8o4uvDGVio+fj7@vger.kernel.org
X-Gm-Message-State: AOJu0YzQUWm1GTz6YN5IIXbUXjHf4SI3TPvLrnaTNY0CihHsyjl2yiBk
	G7gmKokhEqAkCExvslZkKijQHElkgj/0Y8TTKUiKhGV68G3biH4BtN27m2Ai45HoHkA2NAh7gW1
	OiyRNEznv5GHtwEsHXaIP9H4tDa/Z1VseMPcQOUkO1COrI0+hT29XsUl3NFq2dg5q
X-Gm-Gg: AeBDietJI5sCcaWpklL3J4YehLmRuVOMoy7mwOm+DIu2Wb67zORAOPxHR4QO1MmwVAA
	eoZJclzwM5/pItraeFwtX6HippfgP/Zr9Vpl0JpxZmfAcwR7UOTrkqfABTn1AtmELMJvfcanOjD
	r27KZ80/vnR7KYioQwaLkJQ2YAmA1Zejfvm5/xM46Qar8uwEPv0hysl3BYRJpZoKKW6ot2bCVVQ
	CVkUHrKcVAHwZA+DTQSHeOlOC3SjZZPD2Hl5hYYhSe12vV+LHnHwu3uYC3/pIQXPGUv7LEGvJUY
	GjMs9/ryL6KgkSjC01UeWtclwbydFVG7fL8nexBRoMvZyWnUk8IVRkBGvMtNskyYPkiiYjitwud
	z+JZu69fGXzB8OMAx6Iz0mJK2IQQNmBax8+wPlBIm4AQbWV0CDb9DeWCTiQ8yDQ==
X-Received: by 2002:ac8:58cf:0:b0:50f:c245:85fd with SMTP id d75a77b69052e-5102ada857fmr37604831cf.31.1777553857780;
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
X-Received: by 2002:ac8:58cf:0:b0:50f:c245:85fd with SMTP id d75a77b69052e-5102ada857fmr37604291cf.31.1777553857192;
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:19 +0200
Subject: [PATCH v3 2/4] ARM: pxa: spitz: attach software nodes to their
 target GPIO controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-2-5142e95f0eca@oss.qualcomm.com>
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G4td6vKMjcnRYLlgZL8YJLvoiB+RlPSmWzB
 3IeNSj1f+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRuAAKCRAFnS7L/zaE
 w6G7D/9QRGEyfE1oRrQo1BOEria6ZMr29PncdqcS3OmG1T6aAJrRo+YYf2XQLsac3vs8KjnlPNq
 HPzO5KVBW754iR55zbUvnuU5/Gxv5Xcz5ZMy/2J0Mx2hyyMGTyN85Pfkbx++z+4xuVhhsR6JlXX
 yCJdd83oBRY+zlVihJOsuNftZtAz6zgG1rZ9QmpUcPebSFbZxKaUkVTFf2oFkw7SuPRoRh8s/+4
 ILJKT/WdEzxEGj5LKtEq5bs7Mb9be4UKwyb2EjqTyhlJtuhVd4HRLK4JZ9OOFRY7hwNbnZzAJ23
 4vLJrcdEnZ5NCWK2sHGjkzv4hd6Pc7jfByoV63gYPnoMqfLWNQ3NTKIEABgqyqG6C1T+TLceooA
 SreFr+uRMQetfV9i0sISk0/taXP67TTRQcAEe9Jp3QXyyeVumoAiV9Dh9O1zTgtW+jxlILynJ8z
 dq3eh5yIawnVjYzuEh3o37uKm9edT4ue0/DB28YJg6HFkQWDxqgOMu9cVueUQGiQzeEk54zH9Yc
 uzC4s2eVSWinns3+GMRISd+3UoGyqEgyPHKd8cjZ2XUWu/1NMK/3DGaWE6WuE0txmlmZkEDIAOk
 QYO8A8lBtYiS0rZCYBt4BW9IvPZYzlodE3yE3wUJ0EM+UYCVVR9OINPnKvWQPzjnzSsvlxN6sHz
 X/wgDAxzR7oBNwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f351c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3nuhYI69sRMo_z9IHBdCa-_ptcfpjydX
X-Proofpoint-ORIG-GUID: 3nuhYI69sRMo_z9IHBdCa-_ptcfpjydX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX/pujwQYJZ/wo
 aG0I1hnv1xCUkpR7uRKxGey3Ou4OhIqrOihDsObKl/6HX39zVnmIdw1cOEF1KQAnJzzcvGOTGba
 I1SQmuCIyfMdabvxuj6//yUwm4LhRw+d6EWpkh1vB9/QRyzNsHm4qrb3n/qZ72RxrF5B0A7cv3O
 RlJPyzbbf9zgffjVQhgNm6nl7eBDwCXGjofcMcGAdl5fETj4ZhSBqQeCE32+WHxgnFpYRosfjSw
 4gC1iRIUXENUDG8Bbz5kiOB7/TAoQoQtQOnp9hK0ToK5YSynMvFNX+504LyfGb7YZf7Kw0q8Th1
 L91O8xLN2d8UR8UQLlONldW2yudjDnT/1joWs1/XZm2buQ/3zL0bX+assp24PWv21ezyH5An9ni
 /vh1aVgflL5WkOxj2es7JzKIM+WLKDnSMnz5zVbHKW0yCK3NBJVLUGxxyyX8J/km0RCY0E45bD3
 SGcae5yGcXKNwZNBBUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300130
X-Rspamd-Queue-Id: DB8674A309C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35921-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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


