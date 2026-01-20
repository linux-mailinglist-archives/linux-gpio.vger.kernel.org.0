Return-Path: <linux-gpio+bounces-30813-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLiqDOzWb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30813-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:26:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FC4A53D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EA828AE374
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC57421A00;
	Tue, 20 Jan 2026 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvyvrnH2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdP26bMd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A83F23A4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929829; cv=none; b=nWb9Uy2hKVVK2HBS48fCc/EqsaubMDHMfxGc8n3K6Bvsbw6859dfS6yKV94HMMeqKPnagW8WTkM0rMKECGVu9lA75llDFnpjqplHbupS8bPxSiowTVKpbaGXl5aCnTz/ZtGPUR+4QxITnZMDe2TnLAAGqpU6+hSOrAo/4tfW5r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929829; c=relaxed/simple;
	bh=xOKCUEK79jZEMU0XsZlL2vcpGR/Zktrh+jM8ZBiVhRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctyFfDRCn2eoFDy36o15FlrmahfzvZzIl5kMDhoHYUDO6UEVHNYixVDhitNXDdkjZLHDhUHSxBC1UVkG8WVDguWjcbvywRU8AnzLplrEQ5gW879S5A+LXXaNelYpb6kU3uM4mtetuhBzSKViOb8wbdny3zhHRbfT/RpjpE78f2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvyvrnH2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdP26bMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHBjH3314518
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Js6BTGG/ZwNb6rGbBE6BzKASIp33EAZbXoHw3fRr6Dc=; b=MvyvrnH2yKPJQxut
	FxsL7eLSD0vPm7/8qrALcscQ2y98faVaPZ48GhUN7DiAICB0FUpw3+CuDohOyoo7
	l2AGsHpBiWNfCApiJlcWKiq7uq6ZrKYagY32cUol3WaeQvRRMR88IyR65U/0OI9H
	m1ukWUNCx4ZbuKQgxHik4PLeygTQzpy3VEWTXKhNgEYzTfcJrrvEXxvLOVSM60GS
	M0llj+ViWLTqPKzmVSBay8Gb6/DKVZPhNihBSQB7gvDKgPZKKvO5ihOdIZXwvGMd
	oHsQIlBxHPFV8bu8cpEJT9EJuqExKS2MTIKP5lmsiuWzoIuz3xFn7SjVsgaTiORw
	UGM9Mw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw281m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b9786fb51so13523591c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768929825; x=1769534625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js6BTGG/ZwNb6rGbBE6BzKASIp33EAZbXoHw3fRr6Dc=;
        b=FdP26bMdDn/T/z8ZNi+bLVi62gHz7s6cRhtr1lydVhGAkHxNAXS2t4M8nDJKy220Cx
         yiO/AzMWukC2d7taxqxKZWy2dwHYILiKHaOmUkZ8FANTsM1uRyXSBcmeCIWq1mzLemoe
         RY+tk1YYyCTWTYaRFH0F63lxBOOcn/s4laTIDyA5uVstT0ZnjoCPiQLCqx4I7j5xF/tq
         PIJ2YlKEtbK0p90Y9zRrTUrY9y1uSbHFpv2NsDpK4/ZZJU/e5AZnhHNymJr0Y3Y0CJF2
         jyhcHPbidCtrngL6TXmltoRRNDstiayiUKoc7ejm0NruWu38xRVHJK6onje0DdFU3XlA
         5p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929825; x=1769534625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js6BTGG/ZwNb6rGbBE6BzKASIp33EAZbXoHw3fRr6Dc=;
        b=HmrZm1l1aNFSN8KsUAH7/xMxJIutJtur8KNGTo2gZhtO8bdMtXrbVstShWedbXV5kr
         7tPHS/MCuGkcC/2lP8wTPE7iFDJyFreIWvIXT6S1h5CzxzYXL1H0jCPj+uXduZsrz8ZY
         sPlQEk4FmxeXanNQ90ecEzc/6mTtNPJ4Sl+DjXV8KroLCnOCy5YR/3SDPQGyw/VXKQpN
         rgUtC8a8uGBtc7pzVGoD8UlBwLIcRUTrxUD0y9Gu/JNH4ndm/eRoVMr1bK2DpE1dJwjf
         n2tlgipXKW4Iy7Jrwmm0xhtstn2CtS7uRUFn/74G0aqGZkg184iY8rgDLupGVn9xObNi
         fp+g==
X-Forwarded-Encrypted: i=1; AJvYcCWUHgGJjx75S8cu71Hh4P1lMwMAef0q9ViCWuNihNbg51NePbJMAgk+wuB5cJ5nDLAqOysTUyXMSbZM@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCyjUnqVkLQMAMKM/98tHuUU1Ab0hDi5KA+T49pvoAoog+Dqc
	XkmVdMN/3eSOA7uB5OiS+KUyKBMrEhdFQvLZF4o1G1ICr/pKc9rDRU2F2y/5HKhvuASsvAdSVM7
	Ego2yRD1hZ3OOSfJOhYw2CE+YyY/B1Tz/yTHOFl8dDRszVhUp3IhiZzMV66LsRXcTbrMIUAfL
