Return-Path: <linux-gpio+bounces-10240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A697B9B7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74E50B27939
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61674178377;
	Wed, 18 Sep 2024 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWaykblP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0C18A6C6;
	Wed, 18 Sep 2024 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726649857; cv=none; b=Uzd8u1WeTULCEnjuMKlxMSZYZEx06K7WDZ9wbWmANg/P4EpmPolZe4jd55WT4c5RmDR8nGP73CwwB6CgqZ1Ii7o+JZUD20yYMogSUyeLVQfG8ac4VRk1AlY8lhWEpMP6QuARdBonro4MjBRVublwaC8ud6dSZOI9UA4mvr4OnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726649857; c=relaxed/simple;
	bh=OlDpvFOIAqk4OTQ8sNKnf0BJcmJ6erruFFFplwIJO9Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mst9I2kf3rskvc7cY/lXt0C03Ex40ILGKC0DcOtvN9NyGEuNRopo6l+8wdgSXTjK7Pgc/VNRlbWFnWZF2FvFzajvaGg/OYR9Dc3mgdOdvUI0+Zdjr7G7NUSdXYl+0LIm7ZdXVcH/Eu0TNWoTmBiCBK4qsgJBD3D/j8b+ed04V3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWaykblP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDB5C4CEC3;
	Wed, 18 Sep 2024 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726649857;
	bh=OlDpvFOIAqk4OTQ8sNKnf0BJcmJ6erruFFFplwIJO9Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LWaykblPs587+Ivr0IcR+FKRSokfwUQCKz1zGQUR6mROuOZL7bnlIPoXYQRcvGOXl
	 8DuAQ/CYqMpxG9NRErlJHGdWDYHi9j7TmbierQM6uK7l4a3NUDEICOcd35FAwFx0S9
	 LMfPfKgcQQML8Veio6BiSkpTMdOJbMSFn/xzJMGtEF1oZQz90nnv14UwR2Wef4KZ3/
	 0gGFXApMLyM2f+NowInmzEZN3IR1J/37qo1AgfkxWHafmSY2/WraJ1MPpwKnS1/2TX
	 IdN+cGxKpVjWNXcioSQksQ6YXqX4W8bP9l8Rrno82mhwtjbwDXM4gq3VHwYa1UdSPs
	 ut6WCCSWt7l7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD333806655;
	Wed, 18 Sep 2024 08:57:39 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240917093957.6073-1-brgl@bgdev.pl>
References: <20240917093957.6073-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240917093957.6073-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.12-rc1
X-PR-Tracked-Commit-Id: 6b5e97c020060c2b8ad286002415106ab7034435
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b08f8327f71bf3b091567f0a9ddb72ca60f4fb2
Message-Id: <172664985852.725883.4372947439924753601.pr-tracker-bot@kernel.org>
Date: Wed, 18 Sep 2024 08:57:38 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 17 Sep 2024 11:39:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b08f8327f71bf3b091567f0a9ddb72ca60f4fb2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

