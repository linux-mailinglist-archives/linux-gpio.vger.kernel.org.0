Return-Path: <linux-gpio+bounces-18476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1178A7F96A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A04117EF16
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2E02673BA;
	Tue,  8 Apr 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW631gBM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB92673AF;
	Tue,  8 Apr 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104277; cv=none; b=Fmd5+MKaZ8+wvozqwk5mYmjNooICUR0T5ZrgijotbGdpWFXxL7CpjWDD070tRJ2QZRXRj3q97a3Kp7XjEJIXx+RFdPMzRvDIZpHYuqzpoW8lKhscbxwebTHDpBH6E3EwEQYAKw5HPHv5G2CUhYILx5vn2Uh29EoEXyw6SNVnH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104277; c=relaxed/simple;
	bh=HopQX1is+y4nSn+cadv8Wukn0LOUaYj9jBEPdHsCekc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qhl+XWsEtJmRpfQC3gBcQ91xPWZ/uiIo7Wl35ltL5wQ373vFa46I02KfcTxgr/pgMJjNLG3jN+kJY49CSo8svrblw1l8or2wmNq1I3O5Gof2kM97rR+wBf81Q5r+bPQxQaVD7FgbGboQRiACiKEnNwyA8y1CVBVEA8fYwAwMgWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW631gBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20726C4CEEB;
	Tue,  8 Apr 2025 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104277;
	bh=HopQX1is+y4nSn+cadv8Wukn0LOUaYj9jBEPdHsCekc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JW631gBMukquwdjQPaYFhhbPjZFpUOCWIUiYAol9bdYB4jxlnh874ZvzvjjLU13Nw
	 pfjU3tUJ3fIBVquMQTLeKXjjJg0eDTznP0u9PlIgs+9VFYko1Rffh8FHlE16NkPURh
	 QNNph94A4Kc2SbbNb34G/qpsD4zioDSNgcAw78F4RecfeI601Lbbpjg8Cq6I8QcduI
	 v9BLoAEwNLtsGMrs1KR3+zx7CYJ8BFT5daf9vgJmyjAg6V5wOqzlC43IJe9zNRffnE
	 Ub3NmOUS/80YiBum6tr5cReGJ9+mhWsfOx1SZQykgZDVUeEEZrjeIOSKQx8ZYB2wPp
	 0CDuyOtVd/+kQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: andriy.shevchenko@intel.com
In-Reply-To: <20250406010532.1212894-1-peng.fan@oss.nxp.com>
References: <20250406010532.1212894-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH V2] ASoC: codec: ak5386: Convert to GPIO descriptors
Message-Id: <174410427487.1933566.10804541979221140495.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 06 Apr 2025 09:05:23 +0800, Peng Fan (OSS) wrote:
>  of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
> 
> With legacy of_gpio API, the driver set GPIO value 1 to power up
> AK5386, and set value 0 to power down.
> Per datasheet for PDN(reset_gpio in the driver):
>  Power Down & Reset Mode Pin
>  “H”: Power up, “L”: Power down & Reset
>  The AK5386 must be reset once upon power-up.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: ak5386: Convert to GPIO descriptors
      commit: 82d8d3360c16687aad3bac617601f98ae9c35147

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


