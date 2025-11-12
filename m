Return-Path: <linux-gpio+bounces-28405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48643C52CC0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32DBE4FB0B8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 14:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C89B33A033;
	Wed, 12 Nov 2025 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fh+YfXAL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472F33A03A;
	Wed, 12 Nov 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958019; cv=none; b=NNyovo+MFFs22Fe1mcTWf/jJseLf/cnpjHazuoJRWZWNWD/S04JrZZTj2PXiXhebgrW00Tf86V9XHRsNMCW8IFGuAZnU1q6vxZ1+h17wGse5gWQN5gk9m20r+3UOATS5YWNSfwxfkcdObMFc1DfE8wbnAAS75tiEA4m/1++96Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958019; c=relaxed/simple;
	bh=WCTVp6YyrZb1HeS7GoDyJOELy1+STwBon/GVCLDwpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFWZM+cF7a4A7KjlQ6ZAimUEXpw4waEAkXI9Ow6QI/AemEsC7H1jzAR4x9bxxZJmJu4HDDPIaravbe9LCyDw5pFPb/GUfoT6mp3lvV4Lzoqvw/8Lx+Vg9TsMhh+UZjPKivemKAqt3Pdq2yhub2+6o7dqjGUFvEvpAMHUOKJ1Uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fh+YfXAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ED3C4CEF1;
	Wed, 12 Nov 2025 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762958018;
	bh=WCTVp6YyrZb1HeS7GoDyJOELy1+STwBon/GVCLDwpZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fh+YfXAL+mE3UANP5bcmesum3lZsWbq+RC0SduO2zqZRYyZlxEYMKwBqNaBPOdMEL
	 7eYqa7b0eeMkKABw2NjzOm+GkbYwWane27iZW53A1eKpfoyBnkho44nE5iZln1L8fi
	 mdp5RPfPkvtZduyw0t3j8s8RpMMqUdgfoVO16xMNu8C65LlMeXO64vhbqqf+G27ALe
	 8qdUd7+03O4NO/40rf+91dQsqtsxQV2Gx2ZO8brDdI0gfJizoK9aLAHXrVzMKjeXIw
	 xsqH9NPdPBItuz1Sj7YCZw6G6+D0nsL25jZDYehdr5Tc4nAk6vxoeOOW1QJIJFEzFo
	 fi7215j67E5kA==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [RFC v1 3/4] MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
Date: Wed, 12 Nov 2025 14:31:14 +0000
Message-ID: <20251112-bungee-widget-8f7a5b947a3c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112-lantern-sappy-bea86ff2a7f4@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SYXxlq6CpuOEhhmDtAirN//eVcTIugoL6YBJ+hoXwBY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkis0w9dSuZ0uRe5G0Iu11g+Uznv32MxMMjFmKPSxYGx mj6//vZUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl4FzEyHNUImhv4bf3PWdea mDwfei1dbTFVy7DQJaLigtz1yDOMLIwMTwS9pkw4K9UYJ3vB986UB5OTnnTN2LG08mXnLe6m987 sPAA=
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
index 5d4825073fcd..380970935407 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22090,6 +22090,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -22105,6 +22106,7 @@ F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
 F:	drivers/pinctrl/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/pinctrl-mpfs-mssio.c
 F:	drivers/pinctrl/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.51.0


