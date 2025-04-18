Return-Path: <linux-gpio+bounces-19064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D87A93EE8
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 22:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C451B67BA4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 20:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12E9253F16;
	Fri, 18 Apr 2025 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imXVnNbG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC9253F08;
	Fri, 18 Apr 2025 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008047; cv=none; b=SVcLtrILatikUFKCBltxRDqKgKJBKIOUBRYbllMUqZog+3jsPJ/ruPQ1t9DWsTGpQXLYjtttJyJXKI4dKTLEm9IKFoEFGv9jq8xvT+z2dNmbVEBwfE8Yu+6q+zXckZVT4VNSZWUKFtUVGhLLuhswOyqD5GvmKe7k/hCN0D1XlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008047; c=relaxed/simple;
	bh=jyS0BcLPqpE6SBQbHvdlVfnLiojwxwhB3YqR9F6wwwI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=q96DDGOqpupOeO885b57s8oTOJJRvSXhTgkZgqx8VZl8cJeX+c8Aa3CsNMXT1g3z8FLncnS4LCv1USEVjU7qJZd6rWYiIPXoGpYN9voXStrMwdLAXN94S4eSJQzPIRxPADRaSnKmUgkyF3oqSBvFbZUCsKAJzYql1P/My5t6yRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imXVnNbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0492C4CEEC;
	Fri, 18 Apr 2025 20:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008046;
	bh=jyS0BcLPqpE6SBQbHvdlVfnLiojwxwhB3YqR9F6wwwI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=imXVnNbG4Xdz4Q4l5qA+8D/3BNc3qQj4rvs8eXy1d4hq6tgUH00OwjqNsAawJtbB/
	 nEYyDpP2IuXqitKgQ5hR8JNZ2uh7ym2FZz2Q04nt+WLT+Gf7FCC83Lq2LDvx7OBLAx
	 MI1d/WcdmaYXtK2nXj6MQqbhBIZ72tSPtfdXTZKIdZdsgo2SRUTh3V763jAdCUaUFq
	 wLtFQjqW3nFc2iLZeXBvmOvxc0DZ5LLSmVbY/nxSEv31AWgLbxlilBRynXoykjTaY4
	 UKlgbw9OjvTD+iTfd3DGXdRs+UJaMvRwPlXZayd2a9FhWtXWwEz/+kZY3knwWC1D72
	 zMYoRBLkarLCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34D0C3822E09;
	Fri, 18 Apr 2025 20:28:06 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250418194944.37742-1-brgl@bgdev.pl>
References: <20250418194944.37742-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250418194944.37742-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc3
X-PR-Tracked-Commit-Id: b424bb88afb6719b30340f059bf50953424cdd9d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 30d451e3734b827d4064f2a77af6de65382860a4
Message-Id: <174500808491.316726.9338651095919676932.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 20:28:04 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 21:49:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/30d451e3734b827d4064f2a77af6de65382860a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

