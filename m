Return-Path: <linux-gpio+bounces-21932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10BAE18DD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 12:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DF294A5A65
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCB92868AC;
	Fri, 20 Jun 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaVgOEKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323D2857CD
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415442; cv=none; b=ZgC2dMezneKhK1mffIv1TIoUCuess3HHdesRTJVPRHfqyk/qlfgeeMvU1mFsXeCY4Qd7pHwWLQD4O3jB/FYWWK2HG+Wv1vI45B15CNF0iCP01JiO+qSH9lnPAZrJAvaR37BBAanVOOmjzXVKcqBoBup21MS8rdmlnKuwoi4niqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415442; c=relaxed/simple;
	bh=FACaevhjabj+99RoTiQQq1b2jCviQK1t6Im1KybJtjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0zxcCgjaPnilhLDWAhoWKfcWXUj/z84qZToWIKK5fHRMdq+zoo4eJF6/HC6rjJ84wGBas55+J60h538na7tKuKHdxooQxSuXgb7/8pQ7MNCyeae10a9OfW+7EcLDRHONmaVG8+alHY5Chg9yfPKXYoJmEvFOlIPqw2XCbZmNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaVgOEKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K764Zo027539
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4WuNA6VbsB
	h8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=; b=gaVgOEKHZoPuF83f2WXzGvAqQnB
	vlQWW1Xv8ZtbT0YxCQdC/ZmvWPWdCmdHBnq+n5T2RGd7pfoybSLDissfsmtRuE4R
	+ydx8Ml+bxF7+k4TrwvsKnO2I/R10mIk5R/qf8jNHjJpi1KPl9l3S0MSX0AA8+a8
	hDR5Cl2qaN/MNIgkBG975tg8FkEPp+ekc168h6Ytri0QMRDgu+uS6A7l60UCQN9u
	oSp9r25oZnauUhg7RWwonko++1GixvXLouiHAWR7TTJdaSrgWundwsM5HKH5QNDM
	65R8MAzx7uv82FZdN03IF7sC2ppX4K8C5LSozBHpfiDomFeIjIZFl02JXAw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdb244-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so1907167a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415438; x=1751020238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4WuNA6VbsBh8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=;
        b=D2/ZuJYTNVaJYNH3cV/qlru9EUPrALJZw+So/+oUbSx77BifqB4y0n+0d/1TavIkM3
         BxvMbbKrO4V8MoHq8Ou3pkd1udRRSdJokjez6xC8IqQTI8Mpts+3iZOQcx0wcodHrjil
         1G88ZvOQlhsSTaIXvSRqaHnnGR8dNWrAvz0i55euSMfcukbCGTHhau21PK28I1iWylNb
         PFn85+LNSWvUyztB36f/Pemq5X/mOo07Gq6+ztfywrdFvnB8z3ffBpxLANbANAF11IBl
         eIo0PJaELaFXhrCIexRT+aoJHOAGYQIE0xz0FjQ+ZSlrEEQxUBUV1glAnOD9UA6UHZ62
         maGA==
X-Forwarded-Encrypted: i=1; AJvYcCWwdKxTOK1I8d8Vm1UK6Wb+L3d3Ndghdo4IS5TxSEWiXGJ+L7Y6YR9Y7vu59C6Ce9Jm9x1noW6vMhom@vger.kernel.org
X-Gm-Message-State: AOJu0YyQMaSPRqjtiMsQVYuFb8y5K1tJS0eDuAm+SK83TLxSIhvbde9X
	35UJYaLyihHuG9CbPIW+Z3gxlbaWtI+udi9cYkbu1XBVtZpLGdGWGu/OazHbUHnBvPlf4jNzaro
	3yb/n9L5K5eS4lOEBqQfFcby2d6Prs/J1SpdphH6mVupSApR5Sk10J/0NTF4Wn4/q
X-Gm-Gg: ASbGnctqd/BYjCqTym3VyG5Yan0vZEzXQ0Le5kE6KWzHdyFC9zGm66VURgwX66TI4Ei
	LkUpyT8rsZCL77IkQpqR+X1S5SEjKiNxFrrxtZuq0VOob1snp3G2fb9wJJsEKZXIVJ9uXeCS11H
	8MyEjnyCyHptk+OAXRWMQTHHPWd2G2XS3LQxQBUZYBu+HjDdS05z/h0nKRO+l/bdjCho2WiMJvE
	pljOQMwt3Lv0zKMLK/6gcqdgwgP44tPtRlYHKnmC70xgxoN7NHYIgqTYlVLutcM/YxbQzw1hS0y
	obpcnjkyrN4ZIG9gpXZ5NeJPOnGofEdqfEYo5Oa9VDL3eV8CPtOdCz9VeDI=
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560312637.10.1750415438515;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRepHQERqynj9bksMS2WBRfE9QQUxy9vlASK1Gx1FVkJz/k4AGWV4kq6UMQPyMo0LynP3AA==
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560253637.10.1750415438066;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:37 -0700 (PDT)
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
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 20 Jun 2025 16:00:11 +0530
Message-Id: <20250620103012.360794-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfXzMT4aB2qdvHY
 HdkDcyj+KM1YVCzFmKguJT7elNKFRBoPXEbCYiEZBPVgX0t7mCsWJrhcKcBGTqeaQ736ALRq8kR
 y+812wiQ0LkY+YOksenxBvktrx6L8Tw1w2mEZLrwa4Q5p+8pXkf4OnDJmbtDQQsVEVK/xERJ8hn
 V3uYTneMfMr8BvnUDoeycbmnJzj8sWtma2en+fWERbWQ6cXKeXq6QTix4aY792nw6rS16F7wBZg
 SqIou7N+3QcaWbwTG/jygwM51xVV1ruHFecqyUlUbc8pRW4KMq5FPuCLGK3GTA2DqPtib9+13a3
 xvS3QDgqtNvlVzD2/+RTyp+R53m7lDo7CPgWrskuQeQyWgu1rfdAJ+/Z7x8KglJ9bQtglCfpMTc
 eC8FcHzNRa+9FklVWyP9lGRNh8mePpfSuqRXpUjwGmka7SKXRhmrZj7eEXFCS7FeVvurdO35
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6855384f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WN4HfKPq_xmDaqbUiLYA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zqFGC0fwJgQFa0xbvrGOHEGHGKPhqHRy
X-Proofpoint-GUID: zqFGC0fwJgQFa0xbvrGOHEGHGKPhqHRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200076

On Qualcomm platforms, like QCS6490-RB3Gen2 and QCM6490-IDP, the
WSA884x speakers share SD_N GPIOs between two speakers, thus
a coordinated assertion is needed.  Linux supports handling shared
GPIO lines through "reset-gpios"property, thus allow specifying
either powerdown or reset GPIOs (these are the same).

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


