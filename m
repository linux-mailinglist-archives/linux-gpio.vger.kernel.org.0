Return-Path: <linux-gpio+bounces-10286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69C97CC3F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40AD8288C65
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983011A3ABA;
	Thu, 19 Sep 2024 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT4R1Mge"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3331A3BB4;
	Thu, 19 Sep 2024 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762576; cv=none; b=rSKme5vuSNK38KhAbW7HWdY4L6HokwUIy+J4RrA0xz0OeJ8obRhJ6bC8MAH+8T9hUrF24sfnNsa5AO9woZwrmvQUpbELXwetT+BU0cUOCpKqApWvrT919Q0w7cEvNcURnHqL7ragKrVDvqFCctE5c1lAXy4iumbAMVLHXwEJ5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762576; c=relaxed/simple;
	bh=3LdvS5KGovWfSeQULeKu1Eh61BWUO6KIHw9jqYb/UhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISninGf27d+is70eDCpWR+DpuQoRQLPKH8n+kTWP7PuOWxQbMaUi/GexZtE5NmpWa/RElbsyNgBAcEn1fLhY5Vub3y+bsA+nntiZHeHJVCZs+gGelf6PgSvDskUfnAMOID2FA97N5owiWTvgvSXjACw+d4sUEpODCmF2AWdPPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT4R1Mge; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so952265a12.1;
        Thu, 19 Sep 2024 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762574; x=1727367374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=WT4R1Mge0KDiOLAMFgk2cE3g8dCBn6171ZGVdZ9ZmsvHtvNDTW/bywOLYX7f4OfCWu
         IRHHWHJp0ZlIkh1IJzJVYZYk96zWYddQixwRwp7DsxGFF9fTEwxn80E8vpwNyLdJTYtA
         nII77qIxYzcff/zvrVKFQG7KEF7HBjl65O+ayzeJtUUaiUoVwujiS2N2humH58e6jgLG
         dHSE0OIbHeSvI7HLe2BtkE+hfGQUTStESNWIKM4XKS4odWqcdcQxqP3fm2lbvYRNLco6
         ou59wbejhZ6qzIw1df0ea3tuVwaUzrKn56y/ghPjsE0MKjN7kH5dKyxucVSZ05BQ7nX/
         xyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762574; x=1727367374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=hlMtVTlZqe0xmOOCd8r2iHmxCk0FhIhbN/jz7tCxMkBxqE3B746VBrZt/SEcDdRFF+
         29cfY99BqnYjG1I1ap9TTddDHqyiu+qaRTftpq8I40d3wFVg6hTX+tPWv58AM63MFs+S
         5tnlyH9Fvt2v02k0HldJtchDHvqxFp0jQkGkYquR3glNYqn6jnkrU4q16kka4vlGQDkH
         nWmVausWDowyvefJTg/HjRA7xmLdlOES8TEcWBNXw4gwQON3YI40m9NzuWuBOIJ6p5VE
         ucV7tUXGIlhVya8Pvcd8z6lM9dSYSZeqoiCebU9jjiYk4gtsm0JsWeoiEKHYYpYwGKb8
         Bkkg==
X-Forwarded-Encrypted: i=1; AJvYcCU/U/pyF/tdX+NkFgeVdPWlwru6m5qiKGZVnyxDZpbjbWAHDN8NrZ0GMV50tg5l7XOiDXY+ducc6Z1ZRazb@vger.kernel.org, AJvYcCV/RCdL+i5Qd4NrVhqfFFdTqktGeK+ZEiAOhBBuFIC7RJLhdB8zP8TaJP0oltaxcZ14RX8SAEfsBss9@vger.kernel.org, AJvYcCVAIp7rB1SB+VoI7KhUxNyp+Q19lIIN7o1spB9SCF+2NhyUu5W8YKLoH6bimlSMUG01krzAOS10+k4yP1cmrtE=@vger.kernel.org, AJvYcCWggxciqweYNvZEqjNZVp54emiKWuEKdzcA47HKLgnv/yo6ee0MEO7+MiGvDUmMVYIxOoWwEAtRIy604w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7gWo0ilslKF88oqe3KbaHgKovRJJQgE21gcBZNAMuvgUy5HC
	LCFQ1G8KMkhs4vDw8UKFl5SgAE0orvGGjzBdbS5Pgvur7ldcN9lT
X-Google-Smtp-Source: AGHT+IEm78lhtu1oe/4ttv0zXcuaPk3cuEmFrku9D6ErlS3RiO3KgmmXuegqQYUL7VNkObDz+jd5iA==
X-Received: by 2002:a17:90a:b012:b0:2d8:719d:98a2 with SMTP id 98e67ed59e1d1-2dd7ecfe713mr199392a91.7.1726762574228;
        Thu, 19 Sep 2024 09:16:14 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:13 -0700 (PDT)
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
Subject: [PATCH v4 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Fri, 20 Sep 2024 00:05:57 +0800
Message-ID: <20240919161443.10340-9-towinchenmi@gmail.com>
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

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 01965890b4ef..253dae759f10 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -38,6 +38,11 @@ description: |
   - iPhone SE (2016)
   - iPad 5
 
+  Devices based on the "A9X" SoC:
+
+  - iPad Pro (9.7-inch)
+  - iPad Pro (12.9-inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -150,6 +155,16 @@ properties:
           - const: apple,s8003
           - const: apple,arm-platform
 
+      - description: Apple A9X SoC based platforms
+        items:
+          - enum:
+              - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
+              - apple,j128 # iPad Pro (9.7-inch) (Cellular)
+              - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
+              - apple,j99a # iPad Pro (12.9-inch) (Cellular)
+          - const: apple,s8001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


