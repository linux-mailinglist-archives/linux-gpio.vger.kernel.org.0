Return-Path: <linux-gpio+bounces-15051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C865A1B9A6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 16:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7327F164054
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 15:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7B515665D;
	Fri, 24 Jan 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph/+ll1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5212C484;
	Fri, 24 Jan 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733688; cv=none; b=frNgA5Wt7IPN26cbrVA9xczp2DORZJTWQLrU1ZlRxqnys0S8O3lqH50JwVjhq6BQOdpQFz36wWFuksN8vs0qOTgxcN4HZHh15Y9Sj23hXHWcAyeOg1ZdenZCYTKewV/gZY6+lDFXuLW+4P5uv9WQ2Mc7O2KiYStBFdnaYm4eHpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733688; c=relaxed/simple;
	bh=F1qtJ4DvS1a5ozBA/y0vug2CMaOCJzrDidKpqgcB8T4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M4btz7YTSzlDgtwKb5+Mapq2+KzCC9mAEoHq6eJUHXsUw91NyO/NHn6jpxq6MKb3P59v/JXNdDrrvPizyC/bJoOxvYJUSbtt19ryzmuwxaeing7qRsI/mQvdrymjytXw1v1EvMGj4leuNt6+CJZPxCcreJI2KeMs273ubIimdYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph/+ll1d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6097C4CEDD;
	Fri, 24 Jan 2025 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737733687;
	bh=F1qtJ4DvS1a5ozBA/y0vug2CMaOCJzrDidKpqgcB8T4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ph/+ll1dqQiL/XkvZMYTY8lObYYca+ldc3Gxg6UpzfzPHhd1mINMscVAtRsbJ6pIA
	 JLkne8x/9Y64fQP8Bl1xP2DfjFN4rvzLL+BTBiJPHxDNFz/nG4RqJTw350mMeHLuYU
	 ZtrxJfNDDXNcN8fL7herjqkGHLogr4xG01ZVYnQTMcq88b3ZuyTkHwhggoM6fnpl3K
	 JXg/rkftT5LZ74AqiVhXx6FOCiIvAJWu1vhKdHvp8+hhxCcw/sXSZ76tlqM1yWlrt9
	 DB9diRBacXQ3mQTyyyMp7aYDW2maq1D/e7kfc+9CvNSsdXpd/KER4NWbjSH807qZA6
	 jawIWb+LdfG6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFBD380AA79;
	Fri, 24 Jan 2025 15:48:33 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdYZCX7F+yoxZb5=qDfieAndOvS+mWfe2EYRvg6=zVOciA@mail.gmail.com>
References: <CACRpkdYZCX7F+yoxZb5=qDfieAndOvS+mWfe2EYRvg6=zVOciA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdYZCX7F+yoxZb5=qDfieAndOvS+mWfe2EYRvg6=zVOciA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-1
X-PR-Tracked-Commit-Id: c9da9958ba14d89fdf360872c36dc89f4c70861f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b746043cb3250eaa1d52735bc5977c7756a9c380
Message-Id: <173773371258.2077644.5200068833538284133.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 15:48:32 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 23 Jan 2025 09:25:35 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b746043cb3250eaa1d52735bc5977c7756a9c380

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

