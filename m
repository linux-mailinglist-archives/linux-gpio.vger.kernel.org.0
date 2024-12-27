Return-Path: <linux-gpio+bounces-14277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0759FD392
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 12:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E895B18845AA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 11:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA931F37D2;
	Fri, 27 Dec 2024 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="MmADfID+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CA1F37B9
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297741; cv=none; b=tVaFsUemuUWnt/IiUbPmSRmid8MQJVvOobKHCQH/RpliUfM3yggHo6C7VtpELY2CR9Y6PVhLtndq3QSr06753Rytio53bd/i/qKaRVOOIjSOhHAsOcm1kKH1lBA1PA5bOcBs2pSMiBdq/iQeKYmzIQSAWIGW24xV4uKD5PuFZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297741; c=relaxed/simple;
	bh=jfPsPwWKRhhV21IwFSRmL+uw8EZXVaV/9179PemDy/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2mU6PRx4OgbLuFOXIsrMfr44+u8/JF6Doge3nK5hnOckv6fL+1lzM/FJ33GKA3uDE9DuZ2vvGhIC1IiMuaN6Y+3R1YFYunZdXQKYVJbv6VL2hh2O61JFpsRnP3D7BpYvdKU8qKvXiyQsFdcld++/zp9OcHHHU4cEqTg0J9/Qvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=MmADfID+; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id Qzs9taeh3nNFGR8DDtXDID; Fri, 27 Dec 2024 11:08:59 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DBt6jnrlDL5R8DCtSaMm; Fri, 27 Dec 2024 11:08:59 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676e8acb
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=YmDlHjd7AAAA:8
 a=vU9dKmh3AAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=QEXdDO2ut3YA:10
 a=jsfG_yEu7aiiUYXEnMLs:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VrQzcpsEZrRxzYneklGMKbZSVevXccoK1hLw4KZeU8Y=; b=MmADfID++vJZInjAxO+ke3ncQv
	k6lDqXSc4xRJRQohMx7+LLBZKxvH1xCViQfbOqiPtcZEsw6Xc2KDYaIIzyHbR7By5EjVCFAC5UA1I
	GpyA2pMYVBexWEIKqbqEVyiEl2F6JQh528r3RGK8C2FoewaEE8/LLPoh/E/l6/OlYAwRlQWKXHq4y
	DgvNtopjCF4ciuHzdjwNUN8lLJJ3MOedR5+iGqItg7ho6Yud07Ym5sIckOxvdIiI/9DiATpbVFIHF
	EWpx8Xw1xRpsZMFzOsMBCbgB1MubFm6SeBYmKggJ31teQEqgTZLmlUAuChhch3yFYtloavFK2U2N3
	/9ykVKRQ==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8D5-000bEK-2z;
	Fri, 27 Dec 2024 16:38:51 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:54 +0530
Subject: [PATCH 07/22] dt-bindings: vendor-prefixes: Shenzhen Baijie
 Technology
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=835;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jfPsPwWKRhhV21IwFSRmL+uw8EZXVaV/9179PemDy/M=;
 b=CJOVx2TC4fLDcjQ6xgq4N4Mi1niTuzwwERJ6yiEMANOEwpSEoLqBhfJmD+PDB56mjpO3si6jf
 jx7xLttFSJpD3tHngJF3gIva/96uOpoEpuitCdS8Sqx1ZgpvNpSt7UF
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
X-Exim-ID: 1tR8D5-000bEK-2z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 225
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKNCobJChHaxsC+OOEHjYWADzYgx2yXQU/BbvkUvkgaW4PRnMbkDjPBwOdNgkT9Gi9Nynos3Kqzr2/PZbXivZdzG+XIeEax9odj9mnt78Ed0LGnuJRty
 orR9HaQ50eVRZbBJjoh429ju7sklMQjRU6PUi1wnK0EP5639isRUsAX3tvB4Wq/uV5l7xPWFe+lSqYTW5VxZ9aMhSOrHJAsCaL4=

Add entry for Shenzhen Baijie Technology (https://szbaijie.com)

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..81cbc8b6b195 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1466,6 +1466,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^szbaijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":

-- 
2.39.5


