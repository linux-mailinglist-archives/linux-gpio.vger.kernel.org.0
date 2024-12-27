Return-Path: <linux-gpio+bounces-14289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF939FD45A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 14:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB38E16072C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 13:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A1C1F3D2A;
	Fri, 27 Dec 2024 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="VUe3+9lx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02151F37D0
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304502; cv=none; b=kAANm6Ov/s+oqAUw5ZT3+vxZGx9gc58NUksSJp3bcEEZsT2smHiU61t0g4aRsMAyPP/iE5gWEU2+8GiPdYgscxiWkx8S4omt91YSSJQds5h+4jVPuy6qexS/z/rk6V9qvDUOC02H1J10OyijWAE+aiFOeBnP/ia1iUR6/sHq7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304502; c=relaxed/simple;
	bh=buj54CCUt17f1cf4Nx7HHyU6fji1O8F3QBNHBtjCt58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jr0Ov0ZR7uyjEddTmT0AjTnvDEnyoU1PX5kGRGU02u4XIA29AyP0BVVw4yZfEoofThqpHeQSJAEKb6oFWCs3qoKQi1kPiUJctDP2nOVPIdFM2CtC4Dw0uVInHteUfc15zDMG9wfKlkj5ZVcb7KoAMcjx1KlO13XNkyT90fgcjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=VUe3+9lx; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id R6iNtTxms09RnR9yGtrExA; Fri, 27 Dec 2024 13:01:40 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yEtYEbKaFTVR9yFtKdM2; Fri, 27 Dec 2024 13:01:40 +0000
X-Authority-Analysis: v=2.4 cv=POkJ++qC c=1 sm=1 tr=0 ts=676ea534
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=108W9xlQDzoLNeXj7ooA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iaG89kv/nDQri6+AUj/VvYcWX2dPo9unZTW0isixi4Q=; b=VUe3+9lxenJhOJlQDsXd7toZWy
	ydMo7PBjLQsofKkXXOPEQ/OzdcPRJoRbeAqHBgYyspjVnoU9TaTjN0rDg85JsS8HD5D5tn1ICB1C0
	7/x4awx//TzxASq2NZmRoxPE6JM5SbOb2H4mZ2BZDkEiMISiOHP6XX8jj74Sl/VC1uEknOTJ/+AZj
	teEzu6ynFw0dO0kLRO9SXw2p7/YTozl+ISWK7WKcRTLm9YWQwHR6vdW7ta34jsPCkTLYHQdAQd2Eq
	wsBaBTKnBzPOu43EFJPzM8RpdSsogIhirsl8vcE5QR5jqS2F3CgnlMoQspVxTIe651buIqAzNx1XT
	o0sO0Vzw==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9y0-002EaQ-2n;
	Fri, 27 Dec 2024 18:31:24 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:51 +0530
Subject: [PATCH RESEND 02/22] dt-bindings: display: sunxi: Add a100/a133
 display engine compatibles
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-2-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304468; l=3186;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=buj54CCUt17f1cf4Nx7HHyU6fji1O8F3QBNHBtjCt58=;
 b=BV1mkClz8zTD80IGW6fUtVEldH/2636v6oe2dQKHqqGsQNWNOtq9siIP3gUvo5Gq8zXSRj8bb
 jppzzzDkoiMChJPz6A2owoteFDYVleek9+g2fSKtBdC1okY8/WEoraW
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9y0-002EaQ-2n
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 68
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ3YykzN2MRPPoiGq7YRdmfUVn/zR7ZcXGXSfT7/wqYVwUfP652R6hCJN5NSkyGLF9p30aRPeBwqIqINs0UHSrHAKJ41ReBomDcMFL9ur7+k64huy4ct
 JHOshC5c5K0WlK+/Cz85b22xT1QrvBwHw9d9i4KA2qNqSXAudYxm021xiqS7iFZ3EOQ4FQSiaanagLwC/FzICQ2AdJH3ELBxFKE=

A100/A133 comes with display enginer 2.0 with 1 x Mixer with write
back support and 1 tcon top. Mixer can be used with lcd/lvds/dsi,
but shares the same GPIO bank.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../display/allwinner,sun4i-a10-display-engine.yaml     |  2 ++
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml         |  1 +
 .../bindings/display/allwinner,sun8i-r40-tcon-top.yaml  | 17 +++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..dc47c684fcb0 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -64,6 +64,7 @@ properties:
       - allwinner,sun9i-a80-display-engine
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
+      - allwinner,sun50i-a100-display-engine
       - allwinner,sun50i-h6-display-engine
 
   allwinner,pipelines:
@@ -96,6 +97,7 @@ if:
           - allwinner,sun9i-a80-display-engine
           - allwinner,sun20i-d1-display-engine
           - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-a100-display-engine
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..ebcddca2efb3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -23,6 +23,7 @@ properties:
       - allwinner,sun20i-d1-de2-mixer-1
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
+      - allwinner,sun50i-a100-de2-mixer-0
       - allwinner,sun50i-h6-de3-mixer-0
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..9b14b7fb2d2f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -42,6 +42,7 @@ properties:
     enum:
       - allwinner,sun8i-r40-tcon-top
       - allwinner,sun20i-d1-tcon-top
+      - allwinner,sun50i-a100-tcon-top
       - allwinner,sun50i-h6-tcon-top
 
   reg:
@@ -179,6 +180,22 @@ allOf:
             - description: TCON TV0 output clock name
             - description: DSI output clock name
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-a100-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+
+        clock-names:
+          items:
+            - const: bus
+
   - if:
       properties:
         compatible:

-- 
2.39.5


