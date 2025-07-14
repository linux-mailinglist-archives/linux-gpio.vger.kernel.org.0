Return-Path: <linux-gpio+bounces-23217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9DB0406A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A138316ECB6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 13:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2152924EF88;
	Mon, 14 Jul 2025 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqzCbmj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3A12512D1;
	Mon, 14 Jul 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500549; cv=none; b=DQwBMVTqgXwXfl9ufC3YrbQYxVxYx4AEP41nYCAUY+lbVlw5wlBJR/SIsB5tusB/dKv+h6k9uYb8NAR4SzGLYSGogbezWCR7TRvs2C1xMTpJ2+QWkbhAOhcHXxZAgeBi6TfiCWCwyaHPf2glDpjqDUm4Rtg75Sc3CDPJYnaO40g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500549; c=relaxed/simple;
	bh=STZLoAmj4SYRKNUHqnzeOXjvFxcKujs5vEAPDgZQa/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EsVBWbm8d/B87vB7KdyBBpQP2mPwFl50drDxNpvlXParpbUNu3C+epTThMH3rrRCRXUUVkhtu2forQba75F4lpJcdgHkt/tb3A9izeGj2MkvrFzmNH+rGcohVqYj31vGZBfQs/Y+axLlrsejbEIARwtv1QmZ851xGDAAgAoxRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqzCbmj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1723C4CEED;
	Mon, 14 Jul 2025 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500549;
	bh=STZLoAmj4SYRKNUHqnzeOXjvFxcKujs5vEAPDgZQa/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OqzCbmj0EV+lIv6f+l5P+UyrrSodmXCf/XaHeFMhX1cIs0fQhV9/4Q/LlDiPThaMM
	 L+qdyiuktS2pXNeV7iBg0bmBsQf+TkCpn7UyQMXQWyTBK4dUTk5vdVCTYSdMDoWEIE
	 F90RACIG4exp+qLSeAOPHMgIY2WVZAm20YrUuhJ4HY+Ywy+aq3/cZAQWUOzmOzj1Xo
	 kUHTUYMXDRgwpu9n6GEOk6B6kLogLgOc4XyJWEXWqW5c2URN4m5nxIasBlyxr4zyaX
	 eYZhOavgUt1kgFmp3gFfGeGza8mh1fEZOxNcxMjsd8SbpNsMUBW2YMu3u7vDrmotW6
	 /Bi7/dPY3WzsQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Peng Fan <peng.fan@nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Markus Niebel <Markus.Niebel@ew.tq-group.com>
In-Reply-To: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Message-Id: <175250054660.59912.16471327472750140555.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 14:42:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 10 Jul 2025 20:40:00 +0800, Peng Fan wrote:
> This patchset is a pick up of patch 1,2 from [1]. And I also collect
> Linus's R-b for patch 2. After this patchset, there is only one user of
> of_gpio.h left in sound driver(pxa2xx-ac97).
> 
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> 
> Patch 1 is to drop legacy platform data which in-tree no users are using it
> Patch 2 is to convert to GPIO descriptors
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
      commit: 69d5b62c4bded309332add0fac6760239ff47a68
[2/3] ASoC: codec: tlv320aic32x4: Sort headers alphabetically
      commit: b709c1aef5e15db3aff5749fc7ed9c61b8d0a322
[3/3] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
      commit: 790d5f8ee6f2a27686d042abbce16b4e03ac1608

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


