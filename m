Return-Path: <linux-gpio+bounces-26542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40371B9A266
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437CE3224D5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F32930595A;
	Wed, 24 Sep 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM9WnQK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62120DD48;
	Wed, 24 Sep 2025 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758722672; cv=none; b=XN/ufHq3jsluqrC0nIxVujzk0LBgiZC0j1abzuT6BjUSMN9/hBwiAVYN08AkFv4x7iMNE4FVvZHCNaIXJCsQrRHLiieuVykHzhMgvxh0fT1tsXUbBck4RRmb5qI3jnwRX5OZoqRY8h4lFuFDHesvsen6bDI0n8KJMYNpvtskn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758722672; c=relaxed/simple;
	bh=C0dwQH0lvkoovYckC7Dh3gPsVdizym4Fy3oXd1r+BM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MIC59GQuWrrFAHce1kVpDxNA0FjkePoUNHKNx6y9DdClWwyX8BM4AzaDoUK6sHX0K3rv6vveF8sUF2uJ1mOfMJ+DqUfQH8pdnSpkCnlzIabY7/RJqKitb5+8Ud1FpovhTG9icQqUHe4eR2YHqCNe5CI8io3gEq+bbMlQ6MLry9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM9WnQK+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF83C4CEF4;
	Wed, 24 Sep 2025 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758722671;
	bh=C0dwQH0lvkoovYckC7Dh3gPsVdizym4Fy3oXd1r+BM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YM9WnQK+AJr/ajVZrg+1NUcxowpn3XbMi9WKFggm4MSi6Cy0Zzouy3LOjqj5gI0Dm
	 vogvFe0FXq/b6yw6FPPkamHXmeC4QZ8QnA6RusKwGzsyRXWM/mN4WmIWuy1AQctIKe
	 GoPwnM+j9hdS51BkjxdkksOPLhvoO3Mufy/SZaoZUJl/fzOkWsWTVjjaodoStG0dFA
	 XTIaTaWVHA8hExTQpv8v+1ibJkwDCa/XqCCGbqbvCCd7gQ2tss1I4cN0GTF7KXsb9M
	 rJ6aSH3wRt+zcfg0btve3j5IbgDWrUYJj0Ko/TpO+guNf/ElWH0zgPstnJjCAkp5eq
	 pEPjFvJ+T/P7Q==
From: Mark Brown <broonie@kernel.org>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Julien Massot <jmassot@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
Subject: Re: (subset) [PATCH v3 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-Id: <175872266654.1250098.18318654970419425506.b4-ty@kernel.org>
Date: Wed, 24 Sep 2025 16:04:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Tue, 26 Aug 2025 09:39:33 +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8183. It follows the
> initial cleanup series by Angelo
> (https://www.spinics.net/lists/kernel/msg5780177.html).
> 
> The patches in this set eliminate several of the remaining warnings by
> improving or converting DT bindings to DT schema, adding missing properties,
> and updating device tree files accordingly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/6] ASoC: dt-binding: Convert mt8183-afe-pcm to dt-schema
      commit: 52aefc1e3c5fbdfdd216796fbe78443ae67e447f
[5/6] dt-bindings: sound: Convert MT8183 DA7219 sound card to DT schema
      commit: cf5be90ee4dfa3c38dc64fbcc4fb70fa0180b7b7
[6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358 to DT schema
      commit: 82fd5dc99d63f948c59ac3b08137ef49125938bc

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


