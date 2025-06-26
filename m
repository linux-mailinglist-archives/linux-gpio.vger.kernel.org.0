Return-Path: <linux-gpio+bounces-22250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0333AE97D2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 10:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BAE15A42B5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 08:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743782609DC;
	Thu, 26 Jun 2025 08:13:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2F25FA03;
	Thu, 26 Jun 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925617; cv=none; b=PAfXndeA+I5R7bfFbuBcvgNtYr7r3MJZZQXRipFhHtucX+BJNwx2UWLQQlk3N9m85YMoO4efeGu5mYLPgeV4NjiV57AsDQ4wGpajRovaPkDYS0kLz96eyTowTcwHujtIDql4iFsRehQNXxuHFiHsfFVOTO2msJxplIerKy2oeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925617; c=relaxed/simple;
	bh=9R+INZ8e/SyHHgxDz0lyFa2OoSq9ExLuFg+fW4krK0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1ZibP1bkdq0bzFn7AtSq+cRJ0tosIU4a09aKA/laf71G5lNn+3aWovXI8Hu2QgzZ27YZBC9fEH0dQqLLKVyZCo6msZBmjC6KE8v55h6RAYhiMvKzPk6EFgyepDAo++f15VES1+ySErEyjpsvwxmkZolmzYULCvwcLqqbDlXLSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C7EA11F0004B;
	Thu, 26 Jun 2025 08:13:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 31515AC7F89; Thu, 26 Jun 2025 08:13:32 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 3ACB4AC7F7B;
	Thu, 26 Jun 2025 08:09:41 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
Date: Thu, 26 Jun 2025 10:09:21 +0200
Message-ID: <20250626080923.632789-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
compatible with the A64 one. It features the same syscon registers for
control of the top-level integration of the unit.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7b6a2fde8175..0ae415f1e69c 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
+              - allwinner,sun50i-a100-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
               - allwinner,sun55i-a523-emac0
-- 
2.49.0


