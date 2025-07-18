Return-Path: <linux-gpio+bounces-23461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F5B0A0F5
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 12:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91971C484F9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E78C2BE026;
	Fri, 18 Jul 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIangq+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000AC2BD590
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835618; cv=none; b=D51RAhG847KmztrumyHlYuarWmQOKqd/gokTdwJzwcACP9B17vnfaEGKAI75SEEgsn1or+V2ERhs0jIGizV97LKDhkg2iRM2D5WS+DvD2kl0jppOaF5Zez1C1aVnUVW4wiiYqW+qM7PoCWhezyXFtqpoQziUw+FuIJ5X0aqi59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835618; c=relaxed/simple;
	bh=5wy5crBqCcBbvGTsXxUbWrxKJE9+Mz5wRtahEqlnRzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klI4tqTNtHpJl+PwS700p3ewuorrrd1xcM47BiJscwoRceJOii8bJ88k3VkP7b2u6L/o3lf0yeyny00UeIgY4p77ay+9LTVw1b6IWkaT0FNHryGv6UfWscyEjV4qXoIXZ0gNhjcj5Jdbg5ozkTHclUfPnQBtNvw3ZsmqVnHZsp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIangq+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I9DEjK016003
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gif+LMxG0jg
	Jt8xMw6rl3aERVL6vO3MZf5qPtUSTZH0=; b=fIangq+hI+zckgCjxrXQN7L0H9K
	08dhqExUB5MuSucXCkH8Lf7LUSKvrPw0N+CDS+Ofll2kWuvGebjO6qnySXcPPYlU
	xV4NL4fBaaMvsa0ZXbSeVyCHgN0QIwkKuGuy7lIl2p/cPx5F/IvLUjd/rCEVPW/1
	Vu/dse7ab/pdXhn1taBDZrotpUqJv9GJiwkJ2+zOb4rhRLvLwacuEIv1iCEyc9wi
	2u3kRtjYtsjRzKhzW5m8VPrWO/4+koRROa8R9QjO6ptGxStlZgWYk3fOZzj7CWlb
	LoFTyZT6iWHMzqBGR4RCUuOQ2jcrNLAfFYlrfFYNjbFCDEHTBRqODupVrWQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc329d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:46:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75494e5417bso1944584b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 03:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835615; x=1753440415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gif+LMxG0jgJt8xMw6rl3aERVL6vO3MZf5qPtUSTZH0=;
        b=pt+b5HSQzOlIxQCiNvtOyDzykqjvACMFgrEgfRUXBDu+gQztuYjKQhRM2UNICx4ZGR
         LVrPULjy396SIMeHBj9ELIWm8PhBD1TUks9uUlJs7/sQIVHA17IyIXagnS+ue3wWjgQt
         kGrtxUqW/d5kF5TkBOUlZh7kFJ6Cs/fhicceowC5PxJ1dw1KPud2cqKqLobKgFOHVGz6
         J4eB0nWfaqSX+FbUxwNx60DH9V7RpiN63zJBWXp0N7aSofU/eJOTG5hCjP9W/MqSf7GN
         JhFCMk65tmbELH5XYSYRrLX55oCGtXA3w1JOdTc+DCN09EVwjEDjO6AmeDh6hGHwQBj9
         3/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWOPNkSlJczqEkY06iEAfNXuWbl/aiQaz3lSwBEYX+YMnqI7+Hric66/iqeDl8kpQ20GjllJ5xCl+TJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zYE8ZezIXgQpa8ZqtlmA+OuIeOsPVNy+bMkUXxfFFqUh9vho
	xv6xLXx90qOBbPCAvWScioDqIQIs7HKXxpyfJUXnet44GvovYTal9+IqQKcdIde9Z6VH+gUlRuL
	IDJcvuDUj5dMgNVcotKH8aj01/LHYWH/9CaYpm4wy1XTC5TEuJb0aJ/dzMW0bT+AH
X-Gm-Gg: ASbGncvF66TBN5+6S5/ye7/O7dzbY2Lq0xSxrov3ogtpSRbZG+JPPOzfhs4kTX8rDVU
	+t1o3NW2k/HcvjlPuktR5sU0JF27lFmRNazP1LmzdmRBl8mOKf/VCmMnUrlgpaFqIKCSTCanDCe
	lKqh72+p+1bJOp6RPJeLs7gEeTC0Yz5xq+LdsnNYM5vCjYUhPmQ/1LIjmS9mfiz4xukCP5PFDwo
	SBNxV6T3+AGCgs2GSsjn3uEC3D+R1WycNprx1GEtmnE7gv59/Kl62Tmyhoc+EP31Z5s1xVqVtyP
	nUqWNVV7rTWFEj1I73F2DunaaV/kbbaHOuobGEDjqCWoFhgrn3c41WdE0Ra8CtgeTV68qUI0+uk
	w
X-Received: by 2002:a05:6a00:23c6:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7596a1877a0mr4234456b3a.10.1752835614982;
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmit4JF/V6hPtbEMuCGG/dXgfpFvmuDdWI16KeBuC6kTA9Y2B7VQ7qoTDe0q039H8l4VRUOw==
X-Received: by 2002:a05:6a00:23c6:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7596a1877a0mr4234419b3a.10.1752835614441;
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 18 Jul 2025 16:16:27 +0530
Message-Id: <20250718104628.3732645-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a2620 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: _5F3kmTtBBdzB8OId6lPa2xjT5zPNsQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX6F4azsK3dlfX
 qriKaa/kky1OvmHhI0qbR3jjV4LWbqRtL7BVoBhkNwHJXUvcBC5CbfNHFYVNgqnuLKs2ck1AwKx
 Nk4dOLe6Ak6xmvzTTYTKpfNv1R8lylQnOUCaH7OCVALDDTDPU/kR3DUI/4QqpmCZ1Z7UpoKEutK
 IQ3+NJF2+5ygapk79xJBVKwvO9QzKNN6Ei3czS3F84WOLR4tW1HNWYT1JZHXlRiRXXT49CZGJoX
 +ps+nTRusM1O3yjlr9MP2FVbayPLtYWE/CMVFcNEcwCm8YRctHs9j8Zb9H3gHaI8b/sJ8J98Ptk
 kgvY2LrD+Lo6PL65J+vnBJ10uZqaLz06YC0KCE6Jx2VFlqsof1qcpVutkE9m015De0kNjEM+DVn
 NBfXbD5y+a7SyqbO48j8K4yfrpNAib3BlJOpCecbXTTmv+IdTsULvw3U0ALHOWOsckHu2cNQ
X-Proofpoint-GUID: _5F3kmTtBBdzB8OId6lPa2xjT5zPNsQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180084

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

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


