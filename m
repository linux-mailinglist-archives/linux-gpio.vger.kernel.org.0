Return-Path: <linux-gpio+bounces-1139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56380AF1D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 22:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39ED1F211F9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 21:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989E58ABC;
	Fri,  8 Dec 2023 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W96UevFX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA661987
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 13:55:54 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3333074512bso1932156f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072553; x=1702677353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SEeLdU51VRNsuOcRrVYSiWWzAmn1Zq+LC8LhMRr8pI=;
        b=W96UevFXHl/EVdt6Bhj2JzTDPGHKF6qokrUFOQmtJIbu89BRrlTEN/erVkUVOBVjVW
         zuLEQDZHTyXqwpvMMoaDk6Bq7KkPiJXbP+JGUuTCOZNE/u2cfqdvAxArlKm4mjUhTQQ6
         vr0v8PqMl98MgqVmmrOV4ol+P41mxCyC2+ndBEnieC/DLoc1DuQkrjxKOgnuRB5hzVB+
         jKHgPISr/Jlq2xmTbc4cM7BtHtRPNwfmXm0/DXjCI4vz7r3GQ8O/hhgYRFOGQf0xM7Mm
         N7AR2PqUT6jDzhcfBuMVVGcZ18GCsTyySEkKVw+8byJIQT0lmkUXugmRMH7QBkt7+JFE
         YVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072553; x=1702677353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SEeLdU51VRNsuOcRrVYSiWWzAmn1Zq+LC8LhMRr8pI=;
        b=eJMeCmOBXlP9LKqb6U2+K71fJq+6ugj03+mVUBZHP9CazQ2N870Vyf+lKgufTz0eHL
         1Mm2fhjzISiSOLYQPuG0WxXT6bbErmK3Lk70Qhg0eP23T75NXw2moZc6irG8TnHZagJa
         XA1m2W9LT18s0HGM1jdBFKFt9SGgurHWfHJSYCzoFARPn3mgp2cZFAS2h5G/lb5MFxWr
         w5W0Ncu20o1+KjHv7hCWjxEqlDH0iemeVZmX3TjGPgY+11lRW0s8M0WBLZgD5ukiQjQZ
         8CoB6GKVYlFik1W2++J+Oihopp8JbD1cZ4tuGVJksv+/TDVoleXdfprFmoJIXgtXx6gc
         D+Ug==
X-Gm-Message-State: AOJu0Yx42OM+A2qLY2fsRdyBFLaBwXwPRr1AUmjBR/BrbARmTZNmIMcY
	sl8o4I0GqHS/cvyZUGW6FBcgFg==
X-Google-Smtp-Source: AGHT+IH2YxIlTLLK4i5DS0Di7M3Nby75kSR11nKAeqN1WNZPe7dcmtNKoTml4velulZGPfOwezFslA==
X-Received: by 2002:a05:600c:54c4:b0:40c:3984:4985 with SMTP id iw4-20020a05600c54c400b0040c39844985mr215151wmb.79.1702072553351;
        Fri, 08 Dec 2023 13:55:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Shawn Guo <shawn.guo@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	krishna Lanka <quic_vamslank@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Iskren Chernev <me@iskren.info>,
	Martin Botka <martin.botka@somainline.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/10] dt-bindings: pinctrl: qcom,sm8650-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:30 +0100
Message-Id: <20231208215534.195854-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM8650 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
index 30432be8fb07..370789ce934b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml
@@ -22,7 +22,9 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts: true
+  interrupts:
+    maxItems: 1
+
   interrupt-controller: true
   "#interrupt-cells": true
   gpio-controller: true
-- 
2.34.1


