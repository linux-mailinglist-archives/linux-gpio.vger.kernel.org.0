Return-Path: <linux-gpio+bounces-21735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A99EAADE7CB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84C7917B34D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F56A29C35A;
	Wed, 18 Jun 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB2DOqtw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A97E28FAB9;
	Wed, 18 Jun 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240789; cv=none; b=AnZotcvwtqNMHTX8W7V/yr2UoMjQ/0YT9yA1Bar90vbIKYlQawYCqNuk64eIOboX7FFXRDj34Y5olDFTDr/9rVP/JjlRzHpI1LjTCGrDmJ39gnhG1PC4AIdKZBwnrwDkY2tfmLFM7QKp0fnWqtWnS2FowlSwaCewRWzvZmJjAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240789; c=relaxed/simple;
	bh=lYKegvXEPP5UHua70hCOeKWQf4WN41EUv+Ge+hvOKNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbuDtGCR8sKYsMKyx+1jkYzYajFP7j9Sh28czjYeyK3KPmoxCHvW49iMcXEardgRev02xEB3iWHb8e4q5176k5dS3C1WKNu9Z6vuS2nyglvVOPCZphswREkZs351FlUNdzinqTWpA13hi0BLzUf3D6qvzqRYjhAdUJz52O1olxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB2DOqtw; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso12218012a12.0;
        Wed, 18 Jun 2025 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240785; x=1750845585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=jB2DOqtw0kUpSgEIGmW9wbrN8R0oLDAq1snt/czKXeDK0qlzStsq0PDYuccGTttGD6
         u2+CZ165l+zdRXwa9vrEBZJRu+l8h5RpNXW6bWOv7YvP3FCS9poRXoTes7Hvbsu75lER
         rrW8ILKQgJNJN1CpVnFbtV0GrZJOoxtDDAFtkXEfPKiZg85q0SLuq/C0HQSEljLsooVK
         1adBWu9TE4hSY8gNvCSPiIZl/XUcjVFDWQ4oekB0eMw1JlXDlzzlkvwtrWww741tY2SM
         sOl7OnaqeNRcb5ZPnLSV4zMPMzXM1OWuJlqGkA3hWV3wpJreMJ0zCZ9aumDeAzSeonw6
         nfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240785; x=1750845585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=wH9YTkGo36DhbJqYJ6AhlZn2AxM/xsAg/99pEf3v4zUJ4anpkyxtgFr7v4zRj3TH9q
         WxumUrszsTVzW4t59hqfKLR/t39MZt6irqI3cCxbCHpMvcM6lVlDTfkCCjSxgmpIrtQk
         dEu3UkrFdghBkF76/UYhAA+K/OQEUYahfzj5QIuoxSxkMrO2XWwS32mOuY+PWYwj/dj9
         1An9MxCHVdY7GQsjqykhDpaHVymnIlxu6zHApH+mtAm+0He4kzpUyVv7lP5xpdb75oXJ
         Oh9Pr8vjqRgiZfF1Dvfvz08IUJX8wWEU31oDCwkXnYPfkn4FQ3TETQCJ+y+BpFA+fwhB
         uHpg==
X-Forwarded-Encrypted: i=1; AJvYcCVC5E/CHXVRLZ/GvZvd53oNqML5IkelsPLObjLzfjH1q4BRFKiWQGiegyr5Ur6ZLBzcNGeUFMQlgaVo3w==@vger.kernel.org, AJvYcCWo3HmMgfQICul+mM0dRMOCpLnF4qN4TPBZXVyNyJF827GeLg86sASwSh2YevvrRh+rlMMeX+HDpta+@vger.kernel.org, AJvYcCXRqLCVgVRKQ2iCwfSj/ncc1QSUlqOr7zqnVBeVxjiAhMsBJTmVEkUj5vNNjzXbMO4vdsv26VfkwTOMW7Rq@vger.kernel.org
X-Gm-Message-State: AOJu0YywcNvXjj9xoV+bgWSABKHBhtxcbbMwrUwLLmK2SaY/07fglQab
	iOvtStcCzxs9g5AqVKtAO+fVkp8Aa4YT0+A8JZlQuCoQ9OL33HQNvjjN
X-Gm-Gg: ASbGncuV0an4xi8fAAw0RVKE75vHk7NhmKjUOGp6lHF7wmh7KJ6jlKGEduR++35Z94l
	wWwAk8fbBqdxXYLY5nmx3C1XBsUCtpBINP3VzGT7dXB4A5mdwes4S/z7E3xqH2G9R2u40IPUJRm
	qHrxuSXLHeHidDZoUa3PWfbbwTTp+hlL28+LsRuHzjiuB2cCCMOYM8Ob/y/LbUaNcnW4u8PkxBO
	ZG01sVY/fYxPh3iCedWzjrf10YbJQjYXW3iXXmSCU89p6EUqUGXL2s0c71UoHpc/F1j7uVcCqi1
	bs2uMHrXvvAZUrO8zVAaCSp/Q5tgaa70xDVE4ooCRjBUCgeGPY8hJtcuAg+5i5zx3vvFVjj8A0c
	=
X-Google-Smtp-Source: AGHT+IGcJ/3EJ96nlb0xfxLZsuz0PFAwjNNvmaF1G6tPL9/xfE5cjh445Nq7XLGFdsd0S8fSuFLJzw==
X-Received: by 2002:a05:6402:4402:b0:609:d685:e831 with SMTP id 4fb4d7f45d1cf-609d685eecemr570244a12.12.1750240784498;
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
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
Subject: [PATCH v4 09/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:45 +0300
Message-ID: <20250618095858.2145209-10-demonsingur@gmail.com>
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
index f712d7cfc35f..758c0223977d 100644
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
2.49.0


