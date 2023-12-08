Return-Path: <linux-gpio+bounces-1135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048FB80AF10
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 22:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C00CB20C38
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 21:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92D58AC6;
	Fri,  8 Dec 2023 21:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6AH6aeH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB86173B
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 13:55:44 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so2498615e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072542; x=1702677342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf5qCRqNW7wSqrSaZ/MpVTnmBC6rjggpOIt26/5/rF4=;
        b=s6AH6aeHfAx5R2zteupW/ZMaTjJ4/vA7uuIVFDcTrVR6dMMgdX8fKQHXlTYKkp72Ef
         TYGyJzgnMIx1oG137MSVrRhrR50iXJ2j1+WUVGfpMP+d2os2SIQ3gOMP+SuBg1GZ3Io+
         EEfFIFO0477ruX+60jeBNnGQD7WU7Fk4iR0eWKaKA6t9HhaUYx0QgKq6ag2dCdePHpg9
         /i1mWsbiNHOljUWBl+QTJ9eaKeJS9BauQWsMVZMKStMurrqLNZ/eQeA/sVco8TZDAOi7
         exp4aMIeBLi5BXUNuSqFL2jBMW9IqCjx2o7QJQTqX908QgYcJmRoXx36UHpvKs98ee7q
         oxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072542; x=1702677342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tf5qCRqNW7wSqrSaZ/MpVTnmBC6rjggpOIt26/5/rF4=;
        b=DmrR5/IRWD/fGd6J19i6FpvjnUKTH2WhgPPcOyPxepytahVXvIP2ovpa91in3xVKhP
         lIEoP3iJgjkUmmX0lCOZPPTnvbmPlEyR6E9Nc1cqcshep8Am9sBD8QiBaFFle1RXQJU8
         lU7ZcwkzIvbbjJIlbf18sqJufT+sTEX+bgm7PTglo5JGaiHsFmfdLQs6V1Xb9Ol0H4X6
         6+t/ceUM6kj4AVfw79XCopGI+26TvD6wrrEkpkUmg33+87TNz43cZ0UPjdfzQO3pdPDp
         9JIAMfvTwXLfzxHHShZFE9Jc0S/hPTvbDn5hUgacK9foWuYa65U6NawLRzmcoWVv1/pf
         HzCA==
X-Gm-Message-State: AOJu0YxgltFo5g408D6jrIzxefTnOYw6S0WpTOzx3jKkWIdOIXo9mBeu
	+SqOH6V3JQpp+FApJiep861vMw==
X-Google-Smtp-Source: AGHT+IFWEhci0fEtEukd3igou6Vy0wS1pII1F1A+9TZmAR2o9jtREYIMfQEVFhfnbBdd+2QYw8I/fg==
X-Received: by 2002:a05:600c:8a4:b0:40b:5e59:b7d3 with SMTP id l36-20020a05600c08a400b0040b5e59b7d3mr309002wmp.176.1702072542434;
        Fri, 08 Dec 2023 13:55:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:42 -0800 (PST)
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
Subject: [PATCH 02/10] dt-bindings: pinctrl: qcom,qdu1000-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:26 +0100
Message-Id: <20231208215534.195854-2-krzysztof.kozlowski@linaro.org>
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

QDU1000 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
index 237cac4f6ce1..47363c23f4ea 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml
@@ -23,7 +23,9 @@ properties:
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


