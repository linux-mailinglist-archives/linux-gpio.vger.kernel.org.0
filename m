Return-Path: <linux-gpio+bounces-2873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF984572D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 13:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D9A1F22F1F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C8E15DBA3;
	Thu,  1 Feb 2024 12:16:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4115D5CF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Feb 2024 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789805; cv=none; b=Tq+Ej2Z2Ge4kPXtMv17te2V7B+V1faNqkEneJ1GFpfczlRf6DCYpfE/YC54r19z+yTxPTeO1kHpvl1mHoEvQFt7gc6jLMvu0kYO5KH61Qe4i/uTXUz+VqsR4xM1KgFMUiejgqzUBEo9QXbPKjXpE6+jZo1r363Bv54WcRLDFEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789805; c=relaxed/simple;
	bh=iDcOhlS9DEIejgMVn7Ql51OGWkh+At93I4C8xzVPOlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mNEYiZsHxXNluTG8lz1u2GYtEA6mRp5wPxX5Rso2M8CNzu8sOYcvqKi/x+9F45vJZlsjXlEWaYaVPH809IjiUviEq5JYFqo8LRNb3E8LoC6hevN0whP4DVvPSqNYlNCEojY14G4OpgABQ8GgOJBLl3yh8C+14gw+vigRzEyIGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by laurent.telenet-ops.be with bizsmtp
	id hoGb2B0044efzLr01oGbzM; Thu, 01 Feb 2024 13:16:35 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVVyo-00Gut3-1P;
	Thu, 01 Feb 2024 13:16:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVVzf-00ARk1-04;
	Thu, 01 Feb 2024 13:16:35 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779h0 support
Date: Thu,  1 Feb 2024 13:16:33 +0100
Message-Id: <c5681eb5d28641d9b51ac2066b56b52d23defd85.1706789728.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for GPIO controller blocks in the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index aa424e2b95f87a51..cc7a950a6030999e 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -53,6 +53,7 @@ properties:
               - renesas,gpio-r8a779a0     # R-Car V3U
               - renesas,gpio-r8a779f0     # R-Car S4-8
               - renesas,gpio-r8a779g0     # R-Car V4H
+              - renesas,gpio-r8a779h0     # R-Car V4M
           - const: renesas,rcar-gen4-gpio # R-Car Gen4
 
   reg:
-- 
2.34.1


