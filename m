Return-Path: <linux-gpio+bounces-20489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F301BAC1259
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397E23ABB64
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DC222B5BC;
	Thu, 22 May 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuClYz/F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448CF19EEBD
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=C/WXp+dlghYLWsiVv2NGKTzq1kbWzdUwMqGhcFnLN1nOw5xCyNKCwdPeikUmA5lyp/tDUfABgA0acn/wARrC0JNV0IoXxtls9qxA9ulizI/yp/2R0t67X0VWsDzICELlYlfZPbMwZ63mn5tJf85wwVCTn42h/2pQOOW8j5+sXfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BTGlPNBUqufLWTLKvpNxjSK3+Nvn4+q+dEmnWIZc2m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5g2FKq29lEbVBZkqLzS6OV65xD1x5xCSM5wwa9tIez1rfHMUw3oqCjXNvPjef804mkcLBsOrGDPemF7Ifo5qek9E6wvLoL6z48ZzlW6rYLnlteZjtRF+1+KW21Q2GEMZIGjwYlgPJGZ6WaBwqNWQYrUv7WEpJ1TXDVjmSl4YR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuClYz/F; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso83730825e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935656; x=1748540456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=xuClYz/FNAcR1XBd9lrteBSgwu079CrWakSSFOvN+AGBTh2bDUnfa3e37KFsfYqzmU
         Go8qmzJzm0dAbHptyDJ1NQF81Nk4oWWedSFUucy6ccFHPjwnrASDProjJhK8nhpPPqSJ
         y6BzFUWEVMHyq15AK25wwqr04K1j1nnAjTerHmpKilzO/T2462exJrY9QDT+/vV1nUPZ
         9H1Ig0hh7fuvIJD9Wk5/FSqY6z3RBIAJ3FoQHGuV0QmXPqw5xs9tlJshZPC93MuZFTW5
         wBU5GCzbab7hDhR+xAgMEBLo+cDamjHIOEYBHr95fnED1S3MttbHCeVZcBhOnqQlPohh
         LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935656; x=1748540456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=Z/4CpxB469xSgUUFCAr5tNSiKoItSZV2E2YQvwL4VB61N2n0V8TEXRR/OoRmrgSrvC
         I+dtOf1rahw5MbWbckIfPZ86TyuyuIKvn1DbD+yHyy6m6MxTAIIGPTrMT1QtuAFX2dZ8
         H/7k2LMpm9myB4lAgThnfCu/1i0I2whQMRtqfMdofBG0z/TSrZoOUR4sBEkkXB8nA3E4
         mBLQnWmqBdUEFBpC9h7rdH0Dggq/TkcYC9Sjt22Z6SjL52qdAUeYESmvhXEoooGd8H5p
         kDoOzmvWFgjSaGxAzNaHGYYpRCDYtpFiy1nfcM4mD8gzFWsFw/XnMi7sDcvDGsZKuwkF
         V6ag==
X-Forwarded-Encrypted: i=1; AJvYcCVQMP/mMQLNtKMxnWHpbVnJ0fyr3aF9BsCL8ha9U4FXmXH1dqgONQA0UirUkn3l8Nov7F+rG/yY4LD1@vger.kernel.org
X-Gm-Message-State: AOJu0YzQO666a5TUNfZxFCb0ysQdeHaEPxANeKA/YOsRVbKYbIfRnAbi
	qa9li3RlQz/AD/R2zEYJbZ9epwRjw54AOCSQ5ICCYE2IId0P0ZRuiDSyVIlNMdkBIO8=
X-Gm-Gg: ASbGncsvw5+eFZ9Bu+Qn0AoOeWtg/nAfWdP1IgK/V5Dcv6z8b+tbKcWMj5ZUsDm6qxn
	c1OYAjJHkeadO+SK5+ELvSMYxcRDg7J18rBE6BbbePLGE6RqZuDIsANlaT7C6c2fh2aX+XfYIcN
	ECeKvKjnK135O+oMqiAc6rzE6ph/BVBZToWdqRnz+SlQObBPquCkRNGTkUf82+25S0t7Q6N85/g
	Knin2gAaVHIpOhvLiJwuFJoQjt9ObvXYio2jixZyIBe6y8cbkMINkNi+9eyKdqAfyuzfNG+SWHd
	erAQD/ULhBBfTzvV2H2jHqHkeSRZEMQEWJTa2K1tuhfkKx8ocZqm8tTAjelTzm89QSwaeA==
X-Google-Smtp-Source: AGHT+IEBbmBeEZeBEDTgs2S0bIt/X0hdjEoD/gWNab7fsmjGtWFgCjNCvRyckETck0ijr3VIY19D5w==
X-Received: by 2002:a05:600d:c:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-442ff8e1221mr214812715e9.12.1747935656418;
        Thu, 22 May 2025 10:40:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:52 +0100
Subject: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
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

The pattern matching incorrectly selects "wsa" because of "sa" substring
and evaluates it as a SoC component or block.

Wsa88xx are family of amplifiers and should not be evaluated here.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
   required:
     - compatible
 

-- 
2.47.2


