Return-Path: <linux-gpio+bounces-30147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED39CF3D3A
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 14:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E00173194EAA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B68B315D35;
	Mon,  5 Jan 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPOGptQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5jC64fm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD683148B6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619278; cv=none; b=EKVd8A8hJbjjVqOHPs9BQAGtCtxM/lsliFEQbo1HKnbYbv3Qen7KIydX4AyRc4Y0GvizxPgF9k76PbpYVQE98BrtsPSZTN7oSCrZffOgnHVWDCWZ3O6yxvc1fGGOsSGLKlZiMec1hKJVISH5wFffE+a/6FoNNXHKXlKuea8ojzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619278; c=relaxed/simple;
	bh=UFVpMdxqB8Go0aDIFeSiIjk4yuqxNQ3R5E9qV1fdxts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1Co0NZQXzagmwL6s6myhEB9sckXo4cSwasHL+BhmIl9O7IFEsq2ttujRhrJYoi2GvlYS+wFQwAXrnSs6zDlrmoO0qpdVOlk15FnOjARtdwVwTRIAVBUo4sm0Xeg3x3ROm6cENq0/MlmVEf4K/m5QA1/3nVZ32RHYDWriT5tFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPOGptQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5jC64fm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cTtS3541925
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 13:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=; b=JPOGptQ9HC8Ozsy4
	//0zUjYmnRVoGcR0t60wT6zvBg1khYqNkL8JSC2EkKTFF5ySo9Zr3jPa9OJenbAT
	xSKJe8KRKbYxICX9EHOndG+x73urHjmbOMQc/agwfqRsQdBtBB2G/tYRQtCLMatg
	nDipbhlcQpfRT+5Vgptv0Fi2fBEux9L8jndpVB+eFJ5KNLfAnvBOozm2SK2DKXaH
	/fpETL3frg9ajQNR+1EegXJQFBgwwYf/WAH2fCs8CdEJxsLzrPeWio0h/OWpRgXJ
	SUN54eSdUBRfLrZDD/xUxTaysbKYiSLxxLDvfQw9I2Uybs2nSUHX/0ZrHZV5O8tC
	IlGp5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shkc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 13:21:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11bd7a827fdso2721039c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619275; x=1768224075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=;
        b=F5jC64fmW479Vi9jQ3dwejmAiGlhWHFVz8S9Cr2X7hLtdXZGSdh7Vr66ouRShGWehP
         VT6ZzK+wJjg4QJqJqH5JGYI/CiPxR7UMsEV/UIOnqDFS1yJ5Npy+F9dWdBI8319H0DXT
         Tq08ePpTOSNgOzPtp8p0htTfVEF2aikcoEOjj/VckTu7SkNnBP7rjavS5ezrO8qaesoS
         zZ/WyU16e0UJPPHBkaAL/QACzx6IOaBuuziMfQI4/sIuVrSTXFdOQrcUOQ40ugRHkTPM
         OcJ1ABX9tWxytM/1qdIGwJYqmshzIM6h3M4V13GfcCZND6pEv6XNVoFyPdENAKmR67y0
         Q4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619275; x=1768224075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=;
        b=c9rn3rkQbaunMSK0uKc0oW/XXCWJv078rimaLRYtZ4sbGrOmt57+C1XbqdOsmGgSX0
         xfzLr/iN5WL/y+53tQToif5QRlFPY4fpQ9H5afByVbhczY00zeRoFT1ZEbNRqt/2UuvN
         fUsMeEUHuUxjMgeiRwhfyiKAaGX81p9kw1UlcLAt16WAQUGxmXz8Yntz1C4t6udl+UZp
         XHERcJ+gNKGrqOe/heeont25s/Zue3f1MyM+znT+gVEHC0SFWYbupieThndJq4V3Qzw6
         xzbRSFWlGU6wP1+tko2tFNMoDdK2Nsri4Pj07u7VvrJ1oCkwDjSIeJrrSeWIMyqJWjFI
         BeWg==
X-Forwarded-Encrypted: i=1; AJvYcCVBuhTWT5ROYcX+x9kaoQ4O2jQ9Kk0KW/ElkY7I3lJDGlGI90onCM4LxpSa8dRYgsBIKlKv2kHIydS7@vger.kernel.org
X-Gm-Message-State: AOJu0YzRY2y037gFVVG0gEm4NTqvCjQANLSXolPE3HsDH5dBWLfwD446
	r/k55fVyHSrmU5vUeUvcxPi1h6y/hYmRczhiZY73or2i3S1u99enbhsL/zeiuLDNsR93vBn692j
	Rd5C5zg71EzOdxjysUDd/cMWbXGp9FvvAmyMP1zXO5fDcWZpd7SPdcWmXQBaYdZNQ
