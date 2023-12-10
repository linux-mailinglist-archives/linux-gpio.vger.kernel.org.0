Return-Path: <linux-gpio+bounces-1177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D476380B891
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 04:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B3E280EEB
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 03:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AB115B2;
	Sun, 10 Dec 2023 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwizNV+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F415AC
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 03:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B82AC433C7;
	Sun, 10 Dec 2023 03:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702179555;
	bh=Yfi8InVXnRHz78EJfOI3vWdOueWfrDP3laxolarXdSA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GwizNV+7I3OFDRNH0DaVBtkR0vqzTLkpkZamX2nhGEogRqoYu2Ors5LWiagOrMWkP
	 6YES5YQ5maREDwyfiouc9l9go74vUCwue2bt8EdSwtIQS54pkQVZYXJSdx2Ea5g075
	 NVRmEFDHXh4QUn8rpjcpdxB74ruJAPkm6rha4HZb8muFqKkVWnn2VdoSvvbIgK3xcW
	 rilN1PW8Cw7ZerTfIk+LjaqbdlXC0wSp3pKLh3ODCItOKCB1QjeQZ5rQ9NRwrqQIuU
	 e/+rsJZ2nGCQ7dZ15jjS89pNs0Ebpxz37MXoZpq+wl8H635Tc7aniirusO3P46fVAO
	 J2dujiikiJ3oQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 561F3C04E32;
	Sun, 10 Dec 2023 03:39:15 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231209193319.6993-1-brgl@bgdev.pl>
References: <20231209193319.6993-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231209193319.6993-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.7-rc5
X-PR-Tracked-Commit-Id: 95dd1e34ff5bbee93a28ff3947eceaf6de811b1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99d4cf7659554c2c9c5e4c0808782759b7d32bbd
Message-Id: <170217955534.29712.10074286834085008000.pr-tracker-bot@kernel.org>
Date: Sun, 10 Dec 2023 03:39:15 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  9 Dec 2023 20:33:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99d4cf7659554c2c9c5e4c0808782759b7d32bbd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

