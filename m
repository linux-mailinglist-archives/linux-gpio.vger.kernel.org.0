Return-Path: <linux-gpio+bounces-6296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E68C271E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AC5DB24331
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 14:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B79171086;
	Fri, 10 May 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Li9vp/Te"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E8912C526;
	Fri, 10 May 2024 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352453; cv=none; b=CkWDK2uoBxiasjNRPnnaSTlMeP7Lb/M1T2+fw2mdJWwiZga5dv5+sCoAr6brHJN0/Kbbl+cZNUUOVGsb83BaxP//pruaj4/kcDOkSlUl9+hp1bycY7pCrENVhx/vSvbLL47m3yz4u41qAk+YHeG0r8pJsGWIP2qKYU8jnQfPdVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352453; c=relaxed/simple;
	bh=TnctR5VIFK9cG6OWB0Ya5IbDIo4SYtggYGdcqptbWFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exrDeOyXMC1C3e4G1oAdXO/qRh/eaYz600/W9cvHCxwDTVklofVHzNwhOXY2mbzOZ8/8afaE3Q3gGXdDiwfAsAMxY7BClhIMazomUJars5gTVB+Oi458t1p9A8zygtaM1nQpU61JqxE+VdkamY/LBOwRg9FksoFO/2eVBLCZNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Li9vp/Te; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FC5C113CC;
	Fri, 10 May 2024 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715352453;
	bh=TnctR5VIFK9cG6OWB0Ya5IbDIo4SYtggYGdcqptbWFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Li9vp/TemlmLoGa4Drj5pMqrB9B/eOJ8kRGM9FJy8eKVlpYt0yEDycu79BLt8bMFT
	 ZSbJrlTAFYmLm9w61RoIGnFUvDguhCJau2YdBOb5EcLVMhWCnwh4cEu19HqGuLKtK8
	 CzbyV3grZA7zvPzYepKxWUGbRjq2KQy1z0B3BlX+mS5MeK+6L9pcbb/uVY00aaDU6l
	 jHJnij6hDeqdzK0/jSuDqeONHD6Vs66goJwDZqkYewjuzZq3cb9Qq5Bifmt9XexbtV
	 OwbO+e21a8eUDlmFFVhKpJUJlL80dRmtQm9j7CH0yKpqhDwOH42DOlLe0bciQ0xxT/
	 z7Z9Jf89ol4wg==
Date: Fri, 10 May 2024 15:47:26 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Pinctrl and Regulator due
 for the v6.10 merge window
Message-ID: <20240510144726.GB6146@google.com>
References: <20240416161237.2500037-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416161237.2500037-1-knaerzche@gmail.com>

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-pinctrl-regulator-v6.10

for you to fetch changes up to 5eb068da74a0b443fb99a89d9e5062691649c470:

  regulator: rk808: Add RK816 support (2024-05-03 09:15:38 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Pinctrl and Regulator due for the v6.10 merge window

----------------------------------------------------------------
Alex Bee (5):
      dt-bindings: mfd: Add rk816 binding
      mfd: rk8xx: Add RK816 support
      pinctrl: rk805: Add rk816 pinctrl support
      regulator: rk808: Support apply_bit for rk808_set_suspend_voltage_range
      regulator: rk808: Add RK816 support

 .../devicetree/bindings/mfd/rockchip,rk816.yaml    | 274 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |   4 +-
 drivers/mfd/rk8xx-core.c                           | 104 ++++++++
 drivers/mfd/rk8xx-i2c.c                            |  45 +++-
 drivers/pinctrl/pinctrl-rk805.c                    |  69 ++++++
 drivers/regulator/rk808-regulator.c                | 218 +++++++++++++++-
 include/linux/mfd/rk808.h                          | 144 +++++++++++
 7 files changed, 851 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml

-- 
Lee Jones [李琼斯]

