Return-Path: <linux-gpio+bounces-22621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18AAF58AD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66AA21892AE4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3CB288C1D;
	Wed,  2 Jul 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfAKDHMv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF3283FD8;
	Wed,  2 Jul 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462481; cv=none; b=IAejZGfP1D36RTR/XjtNgHCyovZ+RU8UrgHvUOc0Y3NT/XGE/aGl163h3TtaYm++gBX/shh+/8J6CbVVGVjTdJYY0BY76llHmeYMYH9ZmponxJLjgO5eOHHnWJyAHemYLGvqpl4V9CQAcufc1h9XiA5lLvkqar9gmXUIzZYCNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462481; c=relaxed/simple;
	bh=s/p9yqQHlTA4IMsyLZK+CDbjdmCKT8r4mjy1I7nafj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMAgMTkKvYJbhlMbzMnzsGPg+oeXcjRt9FMrMtJ/TkqgTeOBWtaJRn2P05L+OTSfbWElrgN4iXSAgamqJUiLuXBPtRmPQP33s2D6WE5MovJzR/VkVcI5o4xwsiS/9PTqX2h5aJNmZboxde35/go3XXP786mbDQ2Y1ib06x5LvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfAKDHMv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so5823722a12.0;
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462478; x=1752067278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=XfAKDHMv3K3Y++Pf+mkHB7++S8D6D5QI5q08OcAnHyR6JCck5HvxSb/qXZu5S9fjVZ
         dTc5kDpK+CqztBWELDhZJ5ZXr4kPACMjddBHz+uAwzyXIDmmS+XDINU4izHSRFVNEYb6
         NoizhnOJRbwk7pt4fs8BbqUuedhyXvIsPfvdfBVDp5umenGdI41kD4+VJQ9kVpWT08wE
         4IK/eY3Jh1JsP2EBohFYZXZjk3kDS4NxQAymQHHtV2Wjbzq3WHn/C/pSR8iW69BYlAwi
         ZoLZqrTwuJkwhVkvHfJDu6FYYZQo6e1I5BI9e/TqiJUVkrKVKYlgFhfc1rjRGQjU6pgK
         hE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462478; x=1752067278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=J56080Rq1mT8aUX0awS886De2WB6jARkQSjD4A6ZwcBxF9YpyQIj3eIriD6gg5itRG
         JeWHRQosMnyi0jR/Lj4TuPnU1i/mfVFaITOKAn2Dzy519FAMpmhqaMLS8EYyaCNgy5Lj
         xEraRGIF8Tx9CYMWSepOVoeaCyu+55FgsYbebmwCSlmUJvJDJNYCrKD1uEzeV0W77UIC
         a77scveLM20rFHk0nRxGyCoVrkFwdLyjeMq1Uw79dl+WF+IWCiUZ3+bzc8GpResVJS9B
         qR9xH10k0YWhT02vMLlOkXrd8B4yz9EsWq9QdupfE62mSg31mB3RUr/5615+PWUL9idb
         OoIA==
X-Forwarded-Encrypted: i=1; AJvYcCVUp8I7ZmTjr7hJiuFlc7e7w3pNxQUoKUz0+G6Sivsy+zMzgNi4jWqmMtJn+JjVKdOf8w/aJ0zMfpl7olIN@vger.kernel.org, AJvYcCXGz92ZAOwE/0gP1u8w2EOSTTmb3qlE908kalNd54Rq7EgboM9Xdm9oGgehrR1NSnwwxxVsTiDLMZSSpg==@vger.kernel.org, AJvYcCXwrzx91MsHCBFJRbwaB/W/K0jahgiPD0UmordpcSD643mTa5lPiDv7Rq6aXColYQsabRXaQGrxZDJB@vger.kernel.org
X-Gm-Message-State: AOJu0YygmK1WIwsLbs3T5aO6H068mmte8ggnTDQmZGQkaqJdmWrQmq25
	XiObtREfkUGIiwJUBzMRd2iCHtq20DZ3KUOxFfM3DeBYBm34NjDDk5GQ
X-Gm-Gg: ASbGncs7em3BlIjee6gSrWkIW0mXlJwJ2PIbak8c3D0H0jfpXqCXgDb9HIiLtYdo+XG
	48N6igO97abzxx0tcHU4xY5SVWRfGXF3m+5sKbwrN40040ZMbMK7Gel34RPXS//amwYgDegsnKR
	7zSylaKRW1KazWG6zCFP+SZmaaabx8LvS+oa2P7owWlUHenH56RCAh+vgKLdnVUrvcxv8SuwWFM
	qlHb41EyNsN+W+iD4zoFNHyiDkMIz+V6AK1uz5L1Sl0N6a4R1ZkPQ8nLK0uYF+0//Eu9/JqeCRV
	vBrInQ/mQXAOE6ymnocwkuKXyz1vLQmdXbLv6ECOZpZzVGpQ9P1QHz9nrwKSTu1rV0HqxRq1NMg
	=
X-Google-Smtp-Source: AGHT+IHvM+9PE3ELXwT9U1cnGnuZOCOmHJOManbPYkfa4Wv8dKS7DjN6hAjnrIVhNUqXBWZgB9WpNw==
X-Received: by 2002:a17:906:c141:b0:ae0:da61:71fc with SMTP id a640c23a62f3a-ae3c388298dmr285682166b.10.1751462477402;
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
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
Subject: [PATCH v5 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:29 +0300
Message-ID: <20250702132104.1537926-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
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
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.0


