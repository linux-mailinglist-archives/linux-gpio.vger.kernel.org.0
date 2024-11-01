Return-Path: <linux-gpio+bounces-12473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7629B9814
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 20:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC56282CD4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 19:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D79E1CF281;
	Fri,  1 Nov 2024 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOQrMMWf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0591CEEB3;
	Fri,  1 Nov 2024 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730487988; cv=none; b=Gsb6N7nufLuKQP1nDkyMdGldgxUln0KPbvJ5YYPruhnl/EJpab3pjADb/BAafMvsczbLNdJqu4TWkoTEHIygCB0w5vv8XXxZfTRVJIgtwN1K3QfZuwHrNCq3LLo6itg8zZIJUDNtJg34eo1WyQaVFBk/rRyXbCdqmHFxx76aY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730487988; c=relaxed/simple;
	bh=3xWr2Pv+wIaPuxk1NXjw+pgU1A7VVVQRLuOEyc6FxUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kpZnRkP9KiqxoUJZhbrXbYPCH+PDhzDOj1/KeaAH5I+KqXtQ0eHNO43L3LcrvV+wnYampqVwb//6skmToXoqJkR/Qjff9TowmJhFT3uUNcdgVqteKPwxfexLzlutbdIfI743bZDO9QF6eUahaHWvOla45yBiekL9Q251oMmt4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOQrMMWf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E06C4CECD;
	Fri,  1 Nov 2024 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730487986;
	bh=3xWr2Pv+wIaPuxk1NXjw+pgU1A7VVVQRLuOEyc6FxUI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UOQrMMWfHKVdGRcY1pl18fWXvQGB2QWEFLdaX1twjYMTfI/izpjUG7lytxDyEuSOE
	 /fABK8w7tnzZiPat/dychuD+tNHcPfuKyXJLsdfIqnKdvxN1a3lfs5k+VPx9ukn5a3
	 WLzHoPMd1HTvBOEVGdnDIAjLlzZYfKR8osyVEk9l61XbYEBm4LI3WqlY3SQEO6s3nv
	 nkjxpjfpgqJGcqPwEtbPgQi9OrsVohprZoYUhg7yjayQym6k1BbbOa9X10bn3iDqlz
	 EI/HJqugZE7QAYSglOHAppUFVFnd2kEMhhhfe5pJ3sFv4ax+1z5mAeXg29ecUBS21N
	 T624tU6e9E+nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E683AB8A94;
	Fri,  1 Nov 2024 19:06:36 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241101133517.12627-1-brgl@bgdev.pl>
References: <20241101133517.12627-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241101133517.12627-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc6
X-PR-Tracked-Commit-Id: 604888f8c3d01fddd9366161efc65cb3182831f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: edf0227abd7ffa3eff5510fd760123e2e15dc879
Message-Id: <173048799475.2811397.2845699925195434705.pr-tracker-bot@kernel.org>
Date: Fri, 01 Nov 2024 19:06:34 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  1 Nov 2024 14:35:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/edf0227abd7ffa3eff5510fd760123e2e15dc879

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

