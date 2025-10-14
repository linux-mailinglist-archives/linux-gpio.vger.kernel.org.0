Return-Path: <linux-gpio+bounces-27106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31091BDA0F0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCDB19A1F13
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419153009C1;
	Tue, 14 Oct 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgCD/UXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45423002CF;
	Tue, 14 Oct 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452592; cv=none; b=AmchrYHkeIq7TYMMJVd7FKX1HG0S3BmsKYR43yjXbXQ6etUgcNKmg2FfPQsV9kGkUX+wHDd99hm5NNxTIqtPmGAuq1zv040tJX4VocQmqcUc2H8X8tLpDwh2AIPHOlzGPr/75XWozW/2miHtPLVlPyQhzkaaqHuQ2a+2qSZZzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452592; c=relaxed/simple;
	bh=CXJIb47qjvL1os6NZGukfyQqPMkQTZckFnpfkwrlrCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNXxjEiZYAzkOCmec0e+8I71iXrhMpn9ZbwWz3SAkatPMartLhb4RkGr7WOxGzAMeU9jIvZATNvPkJB5q/tqKwoyBqtS/ngEKrYQF5T9JMrY2iZGGQaK+z19rrASiCOCZGk7ILtdRXLYiR9jcWgTvqO9AG1Pzhb4EgD1CJwXAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgCD/UXE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85646C4CEE7;
	Tue, 14 Oct 2025 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760452591;
	bh=CXJIb47qjvL1os6NZGukfyQqPMkQTZckFnpfkwrlrCk=;
	h=From:To:Cc:Subject:Date:From;
	b=WgCD/UXE52eTTd4ak74JrtlM9GfbI/tKTmAnESN4yAGaYd9AUN4lj5bcy2ObiBBKM
	 7a0Kh55Ep46Bt9e0K5X3slhnmikQttYkbLBItOKL6tLyBJ04675TKBIwc+raUphd6V
	 uqST1lOdSVXIVvaFbxZ5wb350XSnxIXEH1bCJKP0U7TKFYnC0EI02J1cKG234IV6jR
	 JHnLrsI/NtZhwgcwtQFWtBTOXYlTez1pcvfjAz9rqdf41BS+5nLPmzNcC2UGZm0Xgn
	 P3yam5UIiKSKo3DTQaHYPuGaTxJF2u9vrYx8bo2JhVcy0mOWqdyxp74DE74Q5s2tLD
	 DSrVMWprbL/lQ==
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
Subject: [PATCH v2 0/5] Microchip mpfs/pic64gx pinctrl
Date: Tue, 14 Oct 2025 15:35:33 +0100
Message-ID: <20251014-retype-limit-e6cbe901aa07@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2396; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Ui2aesXem31ZXmaUFi/+2FfZKEA0ExeZLnwmEAVQraQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnv4rc6TJnNcWj9i94oltcCnU+d993JedW149y9OL0Xc ROq09U1OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRvl6G/8VvBRV9T2+b4szz 9PTnVU8nFITKpnYyC3vNaHklE6NdE8TwzzZ1p5bT4Tchn14HZlx/mKiWnVds2SU16zq38yUtjSe NzAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey folks,

Following from my RFC recently [0] I've got a v2 here that's implemented
the change from using the pinmux property to using functions and groups
that you asked for Linus.

There's some use of macros to cut down on redefining groups etc multiple
times that I figured would help me avoid ADHD mistakes, but I can just
get rid of that if you hate it.

I'll follow this with a reply to the gpio2 driver with some comments
about the noun use that we discussed on Monday Linus.

I'm not expecting this version to get applied, and it doesn't apply
right now due to a missing dep that is the first patch in [1]. I maintain
that binding directory though, so it's not as if we wouldn't be able to
trivially figure out how to deal with that anyway.

Cheers,
Conor.

0 - https://lore.kernel.org/all/20250926-manpower-glacial-e9756c82b427@spud/
1 - https://lore.kernel.org/all/20251013-posting-alright-8f945a4bebfd@spud/

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
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   2 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c         | 278 ++++++++++++++
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c       | 357 ++++++++++++++++++
 8 files changed, 828 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

-- 
2.51.0


