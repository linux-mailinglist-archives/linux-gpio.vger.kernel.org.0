Return-Path: <linux-gpio+bounces-12793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C49C35AF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 01:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7081F21662
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 00:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5477FEACD;
	Mon, 11 Nov 2024 00:58:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F8A7641E;
	Mon, 11 Nov 2024 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731286682; cv=none; b=S9j7/7Fc4rg6jytVJ4yWd2zE+w2FdHql61b5/3z3KxQA0PvqHt8CDEhd4OvMRX89O/D0gwHPHOaLbJDlvJEpoSTfHIMsSUwGd+C/mr1L8Ot5wj0hHwm+wZsblbua30RaRv0Ah+BxpIXlfTjq9mHt07aUf1eeMC0ge01FgcyLslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731286682; c=relaxed/simple;
	bh=MLKVnW1rgrJT607EwnFAv0XgiDpUAt0Y9KeyN0vEHEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pU4fAvuqV5OIi6zc2sgHB9tu+eZmi8m+/Mn8V3ui7w4p7mRF0duuESVDezl9a3tZS27VFmhHVPBUplynk3insyYoFAjrsL/K9HtynPofPJC2gCsW87GP1xF7JKHiYsclT56sR+OxD2yDeCPt9TQ49fpf5F9ZwoZmcAlKsiHEdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F24BE13D5;
	Sun, 10 Nov 2024 16:58:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66A2A3F66E;
	Sun, 10 Nov 2024 16:57:57 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A523 support
Date: Mon, 11 Nov 2024 00:57:43 +0000
Message-ID: <20241111005750.13071-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series introduces pinctrl support for the Allwinner A523 family
of SoCs (comprising A523, A527, T527). [1]
The first three patches extend the sunxi pinctrl core code to deal with
some specialities of the new SoC: it uses every of the 11 possible banks
except the first one, which required some register remapping. The first
patch here is actually some cleanup, which we should take regardless, I
think, since it fixes some hack we introduced with the D1 support.

The main feature is actually patch 4, which introduces a new way to
express the required pinmux values for each function/pin pair. 
Traditionally, we dumped a rather large table of data into the (single
image!) kernel for that, but this approach now puts that value into
the DT, and builds the table at runtime. This patch was posted twice
before [1][2], the last time LinusW seemed to be fine with the idea,
just complained about the abuse of the generic pinmux property. I changed
that to allwinner,pinmux now. For yet another alternative, see below.

The rest of the patches are the usual suspects: the two files for the
two pinctrl instances of the new SoC (now very small), and the DT
binding.

Based on v6.12-rc1. Please have a look, review and test!

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20221110014255.20711-1-andre.przywara@arm.com/

P.S. LinusW's comment about "pinmux" being something different made me
think about whether we should adopt an even different approach, and
follow the Apple silicon GPIO driver. That conflates the existing "pins"
and "allwinner,pinmux" properties into the standard "pinmux" one, like
this:
	uart0_pb_pins: uart0-pb-pins {
		pinmux = <SUNXI_PIN(PB, 9, 2)>,
			 <SUNXI_PIN(PB, 10, 2)>;
		function = "uart0";
	};
That looks like a neat solution to me, with the huge drawback of
requiring a completely different of_xlate function, which I guess means
a more or less completely separate pinctrl driver.
Let me know if you think that's worthwhile.

Andre Przywara (7):
  pinctrl: sunxi: refactor pinctrl variants into flags
  pinctrl: sunxi: move bank K register offset
  pinctrl: sunxi: support moved power configuration registers
  pinctrl: sunxi: allow reading mux values from DT
  dt-bindings: pinctrl: add compatible for Allwinner A523/T527
  pinctrl: sunxi: Add support for the Allwinner A523
  pinctrl: sunxi: Add support for the secondary A523 GPIO ports

 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  23 +-
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun5i.c         |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     |   7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      | 357 ++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  54 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  45 ++-
 13 files changed, 586 insertions(+), 51 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

-- 
2.46.2


