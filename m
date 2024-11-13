Return-Path: <linux-gpio+bounces-12919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D69C6B91
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD75BB21FA0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF5C1F80DD;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfDuVQji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309AE1F77A6;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731490656; cv=none; b=tDGbG0D0DpLJkuGyV/8yHpJ2AOlSqrXzGR5O2J+LMypkffmR5QdGfFmIIu6vjwLFwlWubZa9tQ24tMX/1mRPCS++QeiyvYwuFn67NdB8yYF3ubhvjZctmuOfjqEki8z1/hFAkCr/r/X38v25X0xC89maufZTb6mp8ncwlglYYxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731490656; c=relaxed/simple;
	bh=wPBe1Ne97A1i8ZbAL/kYQUIE50R8f1hyGC9apeCSxRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAL3pIdGydUl1TuLnlUfb6OHf0wr5nV84CzWuWlt1pVTkGCSmIBC4NPpxNHMunSaJcND8KUGj9x/BhTKRxOZ6zvAv462B88JTq+4JsX9YN2+CnXVFpbnk98SXwvoEyOZnrbCDJtUNDNazsSwDWAUuXxtFP7AeBkV3NrL+QFIGto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfDuVQji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB38EC4CED2;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=wPBe1Ne97A1i8ZbAL/kYQUIE50R8f1hyGC9apeCSxRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZfDuVQjiR8bL6TeUXNRcAfE3GNMeHJBHgKvWEkjNJiaSO1yWlaRB10lQNVHfGArKs
	 mYGfePpDbnrmxKGkLKVb/eC/pHVAvYhyv1x9C4MqLGZJJQIo7W84YAHTgAo08NXRuo
	 so2U90lnVSY4R+KCJNmWNktIrgtT+HJNv4CYFyuCPMYVqEFQo5lstsB5ltPqB3+Cd0
	 mrEi8+gDtKmZFicoy/kUAOxojn3VuyZP7XeW3gFqU8HXwW+rewjCN6XHwe8e5yi6rz
	 A5sR7KmiT+pDhQJlww8AMIhj4vYsfTbXKCUP8HP29ojFjIuiizuVZgCQANJ9Satzt+
	 jos8Ruhf+nJlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75A6D41C26;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:28 +0800
Subject: [PATCH v7 1/5] dt-bindings: pinctrl: move gpio-cells and
 gpio-controller property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=4395;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=9MmCznmDm9mVPvWwuBcONM77WszO1Q8hkiP9QjVbjvU=;
 b=xxRS3+wJ0rR+qFhpzkDhhya4g7/CA1N/WcYSR/mS22omOlz0acXcjZtfbtSK77kO4ZHM7d3Ja
 RpYQ0TeV9pmD4Z0BDdjeTenVC90AV3MgHr5g110+30+5koqqOmRD3+n
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Move #gpio-cells and gpio-controller properties from common yaml file
to lower-level yaml files.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml        | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml    | 5 -----
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml           | 5 +++++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml         | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml    | 5 +++++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml     | 5 +++++
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f841367878a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -38,6 +38,11 @@ patternProperties:
           - const: mux
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 62 # A1
         maxItems: 82 # S4
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..e3765010f6a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -33,11 +33,6 @@ $defs:
     type: object
 
     properties:
-      gpio-controller: true
-
-      "#gpio-cells":
-        const: 2
-
       gpio-ranges:
         maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 108719bde0d0..47607ba59237 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -36,6 +36,11 @@ patternProperties:
           - const: ds
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 15
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index dc277f2e2edf..adbcda6ce18e 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -38,6 +38,11 @@ patternProperties:
           - const: mux
           - const: ds
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         maxItems: 85
 
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..15e04f2ef9e8 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -44,6 +44,11 @@ patternProperties:
           - const: pull
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 11 # GXL
         maxItems: 16 # Meson8
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 412bbcc276f3..c63e057cca92 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -45,6 +45,11 @@ patternProperties:
           - const: pull-enable
           - const: gpio
 
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
       gpio-line-names:
         minItems: 86 # AXG
         maxItems: 120 # Meson8

-- 
2.37.1



