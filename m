Return-Path: <linux-gpio+bounces-10424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5359853D2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126772875A7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCAD15C15B;
	Wed, 25 Sep 2024 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfrjiRJq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA5157E88;
	Wed, 25 Sep 2024 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248861; cv=none; b=dGiGMbMSGpFQ9bzFxUyzeFUiMlPYBYgKdyEyMROPCNsVHfzICeP0FPfGK7/BTRS2zXyFonbDnjwuZM3hac1kmy5ubjXGeWX1FIMm6THFgatgCVF3XHfhkcKL6itWaPBsMMZjTSyS46kEDwPmrPRnkaimYT8WfyImLfcix3WNEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248861; c=relaxed/simple;
	bh=8QBzJyx0+ZVrX3wAJY2KWC9c5+OMby1GZPstnqAo27g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aroE9zoCa60YwZ2YUAOwKA06aat/cLWl+c3JvNgtekIy8BSWqasFEDc4Ywt87SYYCYhbTUXqcafdvyVOHcYPk4E6XyhD3lmG38g1WGpIFntp5/QoqDtH3yGBfK7cNjpegdJGbBZmMw/J7mt2wRbiOHpq7at3Z5dzqJHbYxrYkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfrjiRJq; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-831e62bfa98so313478739f.1;
        Wed, 25 Sep 2024 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248859; x=1727853659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/wc2/LABeu7MWNhfG7leQqnAhaWbUPZEJ8Ap5bTOf4=;
        b=lfrjiRJqWSL/ff+QTySEbx8/tajg+WrT1aEl5PY0LtmgfBaFFYaIxUHdAHel8rLFuu
         6k5tkuuyu0OVvtjNFsXhf3grolVwm/BkCWVMt3vhNFfSqub7Mw7iRporwT23JIlWXXkp
         Ar7xscZzSNThMW6P0VBK6OmPS/dEuinV8ptz1opMgUSrVbAKHUqFngdKtK3FZo6g5oJq
         OuxqOaDZGojLLvPUSKvmFGU0uQnVQdMPIiWgHbdKrhP8GcTFY4OvDotENW1Q1uxoBP49
         DFgb0wSCFTuVIdf+kG2RkIVHFiYAAETR2rc5Fj5FXKq3p7jJhHHpAc5qluSzpwb+4ney
         PQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248859; x=1727853659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/wc2/LABeu7MWNhfG7leQqnAhaWbUPZEJ8Ap5bTOf4=;
        b=sizd+aJNDHgWuCqhHkUvfa+sFs6jwGykNsHldqRC8mOmrq0Z5zDP2GDszML4ZUa6/k
         /XidMotmp2GhkkaWZzyU9+PgeSLelXYAUQ0QCm/VqJMKn4MpmpSypX8eoIuQPebRHy5p
         C+Zrkbil9T/URZAfebcSoTl62phXnyzUOHpRvWcdBYzVbaAN5u59PJikya674HxZUr5a
         0a7JqtBaNyhb6F3smOHDehb09rYaAo0gHL4wBeQDT3TtjsnxCT8ftc+ckOr5AqJEnzRL
         WvFXCM9SKWrq0OanQGX6Y/ZsGRFjjZaRXxPlAsi/N+HIvMxjwpFZRjiecl7hKvaEkbmT
         Ct/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ86Rsuhm7g7f6vsx4x1pr60MH9PfZBoZzLCCc9rtbmwJGlMzkTri4O+4OwSnCtnr6Td9NEoHmEtaAGaWn@vger.kernel.org, AJvYcCUv9ylY10gXEMrW84wNOGbM/2NCMMP3JrM9EZQWYZU+MhZwE7NVoP8BUTnRdRhbMt4knNPlHf0RHCHvgOU03Uk=@vger.kernel.org, AJvYcCX5X753OtxoEInDENPLT0bCpOxaq21xetFiYPPV8oXqdILy7bXXOirRuWJq4dQ+9QvXIumq8rGduuPkbg==@vger.kernel.org, AJvYcCXjXcIvqdSuZLm6kZJ6OQQfxHWCAqlvvaP+nWyuExrmryFF3L41ea8h3LOJ8ZG0uTt/FFzrbOZezShM@vger.kernel.org
X-Gm-Message-State: AOJu0YySKj3sg8awQWmQDrviJbXEhof3yafoOUzd3GhyBr9+Gr/64Kom
	QmPyUbe/1rsu79kdyDLK2x+k2dp81uJMHC7w4VZmV/9ImIAwuyq6
X-Google-Smtp-Source: AGHT+IE2XjRQV1+SJQyElqLaBdKDjUd5x0NHdSE6OMFzMv1UOcblr+RyfG+A/ww2rG9SzrbrSiuMDg==
X-Received: by 2002:a05:6602:2dd2:b0:81f:8f5d:6e19 with SMTP id ca18e2360f4ac-83247ced469mr167161339f.2.1727248858783;
        Wed, 25 Sep 2024 00:20:58 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:58 -0700 (PDT)
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
Subject: [PATCH v5 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Wed, 25 Sep 2024 15:18:04 +0800
Message-ID: <20240925071939.6107-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the only platform based on apple,t7001, the iPad Air 2.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


