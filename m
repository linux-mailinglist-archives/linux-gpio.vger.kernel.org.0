Return-Path: <linux-gpio+bounces-29375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C0CAD629
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4DC304A7C6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8B73191D6;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMsships"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E84314D10;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203196; cv=none; b=VC2U8i6AiDSFEfdK7qvZKwyaJbEBdT4PFnsjj7GxCv7QNlAMPUFlG4fAHM8+cUjUgSnvwUDJdUqGaYvqdhevYBt2MSKuJBYkWAJ5iZR7n9ptrVi5JtWahD5UfNKXnJynYW28cldMMQLbmweg91XVmgXgdBXek1DBMdlNfSRJdIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203196; c=relaxed/simple;
	bh=yAVugGcsfjwGdtykUl9LoSgzCBF9KlU+EbkE3wTX/WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGgIzV7fIBEr3NIFVYKrNyTT1YZVv1jypu4dFRKUsf+Z3xD2X7cq4JPZ5y+LGsRGKvXed1KWLkGKKvUa944+RNKNd3etqM8bjn9detul+1333HY9B/rahK5mZAz1s2WJyvnbqK3INMBmUaBtFyGPQdDgMoC1z6b6p6vJnwBkIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMsships; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47322C2BCAF;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203196;
	bh=yAVugGcsfjwGdtykUl9LoSgzCBF9KlU+EbkE3wTX/WA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dMsshipsHG5VAL1h7A8KsA5ySAICCOBQjcKQraf/2MIJw941QK7UKQnwAf7tJe48n
	 BwWze9tP2dulT/eAsiT6Pj2uynHPpzZmfSNVSh9OIaIHkbNOXCn7+Qy70Y5nW8jufk
	 e2jGhh+5nhmSMnqg56FspHSMOlIScgRrcDc6xTdrIKYhVuUJLWepc5My7Xhiqim6hU
	 QaGRdvhZOXvZglKMf2Y5qHO/PNIso94r8DeS5w9nlebOCTXBaJ5bqTBvBJHlRIKdhN
	 epfHJftDnMdXtIPSP25YmJvwWRVbxqNwaIY62PKYZFYErLEa2OKd147MesMon3SCIy
	 I1P/mSbCHTtvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF79D3B7EF;
	Mon,  8 Dec 2025 14:13:16 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:12:57 +0200
Subject: [PATCH RESEND v8 05/21] dt-bindings: media: i2c: max96717: add
 support for MAX96793
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-gmsl2-3_serdes-v8-5-7b8d457e2e04@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=1028;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=jUZv+5/QKIiTJOWAbg2eAz9JgIILhVbuUVVpM3GLO1U=;
 b=8Vj6QmolTo37GoQywg0yozsKwA5eBpIcswZHp2DdKCtBBkFD36npQmIml4OYfkEqkkD64dXp7
 XRSjg+FZfDaAJY0JboIRC+nwpuJ9MTb+X86P+XXOjdZ9N564znkddMk
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index bbb38b3de7df..0d53637a6991 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -29,6 +29,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -38,6 +40,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':

-- 
2.43.0



