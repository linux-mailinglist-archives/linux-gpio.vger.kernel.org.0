Return-Path: <linux-gpio+bounces-10914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1AC992568
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C401F2111A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF34185935;
	Mon,  7 Oct 2024 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOvvUFQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CFB17CA1D;
	Mon,  7 Oct 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284927; cv=none; b=WhE031o7FaKadfc7aOUetWagiE2f+6oBMSg4/1lTwkz4CrdlNCwu4wIjHmHM1WPI1Uxz20jUbn79Z7JQ6qXD5u92DVCeqpYbo3gCZCdHS5BW0Yvd6DRA89lyF5ozpL46X2UgItw9OcaRSX0bd5v1mXFKdP4OBCIzlxJRpzaOwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284927; c=relaxed/simple;
	bh=BMDLPWz93cklZvFt6ApJuRF+wSZGYPWm2JdeptOkju0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOQPuG68GEJg50H07fKOIATlO5UvLUL4kVdxe5vfp+JKuk6dH0GwCH5zOOaIB9+5jbHpGX9bv7yecJwPBBke/2vZH1zAiKUrKgm0X1lgOBCqBsz/9RMjvRgwPcc7ksXJtg4xqyasB9DGzPYfiSii/Bt7BnEGTGDqSGAbDz9/7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOvvUFQ1; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso238856a12.3;
        Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284925; x=1728889725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrlUOXSv46yuueJWA44YvW2DID/cd0AQqk3s5NIwe9E=;
        b=YOvvUFQ1BYxRMMeCcDD2psP/nnvwBHPNBvvGhPaeWAcK7nnxEWKKJuVzSOoXQcKzpC
         cdbqEQcVS6bOYutOEeoDcu9nLTLroEm8GGbcIfLvGxABVnCA9GGJIYpL1H+MWtFyghov
         F813SBUIhjDM8f4EMgZlVRtzJkR+C2cvg8Qa4PK6oTfwcNnK4085osd5trSXT8GKZBFm
         wD3jlDsagKJ0oenVSzZWzKEYxnniIj6/vMsmMAGrvu3HOfqZ6CzcP3r8JtcoS/MC6FF/
         Sf4KLEsqNrQZqJ4nxrWKHVCda6ed5zxQKOXa7lhNC3Dna6eeLLHcvn1DZo2iTmv/00L1
         I0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284925; x=1728889725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrlUOXSv46yuueJWA44YvW2DID/cd0AQqk3s5NIwe9E=;
        b=GmU75o+MwrH4xIqYgsGHD2Xp8M23gjm6dm4IlLxLZ+rUiKXZtZE6wWcH4EyOzPm7I7
         4fydEABsd2nJMle/XmVu8tP0ilseUfsRQ+Wx5wy1ie38GjYNnI77/igTLcZIzUuMVz+w
         /MtW/HXl/cOGNS9kNBKapSq5xMIyCiXA1LNP4nrSCQzOvkUhNTgxdBanUkxmRjdEcQyY
         E8YXtWw3TMoesPJQpCq1+pJ8PxiIAso9yoXnxxzn/nRUhbkNm/eIoX87q14g3NeA7v5T
         gZhpR1X3lp6IH48x0lIBBbvnud/GeamdEOyfjF58OIdZedxZWE9/fuWB9Qxeb0seD5gB
         ssTg==
X-Forwarded-Encrypted: i=1; AJvYcCWLFAz6UWYoQecAPzSvVfdGgeilTyopVZNpGR8QoT3m7RPKohqONmKBDSnSqTkoBrZf3JNq5VrI3ldp@vger.kernel.org, AJvYcCWSiaUGSfzRh3zcON56qHtuTolSWmLFOhSdWA9vd41+yurDhrCpi9DFU58y2WLm6MAE1pDqc26K51d28g==@vger.kernel.org, AJvYcCXHHI95+PWkM6wrGDU1Y9/RNXXKCeY2UJnnRDBTYS92G8npLmTTowqqzykyAasIQo+0hBAOEd8e0KiPQ1Aq@vger.kernel.org, AJvYcCXg/FozlZuV3PcwrkRxsNV+n1byQWdxdwbM4R02G9yesCCZsytwJZoiPoNyP+3Y8L7Dql9LJwQxZUYHRtlIq0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfi/oVCMc43ATaNf2V4fayaznsxRMSEvM/p/ieFL3mnElTmGYg
	cB0IvbU9M6ifffF9RU8NGWBkgTGw2/39dYiuZlpI8b9AUobEqctR
X-Google-Smtp-Source: AGHT+IE3JOnZBjIYiADVptAQIVvbE9N+JNI3Yn2Do7qK3KMd1FDW0gDf2tY773k/NVFjP3DSSy6THA==
X-Received: by 2002:a05:6a21:3942:b0:1cf:4197:6697 with SMTP id adf61e73a8af0-1d6dfa46a97mr18167307637.23.1728284925418;
        Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Mon,  7 Oct 2024 15:05:27 +0800
Message-ID: <20241007070758.9961-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.2


