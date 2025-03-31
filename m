Return-Path: <linux-gpio+bounces-18111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C62A76009
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 891CC3A9169
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 07:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BED51BC073;
	Mon, 31 Mar 2025 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="y99+ovFX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7B189F5C;
	Mon, 31 Mar 2025 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406013; cv=none; b=kKb5Hf9ua4sys5BHphcmPSVzUXgp0mLwv5Rq2pCaibvlOSF8shTkiZI3MJ4dKkXjEa1KMxJk5ffgpgyzCpkvL6EsRoS2SMmPH3RXZRHmvKfnxSF1PvQhwoDppcwSCbbHWipps3P6U0xclGC26ye4hqE9n/FIcF11jmUCb6HcWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406013; c=relaxed/simple;
	bh=ImD49gdDmDYlZTkp7M0NVN+yOHdJ7XrwbCjzrlRQaoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GdpcpafLghje60pRw03o9HTWO743wKT0/cR5lKvkLzNL2HBN3PM4nOdkyo3JZJxLpzAFVDKZCUUa3R6pI3M7gzSjNmj7Bn1+CN/bas3Thz98BS+jC70O6904F3yMVx62rWw6H1gbgY6QCVM8djYUYYfRYVG5Qo/ze1QIVZqNcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=y99+ovFX; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 0107A1F8BC;
	Mon, 31 Mar 2025 09:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743406009;
	bh=qT9n/x5EVrHs2Hytr9ErCBtPkRKqtQ/58Ll/FePj4rs=; h=From:To:Subject;
	b=y99+ovFXvKfqLunkMarmVumUcsN1OMMh8nnAY2ssB6mtY5DLWjWQyRFu3zqtvgglP
	 487I4WxhG0asGJFQagrOnEGrNxVK9n9VVc9Dyf4geNo4DWaovD0TyIpi3x0R7IwucG
	 saO69vSa6KJLfYIZoDMi13hXSKyvkUG4gOPm6ca4I8J0W3s9M63V5dERKc0HddwBVu
	 nFrRPx7PPETsMyeQeRHMezDQiMIcRsv2vEHNCpSDw3Rge40qxPbDWhT7xGu1yiLkjo
	 tZvKn5vSAi5DqqF6JJKjOt9rtbkXM6ZBJnIQY7+AOC2M0vI5dei/X9gZIjLL1gzpuX
	 DNZyVTNpFWOww==
From: Francesco Dolcini <francesco@dolcini.it>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
Date: Mon, 31 Mar 2025 09:26:44 +0200
Message-Id: <20250331072644.17921-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Toradex ecgpiol16 is a 16-bit I2C I/O expander implemented using a
small MCU.
Its register interface and behavior are compatible with the PCAL6416.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: compatible changed from embedded-controller-io16 to ecgpiol16
v1: https://lore.kernel.org/all/20250328122917.43273-1-francesco@dolcini.it/
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 7b1eb08fa055..4d3f52f8d1b8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -16,6 +16,9 @@ description: |+
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: toradex,ecgpiol16
+          - const: nxp,pcal6416
       - items:
           - const: diodes,pi4ioe5v6534q
           - const: nxp,pcal6534
@@ -132,6 +135,7 @@ allOf:
               - maxim,max7325
               - maxim,max7326
               - maxim,max7327
+              - toradex,ecgpiol16
     then:
       properties:
         reset-gpios: false
-- 
2.39.5


