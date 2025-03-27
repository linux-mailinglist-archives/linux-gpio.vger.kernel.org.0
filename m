Return-Path: <linux-gpio+bounces-18052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297EA72C51
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC543B8D3A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8050520C490;
	Thu, 27 Mar 2025 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwqAx+UF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C0F20C01B;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067598; cv=none; b=B3lYD5+M85CEt1q8lkMv4tivtnuetitp0OL7/U3HF6p86XdKm2TzWX+R7pHeenMw4VKXjdqpHH2gATyaH3J2S+DLJyNyfvQfnTv1Rti/RD5HiaibqINMb/0Lb/86qQddfl7zASHFMXY+/wp2vtAZiNWGAOD1Fo9ZfzuQudMR+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067598; c=relaxed/simple;
	bh=8Ex/Jr8diQ1IbTbGBwunvR8qirt4YXrZ6QekMoJwqYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XviglNSQ/yie8GP6q7lS7ZZ6AftimdYdQ07nXI91nbZFpDRc0tnFBenlaQMdZ+FnQpQrxxBzVY44FzqmawUNM0yexxkqVMDPT1E502RpwqNa3gC4xGaL6H231YKH7CiA9xOqFjSL6JqSD5qARhuRsJqofQKy0PJg7bZlkH471jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwqAx+UF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 934ADC4CEEA;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743067597;
	bh=8Ex/Jr8diQ1IbTbGBwunvR8qirt4YXrZ6QekMoJwqYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LwqAx+UFVtSRdaxDke/l+hloA54FxureH7JeUEX5UpfByUqHG5JBGktFKkic5u47b
	 EzDaeYewZ/aYfzX2WpuGpHnVcP81O/GadIglwMeKbugvFd5HU474B8wR8i3qRHUsvv
	 XaDXqbLnpt9198w2/lVzFYxTWcGQx2pnaO8um4io72ZnxARQN7oNdZ7qYRwFDeAViB
	 CkZKQAUEVx10l/4gVpUxY9GWs2SU+sB7+t1JpgE2uGzzuSOn352CXzW6RSFUixtyny
	 ztzQzqHpSJscgAxJKUv4iFcozIz7wP8zM9jyQti3ENH8DANmV/0hrVH0wQRrkFqlKr
	 6qQ82VWELPinw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C11C3600C;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Mar 2025 17:26:35 +0800
Subject: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
In-Reply-To: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743067595; l=1027;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=e5E9HFKA/8VjQVYFNbNKCkIxF4wUBI+C617RgTKcAFA=;
 b=pfftSA0ow6ohkIHTU+RWjU9yarMrpHvElbzsyk2KJTNSA9+b8jmLlFm29TCzBbghYrNou4Tb2
 v9QUnNPCRC3DmidQRzDZVEGIb+eTMSyJmT+46B5tBYSl8VXShJGvkKa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
no need for an extra compatible line in the driver, but add A5
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..a94f4dfb9a7f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,8 +14,13 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
-
+    oneOf:
+      - enum:
+          - amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
   "#address-cells":
     const: 2
 

-- 
2.37.1



