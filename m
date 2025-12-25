Return-Path: <linux-gpio+bounces-29890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80444CDDAE5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D05B63002950
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E1D23D7FC;
	Thu, 25 Dec 2025 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb+uaqns"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5164F31AA90;
	Thu, 25 Dec 2025 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658988; cv=none; b=f5l94G1DIHSLUnWPW1jtrhuFwmCTTbuHXKL2Dq8og20HhAX8nTzvBG4jRgxR/Rr/ZU2XeMqtu3zGiTPvPK16KU3a3UkXhWMCjKfBumjvm7jwzyZdz0HujjWwedrQ77CTmmO4ejjdpsFOTMHp/U5X6l10ky66egimOMasy82dEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658988; c=relaxed/simple;
	bh=Wnej8lp3sfTvoHmjM9oQ6EDAn3bLLsAcYX0vOVkdUxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMJPR1G+3XNQfis8y4fjkC91fF3F06pLuuGfMbcDBhgGg5K7JUPs/mw1o8CiAlbUONfmGUCdcU4KXiJG5pwIISXC56z/IOVDu9NwCNu2o5X8aeQBImNUqZ/IX587W0cVQMO1PWP20hUcsVwOuOI0yHvxJ+fSjvdElTOAa0uWUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb+uaqns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018FDC4CEF1;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=Wnej8lp3sfTvoHmjM9oQ6EDAn3bLLsAcYX0vOVkdUxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vb+uaqnsr6r6Zd5qTv3gI+ZXKEqtL/T9SFOPcODTMtlPjoTvhKfaMrp/8eoA4pvif
	 Ln0qXh3V1t9rof7jqhZ7MK8DLg20Gku6GdeGlNb4Mj+cfRzEqpYnvWxxJwNxLJmCPw
	 Xm08rjFFXcd8j5Es3JHYMC5PI403BkbvL+FfNKjcMHlYHBKGcYNVzO+fnfNitcAvn7
	 J00ahNSy4goKsohUZSR0zTRPPow00qYJCVYpH8W04vviDPnR1L45jjGNOT6PfI40iI
	 JUZl8v7te/PouRKN47jnfQDa9YnQmUnP2qUDX8IhE5TYpWCksuQJE51gJZhFC6O8YL
	 iQzY8Ga3X9Rjw==
Received: by wens.tw (Postfix, from userid 1000)
	id 54BFC5FA9D; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
Date: Thu, 25 Dec 2025 18:36:12 +0800
Message-ID: <20251225103616.3203473-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner video engine sits behind the MBUS that is represented as
an interconnect.

Make sure that the interconnect properties are valid in the binding.

Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..01f2afa023f0 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -63,6 +63,16 @@ properties:
       CMA pool to use for buffers allocation instead of the default
       CMA pool.
 
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
 required:
   - compatible
   - reg
-- 
2.47.3


