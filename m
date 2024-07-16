Return-Path: <linux-gpio+bounces-8215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6373A931E5F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 03:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 950D21C2212D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 01:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D41717999;
	Tue, 16 Jul 2024 01:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg04Z/80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FAE546;
	Tue, 16 Jul 2024 01:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721092654; cv=none; b=gt2gNbIT+SgIG2Ifp3vCKy0NbEMPjzfS0Ca3CyRv1xwXpU4yV6/En57B5fxMu55braxoF36ZIqbenewCw9Y/KT626jFw3fwWyZ6CdqKKO1HI7Jow74UBmdcLgFkPYH286vPNoG+KXPLXSFoz3FS8W1CRVjCin3jWA4HyJls0XhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721092654; c=relaxed/simple;
	bh=Pu+oiRlkaeQRLnqmSYZzIOHDJMCajz8rI4rXXkQqZyY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f+/4KdX50px1CkUM20Jd0Ey4EE38cqkwH8+U6wd+gnWaE9SAsi6ZrLr/cxRH4G2CB1HgiZlXyT3+Dp1Vujl9yMmGtBQZd/zxC9j/5sgUfL+KG1t0Qc5h0SQs63uNZHdKp+gzq9vPrJ8XgJeAT/lUGE8EPIUjMWfyRUbG4ggEucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg04Z/80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0188C32782;
	Tue, 16 Jul 2024 01:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721092653;
	bh=Pu+oiRlkaeQRLnqmSYZzIOHDJMCajz8rI4rXXkQqZyY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kg04Z/80GIQAXykgc7tHLOH57yEYK66DoRe/iRIEt610RZoyinDOoFEenbzSKgQuc
	 OckeN9yOhtrXQr7twAl/AfqvAMuWlJz6m7mZkCLHF7GOeuadfvxpyNX+39q06OPFQf
	 iP/Up3/M8g7EGOiJ6Xo8HWyEi+lrw4GYBeSwecwJuKW5i2Ty7tYXoQHb/BK9tSxf7n
	 aJX7I0ZxYp4AjYPGp9iuWD+Kn5fIGwuzrsV0D/EnPTWmnITQfaIfFLIacTLz2vI9N2
	 sv0hyqp0POGq6kCl0nTXYKmSygdKEFkj+rtkne++cTYhRPSIIu+aY+AcmIgM0KJ+80
	 9brUCL+FR+3dw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 968BBC43443;
	Tue, 16 Jul 2024 01:17:33 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240715084712.17680-1-brgl@bgdev.pl>
References: <20240715084712.17680-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240715084712.17680-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.11-rc1
X-PR-Tracked-Commit-Id: dfda97e37de4c2fa4a079ae77737c6b9ed021f79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3c0eccb485404d3ea5eaae483b1a2e9e2134d21
Message-Id: <172109265360.10916.3119873086769641757.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 01:17:33 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jul 2024 10:47:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3c0eccb485404d3ea5eaae483b1a2e9e2134d21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

