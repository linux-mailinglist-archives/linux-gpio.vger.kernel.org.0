Return-Path: <linux-gpio+bounces-21729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E387FADE7AE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB1EF189C5D7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F390287501;
	Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfMFhhbw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B11286428;
	Wed, 18 Jun 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240779; cv=none; b=c2FlNQ7GV9Brcwd5rPZ7FiUpPd6bQQvIQaUH3srhodZmy1mTvcFl1PhUOCMA1Ri5WDXaNafMN7Z5t0N3qXXHYbUMS/hm230tkZYoPAtBvjP9/gKmGLWJi9KENYaY0pWlg3nf3qLbEMns6dr8Vf6iANmFo/CWw5aEoWAfAv9VZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240779; c=relaxed/simple;
	bh=MgUWD9YQsxn5/C/R+JCffVZSwSVCSnac14bnAmk2/hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHThG3Z/kM09MHHx7LR12nqHXbEbI+n+b7LzI1S1gjH4yLjOoxTwwfCevNehK+6/UjsW+xuoZ0PDSqxPNH3ytwGrSUy9jzZNDovl32S8kuy2j+473AhVpwLzjC7JYKq4dj+yZ0ykHvJ46CDcRUT7HuZpne2/Tl4Wl314+aolIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfMFhhbw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso13052466a12.2;
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240776; x=1750845576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=XfMFhhbwGteF/iCtZGX+rKG5DrACClsJz998eK/ZQhgBoIWHAkrFoUWrkpumhBZ2os
         Sp7FLiFwE5YlArWNswYxDRZbZ6KEPAEI7tCoGRenA4WsdOyeVViFo3rcGV4YbufbSCey
         ZUdLDpZBHFXlWFLwkAU3m3fPLgCmZCkYj2QXHukrJbeYvSApWSyTtSY1DX0MrehpWSHA
         c9AKHtcTQ0uClWzvqMPXi9f+MWGVvHj67IyxdOG6fdNPVkavrOSPkFq9NiiC+XcnO/L/
         aQNSBefrJvbdOHETkfX5tH0huV/SPt+V6Yg6zUTVp+3S2UuKbuprKieJXz9bspbBF6nq
         VbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240776; x=1750845576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=snp1olQTpEOk6Oe/9hLlECFZcae1X/vnbyISqVxGdrbQJLvPmJqEmXwaJIn51lJc9R
         DHY/8BDV4qUT0/gSihMfYPx+SSb+PXSzz9wY8LwN7zhx5dy/qzW3j19IyllftyVGZKId
         KA6YBoG7LCuMAr5IRCppPnxyDGLTdVTnwp0sflIlF/OJ4zCamXAeD8wJrUl9HQZpJ10o
         BV6bTqqlqWClHL4In44+/LWBtXpJKgSC9x2bHgSoIdJF3vMS6V1IG+GXIa3OYBDH0zl2
         7PB8RDUGxfymhx1rstqoo7gXQUuY+75Qg9xPu06FwugQFLLrovdRInniPBC1+yQwc0L7
         WktA==
X-Forwarded-Encrypted: i=1; AJvYcCUDDBu4m6wzZDvwmd+w9Hl93xZ+Rlk4eygKShZKiaJeKjyM8MIXttUR6GMnElt4IB6Z91KMPbnvNgjmjw==@vger.kernel.org, AJvYcCVUYiLz2WMnTKdKHFFaGxr9CAMEkx2VxubMLbgMX+zcxy+7ME9khpN0K8t4OQu5aHQsppF7bU9z+K9E@vger.kernel.org, AJvYcCX8VPfg5hHpGaU2Dh3ydx8T60SoLNS81118BUVJ5BEyMvMslgUxQT2syNhcvrWDhtVlYcbUzxvYjz1O0EHP@vger.kernel.org
X-Gm-Message-State: AOJu0YytyvJC4sphHUr7QHOul5X7O52R5FJ0E7/aBYgqVHDXO2UfonXM
	kkijVjTM+v2jq5mAcTF2mgcsd0pK+L817yW/4cWTVkX3I4e2GhnQoy7Q
X-Gm-Gg: ASbGncvVIHQd+flnckeT80qKpqZbOwj6+EcjLa1mkWZYjnAVPTcevGKjVuem7tpf5OT
	5jeu82rWKE9i2i2woBoGRQfkJfMFMXsRghZLG3Ztv/qLFcWKQD8ejQ608RM7dqJf0oMUEFJbvrn
	mjjmgzB4dzgGfDsxY3gkVZDy7ZPH1COAVzrOUWJkYgYIDjcwnry5YhmQfKrQTgeP+RB6QTXijY6
	xhNzuEI3lJeh864NcrgOgtoguuePXKn4xJkkOa6W/qVWQ9WoEGLVSHgIZjnoOLQNj8Cy2l1Rbg6
	bl/LMuYGgCq8NUVoO47MS7AHFaqCGzR+OO+AAQDbhRzlzLPZTSBIyTSjysdrGjDwcJGhuxtHsYQ
	=
X-Google-Smtp-Source: AGHT+IFklX81xslJPt+iowLT+1k9njV2LQ7x0hO+cU7atbAXLMnFNCP53dDd5nC929uAPOjrypa8Yg==
X-Received: by 2002:a05:6402:2803:b0:608:1670:efe6 with SMTP id 4fb4d7f45d1cf-608d09c137emr16021790a12.22.1750240776014;
        Wed, 18 Jun 2025 02:59:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:35 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 18 Jun 2025 12:58:40 +0300
Message-ID: <20250618095858.2145209-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
-- 
2.49.0


