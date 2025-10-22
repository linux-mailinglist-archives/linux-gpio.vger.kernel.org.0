Return-Path: <linux-gpio+bounces-27430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C13BFB534
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 12:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E8A9503041
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 10:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095CC31A54A;
	Wed, 22 Oct 2025 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsPsk/xz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CFE3164B1;
	Wed, 22 Oct 2025 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127826; cv=none; b=AUJ1Hw8qbHWXB5dlHbzCJL3mFV1SRbyYM7PFHnlHm4UsEY95oGliR0KXpDn7vP8MvVxUdfO75yMEsgd9Cc96gcjn6D403uJoxCJqdESKQNQ02c5CzG6S6cMRT/UwioSKgge0S7n6Wrbj+s+nJ9+eD4bw0bWz0hHd4IYqwVYsdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127826; c=relaxed/simple;
	bh=KcpHIh2NiJ8Pm4+tZb/r09mFVlwELwD9hRpxdQwhsdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyQF5Y1qYginUojQj3dsvOy2CJFSJieukSr4NUefacchGi5GGxYwNZBQAtEABGvUrngHtV8i9DfS+u3Ipl7jDW369PXnX8XzMLNhaHQvDE0MBHZZV5b6F+EDDrPTBCWGxEsAuazsUStlzRHcaRPVb+2bAl+UZHAsBrKgNzkXckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsPsk/xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF8BC4CEF5;
	Wed, 22 Oct 2025 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761127826;
	bh=KcpHIh2NiJ8Pm4+tZb/r09mFVlwELwD9hRpxdQwhsdA=;
	h=From:To:Cc:Subject:Date:From;
	b=MsPsk/xz7Wb9JzTJJpillBjCFymCN/4sxSbdvQiq974dH/UiZlIFkFtXifMZ+YaCk
	 tP46iYXuraFNTb/mMMkY6sv9fUwifZxVkMIzWS5jBBPRMy978EZWk+Z1SApuZq5czd
	 EEY/zJauU2wBIbSLTuF8RjM4iywmGns/hR2KWB+r9sLur75SE6uqWyhxVV38RZK9cn
	 4zKbW8vf6m3M4EPgVdh7Alb4sXwM+VcTHTqSuBDIBibyowFvLto/9ijkEjAhNGzaam
	 v1wQorFJDxHYkesMN7b7RLM+srU7nULor8MZkpVxzLGkayrdVPWpKLCR2Ax6hy4Kki
	 VnQ3a9XMkvTCg==
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
Subject: [PATCH v3 0/5] Microchip mpfs/pic64gx pinctrl
Date: Wed, 22 Oct 2025 11:09:08 +0100
Message-ID: <20251022-dash-refinance-ac3387657ae4@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=daO8WkZ3qWEA6XQ9SEdpimlvNKc0kNZUUmrQYnrz5cg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBk/1rop8284+Wd3Qurh+HkJn9aGZ10+42b/+/+szkIei WfXwuJsO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRq9YM/9NkGsPs1igvfD/B UeEnQ59d+6UZMVmqN39FyblXCdZVfGVkWHeKUWbn5AM3FosxtfPpfAyal7muJPvipiDt3J13C98 9YgUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Here's a v3, with the COMPILE_TEST added, and a select that the lkp bot
told me that I was missing when I pushed it yesterday for testing.

There's a tag below for you to pull that has the syscon binding that
gets edited in this series, since that's not in mainline yet.

Cheers,
Conor.

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

 .../microchip,mpfs-pinctrl-iomux0.yaml        |  88 +++++
 .../microchip,pic64gx-pinctrl-gpio2.yaml      |  73 ++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |  13 +-
 MAINTAINERS                                   |   4 +
 drivers/pinctrl/Kconfig                       |  16 +
 drivers/pinctrl/Makefile                      |   2 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c         | 278 ++++++++++++++
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c       | 356 ++++++++++++++++++
 8 files changed, 829 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

-- 
2.51.0


