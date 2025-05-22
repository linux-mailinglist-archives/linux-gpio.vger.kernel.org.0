Return-Path: <linux-gpio+bounces-20486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CAAC1111
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 18:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3DB164836
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 16:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB2129A9C8;
	Thu, 22 May 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llFbdymD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4129A32F;
	Thu, 22 May 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931539; cv=none; b=NLwnE3gAZgFOEunhtSKYeg+T1rOrHYkJ0JXgZ4WwG7HFD20VX0LwXK5p3oOERaXiTNolsaqhK74PoJfL4jaS8Mv5xugAQXFk23Y+bhRHNioy4zYhw6wBEXf4B3T3pFo+ikX+/G3G7FjyQsjpHT+yCAXSCVLG8xbXaGsXlzzL+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931539; c=relaxed/simple;
	bh=Ikpfw5DxXatiO8qg05oD4q0i1JtAcl8pQtTE9mpiQPg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kr3PItHpkMTj6HGknuZD03iejjC/Qv+qqbitNrRXdx0oBqdfwX2rSIt9BLrDJLj67QnayZBkerCScgvDacvn5FeASN+xH5XOUiJ2NlqPpPKp4Kv+HWnUwV41z7TCvxvtSc0b/DMR5v6mnLERDefg2Ok5tKXzKzyv9Qzban73pcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llFbdymD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF153C4CEE4;
	Thu, 22 May 2025 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747931539;
	bh=Ikpfw5DxXatiO8qg05oD4q0i1JtAcl8pQtTE9mpiQPg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=llFbdymDahxgrnprBXWjf2mTo5Rn7iwEc6xKvPYU5l0JiLGIQ2rYSeBBk3x1S794b
	 zwVci7KE+beKREW15DkCeiJUfBmOCWqx49VnlTNNgpRfVYNumJoymlMyYA6ehDrAW7
	 fYs/fm5gXzJOPrnFTm2BO01s08W3KL2hsKfjzo0x8NnqR1ipbJDIvHAK3u//pa6xK3
	 IBAXr2+iWc1+PSTmHlhJQT7871iti+mCyl/PlpKpzY6lZX5EUEo7jZyl5wXQcaAJ+6
	 g1Due19LjammTN4C02YBxXfSh4OdBsvknDXJ+0VJsQahnX/VZnTSt+MYXp1AxKLC4d
	 zGjgUCt2k9UsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFC23805D89;
	Thu, 22 May 2025 16:32:55 +0000 (UTC)
Subject: Re: [GIT PULL] pin control late fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdaEmKn_0QObo9kFrgm2TajepUFjcgK8CVn-u_zMmoEO8g@mail.gmail.com>
References: <CACRpkdaEmKn_0QObo9kFrgm2TajepUFjcgK8CVn-u_zMmoEO8g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdaEmKn_0QObo9kFrgm2TajepUFjcgK8CVn-u_zMmoEO8g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-4
X-PR-Tracked-Commit-Id: 41e452e6933d14146381ea25cff5e4d1ac2abea1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1819ae85e7df3dfda1f387f32fb487ca40052ad
Message-Id: <174793157434.2940668.6700631357282732275.pr-tracker-bot@kernel.org>
Date: Thu, 22 May 2025 16:32:54 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 22 May 2025 10:39:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1819ae85e7df3dfda1f387f32fb487ca40052ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

