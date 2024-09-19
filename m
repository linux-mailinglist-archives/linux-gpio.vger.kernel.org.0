Return-Path: <linux-gpio+bounces-10279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14297CC21
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B595BB227AD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1391A08B5;
	Thu, 19 Sep 2024 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiMBb6Qp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581E19CC13;
	Thu, 19 Sep 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762547; cv=none; b=U9lYdnBzjkbEz3INLtX1rwxG5qT046E/Qw1oIlRy7gHLMR8unvskJEUtQVZRzIepvyheGeGZDtwigWqa7fsgjldD7cO4F8xroZ6qNS89H2aX5L+aqLP4ugNJU2XIEqTdDDFXwRYZQJBBuoL+pld0QZIAS4H1jnQHvCIZwEDo8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762547; c=relaxed/simple;
	bh=E3RYCczoWAIl+1EFjhBF7vdIp/MBXZu9x12iEfKWfg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqUMFc5106HBSl74Vwa3xP4aNBObpZPpN0bSxARySNaj+Uh2nqYvfFNwFM+AZgaUMOtlDpTyA9r4td3jRm8pHMusNsGT8P0HvkzArSYkE1I44xtsWWLLE5oF8E8Vlqi7zE/d+MNHEngpjmlSFgrrWgwZ54M8VnYFqaFC9BQbH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiMBb6Qp; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso835111a12.0;
        Thu, 19 Sep 2024 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762545; x=1727367345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoZcPIwsVHYtRMkw/5WEuN61HIysTMbtkDEFCrxAqpA=;
        b=EiMBb6QpuTEHV+07WEMgW4CcCiQHVYaOY207Pl0/GYre07lW07bRdSSGDH+xe40Jfy
         uxUfUccgQ6s92L36twOo5Igv+zdiDEKJBS0OuDbhp58y2TYpOMG5z28o3cHmdZp3ppQ2
         8iYY5Fn9cUyq7v7BssiDTBfbRkbmTvurZAYbb7JxSFJHXDnpz+TlnR9+yhoVQWWFrgqs
         HnrCk94zijAJFCA6BidrVQv3oP+G3PnmOrj02Il8SS77R1n8zVqe7nOGTLZbeNiVvvu6
         GmL4JaowBA0jItQIVR4XDcQmZ7QbrU+OeHZxAvL+jxIwDW/su2leZ+i4uyrj4+q0wRDa
         W90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762545; x=1727367345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoZcPIwsVHYtRMkw/5WEuN61HIysTMbtkDEFCrxAqpA=;
        b=iY6rBmeR0zRPvfFduPsy3tFl+muvEBpamFjPWq9oJxyHfXR67wzlmTo0qD4vhn9rw2
         m/x6NyutXLYghmV3k/snaClD3ozjOiZmeL/0aHk5aWnrWbZ6WY/VOSxqmIrWvDsGfMgq
         QybfXZTuQCWnoYbQ2RWxCZRrDs6ZEMdS1NEjxBk0oUrKyO0zmmQe8x2M2yDzHpjbHy+1
         9CQQ4EEs2VM9f1n1ieRePG+86ZrSAg0RdRoZgqj4/fJDUsxSyk+X7dcisP2D2pgHZGli
         +DEZph2GnK8wgYF/2kh3Lp8lIggp/UtoqTeu+HazqDLn5k/8zZCwBvED/UIlEh/VtFC5
         luLg==
X-Forwarded-Encrypted: i=1; AJvYcCU0MNMjgF2qUQN0wwuUmIcKARS5TieUIRY4gFPxDg3/us2WLZMzl2yZMQ1k+ZBmd90uU+ndz8te17wwGBtSTqw=@vger.kernel.org, AJvYcCW+3cV4OmG4oPKm9eTcKGiLpMDhxMqD6Y7WajXsg6nbVP/VbGejpOSShbVzpgibI4wkMGx/ukGzKpi7nw==@vger.kernel.org, AJvYcCWHciia6JPGK7NCGWY48yrIQStQ87iabuyCr8pJw2iXtwwixfmrEtgR3VCxi4+LtOvMcOhPIrvDztm3@vger.kernel.org, AJvYcCXL7lfsWK8WHCLStdZdndS0QgjtQ412YPATMADG/Tx/SX65hyIsZXdsmnO1ODKrZxlq29zGt8zFbqK7rRzX@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrOmhJ9F2U2s++FlyrOq5raLwOxaz6nJIpWk+hH7Uj93uQX+Y
	BlZ9JzH5kF4WkhLSaTXH00WgrmKcHOsfp7Qo4vZSJGr9PaYNerPP
X-Google-Smtp-Source: AGHT+IEhvS1/8bHcpqCM68pV2gaO+sQpYTUh6bBazzrIY3p1js5/1/bdomadlg6cx2Bh69svA1xScQ==
X-Received: by 2002:a17:90a:5e0c:b0:2d8:f7e2:f03 with SMTP id 98e67ed59e1d1-2dba004842fmr30745184a91.32.1726762545103;
        Thu, 19 Sep 2024 09:15:45 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:44 -0700 (PDT)
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
Subject: [PATCH v4 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Fri, 20 Sep 2024 00:05:50 +0800
Message-ID: <20240919161443.10340-2-towinchenmi@gmail.com>
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

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

This follows the existing newest-first order.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..f69b75afd258 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0


