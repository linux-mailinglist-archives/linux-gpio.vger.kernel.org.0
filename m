Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C3238934C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 18:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355119AbhESQMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 12:12:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240705AbhESQMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 12:12:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6CA061355;
        Wed, 19 May 2021 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621440671;
        bh=xTy/Z0GXKhDJm4r3n9vxQVK4GxEQwjIqEQe1+BWxNFo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=riazGgZJNcaxswy0wwNdiqqBW25ua7bRFFnVlyeWKAjCHsIsJo0/NM0nxi0sCMie9
         1if8H8ifExM7aOxY3SFcnnVEAdJ5Y2HrRG+2xQBWMEisAhwQTB/G2bbe0eiXDI37w6
         sGm5EcVd9sZqu41Rrh8L8xSh2srTaHqMdMa/8zDvLD2RV83DWc4S4FO3amjSVZ7SdC
         ZOtOgKr80SvnOyKU4tYDw9K9ahwa1XxosJHA3RNcQNnje40rFFopMDBAWPB6V/8dDS
         N2oC8gSRFCWM3TXIbNRhEpH37kb6EtBI4ABKwPqa22jkngb7q0RpoUbGknSRVo8hMv
         l7QgDupOuFvEQ==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Michael Walle <michael@walle.cc>,
        linux-leds@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: (subset) [PATCH v2 0/7] RTL8231 GPIO expander support
Date:   Wed, 19 May 2021 17:10:13 +0100
Message-Id: <162144031656.37163.14427082237323398944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 17 May 2021 21:28:02 +0200, Sander Vanheule wrote:
> The RTL8231 GPIO and LED expander can be configured for use as an MDIO or SMI
> bus device. Currently only the MDIO mode is supported, although SMI mode
> support should be fairly straightforward, once an SMI bus driver is available.
> 
> Provided features by the RTL8231:
>   - Up to 37 GPIOs
>     - Configurable drive strength: 8mA or 4mA (currently unsupported)
>     - Input debouncing on high GPIOs (currently unsupported)
>   - Up to 88 LEDs in multiple scan matrix groups
>     - On, off, or one of six toggling intervals
>     - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
>     - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
>   - Up to one PWM output (currently unsupported)
>     - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/7] regmap: Add MDIO bus support
      commit: 1f89d2fe16072a74b34bdb895160910091427891

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
