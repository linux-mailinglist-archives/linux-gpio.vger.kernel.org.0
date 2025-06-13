Return-Path: <linux-gpio+bounces-21527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AAAAD8B33
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ADA1189E34B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7022D5405;
	Fri, 13 Jun 2025 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq/QSfms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113532D23A9;
	Fri, 13 Jun 2025 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815131; cv=none; b=rldo2idIsYV4Qpv2tQOs1+RZExEamrquX6w3jOkH9hX+c7VIHIoLhfs4dStLRBNiYy62/4Iza4hqLawVQyM8So0VLZBobdQ513XKgFD0orUhX/keVwdf9CeiOwZkLsxUxpF5aky705FTv9TSZeZhAzWNhk/ceTUDtJI1OKGG/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815131; c=relaxed/simple;
	bh=nai9ovqsCsYLctjO8qGQfZOz8awERkxd3xPoYmKGa/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ebl3rrX3T7BqPqqwHvvNx2mRfHK8dtQUBfbN+F55Hk+DZBWBx/iJc/l5b0BRuqbxKyM9kuZdom8ZKCJwyAR7nGne3SiVBoJwNBXdsXI1JH2JjJ06UEHVgN4Ip8Ygp4TqRpghW22i7QuvFJfXM80d3/7onxu1PDiA+BVCBRi+KKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gq/QSfms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD887C4CEE3;
	Fri, 13 Jun 2025 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815130;
	bh=nai9ovqsCsYLctjO8qGQfZOz8awERkxd3xPoYmKGa/c=;
	h=From:To:Cc:Subject:Date:From;
	b=gq/QSfmsez8w01ZbaIyaEgyouoOZBJGB7gTmOPQtEWmvg0Z0iy5WkTMbl3TiqjBkE
	 BUsshk8akKln5NnP7tCTPl+GKwkMtAUK1mQ4kjAkEWi7Sc5+AdyeUVGe4dn/uTcEhA
	 W1UD0LG6wumA1dktlwB8CmPSX2nwggz7tWfoWA8ACmcJEpDwJpK2nLNKElHQL7QlI+
	 l+fdiF0qN41k+B1HE5TR94gBToyCAkGHOJVE1J6O2SUrVW761TnAREJ5Dvuw1/MzrY
	 shItUTPpwfNFcBdeU+nRST8rUp01QI8TZkVEBWbylJ4tPuzcZCpPbK0M9vBu6gf81u
	 MmxNg8SltvPqQ==
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
Subject: [PATCH v2 0/7] mfd: tps6594: Add TI TPS652G1 support
Date: Fri, 13 Jun 2025 13:45:11 +0200
Message-Id: <20250613114518.1772109-1-mwalle@kernel.org>
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

Michael Walle (7):
  mfd: tps6594: Add TI TPS652G1 support
  misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
  pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
  regulator: tps6594-regulator: remove interrupt_count
  regulator: tps6594-regulator: remove hardcoded buck config
  regulator: tps6594-regulator: refactor variant descriptions
  regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators

 drivers/mfd/tps6594-core.c            |  88 ++++++++++-
 drivers/mfd/tps6594-i2c.c             |  10 +-
 drivers/mfd/tps6594-spi.c             |  10 +-
 drivers/misc/tps6594-pfsm.c           |  31 ++--
 drivers/pinctrl/pinctrl-tps6594.c     |  35 ++++
 drivers/regulator/tps6594-regulator.c | 219 +++++++++++++++-----------
 include/linux/mfd/tps6594.h           |   1 +
 7 files changed, 284 insertions(+), 110 deletions(-)

-- 
2.39.5


