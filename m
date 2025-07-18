Return-Path: <linux-gpio+bounces-23479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E6B0A735
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 590FF5A82E9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681FD2E11CC;
	Fri, 18 Jul 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTAcpocq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3FE2DE6E7;
	Fri, 18 Jul 2025 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852336; cv=none; b=E/FUHcIqIhgn8iHOXpQb+KNJYtubl41NEcE2uswS/E6GnkGk6sG+MvGDJfuzJOB6IoPogrE+urW0fiotzCHJ/TwIGatw7SeuYMp50XGlkHvn2EpV/nvsGjBwkI2DY7Sv+iVyCFSlqKXyk7JKAHeVcUNzjp0UFq5Bknb21PrRvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852336; c=relaxed/simple;
	bh=NSiAFSJxTXVeWHTLdSPMG/Gzwe3s9N0ySr8pok5YgEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOBWpfx/cN18fiTA/CNv4QPCXurLVEvKWHeH5b3iqdN54wdJ+RdbsZjLF4m5kqD3VEtJwB8+6bFIL+uYNEz+hGLYRaChtNSEaEae2s6i0seRYqmiAGmaKzD6YAafpYQwnQRaRO8BZIvlZCpgsz7me7fkBvPsDpqTCH0v2T9Z5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTAcpocq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a582e09144so1213386f8f.1;
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852333; x=1753457133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=nTAcpocq+IyR6nIhYQi5Fr0mjk+SZZrfR6OEqGQZNxDqEepEghqGWwg0yymEv+dR31
         grJQFGZ6BU3Sq/WdNRsyT3AkdsHa1JPO/in8cp8qYHzFqYHPKxIlsbqY/9br9UTKpLTI
         QlzeYV2Y1mhCt9dNRn7driB1u0twbRHWM0TR1OoUW/Mi/xekJzKpi9Ln7jQpe+KeaBeT
         bV9+KXYI9E3sFqvLRB6xRYIblK0MFG8eswASk+4D0JJCoWkSnJb5cDyLykeyK2U0iAyS
         8hgq+MBovggaWmT2cKtvvlNMy40NSloqC1He3DiZ5ucyhlLOEE0ggUUlY/TCu7cx2+Zp
         GcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852333; x=1753457133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=q2JG2BxV4xEXHHFQoErYDECW9opHT9E9ilMH8Di/80+HRJ1T0kRHFnDetUokEPGkvL
         iljWgd7R8NmHONSmSor56MJ3tgr4NuLvlNuPDsqBraJG1zNTjoSGgrZiOkQWJ0YaMmlf
         vWF6zLt2TrW3UtfgQbz2NOVBbuX9IxuhSQeKeSKAo9Qo5gQJ8fpbGoGQYvqTwSHnnsD3
         KFRZQHuGJNuj4wecr0i3H+UFx60/sitlgd76sxUcz5Je5Aqz3POLPLb6j7UVtWj9T8Ry
         tnwGAd5DsEqrVEKHgZdRUxxLKcQ1CUeiFdjIzm0ACxz8yf3Mutj+BHptdpPvOpIL5ZYg
         4TAA==
X-Forwarded-Encrypted: i=1; AJvYcCUPcxXBi4gjHVvNrVqCkd1lKOTzRODgbrp0o2Q8G8KRBk6sIzC8Zk4J0dcCjqbc7csETXw9TmS1aNd+@vger.kernel.org, AJvYcCUuFDFhwObBIg3/LcKhklUda9ziXUPw0DB9QXxaHVegSTOq1ZkmYUSIVubg330FjtmuQzxS/Y4dpDfyKdqf@vger.kernel.org, AJvYcCXsxSZDE0HsHtwsZTprR7NwTOOeZH/AS2OZHw3eM+sqnhsJbvDS2MV9hclAj1LquzoTJFIdh15smYstmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRHGhWUDelP5lFq5wWU3CacJAU7AhwdgzpzsQf1ZULQVpVfNNo
	DiF1BiPwLeNHhM3mSbWBdzD7sG8tbe7ClY+fMu7olC9Xr9xtrjGaeDQK
X-Gm-Gg: ASbGncuGDIxJNJ3Y0MklPQqGfPLjei1h2OQZn7I2QeylolOkRmnPtKOA4PVcfK+EhI7
	KG3ABpfWnDTjJceojdOr2M8vyJ8oHPl0VH3aQypCFZuhCSGWyaWkn1j/6dePkt2iS3WTiVrHb4d
	kQTJ8X1KBzjtI830dKMc1K1NpeUUB2In7Tn7bFq0s3P7rtx5+fYwNS2VrR3ihBHwLDfgCRrv08U
	liZqkaslc656De1QmqlVuXl+3+GhxzAEwpyN7oUEuqWcU2mZtX1ONni0c+20g36c7C5UOBvIuQt
	kNmQujs01ckJHsHGdpLIio/j6KQJgXhrHBmc81Ugab09tn7HsJDKmiKGUUMp8WzkWFNnk1MQ0+n
	/VBmZHN1CAj3R6ZDYqCtKgd3p1+srvdHaMRA=
X-Google-Smtp-Source: AGHT+IFzz7pc5wk5uj/Vf6ChAPu/I9C+4m2I7UOzrY/KOAIRiI890eR3XGmgZ+/8iVZZm+uqUyK+nA==
X-Received: by 2002:adf:b650:0:b0:3b6:136d:55de with SMTP id ffacd0b85a97d-3b6136d55efmr5039614f8f.7.1752852332639;
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
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
Subject: [PATCH v7 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:45 +0300
Message-ID: <20250718152500.2656391-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f5..758c0223977d4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.1


