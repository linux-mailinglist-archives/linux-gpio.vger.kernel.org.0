Return-Path: <linux-gpio+bounces-18791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4C1A884DD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 16:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590303BCE2A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D712973C6;
	Mon, 14 Apr 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN6LPv1I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAE2750FA;
	Mon, 14 Apr 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638993; cv=none; b=YFDmN8z89mAnazET/SVS8y4N92icR7kc/xN946jRRVt/Nu1BIHPSqbHSRJ1o57S0n6Cej/9e9sUoBvv64qP426uWaQOJ1HvQCEOnvMTMP+yadZZOfHY/6ue0SJDcnmaybmonBwgMsDNU1U6+YDL9sdBff5ncZZ8L41tXg/qvUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638993; c=relaxed/simple;
	bh=p86DF7FcIx09yJCPPUqPEE8TFL7RTxaH2cQR7k3XjQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UN7Iv0JhEnKlVeDxWWdPHXcHE7/ZIGaAq28rq3uAcEORaIoi/vroLOXmb1wZbXdZpnwWhoWf206yyd2h8vp4cCz+9fCaMUun194JrYx7znqCvDTVl77iqtlRYYOF2gr7mUNuiwTNO9XH3hVYnMcLAQ1QlmpLIaUhaHwse22qs0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN6LPv1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A131C4CEE2;
	Mon, 14 Apr 2025 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638992;
	bh=p86DF7FcIx09yJCPPUqPEE8TFL7RTxaH2cQR7k3XjQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nN6LPv1IAp7a3jAPQw6YdRmVMgkKQGwwJXJ3Cr4uryV9GbBXq+YHs8KKNd1gdpYEr
	 +ioWvTy5wYH9o8tKgsYO88m4Dy+fog02BUvINALx4cvHLtFaahIYLm3Fos9xgobZ1R
	 2KO0nTiJo8HLhIkrpr7jW4mfYWV18PmalNbqZI1Sz3lu61V+7ZYpZs1NJkGHqKjcO+
	 jQgzfQqlUIBqRiophtM8/KQ7Xi51yM5bQBsVQ+HdrF/3+Uecf1iCuRQ0m1NgF2CZg1
	 df3AN6Rjvr+R7aOoBRItYVp+EmpyFARUi6nhnJx3YhskD7QVlGlz6k2hiEXtdbfw5T
	 YUfycbQONQCOw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
Subject: Re: [PATCH 00/12] ASoC: convert GPIO chips to using new value
 setters
Message-Id: <174463898936.86688.16286975854608560444.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 08 Apr 2025 09:38:18 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ASoC GPIO controllers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: soc-ac97: use new GPIO line value setter callbacks
        commit: cf16c640143161ed5d4b196e38b7aa3fc7787510
[02/12] ASoC: ti: davinci-mcasp:: use new GPIO line value setter callbacks
        commit: 60631801abb7112c8a086dabca89d5fbb06d7d1c
[03/12] ASoC: codecs: wm8962: use new GPIO line value setter callbacks
        commit: 403dddbdcb49a77ba8873b0a15a9ae683aec2cee
[04/12] ASoC: codecs: wm5100: use new GPIO line value setter callbacks
        commit: a336078f23343931db99bbda857965c5b7ebefd9
[05/12] ASoC: codecs: rt5677: use new GPIO line value setter callbacks
        commit: 317349ce80aaa404abfa0bbbcf99876736d8c237
[06/12] ASoC: codecs: wm8996: use new GPIO line value setter callbacks
        commit: a8d4913690479217832ab1e73f4c5af0b52a0f27
[07/12] ASoC: codecs: tlv320adc3xxx: use new GPIO line value setter callbacks
        commit: 346d3632303aa67c698b0b05e0126ebd29ac99f3
[08/12] ASoC: codecs: idt821034: use new GPIO line value setter callbacks
        commit: b0cf20b43363fb04851c4773a107f7ecb9731883
[09/12] ASoC: codecs: peb2466: use new GPIO line value setter callbacks
        commit: c849a7cfdcd14333604fdf60bedb2e183b4164bd
[10/12] ASoC: codecs: wm8903: use new GPIO line value setter callbacks
        commit: 127c53d620cb134adbbdd7d43a369f3940f71172
[11/12] ASoC: codecs: zl38060: use new GPIO line value setter callbacks
        commit: db81f6fa2771681249ca1d23366c893f3535fe10
[12/12] ALSA: hda: cirrus_scodec_test: use new GPIO line value setter callbacks
        commit: 8d2e914482311f7746fe7b0e520bd42794d6aed8

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


