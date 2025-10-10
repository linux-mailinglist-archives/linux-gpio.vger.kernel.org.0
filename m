Return-Path: <linux-gpio+bounces-26986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A9BCE3D0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 20:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97F37401698
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 18:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA9E2FD7CD;
	Fri, 10 Oct 2025 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jM/+CCnM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7E22FE066;
	Fri, 10 Oct 2025 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120796; cv=none; b=KrY2v0/XyPOj/gsiT9mU10QLc1tgPPZk3wPyq3w36v3x0ibOZTSY7wtavrPc5H3T2opV6bKnAF4HElErjwV83x+I2V/nB+Ylo3K6sMKHYA0irVMP+9Biv8M0G1NihtBDOg7ky1Z9doMc64tDONFbf5CAnHXLE4OPyLbMH9VRugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120796; c=relaxed/simple;
	bh=+4o/XAVK5YOLOScHjCLr+Agx7SLv+A+9HdkDEte81d4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hVELJWt0SiwiR4eHkjnqQUDmsCbWNj++dA28MdHPDrQG3aAwNQaLyAsevwwQ7ufqMmS2nKHF4L9Fd2Qv1dTkoV4IqFPPE1k7T4Av8FjwpBdx7OeB2DwboVIsLhWANVy62I6gVBw88L8JHF5uXqv5UzAa1JEAxfT4LZVW67gtDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jM/+CCnM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC66DC4CEF5;
	Fri, 10 Oct 2025 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760120794;
	bh=+4o/XAVK5YOLOScHjCLr+Agx7SLv+A+9HdkDEte81d4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jM/+CCnMBGv9sApa/tEvUOtfjP39jidj9w90KP1bSVxZOeVrGLrOXU8cpZffjD8Al
	 ZKUN//q8O+VNRTsQ1OpnPpb8G+hxolxk6fmfdexCwbExu1hMGHzt/evEgWrDAinkIJ
	 FxNYNC52covAuBr+s//bd59oNe2BsChfL+G7MBTOuhi+EPnZLVIinc1U1Do0bElBgE
	 q5g9eFO03E+VQBNj7FBLgmiI1Y/V4XCP2y2/IKoTQl78JQzt02bJI5M1xCMG9IjwFZ
	 DURjcgIvcTclYBQ4pCK/iyi0HhCf0yws6WFd5qMeVUrSuHzrDLmHHPWXiuc7TYAQAF
	 T6i1BR3f3WafA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71C393809A00;
	Fri, 10 Oct 2025 18:26:23 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251010131857.26204-1-brgl@bgdev.pl>
References: <20251010131857.26204-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251010131857.26204-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc1
X-PR-Tracked-Commit-Id: b5f8aa8d4bde0cf3e4595af5a536da337e5f1c78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9976831f401eeb302d699b2d37624153d7cd2892
Message-Id: <176012078206.1074429.10339643951159644208.pr-tracker-bot@kernel.org>
Date: Fri, 10 Oct 2025 18:26:22 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Oct 2025 15:18:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9976831f401eeb302d699b2d37624153d7cd2892

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

