Return-Path: <linux-gpio+bounces-13776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769E9ED3EF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 18:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1092282F1A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA01FF1DF;
	Wed, 11 Dec 2024 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiAKsZet"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4DD1DE880;
	Wed, 11 Dec 2024 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939175; cv=none; b=DKQ32fEbgbkkM7ZrPgy23iew7MyFaH/bfKq290YbposrFS3553lhHRlpl07FX3hgpyRaI0irXrLqx8VEjI0hweIxbvoTRQ6jljKnTBLJffpui+GQ10P6WyAM34vkUOn9voSfYLeWT5yCgYpZnWpWm0oKvHpZIu/vjUwqsCRl7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939175; c=relaxed/simple;
	bh=vOVt9wIICb4stJ86oXlAZKMSYQkw7EDhkwpdVdVl2AY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ERt9TdatKQwRPrdNATLq6O5AKfxilzqk+KmUfNl12PuD4ULvfMSGKoZbJFn90bAI1gB6x/vIxxpwcTM5wz+XbaoPgyP0OGuhP/cQ6ycNZD5CnCUybaURBAElEeNMYWPwzlrM9mWLEIBEw90PbwkV1L+uOOrOwmx6h1sb1NMVUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiAKsZet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BF1C4CED2;
	Wed, 11 Dec 2024 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733939175;
	bh=vOVt9wIICb4stJ86oXlAZKMSYQkw7EDhkwpdVdVl2AY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SiAKsZetgCXQ5lTUnNEl+W5N8Nj8MZABFwAJcICPIpy8XTo0mT7K5XK3HkCZY1XVs
	 Lr/rH8CTvmoGmUcgv528aOdr5gyWeacRr6KwVn8VElZz48MpuAj+c3A73RRpQ0D6rM
	 qLfah4JEaxW3+FPEFZleXd1RZQdIv/mwsAQob8KaRdyyELb0+ggro3L72VXUw3Hzq2
	 qURHfIpkVCZOO5nT2+MpQ8v/FX5jGtXxY5LJCscpA+Y+Zrd1Q/3CP0Y5vEWxzTnx0i
	 mUW4l/8VZDCSnKIzFCUuqhUUBh9B5XWGg6MF4Cu3DOe6jnO3RsdXTfuHqfuXHTNi5K
	 os89zKR5XwUIw==
From: Mark Brown <broonie@kernel.org>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 lgirdwood@gmail.com, magnus.damm@gmail.com, linus.walleij@linaro.org, 
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v3 00/25] Add audio support for the Renesas
 RZ/G3S SoC
Message-Id: <173393917085.1376442.1457625888835465190.b4-ty@kernel.org>
Date: Wed, 11 Dec 2024 17:46:10 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 13 Nov 2024 15:35:15 +0200, Claudiu wrote:
> Series enables the audio support for the Renesas RZ/G3S
> SoC along with runtime PM and suspend to RAM.
> 
> Patches:
> -    01/25 - add clock, reset and power domain support
> - 02-04/25 - update versaclock3 clock generator driver to support the
>              5L35023 hardware variant; versaclock3 provides clocks for
>              the audio devices (SSIF, DA7212 codec)
> -    05/25 - add pin control support for audio
> - 06-20/25 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
>              were also included
> - 21-25/25 - add device tree support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[06/25] ASoC: renesas: rz-ssi: Terminate all the DMA transactions
        commit: 541011dc2d7c4c82523706f726f422a5e23cc86f
[07/25] ASoC: renesas: rz-ssi: Use only the proper amount of dividers
        commit: 55c209cd4318c701e6e88e0b2512a0f12dd02a7d
[08/25] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
        commit: 100c6b22d6c70adabdf45dcb346d7d853bff6a30
[09/25] ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
        commit: a73710a25808a585a2bf0a8325eb16fd6a2f370c
[10/25] ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
        commit: dec61e16e72db196e8dc1daf7f7022fd98e6d921
[11/25] ASoC: renesas: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
        commit: 109e60866f11c7db8f720f01b0bda3105c47b463
[12/25] ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
        commit: 4bf77dfa3308b7cfda29d9c4ead1dc32f1ceefa9
[13/25] ASoC: renesas: rz-ssi: Use temporary variable for struct device
        commit: 403366d2a43eb7c911c6cddf1d7882e429d1212d
[14/25] ASoC: renesas: rz-ssi: Use goto label names that specify their actions
        commit: f0c155c9da7536ab33687b5207eb21e704122a56
[15/25] ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
        commit: e8fcf25f562891d5c0734d4f49c44bb6aa72bc15
[16/25] ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
        commit: cf3a79e4f826fc680fd7bfef7c427e2cc6023bc3
[17/25] ASoC: renesas: rz-ssi: Add runtime PM support
        commit: 3888672495fcaee98b90196c0a899b1c2eb57d5b
[18/25] ASoC: renesas: rz-ssi: Issue software reset in hw_params API
        commit: fc2a31affb22394d1d74d3ecc86b5c68da33d52a
[19/25] ASoC: renesas: rz-ssi: Add suspend to RAM support
        commit: 1fc778f7c833aeb13041adc06f016f1a2dff7350
[20/25] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
        commit: 699a9733a354d74482ae4d4304acdbb0c0318a23

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


