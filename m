Return-Path: <linux-gpio+bounces-28502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B8C5DB06
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 15:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BDE5E24170
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D3232936D;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8kS2Km5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A7327209;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131910; cv=none; b=l3O9ULXdcm1GiVYT6eHOKjpdnbGBJPM3R8Nng/GxJhSE1dEf5wO8LfmQ7ENunJUcgExZdbCyFZciZDlVBIIR08cnMKO95HcSeKqZ3SYbg2OJ4YC45T5gdNqta46CZHGjzwH89Q535HcSaWB2xqeNhzwbYaY+A3wGRGmPAVr93j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131910; c=relaxed/simple;
	bh=Am/khNzFmbgT629IxAY0ml2lpox8zaAiwi0KWwTsHkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq3gae4NLRNKzXkxmyTQRFdvOOhJ4r8rjPMkpBVPUyM6N1Lu83plgDrOEhl5xN8enE/alAuGO3FjS4UedXgK/3xW/xrYgm+woMOLWnbXmv1mwQWLzm8VYdZ3TMe+EtD795Yp30sWY1ZmG0sD5WJQA3i3u2L3/OdZXEL3pIdROkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8kS2Km5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD549C4CEF1;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131909;
	bh=Am/khNzFmbgT629IxAY0ml2lpox8zaAiwi0KWwTsHkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n8kS2Km51vfPw5rrUA9RwoVCdDFidkcQXPVEHPU9+XNLxO9phQ+NmFuZiWKnZClWD
	 Wjxl734hDxJQNOLT1uGTYS4qdSfvB+q3zFQjXVDCh8sEj1mQR/C8qr/WW6Rio5uF55
	 +hB/pQFy/IkgCwL0JEBQ5pCD42Rh4aw//sdeaBeIvILXsksbpV86CMT3qBZl/U9hsk
	 ltGf7Wen0QWCDyGxDdXlwcXdvfRsTZy0of5AyclefUPvEPvG12lWRV7GT9IA79NwHC
	 RZuRTa/pry7GlsTtflUWGOivPXxejwMVu+RpN3utBikTFqHOYHBTaA1nuXTbWaQO0m
	 syHmzAp05IuwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74C0CE7B16;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:46 +0200
Subject: [PATCH v8 06/21] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-gmsl2-3_serdes-v8-6-47499d907990@analog.com>
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
 Cosmin Tanislav <demonsingur@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=2057;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=BN4PxWBc+qnAVXXP78CzMmAkFEUuPk67F1kU46dZB5Y=;
 b=DfE4EZWCXemw97XlO9cse/rgogOgdLa+dNTax4LMskMzbvuQ+N87lZ+Unwd5vGDnMEeHM3+yp
 F208sr5jQhwA4zqg+znHEIulCx1Rvd7Ry7E0qSmrgIucIncxFmIqyiI
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml         | 29 ++++++++--------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..583bbd60157c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -39,27 +39,15 @@ properties:
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
@@ -77,8 +65,11 @@ properties:
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
2.43.0



