Return-Path: <linux-gpio+bounces-6297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9A8C272D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A0BB23859
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2B817106E;
	Fri, 10 May 2024 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzcac8GP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6EEAC0;
	Fri, 10 May 2024 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352741; cv=none; b=eExs1RxL4KI05ooziyp7x/z3L1NS3WRw1fU3dtNPE5X7O5dTqB8K0U8FXDu5RBwqJC7mbnhVoeo9ziY/tKZkQ3hbFRe/+NRARAfwcZOYBL7zRy5YNT/D1m3B0eVJmD8gbxAXbn24CAFi32cLnsfMzT6qAY0t49EEEjJVHeKtwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352741; c=relaxed/simple;
	bh=Wk0q4vevPtsf1bHPHOHrkMoSDRobzZE5HMMZ/bpUMqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOlVObwfC9fH2VOR+pf+jQQUD/dFn1+eMylCCt2WZ2RmJ8d7m0DjTLybHmemHKolKZ9Jo4kFBsE2QeZcUn6yhSQtsxhWT5YhIEoroj4wSqkjRmuzj/6PdK7N5gi4FBS1zeApgs2p5sxFbm5Zbo+uGO9LaoyJ94Pzdiz+Wcdza8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pzcac8GP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6582C113CC;
	Fri, 10 May 2024 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715352740;
	bh=Wk0q4vevPtsf1bHPHOHrkMoSDRobzZE5HMMZ/bpUMqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzcac8GP99w+51uAaTDjeuzPJjGO2O2eMuXDs9L085Xbu7NvI9TtPBZ0Vp/HCfEKr
	 JIBWYvcvVlRJx6ptANdfbBBOQbA5RRyJo8O/PO0Yj5N/nTIEaTc2FKB/h29H/LfeB2
	 7tEhaCFBzx1UivzrgGVy1BVFEyQuyH2I6rO+lUOiqoSH+ZgIVkWvAhtJqR2fgtPB+4
	 HfTdEIY/5S1nGhS+9VW47CZa3WnqClhYUs9rHIMwjrpaRXQAIkLIzJ/luZzgu9EhEf
	 dVoqGFvP61P+qeHFTD7BSjXm+5Hn6AG7sSNUs5alWlTw27FVjUr5ls2iLN0T//0w3y
	 1hPWMfP48ogBw==
Date: Fri, 10 May 2024 15:52:14 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Bhargav Raviprakash <bhargav.r@ltts.com>
Cc: m.nirmaladevi@ltts.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jpanis@baylibre.com, devicetree@vger.kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, eblanc@baylibre.com
Subject: [GIT PULL] Immutable branch between MFD, Misc, Pinctrl and Regulator
 due for the v6.10 merge window
Message-ID: <20240510145214.GC6146@google.com>
References: <0109018f2f24c15e-c50bfc29-5f1d-4368-a4b8-2c9f1d398abb-000000@ap-south-1.amazonses.com>
 <171472796178.1311350.4406575677999610125.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171472796178.1311350.4406575677999610125.b4-ty@kernel.org>

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-pinctrl-regulator-v6.10

for you to fetch changes up to 2088297159178ffc7c695fa34a7a88707371927d:

  pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO (2024-05-03 10:07:11 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Misc, Pinctrl and Regulator due for the v6.10 merge window

----------------------------------------------------------------
Bhargav Raviprakash (6):
      mfd: tps6594: Use volatile_table instead of volatile_reg
      dt-bindings: mfd: ti,tps6594: Add TI TPS65224 PMIC
      mfd: tps6594-i2c: Add TI TPS65224 PMIC I2C
      mfd: tps6594-spi: Add TI TPS65224 PMIC SPI
      mfd: tps6594-core: Add TI TPS65224 PMIC core
      misc: tps6594-pfsm: Add TI TPS65224 PMIC PFSM

Nirmala Devi Mal Nadar (3):
      mfd: tps6594: Add register definitions for TI TPS65224 PMIC
      regulator: tps6594-regulator: Add TI TPS65224 PMIC regulators
      pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO

 .../devicetree/bindings/mfd/ti,tps6594.yaml        |   1 +
 drivers/mfd/tps6594-core.c                         | 253 +++++++++++++--
 drivers/mfd/tps6594-i2c.c                          |  20 +-
 drivers/mfd/tps6594-spi.c                          |  20 +-
 drivers/misc/tps6594-pfsm.c                        |  48 ++-
 drivers/pinctrl/pinctrl-tps6594.c                  | 277 +++++++++++++---
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/tps6594-regulator.c              | 334 ++++++++++++++++----
 include/linux/mfd/tps6594.h                        | 351 ++++++++++++++++++++-
 9 files changed, 1120 insertions(+), 188 deletions(-)

-- 
Lee Jones [李琼斯]

