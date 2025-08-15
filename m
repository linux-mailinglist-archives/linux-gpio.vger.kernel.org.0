Return-Path: <linux-gpio+bounces-24441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD805B284E5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 19:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31975A398D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426FF30E82E;
	Fri, 15 Aug 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFttS+lY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811921EF091
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278668; cv=none; b=ixHiPJOEOLltJvkK4ZxhHB4DrtgGs9rTjMNWBGouWKlizlnnUFSPM/rXyDNo8Gwa84blPT8x3U/Y6zaBEqXmk4GlZBysn4JdX2EXOgwO2HlZvRYje6IvDmTU1f2rrvPGPEoZ/UbXgwYxZedyaRf/NJLGoGdHEScriyiEfjWE+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278668; c=relaxed/simple;
	bh=/LB1x4MuYCAm4u9ZYS/2Z2F9Vv22NA/IaCMMGFomePc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PptIzQ5WOhrBvGMEO2knKnRtxA5pG47H6xlHsLDNmnLjjNy7qkiwQKhVIQ1GInU/SFbHh3np9eoUOf2HtrzxfRYVFXCmrqGNK7c8ivSFN8StZ5Kv7Ut9MijDX7vm7LXC6qRTFK63GGKy1B+ElrGjdrJlkqon66alcBkbPXHr0AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFttS+lY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ5WC002261
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3x6BuZcuYvtL28nrF1fEIU06Y2Cx3qSZPx1
	q+SLHa/I=; b=NFttS+lYGJ4HkhxFyLnAE9QA7jZYFyR7yQpMmE5ox3E+eJyMzkc
	JGm9yyHNHpzQKBFALNPvNrMKDGJEkc4Ho1rrHsd7P8VOTv+3ph5meiUHmK8pUuZc
	y9rrfGskjdJIp8bPEsvV43cs2nIpKvF/uulAm95Gjfy2/iNoaY/3+sho3UtLtFaC
	BLUAVvLe6G0MCT5p/804a6UOVKNq2witAroElcVUg/JfwXJt3XjhaJmzpidqEUVR
	QBmS6Jlgl5AmcVNUHAf1nwKnFcLSDkTpLxb3ieZpF+Bw4cgl1RIGegvISJRuDBhQ
	hMOBkvQBDFlr3P4+NXr/Eo+KOCrX7CPyxDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvbq0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458274406so45908255ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755278663; x=1755883463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x6BuZcuYvtL28nrF1fEIU06Y2Cx3qSZPx1q+SLHa/I=;
        b=pJzjjgR8fYS/8gJQU2t+sZPh56NdY1aKyXQW/FvMCtazySqUbb4FeMaMB0dJrmk90n
         0DrhUkYnmqhUhrJ9HHpeF6V7naOnyMxNl7JdL4nVNk8czgX9+HXvzIdpp5wOXq6lmnei
         trcO7vL0zxKhb0qlzntXOSPuo1NeIpOTKcl7aHP87f65V1hIgybbMyrlCIABUTQ6BTXi
         qdE/1Jv4IbmBCkHHgj8gUFX7JNECCjLHAipGX9Q3v11rf6PncbNeZ+Si1x5YPTOMrGfO
         yFPoIMNQmJPZ2izIAwkgbneILSRfKkUZkyrrtZpkg++WZvOdn4D4m+nV4UALUq982RjY
         JEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWztwxzNlwJIVXav2rsjAcRtiSiO3zSYcdAfKkxl011c/Qptypg6TYXaJtQ9ukWtepobPJGjWzWcXhr@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpQCZb4RqHC+vtViZu6+sONqSX05JIW8yMD+fs27PAry6iEkK
	Kdjc6tInKnQdJENel3GZss4BIEtBnbs5xzIvQgzSFTBEn84PPSYRYnraLRn/wp4rXLi1+720KzD
	vsYX4rYdivDZVNNd+3BV+zOq1UINIH4Pu/sdOApKvK24O3J4elDzEETm07AaJiwFE
X-Gm-Gg: ASbGncvxDKphy4yXoPyTDkDJF3V5iZXRwmeR32jvsj61G4Kw9k5S3hK6uB3g0BStdyS
	vTLmGg31mKmDEybZjAsAVMMpyfg81i8khFpg5yp5Th5oXX069/dd0Dl5BDAZnEUVBkx+5GHaDnt
	g/tHw872DqxN1IuVGJEDCFnNbzsW8T5uA0qetBrY6BItnTKg/dFk9pSQUZMdnOxzZwYJs3Aq43N
	t+1gvPltxJNKKwB9bdIt8tBwyyfkaFYWI3CdAnrYouM4Y5aVv36pPwLWhUnyYozdkmwRCSsPrPl
	RAe0gUamp0+0suH7YHTUJBTqBKcR0Jw/7yyJ5k5PZGlHku4VFPjcD2t07j4kvwHaDAZ3JxpWQ6b
	d
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr40064875ad.55.1755278663114;
        Fri, 15 Aug 2025 10:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5M8anx90Lfv7XqfVtWP0jnq8FQcm1RoCJc/Do3JlKqE7ilXwZ5DRXQ5mWQJWHelWdjx8PWA==
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr40064585ad.55.1755278662684;
        Fri, 15 Aug 2025 10:24:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadff5asm18404025ad.42.2025.08.15.10.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:24:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v5 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 15 Aug 2025 22:53:51 +0530
Message-Id: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689f6d48 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fihhyCgpykPbXYUG4mgA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: QuulIWhmjVwv4xZfu38MI8WioRuqqRL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX2w3YHwiT/IZg
 jTQi/rdttUFeq2qhswc1KdWl+zPCeS85JMeDmdJqaPv1nHLyKNRnkIQbUzlYh0W+MZkpZSwEIV3
 pz3cScpzS8vfVAsw62c0/MoG00CArjj47+LKVPcRzViR47IJYWHqOlByGhPaaxfJbA4jTdcs+2R
 64slmEEkPQR7vQBL310xUMhiiONtSOg83NNP7S6JSay8i7nf80k/JSTtE1tcQeWGkCotDPnlKew
 5a6QIxtFEQY+5aXtSvaOuyDn7T15CA5RJwdqiRq6n8rL8gbZRBL6OLhx+Wg1KekYrUvG/cBBCND
 eH/DgjFjlCsEe4fDHiSxI9fL52K9tG4jA+/c4luUKPAk2m3CSDWWLhP4prorl+1oTZlPoJypzHl
 vgctCsSY
X-Proofpoint-GUID: QuulIWhmjVwv4xZfu38MI8WioRuqqRL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v5]:
	- Removed multiple error logs and used proper shared reset API.
	- Link to V4: https://lore.kernel.org/linux-sound/20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v4]:
	- Dropped v3-0002 patch, which is not required.
	  Fixed with proper error handling for failure cases.
	- Link to V3: https://lore.kernel.org/linux-arm-msm/20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com/

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

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 +++-
 sound/soc/codecs/wsa883x.c                    | 57 ++++++++++++++++---
 2 files changed, 59 insertions(+), 9 deletions(-)


base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
-- 
2.34.1


