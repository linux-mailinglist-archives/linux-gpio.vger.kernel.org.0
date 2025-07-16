Return-Path: <linux-gpio+bounces-23373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4FB07DC5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30CB7AFDF1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437BE2DE6F8;
	Wed, 16 Jul 2025 19:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nO+hvNzJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076D2DCF40;
	Wed, 16 Jul 2025 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694303; cv=none; b=V4D2eJHoYkI8Pwsim5tYecsYcVL6GY5FkHzeUmy//gmmFiYbcv5aO/I24qfXvp6QYqI7IuVpgt/8MMOF0U/9/WJTpP/C00GhnPheep288NfMI0q1/QX2FJ1fcvcdhWJtebONVsaa6fKkTtb7Bdqf2E4sCYs5nMUgB9Zmn9edjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694303; c=relaxed/simple;
	bh=jeuvs5sazyu7V8h/2z/SSmBL9wj/xBK/jonDHUZR3lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJk3l+KdjXhxyx77g/cckpLSYjznvXo8tSy+2iNE5LI2zjZN6Y2eJ/9aHn+LbDgmRyg5bXbnnbHzH3E/ZXG64bZ7NAndQfoWNQXkumgzfQ3OzSoJqE9FafML8WQ0VaIxaZ3Vf0R/Af3v0f0bY/hDn0KUXx/zFApTyNJZIJ3DQow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nO+hvNzJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so291734a12.3;
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694300; x=1753299100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=nO+hvNzJEbK2AWzAcM6V4K8wB6UvML0IQsAC8bq2bFRyqmtJM3KEVsQdx3A9Ut+s/Y
         xS8Yh2xjgahDIjz3uWIiNJI6zgDwcQGCRPgeRqorkrJ1K4i7ZMeUqs2a3w0x0lLphNA0
         er9qNceMPzudHMwCIMyxwvHDy22XEF2aosYBu31SN3PLf2U843omXESBda/FREXywx22
         Uii3w9ifkSKp9zVCfNN4xQ1aYnIzmdExkVrYZfQb/T/cpqNE5i91IztsaWJ/9VQcf+PI
         mhh+MAIB0xC8KIYtFWRk0yZ2yMsOPBb6tLrD/+W0cBsbDSOtQYiQOkJwyAJ6J2++Ljv3
         Ov3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694300; x=1753299100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=P7vQRww8xNB0pm8e1soIJlS0syq7BkNhx6AxSO9lCsznTK+1J6oqoZiRFt7FhS76ae
         yJaRVtmeBt7hy421//cJaCRJ7F2re1USZWKMmzUjOpi9YSL+ruhADTwTMm2daNAYjXac
         R6rICdLHdCGlTTDQPSbtK/6x5r+S7hGJmsepQMZpe+e0mMSdzbA4Xw5NRRwx4QsAgu9l
         3yEo4o/Km+FrBngX3PwL4L70tzI49zzict4yQb7tIYDH6uvJ5knB6TWmHSdCC9wvvW0r
         preAQdsHM7bsqZMzHvDxwv8KRT/SvUkV3eI3ltyCp7eXRB9YccMK9+BPxBz2yXa53Vgz
         u5vA==
X-Forwarded-Encrypted: i=1; AJvYcCW/h836pm/FDuscZOLqYeZXq6xMwSMrxWCIOTeZoQjrMP/y6yU4F0HPHJAdvIFBMgNE5NAzYZKCwcY19w==@vger.kernel.org, AJvYcCW7qcRJ7xQJWIX5eMVL4Hg+VCuhCd+RT6VyMewVWIGJ4y3o1wQTmOVCZ5u6GYqfYJLbtGsYp9mxmbO9@vger.kernel.org, AJvYcCX3j95RReC508WcCoBwqazgab+eDB85dUxC4SG+4a/th9P8fp6VCfpcgX2vC0mbXE1EZu6/kFplflo49qaf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31yX9e6QmCQRnDqnAXF5BoRPWho7mCS+zcd8q2iE8yqTxNbKb
	Y9JFc1qYvIpqCej2UsAvRLScJQDOuUwOnX+T0LDDm2HkLOoer6P2IeaS
X-Gm-Gg: ASbGncutxNJyTPXKU5XG18qgO3STT0T12ps/gfsLsofKtjpE2YSN2fUXcpoCtxSmYNi
	MzokHYp1SvEKhfPp5nD2CECE6q6w4njdDkYg2Dc+1M61lXxcfr9DhnYn1SRpIGu+lABuAO6nc87
	JVhvXrd+rOcIafXeKTzlOlrPZOVdUCEBAwEOLr8ArhFhZTybQPlepaKdg1uUil7pnLDHLH83dHI
	nTtF0cl7L/DTSXoV+YTOG+kWPhj2q/AwxlW4J+YiAspz+Mv6c/ildXuX4Nhr8Wep1oZdHJufVPK
	QPO3SrV8UFwdqJsu8YL1tX2tZen/+VHXp9U87915C476+cmIuTNmANYTsQ8/G3ghKKuR0ept2//
	C8FOpED1YCm/YbCNytojnxc38XY+tJz08OGg=
X-Google-Smtp-Source: AGHT+IFgMJSbKiCJ+YHesw4GIPDKMG7m17QkiSCWYoejm7XnFhQC3e5fKlub+SaUuQ0HvhKw3qtqrw==
X-Received: by 2002:a17:907:c082:b0:ae6:e0b1:9633 with SMTP id a640c23a62f3a-ae9ce0d2fbdmr368414766b.33.1752694299726;
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 16 Jul 2025 22:30:53 +0300
Message-ID: <20250716193111.942217-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b96..f712d7cfc35f5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.50.1


