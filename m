Return-Path: <linux-gpio+bounces-1137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AE80AF15
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 22:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71127281782
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 21:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B9858ADE;
	Fri,  8 Dec 2023 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnGM312C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E4D1987
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 13:55:49 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so29410955e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072548; x=1702677348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5eKd5hS9FWHlfnHZ7EWtGAMfO5+yUDXaRFWFo6RgIc=;
        b=hnGM312Cybf5UTFKCIJN+WEgbiqasvnJ6WrDHM0j/aOgC7Rxm3WO0HIT/7nI2FWCdF
         oWgd6SR/6WahIW+u71N78J7/aCo30qeXyFS172bygvk8dDHRwPUUyZuzgp1UNd5bYjqn
         eq/e2RqUVnMaff781c0goJd4/Q1J35gVkum24bT/OG9GzVniZQ+psxJU8TNYHVzeExz3
         fjh6FEVlPDCSm5KvdYLvShQe6g1Uq1LKMDmCWNingOHfBL/9rufPfNpF+EL7+Kj7EVBA
         kG3j11SHwdBnlnueEELcEpX8BtkEC1heEJqsTLa3BM8b+plozCjJ9zR6k+0bKhiqlY05
         5hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072548; x=1702677348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5eKd5hS9FWHlfnHZ7EWtGAMfO5+yUDXaRFWFo6RgIc=;
        b=W5RAVDJYc18HcQyO9WE6iprdmT3iosTGlch6sYFpnjgwOAhvVsNmMpJLm5qo4RuIPc
         aQ3pngaodRhLkXKtwaBtfmxzEiIk4ERyHIJcityoC/KLhF0nmaqaZ0eHTttgPgRjIaqq
         qD1ibHIUF4HXKsh/AmFM2vWd7OzNs8KRhyZYlFJIYz0AZgfHFdqCAYnIlIlfr4f2077V
         o1wHDlEU635JFcSmYqQW41ZQvfKxyp0bpUrBogAi3cmgtkHQt+naqLsxvaiw84BJz/7w
         08uE9V30NoheRemcmdwgOhAvgNGlkNuf7grgeNW1B7B6pkHkL+dPQU3/bRfZO25xaIFG
         tFmw==
X-Gm-Message-State: AOJu0Yzorme+fWvqEmlJrW+Eir7RNwASgY/usiFyQkWfsLR7lp0PRFE+
	e3rDI852rvpxGPed4NLBCqvbIA==
X-Google-Smtp-Source: AGHT+IEqRPii65P18RTX003t7ulrPE+pgl0Cj5tCjU+jkwxlF8cE8dz1MVtMMwefqkqmL7HVVplvyQ==
X-Received: by 2002:a05:600c:35d2:b0:40c:83f:b6ce with SMTP id r18-20020a05600c35d200b0040c083fb6cemr237619wmq.56.1702072547923;
        Fri, 08 Dec 2023 13:55:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:47 -0800 (PST)
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
Subject: [PATCH 04/10] dt-bindings: pinctrl: qcom,sdx75-tlmm: restrict number of interrupts
Date: Fri,  8 Dec 2023 22:55:28 +0100
Message-Id: <20231208215534.195854-4-krzysztof.kozlowski@linaro.org>
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

SDX75 TLMM pin controller comes with only one interrupt, so narrow
the number of interrupts previously defined in common TLMM bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
index 7cb96aa75b08..62cd8f84af9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
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


