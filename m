Return-Path: <linux-gpio+bounces-29374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E458CAD622
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4194D3049B28
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2223191D1;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1Mnlhrs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0132314D0E;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203196; cv=none; b=pOb8RymS4wLuabvH8BS59pQNgnBbLn47jBDXj7ZpXF1qqwVDPbh2K4EzAWWv37Akk2Yfwf91eTKAyua+0R9BumFW9BQ41z/CiECNUvg6YzLlRep7/WYuSZu9zEW4c7ze/dAZLetcxjxHdEwqfmQ5oPNGViydurkLuJOnrAR6QPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203196; c=relaxed/simple;
	bh=Am/khNzFmbgT629IxAY0ml2lpox8zaAiwi0KWwTsHkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdpaQql1ELLqeyHgTSGdFBo81iUctgLhIxbD5d4aDRviNX1ZU5e1rFlM9rM+mJKuQrOKL4hPxYUCXqSNPlb/M1dss0ny4ROE5G0xSucynlDluzognwrrgX/+9CChemygwilrcDKmVaRWdAi2wUxUrkSMoIWAkSxUe8NQFbThfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1Mnlhrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A655C2BC87;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203196;
	bh=Am/khNzFmbgT629IxAY0ml2lpox8zaAiwi0KWwTsHkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1Mnlhrsgr3biXV6buQ1VRnVtO6fAXMtkgR6Hz1zyGIFwYn76YI43nVpMVoWtY8hl
	 3mcDjO9UxLX68xFSLBUtVNRv3NIPlVRASmJks6v5h/DNv0FTy6C189Vpr8sP8X74y7
	 qN4/MNOGx2sgmGM6C6G+xCdefJGVFoR+rKcrq9dW5NkfuZiDBbw6Cs6/DMddFBxHBo
	 X1Yr8Fqf5F0P7hkmQAk9mmVz9SYGJCw0W9YxFG36emelOxT2YxcMoh5tCl2JDhtBRd
	 CeRGycvGJXUaaA/2l7HZgaIbQxAsizpEFnVkzZwcgxdPvhCuQdCDbbCQInTjGsBSJ8
	 B2pXklYztURhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507B2D3B7E7;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:12:58 +0200
Subject: [PATCH RESEND v8 06/21] dt-bindings: media: i2c: max96712: use
 pattern properties for ports
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-gmsl2-3_serdes-v8-6-7b8d457e2e04@analog.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
In-Reply-To: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 mitrutzceclan@gmail.com, Cosmin Tanislav <demonsingur@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=2057;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=BN4PxWBc+qnAVXXP78CzMmAkFEUuPk67F1kU46dZB5Y=;
 b=zIg1Kr6oIeo4bZturV+2fmgR6i1Gg693NLSy5nzlBwQdV7qWt5gmjaz2y9P/pbVg9zEFVWvEj
 aN4gYQaB0qwDGFG6mcjzs4fGyJwRwJlNUKCZ3lAnuw6cK8w0cs4khYX
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



