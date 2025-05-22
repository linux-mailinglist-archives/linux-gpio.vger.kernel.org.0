Return-Path: <linux-gpio+bounces-20488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A39AC1254
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCC3F3A9078
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0246F22259B;
	Thu, 22 May 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Muqhb8Ad"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482719E7D0
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=tJ395IH95HEaqKPw3cSK+sFvIdDwGoY6wbo16Qy9p91pPnGb9I4Arw2+9zzr1RPJ+2FAcrfEn8HO/DW3p2vGZAtTpAPXRqO2GBga61FGSQC5DSeKfGnacPzacSEyHVzk2Warn7EbMmNAize/M0Qd4JaA7BedCmPL/xmhWot8Zf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BA1jWJVLID2R9S0NjaKb06T2AIwSrYnas/chmrTU1rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+r4h6V3MBIedyrcn5KnEY/LR3jMB4lQgEJ0shbSYvVjlxdoHt3G1iFxJ0rxqTfoACmUron+f5JbdZL5BaNyx+O5EiOWicblcZ/vlB6whPykCH633/3/YhH5++q6CBxY3A+Q6f5wl8pE3KCc37jhZ2B2hFvYHs1nD5M6/gKqtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Muqhb8Ad; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso58421445e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935655; x=1748540455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=Muqhb8AddjGNLkck7BnH5XbhAgpOCaWKnfp5eRoGrgnqceHhL1k+JhcCTQmY8MXG0G
         5YRqM891x9LpkCoWXv6+4A3FAJtbp38jUxW4oJXsg/o2pn/hg5GHU5fuTJ3Ab5IcSWWR
         kAnBaGPgkDwtBY3nl1+nDstvgH9N9AXs/SMXBrVyQQUW/ABAvlw/g7nAt6B0vjor1Pxv
         hMkHhZdNKzMCb9KOO5IgVOYmuuos30Uhf/cwUHnIhctfqew19UqrfbBAAK1k6CR6w7FA
         pF1zbvmFPYnKfhftZzKDsrRvKCfzYyGcwmMZ+jSSdyI8Cf7XZoLAMvAmXR9eOClRleOb
         64yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935655; x=1748540455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=d6AvVB1pFQCI67uU/WvhU9RgpcyT2Nkt964Xvh4V3s65NnolKN4YAAvd5Ah9JMbmsR
         N++zXCum05ef4559sNkFd8aXOaW2PWD5QLuX86cyFK8XKRcMurMNAskrjYb23Iy0SNiX
         550jYf9ViwfRXCx+DEFFRus1JAtzmynaZpGwevd+MktP2HIXbdQk9djzMpHUxHJ7CvEF
         mxiOWPva1BqHww8uDmlMTTWKZoME4utem71kFWsKXIYNGZuzeaeh7c62SWDCeUJ8uToE
         hQkkxgLfB8TkYrBCBXE1O4ZTu8rRMoCYcVkXy3tdweykH2RSWzbpJQ4FgQUE1zI7SgCN
         k/7A==
X-Forwarded-Encrypted: i=1; AJvYcCUHk90S+4QAe1h31lphqp6ui8bgj0rka/0NseZXA4FJoknufK7N/c9FNmkj2TwCrnaD8mk1ZIzrEDNn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYj0FQKxQ+dQAWIhfojElgRsRTFdvfPrb+dFSRx7sYXMR1r4P
	F0JfmlHjbAFHf2RulVS/ul5HXbR13Cnp5b5tNT2gaZ9URNaUEhuPhm7ldl8xRUrb9KA=
X-Gm-Gg: ASbGncs77v2qu1WKQGIExC624UmreAruACyKxr07W636yUdUdIz/xR+cpTfCyFA3JHP
	oSClwU2V9Yg87l/jk1cxQUakS8j0m0pidmOKgiGzonOaMUqqMuZrEvSWTJLheT51aEr9zznl3Na
	tp+oE7bBfpcChYx5S8mDA9aodEe/Nnpslt3dElDFYDD0hr5Flb5++55cI2NcrfWpAG2UZ2DwQ39
	6I4pureNYAFDySRIqQOAHnUgfYImeFqvNTTLSM1qNbgvHCfOqbebc/+4VWz8Nh5AQxPvinI5J/b
	58wH2Qase+okIE+ZHfcnOiUJZ5vL776ic2N8a/gVws5hn7HGke8qDY0n+Kw=
X-Google-Smtp-Source: AGHT+IHIlbYVvYafpeIO81i57615R3Scfy/N8bbFiofLBN4IPVuaPtS1SroaRCpdNZVnFOjNX4w3Fw==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr269251575e9.27.1747935655391;
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:51 +0100
Subject: [PATCH v3 01/12] ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro
 and vamacro codecs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-1-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Document compatibles for Qualcomm SM6115 SoC digital RX and
VA (voice activation) macro codecs and their clocks.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 92f95eb74b1928fde11ad86ab6344f274bdf7790..697c5591ae7cb82633ff0159fb31d08b57c11b97 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -80,6 +81,24 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df57c8186acf4cd7bb99e38dbf89f0..a70c0f36389269756b724889c335c1b0bae157d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,10 +14,15 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-va-macro
+          - const: qcom,sm8450-lpass-va-macro
       - items:
           - enum:
               - qcom,sm8650-lpass-va-macro
@@ -109,14 +114,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: npl
+          oneOf:
+            - items:
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: npl
+            - items:
+                - const: mclk
+                - const: dcodec
+                - const: npl
 
   - if:
       properties:

-- 
2.47.2


