Return-Path: <linux-gpio+bounces-1182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D361980BB1C
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79EEF280E18
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE907D526;
	Sun, 10 Dec 2023 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tfyizqw0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B567DDF
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:39:19 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54d048550dfso5104860a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702215558; x=1702820358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxGHOiWgHxymjdsJtkFtmgKrK8IqfIoFz7FXA4eYB1c=;
        b=tfyizqw0F2/z2HfPu2743RC9QHe0G2gPYITGl+HQiF6fKUFod+hw7uMuUNdHfH+/b4
         WfCKFLg0/mxOOTQPUrJCIB0+wlfH6cM3hlCShwlwFGkKrw12WxcBWpZq8BHc1fwlsbVj
         tYfHE5A/I1z8EDINkMMgtZX5HLESdmEbAwzsryhPLtysLrDt1cRp6XlzE/OYjEUTnQgE
         KLg7rnKH+1NULcQGEQwIEN6zv9vQKWCWlY8tjhKReltvTh46rDEheyGJONCWA/Cot+1h
         DuHQF1kjd2PoZSoeyW3IRNOnl+btpQZgNWy3PfAJ30ovL60y7IXmtpQW68Xgq4dGyt0r
         pPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702215558; x=1702820358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxGHOiWgHxymjdsJtkFtmgKrK8IqfIoFz7FXA4eYB1c=;
        b=rsH4uRco7Sn1WL27Gm+hHDgye0nMrTnU8hOrMnrOt1pT+ten9eMLW26YlBFZ5Y97bE
         5f8PB0XdBPFArlMSDTMDaPjTsoVeYjx+Qb7WdYexLdpgORKlPvnWfY/PaPIUkO73T+mx
         MJuNFAMuGL112Rwmc8XLcqAVe06jC8KOjoK8GVlFDmAwCVHdNi3nvcqfwm2KwkIx1hip
         jdosJqTlPE/5wKCnc4veZliCruuydf+OTZ9a2PIlcAb+Y4Lu9k/eQ3XuuZyO+7AbvWtY
         kCkUgd9+ri6LTIrfDT7fvHcxPIXfIqKRaXE7GfsOgvpTIynptEIzRuJM51u4I6h3xz/H
         gDHA==
X-Gm-Message-State: AOJu0Yze0BV05earLaPo6yPZTSxpe887bCjc71VRZMjYWT3pki/J6K4F
	521s+xtRjAixmNtogcfe/n1Ddw==
X-Google-Smtp-Source: AGHT+IFw5SzwXuPtqqHqx4JjsH98zOkWwB/gJiXNpta694i4eRZOIUChO/+jUI8egoc8FF90usE4aw==
X-Received: by 2002:a17:907:a0c6:b0:a1a:57fd:3590 with SMTP id hw6-20020a170907a0c600b00a1a57fd3590mr1008153ejc.13.1702215558224;
        Sun, 10 Dec 2023 05:39:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id sl9-20020a170906618900b00a1dee0289b4sm3404214ejc.169.2023.12.10.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:39:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: samsung: correct ExynosAutov920 wake-up compatibles
Date: Sun, 10 Dec 2023 14:39:15 +0100
Message-Id: <20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ExynosAutov920 SoC wake-up pin controller has different register layout
than Exynos7, thus it should not be marked as compatible.  Neither DTS
nor Linux driver was merged yet, so the change does not impact ABI.

Cc: Jaewon Kim <jaewon02.kim@samsung.com>
Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallbacks for newer wake-up controllers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for my for-next branch.
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2bafa867aea2..f64da7f58faa 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -36,6 +36,7 @@ properties:
           - samsung,s5pv210-wakeup-eint
           - samsung,exynos4210-wakeup-eint
           - samsung,exynos7-wakeup-eint
+          - samsung,exynosautov920-wakeup-eint
       - items:
           - enum:
               - samsung,exynos5433-wakeup-eint
@@ -45,7 +46,6 @@ properties:
       - items:
           - enum:
               - samsung,exynosautov9-wakeup-eint
-              - samsung,exynosautov920-wakeup-eint
           - const: samsung,exynos850-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
 
@@ -112,6 +112,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynosautov920-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.34.1


