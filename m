Return-Path: <linux-gpio+bounces-24044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B2B1CBCF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 20:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11E618C44FC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 18:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47F129CB48;
	Wed,  6 Aug 2025 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdcftEr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7FD29B8C6
	for <linux-gpio@vger.kernel.org>; Wed,  6 Aug 2025 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504338; cv=none; b=RlJc207HeOygXNweQDhT1fVuQh1JOfk8i33mLebGB6XVFYwTlZcfuDJBjhc0m82V3OC1AdCnNS3+zoA8ACu2Mj+s1SAeZ8XIlJPkXmL0Ghg8vQ9iFXHX+5Bhwb564yr+4oJ5nw0UjlSdI50PaRFbAyNTXELYtrTNuaORXZPF8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504338; c=relaxed/simple;
	bh=NM5eUwufs9EQvxyH72fi6ouw9HbAH6xIggTFFBsajLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I3GUonuvwAHgBysRm4bXLRGXZHRoqWgv6JP1ets9bYG4R2fQuA0AwxwHXBWoH6AzaVVIttauToOvywFuplwyLVbM1aaDNOidj7UXaUyE8ufismhpzoafletc8i7TfEHW5CKE5klMy+316/8xPQwiD7KIQvNRiHA2BShyLKoMHRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdcftEr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576E9Jj5021958
	for <linux-gpio@vger.kernel.org>; Wed, 6 Aug 2025 18:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcwNi5jqAVS
	vH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=; b=kdcftEr8krSd+IzqJ9tRWKlU3AS
	gRU8EIpWJU+T5GyInolsyLz9vx9jtKBHu0U2tEXQbsz7TipjNY2fO+V0YTj8tevr
	J0nx20qfMCxVgHrV8zjvLFyV2l/5200ir+qfygh/s6Jqkbb3dFA835jMQVKHSF0u
	zZFe47+zJRxOEBoTNniJLgI7NDE3MY2r+aXQHzyf2RfOKIPDcz1XYcsA9ooMAv/E
	aGrnNMAYQcQAAwyORO6VjZKURSeL2TrXcVcbtzHYFKpKMZSvKoeIiiQOTj7IO9A4
	9NMsakDaknLq6BHy3iuJj0Rfpd4KqZ9vpnuoZfITnL+5xMEDviBZoTYuLGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8bn8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 06 Aug 2025 18:18:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fd8f85dd2so1125615ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Aug 2025 11:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754504336; x=1755109136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwNi5jqAVSvH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=;
        b=QRlXDvnmVwbXA+6UGnLs29uKYXjuU2x5wui04SEp7phrmVvudqCnyvO/OJceHCf9+9
         WObluPnAge2VzYgByKF/lYHgoCOcXJpoV09WBHNt3OydUVd8SZSGnTOZ6+LhPBtAfnYn
         EoKVsEGHDIqeyWdUs1m9Vk6FINu7vcWlbEcOh8QO2T7y8UVXdwvwV58MLWs6Lkm7DNRr
         nXTkRF318n+xzDQLJTSQZU10pPjhf1TE33LTwRCCzKSaL0eSdKfaXnC0+seJnHG6hCTi
         0DfT+T+H/kdQQEDoJ05nHUZuQHWi48qCHawb1pT9ssu40arwHCIyBN3IhU+S/uYBIpnk
         9+qA==
X-Forwarded-Encrypted: i=1; AJvYcCXToT8u9/ULZ/Qf6Aa9DmiBZhiVGPry58rbx+EM9NY76YFcA1NuI8aI+26maFPZDCRBhzM0Lw9++UBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3T6SFbjFKb1yfCy4G3uIug+L4dYBY60bJMPhk4QVS2BsbbGUH
	ADiMdneTPxmUYUBjGiV3MSVhhinOnfdyth1Xae5oAyzJOQJJq5rHVuhn7e4H+0ZqnoLLiPoGCc8
	WqZOAZDGzq5tzvR7E5b5J8/V07PPLtot2l8jmK6NjENPe65BPkhLZ++R3WCevnZoI
X-Gm-Gg: ASbGnctFPM7Nk6rgPs4V3u+NtgLG2Ov9A/wiR+EG4hncsm9Xq1fOHzAnSGWQ/z22Qam
	kmfz0sbQL2jWokNk2CaNkBxRWf4ldcGWnCzJrzE7VYIAE5K7WXb+ySjGL/zKh91cW2gnE0zPQZD
	Htg6SAOmhqJ+yqKO6AYUrORiPNXrx50i9EP8B6ikGFRRkWlp/Byy3or7IBiipi4bpojhWbFB6Tg
	msTYh6LwIfs1Fb0fD0V84vKScYDfFPttWoWnF9lt8F/3+fnJaZjVWK9IR0VKyRZNd5wgBaU+oV4
	5PX/oDq3AL5dPLCMVdXoT4OqDuvPaNdpAUEGNgxYyoXY4hoWEdbtyHCRqmz3lbhtl9HrOknpcS4
	G
X-Received: by 2002:a17:903:13c8:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-2429f54c7eamr61943475ad.40.1754504335559;
        Wed, 06 Aug 2025 11:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtnljZKXOMWdBRC4f+HxW11Qf1guDBZHmC+q3fOK4zEG7lfva4EPwAY+d9RnC5k2MlPPZAyg==
X-Received: by 2002:a17:903:13c8:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-2429f54c7eamr61943105ad.40.1754504335141;
        Wed, 06 Aug 2025 11:18:55 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm20235186a91.34.2025.08.06.11.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:18:54 -0700 (PDT)
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
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Wed,  6 Aug 2025 23:48:17 +0530
Message-Id: <20250806181818.2817356-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: I70hhoVRvSv4MczkqFU5ymKd6oAoVjOt
X-Proofpoint-ORIG-GUID: I70hhoVRvSv4MczkqFU5ymKd6oAoVjOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5foLe7RKqyT1
 ZKMYFWWDY50JtI1BcpKcsuoWJoZ0Wf/ZAp28dwaUVnF0YAe9bxLaTbJhLgJ4iXCfWGubRzP5Ij0
 4BTKkrfU/gND58r1jCoKbHIOygRYuQrUtgi2UGaf7GO2n+68uLHgQnAY2lRkGtsm7l5yN3YluJP
 f8kPGVg1Ky0WabM8+EVD5jTeEBpknvtrpcH6Ox212GZaVcEPQqU1mpYBAz/BdetF51eCFK6HJAv
 loyg9bhovU8dbqE82L/dY8dt3JOid0vvTWPm+k94rYCeeV/xjgPl0avHOQF0GlLzRTUuNHgenwF
 BH+OuDaeelM/gLjyPq8OxHsvrYqcHHQrBABKfqlQAY97ymGlV63eE2bH7eWyfSFE1iQFUCxloE4
 LnHJTwr4
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68939c90 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

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


