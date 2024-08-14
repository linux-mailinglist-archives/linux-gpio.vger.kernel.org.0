Return-Path: <linux-gpio+bounces-8750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 649709525BF
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 00:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 000D1B2557A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 22:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD9A1448C1;
	Wed, 14 Aug 2024 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="W6c/IiDH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055D14B06E;
	Wed, 14 Aug 2024 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674671; cv=pass; b=SIfzUDMYx6KPjEOI7fxLUfD6J31Z+QzmUzenAn12nuemlBlo+0ZpG77FLUy3wVzJ4xEZNnO0TeLbQGqo7o9Ihet/9nYAH8aB0ShpV3DwwcGmvl3BsZ9ee7QtiVpnxXp8pMBVINP6t6xAO8DjDYOMqZkygL7cI36DE/gEj9VvgkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674671; c=relaxed/simple;
	bh=SVElQE7jrdQhyXr4kcCs/MUuAcZPJJQbFNutYBgYvu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzFtAbfy3LMRPL9FwMBBSo4eI/cqHpA9RBYwoQ+PueeHm8wV6W+7zsO6U0+cXhjq1YdU9nQhbv/p+gtI/PDaIwtDm+qF1Xk+8bCgbDC24EEq4QjINZXm3R6kaNmIJlQFm2hm2rqr0p7Wgjzg/+oq1JF3yK94SRYWAHeZ0GJRA3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=W6c/IiDH; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723674653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJWTp9K/chRZxpc+TSA+6am4dSx4burbqNeAw/K9wCEpyUdoIrPLbOK87Em4wf4SL3H8J+2Xy4la2Vd3KhEeVKgjOpPi1YMZPqFLYm/y1Ac/mArl+ETrfDE+uIl4vxqBu4Z4RiEPQTjcqDFY1cZJWyMgV5bWlWHK5ALYZQi+7Ho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723674653; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IM1nIq8ajzs3qmZL6201DXzMYw58RTONKzqd0ALKxCA=; 
	b=flkuKwRgZUwCmnGz3lwlKRR425R54zEX3h5p0zoBD/0TPt5v6GzzCdM4++TzDXw9TN0k/zwqhGQBabQYZTf2VtocwBE1H8pxORDn5AmWb4eQE+6xjutzbrzlweuZsW3PYiOk6GY78gDdci7rqzIuse7a6wWgW4bQmRj0QMMnaa0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723674653;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IM1nIq8ajzs3qmZL6201DXzMYw58RTONKzqd0ALKxCA=;
	b=W6c/IiDH7yNtgeK+oDtlTJpqlUSo5VEqYKZsTuWCTB77SV7ch4tWbIATHhjPmjFj
	/+PrNY88KoUmK/H1L/toCFmafDJMssOzfm/OkJz7WlacGEs+1AbfDHgILyEZKw7t/FP
	vO6h8IJHaE6f1paad0djFW9XB0s9TF6xE3CrJYiI=
Received: by mx.zohomail.com with SMTPS id 172367465195192.05996995891837;
	Wed, 14 Aug 2024 15:30:51 -0700 (PDT)
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
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Date: Wed, 14 Aug 2024 18:30:38 -0400
Message-ID: <20240814223217.3498-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814223217.3498-1-detlev.casanova@collabora.com>
References: <20240814223217.3498-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the compatible string as well as the rockchip,sys-grf field which is
only used on this SoC.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 20e806dce1ecb..28f8dc412cf92 100644
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
@@ -62,6 +63,12 @@ properties:
       Required for at least rk3188 and rk3288. On the rk3368 this should
       point to the PMUGRF syscon.
 
+  rockchip,sys-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the SYS GRF registers.
+      It is used on rk3576 for i3c software controlled weak pull-up.
+
   "#address-cells":
     enum: [1, 2]
 
@@ -72,6 +79,17 @@ properties:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-pinctrl
+    then:
+      required:
+        - rockchip,sys-grf
+    else:
+      properties:
+        rockchip,sys-grf: false
 
 required:
   - compatible
-- 
2.46.0


