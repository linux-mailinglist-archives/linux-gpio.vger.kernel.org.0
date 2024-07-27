Return-Path: <linux-gpio+bounces-8399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F593E0D4
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 22:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2D8F1C20C65
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 20:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB353188CC3;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRPPdmLA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F89188CA3;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722110844; cv=none; b=cSZR+Mz0VXnpkVGwHnWg2VBd5ejr1qFJpIZEzLDbN1ZseIzkZ3D55SBRWMx93d+zsbQbnMXhrsiNOl6pEVGjDpQQt15Pu7JDwnXmyQtFJfWAm4c9DPydwPLTE3EqHVVIglV6iguEugJ5gtYvPGVEkuIouivRZ2hN2GCXbzDaKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722110844; c=relaxed/simple;
	bh=yv59965U3F7geS0uB793wjJn2ulss9sGLyAjZTJ+e+A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=m/TqOJVBrA6MWNgnmaYZqs+QQjC07gG1FvlRQrXJY9rPbnP7tv0qYgZhtZR0ORJcFrzQ/VEDaEn/22ca/3W1UQ3zoHEQ71RakVXsHSCs5AraAPTzo8ed4GB17og/Ai53gJA/9r99delaiYfdeR63zjbCzxbZkccYSLAfUVKrvhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRPPdmLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76499C4AF11;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722110844;
	bh=yv59965U3F7geS0uB793wjJn2ulss9sGLyAjZTJ+e+A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pRPPdmLAN+V1SZWHywBQ29g/KK9oEbfDLiAUFockGtgxj4wYfak87U9gcxZchi8qo
	 28NpHW8VeolYlXsol3AvP8YRB2sZufgc94Y8b9VmSwIgE7XeG3un9ioPKHYymcvBCY
	 cMRWXbeNfjqIr4bKWYyBPvnZbsNV+CdhErFmeb5NOaiIUIbgq2EJ9w+HpgpeALihVC
	 JnrXPgOLCyjoyndSwZ+lf6SQpK9Z7mqg7dwBTUWbVvDra7AedCBqQYkHXxt+YQ49Qn
	 E/ORduEOtFr0eQICQvNwUoCMyNDWYkqxo0RR49lxd8r40AfPIILD3jcMEWJqWqKNTo
	 JCQcRhnFQtAjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C8DEC4333D;
	Sat, 27 Jul 2024 20:07:24 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240727194510.5454-1-brgl@bgdev.pl>
References: <20240727194510.5454-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240727194510.5454-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.11-rc1
X-PR-Tracked-Commit-Id: 3ae08e47742eeebf2190900d31ddac53fdd13a5b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e333791d4605dbce611c22f71a86721c9afc336
Message-Id: <172211084444.16614.16675167853790736830.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jul 2024 20:07:24 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 27 Jul 2024 21:45:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e333791d4605dbce611c22f71a86721c9afc336

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

