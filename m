Return-Path: <linux-gpio+bounces-14291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBA9FD464
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 14:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913CA1884C6F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 13:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417EF1F4279;
	Fri, 27 Dec 2024 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="F3xXgcoX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E581F426F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304510; cv=none; b=lDNRvynuWYWbpX9FB/KzGXVxFaGHePDtqsQaDVxPfc8ti3L9979oPMcL2r5Sweb0ISHDNHE3ev8rdEn1aBk0MYsFT5gmpUChnf4KjEjvN01liBvSqs3cxeY+chsfQLqr6qrDsJB0wP4lKGB+nuME99c/DLOCsrlVy0poUWXecBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304510; c=relaxed/simple;
	bh=oZlIUbxg1cWJwuwv38BcMjpxkWeQ5cHkxaRh0Lf8Dn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHCanVdDgp356vQYZunGPFnvRTLVngEkd6I8ZhQq76+d5TMsQyLia4yY26VIQWDjtBctnEC29QJMCvJB88AehQclqebzfRisLYqSZ4K9qmnKvbWtPgvKP8AgTqH1G4Rqp/8zZ4m893ioNAgQduC1fWCrbCCu0ZuJ9ebQvlNGpGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=F3xXgcoX; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id QzpKtES2tvH7lR9yOtJiwp; Fri, 27 Dec 2024 13:01:48 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yLtuDBujcdmR9yNtN7Ft; Fri, 27 Dec 2024 13:01:48 +0000
X-Authority-Analysis: v=2.4 cv=DrWd+3/+ c=1 sm=1 tr=0 ts=676ea53c
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=6Yv2FhbjKrII3ob1PCcA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6cTQ7dIuLzDTMKdT4MZZitwWUZLarutprzerK3v04Kw=; b=F3xXgcoX9ktxnTnZTRr1CL67xf
	6UmNwHnPb6nZAVix18evDOrLL7zE+MejmiDeuKW28QLVftVdZq2h+tSEoEWXxCz7e9fKJxHHom2In
	vbu/S12M5FyluLBj0t/sQDecjEYq0uTGo3NlmPoE9xHjlTJcbUb6XQ0W0wA1u6OgJoFCVGyjnavYo
	jEI65DKXh+AwrNzoI4MNi75iI3lCj9g09d3Vu7reN3KJk4lt99kPkDnkNlmyx5gOLIxBFAihvoT99
	mkHwVlhXV+FT8qLPW/rhzsOAszlQrd/mHXnC9jj5Rt5Rwm2CK7cN5uq/+LG8JPENVC3gZ/ToGdqjs
	IErK2ZQw==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yD-002EaQ-2A;
	Fri, 27 Dec 2024 18:31:37 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:53 +0530
Subject: [PATCH RESEND 04/22] dt-bindings: clock: sun8i de2 clock: Add
 a100/a133 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=1302;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=oZlIUbxg1cWJwuwv38BcMjpxkWeQ5cHkxaRh0Lf8Dn0=;
 b=swo9HdKJsdunmD/nPYdYttUtU1l2mhY5S9vLJNNbt3Lk+EGVKMvX4bRB8pzSp26tMKsBHMmfC
 oVkIg2F3xAfBT8IoZ1oUqcCkAc/sniyc05IBs93ll6afKn9ntw5uWAF
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
X-Exim-ID: 1tR9yD-002EaQ-2A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 126
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA3VArgvY0nod/Bnj4ftlcvwOv5HPTSvSq+XttbzDphRNdAWHyLDjkkTyDWkXqCaBmrcYZNk+yrtJmGeCIsFvmGkLYKPv6/LBwIPohFpwbmZDKlZm/zn
 mDz6ukqvbBhkc6mIUPQTKWRRkS7Urln2UbDAsoJIN/4BKRFmNoGpErFAuMtTs/LMwZj0Y2izT6/7P7/BWeHcuxEfxrHm2q6vCu0=

A100/A133 uses one mixer without rotation support, which is same
as sun8i v3s. Add it with fallback to v3s compatible.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 3e00905b66ca..ed038967929b 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun8i-h3-de2-clk
       - const: allwinner,sun8i-v3s-de2-clk
       - const: allwinner,sun50i-a64-de2-clk
+      - const: allwinner,sun50i-a100-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
       - items:
@@ -31,6 +32,9 @@ properties:
       - items:
           - const: allwinner,sun20i-d1-de2-clk
           - const: allwinner,sun50i-h5-de2-clk
+      - items:
+          - const: allwinner,sun50i-a100-de2-clk
+          - const: allwinner,sun8i-v3s-de2-clk
 
   reg:
     maxItems: 1

-- 
2.39.5


