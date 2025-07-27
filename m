Return-Path: <linux-gpio+bounces-23848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82DB12E99
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 10:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEEAD7AD9E1
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 08:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F161E22FC;
	Sun, 27 Jul 2025 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQblERF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146B61A8F84
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605109; cv=none; b=OgOttbpC82gMC5GCYwm4whfz7uLlMrH5v1ryJ8IB0h4aNaRhUMziv1gTANLz5a4LLiwV4qozscwnXpQ0v8GgUaVyYtOuFyoLF0Iz8ZmrOdXm4DOrPwmk7qkQzT1J2Mtytox9CCIwyCHlUeRmZzhqxqothTwYMHGbqrWx6M6SsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605109; c=relaxed/simple;
	bh=mOh9JSF12KAgNeLKrysjhxC4RG1o5eujRw6xxWhT4tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wrpo7z2zazzn2goH7VL/+2pt3yX23Cfz0aF7hiS+4zCX0gLanQfLFE9qbqP+HZUjTb1ApzUiwEoDOFxc2EB6dl/kI3lppFv1Srnxf26/PzHmjiLzJpY1JPHJ/5ezhhQoLnCFOw2YB3GNx20bbtw5xjnqsHWjmAqQIFB980YYSNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQblERF6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QNVOJu019239
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJ
	a2uZkD3s=; b=cQblERF6eM4d3QW3HnNX+BbnCrxZ1QbkggD7Ruw88RdJKXlGG1O
	jQ/as5ItS8lrVe4iMPtqOF9g1aWDdDo7EcsVAFfflWudQzLTz43j72+uz2ABYuOi
	c9mTtQQJR7mG5ZlrmNtNiLfBT591Jvkg/jM3ZcFQSRmAlWzBZHjRgvSTvhEkNZTG
	jf+MBF+GxhFa7LHgXEk3qBwUIXp3W4Muve6BHKeWXKi6D4F0B9W40O2AyHvtzbZF
	GpHFcXSAOxFOeBTtRwx4+xvx0cSvJg+S7nP/pS0m3ZBJm0EuK/dIkNUC5n+3qZ9k
	dRSSnWz2CwDb8bKauoFXEkpWhHsT07kc8RA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484rachspc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d66fa6so34050535ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 01:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605105; x=1754209905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJa2uZkD3s=;
        b=U6gUbaT04oU+9Eg5vA5SmWglZRVbCCjSJsV22HOekTIyf834mnPFUmkOJdmb95WidO
         IrfW7bLMDM78QyGYHVMjBhgzlkVRaClGW8Y8CnloAVdiPMbNzcjfPCZksLCAFLt4wckS
         HhzoCmPH67DriA/zGQ5VhIU/TtVJqjBuqRZ5IldC40NcXz+fPZqYmho+Wwv9jSY6ZcOY
         kFU3aP7p78GMDU2tt+Dpvio+h/ByD+kfyVSTJK5UZHQBDXz706NKu8IncBXTLmukVw6P
         MF7Xc3VUNIy0dGh+roq3mgebzlwFZcq4OTRkB+tpDBfdhDhRfIIiQoEsb2sEumSUyRG7
         fWRw==
X-Forwarded-Encrypted: i=1; AJvYcCV3GcHUC7BDAQWrBf2KiSks9DPrKD/bbkK06hLOip0PBsIzWMB+oIR7yzVkA15Vb0HuyD01Kxw3hzsc@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaSV2YmGvyar1ZcyhuyxZNKf9Gam6MsUyUarz6/h73jSrNAM3
	L/a4W9j8KkbUpQqEh007GAMIoJ02kCpfPHtg7di5nSr/bgOO+o3w0J3hb6VwgB/R8RqdO+Apz8+
	wtS+aziLrSfonI1tNaoHVJGZDSDEH60c4a5r+fpjPShM2WSHdnONCc74L2Mjuoa4G
X-Gm-Gg: ASbGncvjwg6z2pvcIPucLbZb62qYJxloEipwlzWCNbxiP7B3932IgpmtxG29fCZ3feg
	oZ6iurGvXrD3gZbdzD2kimFnVsFMFk0kezfqlqEW4zIjyb4NJeugXBEBTajCzMGsssUBiUFANAM
	XUufZ0/JswYuRDh432N+03nY4cBkeAmKktv0f6GgiDMxtLzQNZa39tswjFiZkyrELayaUqwLx3o
	XGOqExaLeoE+0ghL9JEd56VZedlkeKLL8glsBxvwwXtKbE4UVsJrprnGf3VU2DdLtTE49J5uwhr
	mcBqxhU9bc11MeWq6z4sI01Rgxp89OnHOz+d2XDllrDdjjxuxKXbB82q/ujccgA03gInyeUM4sC
	Z
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119244045ad.21.1753605105131;
        Sun, 27 Jul 2025 01:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalG+mHbRKTRUIQDZWr2gEWXxh0RMJdEPGdsr5c2OukHXnD+E8VZ1SQE45YkaP4nrQTj3/Yw==
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119243535ad.21.1753605104705;
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Handle shared reset GPIO for WSA883x speakers
Date: Sun, 27 Jul 2025 14:01:14 +0530
Message-Id: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6885e3f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4I2HGNnryxoGv6TmyWEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 2JZ28qWVkx5_TQ4ZoR6WH1QR2TfBdF42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfXwm2sEiWtkl6P
 ywsJqEV5n/VE8wIl6fmi54FzOtRRTfCPUxVYMHe5M2g7zZxFD73urRseZWuvPjoMKHZPmdExQeT
 o1XzZg6enx+3bL/dHPXSczIFuxuFtuylUeKAEz1PZ2Xo1EHRYIel2/XbQi98Ltks3Qgj7bvfPW/
 mOBLFfwsI+gwiwgVuOjp3vl1OO/ePx5WhYQ7pdsNwik+qXcwF70F0NfdDMMbznNnM1QRZjmWoAo
 bMg0c9TAuxvu+DYT85qOfoiE+8NywXdfp3anoh1kVpuJ0TJR8SSIO9pMjutQ13VjOftTLmkxsLd
 LAUvJHsQ/Ejyw+iIZUDByRohWDfLue4A20KxheO1uGu9AJsJLSwrqP85kMSyUQDGSM1TqdQhPIl
 HzMIYo4XicQuzAZGKXRSeCBJToutDTTdr3aR2wPOvt/0rVL0aM1QF4erSzR2BsAaHidHQ9Rb
X-Proofpoint-ORIG-GUID: 2JZ28qWVkx5_TQ4ZoR6WH1QR2TfBdF42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=749 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270073

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Add devm action to safely disable regulator on device removal to
prevent potential warnings from _regulator_put() during device
removal

Tested on:
	- QCS6490-RB3Gen2

changes in [v3]:
	- Created separate patch for devm action to safely disable
	  regulator.
	- cleanup the v2-0002 patch.
	- Link to V2: https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/	

Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Add devm action to safely disable regulator on
    device removal
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
-- 
2.34.1


