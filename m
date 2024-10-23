Return-Path: <linux-gpio+bounces-11806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 167599ABD4B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45EE91C22941
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB50D14C59B;
	Wed, 23 Oct 2024 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlN9q8NX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2214814B946;
	Wed, 23 Oct 2024 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658731; cv=none; b=c+LVoIwn2Z5VfnYGtbOtinJCxkOK2wkllBvoOxnwEYriVZ4E0Iqo6E4H+LLNExoI0K1+dWjbTfHU6E04pPEhSizNX0syVjY19MWwd0WayWfv+cpQivdTapsgy0NhYcg3lfx0ykabZw2T6ChYv2c1aAnjW8OFguI52bsWCrjjGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658731; c=relaxed/simple;
	bh=4HKNim7HFxJRjrFmDGbWHva7HxDNUViZOa/mq0bin68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is5lPWi+kpXYcZprXEg1Sp4/Jl62um4/9YQa0H12ykqZGDrI4Ld7j8WmXclF8rle8TxlE7UB2PAL+++khSbXPXh9hg6ZsYLopyRWi+ShoSRZ4E/5FinVjhy6yjz1b77NOecLyPthvSyBYOCfL6U4XPwK0kERu6jXJK4MJL0lxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlN9q8NX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20e6981ca77so48189885ad.2;
        Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658729; x=1730263529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH2ow61Xa10eYMI/pQ47ccz7OPzd71+FsvtkLoWx3cI=;
        b=NlN9q8NXx8PaMbocjp9mWOTMq26Z8QlK2kxhjGPiRbtRo+pA8Vqx4+clAhPZSoIWEJ
         Qa125R4ze8ifVRbqPa4Z072cFH94o3Q2JV+lmrfdDeauMtBrIPivQuvLrUqwdGRb9Hrp
         l/mbD9jQjtarw/b6ySP7Y4wWLOApAxgpqDENyyw69Jzb4xWisZN4O6W/pWR/P4qDoV2U
         Gi+zsxwF7kjaYnGLF4eeLUKqnQnXPGw+AyPAM9cUiJnXmiWp5eVcHZmGQyT3rwbGxt/k
         0wLIJyT47QmLfFzZTR9cN87SnuoC90dLNe6j6nNNUEWxhohpEOH2DaAFFEln9H8WFyno
         R7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658729; x=1730263529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH2ow61Xa10eYMI/pQ47ccz7OPzd71+FsvtkLoWx3cI=;
        b=VQe8OSqal8tS6hDJMX6Y3bRmEVwnh0oLs2scSM7NlhZh5ws7xcwDhx738fKYIpLzSB
         7n26OXOm8ho2LeNBWc9oY2wTXixNvigit8vTidKVyy4x0SFgUM3xGn1FqASICjXqPfQo
         Oog+Rqc9GrbvkCwz0b7y8FBKWoIUfdKksnijh8avEH+A1z1TmJOuruIsM7Y0B+iosQH9
         lhoFB0KiUjZUje4fc0Zijq50Gg0uz+g1G9UP9sEJIwHw4r0qsKYN8GhggfPYI1kLec0p
         Pgr3tyJKZ63VaEvowB6SLK8rzKFczN7BXo7JA5FNIUCLuP1ljlR5cnpLLdyILBClsDtr
         py6A==
X-Forwarded-Encrypted: i=1; AJvYcCU+9lw5C3Y9lomWiWQe2ru3icqR+fuGcz5KTW2qaZrOspubFNKbMXGb09VPQKbGiJe3kb+G7NlKQS/lbBGPYqE=@vger.kernel.org, AJvYcCWK1WHdGZYNpvlt+gjJnKaIvxS9hFmetAZD4+BocHkplMync1/l+3KZsReFc2k7fq15Aue49CPZkTaaUA==@vger.kernel.org, AJvYcCWeCx/kyWVFh1qAaHCkNvqd2hw3GbG6yARk3806HUl4wr3cFityLljj2jqWk1VZ+WeHYvjaioBDT9qethd1@vger.kernel.org, AJvYcCXVfgrRLJnanfrmHexUf5GM0QuT7vPCtBgzj1zvagtVEZFBGzT+K2ljL1mR9W1jV/+AfKanr/LZvckw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTi5dl9auYsp2B56jIpYdGgwPqAQGWfBh7VYZkbPL7eSESbEoh
	pDlNiZlL8zL6hSb3s3hZf9HQGxhlx3cCeIwOUY0JfhTmY6C2F184
X-Google-Smtp-Source: AGHT+IG5gi7XjdZQIYYPSYGr62YReQleUZiDqBaU8LyLMAVcCSU8coTf5w5e/pm2Iv+t9BbyTg/KEg==
X-Received: by 2002:a17:902:e887:b0:205:3e6d:9949 with SMTP id d9443c01a7336-20fab2dbbaemr16378215ad.52.1729658729422;
        Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Wed, 23 Oct 2024 12:40:44 +0800
Message-ID: <20241023044423.18294-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0


