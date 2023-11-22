Return-Path: <linux-gpio+bounces-382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32EA7F5121
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 21:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673C02810B8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 20:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C4E5D4A9;
	Wed, 22 Nov 2023 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwSzxSYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFC2D40
	for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 12:06:08 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so2471441fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Nov 2023 12:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683567; x=1701288367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yVlYf01Klh91OZh9eHsXRPSKeeV6vlK2OWkU1On07Y=;
        b=xwSzxSYgj0kC/Fh3tGw6cokWndlU9j9dNbompQTc+Rrp/GoXINa2bNm2BGPiXv3Git
         3BlywD5Mpbu/6KpebD3A1x9FhhY+XezKH/ktTRu4hP39qJ/5DYKgMl6wNhroV9aEdj34
         ypBDL2yIShM2nB1kespAYEMgb5j+K26VDpmiAIC5IlDEYESXAzBcDRJGqVHS9/xFrYmg
         MT3NQQ6z+A//3U9adIVe4gHh4JndKl52WvqBW1/k5FXd5AUpjTXWZQi2ZBzTErATmi+A
         NaGm6M7nr5d6ah0fCh1Np6Fi+8js5akAxY1ZtmSEGqVvyDH3nN9gvvsyAkEgOIrARj5v
         NDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683567; x=1701288367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yVlYf01Klh91OZh9eHsXRPSKeeV6vlK2OWkU1On07Y=;
        b=JT/5TMIshOU0jsqVIMq8JnRdbuWNgfEn2PG0K0eqVXz8Zzz+8M05l0YNCtG31Ao/A1
         yR4A2HAGN9yrUTqe6tsh/2RKfFzVToktbEyIYcNVWp0M+zPeMR5lilYAVGhz6pFMDqKc
         8now1WW/+wFW4HPsw2wXNRqyQQLy5YvfLJ7q6bzMnTIBHo3PHbGdmPYzYKTkI+RACo6e
         FulM9bJqUUZOMzZSUMrEELw2iv98pZKCCMGzMH/ngiPxTEIeotAse7dlnxboVd93CbiK
         d6lseiLe7qfa/ozQn/rbK1VFaLMBF0XKnMs+Ml2CVkxOWWI60XQnewlUaRCxTf7WPRIo
         qAhg==
X-Gm-Message-State: AOJu0Yw7kjznDQ5fo8MRrSVWtH9CSYzBL88I6CGied6ApfQzZ9IL8GuX
	WQeFX1zKMNSqiBEp9ydMdYD/HQ==
X-Google-Smtp-Source: AGHT+IHLz9iUbLSFP6oa6QMg4jsxTZ3/jvsp6/GOCMQs3KTkInUCjWZvzthjzrHbsC7dCh84psI5bw==
X-Received: by 2002:a2e:8210:0:b0:2c5:582:fd8e with SMTP id w16-20020a2e8210000000b002c50582fd8emr2461231ljg.21.1700683567177;
        Wed, 22 Nov 2023 12:06:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c4f1100b004063c9f68f2sm394665wmq.26.2023.11.22.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 12:06:06 -0800 (PST)
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
Subject: [PATCH 2/3] arm64: dts: exynos850: use Exynos7 fallbacks for pin wake-up controllers
Date: Wed, 22 Nov 2023 21:04:06 +0100
Message-Id: <20231122200407.423264-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos850 pin controller capable of wake-ups is still compatible with
Exynos7, however it does not mux interrupts. Add Exynos7 compatible
fallback to annotate that compatibility and match the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org
Cc: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index df5ea43ebcad..da3f4a791e68 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -359,7 +359,8 @@ pinctrl_alive: pinctrl@11850000 {
 			reg = <0x11850000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos850-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 			};
 		};
 
@@ -368,7 +369,8 @@ pinctrl_cmgp: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos850-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 			};
 		};
 
-- 
2.34.1


