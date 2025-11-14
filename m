Return-Path: <linux-gpio+bounces-28501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD7C5DC90
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDDA24ED837
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89C9329386;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XX0Sc/sW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835A327208;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131910; cv=none; b=R16eTx7Jplh4N3SHXT+kEpsNCb51NoImg92n8uKBR97S3qojQnSGSItd2nYpT+tGLgliakPqW3vdPz+XgAzypAbItIExFM0dess6XeSNzER6PTCgSLrV2EEgWR5ELDyiM2h2OpuVcnjWT5RPJdHa59HzWSTgHbIIrRxWI+jjstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131910; c=relaxed/simple;
	bh=t0Ap0jixaz5Oc/q13SwOSzs4iKSNVbkcsRuy+4E9yJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddPtqF51AXMEwqOSN9SVrC8rAhEcSY/F2YuMUl65zqJpqjZTec+WxXk/COtDHsRyh2szQd7sMXV+ySdfG+kN0QaafUwJnA04Yd3v7BG98vz9cjnNFBe63QW5sFZFvwTNCpKZCBdAlWj3Z0Yabuns5sWBcbsps5nDXfXpsQWGOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XX0Sc/sW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C96C2BC86;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131910;
	bh=t0Ap0jixaz5Oc/q13SwOSzs4iKSNVbkcsRuy+4E9yJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XX0Sc/sWZ1Plrh6Wk4OB6W23SgIER7DmT9aKOJ59Zp/lNLWm9ZpQBZaXsGi8CMItH
	 XUVaf5Q/xz0e5Cthz2/rHm/TRUYAWirl9PovlotrnAinkAjX1zQTMcbCee6+YXhEWy
	 +0hcjgQbZ6bVWvvMCRcR+lFlIIMfRA5OGmXwsbw9ksb4c4bd9HoWIh03FmMOWS818n
	 ZNAwtHHIin44LZS3/MuYNmmGU6ndriPa7vvf8VmJ6e9eDN8mnPUijmOHH0L9RvNWqK
	 zAkeLM+bYUUVGyDLXyTWCN3pmS4ERiGiMs7OFObrzx2+kp/TZUFOW1JRE4iu5w+grD
	 U+dJ9O7snZ3tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A6BCE7B1B;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:48 +0200
Subject: [PATCH v8 08/21] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-gmsl2-3_serdes-v8-8-47499d907990@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=998;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=boTi/XzSOItLOWBd28vSUq5ZU/noM6hf3IRds/sdngY=;
 b=a4Pr6C+okQFivRPzPG+mBSkjJvZ7U7ZQ6+IgH7C9hzmFj2L5L6ronwTC12So3qfJHrsJgU+l8
 YUuUNv+bobEDFE3MVOo9qzo/DZzX3XtUqNydj/1TpjA7usDECaFi4oJ
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index abacc3c874a9..d2dd72f2e924 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -95,6 +95,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg

-- 
2.43.0



