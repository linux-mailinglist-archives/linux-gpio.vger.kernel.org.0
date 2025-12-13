Return-Path: <linux-gpio+bounces-29522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A81CBA4AE
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Dec 2025 05:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F24DE300D30A
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Dec 2025 04:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D65A1E3DCD;
	Sat, 13 Dec 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHaNrst9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0F17BB21;
	Sat, 13 Dec 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765601195; cv=none; b=h6fuK+EkeU49AKHyddBZUX1gionw2i7jKXf8G0Ix9RDjzx/AC9genE+zNAg4A7xY97mAmAsW8GglKnxQZUS3q4IlKO03fMwMGz+zBO/vcxOifQjpLevcgcMCyfK8lxRGIrN0hvF5R4UtJUeB1qYFF6CCP/S4CZKBUwdr8Zp+sns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765601195; c=relaxed/simple;
	bh=moD901OPbDJowvRSxROmUuiKv0R+PeBa8gZVwKsXogE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Irj74HSAILPgVH1tn8FM0i82HN3BF7watfRyh3/evzeEgEuNlE2SoFFKg6+Y/a05FrBZxgvo4XsDnxvKfx5qRGS45M93RlPy8c2F1zI5ZYmQRPxd3EjuFTlcprNf1hOnm4RPOGd5qUhAdkoqwi39YPP0tdpOLbvks5I/mk+GdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHaNrst9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29819C4CEF7;
	Sat, 13 Dec 2025 04:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765601195;
	bh=moD901OPbDJowvRSxROmUuiKv0R+PeBa8gZVwKsXogE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kHaNrst9+HaxVKSUqLfGoWfdhSDrCKJkASZHOCwxqZX9pzu/GMczshtIW3hL9//WL
	 tXrWCiKE3Ki8BJFLCf82rXyKfMMO5817TuR2dY+3imz/B0KT73NfMmEVlvfzqPQ6KG
	 +XRFlMldSJnU73pwCo2/fOzHIMtsRADLOvQhfaHr34bS82mQZ1JtYpXzPgu8HibPkT
	 uDFeENMolMJ8mtsnEKNXQEWdvCHwd2+MtOCABdR3jil8Gu8LPwHvhgk2AxuWgLMbSp
	 As/7Ulq0efwZB3/z0TqwqPzoFZFXJyAOWWu1aa5WeHntqTXPeRPdsjalgVKx4vi/2Y
	 yfCvYuSOUeL5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBEF380A954;
	Sat, 13 Dec 2025 04:43:29 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251212011418.6945-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251212011418.6945-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251212011418.6945-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc1
X-PR-Tracked-Commit-Id: ea513dd3c066074b12e788114b45e0f2bda382cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6bb419c1c0061abf164eb437bf0dc0281ba7369
Message-Id: <176560100763.2405448.2188260829553885972.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 04:43:27 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Dec 2025 02:14:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6bb419c1c0061abf164eb437bf0dc0281ba7369

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

