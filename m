Return-Path: <linux-gpio+bounces-12117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3F9B0CB1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 20:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336D01F24F25
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 18:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65F518F2F6;
	Fri, 25 Oct 2024 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTHJA77/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387D18D64D;
	Fri, 25 Oct 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879819; cv=none; b=ho/WjCJi0jlJ5ScbA+07KfkfvEydewBtjUi6Yu/0ts7LnWJP9q+K5C7CqIkZHX2fESlX57nQFpmk0qnXmNihyp9hWQ5+HivASlmh4/BqFd++QIPk/0GwDWzPWooxz2lLPpttfqQIJX82hHPgP1E+2kqwDNZgDZ4R366+XeLT+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879819; c=relaxed/simple;
	bh=/O66sAv7aCBew7cNoUI+bCbGR1fd+rlRGhKLB/V+/Co=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eOrRQWGo9GPQ+f7Ynn5OkJ+g6nDsmH8W/FV3Cq0FuIxPg3BsGPBzz9gAO95n43Pf/j884TvOdKjoMmbkQy8+mh1aWbnqx1tZmss8p4uk3dmwK5DpIacZC2wOsZ3IMAKhZN1KwPoQClo38V2xCUp6lTUhdfvtkLve91HAyA1WcZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTHJA77/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1910C4CEE3;
	Fri, 25 Oct 2024 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729879818;
	bh=/O66sAv7aCBew7cNoUI+bCbGR1fd+rlRGhKLB/V+/Co=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TTHJA77/Go+kCckJBR9zm4+3Vh3YyEIgYT1qQRegrdewWlHJiqY3WEwlV7VdGdrhf
	 FMro0X35eQV3z+bAmwFTNuuoR9GGESDVLsZ8Gv5eIFxYL/pfIzYJObpFpKAUzt3tN8
	 nWBkShPk2cxRuyUFmWrM+k0OC2K+xXaSTvGunKUxXhkWzVg0R8vB7YG4pQbkafh53C
	 KC6x/YF1+sdMneE4REnCtYl3ekMy/FhrZKPZkYz6y8TEELJHqrNBXzXIcf7s0ZQwCh
	 2dDoJo6Cs4+JoT5Xk7BGU/XZJvkMTW/jsyBz9hJXZ4+iTjJqqDZI9+k8q2dOA5gUVW
	 CFH0JitavRfBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBA983809A8A;
	Fri, 25 Oct 2024 18:10:26 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241025142504.44267-1-brgl@bgdev.pl>
References: <20241025142504.44267-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241025142504.44267-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc5
X-PR-Tracked-Commit-Id: 7e336a6c15ec7675adc1b376ca176ab013642098
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0560f974eaad72701061d40490fc8a36b95695b
Message-Id: <172987982587.2993589.6751350333550403125.pr-tracker-bot@kernel.org>
Date: Fri, 25 Oct 2024 18:10:25 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Oct 2024 16:25:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0560f974eaad72701061d40490fc8a36b95695b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

