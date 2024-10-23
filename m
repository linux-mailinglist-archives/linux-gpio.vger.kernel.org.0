Return-Path: <linux-gpio+bounces-11802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC8A9ABD3B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F5581C22471
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DADC148FE5;
	Wed, 23 Oct 2024 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPGxt/IA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7928148857;
	Wed, 23 Oct 2024 04:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658711; cv=none; b=J03C8tm+mb6V6PTHf+84R8cNd8quyRt5xDSQXjuE0yRCzkKvhnJDEraDdNrbguqIPEDawdk3jZgymN8Do2HDbReR9jLvjoYlmSJT/HW0E9/px+G32pVyXvgJLJhkvjsWuXxQitsHd6H5mGXMCDuJLdBDk0TaPooKH37ULXxvJuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658711; c=relaxed/simple;
	bh=/xF4mdxwIhmk8HMPBdMfDFiwL7SS1YLTggmotvU3r/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/UmmI8LlxqQjOugXShpb6+BaGC8+N4MZWLuN5Cu7ToPJi1nweK47oRU5b0oKRzzyqvpBdfmZNKJh9mRL6lclKuHhomGOBCS8+mNHN23ecW/YuKVXAzFP0R5Y3AFyhfH9DDBxN3fTCmt/lxkb/AC8awVsH61kx9WaXTiktpH90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPGxt/IA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso61254205ad.2;
        Tue, 22 Oct 2024 21:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658709; x=1730263509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+4zDIBqpXebMTzDFpDT9eRBDvM63w5V4mXYWQhuiHc=;
        b=TPGxt/IA1vKEoeZuVRcH1CQShixfGDyCwD8VSp3Se3BwTzcu2sY1ELaynBKQiJoEen
         yLal73XkIYb/CIWl+Jrze5NAbsyDIoI+8dlaVQA+HAYrHTNDrHMkn5JZ5EPN/MrFR4VK
         uaL6fxZ6QijyZG3AjTW4TwZloDe4Tn4RtFpC8OoQTKW+1ryRbjLu1XOXzJnRYy3TI+hZ
         ZKikbE9lhqInTW3bDVgpgYgCKoqrnL1Ka9CJhiFRub5W5JvKLVf3+EbmGc0fmlqi6TjN
         R2Evqb/GtXUJ3xF8dWJAux+cmNquOF3UDFa+Z7+X94voTzuCBzwFc3dX8wgrfuohb3iJ
         ZG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658709; x=1730263509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+4zDIBqpXebMTzDFpDT9eRBDvM63w5V4mXYWQhuiHc=;
        b=ET7VVMBoLl49Iq0OirV6J2LF6ZA2ch40BHT5cu37g3AChLtaqSMNRfc0m9uISDfrpW
         q5si+vSdgeMXdbqi9WezTlK1boLTMBtiqLq9a4hHIWJ1YIo8nk+xwcUms+N8sCzF4ESu
         CbLUPZV2otIPfJd7TZ2EymFdxb7aNlZad9ZaLsmNtILTBjFW39SdCWAgvz3IBsUT7Cha
         BpA3VkiBOsQJaF3UJyLr+/zpb/wD+LOFveTLfDTH0YeEKHzAqvtlm19hmTcuW5hKwrR1
         c3HqMOvtzEq7xWwR4jgg62k27k4iYPRVrKi4O8DF9F+qo+Ssb8zqbdUnat6gwmMqscIg
         sP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBi9dcyoqR5CEc2rKGzo5cgKDNhEQaRF0HQuMz7GcnhNm8VYEeXiN70aGsFrPoeHqdLzmhTgS5OXZp@vger.kernel.org, AJvYcCVhtRIYzNkMouT17HjmAooj3yoVgnD4uE9RdoCVUq3ac877YJPfWosQ/Hpen5x5HkaS5DQICQyo1l3AcA==@vger.kernel.org, AJvYcCXs+EC7UKeyGtdgtESBb7cQNGmB0tlG8FNI5iQ65Sfh0N0K5mtqV58xz/YND7h+avUgCK0IMG8MBPwheh2mQxE=@vger.kernel.org, AJvYcCXtFqxY4QQ2HXgH3skch5oW1I/QGbD6zqbomE1ufBJpZcQ9EMeyFCG1Me05DBH1Mhu1doInL/lVw5z00aEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOd24FKh04cq2/vpNW2qPZ2ZXB8oXREq5BZSL2QM3t0gXXINo
	kgmArSuBkKQ12ZZ1GPtwmRJXVaBElOsw4CXUlbMZWwA0QZvxCI6XWEzBgrCWkEY=
X-Google-Smtp-Source: AGHT+IGkZ0YiYKN/wZ33oPdz62pyzHKEQvLTlWCTI8o78RTGv7e5bqySL1yDyI7UrJA8DguKMMVqOA==
X-Received: by 2002:a17:903:18d:b0:20b:6188:fc5e with SMTP id d9443c01a7336-20fa9e5feeamr15742345ad.28.1729658709189;
        Tue, 22 Oct 2024 21:45:09 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:08 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Wed, 23 Oct 2024 12:40:40 +0800
Message-ID: <20241023044423.18294-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0


