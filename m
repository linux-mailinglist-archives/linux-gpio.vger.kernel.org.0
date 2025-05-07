Return-Path: <linux-gpio+bounces-19760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB39AAEE39
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 23:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E609C5EE6
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 21:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB6328C2CB;
	Wed,  7 May 2025 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5mianO4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E825E467;
	Wed,  7 May 2025 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655137; cv=none; b=mWUKew8Nq5WX2LmMuOY0gQK5f/ZGysRyAQWZZVxPD8Ox7vhRkXpv/vBjcmdnrVlcNhmgHW6kEELaatQ1MkOOrZf4/zjzDNoIQO+/RblVztFei7PqQEItL+OmUyuoaugqx5wmWkB8iFgdctvy3lS0pYsF2IGIqakWUobEoVcx6Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655137; c=relaxed/simple;
	bh=lfb0UqWejUoC/acLLAL6bG7BFI3fRZXPCnfpHVL17UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAJyJ6WN8KPv060u/Lj/emqW+AsQEOpOsD0oYVeFjrxtRrHX7IfJxWd0+bQ+ad87M6bj65GhbdH5tiFygYG/5tbyLjAtuljA8n69ppG9GhRpAJnOeVNghKL96h2i+hioc7jEwsuTE9l1M/V39+8KdCW460A2N3K6nw2JyiJd3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5mianO4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B519DC4CEE2;
	Wed,  7 May 2025 21:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655136;
	bh=lfb0UqWejUoC/acLLAL6bG7BFI3fRZXPCnfpHVL17UU=;
	h=From:To:Cc:Subject:Date:From;
	b=o5mianO4mCqaDmHz2fE8wPgB7XaE5F21BK5N2FJz1l0hQ02fr6+kxDSnkDuv3OvjM
	 EwDajHQPPBEX3qdofHvhZ5qzce+T2rQWQT3Usi1j9mUbsPTiMohSg6ngjZ18500Wnw
	 2Qfgj8Cmr36dpvePl4qFUI6ItHvAQFP41SUNyNS9V+NyAb+oDYjBPuWdTOOEXjL8Cm
	 YkmcGIL51A4uPyL2STSUu7E0Zs5FYb96IlNysUDVPbXPzk2V2SR6Zes6pvY2aZkGln
	 o09GYrCrjLdTpCKDugWGW6on7IltVjqo1Kiod0WAj2JMZ2H7D1TocozJEEFDbdmYqI
	 ut/qhnuG2OcrA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing constraint on allowed 'group' node properties
Date: Wed,  7 May 2025 16:58:51 -0500
Message-ID: <20250507215852.2748420-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
properties as the referenced common schemas don't have constraints.
Add the missing "unevaluatedProperties" constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..78279b9fb737 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -65,6 +65,7 @@ patternProperties:
     patternProperties:
       "^group-[0-9a-z-]+$":
         type: object
+        unevaluatedProperties: false
         allOf:
           - $ref: /schemas/pinctrl/pincfg-node.yaml
           - $ref: /schemas/pinctrl/pinmux-node.yaml
-- 
2.47.2


