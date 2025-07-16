Return-Path: <linux-gpio+bounces-23369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57412B07DB4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AC36A4194E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8006F2D4B47;
	Wed, 16 Jul 2025 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxR/J8LO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916972C3264;
	Wed, 16 Jul 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694293; cv=none; b=THl/fXmpGi8P/PtA0u/4SHmMNIMaItfnTKCYp+YWwxmvVtJXbepqWgk2awEMUmQGkLFmOdhJW73KgQQvTQEcIOiievUzP0bz4j58myDXlsdjoYUsunle2KjWDM5K2JXQ9W8HTvQHVvloHhSN63cPREWQbWnSiDaMDraBn7n4qJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694293; c=relaxed/simple;
	bh=JfCjVDpNvj/yX5XnYKoO6JDnWfyHITSwgdVL+4kNl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQOZoy1oVJgTzQWUPRq+5U0iBNE4t4XO0996b9c7e9qEY1tw/hqBGa0Ma91dNVLRP5/Dzw4y0WLxQlu0cXQbMS2oHvoH6s6K0Q459pLNgoWRvOAnaGY0jPYXBqNLThzxjSuFakqWDJo+KmS/yuGjLk5+hdfIFOELPXiwfIDTGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxR/J8LO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so28593066b.2;
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694290; x=1753299090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=OxR/J8LOXzvTmdukz1ATJNn8lJdFAIYiEWPvhtz6+DPOmF0KmtIgzo8HN8V7RghSfZ
         YPZAScd5s4cR4uZED7dtbDDX6BtkUr7W//fjULALVJQwPj1btZ9ZzjUjspnKUkCaAvX9
         zLER6BwUQy5ERxANDTcZzNwLypUlCFDd/ykHjks1UrOcbHIrf5Q7uXe1b2B9iW5tsqAX
         XXa7GdzuYR1npem+boadFW0wzvAN0C4zLRA+23upOIkHGX36bWbF6MZWtVGvwC2jWltZ
         hqlbWvk++0Dju9hV9ID9CyHjnE/3+bHg+CWXzz6VOHglknKB+dhXiYzYyooY5eQsUDya
         Eg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694290; x=1753299090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=CddHUY/a3xjks+sePu0Jvk+tCauGyiz3lMajfkcZT/DEhBWvKSeZ03ixXBhTIistl/
         x/kO4MxJ/1Dil3LQ5xVUfl1bWgYJxwbWqix1s92gUoPidjIGZnfuAH/AGfJ0c+Z1rZgf
         cQ6HbIn3PWbgDb+zi4WuThs5Bwoa8gRGwLIF8XfD/luFeQCbk0zyXJACiB8pEfGXhn3L
         jyDrySgqqFqFeS98oVNqoDjUh7TzLbEp9kjC3hGefhj+Z/ene1CJhpjSpi1NzOAGPNqn
         qkezhcwqTf0g2K3GJRegvsvDt+8SFGAzLwEzsJMlZSftndsNlH3aqXm5wjTOLzaZks+E
         PiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOquB5kowWJ0RFdH3QdsT2x66JjeQ4mMIkpvYWPcNWWmzXWVrYOcpabxIWZNdrrqZ2ve3ZsF6+e5R@vger.kernel.org, AJvYcCV4efqmKtQhG7sjHFwuffyQoXLubMIJhf0xCoaIDEETsMKIIUdhN8HSldF2Y2J++B+y6kf0uPEHDQl6Kw==@vger.kernel.org, AJvYcCXJ9BpCz4SnTDX/AaI3IyxNe65kEwr0MM6E0m1qjMv+PaTZDwhF4zeC//gsksRttm6cc/YZtxkKhiaQJrPT@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNVAQQ3l35bkrhU+dVu8NLfzk8+lAdJrUM7KVNA2twfomdClv
	ibRAmWZNCQRJF9Tta+tYbcuvoCVXpEX3ibt9G9H+RZPWuvoETpYTAJT4
X-Gm-Gg: ASbGncs98mkRQqwZZRFMRwYXUv/HwZ7+Rb4wPet39c0gLYmMszbmoe5RKAXPUzhYvOm
	qPbxhuL/4IL1BUZL40xnmLVn3bNbfS2LRxRn1FYGXxnZDpNri2gMM8jwCBQ0rg4RexOlcnhJYpw
	zFQnADJXvOFzV5tCsSSjYb5LMGYBJ5yL6wPdNOXmckBbR9eiR36rc1gUNcV7apaqBWC8yJCi2++
	TSwn4YcYA+t1N2hUQ9UyNRZE5KBNhd7nJlNrLs5BnwqV444uI2ZWihu8p+gAy+mae60KD7az+9e
	mB4ESjT9Kuplsacp0poAXrmFRD+axjU05oOudBVj0F36l2+NhHcm7w1e8UQcKRXKHWnpjg08JjB
	X59rudq/xVzSGps4/Y+d1tu91LZB3dfRZm3o=
X-Google-Smtp-Source: AGHT+IFbzmjXPORehx4gBLWL6nDKMc2K1Ww4NbN3ka9kvo8IrUO2+Ra0huOSILfblCFzf0Qzb5YuyQ==
X-Received: by 2002:a17:906:3b05:b0:ae2:a7aa:7efe with SMTP id a640c23a62f3a-ae9c9bbc69cmr330143766b.58.1752694289556;
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 16 Jul 2025 22:30:49 +0300
Message-ID: <20250716193111.942217-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683c..9afaa8a7a3f52 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,111 @@ required:
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
+          Rise and fall times represent the time needed for a GPIO to go
+          from 20% to 80% of VDDIO.
+          0 - Fastest
+              rise:  1.0ns @ 1.8V,  0.6ns @ 3.3V,
+              fall:  0.8ns @ 1.8V,  0.5ns @ 3.3V
+          1 - Fast
+              rise:  2.1ns @ 1.8V,  1.1ns @ 3.3V,
+              fall:  2.0ns @ 1.8V,  1.1ns @ 3.3V
+          2 - Slow
+              rise:  4.0ns @ 1.8V, 2.3ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+          3 - Slowest
+              rise:  9.0ns @ 1.8V, 5.0ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
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
+        description: |
+          Enables jitter compensation.
+          Jitter compensation is used to minimize the jitter of the
+          signals transmitted from the deserializer to the serializer
+          by adding a fixed delay to every transition on the serializer
+          side. This can be used for pulse generation where timing is
+          critical.
+
+      maxim,tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the serializer to
+          the deserializer using the specified identifier.
+        maximum: 31
+
+      maxim,rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the deserializer to
+          the serializer using the specified identifier.
+        maximum: 31
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
+                enum: [mfp2, mfp4]
+
 additionalProperties: false
 
 allOf:
-- 
2.50.1


