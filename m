Return-Path: <linux-gpio+bounces-12652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6D9BFAAB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 01:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3581F23C50
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 00:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829873FE4;
	Thu,  7 Nov 2024 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSi6Nn+f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614B161;
	Thu,  7 Nov 2024 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730938915; cv=none; b=IddyKXujnt7SLmPl8XelVfUgGGHJ8bNmQA53/Y/xA4VXdfFZn64YpB5sAtyt8Gt0Ks13i4FdhgYdGtdU4d6XYxxeyLtlZ8AuLWJjiJkWok6X8xPJRIQUKsQLsV07hoJzYaHwXU11kip4dC4bELvRD98j4yjC53LKIZESDJpi3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730938915; c=relaxed/simple;
	bh=+CNWzMeB071PME8CXmstzWM4w5EMF9AzDs7sv42HsIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uaeu5qZXrqc5c6q8WvkFvS0YIWRwAw3dTEgHRwjwCKFY7r3EF6B7yZGvhP27D45BBEUHhoJQN1YyEUkwzByZ5/0wr00MDXb5G/g7XOfu4kjlEDGwNn90YR8yJCZ7Pku1tf5BLTVlmtNB7GIp8n7LswrKGiAKh+ReA6wql/MVsZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSi6Nn+f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DB9C4CEC6;
	Thu,  7 Nov 2024 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730938914;
	bh=+CNWzMeB071PME8CXmstzWM4w5EMF9AzDs7sv42HsIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FSi6Nn+fZyQj7dKxHIZK7DT+LTkZfbwqFASaTgkoGMlINncNpG1lbmos3IUyB+kWR
	 CtVJfQv5WBnN0qiss3L6VkLe8dn7SmaHZlDGrW4HfGyufCid71CoiZkmEmXkwmjYe3
	 NQq+FodDM5h773Dq2XtMGw7fGqRi8oJWlrDrUCPvSPFHPq2zXRhGXgcjdeXw3QNpoU
	 +M21tQeGCmbJmcrDe7i0Scvrk88eWdN8o+LtiYkBkD7+c/uHZORrEkkU9FdlkYnArr
	 gB3iNcLbiQsfRCDVuBtG2XgkQn1ae9A7c3q6fbxkR0zPBQsrMXj5mJzGA5Xvrrkbiu
	 NbmmDAP3XPMew==
From: Mark Brown <broonie@kernel.org>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 lgirdwood@gmail.com, magnus.damm@gmail.com, linus.walleij@linaro.org, 
 support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com, 
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH 00/31] Add audio support for the Renesas
 RZ/G3S SoC
Message-Id: <173093891006.248820.1343956081297583948.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 00:21:50 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 06 Nov 2024 10:17:55 +0200, Claudiu wrote:
> Series enables the audio support for the Renesas RZ/G3S
> SoC along with runtime PM and suspend to RAM.
> 
> Patches:
> -    01/31 - add clock, reset and power domain support
> - 02-04/31 - update versaclock3 clock generator driver to support the
>              5L35023 hardware variant; versaclock3 provides clocks for
>              the audio devices (SSIF, DA7212 codec)
> -    05/31 - add pin control support for audio
> - 06-21/31 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
>              were also included
> - 22-26/31 - updates the da7213 codec driver to support the DA7212
>              hardware variant; suspend to RAM code was adjusted
>              to cope with the RZ/G3S power saving modes
> - 27-31/31 - add device tree support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[22/31] ASoC: da7213: Populate max_register to regmap_config
        commit: 9d4f9f6a7bb1afbde57d08c98f2db4ff019ee19d
[23/31] ASoC: da7213: Return directly the value of regcache_sync()
        commit: 841256954037ad80a57b8fa17a794ae9a01b2e23
[24/31] ASoC: da7213: Add suspend to RAM support
        commit: 431e040065c814448ffcc2fac493f7dbbfb2e796
[25/31] ASoC: da7213: Avoid setting PLL when closing audio stream
        commit: 1e1a2ef95b571825ca9c0113f6bef51e9cec98b0
[26/31] ASoC: da7213: Extend support for the MCK in range [2, 50] MHz
        commit: b3296f9095d6ad24723e5ad89c28acc317d0c3cf

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


