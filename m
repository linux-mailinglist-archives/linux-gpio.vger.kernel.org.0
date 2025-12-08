Return-Path: <linux-gpio+bounces-29377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07022CAD63D
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DEAC3059589
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DEF31984C;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvK5b/2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC43164B1;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203197; cv=none; b=WD0nY8r45ij+l7sRMFD69683g4SWu4rB1CqvMOX5pdx4Hy4M1+9HWBHGL+6PUI1rUyasWZipq6pP0TOxVpahPAJ+7EWAm1IKuuh4fWJurOn0Aux1vLeriTOOM0vKC8nk4XVNkyqj8O017jKdFGzs4BnWGUrQL7Jb7sdBhvnF8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203197; c=relaxed/simple;
	bh=wsRvz+YRurNCCKuGsXgsQrkeIO8Xsi3NhW7uOkcTy7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oe+OrkR02Ejtwqq2dQFNKw2ZQKh5M5sMI7LWPF05osoi9ewYxbK5iyMF8UJ2XWPqTn0SEPs8/VtgyqzFO/2IV0A1D+feXpXXZg6R89rBO0lz7xHWnEnqSeIoSMOxvjI0JXGHtWs2UN/bgQ4QkfFr9q4z8tPTDXx3YL4MmS81nVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvK5b/2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BED8C2BCB3;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203196;
	bh=wsRvz+YRurNCCKuGsXgsQrkeIO8Xsi3NhW7uOkcTy7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fvK5b/2fkfi+WWM2UQrwn01uvmPe3MRSiiOfUw2IherzyEzC+3yF69svVJQsFwEdG
	 wsKmhyRBG/YVbYD+7kvuA8UO2cSyXTNxKbVHGI8oBaDiA7uigXNBoPYm6LxG4f2eqm
	 /Y4jvEAseV5BxHpvFq6r6GWtRIy7vqtRGXXZrof0380fFPYiQagdGSnzjvuBmCPU+V
	 l7JcSdRAEjauBB+pIQvoGNRw8TUMYZUcUHQUuO/6C4DLeZz6DGkTHl+yue2tfSefa7
	 NL1bwVpnI2D2bHiEdrkiNjoXcDDDVygYQQGpZEPm7pFV9Ko2JXsMibbHLDNL1VkLMw
	 8c7CwMMu9S//w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E61D3B7E2;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:13:01 +0200
Subject: [PATCH RESEND v8 09/21] dt-bindings: media: i2c: max96712: add
 support for MAX96724F/R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-gmsl2-3_serdes-v8-9-7b8d457e2e04@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=1289;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=f6rEL0SIxa/wkxjC6aaT9pj6PPQpx2o/eeml3xjDmWg=;
 b=TKDfHrkvOZ1dCFQNPoYO2equAS4Gnan7e62HkFbTV4tQ+ttv1S1HUwPDex9wJBUWENMzt3Kh8
 ZlIivZsVXMsBRS6GYDSq+hrktmwC0MmOVdvNtDQMie4e2Sy+kzsoAp4
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index d2dd72f2e924..161d40acdd28 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -23,12 +23,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address

-- 
2.43.0