X-Gm-Gg: AY/fxX7n4dY8tPkp3COVvlMfDbxzCmRbeegpYAYFBJeZWVin6mSZ8F377YrpmV7bqCt
	4zoTiYBxi040iDoTBhJUWtKJ8Vv2po+DU+14dekafL8FBStmI4N07Zegr+2BSZjswpcdGaffx6c
	6cQWcCfk6ky9WBNIwPC2FzDxtk0MhOnSiBdmYAy5s78Yt3rhMvu96PvCRn8Ecq19NgI0eR3XwBN
	laMOLBUJx34R62LJdZRsX2jsPFpSfPwzQEvtVhlV4RmusxtmVCFn9NPNxtKmIL6kElGv+ciht8L
	lK2lXOaX8EJWdGHUmd2iAwRLHdq5hMtVl3T3F0dlmKaUbp877X+/yf5rxQuq8B111QEdaEu9KCv
	BidcT3gbJrHGH47ce2qdz4wgudisrar4IBNV4qW6R/ns2L4qYu/qq79/9AJuslOM1BPlBe7IPmw
	==
X-Received: by 2002:a05:7022:128b:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-1244a72aef2mr13665624c88.19.1768929824988;
        Tue, 20 Jan 2026 09:23:44 -0800 (PST)
X-Received: by 2002:a05:7022:128b:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-1244a72aef2mr13665588c88.19.1768929824362;
        Tue, 20 Jan 2026 09:23:44 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm18714842c88.17.2026.01.20.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:23:44 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 09:22:51 -0800
Subject: [PATCH v3 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-pinctrl-qcom-mahua-tlmm-v3-2-8809a09dc628@oss.qualcomm.com>
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768929822; l=3365;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xOKCUEK79jZEMU0XsZlL2vcpGR/Zktrh+jM8ZBiVhRI=;
 b=qrUCFFOijYpi0NRnPuwotZ0+mtkgYDX/J8Ma/yrxiniHFiTgZMsI1/oUcU41BuL7lMC4DE6KH
 f+SgnrQfjL6DaMdS6weSdiIui5skgoxLGS3/3cj7yVMUYU0Jeue7mvl
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: bbv9AMnBSfr_sLPAkrvHaJoMcxxWpQyV
X-Proofpoint-GUID: bbv9AMnBSfr_sLPAkrvHaJoMcxxWpQyV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0NSBTYWx0ZWRfXycQ0otePDEWG
 E3Kx4zN9y6QJaGhKjnooOT1/GT/gXFbf7gftuZAzY4mgG4NpaQluZs3gXeK/NTE56bimSyGIn2E
 7Xsfc1261J5spw5ue0obqATcbiAQUPo3bIuVuDmh/iC3+qSXcPoIrphv5635Q48pLwI8dDnjQZf
 YRcT5sikKuPGde6rZshbWwlgdpcKnIToSpMmD8ch/BeA53nG3I/2Vv59jjt/5vD74U0yzknJlOv
 aTcna0dwYg9Te3mtUurSqPbStieszH4iGyENdFxT+0mJPsyn1K8yMuf7sfe4kwOW22g9yqPP5zg
 wbRrnZ5BwMOj3KgaWHudr9l3TfLF9z+yKh7O0VE5aZ5cs/1mgNDdlYBSNs6+2bKMpZjeB/WX8E+
 HZISuw03EZWOl/O0ovzGw/urVLm4t5H/tvZ88k4Xl29Tqo0vrm7WDGhwLSi8WBGm2sXulmTugbu
 yuXiYCNFgRf2IqXIwvg==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696fba22 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p1T0IFexb8msloUdZnoA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200145
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-30813-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A27FC4A53D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mahua TLMM block is identical to Glymur, but the PDC wake IRQ map
differs since PDC handles the interrupt for GPIO 155 instead of GPIO 143
as seen on Glymur. Hence add the Mahua-specific PDC map to the Glymur
TLMM driver.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 46 ++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 335005084b6b..44f9745325b7 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1729,6 +1729,26 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
 	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
 };
 
+static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
+	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
+	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
+	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
+	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
+	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
+	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
+	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
+	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
+	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
+	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
+	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
+	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
+	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
+	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
+	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
+	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
+	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
+};
+
 static const struct msm_pinctrl_soc_data glymur_tlmm = {
 	.pins = glymur_pins,
 	.npins = ARRAY_SIZE(glymur_pins),
@@ -1742,14 +1762,34 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
 	.egpio_func = 11,
 };
 
+static const struct msm_pinctrl_soc_data mahua_tlmm = {
+	.pins = glymur_pins,
+	.npins = ARRAY_SIZE(glymur_pins),
+	.functions = glymur_functions,
+	.nfunctions = ARRAY_SIZE(glymur_functions),
+	.groups = glymur_groups,
+	.ngroups = ARRAY_SIZE(glymur_groups),
+	.ngpios = 251,
+	.wakeirq_map = mahua_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(mahua_pdc_map),
+	.egpio_func = 11,
+};
+
 static const struct of_device_id glymur_tlmm_of_match[] = {
-	{ .compatible = "qcom,glymur-tlmm", },
-	{ }
+	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
+	{ .compatible = "qcom,mahua-tlmm", .data = &mahua_tlmm },
+	{ },
 };
 
 static int glymur_tlmm_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &glymur_tlmm);
+	const struct msm_pinctrl_soc_data *data;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	return msm_pinctrl_probe(pdev, data);
 }
 
 static struct platform_driver glymur_tlmm_driver = {

-- 
2.34.1


