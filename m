Return-Path: <linux-gpio+bounces-30686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB6D38E1D
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 12:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E004E302429D
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 11:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1C2335082;
	Sat, 17 Jan 2026 11:17:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45DF33507B;
	Sat, 17 Jan 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648660; cv=none; b=DJUkMwcnNmEDX0QTc0xfi4VNgXzJ1CLp8AZJwqZo6tcHXmNBELe6RjHuHveCJJ+Rg62uAwS6wcxGB+JQ5Jg+aiqxrchUiq8BtzabeRfejagU5vhFih2a8h63/Z5nW8DVWJmnw4m+R709FTf5Yqq/0P59buYgpNJpJd+v06GWPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648660; c=relaxed/simple;
	bh=XG7pFsnR1EluRR+EFdEVQzRXxWGFIGc/mPiruNMQ0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lgzGz11zHffsdgLc9cMFPd4qxCrJJUZi6flVMhjPxMaP3nVtBKY/xu87Mh7BsAb078BoMhxJr+/tGimv2R+ZJCln8kpZyNm2llqgITKyRsR1RPMPjYsDcopM7aXbFt5gqzU64mFUE1LQj7OHGM3yO2VzPZlqlW9TRkOGWNthX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 19:17:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 19:17:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Sat, 17 Jan 2026 19:17:11 +0800
Subject: [PATCH 4/5] dt-bindings: gpio: aspeed,sgpio: Support ast2700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=1334;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XG7pFsnR1EluRR+EFdEVQzRXxWGFIGc/mPiruNMQ0xs=;
 b=fBUpqWXZ3gZbvVmGZDnwQESir3BVUnInQZVNigV+6h1dREc3oa9lSK1yJ/gLlHqEIx3FesdjB
 wD22J7LklN4BMVLJoVCp4EMHEn3ZEOSfWnSTK3dZGETbOg7O5CMSz5d
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The AST2700 is the 7th generation SoC from Aspeed, featuring two SGPIO
master controllers: both with 256 serial inputs and outputs.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 1046f0331c09..974185e3478f 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -10,7 +10,8 @@ maintainers:
   - Andrew Jeffery <andrew@aj.id.au>
 
 description:
-  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
+  This SGPIO controller is for ASPEED AST2400, AST2500, AST2600 and AST2700 SoC,
+  AST2700 have two sgpio master both with 256 pins,
   AST2600 have two sgpio master one with 128 pins another one with 80 pins,
   AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
   GPIO pins can be programmed to support the following options
@@ -27,6 +28,7 @@ properties:
       - aspeed,ast2400-sgpio
       - aspeed,ast2500-sgpio
       - aspeed,ast2600-sgpiom
+      - aspeed,ast2700-sgpiom
 
   reg:
     maxItems: 1

-- 
2.34.1


