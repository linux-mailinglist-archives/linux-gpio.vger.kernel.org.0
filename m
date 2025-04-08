Return-Path: <linux-gpio+bounces-18493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD73A80AF1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9428D8C6CD9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D047027D769;
	Tue,  8 Apr 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSYr/wrJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866327CCF4;
	Tue,  8 Apr 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116540; cv=none; b=AMWjlUrATpa46sgMwvposUImrsUsnWw/TlPL8gXMaEglQ4AqoaAvpnYzlS3kg7eg8Aq5Dgg1Jbxv52UKVlGw3KyScsD4pI2Ac1PkjSiFPX1SC/O6K0HZktPU0EHg/vPhca34mrepOscrRXdP5zgN9q8yCNZGtOKVx1X+BSa62Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116540; c=relaxed/simple;
	bh=XM+AsilHgrZC+uXc6rG5q/tsLJlK4RumDEB5BXZsV+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y84ZdlV7YhVvLfnHkCaAmvMv5sedY/O+x4mFt8H5WJlmZJCX/nZ35w65QGu0lzTP9tQe3j+lt2MeLQF3p3E/NSRf3g4OJ3KysY/YHzOt5LeOXtHkwW0lI1aT+xPPrkVxpmiNXDimwpS/LROMD+McOVqztRQne582yU8gXGXdWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSYr/wrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E56C4CEEB;
	Tue,  8 Apr 2025 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116540;
	bh=XM+AsilHgrZC+uXc6rG5q/tsLJlK4RumDEB5BXZsV+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SSYr/wrJ/Jt1PaZpmQELcaYxVQrlDy3wmtK2YtQGIVu8qL5WzzU9gn6hLK8SqhDkN
	 Ep8ZuRCsTA2SgwaUT6698NoIELrOMdq8S7HVktYV2ORGXPzADWXaQA0w9anaOTQgB4
	 rJF2mpoP/gKkuJRSsu/xsAV8AoYv9H2KqrGFROLN54IhHOc5uKwN0FLAB04BtJYf53
	 Pfed0H6OpHjRLGBVfAny09Xxw0OzKj5u01shPllH1EBnXKsKcQ61U+yhIO9QJ4Pf8o
	 crZhbRxdLNH5ocHFm+SX39TPINLbfrFccJm1bsL4J0xryb8yaQC1RGjaisRYPB/rhr
	 y6+lGIbPH/mmg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, Johan Hovold <johan@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: codec: wcd93xx: Convert to GPIO
 descriptors
Message-Id: <174411653740.2091760.14768802253567122095.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:48:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 24 Mar 2025 19:51:26 +0800, Peng Fan (OSS) wrote:
> Steev,
>  I would appreciate if you have time to help test again.
>  Hope V2 could work on your platform.
> 
> Linus,
>  Since v2 is only a minor change to use GPIOD_OUT_LOW to replace
>  GPIOD_ASIS when devm_gpio_get, so I still keep you R-b. Appreciate
>  for your quick action.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codec: wcd939x: Convert to GPIO descriptors
      commit: 4bba5d0e51647e06c83036b6c3f0ec65465adc68
[2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
      commit: c2d359b4acfbe847d3edcc25d3dc4e594daf9010
[3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
      commit: d5099bc1b56417733f4cccf10c61ee74dadd5562

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


