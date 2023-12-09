Return-Path: <linux-gpio+bounces-1153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7580B79E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55AAE280F2E
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5288D1E52E;
	Sat,  9 Dec 2023 23:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5PqaDdQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE6BD54
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:15 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso35573785e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164674; x=1702769474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzAXGyYwtUGZG8Z/I8N69PtrVjZfS2QiS9Asm+uQgQ8=;
        b=E5PqaDdQ04y01MgiI7TTHUSJsJNO9txwS4mE7/2cG9qC3St+4pAf8Bx5LuCZwCvVBT
         4bUApSx5GVutBwhklxT5VKuqn5kDRJUClfgeqDBhemFwotaoCMX2k57D0OMCJa7uZJJP
         ZKWrbbM33++KBoapDwfZK0m/qw1+jG1Kra9OY4e9fpOUsGYLdhuR8cx3HN1lmuZTWoZq
         AcsEFmYPd4s7HrQqjyXqD/eK15TRwy1SYWajzxQ5bcjHaTXLCyDWFsad5mkOxMQCDkRC
         DiTItERLZzxKQcK4xRN1PKKlvhJdNnbNsXwfWEyXc6/ElG0lrc4gBpz7WvHDMqgA0YxE
         MPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164674; x=1702769474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzAXGyYwtUGZG8Z/I8N69PtrVjZfS2QiS9Asm+uQgQ8=;
        b=iZ8664exE22W+D/k9MPcBbw1jyn9OVMPkaGYVAfRJ0gtQabgDI9XWs0Dqdvqbvst2l
         Ny+jgmw8CgMvw8Q7NdupMORNAoqwdUKgeoGwwDG9Xb4XD1MqpXLbAmlyC86P8UFMvAP9
         7Hlfuh7wZaRLXZG5RZoALzUGtN4dfYqbmxwEOmvYrwL508dCpdbs1Fg9JaRuMmjwOkm4
         YK2fZ+u10r1Mn5Y2MMGFtJOMOytsgiE8D4Ftrhfo9nhz2YAo9HEJaWJGz/i8r/BjB+Ua
         /BV2f43+gYafR60uWOBo8LfvaYCV6C8eTUfdBdF6Pe5a/ts9/xKyxprPU6s9pILS7jOy
         yskw==
X-Gm-Message-State: AOJu0Yxy/p+KndnPMWg+QCW2uEa5UYdyCvDdA7RyzpjbcXtBHvvYBIWC
	466QOf06nwz7OuBpzmQYjJBg8A==
X-Google-Smtp-Source: AGHT+IGRorrE5Yjip1vrYZYwEDEw3YsTpOJuLCktNZZ088af1VXvfAIPBKDzkYr2NgWzmgqLQBRcWA==
X-Received: by 2002:a05:600c:3b16:b0:408:3c10:ad47 with SMTP id m22-20020a05600c3b1600b004083c10ad47mr1106521wms.40.1702164674507;
        Sat, 09 Dec 2023 15:31:14 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:14 -0800 (PST)
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
Subject: [PATCH v6 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Sat,  9 Dec 2023 23:30:47 +0000
Message-ID: <20231209233106.147416-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
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
2.43.0.472.g3155946c3a-goog


