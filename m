Return-Path: <linux-gpio+bounces-18399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC6CA7F039
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 00:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AF23AF28D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 22:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D63C224887;
	Mon,  7 Apr 2025 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJuWELVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A86224236;
	Mon,  7 Apr 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744064103; cv=none; b=Agvf+iZgGcnrAr+qrIbpZGW/BvkoVP5Nw/2aS4or2cHOI/yOFY+izZ4+xCR/w3ZsuRB65lkx1I52SiY4zl2LmCSHoUGaIQKlqawHlLl6hWnRus2DsOUj8p5wnElRmPd2mSPxnOPE9MJn4FyO+aCaWbx0ZHWC6YceQYENhS6yPRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744064103; c=relaxed/simple;
	bh=VSVFpQj3hn1f1mOYrZD1BOgazgCdpZCs00LueNXdzzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JOVeEZ+o9H03NF9PpaLXBFeg3eQ2D+HxvJgVL4ew0uqAEkqE2B+wZciZhwEmVrssjBNeS8tMF5sGhcyg6/u+SNyhNVoDBYSTFTTaJWNzhz1/wWBkbS34MrKN21YHiXVsKemrT+8SEZvrzbGHVPm8zoAMT2P9m4460BISLWsna4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJuWELVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690FBC4CEDD;
	Mon,  7 Apr 2025 22:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744064102;
	bh=VSVFpQj3hn1f1mOYrZD1BOgazgCdpZCs00LueNXdzzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XJuWELVUhqQI8860xY5NNgWNmLZ/iEIuwT3i4O4xBmSd+gEver/RHjgXSMdguCUwo
	 /HOlrnvMI6jEUOAxTwJTMfNTOzN38f0kCUyEwyPLMBZMrdehC6SfR+qRPowJoaDre3
	 bXTlmo3tACC/54sWNlCYN9n+5ktc3PLUTSzE0UY4dKnmL3Ait/lDs7Oh8MfANZu+mz
	 87HptC9AAu6YTDk6jjYu2xxBbV6hyznNjX05DQYx54Tm8fkyXx+6Rw/FkWBXmGI51D
	 17M37eFe5Lh23GhWllcKmr5NgezNU6aMI0grfKKSP/WdtbPne3MKh/DyUIDnAvASeb
	 pKy3IlIe4BkNg==
From: Mark Brown <broonie@kernel.org>
To: linus.walleij@linaro.org, brgl@bgdev.pl, krzk@kernel.org, 
 lgirdwood@gmail.com, andriy.shevchenko@intel.com, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Message-Id: <174406410013.1124451.2033233013803863409.b4-ty@kernel.org>
Date: Mon, 07 Apr 2025 23:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 27 Mar 2025 08:49:44 +0800, Peng Fan (OSS) wrote:
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] gpiolib: of: Add polarity quirk for s5m8767
      (no commit info)
[2/2] regulator: s5m8767: Convert to GPIO descriptors
      commit: 16b19bfd80402bb98135c4b65344e859883766ec

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


