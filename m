Return-Path: <linux-gpio+bounces-21734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE18ADE7C8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111FB189DF71
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE88E293B44;
	Wed, 18 Jun 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ0qCJlx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72B28C029;
	Wed, 18 Jun 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240786; cv=none; b=QUDOMccohHTX7UX5a+SXGReoUbN/Tjcwj6KvPXxDcprsluHmAmjAH43d0CoXf9758hH5T53VSqGVfJv4c/VVhFKR7vVBY5bw/0bBnUU2ujyt57LBT/SqIrfo9wQpNCbTR3wgjzf5FS+AAKFjWvjmJizgo5UCeTe+httpQ2/ErVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240786; c=relaxed/simple;
	bh=opcAlOUBAEVyM/40uDqWPudv7Do8qaT/jl9kHIxioKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKLix9zdbqxEi8BlhNDJNOKxp0QQW83mNJDoN5i0Xk0+S2seBSSjPQ6lzDtOqFTBOloSfqTLnL9OYTAAte/ycB8DdDf6Bx3mfWs7GAV3ZsjoSvJS0dfJ9MTQ3EqwvEcphUeKdjW376eifEAz7Qail76ExC/upAC+1OcbnOM2w0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ0qCJlx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so13693460a12.3;
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240783; x=1750845583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=hJ0qCJlxO1mxKGoVTbEotIuhvy5d370X0nhymScQIJ2drAu3ba+v/R8HtQ2Te1AJrU
         0eUfI7NhymmVvnDgUbo8RLg80uSAjMOvh2wK1t9LPYhrXMGamyspiZ2Yf6RGZ2Mj8E13
         56NK2ARMDi5N/g+JpXny9Z7av8r70pvFKZqCGvovGRV0llHFAuovUu1xDN3SS8iGOXq6
         Ps29IqrCRkXMQY8NEXr9/Zhi13gox/Kgf3219c18K9j7ArfRjlN56UbU9IHloeNHV/nw
         Y0pLGegrFA4gVUoxuGlspG6XRlkR0nDa2uzrz3Dkyy0yxvCKKNqIyeSqxXQ8l2oJ0j0u
         alwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240783; x=1750845583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=dzTpPASsGj2Xj5DP9zxJofV3kOS+RSlMQoEafYNboyos5Z5vV100lb4XF2xGj1eFBc
         XkM4wBi6gKR5h5ph1HWTdN6QaFlkOC8e8auCob+857XsGc+3CHS3DMeL4dBEm7GwC4F0
         mTXGJ8fWeL2HFYrkfvWRxcGO0mNZTa1sWlzh0pS9x1VtsIRCDxCTS0QSYg6M3VZlfgyn
         jo3aIVYbEk7TK6iE0iRa3TwzblFIaZpxcsllHX5x7H3+WJM52EUsCZRXyj8/I4Mnk+R0
         xjgUjlWqN9j/Ap4kI2ZI4YVv1rpTYrIuwPAMd3cjLuFKQZwMfx37BHm7WofcU00EfM3y
         BjlA==
X-Forwarded-Encrypted: i=1; AJvYcCV+hl80dj6T2bS40mSMM4OyqS51nq59MpYQWoF8ksuiJCL/pd0afaRA6eNtVjUBz199BoYeWWHg/371Hw==@vger.kernel.org, AJvYcCVk/CZy8I1gQZpNsPDWaHc2Tj3DtppyEa4nfjxVwqGHNwwK0KFPfSs22SmC9FQD2/BqFJt69p+qm3da@vger.kernel.org, AJvYcCXN+psmK8nO6/8UaMjMEEPyJTP4me5YYPqN1abVPQUcRMLj9XDpWrhgBSi3+8+uocmYQyduKjz06PMQ3/S+@vger.kernel.org
X-Gm-Message-State: AOJu0YwX45v1P3RGHnzCD6gDF6W/MCEkCjEJvPlez2PkE1M9BjCWanVa
	a52aSMrOr3olRf/tiWEN80PKhhAkwan3AZvF5rmRmftp2B2d/ocXiO9M
X-Gm-Gg: ASbGnctZlpoqd8MCzzqAKSrnBMt01+D8jzvw90HYsJ+PHlPOOaGgGB7fHNCmI9qtvuG
	Ayl5xEE5e+ud/nYQbscmfH2iM/5/NFQ7DYcl8qvI/I7eLKU7gpIgCPCAvJOPLd8KDJjPx2VE9H4
	W73OZ41s07rHxAJpw/ofDM9zRXTkUXIoAhpjVZ0BNHDztD2SQq2zu60wKHzW8ep9XvNAw5r+lWp
	EcnG8KN62D6UKbT7/EU93rhacsFOH0tN3BtRg+5D0yOfGjYZA8oqSqkZyc5VME5Ctr162zX8X9L
	qbPzAzXhzJCdSL41GFKhLF8b7vTsiNsx/KXHaTSM6AEQoEFTb4LnHl9oQKXpvsKWJ+O614K5Ado
	=
X-Google-Smtp-Source: AGHT+IFo2mAi+jKg9HfLCZ/YVHV7ZAmm6wYfItt+pqPS6cQT+aJd6Xb6iGd5GAERxrnxVqQQtRUrdg==
X-Received: by 2002:a05:6402:42d4:b0:608:6754:ec67 with SMTP id 4fb4d7f45d1cf-608d0a0495dmr15074876a12.30.1750240782842;
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
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
Subject: [PATCH v4 08/19] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 18 Jun 2025 12:58:44 +0300
Message-ID: <20250618095858.2145209-9-demonsingur@gmail.com>
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
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
2.49.0


