Return-Path: <linux-gpio+bounces-28402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4AC52C63
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AAF684E66B0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA942BE649;
	Wed, 12 Nov 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNgZdVxi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED129994B;
	Wed, 12 Nov 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958012; cv=none; b=bIr4PZNZ8LXM/h/i38AOLUbQM+67Uqdoo3yVPCNetdlFGtZra5e4Qyn9lZlNf7uGqOVoWgjZIdtXetDvHvYeN3hFKs+Xz8biYYnYc3CmNPvC0SAg7mEQOBi3JEjyjhZWXAbAnCGF9HlfA26xX4CtzuVqB/qUNFNTavOEEkYwBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958012; c=relaxed/simple;
	bh=zXxI3FqeSkTRITOi/RL3nGGOpgP4rbuUdF40sCgH/9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KnFd64HeCA8sO/YaSbqsSAdJfl1ATpaFdtTEXKV0y6750Kh1oDe1cbwbK43j1MkVrulsAHbtVIYsLw3Oh1BRFouRPNUaAJLinyYvpz7DTT0VM7T6e9uBYRJ3tsGmahOrRtKeuDXNOCV4QjHKNB4+aIvgFleISqu/jmVjZmlZYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNgZdVxi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43679C4CEF1;
	Wed, 12 Nov 2025 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762958012;
	bh=zXxI3FqeSkTRITOi/RL3nGGOpgP4rbuUdF40sCgH/9s=;
	h=From:To:Cc:Subject:Date:From;
	b=FNgZdVxin7z8t5J/QdIY/8ZHCvhuK4ZiqZeo8LmgaJuWAMvl2AJkQAjCGzv2tjnAk
	 M29pMS0qR81xhucYC5NAIMiPnp3wv2kgp9D/Bj9CfwxkgxoM5YPGbhn6ZCnP4ED5qZ
	 SAzsiAPl0HMD/AdOVYCt5ykB+sWCmzwV1lEiH564kgmF4EMTY5fiL64N1QHXqOOCsY
	 r/iIEgKYBY3hv8IQjcxUrwTmCxAb+nhtcIUkjFvUutUljjglsAVT9Y1+SsqhKb/ba2
	 UqDf85Qdv0MyJFTWtYaKcHoBd44/v6nmjccEQ+c2hP+2I6iAZo22mb3Vm47QA2vZg+
	 0T9fSW7pW8CfA==
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
Subject: [RFC v1 0/4] Microchip mpfs/pic64gx pinctrl part 2
Date: Wed, 12 Nov 2025 14:31:11 +0000
Message-ID: <20251112-lantern-sappy-bea86ff2a7f4@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=l8Hcgb9TCTFPGf5m4PIu9DI8n6QThGEFR5TbMhDysFs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkiswzP7v5SeiroibvTntLGOScNV/KskVx+76zrW4Gig JmH1zhFdJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiCXwM//McD50KrZVcy8Ly 2bHf+DarmNFSs4QLwivLp2+rdquo+8bIsHMHj8bff4aPQz//szoyM171R8X2V0Edc/2W1Nxlk5a /wwgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Got the other driver that I was talking about here for you...
It's in RFC state because I'd like to get some feedback on the approach
while I try to figure out a) what ibufmd is and b) how the bank voltage
interacts with the schmitt trigger setting. Although, I am pretty sure
for the latter that it is not forced on for low voltages and that the
commented code should be deleted.

There's some specific @Linus questions in the driver, mostly where I was
unsure about how config bits should be handled and looking around at
other drivers wasn't sufficient because they did different things.

Finally, on the dt side, this was using the pinmux property before the
other drivers were submitted, but I didn't really like it to begin with
(shoving two things into entries of the same property gives me the ick).
I moved to using pins + function which at least looks prettier in the
devicetree. I had been hoping that I could move to some sort of generic
dt_node_to_map function, but I couldn't figure out one that'd work
without creating groups in the driver. If there is, I'd love to get rid
of the custom dt_node_to_map stuff.
I want to avoid doing having set groups, because of the number of
possible configurations in the MSS Configurator FPGA tool is fairly
large, and I believe that MSS Configurator actually undersells the
number of possible combinations for ease of use. I haven't tested that
and the driver technically doesn't support it, but I feel like not trying
to define groups statically and using pins instead would permit those
combos in the future should that use case ever materialise.

Cheers,
Conor.

CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (4):
  dt-bindings: pinctrl: document polarfire soc mssio pin controller
  pinctrl: add polarfire soc mssio pinctrl driver
  MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
  riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit

 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 108 +++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 MAINTAINERS                                   |   2 +
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |   1 -
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  63 ++
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 165 ++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  16 +
 drivers/pinctrl/Kconfig                       |   5 +-
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-mpfs-mssio.c          | 798 ++++++++++++++++++
 10 files changed, 1161 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-mssio.c

-- 
2.51.0


