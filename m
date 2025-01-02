Return-Path: <linux-gpio+bounces-14416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8629FFE33
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E503A216F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6386C1B394B;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPF0n5bo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D36FB0;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=n5L//Fv14H9qP4u2CoS6eOr+lOKKf7pXPGVGE9wBc95bUxGUfiyzK+e05aQ6IuzGso1Tgdg5s4ybfSXkSbG+YmQCG3v8k2vzg+VKXIFv9U/OxKpThYrGMwz/UJa/l5KpsS0abtJfcC0K6923f6TFpu1uAfdeyijMwvN/tbmEZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=s9KOsJHPX8mNPryGVyICWhP1YoIx1vF2Sh4FXkHLgpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WzBFhB7z+KOHVKKJjPi1OswRpFV8HeK/+p4SG/bFgepfjgWO2kjaqdOUNeyd5R8HJS2pkBVbXony8U0wlvuIGG0C19mJaYnuWzrxvEDBbggoj52nAyCD+ovjdYgR2OHJP+URIwvmPnjP3TbdgYdBU9u38ErojEVUGFz46EfPDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPF0n5bo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B63C4CED0;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=s9KOsJHPX8mNPryGVyICWhP1YoIx1vF2Sh4FXkHLgpk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VPF0n5bog8EFSaleFqb29oS++uwCjDIC7BwSFHDdXrkqJN2+jG3LoltSY2RYFi9fa
	 CUzxHsSZeeA4rreNpI48kKsdLO8HP1thzglWCGB9WWKlzwz9PMJSSmMDR36YE2pDmC
	 5APjLf8DXx74N5qIip/kwZphKJbC0IIjS5O1wuoTMm9lccsXVWjfW/s2lfx7jl0ixn
	 Lqt5GHpPTYH3dxN5l4EGzbBU/vcmZmIcOAE3jFWx/X6DIAFRwuZl/aUKQhOkMkw4sv
	 KFlKTpJOUTdzYPjj6wmBlKfvYnctUygK+EOFFohYSclGNFtBarHAfpmGyHWfM9z3A3
	 +Oco9ypSnykRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82451E77188;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 00/19] powerpc: MPC83xx cleanup and LANCOM NWAPP2 board
Date: Thu, 02 Jan 2025 19:31:41 +0100
Message-Id: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI7bdmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI2ND3dyCZAvjigpdQ/NkC0uLRBNLExNDJaDqgqLUtMwKsEnRsbW1ALn
 E2NdZAAAA
X-Change-ID: 20241231-mpc83xx-17c898a49441
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2877;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=s9KOsJHPX8mNPryGVyICWhP1YoIx1vF2Sh4FXkHLgpk=;
 b=Yes62fmOx2x2qZhQDLO1dreJSQZiMF9f1nnFMaGDZeK+FBloj2U8kviImy+hqs0K4bJ17FFXx
 oLI8tgG+VsmCNh41LCNbnc+oAla8AExIhxUWOPTE8qd9z8vIciFRu5Y
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

This patchset adds a devicetree for the LANCOM NWAPP2 board based on the
MPC8314E platform, and slightly modernizes the MPC83xx platform support
in the process.

This board is nominally end-of-life, but available to hobbyists.
A U-Boot port is also in the making.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (19):
      powerpc: Generalize MPC831x platform support
      powerpc: dts: Extract mpc8315e.dtsi from mpc8315erdb.dts
      powerpc: dts: mpc8315e: Use IRQ_TYPE_* macros
      powerpc: dts: mpc8315e: Add labels to peripherals
      powerpc: dts: mpc8315e: Disable peripherals by default
      powerpc: dts: mpc8315e: Add missing #cells properties to SPI bus
      powerpc: dts: mpc8315erdb: Add missing model property
      powerpc: boot: Enable FIT image generation
      powerpc: boot: Build devicetrees when CONFIG_MPC831x=y
      powerpc: dts: Add MPC8314E devicetree
      dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
      powerpc: dts: mpc8315e: Add GPIO controller node
      gpio: mpc8xxx: Add MPC8314 support
      powerpc: mpc83xx: Switch to of_platform_populate
      dt-bindings: vendor-prefixes: Add LANCOM Systems GmbH
      powerpc: dts: Add LANCOM NWAPP2 board devicetree
      powerpc: Regenerate mpc83xx_defconfig
      powerpc: mpc83xx_defconfig: Enable NWAPP2 board features
      MAINTAINERS: Add entry for LANCOM board support

 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/powerpc/Makefile                              |   3 +-
 arch/powerpc/boot/Makefile                         |  11 +
 arch/powerpc/boot/dts/Makefile                     |   6 +
 arch/powerpc/boot/dts/lancom-nwapp2.dts            | 276 +++++++++++++++
 arch/powerpc/boot/dts/mpc8314e.dtsi                |   7 +
 arch/powerpc/boot/dts/mpc8315e.dtsi                | 390 +++++++++++++++++++++
 arch/powerpc/boot/dts/mpc8315erdb.dts              | 327 +----------------
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |   2 +-
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |   2 +-
 arch/powerpc/configs/mpc83xx_defconfig             |  41 ++-
 arch/powerpc/configs/ppc6xx_defconfig              |   2 +-
 arch/powerpc/platforms/83xx/Kconfig                |   6 +-
 arch/powerpc/platforms/83xx/Makefile               |   2 +-
 arch/powerpc/platforms/83xx/misc.c                 |   6 +-
 .../platforms/83xx/{mpc831x_rdb.c => mpc831x.c}    |  21 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   1 +
 19 files changed, 769 insertions(+), 345 deletions(-)
---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20241231-mpc83xx-17c898a49441

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



