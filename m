Return-Path: <linux-gpio+bounces-18609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F3A831D0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 22:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B593B11D2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 20:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF15213E6B;
	Wed,  9 Apr 2025 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYkYflST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21E2139D2;
	Wed,  9 Apr 2025 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229929; cv=none; b=PxuGRnk2Ra8uW6FxirWoRL1RNQczgGU25YxnDxeqwz/bocrjLIWJQVZOHtPR8CzwOLb3AYpOozZRA+k43/yactobCiMHzDoWaXzfetvJ/6AtvdfOYqMITBWSJrtQlHuJi03rT1KfgX1WmqKobFnFMINk3j0TSiQ37gK6/qKUFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229929; c=relaxed/simple;
	bh=AYozKfIJEGejODFACRHk9ANJ/wk559+JZBhYyYM7+aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rs5nAsgxq5oMo1DsxnQ9SMBQA8C4YGeRrkNFbEhE6bVCqknVrXcYuDs9RUCRQ08YfQiiStNtMVCIAKgU+oNsaeyc8stsYW60jYXw0SIGmdr9Xh3bHc0bPZSlND6wll8xq91hMCU0Kp2JxZkjAarF1xoX8cpds/UBiCz4/yNASdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYkYflST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF75FC4CEE9;
	Wed,  9 Apr 2025 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744229929;
	bh=AYozKfIJEGejODFACRHk9ANJ/wk559+JZBhYyYM7+aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qYkYflSTZIzuP9ZJBFKFxzj8+/4P13skp6yknFnyxufbE/tp0Jh4l5FARbXObVZiN
	 LwEQaUCEkNMOfd9+gdRNGUuOI5LojuMkjQMyPgPPKSryMLqpCLUx1icWTpEuhvPrp5
	 +SCbY1KlsXGmKll8FVoLQP10AEWAC7lLY+icRJvQNlWypkXaikHeTURzd/p41Zf/ID
	 0mKr2czyCegYT3hyFg7UDFZwhalbB1vV1bbRA/58sGcOmur5Q/+MZ7C1lnzJqEM3d1
	 ZDpPEGlLi0+PYwjjBEhWOf2azBcVvfrxGN/MbVOzTg4O4BMwDtDmE4MkEaZu4n/KSx
	 jEpeGIYPMrb7g==
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
Subject: Re: (subset) [PATCH 0/2] gpio: don't compare raw GPIO descriptor
 pointers directly
Message-Id: <174422992757.1502590.17781774762954372029.b4-ty@kernel.org>
Date: Wed, 09 Apr 2025 21:18:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 09:08:13 +0200, Bartosz Golaszewski wrote:
> Handling of shared GPIOs in the kernel needs some improvements. Let's
> start with a simple change of not comparing GPIO descriptor pointers
> directly as there's nothing that guarantees that the same physical pin
> will always be represented by a single GPIO descriptor obtained by
> calling gpiod_get().
> 
> For merging: I suggest to take patch 1/2 through the GPIO tree and
> provide an immutable tag for the regulator tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/2] regulator: don't compare raw GPIO descriptor pointers
      commit: aaf6223ea2a1ff9316a81bf851fd5a0e82635b60

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


