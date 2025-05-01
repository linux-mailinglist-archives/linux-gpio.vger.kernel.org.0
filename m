Return-Path: <linux-gpio+bounces-19521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256DAA5B2B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 May 2025 08:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0E89C5ADC
	for <lists+linux-gpio@lfdr.de>; Thu,  1 May 2025 06:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF9626B084;
	Thu,  1 May 2025 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icr1+AxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86586267AF1;
	Thu,  1 May 2025 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081896; cv=none; b=SD8CRUsinMuDM1k0D0IEFnOWDSt7ghg3V07bTztKXxMNBb2/ejfGYqPOE80Tzyuu3ztlpg1kIJXtRh03OUNrz1D11gVc6WFgqSRBqpXFQF0fzxU2KRWzOnGYUywvSIUsByVNkAaLStZ3bt2xjIs8L9OGYBrOHNusVzeLxJh/wF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081896; c=relaxed/simple;
	bh=hedUuVJ2ba0To/dZiYYHWY2dIC5+4M9qP+za4OwnZ1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QIkt5sntAM0OGIGBpXMvXDdeKmQHT6YeI6yvImQw0MtC76GvJgggGvZEH5Ut8SDD04ESuYmAus/bYiFf5zNKt+CLO9vIap/gHPBYypzmUwjGznExBcgbcC+Y54imYKoKY9nWGRru2zb3hlpmXA962yIZ2ikfI6AKGYyjR4DMG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icr1+AxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8CAC4CEE3;
	Thu,  1 May 2025 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746081895;
	bh=hedUuVJ2ba0To/dZiYYHWY2dIC5+4M9qP+za4OwnZ1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=icr1+AxFz+6Eh8RkzaaS3QtswMIX5dGtrA3UEDJyKkDK0Qa/3471NxLr1RV5xJlDs
	 VtjQVfZkqZv1CBO+CGnsZeiFCmltdyhzNgupbRBrPZ64qzCA+/qJjM7wnodqQ9J44W
	 lGi+WePtehz1ztuMpE3umisYaUDQu/6H3J5RORcb1pkscSUALKrcpWj1ue9QCZK5DY
	 XRQb/W9gu5hVC00EJUL121/M8+ktsPhGfWLGhM7UxiSbMEi9jZvXsuatl1TKuhKKeH
	 81k7JjtDFqIPr2Q/FfLh3cpEYC2V2NtEdkhLT/8f8IbaLEdH00cJvQMgfh6XzWTmLL
	 9vtByWf00Vh2A==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Tony Lindgren <tony@atomide.com>
In-Reply-To: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
References: <20250428-twl4030-v2-0-868d0d572f12@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: codec: twl4030: Convert to GPIO
 descriptors
Message-Id: <174608189176.4035867.4222681481103578694.b4-ty@kernel.org>
Date: Thu, 01 May 2025 15:44:51 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 28 Apr 2025 20:12:45 +0800, Peng Fan (OSS) wrote:
> This is separated from [1]. With an update that sorting the headers in a
> separate patch. No other changes, so I still keep Linus' R-b for
> Patch 2.
> 
> [1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com/
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] ASoC: codec: twl4030: Sort headers alphabetically
      commit: 5ae1bd2f6312948231e72cee1022dd6a0c29c7d0
[2/2] ASoC: codec: twl4030: Convert to GPIO descriptors
      commit: ff9ae9b9d938060300789c763fea3ce2ab56b452

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


