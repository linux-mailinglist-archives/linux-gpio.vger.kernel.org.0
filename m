Return-Path: <linux-gpio+bounces-27558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40428C02B09
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 19:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FFC13AF170
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9502264BB;
	Thu, 23 Oct 2025 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8Qnc4vj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ABF35B132;
	Thu, 23 Oct 2025 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239753; cv=none; b=qa62/c7Vu14x6FjoY8c+KxuYmjOHBSt+TihKd7etYfeDdk/ImlmaECRPqXr5r/+EXAg759XmXHTMp1fPpmnU3SefnNlI6wxBkX7O3clecEnjrE1mhVMWqDOe08Og0CzwvDnj91gnb/AtwYgOSiBN/utShjVmXJO0ep2gkD47t3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239753; c=relaxed/simple;
	bh=8krJmJkP2fkzNKdiS8D2ufbTvL3HdBKOFyXR9Kv21eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjOXeYDNyXJcpw6A+bhzmHnVmEQmhszvEw6XoO8NwpuuOMrfuCVJasvejheF3y5Q8MRdL3NCBQpACotkaQWaJBK7R4xRfXpz4gW5VR/ZEM0elAdwHlBnkKVLBnTlAeD97/ScJDOr9hPLwJ7afLqvVFX1DZk3+F0l6gTAPBqozE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8Qnc4vj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEA8C4CEE7;
	Thu, 23 Oct 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761239752;
	bh=8krJmJkP2fkzNKdiS8D2ufbTvL3HdBKOFyXR9Kv21eU=;
	h=From:To:Cc:Subject:Date:From;
	b=h8Qnc4vjnC19H/vx7q6ElpekMW/6X6wM7aT1L7EZDaZNmej4qDL+RNS3jeuja7qFn
	 Z1VEd99fTX2cfJcQIjXJ5yNGcHl8QN5fFgcV8UCa77ldN/0ePh++2iYWm32sxuhQmK
	 WS2fnEBpTAMWm2vEuh8CtBn929pnNrB5Lgd1utLnV7lEe/QoUiPxlgAOoCKjaZPsE8
	 T3+XerBiEZOpyFvisox+2Qqbdwk/hP3x/t16Ilyy2MS9OCMXfkLCGmQR8SuALhDz0f
	 29Gz6wnCJICYUsBhDbEXMU5AUZ+q72wGSrYCc4c4Cxlu5kFIAi60mBc/gjbCi6d5Je
	 kQPww+xMUK34A==
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
Subject: [PATCH v4 0/5] Microchip mpfs/pic64gx pinctrl
Date: Thu, 23 Oct 2025 18:14:56 +0100
Message-ID: <20251023-stopwatch-cough-47d5497be5aa@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=++Zdsq5Iw3NSsNSDAy7DrorLsGapa6A97tKCJEI+AYw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBm/kiZsED6smshaJ/HdTC7l29FTIrvFU2453W8+Nvfzz CX7dlwO6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEel8y/LM+brXUxeqS1cQV zlvfcvWZWdR3bRBTvH44o7d9ZQFXphjDf99NLcu2X4hPdv43h8vtvi2jWtf2xRImq8+myNaniu/ rYAEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Here's a ~v3~v4, with the COMPILE_TEST added, and a select that the lkp bot
told me that I was missing when I pushed it out for testing.

There's a tag below for you to pull that has the syscon binding that
gets edited in this series, since that's not in mainline yet.

Cheers,
Conor.

Changes in v4:
- add a ref to the typedef source for function and groups in each binding

Changes in v3:
- Add COMPILE_TEST to drivers
- Drop a TODO
- Add select for GENERIC_PINCONF

The binding dep mentioned above is available here:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/mpfs-pinctrl-binding-base

for you to fetch changes up to feaa716adc514fb5fbcb60b3e1620ac5dcf8505a:

  dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC (2025-10-21 14:29:34 +0100)

----------------------------------------------------------------
mpfs pinctrl binding base

The pinctrl binding patch for iomux0 mpfs adds a ref to itself to the
syscon/mfd mss-top-sysreg binding, and therefore needs that file to
exist.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------

CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (5):
  dt-bindings: pinctrl: document pic64gx "gpio2" pinmux
  pinctrl: add pic64gx "gpio2" pinmux driver
  dt-bindings: pinctrl: document polarfire soc iomux0 pinmux
  pinctrl: add polarfire soc iomux0 pinmux driver
  MAINTAINERS: add Microchip RISC-V pinctrl drivers/bindings to entry

 .../microchip,mpfs-pinctrl-iomux0.yaml        |  89 +++++
 .../microchip,pic64gx-pinctrl-gpio2.yaml      |  74 ++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |  13 +-
 MAINTAINERS                                   |   4 +
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   2 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c         | 278 ++++++++++++++
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c       | 356 ++++++++++++++++++
 8 files changed, 831 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

-- 
2.51.0


