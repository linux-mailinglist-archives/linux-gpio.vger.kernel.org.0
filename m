Return-Path: <linux-gpio+bounces-29367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF7CAD5FE
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B693E304EB73
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CB631618B;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTUXE2/E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7DD5695;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203196; cv=none; b=YAWLO8fsw5TWb6cmWElm1o32rsenkGvM+GEXOBGMcqAjIVsy4Wzz0FVFq+Vr10LYFNdhKY0FxM7PyKWDChtHiJxWZyFUnChS6KUROHPjsOd2Tr9JwDZVYLg7owAd3orLFGXJgBeMl5vXv/4jKLnt7TZVR+u6Ade/9xrosrPNtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203196; c=relaxed/simple;
	bh=ACDiG4MjEURSu33gwf8f5cO3UhpJ7QO4aDxGwmz1jd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INnpoW3Wa3nYqUgD1xDp3QhebrNGe5tSMQ7eFD6buC2hG/P1Elsv3+jEqxtbVVoVyJD6FY8M0q1d8PJ0XRlZeaxdIwt9QsZ0EwrcytOpRsWtspBpasL3Ih7PzjzLtmRjfCILOKkJmqs5J2O6+yAEJ5PGPp0ubidq1/YjN5J9X8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTUXE2/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36BF9C2BC86;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203196;
	bh=ACDiG4MjEURSu33gwf8f5cO3UhpJ7QO4aDxGwmz1jd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kTUXE2/EDcifZgACoKCukTExkJmFyiFABu6FCVx66aKWYQ0Ecd7YBXYGs3a+AWKZR
	 EirWHFjBqpwzvqYBVX/ihhVvUVtZSYEFfp22KWlen/rXxJDnS3VmjCcquetZTTnJ+v
	 0fLErzrmgGcwb5sU2iffZkCeuXn47fRCPKi2vszEuZhhc47PJjDGLlXxv0qFLq8GPA
	 6KIFEbSTLTB6CjBAgfUwfYVeti/Ch1iHeeaWHomn0BIoGMDomba54bDVr/2IQPtiSH
	 /21Uz08VqRGW49LZcdAB04hLxtHHPjkVjnWvjkD8RVE/wmpcZjeBhAQEi1vU6zCeXL
	 1kalAvoR4sU1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C770D3B7E1;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:12:56 +0200
Subject: [PATCH RESEND v8 04/21] dt-bindings: media: i2c: max96717: add
 support for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-gmsl2-3_serdes-v8-4-7b8d457e2e04@analog.com>
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
 mitrutzceclan@gmail.com, Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=1215;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=qFHvQ07hZLvZ0onPRIESlf90XBZdvoAf8MtlEW0qNXM=;
 b=tCNr4VKHdjcFG2nrMkpgCZO/R2b5mAZXMsp+0y9K00GbwWsYMJMgVfTCG6Br2K1/+TjJFxYAq
 +/UBx/Df1QXCMVBavg602UoUb0ogSGrBLZ8cMtt/wcueMMogboIl+uW
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d507cad18edc..bbb38b3de7df 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,12 +24,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717

-- 
2.43.0



