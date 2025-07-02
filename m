Return-Path: <linux-gpio+bounces-22622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E53AF58E0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA8C4824CE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7574288C89;
	Wed,  2 Jul 2025 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTsWMfgS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A79283FCC;
	Wed,  2 Jul 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462483; cv=none; b=NSi8s3CNzTGyiriAX3Ys2ZjzVTx/iG94LJ3JEPWj9Fmz+mUUmNhsbCSNyMvIPAbr3EmZJEUujTB0SNJ1VkJk9g49oIwZnlFAI1nnApWiNik0VJe3gYgzEoX9a8vkp18NDKm0t1jHej4eGkyHVdTPviJpzEVEmXIVD9nHq+4O91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462483; c=relaxed/simple;
	bh=TE3k2eV/hH/Mt3GOBJgmYXBl9jXtatuAw/Bc11fhydc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJFuzGIdPsH+1JTxnP+sCjvVGvcsWl2y+uwA921fvkdPKl4Pe7ni6YfS10ogqhiyD9sxIJAjF5FNnFoGXLTYddctZDEtTSTChb+GSdv1ZYgLHBKesOAcKRYAxBVJwMM7b5AbJ/Zru8s+0Z54RvZbZy7hc+O1nv5XzYSLigVt4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTsWMfgS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae360b6249fso891208066b.1;
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462480; x=1752067280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=lTsWMfgSkhzlgilDnZQNGT/t+Ydew0PHWsxBDYYe1DVPFbtac0TAjDq18JS5auHGM/
         G1IT3LULcz4GYhOgbckxyp4BbqCDgxwBtTWSHsPE17MwwFvPgVNQs8LyXVrLt4K5c2R2
         /S8xI58sst+BbYfd07XMRAWD66td0yUaeHK4o8Ngv9jcA3kA0o6oIdxYOQTRHVj51Pbg
         a7PMtqXmnsVZR4iTAp4Re9jRYVnT4QmRDUSsfKDK1Y5SxtjTM9CjStVmjK2TQDl+fixj
         KE51iDXz7eQF8J9ubS51MXXLOnNkN1AoeXKwFMZHuqyz+yM9KR38HAldS7vBfqEZHaDi
         7/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462480; x=1752067280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=rRb0BF5aD0gkgFgvsT+xQIRutiVc/+wEmOJCC0jShf5A4TJzDQSTRv0w+vBUvV6XOy
         aFBN9nTnNym/GHyAtfDrIEtpXuRwnX2OBSqL0u/aAOnKeZskKfAOsvtSEM0W+dbZvmkG
         F8afWi5sFFKbWV/hP5TUJgbQOP9OQdLZXvG9enTIyKr5VGBnMeHkbten6SF++y41kJq4
         t6RDCSNPug0OY2VOUs1kGtBnDBdUG1l71qjbW4qhuER+nYV8MIwe/nYT8i8XuDk4i2LX
         h7d1AaEuBvpPH1B1YuoaM4/BM5laRks5WodSbwaE0bNSfUmqVN5EfVLX5OMQcjuGznGN
         m8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9cVG2rbBotFox+qVs0lecou458rtGPT/i2MUO2ZAWwSrNMZWrvLLCsL6NDSraFG+y3HilKckVWnzw@vger.kernel.org, AJvYcCVHtpKHb1ylgDdKg1SGNKQMgLjjdUlJjUmh8AJ9QFvmsU1/N+Mia2p7ncdSB6Sgc7HeSuxZhf0uAfVYUQ==@vger.kernel.org, AJvYcCVoeKsRJVKim1H4b0V2tSkzuKWzGuh4TPzUhEmlsjcpG5c+suVBACTybEHFdEXRHXH2rxzh7JCKlPczvNYT@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAvoXwwtdUUlo0XHs0scXMVIQdxT1N8+kmkBoissxFMRtgj98
	7OTbLgxJNkV5/uRSpDWpY3EW8UwqdmIVPcaADwhBehEPtxJRCxlZCQcS
X-Gm-Gg: ASbGncvyE3Gte33jFb8f7+QAg27zNfIiLwrDyyyT0A8T6VkGAzIP1lzfj+4cODVYtHC
	WM6tAI57k7vI0qndsOn/k8LkOXMMHOqYF0UCmHbiADru9CEZWG7ZtRQrz23/6+UvHd9BNfAa7pf
	/6NMxt6kmDEQX54FR7FG+c4lQxJUW1cefzidTgyKC46YMUEy8iJl0+QT9rmhrWsM4ovnK7CZ36l
	OZUsylDCoyoh1SeNbh9/wWw/NCTvduKZJF/Jfk7MlhpLq8waelsx9a1ZIR/aSh6JV8h6TOSYb57
	K3rrdvJT6Fx3Dg/1/2KkM+ooENyl3PG4k26bmm29xRIEyBR6sxfqnp/BZVj/Cibp2XzULNkit7g
	=
X-Google-Smtp-Source: AGHT+IHvtWJAofgeCW5hFh4rua7c197JsMsYxoyHXe9CLnAs+7Hh4VVKnq6/7oDPTZuf7PtT37kJfg==
X-Received: by 2002:a17:907:3f1d:b0:ae3:b9c3:ddd7 with SMTP id a640c23a62f3a-ae3c2d5fcbemr280701266b.45.1751462479504;
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
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
Subject: [PATCH v5 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed,  2 Jul 2025 16:20:30 +0300
Message-ID: <20250702132104.1537926-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 167c3dd50683..9afaa8a7a3f5 100644
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
2.50.0


