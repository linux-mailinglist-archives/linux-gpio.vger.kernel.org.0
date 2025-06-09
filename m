Return-Path: <linux-gpio+bounces-21131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8FAD292A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 00:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869213ACBB1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 22:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C75E22423A;
	Mon,  9 Jun 2025 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCCQLc/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5146819ABB6;
	Mon,  9 Jun 2025 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506962; cv=none; b=cpdfMotHpOMPXMcm5ySPBqTPLgiYs+s+m390VeBirbhWRcyadPYYHvL+Cktau6Duwcps5JhdInir5zpHQf2eq/GKxjbgMKqrbh7zQZk3ORrqO4Sexzp9lHXnqqhxc3xCPoxKTcC0NPGUeU8o/ganHYbunnWe96rSUT7t2+4QIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506962; c=relaxed/simple;
	bh=4km64HvOcDG9litpMDksa4nqbJ/nPdX1zgW9ptYvJnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdKGqJ0utsUm+eTdh7mNkZr6uziw8yVmtkOxzzPLC4KYvR4qnyhBi65QRqaowVnvlKFkTaKgukY+U3u8ggn6GAEEJ/pNw+XVZR11KU8DurW6n0m5ldMqH8bOaJ35B+3O8Y0tjwX6gWcVQwk+8ATvgiP/x8DGPbY81hjNo1nf9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCCQLc/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55541C4CEEB;
	Mon,  9 Jun 2025 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506961;
	bh=4km64HvOcDG9litpMDksa4nqbJ/nPdX1zgW9ptYvJnE=;
	h=From:To:Cc:Subject:Date:From;
	b=oCCQLc/2j5uFFrbUMYwT/LNhuDm+htpms4UPFWdOtx/qqLxj/ji8jRQYBvGXhTn7W
	 LkYVGlPYqcWzeKVWg0n5ETMjDeiQz2arnFDdSEAZiDjlscdPrh2FIMz1dt1LnzpUFp
	 w9gXicPdq5Pb43ii3AZiPLR2TfiEYscJo7kf5vjBu3QNBTCraezAfGkBmiYmZZEfxI
	 O9mPTlhPliErOgtBMG0SA20eM6a4rZBY0p3fU7VFb3rnqK/iyesKSUP1xMcjARXZX4
	 QNJ3yMXmebHUh+NcZofgsfMbauax/IzmCJ+p82P0xpTJNo+BXsFxauLnZbfrzYkUzS
	 9LYj5NytxBnzw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties as required
Date: Mon,  9 Jun 2025 17:08:59 -0500
Message-ID: <20250609220900.3035642-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that the PL011 doesn't have any interrupt connected and
can't be an interrupt provider, so drop the interrupt properties as
required.

The LG LG131x SoCs are one example of this.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/pl061-gpio.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index bd35cbf7fa09..c51e10680c0a 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -60,9 +60,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
-  - interrupt-controller
-  - "#interrupt-cells"
   - clocks
   - "#gpio-cells"
   - gpio-controller
-- 
2.47.2


