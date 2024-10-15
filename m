Return-Path: <linux-gpio+bounces-11332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FE99DEF8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32701F2181E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C991D9A6B;
	Tue, 15 Oct 2024 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8cgN/9m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2E11AC450
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975540; cv=none; b=XpR+OHGp9VdLAABkgZ5IF8R7fS/ZXa8jFn5QHWGLceiPxpMUcvVfwo32SQqqyLcaoUrhasmreWDg0+Nt8rqD8wq8Jlnz1sYtcGZf4ABBDlCx7oG1GUzsruSTUFmxyOQ22Av36r9N8Qp5K39wHFp/sfCD3J9LjSt4q8KZHp8/i7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975540; c=relaxed/simple;
	bh=KHk7h72KzrixZPSmY652+q6BP2j77mrUbzaF1O99wYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeNekrdgpiU9BD15mSOR4jIR9B2fFffwju8q99DSlcfFGqlBrO1Y6GOv2bXHul7iTw4s0uAi5shqusguhlGXHczsaqN6OF5GT1UUL25NU/KUzh2y1TMfhyvc8PGARuKpHDWGPw56qOHZ4TjSAcUzv+L7rl2/9GDGE9MSTwqNTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8cgN/9m; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4305493bc6dso6245395e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 23:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728975536; x=1729580336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3HzKXKEZzBQaZD9201Kj/OtZlaySZJuU2J8G51Yt+4=;
        b=F8cgN/9m1dRLH3vLP+O6uolvVePR7dmhc/6wRzV1nmxMciJu0cqsnkn69PFDSbJnb7
         wgPHHwZTm62kQfI5pwqQEVnQfyqfckW7hNTTvGj9IPXRJlLKhGGK2tBQ1BsfZgel2ru7
         kJ7Oc/EYRcj9F7hnjzkzUkRhKhVni1ChMq2e6Z2Q9Mlnb+kagXrn0QQ5e1+N57JBR99N
         cTgKDIjDkXGs2odaNtWsIMISv929S/UmCzEh8BlPESiI6L1AtmpQz6LKmO7Ej3A7rt+z
         c52TD/kLSF66AKTlqId3NriCzP9D18mCeMqe735REoWZ3yMOJc1Rht0J3pSdv8tFFcyG
         eu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728975536; x=1729580336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3HzKXKEZzBQaZD9201Kj/OtZlaySZJuU2J8G51Yt+4=;
        b=KP9y6qIMGuXACGmTZEcYSxxRQo0QRYh4MzuLlW8C4p+INreQ+smw73OeCnJjZ2mKOx
         A1fyiIui1yx+W22JnBQdOtQBMCSGoOUAL7RhQiUIZlvVEzf+cLSCEijsSZ0PFHhsQf6F
         Rb6NbyyrxkoXQyiEINh4rWOqj3TgP9GzsyhJfQ/aVi42d+OcNzz49wIvvi/IPo2z0jLQ
         HBjPpXzWoVsKO3ibHHAEe7MRKxxCjHkmnkbME4i7KDoSqz7Hn+wpf20rYeI0qRdLmfKM
         ErixqT5yZPfMQ6BM+427n78u19deabSJAs69GviE6pWcIJGO/OrA4TcO7w/rm7/2d/AZ
         1b5A==
X-Forwarded-Encrypted: i=1; AJvYcCUaCOimYqTyguctb2QENcBwKigFNJWep5qFujIdqZmtCZP9QGnRFiOMNJyl+VokvIzFI/0vBrnDBciw@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxVz81FQ78IsUThKV+gRR57DO774tJQZCRvnJ0yJWNrM1np+4
	18huFQRyXcAIfp314b2SdkgBDCiMAH7L4PCNXnSY3J3DsaG9Qq1BFWDkt4H60as=
X-Google-Smtp-Source: AGHT+IGX9LHy+IZRCrAjUc2HU360Y7NEiYtO23RbqSiqGuGi0FZJ8xxf+gyIM29W6+C5SNxGLJMF/w==
X-Received: by 2002:a05:600c:1c0b:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-4311df3b69dmr51933375e9.4.1728975535898;
        Mon, 14 Oct 2024 23:58:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5d22sm8461645e9.40.2024.10.14.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 23:58:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jaewon Kim <jaewon02.kim@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: samsung: Add missing constraint for Exynos8895 interrupts
Date: Tue, 15 Oct 2024 08:58:48 +0200
Message-ID: <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expect only one interrupt on Exynos8895 wake-up pin controller.

Fixes: e2d58d1e1c61 ("dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 49cb2b1a3d28..b7c2692f0ac3 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -103,6 +103,7 @@ allOf:
                 enum:
                   - samsung,exynos5433-wakeup-eint
                   - samsung,exynos7885-wakeup-eint
+                  - samsung,exynos8895-wakeup-eint
     then:
       properties:
         interrupts:
-- 
2.43.0


