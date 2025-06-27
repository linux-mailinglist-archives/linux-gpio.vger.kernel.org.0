Return-Path: <linux-gpio+bounces-22374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519DBAEC2B0
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 00:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0E6563957
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 22:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37C3290D87;
	Fri, 27 Jun 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTVInjYJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EFE2900AD;
	Fri, 27 Jun 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751063992; cv=none; b=oJNleUO4By6tXcFextT8O+YwCckxL/Djwkd13X3erNLwq8FZ6/p6aVVGn6YAY9Ook3skUPh7qlcvLGm3h9HSqsIrPDpoSqQFh4i9rkop8So6xFxVrxEb7x0gD1ZP+SSNh7Tk75ga1Yi9zahpsEn2XL1ao92MwqmeUaGXkwAKMHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751063992; c=relaxed/simple;
	bh=tC2vIW1KfS8CnL2FBG9wDbx9ZyXXV7ai5+nzpmwJDIU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q5Q4qRP/1FEsR0UeoneLAzxQgakQ0hrc/6ATLEne8Mc97aagAySiV8MKHVQwRywSuRq2DnYuHMHYUU5gONC4Q/vcMh7ycHbAQ8DmRnJxqfGD352OBycD8SEBBD69cWKU3hWMdtUx13cV5kJeqsn3M03Vpw2Np8ivE9DKxaPE4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTVInjYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB8C4CEF1;
	Fri, 27 Jun 2025 22:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751063992;
	bh=tC2vIW1KfS8CnL2FBG9wDbx9ZyXXV7ai5+nzpmwJDIU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTVInjYJxu8kXmclqrJt26Ca5DLFAjh72dl/u7V4JlFc1VMOJWZ6ukryUhO8UQ/eG
	 pcm5yO7mMMRdpHKiknFq9g5gDiJil5lqAhA39pjAdIINqVMMETZCaYEAfIhEgBJMY6
	 obFOHJCWxnR0jraquCE/py2GeaoMLf0GmypCRlYbppiQwiqyT0BGA5qIjjhRcqup7p
	 +5tq5/g20mvHmMitOMXe0Nwno/S9pjH2hrDV1eC024KTV0vkhoGoVk42dlWMj/47fR
	 N1eEafpOtZSbN5ZXmwazIV6f9jO2CMLK7iYg6TydvbjeoTPL9i4JbSbmoYFuaUCb3s
	 0prV94SUiHCtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2238111CE;
	Fri, 27 Jun 2025 22:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC) Support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175106401799.2079310.7398461677356212518.git-patchwork-notify@kernel.org>
Date: Fri, 27 Jun 2025 22:40:17 +0000
References: <20250626080923.632789-1-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linus.walleij@linaro.org, andre.przywara@arm.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 26 Jun 2025 10:09:18 +0200 you wrote:
> This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
> and uses it in the Liontron H-A133L board.
> 
> Paul Kocialkowski (5):
>   pinctrl: sunxi: Fix a100 emac pin function name
>   arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
>   dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
>   arm64: dts: allwinner: a100: Add EMAC support
>   arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
> 
> [...]

Here is the summary with links:
  - [1/5] pinctrl: sunxi: Fix a100 emac pin function name
    (no matching commit)
  - [2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
    (no matching commit)
  - [3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
    https://git.kernel.org/netdev/net-next/c/0a12c435a1d6
  - [4/5] arm64: dts: allwinner: a100: Add EMAC support
    (no matching commit)
  - [5/5] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



