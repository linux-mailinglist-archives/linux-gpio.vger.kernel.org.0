Return-Path: <linux-gpio+bounces-14430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4119FFE51
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7FC5161CC0
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DDD1B6CF1;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcu0Q0P/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F11B4255;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=sIuU79GcPpjCAgo394zuojDF7xVxrrKDbtbjsmF/VdRrOfVxwXu0EK6SH6XkwHp3JU+j7Ifl1TdxO6k0kFgrVrT/8amZGifomtz99lHjIZ8eQScvmjkn9JYL0kRLZniG4hwqShl29p8yWoXBeFHP5APZGNmiD8jVnqhGu3V+dTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=3L9qpZcgEGcLXesRfvFJOqr7gB5IE0nhAqMyMONojog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQJc6wPFjqRZW47Uqwy5EoYTGKL5VxpgPuV02wSbDxtWJerXPAm8VYq2D+nTN9o1PYGFJ5Ex8iCTu/Gr0ymTiOM7kSckdt4V+GRyGxndQ2vzpPLXICK44H9sYW/r4ouKc8Er0uIo7u8nPsdOQCsm3b8+49M0/WOs7fTFkjAvcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcu0Q0P/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85A52C4AF52;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=3L9qpZcgEGcLXesRfvFJOqr7gB5IE0nhAqMyMONojog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hcu0Q0P/wBUdT6HpbQlaDCfX7bwxV8g11fqiteHBH0kbW0INFwcPYoBF1d2Jk935i
	 RkxIdbleO9GNitiLV/TYmbrmhmgRZ/9msPgC2qh/zEH1dQa2pPoA5cWOU+TyKzn2mG
	 mg2t8HOE4B6/xEC47JTSC8vPGAFlgJM05eFxvg2jUv0bx0srkCbKi9Spl1D6XN58vt
	 Itwbm9OxIBhehmO2T3g3dxZLTC6h0/Z0Bs7xbTxGDwy29X4R8K2VCtZ5V+W9JjlQ6B
	 Co+/QGBTw2QIvovH9pjxzHUW3RG10/tNTiTfyNxuhBNrt6suDo8pids1/7idtNe72Y
	 LRMT4pKiqoe3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7918BE7718B;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:55 +0100
Subject: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=1933;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=+IqpHh5XW/bYptAKTy7ofbzqqjbf0TgTP59VXCoHzqo=;
 b=9e/ltqkhbkqoYmAvt8DHPwJqvqjwqUwV7mVFU5GYMkehfc+vd97JJq/T1F6hT+F/IFNl9WZQ3
 aOurraZE/mLDNmRzKchRUir6Kg4EjKmgIvfmKynORihXWTpBQ5uGZnh
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Quoting from drivers/of/platform.c:

> of_platform_populate() - [...]
> Similar to of_platform_bus_probe(), this function walks the device
> tree and creates devices from nodes.  It differs in that it follows
> the modern convention of requiring all device nodes to have a
> 'compatible' property, and it is suitable for creating devices which
> are children of the root node (of_platform_bus_probe will only create
> children of the root which are selected by the @matches argument).

This is useful for new board ports because it means that the C code does
not have to anticipate every node that is placed directly under the root.

As a consequence, the of_bus_ids list can be much shorter, and I've
trimmed it to the necessary parts:

 - device-type = "soc" and compatible = "simple-bus" for the SoC bus
 - compatible = "gianfar" for the Ethernet controller (TSEC), which
   may contain an MDIO bus, which needs to be probed, as a subnode

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/platforms/83xx/misc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb1429233355f668fc8563d8ca4e2 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
 
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .type = "soc", },
-	{ .compatible = "soc", },
 	{ .compatible = "simple-bus" },
 	{ .compatible = "gianfar" },
-	{ .compatible = "gpio-leds", },
-	{ .type = "qe", },
-	{ .compatible = "fsl,qe", },
 	{},
 };
 
 int __init mpc83xx_declare_of_platform_devices(void)
 {
-	of_platform_bus_probe(NULL, of_bus_ids, NULL);
+	of_platform_populate(NULL, of_bus_ids, NULL, NULL);
 	return 0;
 }
 

-- 
2.45.2