X-Gm-Gg: AY/fxX5sMHHg97A4bWikP9UefUxkaIzsqymJ3x5j8VhVUjshOtMZSSY9R662gMIP1dN
	LCbq/AC7F3esPxAdCoRImMcGaa+2ozY9qWw4FZ/ZPHErAkggEtAM93zb9M2+Qq6SoERRGGGDRLa
	pLG19atl526up/QUZtSTeeglJfsrTRgKpaN4moKjmR+2Hl64UVeY3mIcSZ3ZwszCS122T8lhYki
	xxTCl+zYLI+WmaJAKoHQmmrFxgb+pEciR25ZxmMyH23qsF3zUqiHkSC9w/ESykOZzC+aBRGW6AV
	HyXTPR6pnniZB/agtqCC6d8NFiWXJ5a7qPwpor9VpenXjwGKD73rle4wJc1q9vVnMQkIDE4uTr1
	UnUEk+R+JXIge7tbRhJRyaFPcPi5wA3QaK05V2Z1VqsQyOVOktJZ733HDRo2dMWet2QS6rgwocQ
	==
X-Received: by 2002:a05:7022:e01:b0:11f:46b4:449f with SMTP id a92af1059eb24-121d80ea3a1mr5933882c88.24.1767619275344;
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdoZ3uP4i1UEVgcC/YVX5f8TTaRDDrAwyxL78hprVR5p+hE1Tun8eInn4KmIpoIthzC497pA==
X-Received: by 2002:a05:7022:e01:b0:11f:46b4:449f with SMTP id a92af1059eb24-121d80ea3a1mr5933857c88.24.1767619274715;
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 05:21:10 -0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,glymur-tlmm: Document
 Mahua TLMM block
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-1-7ac036f700de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=1086;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=UFVpMdxqB8Go0aDIFeSiIjk4yuqxNQ3R5E9qV1fdxts=;
 b=fdl+WiRyCRrPjKZMOEfq6kCPUUIwDPo0KX94xGI6oaw7q25GAdh6AE6ZI8myzFgd2H7U2zQv0
 N4Cu2tbSX2xCeoiDU85H8KOhdkQswOFR0NUTGCd4kUXceWyTXnUT9xN
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbacc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_GxIMNjxlj-suDvTKbUA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX01H3N9BpXqiM
 qMvecIvkHsDycwctdU86osLlIukzJuMyxMdLS3o/1tmLpQRE38ll9YZoAWsfeoXK2arEWzDhRiN
 FF+Nj+G6KYi5GmIq6xB7MzoC83b57NGgaTlPX3LQQllbGuNFL/zZt382K8ybvSVutSNYldED5QX
 MYHwOmIrGVccP5jqtx3L4bnyr9Mc/LL4+McIrZapkbpOE4gFsiULLiWOj2DN2FmEYZhOPtvRTFu
 95S4gm/OjovLv9DlnRRFnu4+5QGcDQECgdR/X0MSW+7+j6pee6vfsC4LpY7vPVnM7ePznQCw6VU
 cxvYUpzxpk251x3EaOoVh6FY0/u2xAMUvX3YrQMC2Kw6klV3MZveJofoaTJOC6YBTjwl8l+i5Tg
 grkdZCotoS3rQ/8ZD0zFtzH4MvTXtPxt5ZofftSQSOUmWZrJu3sIisofDKDvI/g01lKaZVE/L3D
 ZJbel5E7xfh+vWoRmXA==
X-Proofpoint-ORIG-GUID: LANebAZzBEEQPVCBZd_GBcZ_ZvtNWC3z
X-Proofpoint-GUID: LANebAZzBEEQPVCBZd_GBcZ_ZvtNWC3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

Update DeviceTree binding for Mahua SoC TLMM block

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index d2b0cfeffb50..2836a1a10579 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -10,14 +10,16 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
 
 description:
-  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur and Mahua SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
-    const: qcom,glymur-tlmm
+    enum:
+      - qcom,glymur-tlmm
+      - qcom,mahua-tlmm
 
   reg:
     maxItems: 1

-- 
2.34.1


