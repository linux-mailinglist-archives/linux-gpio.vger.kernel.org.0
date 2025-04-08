Return-Path: <linux-gpio+bounces-18515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7ACA81275
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 18:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D174718998B2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E2E22DFB0;
	Tue,  8 Apr 2025 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK6iCA/P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA5205ABF;
	Tue,  8 Apr 2025 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129903; cv=none; b=iwwVn37T3ls/6DyGfX0FfycesdV8D2lqZRnuUW/S2DZai2CwtCMf0WPOgWk7aNHxDUUyo/aDwNLTIgd3pBW/vchCV0/RPbn+pbBJF7QQVGctuNlQ7WOdhKCpFhB+GoyLBbGnu480MtMkn5vdu8aZDat/+8ZmJVE3ZLjHd1Ulv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129903; c=relaxed/simple;
	bh=egziIIrJF2lqSbR/TCnJppLKkivNvDY0/5IO3lTLgJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gDK8/RWnfzs0LDqFZkVYu/gIwJcXD3Rv0bitqwuPNIC1z+18FW2YTutVfea+FrjsIJrBWe0dpTxfjRGMxxg1d8OJOjNOuuEYaFenBAflRD8lFqCeGStpXhR/TkMizKCQndSPHqdXDXy0eiEp+ybm03s+ccupDWT2YgfV4bgWcHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UK6iCA/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BF9C4CEE5;
	Tue,  8 Apr 2025 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744129902;
	bh=egziIIrJF2lqSbR/TCnJppLKkivNvDY0/5IO3lTLgJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UK6iCA/PXeVfE+NUy9zsr035g3uKqIlH/wjKEXTUqc8Eep1ISLAccfNVBE5CiIhH8
	 yIJlPojG6LNrQ+I582kYfNFY3lnbHKmrx4dz97/QvoXyx/khOTIHfO4B1gMQ/WDlhh
	 8Knea54AxjcN/zNe7Q45JooCod3k/X4FnkgDi5Ld8NYFFJM1wx34zxBpmEPhzw9JLo
	 5XVjhEthszBNxn1oo6EhlQKqVf+T1ONg5aKEu2D0Uu+lCIYblM0i4hpsNxmgFKhom+
	 Wx6ylRd9aCiTbtZoXMIrXIDcIBqIP5Jk/owp3/P465S6unG+NaECaDDqHNyeLPbbt+
	 5eugeNT1TePQQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
Subject: Re: [PATCH 0/4] regulator: rpi-panel-attiny: use new GPIO line
 value setter callbacks
Message-Id: <174412990132.2213335.9669148842146678590.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 17:31:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 08 Apr 2025 09:36:27 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the only GPIO controller under drivers/regulator/ and - while at it -
> refactors the code a bit.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: rpi-panel-attiny: don't double-check GPIO range
      commit: 06bab1f101337ae9469a7d2c6ac4de5db64e8160
[2/4] regulator: rpi-panel-attiny: use devres for mutex management
      commit: 1326e295d6b4ffc9647bd4f073b787b4f79d6b6e
[3/4] regulator: rpi-panel-attiny: use lock guards for the state mutex
      commit: 50faedda12e46918a11194a30c2bedf2b983fae2
[4/4] regulator: rpi-panel-attiny: use new GPIO line value setter callbacks
      commit: 936df52c29b0d422665c5e84b0cffae61611411b

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


