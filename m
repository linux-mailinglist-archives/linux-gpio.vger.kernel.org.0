Return-Path: <linux-gpio+bounces-30149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832FCF3CB3
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 14:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3381730039EF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 13:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A13195E8;
	Mon,  5 Jan 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuLow+nK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuE2Sd4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D1314D05
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619279; cv=none; b=nt+WsM/CwfYWVdSxqqh9vgiicTtPHdsPIfM9rvjmP9lDSWhbEKwrbo8zkb6cO8Ck5lrZ7EHgnbms5bPKY2tENlW4rpbq0876gVpHAny5ysxrlRHBShP7Nl5umylu5vAGUmRCELXq0ZCFVXEB8O6VeSWA81MGClaf9xtBEk1Kyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619279; c=relaxed/simple;
	bh=U7XmshVdBAwNRnAOYLYhMrKisbMYTFMoCRfC8idH+WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYZDffhKMlZQToywbFNmEklLu+BfCG98q+TOVj+3b0DmAZYgiRexgKeYyNSKt9RWUsRk2O3W3h9EOY5kZNe4eEGEmVZXVd4nkJDkp3a4lsV6TizI09OO0KxXV09FSjGRyhhf+tlRcb1AoJfzUi+lQxuGFGwOutrewjgxIg91sPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuLow+nK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuE2Sd4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058MIit3760958
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 13:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=; b=FuLow+nKszxs/Hqf
	cZKtH2yeLZSRTpKe5ZfrH4tIEWGrkUp0MxnHHCVNoIKqFXBxTT/Aamz6Zm4b5ln1
	lJ7v4MFALJH1fKVXYZvOD26aC04J636aYD2gW3igTspVQS0yVFk1JHDkDpY51KQQ
	JAsTBwkvqB5h9ytVetVFV3mWf3GseeHeRQZGqdg2bLLtCEd9JMaMf/E9RKkJZw1I
	T3Z7HWUk7wHLRY7MQ0guvsZnKAsVH4fMBZwbuyhWUcXA5ROd8BGnWxuAeBM5Mcsd
	QsBSpFXrLu5mzeXKqeOHuRTzZrmgTgQ4sBa2uuEHnRDSitAJqWAJNSdYwBnf1A53
	ryz5EA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvrs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 13:21:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a089575ab3so178405525ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619276; x=1768224076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=;
        b=EuE2Sd4i1tSoxkHdqyMgkZcp4lWbWNk/sys93veL66DvnHb+O0NFdBwoyLGBMqBMYg
         t/A0GNifo1O8tA5JIJ9IEErlm0u+MHZ6w5llobeEf3+4B7zSgGrPHVP/uiOblNDpdZW/
         bijzhqSYnO81Uf1kj1NwnmdXM2h9ifNbjOemO+vSgrAFapnlM+0YfQ0sNOqGs8a1RYI2
         +pUfrITsIsvk1ZqzuvFRZA78IoGNefDdaCJHUCtifBDZdME76bVKuqiKh9VT1bIma6wL
         RZkUgwTN69j0d+2FQMCeis2E7xTwiOHfHh7KnMj7HLDG319z71gsEubfBBKJc7XGGP6m
         Cijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619276; x=1768224076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=;
        b=dsR13v/U5K8rCdTTTzbo6bCI42A/eUgtUJkXf+CdlL1SSWOJNp6qbn62mJg0S+rkMt
         mowqZ8nUaQbOKDggedVPvXnl9s6z5cU9cmdJp6k0Tk9V0/vb+c7+LcuH63afn3G1EBKp
         uUdlKo/sgMH73YfAycYJ+kHcXk3lSo/fYosPPtydj+eFNIHbErIH6jO8keQ36iehbhMI
         eCEG+XJNk+tX+GeJA9U2VbAxx/UwkOHt2j5vXUl5ODroSQBBK4gsSzZCgU/EJw/FZ9MV
         6btCudIcYRgcgoGlnByKppK8Hf0TvGceHRDcF+M8M21PaIYLF4QhKOyZv1y1iCjK607F
         eKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkIR8U+0V2F8eX5pQkcVgdd3Ui/J9GZaw1LruW49MGPcl8QZl3esQdjCZ0KtlQGvyAMvL73Uge6q/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JbCWSwaM8Fk+JRm5NabmNy/oI4YNy3j4OEQy5blkQvVPUkbj
	FJhi+918fU/2vzXfCn0rfG4EXHNW+9KpoMJBjKmsiY2SsRx52d97XqWCa82GgRoiZ6Hlhf8oobH
	ER2IYHYck6+E/SMONoUtdPWPTnsN53KdAH7FE0ZpLb68AMm3glUoNzqc+M09vapj5
