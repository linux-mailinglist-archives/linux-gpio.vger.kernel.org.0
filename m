Return-Path: <linux-gpio+bounces-13789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 854709ED9DC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 23:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B24718872FC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 22:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E78F1FA8DD;
	Wed, 11 Dec 2024 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt21d5jK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93B1FA8D1;
	Wed, 11 Dec 2024 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956347; cv=none; b=AeK8B1piYu/zO2NxOft4j+Gy94uCPy2hFrfO6gfiUdcyeYxyMMYhFXrdfg0npd6UlbMB2W1v+Eb5mm01tEO51/PQM6WHeYosFA3xQXfTQTlWr8PiIGI4SM6EL6dqsgv4Ss1UD6KU6ik2d6BEur7OPlJu3ITj/p7d7bjJ5vxwDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956347; c=relaxed/simple;
	bh=u4gaXs5sosKWY77rmkfUwUca79BA3tp4W9GgBMx4WJM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cNOSrEq1UMNukFtbvKPfEVIurIJK9Ej4sf8h+Q1AUoQ6OSRCBGymfl9l8Gk2MOLCxXPpb0cs6UpdS6pDmal9ZokWTBvVfIVnYdNWLt9i7yYJVxiYGpRRJZl1CdvUGp0Y6HS+6amxPvrCrEia0cqHxCTDI9d6c+cBnLzhc91cwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt21d5jK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CD1C4CED2;
	Wed, 11 Dec 2024 22:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956347;
	bh=u4gaXs5sosKWY77rmkfUwUca79BA3tp4W9GgBMx4WJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mt21d5jKVhkwSjxHePxlM4O/zLpsGeiRd5tjyK2pX0BJTm98heLfhm4LJOYBbfwZa
	 atA+ZiFZbqY75h4AxHIgC/2D/ZDPVaj88Q1VIPtRxek+GeuHfna2eGz2IcTu7E2bjF
	 y+8Y/884d5ESblaH6xap/fCr939WefZ6WXlf3u2jHPjxUjx0H6/BcBNZYsujX1rhDZ
	 rsTDJm+pOrnde3dqEJnLiOkbyX+OwHMfU3XQn3f+uTAfMXXMKEt8ozQzF8UdLES1WW
	 E07AquHPMxaLvuLu+zuiGq5SPDEJll7lePXJFRX+UNYglftZp2s4gTIYeuYtmaZ8Zx
	 Uw+ir5YffFaMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70A6C380A965;
	Wed, 11 Dec 2024 22:32:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:42 +0000
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-riscv@lists.infradead.org, dlemoal@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Linus Walleij <linus.walleij@linaro.org>:

On Wed, 13 Nov 2024 15:12:01 +0800 you wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is not needed anymore,
> use its name in the #undef statement instead of
> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v4] pinctrl: k210: Undef K210_PC_DEFAULT
    https://git.kernel.org/riscv/c/7e86490c5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



