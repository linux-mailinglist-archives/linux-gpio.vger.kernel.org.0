Return-Path: <linux-gpio+bounces-10284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F276A97CC35
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D031C215D3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927B51A08B8;
	Thu, 19 Sep 2024 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkxCqzFu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D91A2C23;
	Thu, 19 Sep 2024 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762568; cv=none; b=k+A6AC3hS3O7PaWnTEbtj6+bG4ng5MTsGwuY94ZM9cr2XGGWxkTNbddqEgesMnSqSaAge+7agoPeU/EwPwg79jU7G3nu0DK6rgb4JoYkXTj8Y5/jvz+KNCZccKmXgXF3sZNbQD7CnUIuEKFGC7cPyvVrur1TVJzL/1C1fY8wzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762568; c=relaxed/simple;
	bh=LX1yUMUMzroiivpLzHUeZsbW1eLhhAD8n6ENcpLvjXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGeNfS0WZij+xs/HgSvTOmgBKUznp66ONFHDXAqjBmf0TZy/QaU9PLuj9jc9S6eDTlsDA0EdOJnYV/q/UzEIkgbr4vhDo0ZUufd/dbiMvfNu9XPBJbu5fh5U6m5AKZCtlDgdRPSwmkCA96OwMMCJ75/TOKiLQ2+LkILsQgKsDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkxCqzFu; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso790175a91.3;
        Thu, 19 Sep 2024 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762566; x=1727367366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=JkxCqzFu5G9vmKsZfWVc3ohvW8TLt8IhINHK4kfoT40M4DMonC/BgTrAjiTP9xD+H3
         z/H7oCnn8DET2pnCOOzvpjm2P1J+pb7g4NpNuMLB0v/tfzQOZpSfbuoyuC0h4SjaYfTn
         /g87x4vhPluFomqT59tlw0qbXnHL0Db2if3XmcFrOE5Wvwk8P2rU0NxltDu37Yy06luc
         nhxF25olz3a/tIPTaUn+NIRAqFcLXPEZHeeKPYLHUD3f7ahl2VrALJ2JpFjarV9shg9w
         kGXx0NOQghvqfLiiTCmzTgWf/w108FvdWB1NRVpTJ5Q+GJqb1Ua2Hkc4LCyNHTSdnr92
         XGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762566; x=1727367366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTTMQHgBeG1zBvPSvQGqnSu3NR/w6NwoxxaOUs8e9IA=;
        b=Gt0s0REYDKpwVp+X41f2IkJnXZUVbAzANXMyjshQSvAlB+pOVMiPW+MTilBQUZOpWt
         IgyamiJp/KDiMt++CikjPWS1KFALK9Qi94ldMy/XRqdYFbPWkkiEw/7pNeeT9lUV8uH5
         KmK4dScPwvOpfQZick+zTG/BNibRMI+XYcD7nMbtNEXJLklB+XJ1GWmkzqBzaExNgoHs
         NTCbSj7WewkyUu1REojd3GXS0hL+s+ogLILNYN062Hj57Z330F5XHEDCvduSqfaklW4U
         HIIuzG7SYstn8BHDqfYyIqju3scPLDrwx3ZHM8nvBfvEbuGYvkRMv8QjGxqe3cmF+OZP
         kaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNlKP858H3hzXhHr+PmTSqRB5LJMgoP9SLZ1iYfYN0dwOFyfEFnBsHSxiJmAbB3Wr4W7URuMjv6/W2ga7K@vger.kernel.org, AJvYcCWC0kTkVml50ZC8UJnsC3UosihyGdO9B66XmOuQPKuIg8afQnAm34/UXujZHSUU4ZXMW9Z2po6k0DYitCWVzLM=@vger.kernel.org, AJvYcCWSzxqqH2Ttkmm0hrM4ANBwvPugG04WL58MXjAnxJZoNNFnovZgnk89q1w1jRefETwuopsYfGkrsCrwYw==@vger.kernel.org, AJvYcCX/xjMrEXPULFbaGnvy+tST97kDCun9m6JGTZ1VZyjvCZG0o/nHe5lxEHeh0mm1TBKRxjl+BOFudE6F@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIzmpfJJf6HVa9VYaGuFqcVt7kdRM+l2DGcRJ9yCGiYe6IksC
	7TFx9U56RLQQeQfE81iRKiT5ZGsFtkw58r11IREmgzxwS36GpCSK2V/c6FlP
X-Google-Smtp-Source: AGHT+IEiSVKlXxNK3uwVkL7x+UIr/daqEjKahMew9XtrzFQnO5jFF9+vDJZDxsj7cdICqH2dDElMpQ==
X-Received: by 2002:a17:90b:1c81:b0:2d8:7307:3f74 with SMTP id 98e67ed59e1d1-2dbb9f31cf2mr24957491a91.27.1726762566066;
        Thu, 19 Sep 2024 09:16:06 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:05 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Fri, 20 Sep 2024 00:05:55 +0800
Message-ID: <20240919161443.10340-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the only platform based on apple,t7001, the iPad Air 2.

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


