Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4F5352FC8
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 21:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhDBTdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 15:33:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235256AbhDBTdY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Apr 2021 15:33:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F2A861106;
        Fri,  2 Apr 2021 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617392002;
        bh=UKGAA0KBznLokaitUNDSSQOOPLiOQ/AEbThL2/Z8hG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nFpYVWCKV2mtdWoynoI6+acnvex5sthViPUax7CahWdrIHhxcjFvYIAAXDB5KehOB
         tFPeSoIkpJMyU/clwlFL3o41g4Kmd1Ube8MC/lzl7BZstGY7DDehbLXBRun3u0T0eC
         Y271m3LDOmp00w1RtsvColrfF4r3Pg3b6OvhdliRMw4TrUegsnyDZHm3eMOTFGnc9D
         +g1C97eYWVmSVIuyTmg2r497zC2p39vCwda4MUZrZLb9Dyk86PMH9V/n9AzEYcImnt
         caM/Jn8D3sNCPx7IklNgxJ9EorOVYv1z3xWAheLtpCVnjoQSRkQwL0yVQf1o4H13w/
         oz/xqM0VIQP4A==
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-power@fi.rohmeurope.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v5 00/19] Support ROHM BD71815 PMIC
Date:   Fri,  2 Apr 2021 20:33:08 +0100
Message-Id: <161739191157.32055.17669953847894989465.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 29 Mar 2021 15:52:38 +0300, Matti Vaittinen wrote:
> Patch series introducing support for ROHM BD71815 PMIC
> 
> ROHM BD71815 is a power management IC used in some battery powered
> systems. It contains regulators, GPO(s), charger + coulomb counter, RTC
> and a clock gate.
> 
> All regulators can be controlled via I2C. LDO4 can additionally be set to
> be enabled/disabled by a GPIO. LDO3 voltage could be selected from two
> voltages written into separate VSEL reisters using GPIO but this mode is
> not supported by driver. On top of that the PMIC has the typical HW
> state machine which is present also on many other ROHM PMICs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[10/19] regulator: helpers: Export helper voltage listing
        commit: e3baacf54275647a018ee35bff3bc775a8a2a01a
[13/19] regulator: Add regmap helper for ramp-delay setting
        commit: fb8fee9efdcf084d9e31ba14cc4734d97e5dd972

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
