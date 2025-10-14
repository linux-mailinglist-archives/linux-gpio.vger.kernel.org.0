Return-Path: <linux-gpio+bounces-27111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C92BDBDA168
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E3C58092F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9353019B5;
	Tue, 14 Oct 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swn3LehJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBE2FE596;
	Tue, 14 Oct 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452602; cv=none; b=fUZGbkrv7Dd4c3+FAJCee2nBf02Qj1/OfGL1P9b8DWuEkYGxuX68zMv0qoWL0oK5mOeMnD6a/pISVbRWnI2QK3gutAog4wXpJeJ7HAw+oehXPv9CrARKNZlnk4XCIJf3Wem/q0XFjzzS0zopRTSgCBPUueAy3Kn4ZlP25gkk9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452602; c=relaxed/simple;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKZbpGfOdtp9uwB1NtzeI2akKuZctz3osrZMg3Vlf8sw0u0F63PbqN42YZV9SUjNjhhNydKtGFvZg07t4SClmdi58GU9uDODcmZJ1uOXNMTFAwsg/UgCwF6vruKry9VU2FJclSjSDPssj6yrLTKdzzCEZb8v1WHlz/BIwVUQe2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swn3LehJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99057C116C6;
	Tue, 14 Oct 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760452602;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=swn3LehJrqT0c7nIAWnLW/jAzqBWGoz5dyB8RvEiyyvhMAwkJqe4aHDQXeYsXHILW
	 viGXdx3Pzxqi1WXX6s6mSdsbRq4IYAFm0k6ghHvlYIWR1tTzFWWazAnUIKpQN4AMPA
	 WGbMGa1wUgEEnUFZTssxoYEX3UN+JlfgYwRJa2zkMd371OOok1BEkuFTBC0zv9AbO0
	 3zBrBbjgaU2cGLOQAH9gj4gC3GY4/5gyeZqKwEywckE5YS8WWIxcHGZVyng1rAU0x3
	 QtmWyhFhO8/GHN6lEvRz9TArrqueISRh2DNk4WNLctzAecnzWln6DtPDKI5qfdjjTN
	 Xago45G9pIYlw==
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
Subject: [PATCH v2 5/5] MAINTAINERS: add Microchip RISC-V pinctrl drivers/bindings to entry
Date: Tue, 14 Oct 2025 15:35:38 +0100
Message-ID: <20251014-lifter-booting-454abec5c5e6@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-retype-limit-e6cbe901aa07@spud>
References: <20251014-retype-limit-e6cbe901aa07@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yIOJ8zWE39Nk9VFv1VjhPf9MABofVWCX3ryvpaofjMU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnv4s+1LUi+NPmhavWL+U/faq/n75Pk919yPGzaW5e3q /aZ5q6Y1lHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICbrMzwh2dlhMO/JWJW4vIV qw17DDmPH+1y3rz/NKeYkUjaG7fEREaGb7c+/2rao+uekPJHoSR4xfMlmubNn9NOvco5ty/g1+a rbAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add the new gpio2 and iomux0 drivers and bindings to the existing entry
for Microchip RISC-V devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..5d4825073fcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22089,6 +22089,8 @@ F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
 F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -22102,6 +22104,8 @@ F:	drivers/gpio/gpio-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
+F:	drivers/pinctrl/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
-- 
2.51.0