X-Gm-Gg: AY/fxX4AjtwwzHVw50iPO3usqpuhBvEQZ5R4SYy7aj2aTWqpTUBh1SZC1YcC1JcvdXB
	knDD8s4duRSy0oSU5xWB98hbY+0zSn5dSytbYhiMjL6LlJynaGefV5q2igNFOEeDh+YIcdvXqIJ
	49XCHyvEvHbEr70qh4EvkTKDqLLcpcquj9lcaQ2HHZLZEJwJ62TAoddo4LSd6VCA6SHtULp0Wvv
	DxYzmV8BUzNwvetKyx6mOFqVrcFpOhxPR6b0NSM+ChGNlc9J2ly9FEnMDs1HvQ3eyb+g/Z85BvM
	oYzd3hAlg5XDocUPmZK4/dCBGHFk4JNiw0LYdGcbfYI/gV0klqNIpas5lw5qSdRokAN4/zfe9KA
	f+RD7wVQK5D9P+7vkycEmOgy+dU4R8pIrHxWER3cD7toXmlOhPgcfvx/ebfWtpb0lJ192mfWd7A
	==
X-Received: by 2002:a05:7022:6886:b0:11a:5065:8763 with SMTP id a92af1059eb24-121721aab31mr45120808c88.5.1767619276017;
        Mon, 05 Jan 2026 05:21:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFT0ZePvBFPK+WkreTAXcszd6+ZsL6LcFSVxA1iWWB0gBqGVeNWoO+0CAH7veXD9UU2F+fSQ==
X-Received: by 2002:a05:7022:6886:b0:11a:5065:8763 with SMTP id a92af1059eb24-121721aab31mr45120790c88.5.1767619275419;
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 05:21:11 -0800
Subject: [PATCH v2 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-2-7ac036f700de@oss.qualcomm.com>
References: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
In-Reply-To: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=3188;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=U7XmshVdBAwNRnAOYLYhMrKisbMYTFMoCRfC8idH+WI=;
 b=X2H5ldyU23GV9aceRvYXSzCRSozd/BsQRwPwoz+jGR7CiUH+d+f1lnwxxhF2KIgbcUofy8NVu
 LP7W+pwsPBYDXhe3NKAQFky3M1ITJoistD6w0/ZKD4q4YxQdAPn6hGU
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: EUe4wRsnjvBfjAvih5wXGfntynsfc8Do
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX87tnyjdDoF0K
 FEeHHvbINAugCC6mWEmqB3ahf18GgAr5HKVeYOgS+u79/WtK1dgklk1KF36yn8XmcYgjL0IjA3V
 ilCpRcBvvU+BHNNEBdmrikaRfut2TEyfr9i1yELivENLpKvPkugCEBc7d34xE39774IWlEFbrZR
 698RkobZcGnefrNONMjjbcyTw8zgd88fwSyCNAh3/sh5CBfuvhKUMJHDZm/33H0ylSgrBeeIyQj
 jQcV+kPYi0jGicj6z7PJfcJgq+ZE9Khh7bX12P1B79fVuP9F/4x+cusdLrE2p4tx4idnJo8QWKH
 Twf9d1povLWKBUq1w6XotDxsT+xX75TtHr3wjYNzuPs0YJTgZYPy13qjQUWg+/5E49EVgXSJJLP
 an6YxFfwWNZQuu2VjymIrn53lXqZCysjCx6j6l6mhj7pXJF0LlnS23KShgTzy8m3aceE1bV3mxg
 82gvK+x00i6FpAIlbYg==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbacc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p3TO2ht0Q29_D93gC-wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EUe4wRsnjvBfjAvih5wXGfntynsfc8Do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

Add Mahua-specific compatible and wakeirq map
Add mahua tlmm soc data

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 335005084b6b..0f47e75db7b4 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
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
+	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 156, 149 },
+	{ 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 }, { 193, 161 },
+	{ 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 }, { 217, 153 },
+	{ 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 }, { 232, 206 },
+	{ 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
+};
 static const struct msm_pinctrl_soc_data glymur_tlmm = {
 	.pins = glymur_pins,
 	.npins = ARRAY_SIZE(glymur_pins),
@@ -1742,14 +1761,32 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
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
+	return msm_pinctrl_probe(pdev, data);
 }
 
 static struct platform_driver glymur_tlmm_driver = {

-- 
2.34.1


