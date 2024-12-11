Return-Path: <linux-gpio+bounces-13788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E009ED9D8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 23:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE90282E86
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 22:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127F01F8694;
	Wed, 11 Dec 2024 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukw4RNgG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03951F63F7;
	Wed, 11 Dec 2024 22:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956345; cv=none; b=VC2zkfU5eluwla6okr58Eqq0iHWkMu49AZMHEWmeoUoCVmBw/ETAekYbWmBoAEPBPV9G8/fxqIsDvrBDoS2uMnxLxrOppNQoU6MkGYUdJKWE2Wv0EhsHnk8wzDj6MCbhygyBWkr4UzzvxV6LgiKIdmT8etgZxM6qhqsYM03+Mi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956345; c=relaxed/simple;
	bh=5vmuvjk6RoBwup6k71p7vUifjXpsm4ye3iQ3ZPNS1h8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PC7nIfz/aeoVD89/0g2lFKtxlJxquzFDW1sD/oJo3ALi6/zRyUSn8MZqo5sNQFfPvvQmi77I8MN7LxbcVagehSHNIQZAxCGi2YeXE0jyYMYeUIRMSWyaJY0zEXdc6WNytHpUTmWqh78ZE/M2zr7kZixFwvxOFxLjbflk8Abjlp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukw4RNgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5B7C4CEDD;
	Wed, 11 Dec 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956345;
	bh=5vmuvjk6RoBwup6k71p7vUifjXpsm4ye3iQ3ZPNS1h8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ukw4RNgGUAE64Vy8haez74NtEENstVoiZz1flviLBxKzhRlBl2kuOB7APXGu/A33C
	 vir40lDc+ClGeNwoNXK0pk/wbGAzsrXjTDC3Qq/PoOCf4zdCrsFX20ZNZK7ft7MeaX
	 ww2MiiRkM+1i1mZDuLVyvnXmoAFbUQLtZ7S18oR0YZvc9IqRxiCwH92b8sopDQBhWj
	 bT4UYfWguF5pPx6D115kdCN0f1HvcH1cQ8461TWb96e2OT7m4shrtT6k1nNnoma396
	 qnKr515hAbUDQ9sqAasxTQ2V069viPoGiT7QVutdwPI6tigI5XmCYZcmNdClwgP9xa
	 07JHF1fDQrLmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD59380A965;
	Wed, 11 Dec 2024 22:32:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:41 +0000
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-riscv@lists.infradead.org, dlemoal@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Linus Walleij <linus.walleij@linaro.org>:

On Wed, 13 Nov 2024 09:20:29 +0800 you wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> Here shuld be undef "K210_PC_DEFAULT", not "DEFAULT".
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - pinctrl: k210: Modify the wrong "#undef"
    https://git.kernel.org/riscv/c/7e86490c5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



