Return-Path: <linux-gpio+bounces-25607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4424B443D7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B432B7BB54F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C2D2FD7CE;
	Thu,  4 Sep 2025 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bopkcvzx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591F2E2F0E;
	Thu,  4 Sep 2025 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005416; cv=none; b=USGLds9lcqLsJrXAd9kp3hTe0oQWGF/akhMjsqdhQaQaSL6geEDGjb5O7y9UcJOpmeQOg4FvhJWecQNEMm7l+zSpkD0KWCf4aIePUk+aNUFe3v7i2OWDbOk06oahxu3HoOEz76WjwHGHOA/xu/kX3K1n6aR0rmDkldZ3/gLPxD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005416; c=relaxed/simple;
	bh=cMNkrcEAHaz5vcVwAPPjgBUbsHMV2zR/t5dQZATrRu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aWMN3pQFtiId55tw343PoEsKZl4kh2VbrmX4VFQXcEtifX/4aXdcscVgvRZOsmioH3dKQYCKz0srZuYaX3c+4YAsOCBK7dkrpN7yHXDu2W+UvYLxRSaEocVD6KI5HChw6T/wcqFJrlxj1NK2nRAoIZqF1+iDdU4+ucWLfEqeGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bopkcvzx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419CEC4CEF0;
	Thu,  4 Sep 2025 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757005415;
	bh=cMNkrcEAHaz5vcVwAPPjgBUbsHMV2zR/t5dQZATrRu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BopkcvzxoMxvONFbzzkOSxTfYsZi/1PEvde1l/KjMF3AyXJOkvJ3QgNkKz0jZKqa8
	 aTATQb/kgqi5BiGLck043gbvoaz3SIy+3hk1hiuFs8VLAps1y6M+xv8GbHXMy3Kfde
	 6oDdPu07BnHeppnU4ty9TSeUS45mi4t7tlE8T5fWImmIPATgH/344uloeb9/5UZfhi
	 CFgF6QAsnvzW+4twkXgM97o8wJDtfActZlylQdfZ7J5zgm/vQsvsGaSpY2ULbkXSz9
	 HPpNh1aKSHeceJRlS1AW+gcx3I+r/qUVcKEHVOUgsW0HPgd7QsBaGJK9sEa+eZ7oMc
	 YH5/woC9UKCYw==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 kernel@oss.qualcomm.com, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
Subject: Re: (subset) [PATCH v7 0/9] Enable audio on qcs6490-RB3Gen2 and
 qcm6490-idp boards
Message-Id: <175700541199.105370.17920346254717819046.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 18:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Sun, 20 Jul 2025 23:02:06 +0530, Prasad Kumpatla wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the required
> dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC
> platform. Therefore, the audio support changes are included in a single patch
> set for consistency and ease of maintenance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
      commit: 7748328c2fd82efed24257b2bfd796eb1fa1d09b

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


