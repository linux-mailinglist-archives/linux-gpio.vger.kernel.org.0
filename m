Return-Path: <linux-gpio+bounces-19731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44CAADD0D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704773B983F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 11:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9B2233134;
	Wed,  7 May 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHLLOjeb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689F1F5834;
	Wed,  7 May 2025 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616383; cv=none; b=icOWqgNwkCZHfJffe3o+bk4G5I2sjVGRBu8XCWYVz1KKs4AyjQKI+wNZR1PycHBNr9VRziVCr0xscH55kSYjmk6iWSgKlmcyNo/wlwdXAjdTux9+JmMWAYukocLuJA0zVzcfem3tVkIuv1TC/9RXQEcl1Kz9A46ktd+1sCYJivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616383; c=relaxed/simple;
	bh=Lo9iaKfVSwtjx3+rJqlE7MKN4vhPhaKVtFHVlkTLxHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GxnQI+7mDvMfb0cpYARoESu+HtbZKtjgDeR64S9J30qZgAZzRkYqwHZhp3iQs8BwOP3Ru0CG01pbR6F47AI8xtJtLdBeOjTjM0dCtGwW0APnthOkeoUrOxReWP2JEeVhY3XdOjhw+mg0k5LehZvOOrHQkABEiO/YNuOqC26l9eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHLLOjeb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ED0C4CEEB;
	Wed,  7 May 2025 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616383;
	bh=Lo9iaKfVSwtjx3+rJqlE7MKN4vhPhaKVtFHVlkTLxHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OHLLOjebOvxIFF5GjrEGrmBfUu9iTg8pyNZ279YhMgTb8xCfh6QRkk4gaWICtmHwr
	 hmgIJxN2i0G4NaGm+0tcukYNKSz4RXq5O4dBEaLQWSv0/N6kgkMLI05vjnpt/2GQSe
	 3lVhcaMBfQPNbRc6seuizjF8m2PMtkcScpf1zwHmkW7KUD0NuzIbfkiPckYv4EZH/E
	 uBOblIprSKgEkrH0Fv+HbKfyeLRQrANgU/85LSMzKgB/4+LOMjjhFexaDfNOsjQZG6
	 23XIymXMVCaZr5E3gDUKmT2U54q0FToztoPS5C7Y+N3ahA8TUiNL2bjIHzmwRNp1Ku
	 j/duEKicWLBSg==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
Subject: Re: [PATCH v3 0/9] ASoC: codec: cs42l[56,73,52]: Convert to GPIO
 descriptors
Message-Id: <174661638031.4174662.2028103771120539508.b4-ty@kernel.org>
Date: Wed, 07 May 2025 20:13:00 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 06 May 2025 15:29:30 +0800, Peng Fan (OSS) wrote:
> This patchset is separate from [1], and not merging changes in one
> patch. So separate changes into three patches for each chip.
> - sort headers
> - Drop legacy platform support
> - Convert to GPIO descriptors
> 
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: codec: cs42l56: Sort headers alphabetically
      commit: 4060ebdd5063eed98a8f81f78f1e67ffc4ff0942
[2/9] ASoC: codec: cs42l56: Drop cs42l56.h
      commit: 86f6e4791c40c33891299d95c055e5d06d396284
[3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
      commit: 0bb92e4736a9dd43e3215b378db5ac63075a3cc1
[4/9] ASoC: codec: cs42l73: Sort headers alphabetically
      commit: f3e7298848f0e6c09e4da5fd80bca7cd0c58ccc1
[5/9] ASoC: codec: cs42l73: Drop cs42l73.h
      commit: 43ef0dccbc2528924c4b03a902fa39502faabb16
[6/9] ASoC: codec: cs42l73: Convert to GPIO descriptors
      commit: b6118100382c9e4c8ca623b3a8e8bf1a09c42aa5
[7/9] ASoC: codec: cs42l52: Sort headers alphabetically
      commit: 2d703321b856acdb6589d74906e19aa5cb328d4e
[8/9] ASoC: codec: cs42l52: Drop cs42l52.h
      commit: 772c036befb875c904731fb309fb9d2e065ba3f8
[9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
      commit: 5bf5bdfd007e07f2ec5b3e07aa02616f4eebef67

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


