Return-Path: <linux-gpio+bounces-12909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDC9C69FD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DE5BB22B3D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0735C189503;
	Wed, 13 Nov 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cldbD1UH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A755185939;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482982; cv=none; b=AbLjtQZKrigPkui373g3cP/9ZDb8h58qtKblRMkjmtUr4jvz9P0T+2PfHaVjtAW0sq7np2BUz7+jp6kZOgZwxbgwlW9DauATIlvJ9OQ0wMjr0Ljx2GWj1y93FQDjQjlIPdem+gSMmFLP5ihGvIRNhKVnpHDqtFFaz19352gDK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482982; c=relaxed/simple;
	bh=hX6rPlW3FmfJmTlPxWCoeB0Q5Nhrn5b2VcTq6dcYeYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwFaUF4oYdxjI+GtrU8UAfg/zOzANUn3Ag/zQuXy7lzHyMxYmEQaSpfbuGgmOi0edYQ56PmSMnscQ4otUQplnqmB0dAiMgRopBrP+KIPCfDkhPhLvOV6ZUft63AyRqU6bWn1xnydalz8y8Z1nPJ8jmtBp3TB2DXa2oOXDiFVlyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cldbD1UH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 081BFC4CED2;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=hX6rPlW3FmfJmTlPxWCoeB0Q5Nhrn5b2VcTq6dcYeYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cldbD1UHcA8BST3d09yvK6wvZSWygFBoyewWD7nrk2NH0zuOMlqltmbcmStQFu6Lt
	 KxFFG+XeCqaDnna5xqS91X/qCc/2ZDwPpyi0VrR8U3B2CCVVOuh7srvF2g/y9oAgnj
	 Wgc0M3/PVrsQIWcUWP85R7Wieb3BWMfKOBiokvZ8df7ojntdX2Ni3GM3uYjVqF9ia6
	 RY+J4kwltgkxlb+VjGmEKMDAU8lX09tVydV/l2Wm1G9bET3HDq3KaJ+VmfdxAjVL9K
	 ujm+fITNydw+hwdcG40gTVNbbp4dHjVUSMxVz1TtoinuF3CY2Qw5e+tLIxzYFiHiEE
	 idVzXkW4LURkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0FED41C0F;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 15:29:39 +0800
Subject: [PATCH v6 1/5] dt-bindings: pinctrl: move gpio-cells property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v6-1-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=4180;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qxv4emgVPROFoR8ScbTFnmLM8WUD+O9zBXHAgvRPWts=;
 b=95hEgHD2NGZC5TRpIpdAB5GLXogZK1SArEDVX3xOOhfXvQZ+cNZ1IdEhmVMaTg6NVSRGmO8Jm
 YjpMd9laA+BCcR3N+yBpSLxoX/hUTOD9CRhKxluoiNbUpiUDsh4EBDE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Move #gpio-cells property from common yaml file
to lower-level yaml files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml          | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml      | 3 ---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  | 3 +++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml           | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 3 +++
 6 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..a43d6d2a336d 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -38,6 +38,9 @@ patternProperties:
           - const: mux
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 62 # A1
         maxItems: 82 # S4
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..7b2d129845f1 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -35,9 +35,6 @@ $defs:
     properties:
       gpio-controller: true
 
-      "#gpio-cells":
-        const: 2
-
       gpio-ranges:
         maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 108719bde0d0..9488bb7c8da3 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -36,6 +36,9 @@ patternProperties:
           - const: ds
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 15
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index dc277f2e2edf..b6f72b2c3d38 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -38,6 +38,9 @@ patternProperties:
           - const: mux
           - const: ds
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 85
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..1315e6203f44 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -44,6 +44,9 @@ patternProperties:
           - const: pull
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 11 # GXL
         maxItems: 16 # Meson8
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 412bbcc276f3..07fc77403c6f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -45,6 +45,9 @@ patternProperties:
           - const: pull-enable
           - const: gpio
 
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 86 # AXG
         maxItems: 120 # Meson8

-- 
2.37.1



