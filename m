Return-Path: <linux-gpio+bounces-29128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B8C8DDCA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 11:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF85F3ACF05
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D0432B991;
	Thu, 27 Nov 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5sn5CqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3A329E6F;
	Thu, 27 Nov 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241088; cv=none; b=bvY/nLAnIFOP4bb6yqh/qbFQetYKfe3dbz/3jJ2nwLkxUXNE2VI7ysgf/Y15IDse29qDovx8pRU6w9dKCcAQSS1dLfiTE1ygD8oV4QGQMOdLJi8JP9dn6ZX0R5P8McBgWwIHuQcH7xLCK5RE8uRmMTjJJa2EVtAHpFQrKJzIB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241088; c=relaxed/simple;
	bh=bIO2ns0Jh27QYpyH3rXTMnqqiQYptMiOmAhfh6CQ0jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UsukpGPZz9p6YKSf4W3SI3rRozEpKCsty+sgk3VexIEHtx6VfnQNWp3a3EKIKbCQHXRRcYSur4NYpgcKkSR/LC9qqv+ykWMMk8LV3BxUVgGVKH5sNxDioRHlJhPuqaIn+6sYk98h6+9xGapO7PEXnHVRjv9U9cKBymeDlQ0mz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5sn5CqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270F0C113D0;
	Thu, 27 Nov 2025 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241088;
	bh=bIO2ns0Jh27QYpyH3rXTMnqqiQYptMiOmAhfh6CQ0jg=;
	h=From:To:Cc:Subject:Date:From;
	b=U5sn5CqLa/ueM7VRufod2s1L06XKOrWyD3dMy+BJSnbnyq7Vlzj5QGp2bswicxQZ8
	 XN/eODvn0y7766xIEcIE4zyTFOdLiu/PffTxocxdcdICIoDCgayArtlTG/lSXazOQ1
	 SaB7q+kEQ+djMZPvHBMTHY96BWCrGw9rpiIxvhrLyooZaiIprmX5I7c7WT9fGjnwVg
	 9Y9qtKHEsZ/UCkSaObs/s1NsSUu5SV/sIuSS2J4iY9qJ7HTSkBhb41jYgaI5u0Btgr
	 G1UFprvs9Bb/N+1QzjjMnjq05o487g62HjALmKWhUS/RRHJlp+JIKehnjEeFqfpYzT
	 53TMm5QkI/akg==
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
Subject: [RFC v2 0/5] Microchip mpfs/pic64gx pinctrl part 2
Date: Thu, 27 Nov 2025 10:57:56 +0000
Message-ID: <20251127-bogged-gauze-74aed9fdac0e@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yaOQN51mkEa+lcsi8qPvfdU9VhjQNykYsAe6VkcrHRQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkaels6MveHzT16j/tola2Ju/uXeVZ3vaYIXuj2SrNuy Yr7u/pNRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyUJCR4csmwRDbq4ErdI+e eWa8gNlh1y/NF3HPsnQbE94F1b1SAKrYPHP132UNkzlalZX0GSynMQqvPxD0qUT2SKfzlMVGStf 5AQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

v2 here, with what I need out of a generic function. I think I've done
what you wanted location wise, but my naming failed me again with the
Kconfig knob for it.

Still RFC, so ignore the lack of a meaningful commit message on it.

I didn't touch the mutual exclusion stuff yet, that's next and why I
left RFC on it in addition to ibufmd still being unexplained.

There's one @Linus in the driver worth checking out, cos it's the impact
of using a generic function to do function + group creation. Don't think
it's a big deal, but worth confirming that it's fine.

Mainly looking for feedback on the new generic function here.

Cheers,
Conor.

main changes in v2:
- bank voltage is now controllable from dt
- bank lockdown no longer controllable from dt
- dt_node_to_map callback is now a new (attempt at) a generic function
- some schmitt properties now no longer supported

CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (5):
  dt-bindings: pinctrl: document polarfire soc mssio pin controller
  pinctrl: add generic functions + pins mapper
  pinctrl: add polarfire soc mssio pinctrl driver
  MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
  riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit

 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 119 +++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 MAINTAINERS                                   |   2 +
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |   1 -
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  63 ++
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 167 ++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  16 +
 drivers/pinctrl/Kconfig                       |  13 +-
 drivers/pinctrl/Makefile                      |   2 +
 drivers/pinctrl/pinconf.h                     |   7 +
 drivers/pinctrl/pinctrl-generic.c             | 186 +++++
 drivers/pinctrl/pinctrl-mpfs-mssio.c          | 750 ++++++++++++++++++
 12 files changed, 1327 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/pinctrl-generic.c
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-mssio.c

-- 
2.51.0


