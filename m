Return-Path: <linux-gpio+bounces-24692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8EB2E99D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFE867B94D2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7463A1F463B;
	Thu, 21 Aug 2025 00:45:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016D31E5B7B;
	Thu, 21 Aug 2025 00:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737158; cv=none; b=QVUd4jy83PejJOhPS+b2aD7yl9TDL0WR1O2bTSvOq7lXnJSyMpEHIcH0jNX6HFGUIFmL9wZw3+jY/JSHfRQAHw9FJnVVT5qZEgI9qt1kgytQjwZHdLhW2ktVZ4Stvgauk2eFNQY3JPZ6YoC0he1PXplBGpzEQFLbO5Lm/JBLCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737158; c=relaxed/simple;
	bh=uETZK+nsYWEoEWU2BSodkqANibnH1riV7rV6k93oGn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyM/YnWWjr/aZGgzb3kG2EeY9pZJuKkbiu5BfWCYZ24pJv9gax5q28/QfDTZsvxDeDMqKLZlK9kqagjw9j0KDfLvL4SMYsBGLDKEy09AcBGqJDvrVuC6rKseVifxpa3Wk/qnCeF0lFtxS6VhhcuLre4mC/4o8FbNK/a1qJ+OYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EA212FC;
	Wed, 20 Aug 2025 17:45:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A981A3F63F;
	Wed, 20 Aug 2025 17:45:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 7/9] dt-bindings: pinctrl: add compatible for Allwinner A733
Date: Thu, 21 Aug 2025 01:42:30 +0100
Message-ID: <20250821004232.8134-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 contains a pin controller similar to previous SoCs, although
with a change in the MMIO register frame layout.
This SoC uses the new style of DT binding, where the pinmux values for
each pin group are stored in the new "allwinner,pinmux" property in the
DT node.

Add the new compatible to the existing A523 binding, since they share a
lot of features, including the number of banks and clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index 154e03da8ce98..c04b04acf6e45 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 Pin Controller
+title: Allwinner A523 & A733 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -28,6 +28,8 @@ properties:
     enum:
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
+      - allwinner,sun60i-a733-pinctrl
+      - allwinner,sun60i-a733-r-pinctrl
 
   reg:
     maxItems: 1
@@ -126,6 +128,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-pinctrl
+            - allwinner,sun60i-a733-pinctrl
 
     then:
       properties:
@@ -138,6 +141,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-r-pinctrl
+            - allwinner,sun60i-a733-r-pinctrl
 
     then:
       properties:
-- 
2.46.3


