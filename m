Return-Path: <linux-gpio+bounces-30730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77961D3A642
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B7630CBC7A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D1F3590DA;
	Mon, 19 Jan 2026 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvHzBiO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61753590CF;
	Mon, 19 Jan 2026 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820680; cv=none; b=Kw0I1aCQ2wJnuUa7QlFGX0g6Cklh+9cCjBsQDEYoV1rBp0ZDaBSzJdamGc22fkSGhyfgJiVAcVAT4HM/wYGsV2dk+9sjczWk6KP2aEWGoe07NJcJ/NGTEb2fS5gKZ22E3kx34Cf6MDPpdAHqJQTDBqMqDbsgNAvPtZR0UPx4JkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820680; c=relaxed/simple;
	bh=rOKk2X1qHw/UTNmPSVO4s0+3RfiIi4Jxi07TQreLKvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPom8nkgf228yq5RvpaUplHC0pFy+8g5V6bShzifTyx3QxaBIRJyaTbEEchn1YEglxAdbI0vLVzGcqi2s33bCI9Pkhw0HYjkR2VQ/4hFY6+4J51yfv7ozxULQJDNkKPt83/dJAZU1ueXORASQRFHtnKEYdGL0bWCTcQzAG6IVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvHzBiO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BBFC19422;
	Mon, 19 Jan 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820678;
	bh=rOKk2X1qHw/UTNmPSVO4s0+3RfiIi4Jxi07TQreLKvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvHzBiO3fznSWeRmCqYCzXSXyFmiYC6xBdlLwYqB8vts7v3SIEk+3GUixgO6WILGj
	 ACEHFmONDmtfOcyA6r+HNcdLVBPUOTy5JSkqJcISdXZN8iUFPlV4rJB2Iq7MXToDIe
	 truMkj2B4eBQN9+Bzdo4C++10IHHos262d6G5IbVel0ZhvwQ2/wXW+VPZygqYZahqo
	 /K6XE0F/XpPhv8XRIANW6MnPhcVd6J8NYUyvUZid0QBQT+QGDxeyd5INTSxseCyK3+
	 4t9qQyWLDY81BB76QmzCS7NfuJ2VrkNshIJxeA3hH3zQk2bR1vp7BkuTfdQG15S6Te
	 2SAsfVQNo7gKg==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 5/6] MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
Date: Mon, 19 Jan 2026 11:03:56 +0000
Message-ID: <20260119-elf-opposing-759cfa85fa1c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CgMQItntxM8Yf+X3K2Sq+0/VecyITjE5TqmhE4qUdU8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/BuvLpQLeXFo0TuFE+z8Ozc9qPsf2DYp67bG7deWC 6oufJHl7yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE2BsYGSaWJGxYd026Tpzn 3P/PWnHCR/VOfMxM3fFfb7fAmSVJrs8Y/gffm7jh0WQGLavm1XIvn73I3SD49+En/y6XViXvP9X qzhwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add the new mssio driver and bindings to the existing entry
for Microchip RISC-V devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff6084cb5797..0cb24094aa1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22458,6 +22458,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -22473,6 +22474,7 @@ F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
 F:	drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
 F:	drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.51.0


