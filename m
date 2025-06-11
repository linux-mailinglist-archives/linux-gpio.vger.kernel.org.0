Return-Path: <linux-gpio+bounces-21393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E22AD5708
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A25D817EFB7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D26D28A708;
	Wed, 11 Jun 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZs9Jpeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093435897;
	Wed, 11 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648712; cv=none; b=Y3INSfYD4J7d6tWoYSSl0nh87D8HQPF9PLPsaZOBQ1POREGhIATItXhkwGAyt9Ay0IV4iLN9OA0IG1Ev7zWRZbogO8xargOqIdeAvAiP0C/zt4CDLSz+GMI752UFoXLGKH19XDZAs8IJjGT/KyHYEjRap4rRFO/gp41LHV6ENOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648712; c=relaxed/simple;
	bh=tkcX5ba37ybti35YL/ku8IFzXD8AUGVcE2iTEQBBfwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J+duRMmc4vqlSFinc7kC94m9T3FbSpxWAII8GyE0w61Y1VSkyByY8UBFbXZkWhhk2zsS+l7gVYbThE67xMQUAEh4jBOjn6FyZYB9SQTUkgQLaaZ088jpuxMCvwwwM4XBvsAQbESSs2nEfWkJchhgmn9Hi64t4FXnja9Kwec0BaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZs9Jpeq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01821C4CEEE;
	Wed, 11 Jun 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648711;
	bh=tkcX5ba37ybti35YL/ku8IFzXD8AUGVcE2iTEQBBfwE=;
	h=From:To:Cc:Subject:Date:From;
	b=PZs9JpeqZkjuaVbIzsfHiOAOJw4wK88VNnh5tyVt7KeLsXBMdu1LbsSxNK/6o3O+x
	 Rvn465jTRyNaBdn2zUPkoJqK1+cMtwV0FhBJND3GQgw8XTFQ7qBQhe6tTpXlA1efom
	 r8lWra3LkkM5mLW3z5v+80gkVj23lkLW2nYy5FKuGhA9F2gJmo7R+juIFSDHhtJ4Rx
	 wR8CFjL8GoIokpIWPiZaRT+ZLWv5VvcfJCMYCnBBetJCJONr1L88FVsKVCUNZJ2wn8
	 nMmMj8zPM0iypUWgya0pYnsBstuUYVQRdBzpIIuDqzEZtk6VJntzzpk2nJhhLmoyYk
	 VmnVVuJhDYGmA==
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
Subject: [PATCH v1 0/5] mfd: tps6594: Add TI TPS652G1 support
Date: Wed, 11 Jun 2025 15:31:32 +0200
Message-Id: <20250611133137.1686183-1-mwalle@kernel.org>
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
merged. Thus most of the changes are pretty straight forward. Some
care has to be taken by the interrupt handling (of the regulator
part) because there interrupts are used for voltage monitoring which
this variant doesn't have.

Michael Walle (5):
  dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC
  mfd: tps6594: Add TI TPS652G1 support
  misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
  pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
  regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |  1 +
 drivers/mfd/tps6594-core.c                    | 88 +++++++++++++++++--
 drivers/mfd/tps6594-i2c.c                     | 10 ++-
 drivers/mfd/tps6594-spi.c                     | 10 ++-
 drivers/misc/tps6594-pfsm.c                   | 31 ++++---
 drivers/pinctrl/pinctrl-tps6594.c             | 35 ++++++++
 drivers/regulator/tps6594-regulator.c         | 41 +++++++--
 include/linux/mfd/tps6594.h                   |  1 +
 8 files changed, 189 insertions(+), 28 deletions(-)

-- 
2.39.5


