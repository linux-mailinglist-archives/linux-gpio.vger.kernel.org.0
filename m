Return-Path: <linux-gpio+bounces-22666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B2AF61D7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 20:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6EC4E74A3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984DC2BE63E;
	Wed,  2 Jul 2025 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzXbebKN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511FA2BE620;
	Wed,  2 Jul 2025 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482325; cv=none; b=YWILJ65WycpSmA8Q/8+3h/7buwegdEuu8r2stufuU4fpxTlyYrsUDObADzkaljZhnFrKk4U5AuYF1OuA7rrbdk8uK7fHcX3FJh+5cuwDK5QJT+kUq6vFxD0PX2Otse2uOrZ7JXSwrni82EDTWtNNepf2OdaWQmm0n6NVgDDdPaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482325; c=relaxed/simple;
	bh=+uLr3dTzJTV7nrPr55V5auGbMBGpX7ZhNLHcum1L5wM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OrQSdm28J4ASXXQLvqy8hMD9NdwNf0lQ0fvlOt3WuBoMbaTaQ6VBm/tAX27fGXspwm/S1hGNOQuzRqyq0ovmu0oGOqZj+bWfH6RBZZlNEtv6HGH9fjch4wJ4gyjdTdjTyX13vual2qcwTVEY/Tbsvd/eKFacjheTAtLrwsizR3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzXbebKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E0CC4CEE7;
	Wed,  2 Jul 2025 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482324;
	bh=+uLr3dTzJTV7nrPr55V5auGbMBGpX7ZhNLHcum1L5wM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JzXbebKNFfiGvybLuFqc/g9V+1T3qFKFAh9dMjsrZ4JG1gCL4rS0ap7uA3TN6kqSK
	 s8+XqtwcEMITD5WVifrMW165E30dYuod2nVTuoHkoTH/iZM+F2q2BhV79Ein/NhjV7
	 67S+/lOaGKt+AGgTPAmBrRO/JoQ0DNUIKznHLB6YIPd/tdOdfX4C8V83C18w+po+bm
	 TCmKFlEtH2j106BEHX6KlnwRv5YFdsjB3gK/2OyKG9qLSz12Y0ZL+Vu+DVzjIUS4RQ
	 S/LrXe6HsI6Oj6BEuE+fiG7DlpALfgSES4H3Xf4QWEODyMnwlMgMXMdRB0alzcUi95
	 0eZ6M5tFOiD9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCE6383B273;
	Wed,  2 Jul 2025 18:52:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175148234928.828808.7437950953839931814.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 18:52:29 +0000
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 dlan@gentoo.org, elder@riscstar.com, uwu@dram.page,
 linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Bartosz Golaszewski <bartosz.golaszewski@linaro.org>:

On Fri, 13 Jun 2025 17:25:33 +0800 you wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - gpio: spacemit: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/riscv/c/e6382fcf9890

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



