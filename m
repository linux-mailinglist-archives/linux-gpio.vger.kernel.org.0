Return-Path: <linux-gpio+bounces-29918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09817CDF942
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64DC4300E3E0
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 11:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C8831353E;
	Sat, 27 Dec 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZSdLH+Zc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E631353D;
	Sat, 27 Dec 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836525; cv=none; b=gL85B5jA77BRveP+y849vvFdTvKaJ/00w1FsZCoD65LC37WZKPc1qoPk8riVKfB1HRbMsILRfyEEvPwZEictlIeHiMgXilMhIxO+2JTCkGKUt725pWGU1UQ7gZU28vj1KIJOTUfT6uCBLJj8pw2ssXHVltygdtIJ0mxy0zgRL/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836525; c=relaxed/simple;
	bh=1Lj69IlRBQf7GLDktFYZ0NWEhXIeDIiyEFRI2kp9TAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/JpWa5vLGP8U/BNGqqTSMV6O57/maCc2jAYsZ7/nhMX6E/OTJ0iDyweRusRLcbLaumVGHfG2tIZ66NlnQn4DLWxSCZRwqD5e/onPPwgzNiKfU64D3QnRyGg6/NeEY5i0m6KpcYDgk650LuVDJ+5ceCQUMwOyCP8JRshtCNLJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZSdLH+Zc; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64e08;
	Sat, 27 Dec 2025 19:50:05 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
Date: Sat, 27 Dec 2025 19:49:55 +0800
Message-Id: <20251227114957.3287944-6-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4f8a809d8kunm85cc97d2e30a64
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkdSVZPSUtOTkkYTRlPGRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZSdLH+ZcF3RZZpP6xKRbDNhs0yS9mWcg4tAQ72tlHCQusjor8NhauZTDceAmmwhg/lrY5c+Pm8fczb5xfxGzuKK2x2K/XFbVAAc3eXQtkbL5ZJLYBSz995RYwJLHClOvIZd0T5GWmcbyowINKfJ01iAV/TBcTZRCz25ZmFpYnIA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CUb3WvGCjbszmhGW+RQqN+i+i3u3FpqE02r/bmTKsh4=;
	h=date:mime-version:subject:message-id:from;

The RK3506 SoC introduces a secondary block-level pinmux controller called
RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
specific function, the pin signal is routed to the RMIO block, where a
secondary selection determines the final function.

This patch adds the necessary properties to support RMIO:
- rockchip,rmio: phandle to the RMIO syscon node.
- rockchip,rmio-pins: a matrix to configure the RMIO block.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 97960245676d..887bec22b172 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -66,6 +66,13 @@ properties:
       Required for at least rk3188 and rk3288. On the rk3368 this should
       point to the PMUGRF syscon.
 
+  rockchip,rmio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the RMIO registers, used by
+      some SoCs (e.g. rk3506) to configure the secondary block-level
+      pinmux functions.
+
   "#address-cells":
     enum: [1, 2]
 
@@ -144,6 +151,23 @@ additionalProperties:
                 The phandle of a node contains the generic pinconfig options
                 to use as described in pinctrl-bindings.txt.
 
+      rockchip,rmio-pins:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        minItems: 1
+        items:
+          items:
+            - minimum: 0
+              description: RMIO ID (Controller index)
+            - minimum: 0
+              description: Pin index within the RMIO controller
+            - minimum: 0
+              description: Function Mux ID
+        description:
+          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
+          is <rmio_id pin_id function_id>. This acts as a secondary muxing
+          layer when the primary 'rockchip,pins' mux is set to the RMIO
+          function.
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.34.1


