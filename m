Return-Path: <linux-gpio+bounces-17707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8455A66106
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 22:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C66F178D52
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 21:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA3A20371F;
	Mon, 17 Mar 2025 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA1fVH2T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499811FDE2E;
	Mon, 17 Mar 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248461; cv=none; b=FktvWtA/i3y0KcpUkLrEsCiqy58iBLYOS69FyE6DzOsJ4WiRMSF7NtfZWjpNJn79Z1NiD+7XP43o/hny4I080nYGoQSIpJzo0LsziXg6xVm0RpPqO7hMm5OR193pX6Ed+f/tlL9UsY1o8Br5U2A+ArhSv1KW5Upxzc5Z0v0C7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248461; c=relaxed/simple;
	bh=qGAMcq+e4SyROWpB55a1DUwxlwcfVY0OaH69t8f3izo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DPo2CLZPp6zx4602yfMysdVW2BloTeQAQFKhdygg1x7/NLRWvqCMEjSZD9zS7ehy1yN8+OvSQ5hnBtMttZg3zFUDFzlUb90APY2ecLUhrwYOWYadw3EG9qZL7HGv3U2Hf8UpRvj8zKuLpcU72nGWP1Tc/6LY/FivMEadIZ5qdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA1fVH2T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5FAC4CEED;
	Mon, 17 Mar 2025 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742248460;
	bh=qGAMcq+e4SyROWpB55a1DUwxlwcfVY0OaH69t8f3izo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jA1fVH2TvR3FbR8nc34zfPufH/VAcDrtJVueLWk5mbCgWUZPslHNJFQuVlWxuJPfO
	 gRWVyKZCyx2FNr1YrNBSAfG1mJ4Dhx99m/KmnVxg25aQ5h7d5y44P3DKkOMJtYUWNj
	 o5xfwgPDa39yodIs5mbmBuYVU1FL2uol20KhmvPvHCDJuCWjKSKah9KNHhxxwZVUud
	 4BEC0hhjQcTVSTq4ZDdwlfINAA7YeKHD9Zyd0EcxKvhcYPhuBROu0GlRjcmiD3Blib
	 GC3nlQ7R0GDecsvSJokWVam8CzlKOSXZspV9Y/JghIaQDIZrE3RNAmS5QjE/FVqcG2
	 BZb1V0MYSTk6A==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
References: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: Convert PCM codecs to GPIO descriptors
Message-Id: <174224845839.355189.15098834039543767056.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 21:54:18 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 12 Mar 2025 14:31:49 +0100, Linus Walleij wrote:
> Three remaining TI PCM codecs use the old GPIO API in
> different ways, fix them all up and move over to
> <linux/gpio/consumer.h> and get rid of <linux/gpio.h>.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: pcm1681: Drop unused include
      commit: 98dba9dab5d9af3c25e61a5d751bc943fec3f918
[2/3] ASoC: pcm3008: Convert to GPIO descriptors
      commit: ef5aa8bd22372dd67b7fe19613b86181cd765af8
[3/3] ASoC: pcm6240: Drop bogus code handling IRQ as GPIO
      commit: 17fdf318f5fbe5c27353ae917c0c5a2899d9c259

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


