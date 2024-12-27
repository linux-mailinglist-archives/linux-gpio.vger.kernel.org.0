Return-Path: <linux-gpio+bounces-14274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E59FD381
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 12:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F523A13D7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 11:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD961F2C50;
	Fri, 27 Dec 2024 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="E5rKyaXL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8565E1F2C38
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297728; cv=none; b=Vn0Ar4Uvlpu5/cagJoAyxmT/lQ2Vn7lI/s7uiKzfhSTMRCPacUjr2K1KA8Uw6XV4mhJTUVmPrOzU5YGbZwOGbSWKWRQjTa6fnhfzrY+WLv+rLDlCu5QImgEixqHC0s7QMatjB2LG+2RTon84dQjXuKHk5uVzDNRNRh2Kxa7rdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297728; c=relaxed/simple;
	bh=oZlIUbxg1cWJwuwv38BcMjpxkWeQ5cHkxaRh0Lf8Dn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU4p3uEAIPSlZQCIWRaBdv2+eAzTRxj2cZIVzprAVD5GQc/aYVTPcpoZv22p277eHkJm5qZVz3m0YKVt5KZcFIwi2Fdw+F5uMvm9h5keoFa80I83ca9dtaCpmnKbh/tMEu39yz76J2i5g0wVsfNp/q+T6wfvW/RLdsojvOiaaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=E5rKyaXL; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id R2SItTQBH09RnR8D1tqgcj; Fri, 27 Dec 2024 11:08:47 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8CytoDl12Zy0R8D0ttMeB; Fri, 27 Dec 2024 11:08:47 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=676e8abf
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
	bh=6cTQ7dIuLzDTMKdT4MZZitwWUZLarutprzerK3v04Kw=; b=E5rKyaXLBkL0k6g40Z9SbhDYkq
	y1n1ZtiKbjkn02haPNPqqREEJ53tFu/5EwZ9ldPshbyoojgwF4KYjxafkQQSRLWEtCryhXMOe4IJI
	FeeEjapctFSqK7zYKq7G9w3aw6MgIjPWgNCL0qbFm3UvXxq0l01lvV21hg3T7Ae3xHEuJ03qHstJq
	Oq+EB7JSo/ZqSA31loO6G9BUbYpxZTtcSAdj7CD2soQz6HpoLuda8fMTIlCHYL+2RCPElAuPkG81w
	UcxZeEaHIraPXOXhUBZGVAssxDWhG4CsLALEgWzgnZ25GRosq5by+uC+VE1fqOCCaiq5t/pUiSjo0
	JCAGZJZg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Cr-000bEK-1k;
	Fri, 27 Dec 2024 16:38:37 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:51 +0530
Subject: [PATCH 04/22] dt-bindings: clock: sun8i de2 clock: Add a100/a133
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-4-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1302;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=oZlIUbxg1cWJwuwv38BcMjpxkWeQ5cHkxaRh0Lf8Dn0=;
 b=ZECHKyka+k10QRxLFFYIfU23bBqki6E7ZKTWK6E2Dt4YBnE5AYqBaRCyqcxyElIuisWNGv1VQ
 vUBx7K/csDmBNYhtNbCPSUiZ6yGrQFs6lQFIDmZE62WnLT+wR9jqIWI
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
X-Exim-ID: 1tR8Cr-000bEK-1k
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 145
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOfs0Z6qb0W5yQ46JeLLlUSBM4rOdOY/VNyjU1OUuHWdHs2DTIaO2FSV4hKFByGMpNLNrKvewsEKJkORpuQoR9dDGRaDjR67ExHNgGQI/bqY7+2I/PZP
 Mu7gx1TyIPhTtWnEYf2IpAQwkq22hNdPyrNwzk+BLMADMPwr63eu3xJbPyGWLPoAXDEwiHO37sy8JOGPosYtb7YD0ECaGsVaBho=

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


