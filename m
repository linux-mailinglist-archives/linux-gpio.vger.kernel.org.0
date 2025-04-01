Return-Path: <linux-gpio+bounces-18132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5632A7728D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 04:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70233AC4BF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 02:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FE51AF0BB;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgJUkT2m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165214F9D6;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473183; cv=none; b=dXHT+9620aEKAQUkM49cSo/waoNZkESFNZz46J6W+sykJOJ5IIzy/awUpFWyXKyfKjaPbvYGJuKTsis9+6+0wt9liImjXkfc+Ic3yP8FsBuHNKTJ6L8qorZFebwrW+7iPJ07lCFGoegMSBwU+R48Mzl7Akdz6f+4QfnPc2NnUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473183; c=relaxed/simple;
	bh=mzchwkYo8Cop0lyIAFbQzmQzlnagfFBZUWy82TqnAgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8hUpASuJpj3/WJz+Tp7IBDN+HFSHfy1CQemFdcy34LbcEOu2LYcoSke7SWs6I5fXj+2TXk6EJBpPx7uHYJI1wFPW2UBBkb4dhvTvxTxEp70SZXdeY7op7nIZBxmiwTqNnOZa1O4AyAz5WwcmJF0Ap0KNOdV2eqNj2K2hZQVREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgJUkT2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03CC5C4CEEA;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743473183;
	bh=mzchwkYo8Cop0lyIAFbQzmQzlnagfFBZUWy82TqnAgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mgJUkT2mJn3PijYyDielrwg0coWbTgJZcQQsXx/i9URNKo4uc28aWCCBDE0cESPXw
	 kAZQl4es5CLzOVI709ICNvokM/5sPuDNB8mt0dAy47xs9u5WLclSZ/13pT/ujtVnpf
	 o1TFGoR6es9WJPNHUBHl/okuctAcAtlqb7wG3P/8tTmhyJF8qkQqk9Zw1o60hdDDVp
	 58VCXMj256/hz+rg1Sz44g5UUhK5BdZVaqI0fFQnP0ROZZNNWY5JPI3lxwCLWyBS9e
	 tbc+8HVvRCA0hMZk+W198A+QM6yTzKTA3GdgdYovpSOfvlgc67RHenPahB4OtG53gO
	 PtGQNBzzfKpFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E1C36017;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 01 Apr 2025 10:06:21 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-a5-pinctrl-v2-1-a136c1058379@amlogic.com>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
In-Reply-To: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743473181; l=1067;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Pz16Z/QIM4IDWi5UYrztmMtclbTkct1CDyubtK9KYn4=;
 b=tIqYXqlrL3cEMBuUkhDpDT5x01qWCw09VqlUKfVE39cA28tUMi3sre+NqfzZ/BF1MsNdR5Y+x
 JnrhDuK6GLjDEIESc2nkxjj654ABNisplxGeYWxPACxP6Q7yX2w4EQd
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..3bebccaf0c9f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,8 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
-
+    oneOf:
+      - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
   "#address-cells":
     const: 2
 

-- 
2.37.1



