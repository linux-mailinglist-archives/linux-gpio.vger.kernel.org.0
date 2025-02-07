Return-Path: <linux-gpio+bounces-15597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3296A2D06F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 23:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C933A8695
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 22:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE1D1D90C5;
	Fri,  7 Feb 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5Q5bd6S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F041D8A0D;
	Fri,  7 Feb 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967130; cv=none; b=NZc/9mSAr4s9h+RO5CkwYW2+f38EfMMkbnCxZ7FaK/eUsOMIz9CODekpi12v1DUbZIVT8y//TxWzgSvuZuCSv+Qd684cgXDTwO7V2ovvKdIthW+j9E9sEHVHX1SDvSArDwM6qOCP2eswp2JjuwmRt/b+QV5v5zaQmG2IF1PchJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967130; c=relaxed/simple;
	bh=5hhacTFn74xU0FsdaFmOBJwM9/9saf2R32VpKccasyg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Rm8mDLo5EDa7rxkHYNwUni16eQcPCq1RUSm9R64b1L7Qoj6qU9va4rxkA84vnqPn4ZDfu63st0g2vWOAdBavSkO4IOh8aTQ6auLqA472qg6VVixgsuROoFrv9iqArhPrmerz5d8xTeQyK8HqxZpF/AbNs93A7C1isudKUMjIcXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5Q5bd6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF41BC4CED1;
	Fri,  7 Feb 2025 22:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738967130;
	bh=5hhacTFn74xU0FsdaFmOBJwM9/9saf2R32VpKccasyg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O5Q5bd6SRNojzhGsrdtIVc6K7n5Xlwam6Dnf0e1C4hmukN8EixqxzVmM3AUmDWzec
	 dE1GgnV07emh7XcwjRiDt4ZiGFrnCrLF3az7XEXhxdGhE+fzPLFxCtX/c72gzNM79i
	 pnmlR5GszM/AN6Kwfqn/L1OZFc4FQD1HohB/M2q6lc9entfuXPrlI4yWIvXCoceVxz
	 Mcls26WBtD5iE/tmJiYRJ79GaF+sqrK/FWBBQ2lT7gDLOb0WXf+5WKlzB7ax8Fbe/X
	 qDhy1jSmOixmrMMZVoITNhkUnWbZ+QzxErtk/fglxmXD3TbVKpp8gmBmDWfJsnimXk
	 K5rcuFiqNbDaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34004380AAEB;
	Fri,  7 Feb 2025 22:25:59 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250207084211.35316-1-brgl@bgdev.pl>
References: <20250207084211.35316-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250207084211.35316-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc2
X-PR-Tracked-Commit-Id: 59ff2040f0a58923c787fdba5999100667338230
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78b2a2328bf931ff7791dbfb82c2da97d10b42f9
Message-Id: <173896715783.2405435.5145698733750809987.pr-tracker-bot@kernel.org>
Date: Fri, 07 Feb 2025 22:25:57 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  7 Feb 2025 09:42:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.14-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78b2a2328bf931ff7791dbfb82c2da97d10b42f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

