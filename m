Return-Path: <linux-gpio+bounces-1237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA280D146
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F50D1F21525
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335384D119;
	Mon, 11 Dec 2023 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDx1dNb9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B3310F
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:19 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so14443625e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311858; x=1702916658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Ba+CfdK/O6qsHsCj9KtgOVuumyDTsi+C+LO0Zu6Pc=;
        b=ZDx1dNb951xE6bzjJhbXpgJmbv9p7PX9vKTh6puuEbzyC5GmQdXYwNXRmmaAF6gqfa
         GzVNuG8wsMPqLS2gYpdJFOVSjsTGRMF+Wzu8lX6mFO/7e+0ME8/iUOt3LifZlssCFcZ8
         LSJZkBP7WAkrlXritx8/Injdt+OOQh7oZ2tRvWygdWmraYfKNS+gkS7WfvdCHiQrZ6/i
         bEkSt+y5Tjci5sQ44X7v30BfiLdHZtPMk2/GhyXBEZisNx84TWe2tmFIPqH2DeVbEvaN
         vZaa5B/98fr8gfP7XITcbzqb8dkU4uirLFSmNgHkDhy2NPN+XHwkDfdo8Un9ArtfeOXz
         QxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311858; x=1702916658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Ba+CfdK/O6qsHsCj9KtgOVuumyDTsi+C+LO0Zu6Pc=;
        b=TuOuEk2erCDRkokcN9k8/CLRis6OVowlUPtU12iyxj074kN5OWvIS1nG4NCcNKe9LW
         ZUz9tPZYwF2mCYgV0SAZuDv5LaB+X9fvPm69JI3nKBty5USXcBYTBTJeSeZfeqv9ZQoY
         Z6OjoMjvp1+x2thJHM+/fN25g+z2ndhyIkIL4s4Wi3a2icXkm8e3ysMF5aJAiS5l9dgV
         2u8+zm2Sa1tk4YBpVtUfmliYUaFigzDKkG3rtZYbkJ7jDMd7umM+xiiQVvXU/4v2tDzn
         BzRLoyhMKAruUqmveHaV+62PoWpPaxFEWK3E/LvI9qqu0pVHQ0+lnBKEu26NN/c5JW0n
         iN4Q==
X-Gm-Message-State: AOJu0Yxhyvye8IqkKbYIG+chUR8NK0rYuQsEecj4Yy2sZb5WiILrH26K
	IR0y7SeGYUunbdkVuB8fhYQmRQ==
X-Google-Smtp-Source: AGHT+IFA9ibezV64yOOnxkvwHV6C3JhUYuTNt/0u9b+6Yu169nc2KrgYHgh0Z/j80bJE7hzbG6qbNA==
X-Received: by 2002:a05:600c:41d2:b0:40c:2f84:59c0 with SMTP id t18-20020a05600c41d200b0040c2f8459c0mr2258700wmh.133.1702311857648;
        Mon, 11 Dec 2023 08:24:17 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:17 -0800 (PST)
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
Subject: [PATCH v7 03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Mon, 11 Dec 2023 16:23:18 +0000
Message-ID: <20231211162331.435900-4-peter.griffin@linaro.org>
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

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 4b6fc82c2edf..6af274d2f185 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.472.g3155946c3a-goog


