Return-Path: <linux-gpio+bounces-13873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C49F13B6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898C8283AB9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EA11E571F;
	Fri, 13 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxcvLrOX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709F1B87E8;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111176; cv=none; b=WJdfLkm2hShzy0HsioPFVQZAMdRv5nWxgpJWeGY61f0xXt8qJl8q/BgmZku/UuDWgPa9tedyi2Bw+SLyHy0A3Re9dy6q8VPDSPm+4nYe/2zblpVNpBAvQ/r7uBHFSi404xH47zo2EBsCmY1HDtOgSTMqV6dC8twuAQnNJHM3tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111176; c=relaxed/simple;
	bh=lyuiypRThro8v3Ah2PbyaIej3rAaNpVPxr93uY09VDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2SWZnC6+QZSGOMXlOuNuNpUtrBPbSLn4tbMXeRLzmzH/u8S0eCvKENC1JP/h2509aPF/PxaC6cTEIUMM/xJbVr4dcuxYmGu+fwzqMtvR9PsxDOyrFqDP/gYOLfPswxP8zgmMK0DrdYWGymaZQlErsOzM422kpFtlzT7BnJtKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxcvLrOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 635B2C4CED1;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111176;
	bh=lyuiypRThro8v3Ah2PbyaIej3rAaNpVPxr93uY09VDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dxcvLrOX2JtdjfjWy5zDt/Lz+GYfr8tEwuf0U38XjjAzEyGyvjjwSPdowqxWkl8Lx
	 1/9ddtaqDb4ulo4QpoHbbr2q9Q7TUlntJJU14MueYGapdRKBGWf/LQuVEQMviMAJXS
	 WHmJO9aGW4lJQi3LKJJfCGaj/qvB8FrfDXFI1zgW2W5zriulgx3NDms3XXnGKqBRIA
	 +9T62ccDQ2+vTqDBHFYyEmfp5ZCIKYPSxzWjCLlqkKd7H5zy6VdzurY7txjdS4c4/l
	 ebmlXcbr9k1OqkMo+fvbKf6ksTqO79ezOOcH2yqvtCS2cc/BTw9qLKmwuxKheTZ3RD
	 eddQUr+Z14Zrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5238CE77184;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Dec 2024 18:32:48 +0100
Subject: [PATCH 2/4] dt-bindings: gpio: fairchild,74hc595: Add latch-gpios
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241213-gpio74-v1-2-fa2c089caf41@posteo.net>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734111175; l=1203;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=nOeQNfQ47dnRJX9VGmO7IYI+EXeck3n+BI0JGrTkkuM=;
 b=E7iVfa+/YdGqEdUsG0I01f6tT/vDlup1VkYT0mXzTQWKS4Wbk/VgYc9vvoUujh6kcBvcPU8qI
 tWfLuVgwBEgBVCYPNPBb8miPojIfAkfDcGDVxT6m33YH+j4ryu86IF/
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The Fairchild MM74HC595 and other compatible parts have a latch clock
input (also known as storage register clock input), which must be
clocked once in order to apply any value that was serially shifted in.

This patch adds a latch-gpios property to the binding to allow
specifying a GPIO that connects to the latch clock.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 629cf9b2ab8e4a63fbe17f56792a46d2066d40c3..38d473a3852154e53faec88dc911dc0a4f9cbd1f 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -34,6 +34,10 @@ properties:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
 
+  latch-gpios:
+    description: GPIO connected to the latch clock or storage register clock pin.
+    maxItems: 1
+
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object

-- 
2.45.2



