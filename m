Return-Path: <linux-gpio+bounces-30725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBAD3A628
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED24530484AB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0470C358D39;
	Mon, 19 Jan 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ps6pk6Cw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD9276050;
	Mon, 19 Jan 2026 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820666; cv=none; b=spZBTftFxRhVrGyBIfMQa2e/MSK3q5Lls/oULzZVvao3qPrqK0Bh/7AcCiykf16UaKoocbTK6VcXRslqHfN2spmYlf0ATI2oQ627YLfvszu8AnoPNm/OIvNkBW2l1s22pFLxfgDaqI2eOtREkn/rxcz5cZjE7YQb+4mcvp7siIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820666; c=relaxed/simple;
	bh=MR1PewTGnGp+fP1R8iq0n/khc0hb/z+MoOgdKDHz3dM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWOhQWNxaYNCkQ8GckRTb/nHhVwArKLRKKn5HKbbQYCKBqdVJOF+jcBDkSeAkT+kiEtp8kUVXyHKGpVTNlp6NrYxQk9D9WKwkmQxLC+/SanncPy3W5VeCm3W9cxbJksT9XuJsGwsj6hLB/WVmXNd5VGHCFMjfdJZqsguUmnkLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ps6pk6Cw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB6BC19422;
	Mon, 19 Jan 2026 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820666;
	bh=MR1PewTGnGp+fP1R8iq0n/khc0hb/z+MoOgdKDHz3dM=;
	h=From:To:Cc:Subject:Date:From;
	b=Ps6pk6CwvQvFXEFUzFsmV1pXameQnYwhs6Bwp4H+y44lT1S18fWy5EBFxHIHmMDrx
	 au3/ALZLiaU6V643OpU27/+vyoLZHF7h8AnA/1K6D2AVX+C+6HTgDr4mo+LHb9hwGi
	 OW9stYDCoPUHhbJSrVFlGR5cf6Vc5b3UbsTYqF0cq61k7xzqtd3LF7k/Sb+9hAhMq2
	 PNCPa0hCFk7oFJMwtpvZZGw3pzBdCcFo7F6JQEI2WDPajJa60mhMQEUA4kOrxKXMQA
	 e0ck6R6sG0oa5xwUk07rOqvPNPWBqnpCBdtyrqqMF6hkTdAdrPYwHlNxfTyo/aG/YQ
	 m7qHLRx+Tet0A==
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
Subject: [PATCH v3 0/6] Microchip mpfs/pic64gx pinctrl part 2
Date: Mon, 19 Jan 2026 11:03:51 +0000
Message-ID: <20260119-rearrange-germproof-3e3096cc0da4@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2923; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Sd0pRUwsLZKvCSYByTCo6AUVIZc/dJjlRt45iBmxsjg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/Gus/hX0ChiZTnCd26QhKDHvwbS9xSsTCl2PzWyya ElOv7qno5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhMGZk2LBpse+UL7Mfn40S 2PF+443/rV0Xr3IwvI+4YdTzfAbXtXmMDLO+HWJnm3ri1MqWWyvX1Syu3v/TjfsWw0fXtVdqJgY fCuEBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

v3 here, with the rfc dropped. I've still got the property checking
stuff in my todo-list but not tested it sufficiently after the changes
to add generic string properties yet.
I only moved my drivers into the microchip dir, I'll come along and do a
pass on the rest if you're happy with what's here.

Cheers,
Conor.

changes in v3:
- drop the todos
- rename the kconfig symbol
- move my drivers into a microchip dir
- use power-source instead of custom property

main changes in v2:
- bank voltage is now controllable from dt
- bank lockdown no longer controllable from dt
- dt_node_to_map callback is now a(n attempt at a) new generic function
- some schmitt properties now no longer supported

CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (6):
  pinctrl: move microchip riscv pinctrl drivers to a folder
  pinctrl: add generic functions + pins mapper
  dt-bindings: pinctrl: document polarfire soc mssio pin controller
  pinctrl: add polarfire soc mssio pinctrl driver
  MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
  riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit

 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 109 +++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 MAINTAINERS                                   |   6 +-
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |   1 -
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  63 ++
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 167 ++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  16 +
 drivers/pinctrl/Kconfig                       |  25 +-
 drivers/pinctrl/Makefile                      |   4 +-
 drivers/pinctrl/microchip/Kconfig             |  19 +
 drivers/pinctrl/microchip/Makefile            |   5 +
 .../{ => microchip}/pinctrl-mpfs-iomux0.c     |   8 +-
 .../pinctrl/microchip/pinctrl-mpfs-mssio.c    | 737 ++++++++++++++++++
 .../{ => microchip}/pinctrl-pic64gx-gpio2.c   |   2 +-
 drivers/pinctrl/pinconf.h                     |  16 +
 drivers/pinctrl/pinctrl-generic.c             | 189 +++++
 16 files changed, 1343 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/microchip/Kconfig
 create mode 100644 drivers/pinctrl/microchip/Makefile
 rename drivers/pinctrl/{ => microchip}/pinctrl-mpfs-iomux0.c (98%)
 create mode 100644 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
 rename drivers/pinctrl/{ => microchip}/pinctrl-pic64gx-gpio2.c (99%)
 create mode 100644 drivers/pinctrl/pinctrl-generic.c

-- 
2.51.0


