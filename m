Return-Path: <linux-gpio+bounces-8545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 439FE945FB3
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 16:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B821F2229C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 14:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E9D21C16B;
	Fri,  2 Aug 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IBBhnaBh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6902139AC;
	Fri,  2 Aug 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722610441; cv=none; b=Lcgf+dNflADKZBGBW9e2nbkS2B7gVdERfXvX5Se0+8ko+W5EN4i8evm2NFeT4frfgHZsObNa8GTXWlgGUBfJtodnG5m3c2NsOzJhnOrSZYW8OR3ElldMoZUNSEtudxwsWXuXRzDbAwaxRaaCI2x2KT0oOXFVQ2ne72AAky8g++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722610441; c=relaxed/simple;
	bh=gNY/m0NcpoQEQagcCqUupCWfV1thUtwHYQjp10DWvpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlxwfr/iHBA2kX9+L1HsJps70JhxkqfFF7yQhsAttX898N5KAq+GsUuPgdV3DEXfGn8FWGJCpEAD8/VizUV61xHIyPG4N5bAjAmEVy80fa6/858prNpQPd5Rv3IQRaOqfiG2RjDWwvWRAxvmjCzrktDSQx+lPKj0+WiW5FONCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IBBhnaBh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722610438;
	bh=gNY/m0NcpoQEQagcCqUupCWfV1thUtwHYQjp10DWvpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IBBhnaBhcEpqb4FNGfgBCiilFQryCPpgr+FuHJ56ePCFEtEOnhvSjXAKwaj/I+J3i
	 uNlGMGzAhT9JFKUv6QphqOK8cPRRk3Tx/NYJ5y1UjZOg07n4Jqf+eF60CPcSIr3Fno
	 c1O/io6DvRRV8bfj6AKow8YqLJWUsL+5Bfa5yjIlaXEKAAsZX85ljwtvPQS8X0d7gv
	 wKdV2uECWxpMKnZu/oE2O9/LnsoQGrpuxMKqBnFHaRNEbylxP8oYJW9wZRaW17D/0z
	 on77vw40ntkrsRQpRk1+gkWp1FZAoiOlGjYkk2BlJj65OgaT02Rxnf3hsnUMC6pM1G
	 N9AqXtYmwSsAw==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D597B3782219;
	Fri,  2 Aug 2024 14:53:56 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 2/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Date: Fri,  2 Aug 2024 10:52:04 -0400
Message-ID: <20240802145458.291890-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240802145458.291890-1-detlev.casanova@collabora.com>
References: <20240802145458.291890-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the compatible string as well as the optional rockchip,sys-grf field.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 20e806dce1ecb..a202b6681624c 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -45,6 +45,7 @@ properties:
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
       - rockchip,rk3568-pinctrl
+      - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
@@ -54,6 +55,11 @@ properties:
     description:
       The phandle of the syscon node for the GRF registers.
 
+  rockchip,sys-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the SYS GRF registers.
+
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.46.0


