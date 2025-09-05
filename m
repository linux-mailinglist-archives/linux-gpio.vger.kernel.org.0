Return-Path: <linux-gpio+bounces-25691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B0B4647F
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 22:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2192D1BC383C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 20:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A599F2741BC;
	Fri,  5 Sep 2025 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acs2Sfyp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E89271447;
	Fri,  5 Sep 2025 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757103445; cv=none; b=RY0Cne86jTLi8tgeu/8v632J5LStfkv7DwHye9pQ1CL/BflzU6BQYtnkSDEdoX3wzEuAJQ415RGiWgIy3Qe+/QLrnZYgq2EyXLOs0Dya8ZT8PnqyXZbagOxzAWoa/ilIR4r7OaatPVKV/Y/UlTMjefUgz85MC+sfZUDKf/jcpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757103445; c=relaxed/simple;
	bh=CuX3jLqS01ybc79PndFinBGhQNBsivyAOuKcNF5Xqiw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f8vp5imEVil4FpfzlmJ5l44X4P1KRxDxWysSWCXMs2OUNK2G6sD7WghfGy0NnKgktvxm0xsog7gtK7BMUxm+iixkW5pIp0aRIa9IM5FIHVx/wsyHmczUgaw2p4cwXueeo/ggixN8UCmNbOMhMgRAni1sRMWUCHc1DPw6Vh2MfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acs2Sfyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37757C4CEF1;
	Fri,  5 Sep 2025 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757103445;
	bh=CuX3jLqS01ybc79PndFinBGhQNBsivyAOuKcNF5Xqiw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=acs2SfypHKOoXGaxtVjaJmWN/mqymjgv+eNPizIA2knfvPw2dcCw7Cm7NSyI7KjEv
	 9Glf5W/CeHzrlzHqyquV7rRY/suWSAPHHAdhzm6OSoM+KSVS5EH0sSn6FpnMY6JLWc
	 3yeujColILJp76Z5s54GpTZ+KWHrOmk0RrBq7ZEBR4+EDDdV8cZgOEFemCSUNNvIeU
	 gHYhiOuGt63q29/WRP9eihjQ2WiAkJQvhP0f0fpU0ONEAhRumzd+Kz++7JSGVJsBAZ
	 lVcyRy50EwvICXvgcD8dg3f342ABqbxPPsU/1sLlX1lrUCa4XIx/DfL6ecMjkSAqFx
	 tAlpPDqZXnpYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB213383BF69;
	Fri,  5 Sep 2025 20:17:30 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250905131345.105630-1-brgl@bgdev.pl>
References: <20250905131345.105630-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250905131345.105630-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc5
X-PR-Tracked-Commit-Id: ed42d80f3bae89592fbb2ffaf8b6b2e720d53f6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d1e36499e02457f8de0edc9d87783cce97e8677
Message-Id: <175710344954.2676293.13198623137328471526.pr-tracker-bot@kernel.org>
Date: Fri, 05 Sep 2025 20:17:29 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  5 Sep 2025 15:13:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d1e36499e02457f8de0edc9d87783cce97e8677

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

