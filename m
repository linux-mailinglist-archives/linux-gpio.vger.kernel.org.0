Return-Path: <linux-gpio+bounces-18106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A80A75865
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Mar 2025 04:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB6F63AACB7
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Mar 2025 02:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F52033A;
	Sun, 30 Mar 2025 02:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA+ZkLeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9C8F6B;
	Sun, 30 Mar 2025 02:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302294; cv=none; b=FZ4k1/VeeU9ayh6tcQzHaSB5orRnrWU89/Am9pMBZPhG+NsgP9MpLxEpPYT3so6WZH/rs73AodfjzXA85ZqcTEBDm8nIv/z7DP0p9iFqJJlTU6cyIiZXKJYmm7cJtyWe/VAaiocr9NxkoXIyhqcJ8upq3wPL8x2XPdqCd2bq3aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302294; c=relaxed/simple;
	bh=ovG8dAGZb7nsTdRPepNQNmrZ0iMDoigyBaMY5Uh2CkU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qbbXIDhtnrU62ur8tbv4ZWdKR6NkQrsiZysZI2mYuS6lfvbVyDjCLFWHktQkQeTejKIGN+dfPXdvb2WMQViIEIkcjPJhGDQWsYjulRQFTuSDSRHAJm8MVq4HxD5XnEyjl+MKX/z0/FDh9rC/Gxh81iWdUTKiEcUNYNv6CmIBT+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA+ZkLeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48DBC4CEE2;
	Sun, 30 Mar 2025 02:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302294;
	bh=ovG8dAGZb7nsTdRPepNQNmrZ0iMDoigyBaMY5Uh2CkU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CA+ZkLeI54f8W8wnWxvEgkRsWSVazZxNmOY4wjQN1UIZYbuKVNlVMuRRdxZS/melz
	 ES3/mNo+xFZtCrkOdnfOwBfiLWHXF5Alm4PoVaoZtNVTHjEnJDabOPcTRvHqTkw2Uc
	 lZVyZJ+hEKRM+i6Qa+/S/uGzIa2naObkCY9ZKS7pH7HvCvwxjaT1oANiDwEsvajPoo
	 5RySG/haDPFOmD2L9ffijpb6iRwVA1O3PyO2xY/OGtP5oMHSnD8HaNCVr5pdnfUB3H
	 YA5gPxHjLLWGw6/8GgKT8rwdYnGQIlGvEg+8J41IhzTh+0TnWmh/zYvd481Cl+6ySb
	 KlNnuhZGzb59g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71344380AA7A;
	Sun, 30 Mar 2025 02:38:52 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZ4B6D7peAta3tBsOGVaRxxX6n_qoTZdEhpSeB6JwN3tw@mail.gmail.com>
References: <CACRpkdZ4B6D7peAta3tBsOGVaRxxX6n_qoTZdEhpSeB6JwN3tw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZ4B6D7peAta3tBsOGVaRxxX6n_qoTZdEhpSeB6JwN3tw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-1
X-PR-Tracked-Commit-Id: 3ef9f710efcb5cc1335b5b09c16c757f703d7e5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29d9983b2c31be595d4b9c4654297e156ace68f5
Message-Id: <174330233102.3338213.18154590581480787166.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:38:51 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 11:41:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29d9983b2c31be595d4b9c4654297e156ace68f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

