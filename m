Return-Path: <linux-gpio+bounces-17061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF2A4E534
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B73885F98
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 15:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE6527EC6B;
	Tue,  4 Mar 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUFIQLOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44C280A3D;
	Tue,  4 Mar 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102561; cv=none; b=o00DauU/JwxUh49SnaiXRiiNyCkwDIOeTPbygBxV35QgtIFaO3+9yrd10Sak4eN2ubNIrq5cEh5o8+eLpLXJKQ0mrYJQmpY/vYPcU6XUmle0IzPC5b6uDeWDrgyY+HqjcJ5/5R8iMw/aiPf/zNmDweUsuCKSxzewLuxMtTXYFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102561; c=relaxed/simple;
	bh=52x7TUjSQQWpNjcLzsxfo3TSUHtkZ2ZLty6KE9TnZ1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WcXRpKEmXS2NXuUKDsShx8WPktKsS31Y2OarOhPclK4K/csyB7GPhPX/sMC0rJiexINMqzTUerK7ZFisDW3xHa+85UlezxbOW1ArWq2QPelnd0jPKSYRsg08TjFpUKSYW5BdA/dY3G6rAyhOlXyCug/JpSDR7QYP7KIeOz5e55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUFIQLOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD44C4CEE5;
	Tue,  4 Mar 2025 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741102561;
	bh=52x7TUjSQQWpNjcLzsxfo3TSUHtkZ2ZLty6KE9TnZ1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sUFIQLOEK/Fk9lumGa2oLz7mNk8mJeHZ9FpACCkSde6hagzcMxIH27nfrE9GqSBbO
	 qdIgrhxvf0ukv+SQqVHtPH/1kYSdkcHGcsvu7d3ytk0ijwsHFWxElSaM5Fzj2CUDEn
	 n1NOHACB1cq7kRWyx0T3Q05R+3/8n+8haiPURrMkAUW8uXyZ9LleVgSwrkX/MeSyL/
	 4KbuZu7gCcUxa00ST3zmzSt4Fiz8y1vPyP80zFwCRTD8xKcYLh+2MY5+kN96auA3a4
	 5nY1MKr/teMu2AkGtclt8gQCXtKUd+sgqP+k11RV3kO8SCA5DcHF2fhIWacuc636qQ
	 fuTpiuJahbRtQ==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Message-Id: <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 15:35:59 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Mar 2025 09:41:40 +0100, Linus Walleij wrote:
> This drops unused includes and converts one Samsung
> codec to use GPIO descriptors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: samsung: bells: Drop unused include
      commit: b19d340d5d08c5940ce612c2a1b5fe3a8a401f9d
[2/6] ASoC: samsung: littlemill: Drop unused include
      commit: c4b2d9643a06a5326a778c4d77d6fa60e0f3d6b1
[3/6] ASoC: samsung: lowland: Drop unused include
      commit: 5c06f7f3d8374df1cec3b353306a4d1032a60f44
[4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
      commit: da9146c19b1774926148ff271c4a3dc8d7891b18
[5/6] ASoC: samsung: tobermory: Drop unused include
      commit: c095b7a27529d1d18b3b36a47f77a1419f0de939
[6/6] ASoC: samsung: tm2_wm5110: Drop unused include
      commit: 0a22454ab2eca530702b2689858909b608953703

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


