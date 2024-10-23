Return-Path: <linux-gpio+bounces-11803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FE59ABD3F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B5A0B23C1F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A651448C1;
	Wed, 23 Oct 2024 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSf3LeQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE113C9A2;
	Wed, 23 Oct 2024 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658716; cv=none; b=vCxQTZmeFHMIVhnXCguiXtjd4NHZJgz068IJ6T+U3B3G86yCGGw1Rsg0dgnuWsO7X3C6B+dRaNwOe7bOw6TUVt/0K8bpuDz+AB7SzX2zpHUS0w9/ln3nYUdIuyqQbEOs6v9JzPPyPYDpvXj3iM/iPzmGvqZ2mXGfrh6QO0m1KMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658716; c=relaxed/simple;
	bh=QyRVCV7k0IMsHEFlNwqwOXLJhq0As8matIK1rrm+8R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5RMUhvozatCWQNGhjnEC+E1LPzV4wGiCd9KQQoZz4S51AA0DjzRrrawcKjj/SZ+vCc3oxmFLVsN5ha03DCQ7EHnRwi9I/ECgB7kqD02BbTxLSFT4begiGL+Z1uWdJk26TV7j5pcHlHi1iXQ+FXpRIB0pCVjFGr1CRgidxm59CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSf3LeQp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20e576dbc42so46933435ad.0;
        Tue, 22 Oct 2024 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658714; x=1730263514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRRyn6DkpWMz0v2kqaN2e7vs9rb3yVIRaf7RcLqYaMw=;
        b=VSf3LeQpqNbiWFl/rcUN2oCvZYfII+vtKeklIKQEJOEyTsZMP5TYpA1NVFcnlWZH9X
         MocwwFwAsWJX/OZ937uggtxSmHxo3cBOhat+xZt9nCbvQqABIREEazNILHOkSTLBmmE/
         awSo1KTsIOPjgaBrfqzTw1FbLTmA/utSraQkP+qJcIyNdxZGfXMOsgUFn3Ju4g++RY/s
         p5Bhk3y0Vlf1dXb7lyZ5ezwQji5vca42d0e4eEvDeA0y8HjHEpe+dyiCvqZAaVHJFfhC
         OBgKOGVULGN9kua5M+0Q9auT4PnNUd2Y6aYeRcR3aXfmYELZYPReQK6vIStDR446UK7O
         dW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658714; x=1730263514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRRyn6DkpWMz0v2kqaN2e7vs9rb3yVIRaf7RcLqYaMw=;
        b=IbVib20dkzVZZn+vtUHhJj5XzzhdqxM64Mw9QX6TJel63vdVlueMejXHM+q4axjd4H
         vgS8lUjaasGbwnqzthfckP27qlVWzGXjly15LBW7d/l/8TM4shUngUpiC0CXYvbgDHXm
         wK3HY5mc1jYDQkv4CP4GQt0deC62K/izDe2eJXOyRB7QPvTWMpI8IM1wEG2O13BojAtu
         PA5W1PCUVUi9wKNdJNuNr+Xq42m8Db6jngpD83RATh7nRrstSmW1yGz3sbSzuF6Y0bO7
         E0S006Y4pIF2/NE30rrfMogYwgfVFDrVbz/YPuZrbHLBkZ54hHo3Lo5mPHiBpK28koHy
         g84g==
X-Forwarded-Encrypted: i=1; AJvYcCUebXKHV6Aq6rJmCDXibgBvnUUMbxx7KAFqvO73LaR0MWaDJDrShHPT0drMc8CMhw+QcHOPu5Kt6IefGg==@vger.kernel.org, AJvYcCUl6qTJ5grhvwPBbZ4hmSMY+XZ+22Fm0knVeGtQ2xulp2R8ROdjkW9Jo6AIlIpZlbVDs9OhuyYlZPjJlgSq@vger.kernel.org, AJvYcCVefqJAXB+saycRQRJSfB/vcZdRJjU+lxVTLpbVrlGffaKXV5oiesk8Dtm8eRz2pUeavRo6cU15dfw1TogLIxE=@vger.kernel.org, AJvYcCXku6HX3neOAe/dgktzGJUAazoSqVN1lxRXGGrJmr+oB2eaDhGrE5iMbU/t8BANgpQkayySUkq+iDqm@vger.kernel.org
X-Gm-Message-State: AOJu0YwydlFPJFdRtwxtb5DLTMYQY0iiFBBZ/4i9GklY33/8ixx+c9GI
	Sw82HinOERg3AnNVebBIGXhv+nXhtxIXn98pu1lcxTxEKsLfC71E
X-Google-Smtp-Source: AGHT+IEVxY6WS0+t4ZS0RRhzjZgRl3Kk/p4MYisUMVUnP7LVq42/iEODevokAF0quLoBPBwiWFtO+A==
X-Received: by 2002:a17:902:d481:b0:20c:ecd8:d0af with SMTP id d9443c01a7336-20fa9de9252mr17066275ad.9.1729658714157;
        Tue, 22 Oct 2024 21:45:14 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:13 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Wed, 23 Oct 2024 12:40:41 +0800
Message-ID: <20241023044423.18294-7-towinchenmi@gmail.com>
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
2.47.0


