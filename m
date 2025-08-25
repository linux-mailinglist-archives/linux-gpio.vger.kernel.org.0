Return-Path: <linux-gpio+bounces-24938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DFB34481
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 16:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C52B3BAA01
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B775E2727F3;
	Mon, 25 Aug 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RX3YhDji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736101D79A5;
	Mon, 25 Aug 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133370; cv=none; b=jyhGw/V+CZ2LbTrMpLV0KKylNX0t+k+Ngs5U6GW8hT3wc17CrOd6wzdv4FZJW5fz3GczU7+znQ5+XJNrtoNHaOkig7tMEnumr9BQrEuyuEBklT/nwAIaG5ENhyPuc0CqdLVgpRYrf6CrSif22ltq53V8uvNGJ3oEbLVnTYEHV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133370; c=relaxed/simple;
	bh=F6cHZgAOJpdauNU7us7xN8xxYreXeHzKGzcJtKwfeUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L656L+lheYpap7uhY9XWKrU1RT6mj08IPJCYOD4A5uFW8bPz15pfwpMvFtAFqMHBztWoAz11rLw7yDaGwTJXnoR/WHaB8KU1WLnwS3rQ1i3dZhe4v0Ynv/p7Lqk+/KtyljEASOmeFAQyzeiynwBZZz6DhY6B1Xb/J6SxceSCZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RX3YhDji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D50C4CEED;
	Mon, 25 Aug 2025 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756133370;
	bh=F6cHZgAOJpdauNU7us7xN8xxYreXeHzKGzcJtKwfeUI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RX3YhDjiH2Q8c+O3SSsTYJdx6AM61WkWRx9S3gLmvzTmVbt6tE+3f8plhXRbELnx8
	 kEij25Lh17RIsPCPTEb3giFebpzrARxrz4KlE9yt1J3N/2OqS5uBd42r9T8qiOy5pt
	 BgiRHSk2gHu/h4yTykThZRmg+F9kQutVtoVVXA+OS7gKYQRpQ9ZiR5tC6CPd5uqVqe
	 l2nvroxbJCcrHk4OkBWNFJc2EYyF7myVoiwm/CJC+BES2WyQeDmMSR8rqhpUuPWahE
	 m/4G5lubByxQfrbSA5NR9TUX1dkms7pj4851+9P1ACpnau5QDWWuN4k6tlFF1BGcHS
	 7576skVvUSaNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FC4383BF70;
	Mon, 25 Aug 2025 14:49:39 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbMXvpwgniKeyJ47-t0X+ekkJ1r8RpDFJRsd+g9id+ruQ@mail.gmail.com>
References: <CACRpkdbMXvpwgniKeyJ47-t0X+ekkJ1r8RpDFJRsd+g9id+ruQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbMXvpwgniKeyJ47-t0X+ekkJ1r8RpDFJRsd+g9id+ruQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-2
X-PR-Tracked-Commit-Id: 563fcd6475931c5c8c652a4dd548256314cc87ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b6add54ba61890450fa54fd9327d10fdfd653439
Message-Id: <175613337785.3441899.3720123009779839964.pr-tracker-bot@kernel.org>
Date: Mon, 25 Aug 2025 14:49:37 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 25 Aug 2025 14:58:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b6add54ba61890450fa54fd9327d10fdfd653439

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

