Return-Path: <linux-gpio+bounces-1236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A343280D145
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36421C21182
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21924CB46;
	Mon, 11 Dec 2023 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfeyCP/N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C85119
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:22 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so43187925e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311860; x=1702916660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FX/ZkRugEaGVg54hHyt+iiLk3yKyizfbOZydwXqa8g=;
        b=YfeyCP/Nwf3l5vmfHFVNwzIDtiXZUwKpoHgezRyMLrbrd7LEJPGInwQsCx7vPJcx6v
         5t3uFT9eLHg+B46/OyCD3sEiLW04RGKhjEqmIlc6aDelFleyBLBcXKDX4JV2hiajkauA
         k+T2F9spbvqXz28LST6jUHiRAsilnfP1fBG6x9gM4RzXr33aVYvSoDRL0Cx/qM+fJ3Qt
         9bOKBaUEhWFRrQomDqMPR3S1ij/HUIVqEY9e3jiFQ6z4m1GoFMnZGc8v9E4TAmKv0DMS
         sTankKy8HV1IMd8ZZ8xVB+cHOed8PQxaE69T8AZhF2/yAyWUY6CwJpS3Twma5b34BJiD
         oEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311860; x=1702916660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FX/ZkRugEaGVg54hHyt+iiLk3yKyizfbOZydwXqa8g=;
        b=UZ5JQrojhzoiB29LwibY9jypJRces5A+tJQBGK4A4v4VWMCIb3c8Pnek7Il2oYvGIV
         sI4Y5OAqm4jg+PUb+DBC96kwnj9BbALH6FwILrTmHO+ScJ2SyiX7disErYcAlUrs/BJv
         YnkK74MvQVdGPC2D37mVtQeHOk73dSriLo8h2b6Jk18NoXqbmcshgh2pxarVR7w8id89
         9i1hi47J1jWQJ3nD7BKEaTL6MuOMxTrlPqWTCo9m2RKfSsdP6fdDHfLYdjOjMnACAC4x
         v/Vk4n5IVQQrVDLuoT5Ys4yDFtl7w4CF+oLHmwE1PpN3fw1K3LXpJY2PW0zKfexz2O9G
         1RWA==
X-Gm-Message-State: AOJu0Yx3Y1EaXFgGfeeIRMmww4S65uiVZm/zbXdnXsUGB3Vtr0zgcpv2
	AjnnIYUWWbXpPeX42IzXytS7Xw==
X-Google-Smtp-Source: AGHT+IEWk99CesWrbIhJv/TMHvU3scawI1bC4MdB9Hvo/AKqhelXc7h4rpDh1YlRVT5zfro/RsxL+Q==
X-Received: by 2002:a05:600c:1f1a:b0:40c:3221:f3cf with SMTP id bd26-20020a05600c1f1a00b0040c3221f3cfmr1154939wmb.359.1702311860620;
        Mon, 11 Dec 2023 08:24:20 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:20 -0800 (PST)
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
Subject: [PATCH v7 05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Mon, 11 Dec 2023 16:23:20 +0000
Message-ID: <20231211162331.435900-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Add google,gs101-usi dedicated compatible for representing USI of Google
GS101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 61be1f2ddbe7..8b478d6cdc30 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0.472.g3155946c3a-goog


