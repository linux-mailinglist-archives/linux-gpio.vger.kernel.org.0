Return-Path: <linux-gpio+bounces-20571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF2AC4789
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 07:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8BE3A89E1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 05:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422051DF267;
	Tue, 27 May 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPwvftPO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F252AF10;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323411; cv=none; b=kQVPq5MrNXSoJLj/+MHUowu/BFE1x1ZXPFSBi8cJuvZW21H7pqrFniMxEMePGi+vC9qY6Rh4Ujdw9fxxE8qXX4wOg1AO+lR/872x9DLTqe/jW28iMHqdhPPdlO95Y5JMjyfQvfYogXs1wt906hR4UTzuycUg1CXCFcSQ+DKy8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323411; c=relaxed/simple;
	bh=EOFcyhTV/hOBYlu+9SROGy3FDiHIkp+vuQMdA1Ficts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBSmTu0JliHx5yMWgRBt1Il9YWRh83yCL3iLXoowtmcNMNChr8Zv0NzM4i2VgGDOjwDGCvy33xRjSRemC8Jc8Te3BP6s/B5CMmEjWgpiMo9GVOB+xlM8b1T7Hdi9qQ9NESLZlHJk1QxyswdRRULmM9dbngt+Xnzn916ylSYSB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPwvftPO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 653C5C4CEED;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323410;
	bh=EOFcyhTV/hOBYlu+9SROGy3FDiHIkp+vuQMdA1Ficts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPwvftPO6lvCYD+4UwVVe8dox8JDhv79JpoN+BlmhVrGUXySwInK/ZJ2sDDOJcgYj
	 kSZaKvgO4HAZWCJMptTVFkBPebSOAjx5Hl5hb/Ulmr5Cysin4dFXpD52FaF4VRKV+K
	 xPlfvqVCs8kzFOv5vUgceMvjuN7dWkAAFrAoyt5dc3IbC/Fia9ziDQJK/7qZYv2Cew
	 eswUQfXkE+QjY4XR1clL8JmoHgqwISBfPpQL+iPN9PF4ND4Xh10O9KkU2rCCzGsrih
	 5k248zaI5HXxVFFaEhLi2978FzkpXz5hJoh9HQUuKSwyCX7qf3DVFMtF284A53in80
	 XDHyAh/K5NHrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56310C5AD49;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 May 2025 13:23:28 +0800
Subject: [PATCH v3 1/6] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7/S7D/S6
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-s6-s7-pinctrl-v3-1-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=1098;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=prX14EgQxx+RSrte6iKA/xDeT6QG01a/L3Prb2dIYk4=;
 b=MCVkadAxc+QJWR8KLI+ziAQqDUO8mWkG838u+iFmr/ATnjWWjKDFcHPXR4qxu9ANnEbYFecVo
 6mSMypFlLH4CW+7lda4TvdDv01tO5gtZW0bMLIfy3NgfOvxUtDYvICt
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S7/S7D/S6.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..61a4685f9748 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,11 +15,18 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s6
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1



