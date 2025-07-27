Return-Path: <linux-gpio+bounces-23850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC2B12EA2
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 10:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79BE13AB19F
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 08:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A468D1F7580;
	Sun, 27 Jul 2025 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I13M0/0y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27CE1F1315
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605119; cv=none; b=MSFJxStdu75UVpdXrTvLHoDFwBEUQ2OZwfPrsDBnsgWbPwPkIoTQfBPOCvWJDZRxfaw+zyh2DgIY9o6yq7hbZzvmch+V6ZVfp079b9LVUy29iwGIDtwlGyTuhBGRevCUPGSu3zcYk51KMmYEYcK2OJSyuyUQhZ1ew7yB5W0Vl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605119; c=relaxed/simple;
	bh=NM5eUwufs9EQvxyH72fi6ouw9HbAH6xIggTFFBsajLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qPrgJwbFr6na+ObX90P8wBZWQ+GVwmZgGMZSAUsKVw3loRCGobtkzIglS4UtxEi/h28eQibRKDPTeiBUhlW1r+8LtzHEsmgCDif8lUGF0aWuAkhFeKdh1bYR6AuTf0rXTFVyABP2OMeGfLX4xStgDJOigE5ANgdbcDooY+O8cjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I13M0/0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R5eEmn027402
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcwNi5jqAVS
	vH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=; b=I13M0/0yu7CcEcdijMsbuKAb+Io
	liLBfBX8mE9pIsxnm7cA0XPlRLmEtJKgEud1LHxD6v62CMdmIsjel1VMYlC+raJ/
	HhhM016Kns3opK9CfDrb+QcmdV9R/IdwmzAYiZ8rAE/dUEEwawZ9EZ+FpJK5bwLl
	Xkl1kFuG0sw6Bx0BZV94EmRRaDPdCbcvm2w1kU1NqcKIYUs7vkGyra0MdfouG4lL
	U5eXLuCM0LMZ3oX1x2isFDRP0yPvDF8x3325aCC0XBpUL3tg31ABHORIsid4nXtF
	C8imaHfccmHNLePZLJBvFLWLimbARJQMF6fngCwlzHQXh+/QGYrfnQkPxsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr23k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2369dd58602so35261215ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605110; x=1754209910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwNi5jqAVSvH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=;
        b=p1NtK9O6hMp9qg/3dxr6DTtHS5ptH8umX2asF9vEfpPaU4TTeEWTXw9Q++vkZnDuGq
         K0gPzgsmCwI9N0hAOHE5Y0rv2olo56SiWlWMgRf6Nw2fbcP82xBBC6o7iDIr8PjOhtfu
         NK2n7xdmH0FgwR5RzaW1yoC5B1bh6ClcMbXW8Oyt2pout8noTgJP9xK1theZ6mVOLg5L
         pA3mnBZw8RvHsQ5NwczIDNedwm5qcWq9JslRUfafdWagS4DpAANw3p3CL1Hic931fYvz
         Sph1g4PABiDlA2Fx10SCks6EGlnrx94yLUue5eSN3LIKjpdFUst2F0jGCI/8bvxiSHSu
         1brA==
X-Forwarded-Encrypted: i=1; AJvYcCX024rm/SNKtIWZLmI5JrSmjJ1+vMkuSELampQJJyuBkyYnX8DtecJUSWHY7WK+UsKF8WgsVgByE9nh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhb5kKF/KNu3Zw60bFbXAP0bISslt+JBTLa1xkbeNP0Vf3ASN5
	yQ8PfdB51kQ3GDCpteu3jh7KYxD2wRQLtIqTkiwYYG1EdynsfYUqPMWDIhSjeEftb1kG/dRzYQA
	L2plQPz+jYEl17jxRgkoiLYppS5qu5YhhXJX42fcVnFk09FgAe8QMMPxOPpmsI2Zv
X-Gm-Gg: ASbGncuXqFOC3YiyP0WWLAttFHKW/SofV3aDOST6bzQYgU2ufq3w1p6BPY7LBIORTdL
	OF9D+/1lXF4bgKNIxMl9CtdaBQKrV083TNYiKmlVYvu73FN8C1L4zbOs4D2Q2M6Q6cndu/3R9zk
	sHmW38ANiXrc2xjyN+mnQk64Bn14EzEzUyxPotdhhN6OGRoyYK1sInVEZBzPfgSyV0XWPR3c6k/
	L2SXc1E+dYTbAzB0fssWuvOn38hZb6L0drN2vihBDUOfPLBqaPmfwv0RhXbMg5jCGudht6tleXH
	TB4KcUx7CROS3xbVGDNFMH2W7870/SrRXAobMt6No1DjeoEWlNmpU2TmylZgGvFxrrNO49EPXBJ
	3
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052555ad.6.1753605110187;
        Sun, 27 Jul 2025 01:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPCA3gFX6YamqhgdGjO1m2DVjgSysrzz5AvHQkC6e/zWEA9GvZU/sr+aJlTkVRUIhwXmMMg==
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052185ad.6.1753605109738;
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Sun, 27 Jul 2025 14:01:15 +0530
Message-Id: <20250727083117.2415725-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfXzoxhmO0slvx6
 786g0PQP3ppYhKjZ8MPMCWuXj2YWABtwY5/A/NfBwnC7kltoGykNrzvN6CvlLXg0XI06fDvot2M
 ttWAdwdumoNWlrSgajKLkLJpUwLmsCGUgLkb4B0ERiD5ioFY/MVpkZLZDBDqDKSKjcWcK8v05+T
 YQk/THLaUglIgS/JR2/A9sJLYA2OSpdsrtQebIo5o4REto57gIAQ3l7+KAURZuCELvUlv5x/R5b
 jI8n1NB0EYiKOVTi2tr48wQ/vL0s7MIRqUH+BxhYPB7/Da9XGDd5eFq1zBglMvW0vblsDMkr0Fv
 KmCYV4BLU8keva8diy/c2CsGFGSTezv29toI8d8Id2dbLVVB++5DYKmdkJQhFTZyoJUXwep8C07
 q1eT9CmeXapMWkyNYBDrCzTIPGty9IqFU76RTY+143KHMdx+S6CY5VO84Vhl8VptmCD64QCx
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6885e3f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bh0oLYOIOhy6JFs6EuO-eZ4wvqe9mTYo
X-Proofpoint-ORIG-GUID: bh0oLYOIOhy6JFs6EuO-eZ4wvqe9mTYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270073

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 14d312f9c345..098f1df62c8c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -29,6 +29,10 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   vdd-supply:
     description: VDD Supply for the Codec
 
@@ -50,10 +54,15 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - powerdown-gpios
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


