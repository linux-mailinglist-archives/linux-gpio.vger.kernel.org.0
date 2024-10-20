Return-Path: <linux-gpio+bounces-11698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55F9A56F2
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 23:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29AC6281FC0
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 21:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8A3197A7C;
	Sun, 20 Oct 2024 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlgLoK60"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7808845025;
	Sun, 20 Oct 2024 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729459150; cv=none; b=tZTkkeHzKuh0y+PQtrqqdg3Jn4o3ry+HHHqmPnUH+9S9Y4MNo13qI2tfYBZUA8hHyICT3hRPoGvusFEGcsJgL3oLQ4vvNS4LwCwO3QN8y5T7JW53hIRfP+fSWYmL69n9g/61jFR1E5AJ6Ort2e6sNGytHiIA2RY2vsUMz/5Ka+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729459150; c=relaxed/simple;
	bh=OZeJUa0mSW+noCK3Rai8Sp1tqeDt/wHMr6AMqYtbes8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IaFkvuvMPBzgd1Aupkgw7V12qBJ/RKci3/QjuFvLgjCtx0hcWP4ihWZ61MKyMUzHkJTbEAohNh8QyDIEGLrj2J4Evnla6FJTbcqxaPJXk9MHS/ViRyV1XTET8iO/jr14xLkuW38qlOJs8gVGP1ZQqKh7dFrpqVRr1HXilzoLWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlgLoK60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D0DC4CEC6;
	Sun, 20 Oct 2024 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729459150;
	bh=OZeJUa0mSW+noCK3Rai8Sp1tqeDt/wHMr6AMqYtbes8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VlgLoK60XFAU91BDD8yAv9NMBgdw1eBzJjIYodtEeo967yHN2GGUSFxPC6OK1qz5C
	 zQTtx4OcceJB6DdmGQ/OUB3hYVo1Swh2es1CAgYq74jNV5GAcg0UI8LJvqHtjl47aB
	 jMOqldivNl769FDlaVRoDY2cPmArInbYBsgfWaJeIln884T1XvzsZMG2jehtPRK4Me
	 yF51F9G/UTAExKh2bQlYqjuIS9Da1XWPx7uQNSTuVXblTFreiDy1NpzD3hfdoeieeF
	 SHZrmz/tAKgysVxUZobYMjflLUCVUZVetEiv68PmWjCqC8S3SAit1tklSfzPEwgR/9
	 AIf/HeUk2/JVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE63805CC0;
	Sun, 20 Oct 2024 21:19:17 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control fixes for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZ1K=G+J-Kw1=gbHixuS32DoXGdoja7dOc1O6cR8VeshQ@mail.gmail.com>
References: <CACRpkdZ1K=G+J-Kw1=gbHixuS32DoXGdoja7dOc1O6cR8VeshQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZ1K=G+J-Kw1=gbHixuS32DoXGdoja7dOc1O6cR8VeshQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.12-2
X-PR-Tracked-Commit-Id: 93b8ddc54507a227087c60a0013ed833b6ae7d3c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd4f50373e508632f01b63eab5a3c0b5debe22e3
Message-Id: <172945915602.3645781.15115471904500259612.pr-tracker-bot@kernel.org>
Date: Sun, 20 Oct 2024 21:19:16 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 20 Oct 2024 19:39:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd4f50373e508632f01b63eab5a3c0b5debe22e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

