Return-Path: <linux-gpio+bounces-384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A41347F5129
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 21:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43AB5B20ED3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 20:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E3B5D8E0;
	Wed, 22 Nov 2023 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c5AEBrxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7A6D43
	for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 12:06:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso779185e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683565; x=1701288365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWZ3+DJ5YCHvpyiY+r4/NJs/Atp/by6b5Pd+Cg5ZuxQ=;
        b=c5AEBrxcZQGuSVl1NZbFEPuvOT22njj505lzLe4PSxEfVU2FFkRsT7OkKglkXzWUMv
         UYFQUJzIUHCa/5fv/eALyFeG6oCw4JgvSElxmVX41K+DQn6D4WH28XioytnIJPZeALXz
         2c+hgMF8ymmw028VL75UihXudW+MN1JIyXSvAKQnP9I+fPmsOCSHDQjVNmBtzcuVTL5t
         jk6C3cpDvKMrWpcD+YZnZPTRsaSPlzDWvmtovy5QDEY9Y6LYeAf6suWfv1IWLAhBAxCj
         RzmSaOhiSdXtpvi99P7v74Xkf5lWL+GLQOS8xdfrY2YrgLtBWR/OXzgH9WcskdqTcWHg
         uzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683565; x=1701288365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWZ3+DJ5YCHvpyiY+r4/NJs/Atp/by6b5Pd+Cg5ZuxQ=;
        b=HKQBPvL95jFb80uBTiewk7cOIhFfL0CGV+MlpTAIiB3NxWVY2BLgmYVj5CqRmUuDs4
         pbbXvEa96caAI7ZssYN8q81QteNxI8fC0V5NzMD6rM3iYkUy/AuBDHpxH/Mc6t/BGEJm
         kN4q69PGC0wymHcfKhg+JVOG5YDeAn31b6kEIcyfKeRgDEWDjQTCstyMObbwQ06oXy0X
         dGNWHz6+g14YZj/UijMDFvEFaSUDvNSvHZuSOqqfiRYEkYcsOOeE0D9Y/Nz3yUCxzGg+
         n783qpI2Cg1ODddNr79148Z5cSAI6grpPEl3eYajtXrdiyhDCgpgBElHwWyFt3Ie9ZRF
         p4ig==
X-Gm-Message-State: AOJu0YwKZnsAv39wWnn7PmpAAw0R56YrGiUWsDC6Hvz3WuS+jUPYcPUI
	uM/Ies+59HXtQzSJ/eMrCteibQ==
X-Google-Smtp-Source: AGHT+IFitXblLY1r/Y0wBl/NbRc3r/ZKvP2PBN+63RmOyBT2RIPuJw1uS6//n+KoIJ+MZoUxzl630g==
X-Received: by 2002:a05:600c:5125:b0:403:272:4414 with SMTP id o37-20020a05600c512500b0040302724414mr2812498wms.0.1700683565051;
        Wed, 22 Nov 2023 12:06:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c4f1100b004063c9f68f2sm394665wmq.26.2023.11.22.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 12:06:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	semen.protsenko@linaro.org,
	Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers
Date: Wed, 22 Nov 2023 21:04:05 +0100
Message-Id: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Older ARM8 SoCs like Exynos5433, Exynos7 and Exynos7885 have the pin
controller with wake-up interrupts muxed, thus the wake-up interrupt
controller device node has interrupts property, while its pin banks
might not (because they are muxed by the wake-up controller).

Newer SoCs like Exynos850 and ExynosAutov9 do not used muxed wake-up
interrupts:
1. Wake-up interrupt controller device node has no interrupts,
2. Its pin banks have interrupts (since there is no muxing).

Their programming interface is however still compatible with Exynos7,
thus change the bindings to express this: retain compatibility with
Exynos7 and add new compatibility fallback of Exynos850 in newer
designs.

No driver changes are needed.  This is necessary only to properly
describe DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org
Cc: Jaewon Kim <jaewon02.kim@samsung.com>
---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1b75abebb953..2bafa867aea2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -36,13 +36,17 @@ properties:
           - samsung,s5pv210-wakeup-eint
           - samsung,exynos4210-wakeup-eint
           - samsung,exynos7-wakeup-eint
-          - samsung,exynos850-wakeup-eint
-          - samsung,exynosautov9-wakeup-eint
-          - samsung,exynosautov920-wakeup-eint
       - items:
           - enum:
               - samsung,exynos5433-wakeup-eint
               - samsung,exynos7885-wakeup-eint
+              - samsung,exynos850-wakeup-eint
+          - const: samsung,exynos7-wakeup-eint
+      - items:
+          - enum:
+              - samsung,exynosautov9-wakeup-eint
+              - samsung,exynosautov920-wakeup-eint
+          - const: samsung,exynos850-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
 
   interrupts:
@@ -86,11 +90,14 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - samsung,s5pv210-wakeup-eint
-              - samsung,exynos4210-wakeup-eint
-              - samsung,exynos7-wakeup-eint
+          # Match without "contains", to skip newer variants which are still
+          # compatible with samsung,exynos7-wakeup-eint
+          enum:
+            - samsung,s5pv210-wakeup-eint
+            - samsung,exynos4210-wakeup-eint
+            - samsung,exynos5433-wakeup-eint
+            - samsung,exynos7-wakeup-eint
+            - samsung,exynos7885-wakeup-eint
     then:
       properties:
         interrupts:
@@ -105,8 +112,6 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
-              - samsung,exynosautov9-wakeup-eint
-              - samsung,exynosautov920-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.34.1


