Return-Path: <linux-gpio+bounces-21943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B0AE20F1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 19:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67FB41890638
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872BA2EA467;
	Fri, 20 Jun 2025 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrgfqQjK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD02EA16B;
	Fri, 20 Jun 2025 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440564; cv=none; b=ZMgfYVz/siF0MwaGW1zcpU4UvCJ5okH1NvOIO1GfFjdYLzviL9t0LK8EBMFtaoRtGTQlxL4LgXvXmYW+GzPp8hh/yqx8UuQF3eVGQDJo9eECg9M3dQc4Y3vcwfXZhE5pV9QgYN4thrfHJE3fk4frY3zyW5PItiAxcGjJDMwwYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440564; c=relaxed/simple;
	bh=0cD0o7r5BPPYZQ//AcfWYsyUpW1jNOiQufMjkIA3EWU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Xmmih3ROnD2bpAU6oDegRuiKmFO4gUDC2Lx4246zohiqEPezjg6fxAptOwUaZ288Ho+DwTVUZy8alWolvkIxBhp+uxdofsaq7rWUD0RNaJpF7OrTx+NvvoX4Tfqd9iKQiMqxVW5sfxlb2/ynwfvnJYIQvX0wx9sGijuZXJCVxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrgfqQjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FABC4CEEF;
	Fri, 20 Jun 2025 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440564;
	bh=0cD0o7r5BPPYZQ//AcfWYsyUpW1jNOiQufMjkIA3EWU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IrgfqQjKTjJ/ot+2BCSdPtJDWpKdb89Rsz6tug8bG44t5R+bsZiHdPxVBGp+MbdCy
	 nOS4LmJS4DuEoKworcCwG3TPPT9+THEly5c2qP96+1TXuDOBazWiG9/3XQR/u2MkTn
	 G3nxxlQf3uSmtZTPnFLqAXHzM8mGk0SwZ1Jznt3YDkPzNECoT8Em8kQ+1ivbPqX7pj
	 euZfiFfp8a7gadJWfD7SoPAIEzdkPGGlz765LVQWIrr9Nv/qzET7Sn/csLMYnbN1Uv
	 cjkOFG55PDFm+F9LRKkJBpAJuEKl6n8imBeorfnhnV859Z6PbfcsdQUvdxsf6puo+G
	 TAaqpilyRq06w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F4039FEB78;
	Fri, 20 Jun 2025 17:29:53 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250620134602.111269-1-brgl@bgdev.pl>
References: <20250620134602.111269-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250620134602.111269-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc3
X-PR-Tracked-Commit-Id: 10af0273a35ab4513ca1546644b8c853044da134
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11313e2f78128c948e9b4eb58b3dacfc30964700
Message-Id: <175044059213.1649825.5350797713406614455.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 17:29:52 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Jun 2025 15:46:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11313e2f78128c948e9b4eb58b3dacfc30964700

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

