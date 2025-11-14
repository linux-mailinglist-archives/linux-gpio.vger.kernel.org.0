Return-Path: <linux-gpio+bounces-28507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08705C5DE23
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1946B36160B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203D9329E65;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYl+ql9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F76328608;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131910; cv=none; b=jh9Gn1zQB88Q6KW/p1FyKjPZOUbw2AT/FJbnR6QmLRn9qDtPHw26zV1fCrByHlAiJ2n8AJqv/TlQhJPgIHIOsAW3Y/ByJ6214ONc2E8Smea4OBJc5fMPIiL4DIs5dlhwMPLiYsX0hwGI37W8sxlzmglUCjrCVmk/8jNc4dn0ZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131910; c=relaxed/simple;
	bh=kbn6LBAtr2+71zpmoOf2dfElZOae2nJU5UZayCFty08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHDS1NPMprCpIsJ7XPauaenfcEL+ZaSlhYjxBFLmBdrM73PoZUjU/+y5UP3GCI8pOwouu3VCNEqfC6cYAXrAQCvwBwXavtyWA3kasNlsf6JD/99GBPZafhDSlopP+w2zi9W2W3fSLtveqFQ5PEQHvUBClh4oOY3Pdq6FAUxIDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYl+ql9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29122C113D0;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131910;
	bh=kbn6LBAtr2+71zpmoOf2dfElZOae2nJU5UZayCFty08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gYl+ql9c3xPjV2MBTg63bvAwn0lbBxolowgUsXjc7xNakfa0QUESBwexnxdN+lILZ
	 BM1Ch3fxgBvR9fTmsefjgn+LauBfljrJ8QzIZLsagBJIu0s1RJbgnIOITg634a9VMp
	 etEC1uv9sms+clX1w7Miu5jFrM2oGHhWqX7jQDHkFHH7FhA36h+KE/dKBifUHARWr2
	 sRX/yGQdehCaDfK2V9X7gZB1ga0VrFntUxh7ihASo992W0ETQtu3bJAO+nPW31MIc2
	 0evHzAR9k1dNA9RiUunGETfS6P4DmUa+Jl+7wrwnYVe33rsrozkbdw+mIzw3bas83d
	 +1ZHx3abfJSjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230A3CE7B1B;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:50 +0200
Subject: [PATCH v8 10/21] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-10-47499d907990@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=1267;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=lVz6+X1QMh5qwj5y+f94G2y4KgO9Afn8xdj54BvH/Us=;
 b=mtTLeOrkx0Fxu2fjSj9eVx5OhnFyLVALPa8VYWTm7rafE0KONTJJ6k2IMoOCWfmiyf7FTxkOo
 SGVu69Cn4ocDy2XFqbs8LvtgAi5k9urc9M/cb6QJT5ipeScBhONRHjB
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..ec6a91c4a51c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -22,7 +22,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -31,6 +33,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:

-- 
2.43.0



