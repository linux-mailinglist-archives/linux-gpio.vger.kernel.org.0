Return-Path: <linux-gpio+bounces-1136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2880AF0E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 22:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABED1C20CEE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 21:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB858AD1;
	Fri,  8 Dec 2023 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W08R5cqH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9B41985
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 13:55:46 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c39e936b4so2541145e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 13:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072545; x=1702677345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/60s+ovFXyEA70cJ6XBt4WPswR1xbbylguX4jwENxM=;
        b=W08R5cqHG0N0Oti1OxhAQvHDHr0dyy9FxmZrXL0EJd5CQaYwZYX1j8cW3/sAtugK88
         bjNAGAKxtmpCCSfdvGBrVYLnsOvoEHn3aLtBZlgCwUzsFdf6h4Ob2VBZqQurTAnCmQXr
         1GuHe4ftIPhWJ+zl98xWBEjk6lcoAqoaUATZM0FvbkgBkkGWOOEZ/1ClR/mrw/RF9zIh
         sapwK8GL11EliaKqim0rMxW9rr6fLwi7uzJqeQPY5X4jit3BH66ZPUkwiAhkJkSwnrkn
         h4yae7mMHDkT9cA+MtsY9QceDYAGfy1A7zkNICOofZzqwfzp7+bObTutBoM11xvB2Kvl
         3NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072545; x=1702677345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/60s+ovFXyEA70cJ6XBt4WPswR1xbbylguX4jwENxM=;
        b=dB2WMquUAfUXoqPAZxorpeqj1G9r5KWZsdwppAM+QgcDjbFQuxpA76tkLeCRaC+5d5
         4nSnBqB6+rcvvurkOXSrjpFALqKuegOnPilmdpWQAbixy97HXvVbSC4vGJtlEtTw6e/p
         uIG8nQ5apFLe1/hU1O9/lCH9ZOPXY7Tbgdn78sY+0o6TuISTdHyoLU+OVcq2uONTHOsV
         pCeZUP5F9rUuyTlBKf9i9HQCTMT5oNXmLTD+zS2b4LrwYz+y4OZ2ttIS8fnXMJVlBwMq
         Guxaz5Om9s+eCmTuoBVPEdIwiRue7toGCGO58WOZ+4RKGrlF06sw6oXG2punNoFI5cR3
         wJsg==
X-Gm-Message-State: AOJu0YzXRb0wUVApcK6t1VxO3pWzUfCwLza6gaXUFKUg09TflOADl9nb
	PyemgrffJ4cJt5BGXdKsNAJUMA==
X-Google-Smtp-Source: AGHT+IG/7g3EBTnqDo4GiCJYV/XIJXTdM0ghJV6zrFK27kTkNmCoO5+KWkUuN5EmlBvhtlizjac6Yw==
X-Received: by 2002:a05:600c:231a:b0:40c:25ab:d6fc with SMTP id 26-20020a05600c231a00b0040c25abd6fcmr131489wmo.216.1702072545052;
        Fri, 08 Dec 2023 13:55:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:44 -0800 (PST)
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
Subject: [PATCH 03/10] dt-bindings: pinctrl: qcom,sa8775p-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:27 +0100
Message-Id: <20231208215534.195854-3-krzysztof.kozlowski@linaro.org>
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

SA8775p TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 2173c5255638..d27933258db7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
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


