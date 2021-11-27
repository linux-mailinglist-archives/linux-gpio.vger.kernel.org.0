Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A645FAEE
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 02:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351260AbhK0BfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 20:35:19 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36876 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351492AbhK0BdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 20:33:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A784160A70;
        Sat, 27 Nov 2021 01:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F795C004E1;
        Sat, 27 Nov 2021 01:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637976604;
        bh=mAlOarq0Dk/Cnzg2qMm+ZAQk5qZ2N0epByo7obErI3Q=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Fcg42vtVZeZF5y1aURx+juD4v5oZgIonvPdKmX+Zu/VqzCrWO0+jfA937y+R5X64X
         dXS8d/40IlhSffQQecFZ322OXRZbiKXTRNYZH3grxyimFMp7J4spN2lm5wl6o1Nl7u
         TKH7dld0xezmDVUEYPWuvqPF3ZU/t44KFu98dpwqgU1xvW6Fzl8AE4tgoKTOZixR/9
         l8AmMQ+MA9Ud4B4RegAdCh3aABEX7ZTjxW9vqoac7uvtIbDJvEPvPgCmpWhafnV5x8
         ozu2qA+jej/STjTwjjhnQ4yB2LiOc2Y1xaTy2I3ZULTe6+JiGVocKBhVlU8aN29yY0
         jpj4cChOJQIPg==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
In-Reply-To: <20211123174127.2261-1-dominikkobinski314@gmail.com>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
Subject: Re: (subset) [PATCH 1/4] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
Message-Id: <163797660213.2988101.12499295081195849746.b4-ty@kernel.org>
Date:   Sat, 27 Nov 2021 01:30:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021 18:41:27 +0100, Dominik Kobinski wrote:
> Add support for pm8226 SPMI GPIOs. The PMIC features
> 8 GPIOs, with no holes inbetween.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/4] dt-bindings: regulator: qcom: spmi-regulator: Document pm8226 compatible
      commit: 76e95f331be09bac8764e971613439d294422d6e
[4/4] regulator: qcom_spmi: Add pm8226 regulators
      commit: f8843e5e2dc85dc6a546ec130d76be66e62abed6

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
