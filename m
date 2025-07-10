Return-Path: <linux-gpio+bounces-23070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 604BBAFFE72
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335931C2340D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9952D3EF8;
	Thu, 10 Jul 2025 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwIBI4/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428822D3EED;
	Thu, 10 Jul 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140952; cv=none; b=G0mDys+D0n8romoCiDZN7svmfNigsmDKxdk4qHlKUkVXfMNIcEGTVkCOMV1eaO9q8aKzUv+Bf9+hjeMRN3Mxegk5JPYH353TuPEQyJKnfT85xCPrYjpW/0xky66ddbm7y1rHM6JCpoXH5aOS91RzmXqamvx8QHz3yAPw7eA4bHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140952; c=relaxed/simple;
	bh=NWSsCln0KszGejFwbCxlsiVAvuIVbbVcVDAQJnDvtaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRCQ94oSPKIeZakA+lm8DIjBboRyT4cjjoZebGG0GhDAZHRBkIiDa0rv5EL3C8uDC9M4vNtHLutyOAO4R8KAAByxXz9Vt5VwgFOaj9Sl+m7MAs9LOIhwN0Tw36K16ZKrahmcXtmaKAreyHBsy0Bmt/lArg1kM1AedacbagbHoIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwIBI4/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF62C4CEE3;
	Thu, 10 Jul 2025 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752140951;
	bh=NWSsCln0KszGejFwbCxlsiVAvuIVbbVcVDAQJnDvtaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwIBI4/1z/f5VPDxWwte1fJL4uYsEMoruEoYSCU+Uel0JCxIDLkq8MwfJM/K5EPsf
	 gNu3M3r5PIIXItlMbV4VAp7p2kANX3+ebKyNpo3khQpE0edOpT320vVF6MAiP61BfQ
	 G5WmyBZjdjPww2aYyS/rRkujjvi5B2pb5cN0vM0uZRMPN/pVLUWhUyuqzr9DzNHsc4
	 BUu2LnTNYhBhyJsY2XWe15QXXItZCLR+oVyio5N01p/CAjGaVrginmdLOEOA+KfQRd
	 iJJ9276sm8I9thvBpWmnBqX1QhrgnvYfPbh2NzMlkcFjuOJzMqeGrbseyc3aUaqhN2
	 2xVYr2k7txF6A==
Date: Thu, 10 Jul 2025 10:49:06 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due for
 the v6.17 merge window 
Message-ID: <20250710094906.GG1431498@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>

Enjoy!

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-pinctrl-v6.17

for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee:

  dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:21 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge window

----------------------------------------------------------------
Michael Walle (4):
      mfd: tps6594: Add TI TPS652G1 support
      misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
      pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
      dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC

 .../devicetree/bindings/mfd/ti,tps6594.yaml        |  1 +
 drivers/mfd/tps6594-core.c                         | 88 ++++++++++++++++++++--
 drivers/mfd/tps6594-i2c.c                          | 10 ++-
 drivers/mfd/tps6594-spi.c                          | 10 ++-
 drivers/misc/tps6594-pfsm.c                        | 31 +++++---
 drivers/pinctrl/pinctrl-tps6594.c                  | 35 +++++++++
 include/linux/mfd/tps6594.h                        |  1 +
 7 files changed, 156 insertions(+), 20 deletions(-)The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-pinctrl-v6.17

for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee:

  dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:21 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge window

----------------------------------------------------------------
Michael Walle (4):
      mfd: tps6594: Add TI TPS652G1 support
      misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
      pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
      dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC

 .../devicetree/bindings/mfd/ti,tps6594.yaml        |  1 +
 drivers/mfd/tps6594-core.c                         | 88 ++++++++++++++++++++--
 drivers/mfd/tps6594-i2c.c                          | 10 ++-
 drivers/mfd/tps6594-spi.c                          | 10 ++-
 drivers/misc/tps6594-pfsm.c                        | 31 +++++---
 drivers/pinctrl/pinctrl-tps6594.c                  | 35 +++++++++
 include/linux/mfd/tps6594.h                        |  1 +
 7 files changed, 156 insertions(+), 20 deletions(-)

-- 
Lee Jones [李琼斯]

