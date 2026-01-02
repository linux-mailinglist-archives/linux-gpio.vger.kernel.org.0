Return-Path: <linux-gpio+bounces-30060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F9CEE459
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C7C13014DB7
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C9A2E6CA8;
	Fri,  2 Jan 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4bxZYCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJof4HBF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7C2DFF04
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352082; cv=none; b=EYNOSTB9Uue55Xi+HP+ndvQqOMVp1h4xT1wR/JPDxdmwlQXQW4Zdd6SC/9MG8VGCG12B1s74bXVWr/H6+8g3yzUeh40v8izIEmebnws1+ms04IgDnOchg78UbjpY1RtoLwQXZ18cGNNMFUOj36iTAM9uivgzvx6uFmQg5U945gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352082; c=relaxed/simple;
	bh=KkDQhZMSUVwp0+1UmXnDBE8Swp6Wh3Yql6B8Y7cFvJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j76izvCIZb0VjYEp68arxMZJpdJWtNEhoM7Gq0BF3GCu1JdY3+mEkCPMxbEIGdrdPNa4JYSljKBeQdTCDl0OaP8LCiPqjkybh/HG9sxBGOH3cgIq+6Gt54NclJXyOnhpefdABUvVOQ4pBZ0bo0bHdziqBL9oACRy1Wns+SyYzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4bxZYCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJof4HBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Wcd3824913
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 11:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=; b=Q4bxZYCSuFG7rRjg
	RJyih2wu/hLJNoFarNpLqx9SpbxcUxCYEBsF4Y+HkDQggbLm80SUnReWTWFXFCuw
	OYxSvl/qIuO3yAq7a4K/Dc/yhmUsp2RI/RkwqEu4cquQqbWZVPP0iBjxY82/2WbD
	HmZDmkPZyY9L8Ird6iJNropzPWUMEaxuSz+z5JWYafT2VsbeA68tRLI6QV4CkX4t
	Da6YXWf/WPriri0ZBsKA50gj36SPC1EwViQTYvPeGjb5txfAMuyECil4JYLvbejy
	kAiuLjFR0tXh/WqH1Wt8Rx7CdpBq2n3a4Di2lQjjrpBozByY1NyFKahmR+U+W0d9
	lH9LUQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd85336gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 11:07:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11bd7a827fdso21539890c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767352079; x=1767956879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=;
        b=iJof4HBF5yYRTaobP8z6ix15Ljq95Ssz4cNBg9Hqwpc0uLrzcawEgadnHbetQR0rBo
         KlwEOhJEA0AbSMWh9pCFQSMI0uS51OfNe7UYSr3GHdDyoxPIb5GsMFN54arfmdh4Rrn8
         kxZr2gq0MfLHIlUPT9Jb1JdOfb02Tkej39xjPvYRwuc42I8jvU2pEn7UMVxqRv2FLEW+
         h/DPgnWBwRWp6QubyOzaEHT5AD2WVPHwA2eqwMtx8tagJ9xsZ1bSaRSfEF29bN0xwnVW
         4cWkmkwtDtDNlfsdMh2DegerkAExa3ujZ6OH/o6ZCgl39cLzqGXfJrNwix/mcDjlH5p/
         FxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352079; x=1767956879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=;
        b=WQqqhOu2LRLt7xy5cxrL8XhuusxoQ97ZpYUinUmcgQDGYgQYIXN2xpJ4bGy329fPx9
         4STBK5wlS/hbqKWjBQIIoL2csjq3c9fYMfpJMvAxgtk+kYdMrnvre0kYPpyOHFqsV++7
         +fG37XES4rns1nmSeLJtOA+zCxTogEpNZPKswwwK9l1zR1KDl8zRW+bQRaZuFYthVZkN
         TabMuaywbqCNS/CLhWsSrzdk7ygRRTBJ4nTTJpVHYEB1c0uSaPJS7HAkzfwe8ved101M
         8wJAhWcFpyAesnLu6F4/7aTjJrAFjc4iUWyZBaD2zn8U6tkLAijWvb2GHx7KUWYUhnF0
         AOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVogA/SkxhNpZimtz8TZliUV1x3WwHOHQfn70jQplDz1FZBPUk9a1JwR9lJqws4ts3GpFh/BbIXsKny@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMuYdmjw0hX7i3Zv3rs3XEoztn7mlAbHDe+OIOjNjyJPmUDKa
	Vj9WuwHFYXFc12o2PK7wKNUehxamt37T7Q/+K5FLbdcIt9Xu/QQBFFfmf3eqkvHaPRT/dKipEIc
	gw1tRBj7td0DH+njwBdVkaScr8pc86UKFx70XhvEqgld2JZOIhD0yOEkupMYiyl1R
