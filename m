Return-Path: <linux-gpio+bounces-19562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF2EAA7773
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 18:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E623AE0E6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 16:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA0725DD17;
	Fri,  2 May 2025 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA1TFuB9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032E2571A9;
	Fri,  2 May 2025 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204027; cv=none; b=GnJmR9ieHgTU/c8aOOuChlYqiZhMWO1/PU29DVu8M45rxC3fRwxmm4dOpb1LGmZbL2+zZ178+7o2ffpWM8AlDyJWRnn/OUNZ5+cwfZtlBVDkfALvHOHpD+vhgo4BrrQzx69XFFVyCR1+57vfmNLvhQx4KIcZMRenm5nUT8q3YkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204027; c=relaxed/simple;
	bh=ZPiYF3h00VVKgyhlDKIBUIpWHxZzvr/96+SwHrEViGk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jhGl+/8ESOFtYuE4Xe4tK0t4+XhdoIg5vdLgiP8vzw8nOkGf9Vl4jbZk+5zExJc2CNa1NVdFNT3K5iVxkD0663jrbodETcD0NW0pQjZs64zmG/h1fRR1KhW6da4ccA3tQWFu3LambRcseVdMtVckjaMxsq9G/a5ldi4y5g/s1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA1TFuB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0F1C4CEE4;
	Fri,  2 May 2025 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746204027;
	bh=ZPiYF3h00VVKgyhlDKIBUIpWHxZzvr/96+SwHrEViGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BA1TFuB9CJIUdphV1gNPwJXnFGVmYujx8c3YaM0bR23EG2jC8AHY+eomQBO5mJPKX
	 MH1EqfaMolTjIWjcT6LvwK/mgem2pJ+JHSO0/Y514MVALd2O2WRwsyk12OGoAKjqKC
	 GBubAZcKmdWBdNPCsxP3mlaDV+mPmn17YoVWfbnOJ0q/J2WZ880YhrIX2xymA1Whze
	 vTgSB8AP63VZpufsOnUwbFV9p9k8aJjQbaG7Po0upaU5T9I94sN4jwaUJa1hniwh9T
	 VVJQWjO27vHBH9OR8gi9RvUXdGkNIalLYKy1SWHwfJgwyw0iqFOfynIF+04EAywAzC
	 76mAFv1SCpTVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFEB380DBE9;
	Fri,  2 May 2025 16:41:07 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdbhYTFpA_jfMPFZ4t4bcVdO0+9iCsjtBnLpy9ok0U_wvQ@mail.gmail.com>
References: <CACRpkdbhYTFpA_jfMPFZ4t4bcVdO0+9iCsjtBnLpy9ok0U_wvQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdbhYTFpA_jfMPFZ4t4bcVdO0+9iCsjtBnLpy9ok0U_wvQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-2
X-PR-Tracked-Commit-Id: 12b8a672d2aa053064151659f49e7310674d42d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85951e19c425d5c45c8d4119ee2bade518252e31
Message-Id: <174620406633.3671706.12946398621613830782.pr-tracker-bot@kernel.org>
Date: Fri, 02 May 2025 16:41:06 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 2 May 2025 13:56:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85951e19c425d5c45c8d4119ee2bade518252e31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

