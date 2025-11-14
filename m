Return-Path: <linux-gpio+bounces-28500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3262C5DD7B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2879A4F7FAD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0804329362;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+2tKgmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581193271FE;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131910; cv=none; b=P7eHkULAogbEn5oxtxM6fud7elHPOTfIdF7p7SFoVhA3MhS2aDVwNNxG7/QpvUC/QIOLAC8W25JJvCtH2xYXlpmge/OhxIW8N44xja6DibiogNJiYOwTnlLIxuEvsVMzOSSRRpc+IFH5GP+pJ+O+RwAePZPk91csNSzXj/R63VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131910; c=relaxed/simple;
	bh=mpKOJ7Al3H1RnU+ayGUbFEZ/kLo8EcOQlkvTb53y074=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oR9ZxcIHztLWSvZvxQd/RzWhjjtKffeP7yE0AAEkDUDqWK6iOkP/Wi6Qm2jp9IeCyMb2i1I56dWnwoG8WiHK2coOfxGSYhvzQK3sWu/J61Z8vaBBvR1ffQL6BsqC7EdB7SAErmqCLDp19gqNq1gqpCJwlxfXWN0Pa3x8iMQF7sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+2tKgmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB4DEC19422;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131910;
	bh=mpKOJ7Al3H1RnU+ayGUbFEZ/kLo8EcOQlkvTb53y074=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f+2tKgmJZEqysu1CxD/guJp42/Di4uUFkY5R+gLm/c80hbEnNt88xDuEK7pOckjmm
	 0N4pLk1Ey8yHvznqj4E/6uRo37I6dJiR4FjylfZ5Hq+Vv5ywWUYXsybHtgWCbM+h/n
	 0GQjcPM9Np9Vc4F1DqqifhDEdfsTj0WkqBCdw8vGAzD1+JwZAY8+o9D9Zf40nxDDS5
	 QG+pD3pNKxNSUYgO8sq3RUYiagA8/XIOr+BTVwLyKDuDLMwEq4nxQ4+afi3Hdg4S6u
	 /JYxx9HUXZngr3N8c1mcomX2cOcbdoL7saMoqJlnrWG+BTMg1D5EW/q/JIxGRV/CKm
	 f/8ytEhIZGJEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BB9CE7B15;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:47 +0200
Subject: [PATCH v8 07/21] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-7-47499d907990@analog.com>
References: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
In-Reply-To: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=1871;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=C6HHjz83hpPiwogoD3BmCyMvwLt56EchxNo5MJM2dpQ=;
 b=yuyLRctv+FVfzOK9EbCp8m9+LY47fDCJKrlSboNyWq7n+WvgOaQKLB8Bf5+rdQEbQcvGoYKnA
 5I/+wRIxewfB66FI9RhcR4W7Tw3A6I7y1919Al9h1Ac0UAqEj+iUB/r
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

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
 .../bindings/media/i2c/maxim,max96712.yaml         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 583bbd60157c..abacc3c874a9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -36,6 +36,30 @@ properties:
 
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
 
@@ -78,6 +102,13 @@ required:
 
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
2.43.0