X-Gm-Gg: AY/fxX6xt7cHvm7g2sAwYtCbliw5X4XeGns42tLaHP6tsPL4rVWiSoidjkXM7yrdumW
	/Uy99stCErQ24Eece8HcyRfi/Bbgbl+cSFbLLZB2yW+iynEbe+yb+wlmypmRmtSJIr3iQvOP8yf
	NpKjFG8wpowRGxXmlgm69xIpFm5FE+7RiWZ2IkvzhvyYQ+JF6o6/nReJX9XGjxhMbnmkZ1uisFU
	W6QLlMwMP97/nDK2aRi5SOSbLWHThpBPIamcSmiidnFIN3B8ip5hexJjdQpSRuILnaBmlK0rZ5j
	3QBl/emZolObuKTg2Rui7Q0lJNb+h5HRJIF9tO7C1RU/nVTZzkn0cGiK90uQ2wi/3+Fqc1U/PLf
	5j0BXCSEM/RPyZU43iblh87ajGJwe+QGz5rTrVd+MC8ez+Ot+ACgwjho8XgcyrG7eGpSJl5CsfQ
	==
X-Received: by 2002:a05:7022:6709:b0:119:e569:f874 with SMTP id a92af1059eb24-12171ae9412mr41785647c88.17.1767352078821;
        Fri, 02 Jan 2026 03:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5DP9FQSdI+sVx9/kt6FQVQLCaAZX3r4WT9lg3jds0XTfiicsnWUpRGu7OBO/lQqmA2iVKgQ==
X-Received: by 2002:a05:7022:6709:b0:119:e569:f874 with SMTP id a92af1059eb24-12171ae9412mr41785614c88.17.1767352078128;
        Fri, 02 Jan 2026 03:07:58 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm157431107c88.11.2026.01.02.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 03:07:55 -0800
Subject: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
In-Reply-To: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767352076; l=3637;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=KkDQhZMSUVwp0+1UmXnDBE8Swp6Wh3Yql6B8Y7cFvJM=;
 b=r4xgs1j4ZijJF823M8n2RgReEm28pbSrR7BFi3dpzd6YSEtqY36g+ccHhT/QLPHHPtZU73oUi
 H/izleqlrLAC4gX34E1gAAiMT63XW+heTx0rmuS0xc63anezWyl87ku
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: ECG-X9JmJBo5ipSk4iVzDNcTwTF7ukZT
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957a70f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Cqdlar3rRHXyc8QQv8IA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: ECG-X9JmJBo5ipSk4iVzDNcTwTF7ukZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NyBTYWx0ZWRfX/LAYdnV0C3u0
 AsqHcHeKTSThTAGRCtxZ3eOyRS/32Wb25VCYHnt4gQNvZfS29wqzAC31qg6IxGkzJxFYG+rC3PR
 9JBsxZRfFRiFQduKc9U2BedEChlfheR/ByQodMkwULQesz+LnqWZxLQta+iuG9BNkWCzO4vNfBm
 FmoU0PxzlujE47W3TzCIf9J1a84Gti/+oWYdhFqATWLgsVTdJH3f28xXbl1JHC8+LqeXqZlvyq6
 Kl1beWa6der51qhNFDUEfjKD+YhU0MymRlMnv5APMmdzULLCXanpo3D7+rrswNz90PRX3O5oWnM
 rBidVuK2g3YB+dBBVU6TIryzR41jKHHilrfqHRZ6pUnObH8NEfpaJlkBMIfU+V96vNR3do6P7ix
 lpHPH4ckRWCeSabC8kcMR5yDb5v6ELSkHNwQasfyiwIn7Mo5qmLe2a+0/0xpH9jJjKULfvegSJ8
 /esWvu2p8Y1iFo9axCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020097

Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
in the pinctrl-glymur driver. Mahua shares the same pin configuration
as Glymur but requires a different PDC wake IRQ mapping.

Changes include:
- Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
- Define mahua_tlmm msm_pinctrl_soc_data structure
- Update device match table to include "qcom,mahua-tlmm" compatible
- Modify probe function to use of_device_get_match_data() for dynamic
  SoC-specific data selection

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 335005084b6b..bf56a064d09c 100644
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
+	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
+	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
+	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
+	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
+	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
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


