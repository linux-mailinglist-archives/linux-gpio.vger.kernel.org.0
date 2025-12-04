Return-Path: <linux-gpio+bounces-29264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58BCA55D6
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 21:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EA2031351D2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 20:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDDD2EFD81;
	Thu,  4 Dec 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2w2xjK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298112F6931;
	Thu,  4 Dec 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881005; cv=none; b=JyRjkG8/WycwtjU3bNg3EydWntbLcPK0AgI/EjDlRnNt/WGRcNQxR4x0oeJfGaHXKHy5usBjUmCOmFIpJ6PNpbO0MBd4oH6jjglZs4Wbj/NLOGi+2OO0uajOnvubCUnnizDWw2hPSKSqCDuhEPjJ6kR36LSRVAJ1mjm3nPSDzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881005; c=relaxed/simple;
	bh=1hv4OaDjN4QbQyxmoJXNzFS46MtGhxuZB1HGK/rc2mg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Z47l8/CeSTEpMb0jhniVw793y+HOTaNdrZWN/kZJKwzvJRm4CwZAaXsoKKMDUqWy7g1ThTQuHcqjhqdCr0BjMGdVpOEDbB6g6UGYclJNmcSRIWLxu3BtOAQcqwGxKdJxWc8kHF1dqwJjBGMZe0ynk1gC8hcdfl3/5inIR29eZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2w2xjK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B692C116C6;
	Thu,  4 Dec 2025 20:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764881005;
	bh=1hv4OaDjN4QbQyxmoJXNzFS46MtGhxuZB1HGK/rc2mg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Z2w2xjK2okeP+VE0cJOuungIwgDXEkuP6+vex9wOWx6mUExZ3Jcqe4DirodNXdJr6
	 9M5IhbpOGlfmjvF0bJOMcVGGjMj6DhhMaVtDzwzWaw+mDpvgyfYFXiW6QVDgUimRSF
	 D5lt7IDnmg7mvGw9kH0fqnEJug2vhK3C9Du6GYTVZaiL6n/BAjUyNbjymqSMoG3WJp
	 he6oUUuDfo925LNef7mo6Pu84gw9fZoNw5X3I9E5gTF2/H/tIsIeyK+YbuTS3plYdT
	 GCR4P/3mWgiJi/vF3R5A9pM3WEJXJyX2jld3i75aDijNbxl8qRugfUT4r7GAGYQrDU
	 9EYwAB+YtYujw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 61C563AA9A83;
	Thu,  4 Dec 2025 20:40:24 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251202082740.10843-1-brgl@kernel.org>
References: <20251202082740.10843-1-brgl@kernel.org>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251202082740.10843-1-brgl@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.19-rc1
X-PR-Tracked-Commit-Id: dae9750105cf93ac1e156ef91f4beeb53bd64777
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 500920fa76819b4909a32081e153bce80ce74824
Message-Id: <176488082324.968054.7101284232920043155.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 20:40:23 +0000
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue,  2 Dec 2025 09:27:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/500920fa76819b4909a32081e153bce80ce74824

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

