Return-Path: <linux-gpio+bounces-7652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731091506B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4355B23081
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E075C19B5BD;
	Mon, 24 Jun 2024 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTkM0A9z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1AF13D539;
	Mon, 24 Jun 2024 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240263; cv=none; b=odoUV/0eMM0n1CCaxxGdp0s5ZJnO4O7d7qGjmam8N48d/ltFC3592BUFCucK63QGak6AOd3bdqLrNcd+st04IcgYhyLz4X/qmPGhtXr26R+agNmTvrOf/dSspnr2NMunyOPa+PIRXNM310TJ8OhDlxUd99UMRXoB5yAZ7vXQqJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240263; c=relaxed/simple;
	bh=p8fD42JQDzPLBRVzTR/DKqNBA3VSxKKSxWUeZLypK/M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OIOefzWgGOBBsZXzuvt2bu4/5S9U0Ii12dS90BrZ0kc4dXu1z5AMKWZTjWYv1yd65vbJFvt4DQ/z5NOSIGOe+Xiz22BKRKeYGJOKmVw38HDrqvEYLUFbqwzgZOdjO1WeQnr6ha+CPxb8hIHpHTO2qBIfLTfuXIDoliSg6JBeYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTkM0A9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 780D6C2BBFC;
	Mon, 24 Jun 2024 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719240263;
	bh=p8fD42JQDzPLBRVzTR/DKqNBA3VSxKKSxWUeZLypK/M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hTkM0A9zWNlD1iIu1IYjgZLcotYexhgfkhQbWJLGu1ontUR/EUFrWgxtUtNeD3Jr+
	 wbaV7tqvLGlTfvLRvHt2WYaazr1hRwWoO+AMX7Ppiywj5h5Zg9M+CvW6hqszGo878/
	 moQBo7WfpGbJIOGllE7w3zdSMy+fA+Jlh5iuIeMbuaGWKvY1xhiD01wZ2u3456ONYN
	 5fpaxnDuQFhCLQ+IHc2xJ+E5xlU0Tzi0444tT28oMe6Rsr4TospMUmNRsSzt03+Vla
	 eU1cvje4jD3kEgj80SiMCrokE6wlWDDmVDzErx3XDbqfn8HXSkHwfniG436xTrbL6/
	 6WS3zDT8CQ8Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B3BBC43446;
	Mon, 24 Jun 2024 14:44:23 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaa2OM1=Buz9pY2+HRAZHQnDoRqZDX2VWNoG_Fj=UbsUQ@mail.gmail.com>
References: <CACRpkdaa2OM1=Buz9pY2+HRAZHQnDoRqZDX2VWNoG_Fj=UbsUQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaa2OM1=Buz9pY2+HRAZHQnDoRqZDX2VWNoG_Fj=UbsUQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.10-2
X-PR-Tracked-Commit-Id: 4ea4d4808e342ddf89ba24b93ffa2057005aaced
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 626737a5791b59df5c4d1365c4dcfc9b0d70affe
Message-Id: <171924026342.29768.17863378503606431448.pr-tracker-bot@kernel.org>
Date: Mon, 24 Jun 2024 14:44:23 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Jun 2024 15:05:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/626737a5791b59df5c4d1365c4dcfc9b0d70affe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

