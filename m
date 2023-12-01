Return-Path: <linux-gpio+bounces-851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3F800F32
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D41B21472
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FA24BAA7;
	Fri,  1 Dec 2023 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrK06ncd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D8D1731
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 08:11:00 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bce78f145so2632975e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447059; x=1702051859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBRJfAevU+LCcxJ2mAbE/NfYBIkHJdmy5yUy9RNkIsA=;
        b=rrK06ncdDaRn2eUM+oZO1naXgn5h3N/E9U17PpuX2q7KqFiPWJR/03g5J4atmpNbyy
         1XESS7VlagCd/bj840Cs8lRa7QUtAVEH0ndmQEZFRdJwj9F5T2cMZNlyr5HuJS/48MOl
         7R/O7YSn/eHqe+ZZCS2tRKG+I6o4ogNDNP3h3O+HJNNHN6Y6a9yeeliTA3q410Wx3KLi
         FzAZhRDMGKPYRjF8bg6htz58+AAUAG33kukrDsty4Wzz9RYWbtLQWRbiQgrIZhgZu2ZP
         2ZanCj+Y43Nks9IEj80GVYNMjM9FK1FhEKdC7KL+95m6/6pEeHmJioW1FLvL5+KYaRfw
         yOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447059; x=1702051859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBRJfAevU+LCcxJ2mAbE/NfYBIkHJdmy5yUy9RNkIsA=;
        b=DScXLRq7gmDj8H9H1XJKIVD+XXuh+4A2k1uM2nROVUhy+UHOTR65ikvPbLATDEjvwW
         1VIzGYQdJUcGhntGGdnnpn1qTzEzJ6fD1XL6H5sMEAZorFx8SfQg/ZvWA2YPuVBBGSIO
         YuhsoE0Q3e2G+GG/1HqwUZZ7K0Nyuknx9G46kb0xe9lfvxE+hdLhqEZEbf57u3dfSmxH
         qkP5r4+7qIply2n3o1fVgo0s+7R/L8nJSF1st8jEkT58EcvKba1A3c4epCj/qn3G244i
         wYt/4YErMGZcDxVELaI4TZ9kYxMDDXqDxKCst9XQbCkWvO/o+slsWhYCDOPkRYn8CUZo
         s6XA==
X-Gm-Message-State: AOJu0YwvPOfUwydSQeN+nQFDNbtxdu0RUmqlUfMCx+D62F16EDORFPJw
	WgHRC+6accFtK1z5D3d/1iDAgg==
X-Google-Smtp-Source: AGHT+IG/WFRvP9MxpMHrpVaQSz7ZF+XEsCatpRGxusYrMlLEz1tqbPvkKxUnz1D00VC4ZUyx/hKrEw==
X-Received: by 2002:a05:6512:3487:b0:50b:d944:bfd5 with SMTP id v7-20020a056512348700b0050bd944bfd5mr410395lfr.151.1701447058930;
        Fri, 01 Dec 2023 08:10:58 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:58 -0800 (PST)
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
Subject: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Fri,  1 Dec 2023 16:09:12 +0000
Message-ID: <20231201160925.3136868-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2bafa867aea2..de2209f8ba00 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -44,6 +44,7 @@ properties:
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
+              - google,gs101-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
           - const: samsung,exynos850-wakeup-eint
@@ -111,6 +112,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wakeup-eint
               - samsung,exynos850-wakeup-eint
     then:
       properties:
-- 
2.43.0.rc2.451.g8631bc7472-goog


