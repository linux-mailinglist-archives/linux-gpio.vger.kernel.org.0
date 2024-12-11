Return-Path: <linux-gpio+bounces-13790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A69EDA23
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 23:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BFC0188A1B4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 22:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305B21F37A5;
	Wed, 11 Dec 2024 22:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sX1m5oM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E21F37B0;
	Wed, 11 Dec 2024 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956381; cv=none; b=M19Fz9MqTYMSuu7vP8bi1Q20sfLrTnCTgZ4d6hONjk7YefhgrHK5sp7zUqLauZXmbQ10rON1tkohUvTveWvYvm2z2cNlYsdWqHPb8Zd0WVoSU+QBJLacrEaDeLfPX4gzrngc2S0iEBe1B4UliFemf9DSQa8kbF6yOzLPbIDA0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956381; c=relaxed/simple;
	bh=+r7obNnqA7SvuvQvjFDZpPRvtSWlHovJxu+KW41vPZM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r9NrJfQg+wVLh+5lBiRTz3hQjkLCI20RRCCnl2edMCkQUwvtlWYaHIUsXxRxzic6nbzUmRKgt2vf3zA7oMRPcelkmaiEqEei/NfnDe0oXnahHsssYVuWFHo7phgiCpB44s3rN0R4pYKsAKEr70wabcH6q2Tqs9dQOpUW2od2Lnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sX1m5oM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690E8C4CED2;
	Wed, 11 Dec 2024 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956380;
	bh=+r7obNnqA7SvuvQvjFDZpPRvtSWlHovJxu+KW41vPZM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sX1m5oM/pt2uCA/7BkmXCnUscvWJ5y3EA8oKefUedT6RK15/amkrFVM8gBfk/6KLf
	 mnqMHyVprwVj7gR68d4volCH41ZxgqcNkznOxs9MYOuUALZ6zsCUvE4G/Nh+Mo2xjJ
	 H4NqjsDwBrECVZK2pOtU0XccNhUZ97KkO83HSNXtOKoE2K98HiFw1yxDU5JisZgblD
	 1IntGnIiiN/GchHIRfSlOSwsDvz2tAzi/4ydENFBvuKKDAHKjjNT1kIEIsLnZenexS
	 O/cnCqNLQYZAbx+jK9gB9IIctJmPYdYjfxIm0eA6B9cgH+HH8LomsFIEVXrJTNjapc
	 /xVwRBhDnzu7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE39380A965;
	Wed, 11 Dec 2024 22:33:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:16 +0000
References: <20241029012312.3448287-1-unicornxw@gmail.com>
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 inochiama@outlook.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 unicorn_wang@outlook.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Linus Walleij <linus.walleij@linaro.org>:

On Tue, 29 Oct 2024 09:23:12 +0800 you wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> 
> [...]

Here is the summary with links:
  - dt-bindings: pinctrl: correct typo of description for cv1800
    https://git.kernel.org/riscv/c/4905aa25d31f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



