Return-Path: <linux-gpio+bounces-19320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148FA9D0E9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 20:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA4931BC2994
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 18:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111CE218EBD;
	Fri, 25 Apr 2025 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4L45BK/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4920E330;
	Fri, 25 Apr 2025 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607479; cv=none; b=V34/Iiroj0L6/dMgrM8eZw6Es8IC8kc2MdQz3rLtMudoYnq9leBWzE+Ve9NFNaWOHzD72u/UeH5XNLumIHcZQloSQf3BLfZN195odIV9I3qP0qAt9KqmmopBx/QAkFHp7nwuX69vhil0gI5W6mLt5fXNA+JEFbSxiFVyXH9+EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607479; c=relaxed/simple;
	bh=QCUtHoRr+hw3FLvlp/XM1ezbeTT0KB5Vrc2W3OgyYPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k3iUlvrhcE7cXxJtl6ZqXE3WuRza/BE+hJedERAKSPmlbM0uRtt4RrNEggOF8+4+kASsU1BJUjgxdXZ9FnHM+MgiMWsbHztkbiUogPTXjb68fXFAoe1Y4aszgJVFPRUkhTjyEOPv2DyQJJuYA2i7XuCNFqPPj+uiFSrRJkjBloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4L45BK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B358EC4CEE9;
	Fri, 25 Apr 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745607479;
	bh=QCUtHoRr+hw3FLvlp/XM1ezbeTT0KB5Vrc2W3OgyYPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U4L45BK/2bJW+Gdw1ur9V5St/7qZyQRVVOaOKhv1W76io/YF5MP01tW3vIqTJ8Zie
	 otpEKYowkPYle8Hws6K7Yvsu1dy3rsUWnaebljntFjBlk/lida1FiHMA/YveeA8trh
	 /4k8a8UPMJj4sAC8FRhXYU3XpGH6X5fEuBl5CPXkRmdZquAkoiMM1/AUUK0573/ppS
	 yVOfEZpE3d+p+bl9o/hswrquOp6aUVSvsVy9oi2FtqPW+qX4gYOxa532/MfaaFoKTk
	 /AjdnNZhFypbcxhRTkNFWzluQalZ1FCJ4MNLNwH/tOakU4gvc0byg2JfiW33fCl1ln
	 sAIUHOrAJgJRg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: codec: tpa6130a2: Convert to GPIO
 descriptors
Message-Id: <174560747646.245250.8799938945020912124.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 19:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 16:34:22 +0800, Peng Fan (OSS) wrote:
> Per Mark's comments in [1], each driver in one patchset and not merge
> the changes to one driver in one patch, so worked out three patches.
> 
> - Sort the included headers.
> - Drop sound/tpa6130a2-plat.h because no user is creating the device using
>    platform data
> - Covert to GPIO descriptors
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codec: tpa6130a2: Sort headers alphabetically
      commit: b194e82b289cf3b382a9a69f0ef07dca887293bb
[2/3] ASoC: codec: tpa6130a2: Remove tpa6130a2_platform_data
      commit: 63a9362c7172c74f6df19195c3e7491d3ec123ca
[3/3] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
      commit: c27c31302601b648eb0fd6fc3a69c9a0c10eb6a4

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


