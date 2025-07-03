Return-Path: <linux-gpio+bounces-22706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6BAF7251
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F543ABBB3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE0F2874E1;
	Thu,  3 Jul 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geBbCfz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173F1BD4F7;
	Thu,  3 Jul 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542324; cv=none; b=m1SV8Fpc/hIMjyjj8aC9YhTT71cYeg5O5XfQmRgIauQXrngYYvB/xcZW0zZqJ3YgVTTJOVUoyGYJs4p9OmGl26y1wUWRumBVPl/mSfiA2psninpALxNWqz6a3uQXSWu3qr0oT8x3aYicLJY6Dt/SayHt+Lqwv1ztxmohjhsDgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542324; c=relaxed/simple;
	bh=wzQZ6BxFT/0DZ7LabLhcVgcpyOzEp2kAoXYH0G+txl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ubw0JYRGGzEGfRaYLUQc0KAudIlYBrHlkV4SslNgVqP/EQpxWU5MeJVQnQXT/tXRAkUV+PSADou4COK+9fPcZ1Qb9zhpnPjk73mR37a/dL9msjLCVVMOxMz/TEEud6p4ziG4G2aZv6Nk1+9eTVsXZcdESDrcZnOIL6gIW76yTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geBbCfz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471AAC4CEE3;
	Thu,  3 Jul 2025 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542323;
	bh=wzQZ6BxFT/0DZ7LabLhcVgcpyOzEp2kAoXYH0G+txl8=;
	h=From:To:Cc:Subject:Date:From;
	b=geBbCfz8FblGrXrPHesvEa/mkg9LowWgrWRHEqQmmPN/cMo7sLtTNf7hyun4M/qv8
	 0p4JW5rm+bvHxo5Oxqp4sPdzulHuryt03U581lSj0F6mKFXJuNJfaqU6KK8SrLepU4
	 ZnmPIFg3V5bbD42CnfbRN8T6ROu5eA6UTeieWoGojdxPAKcszeocumvR6P/yXjKTxO
	 cSqNxw4du40DhgWLedRAOhzEOD73L2KiYdrdTFK066oTNqFSPOM/jnIFKp6e4OHjJT
	 c8lnFovjYCRts6QKWZ7KKyxI4UTyP+9ehYTUJVtcgWKsDpppA657ePeNaxM3GxYZyA
	 QnsknswzCeejQ==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 0/8] mfd: tps6594: Add TI TPS652G1 support
Date: Thu,  3 Jul 2025 13:31:45 +0200
Message-Id: <20250703113153.2447110-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the TI TPS652G1 PMIC which is a stripped down
version of the TPS65224. Support for the latter has already been
merged. Refactor the regulator driver to ease adding new devices.
After doing that adding the TPS652G1 variant is really straight
forward. Some care has to be taken by the interrupt handling (of the
regulator part) because there interrupts are used for voltage
monitoring which this variant doesn't have.

As there are conflicts in the regulator tree (some constify
patches) and my patches make use of them, only the first two (or
four, that's up to Lee) can go through the MFD tree. Lee, could
you please provide an immutable tag for the other trees to merge?

v3:
 - (re)add dt binding patch that I've accidentally missed in v2

v2:
 - refactor tps6594 regulator driver to make it easier to add new
   variants

Michael Walle (8):
  dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC
  mfd: tps6594: Add TI TPS652G1 support
  misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
  pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
  regulator: tps6594-regulator: remove interrupt_count
  regulator: tps6594-regulator: remove hardcoded buck config
  regulator: tps6594-regulator: refactor variant descriptions
  regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |   1 +
 drivers/mfd/tps6594-core.c                    |  88 ++++++-
 drivers/mfd/tps6594-i2c.c                     |  10 +-
 drivers/mfd/tps6594-spi.c                     |  10 +-
 drivers/misc/tps6594-pfsm.c                   |  31 ++-
 drivers/pinctrl/pinctrl-tps6594.c             |  35 +++
 drivers/regulator/tps6594-regulator.c         | 219 +++++++++++-------
 include/linux/mfd/tps6594.h                   |   1 +
 8 files changed, 285 insertions(+), 110 deletions(-)

-- 
2.39.5


