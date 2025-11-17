Return-Path: <linux-gpio+bounces-28603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07029C65010
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 17:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1E0D229023
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183E51FC0EF;
	Mon, 17 Nov 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwCsuJ/4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129B284669;
	Mon, 17 Nov 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395203; cv=none; b=GYZbJ0EDAPcHbcHOGaF5doE5Uj0p63QCN/Spg4V24/KShFA9RSYGIWMnK9EqCmSwC7MBGhxm7drvJqWqnJTiXcSmVLAuTfJFUmLsk5SWtxH4/cTW3+FAn55IAisn90RzQQpTuyD87qvA0PrCReetas3ZjBL0IQMiTbDbb7L0E10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395203; c=relaxed/simple;
	bh=4mldTrpNfDBUNb10bIu/HKmz1c+0kq9vpFRlKYSObhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFq04uMV6bL8p4pqBPVM7TWK+lf5+bVVgczbEH/B0Cl3qyYGiCylFfHzEWI2wlEHG3l6VaIfDz+kchwUXWDB2cWLsQW8jw+MMj+wnJ2MOEMoUrmPvpF+E+IP3zE5Okw0r8n1Tv04fQR0qgoFM0dSYz69/v6rg2K28OgRsMCS3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwCsuJ/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C7C19425;
	Mon, 17 Nov 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763395202;
	bh=4mldTrpNfDBUNb10bIu/HKmz1c+0kq9vpFRlKYSObhU=;
	h=From:To:Cc:Subject:Date:From;
	b=kwCsuJ/4E81FYWxB8nhIpUh98cGRHXdkaivmeqCeFwzimnMDyucuUDCBGwnjff6nc
	 6aMpYp939HTLPDOiKMAgSoz4Kf9VBqOxHbC/YCVXexBa5ZHUEjc6KjNDtcmHolXquj
	 snq5mYN0o8C62kQV+JSgEW3K+C6zUDnbi0ohFiTCL9sv53J13GO3nyKJY92nTamckl
	 ESVl0CEcvv2G6BuIsRLGUxqeGzQIzX50FfoRVZqbgkGfWkM6O85q2NiayVJvbXvzcf
	 JktQMrF9XM9nFGDBiakDEr2E+lUWwg2UzrJWzORpQ37Q2Ht5YyZbnQdQYOAvBxyXWn
	 G0hOwtandKaww==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
Date: Mon, 17 Nov 2025 15:59:18 +0000
Message-ID: <20251117-grumbly-oversized-2215fe887181@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vBFHITy0tUgA8hiGFkPbCnmDy5W/03hkEl85M76mBwU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSbiHV/7SuHgz+9H7m+iV3CnfFfHtx75zaA+Vts6c4T Miq3ZpT1VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJvOZmZPjskn6NIYEn+8ni ZPP6xD7W/w7nTTbNspuXfU1F8bMl1yKG/wkSK6Z6JJ0QODEpWeG1gF1KrtTECb29a1Zc3W0ScWX DMWYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
fallback.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

The diff here is kinda scuffed, because for some reason this binding had
an "items: - enum" construct to begin with.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d78da7dd2a56..184432d24ea1 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,7 +11,10 @@ maintainers:
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
       - enum:
           - microchip,mpfs-gpio
           - microchip,coregpio-rtl-v3
-- 
2.51.0


