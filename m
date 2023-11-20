Return-Path: <linux-gpio+bounces-273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4237F1EB7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C13C1F25A9B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 21:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B632381A6;
	Mon, 20 Nov 2023 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFcVHHoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AE9F5
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083f613275so21328035e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515267; x=1701120067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qpEVgJq7U6LEzt1Olm8HzCpK4MlDCTD4JzdLATzhQg=;
        b=GFcVHHoVADDAMRKZDi7eIWLQ1+k1zWtP/lF3p5yicdqkcbBhiEFhmlx1uf5s/ujMdV
         n6ZUK3RjPD2g2x4HtNKh8jVkfVlFAFw6/Vpf+LaU9k1laE+YTlxmqjlvTITj1QPDd0KJ
         j+qBtXZrI5OcanOEB5kUlpgkHk9kcSct277Els4IHbRJPXEBozZ+uz/tGi/OYcX+wiMx
         YqOZErz06jgg4uI6zJAeWG4QQxeL7ipxVcNOpTZhODwz1JAPQDP/aeklp5f5k8ZszbJ9
         t6R1Yl618B5Njibzx8cpjF0Si2IMnwN/EMc5GKCEmY/rKPkbLZ9K01ddTjQI7RpX/Jc0
         OSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515267; x=1701120067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qpEVgJq7U6LEzt1Olm8HzCpK4MlDCTD4JzdLATzhQg=;
        b=nC9Mf2FHS+LztRq9VVqDvBUc89GbmhgjcPKEbLvFhZckmYBvThK0s/afzUMnKqTi6E
         kcAdslOpI3YdBhc4+AMGcR9NZ5Fz46nzo1qqlgu8lACiDU28pjK/WJT4kXVyu7rlx04L
         TJfDOf7XlQFY9Q745urT/kEWicFqR9sENDdRckL/C2798scv3NhG72YLzHFpqDdjnH7H
         Vfi/8zFiSxBXruw13PO8zWD7eyebQDQaT40FidhNcD4jMFC9OSgm2yTDmeZYU9TEzcxz
         CtBK04+WaZOW79oBRQgMagzx/oW/lgYm7PcyOmDLszHi15pAp0G0+rhC8i4MnbsB99cN
         bdEA==
X-Gm-Message-State: AOJu0Yyy2ALJfw770pEDyMMgu6VTK/YGEUvpRk0wxuGbDapW/irb+Ki7
	PIvtL2Q4+HTNsRUNBdZ7vpHWsg==
X-Google-Smtp-Source: AGHT+IGwngSJjJdqLWZuEEIk+kjfAkOiSyMZu75UVaTltJMf/TL75YODZPYA8f3hciNNYrl5BzMV6Q==
X-Received: by 2002:a05:600c:190c:b0:408:4160:150a with SMTP id j12-20020a05600c190c00b004084160150amr6534688wmq.33.1700515266746;
        Mon, 20 Nov 2023 13:21:06 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:06 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 01/19] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Mon, 20 Nov 2023 21:20:19 +0000
Message-ID: <20231120212037.911774-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gs101-pmu compatible to the bindings documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 28e2cb50d85e..ce1bba980961 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.43.0.rc1.413.gea7ed67945-goog


