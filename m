Return-Path: <linux-gpio+bounces-8329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE54938691
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 00:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2ED1C20A6F
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2024 22:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6081119A;
	Sun, 21 Jul 2024 22:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo9ACzlv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7417552;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721602425; cv=none; b=MLIY6txm8fD+EK+4jzJBjtOWNajcaBgOQr9y+ZQkMxaYdvada280loPBdmAWkIsBWQogoyMNbX9bX7hx6WooND3iFnKAnz/coOER8gIFXjFy3k7XEpT6Ipl/gWUJ61dShe/XMn3xs6rCdHsCn6U2crRDfvNRyT8dYR3SHyAbqFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721602425; c=relaxed/simple;
	bh=9+YR+pugwfE/G+DD/9BeupgNMBnR7MxL7UcO1hfnMA0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ke9iORYPQbUyAj20IFXYdGsfNN5cJB33fg0MP+VgDC/rZonzir9+1RgYsav5APqzSiBOtKKejs+drhGt8zfArsqA3e3i/wnP2qH1AdgOnbqh84ER/9qMMjmLT4NrcwM7sjH6gkTvR1SQNhagknprui/hQ1Ztg6ZqRvQo1ccJYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo9ACzlv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57EE8C116B1;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721602425;
	bh=9+YR+pugwfE/G+DD/9BeupgNMBnR7MxL7UcO1hfnMA0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Eo9ACzlvM7/4KbmaZb4yUiPV0tpEIFIaRQbiiphb+q8wGPf/6FA3chkJf54A5RJGk
	 UF66K70fju3o3qcd9AcPsgPJqIB/x5YjULUf31tOXoUxPC0TOXlwLIa5bgDjV5L7CV
	 JXZ7RBaEMWDrB+Uv3FI4QuToZsrhDlIB3TgzWWr3Vn358ncjkeuv5S5a4tgJsSbdE9
	 rv6qmTa37fpzHcJ6xNUO1tqDmgqVHh5Q72qmfic3Qo2Nbb1zYFe3UV6iid7R85jSPt
	 hxcGdZ0lcOLYSUDDxTJBbs5OohPBOnit5IPaNgIu3ZAThWY2WFpAkq02xIIuMCNBrQ
	 /LDCUmILW8iHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F69CC4332E;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZovNTf+pqdvM6Rx26z7gkmmYyPUWHOBc1Dhu_780fFhg@mail.gmail.com>
References: <CACRpkdZovNTf+pqdvM6Rx26z7gkmmYyPUWHOBc1Dhu_780fFhg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZovNTf+pqdvM6Rx26z7gkmmYyPUWHOBc1Dhu_780fFhg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-1
X-PR-Tracked-Commit-Id: 11eaac6e8e72001c28d2043eb160736187b7977d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e313211f7d46d42b6aa7601b972fe89dcc4a076
Message-Id: <172160242531.10014.5188540601816960625.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jul 2024 22:53:45 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 21 Jul 2024 00:17:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e313211f7d46d42b6aa7601b972fe89dcc4a076

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

