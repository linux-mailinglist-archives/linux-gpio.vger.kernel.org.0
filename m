Return-Path: <linux-gpio+bounces-14288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5979FD451
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 14:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 821D2161003
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7261F37BD;
	Fri, 27 Dec 2024 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="aSbFR/Ji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228813C3C2
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304494; cv=none; b=AWtCe3ZzwHn4vAxl6VjBaIBE0JAAEvunVwRspq8c/OvuwnoyebzziE1UwBQNv2uBz2m+GZeQK6gMUz0DqT6Nyniv3ANywx5Yeeql2dumGIpftlT3eUjM6+SLIgGLprH+99qn46Jr3oCQKgcUO5XPSWnxJFcfHG8VAQwOsmV2mQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304494; c=relaxed/simple;
	bh=qHYIlw5q2Ro5I852QrjEef3P3GktuZk2GSnSTYiauwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDx2agIhDe613dqB/kWtzR+jeLD4lphiKp44H5SFMMlI6tVCIH2nGqF7VedNygL56dh2E4Q40x9fteg8hYIOFWBp1zzKUbg4t2a0riMU+NqE1PxRqlA4Mc1eB3Cm6V8cvpKHa1A3qJmjTiKq4gJXv937IAPkKuZvOzyld34dgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=aSbFR/Ji; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id R6CStXPMqxoE1R9y7tlH2r; Fri, 27 Dec 2024 13:01:31 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9y4twrf9xK8vR9y6tpiig; Fri, 27 Dec 2024 13:01:31 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=676ea52b
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=mFyXD75C-Rjc5bRUbP4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VbcHXTdEmafcZ26pOm95idNdvsDgKQdu1LnTvG4534s=; b=aSbFR/JiTZx4U+c9H2c1A/0/pi
	D2/yBDDH3m3UxtCAPnT7fnDFsf3vU7U+0M2Uihxz/QFCzyQrvRVSzUHFTHTclSIFiWsOSR9nOU/od
	I2ySP8OQi/JtJA9cOC8chkNi0g0vdqiBiFUX8RQ8oCTBDOC1oB+KPKgwjTJHSVR4o7gfbU28yA/3I
	AB0IKTEZM1+2/jUIg/bnQCOhP2A4xnWbi2Wy/FGIgfjK9Dw/GuqhaSX9KLJEKsdRMHrnquAgVvLKt
	D0mAuULRz5hGvk9ErXyQuZ60RN1ZAfI0VgUAaKcMxAkVK/VWJCpm/dN4jTr/OMVuKraOmNjFyTvXt
	UTABAwcg==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9xv-002EaQ-1L;
	Fri, 27 Dec 2024 18:31:19 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:50 +0530
Subject: [PATCH RESEND 01/22] dt-bindings: iommu: sun50i: remove resets
 from required property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304468; l=774;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=qHYIlw5q2Ro5I852QrjEef3P3GktuZk2GSnSTYiauwE=;
 b=/2ePddOT/OpNwvShyS69Rsku811DGFkZL/le6QeJ8Ke+qincL08cWsrrfZynXU4sdnlo+0I23
 k9hLapYXlntBNe9JFjiKeJfqR7k6lT7gKV2AVbWsnnSOD5yX2NP+aK+
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
X-Exim-ID: 1tR9xv-002EaQ-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 39
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDrwvge2ouWDgq1WkACwH8fgqvDIV8CVGYEs2EKFa8uSrESpCk/UiQuwkQkyhBVfx9vymKE9SRqNAJWXB1fh0ztTPs2glfqk1A9uPxvcPdIVptsNUraW
 FU5Qksg1SUIBMRlYlSHSsxgkZ71ijY+PY6t8AztgPB15Gnfo3tupOqDvwsjDMH/XQkbH88106TVJd38d9Dxy2cnKyw+BfRHt73Y=

iommu in a133/a100 does not have reset control. remove it
from required property to make it optional.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
index a8409db4a3e3..03176f68485b 100644
--- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -42,7 +42,6 @@ required:
   - reg
   - interrupts
   - clocks
-  - resets
 
 additionalProperties: false
 

-- 
2.39.5


