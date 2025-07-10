Return-Path: <linux-gpio+bounces-23103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F756B00639
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 17:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F89E3B34BB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 15:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B66275110;
	Thu, 10 Jul 2025 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAvrWfsE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FFB274FED;
	Thu, 10 Jul 2025 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160372; cv=none; b=qKxQFXUwF8S7zHjwTEGGbGgCvJ1udITxa7iCwk3Dqen977FoqkcrhLQA+uV8ed6UshSvWUFNLHYZNO435XzEUD7sjKAw47T+d0Kgyy7fPS1AcKr0ryeYfwB/14XOPWDMpDGUxMavDp4Z5vO8xADiReSFs3/V69OPV2DU3egxjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160372; c=relaxed/simple;
	bh=D5Kh0lTbzRmAlY3ACU/SQlP6zoq6+IFqg+QHVrwwKgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MtNJ+85rWlLLHiB4O+lGDUGafcIJITxB9osrAShkJYsnYYExvTWy6TiW47IA4ZVvIrC3yV/Ws/8KpkfmmAFpQ3VNVlV7/oc3rHhr5j1X0u6DheXJY4NycdCNoddIywLmXgPTCdOPB7bLyJmYFRaDYGhVu1HVCYxVCIe0+deRvDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAvrWfsE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A982C4CEF4;
	Thu, 10 Jul 2025 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752160372;
	bh=D5Kh0lTbzRmAlY3ACU/SQlP6zoq6+IFqg+QHVrwwKgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lAvrWfsEZ8C9y0onFB8XOmQzIWx3xW9+BevTmnVPLVLLl8fbyYQ9R1u9tGHk4oagR
	 CG2qPfwULc2joxuEGka+BO39iiqHsucVUUXUzlEG6rMs9lh1hA3VRtpz+9JPH/gElH
	 FXqodi6EkOK1IpV9/xpQtANqqr60xLL4Hm0tjoj8UCqYPO96m1z+Z/NiUOVM+hg0O/
	 HytO6UE5jGUrJzznCXcUY2VABeQ9yttFBQKoZnZ19d+OK7aqDhgVdf3/EBU2XxCZsl
	 zREnCKcVDJIf+uQyCBhOgP/HWNNmU36IsBw0FGGRH34ptknaB+uC+Gx6bwUN7rdnW8
	 V4EUBlHR0jEfQ==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Julien Panis <jpanis@baylibre.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v3 0/8] mfd: tps6594: Add TI TPS652G1 support
Message-Id: <175216036871.755014.4346115067078586712.b4-ty@kernel.org>
Date: Thu, 10 Jul 2025 16:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Thu, 03 Jul 2025 13:31:45 +0200, Michael Walle wrote:
> Add support for the TI TPS652G1 PMIC which is a stripped down
> version of the TPS65224. Support for the latter has already been
> merged. Refactor the regulator driver to ease adding new devices.
> After doing that adding the TPS652G1 variant is really straight
> forward. Some care has to be taken by the interrupt handling (of the
> regulator part) because there interrupts are used for voltage
> monitoring which this variant doesn't have.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[5/8] regulator: tps6594-regulator: remove interrupt_count
      commit: 16d1a9bf36ef649b1fdb866985b4b87584491fac
[6/8] regulator: tps6594-regulator: remove hardcoded buck config
      commit: 180a135eafa9e05657559bb04cc9eb6a86ca45f3
[7/8] regulator: tps6594-regulator: refactor variant descriptions
      commit: e64ee27abfe1e9baea14b31c0a6b6bf93ac8652c
[8/8] regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators
      commit: b30d390812c8559c5835f8ae5f490b38488fafc8

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


