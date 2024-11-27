Return-Path: <linux-gpio+bounces-13331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1F9DAF08
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 22:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 450CE1652CB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 21:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1B6204085;
	Wed, 27 Nov 2024 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnKN68Nd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07420371B;
	Wed, 27 Nov 2024 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732743694; cv=none; b=R6uvSezkeEkZY0MWYaG5dbJ4Cr+jnco5Yw5xdfK2x4gm8LLB6O5bK6+C5kYBiufuFSX6mjpaXUPajPA7Pa9+/73Ch/4s45R80iL/n/KulDsu5rUd1V3kALhE+oXSdg3gYvAK+gnpZWNzkiAgASuKrxu3dqNtf2XtSdviKYcG87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732743694; c=relaxed/simple;
	bh=5KxPG+XwPQw+bLUahiAjp6CidsZDyxQxnnA2Elw3POU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CUTNmHWq6WqwJagU15H6fhNOSouPJkSBUPElCkXPoFBX+RMBv7MIPW7/H6vq2choLXPOAsmQVzFteGaiqCZHgvxuvriawH7gaM9xsJTHb6N+CDAtJfWApodEa902p1H9sy/V7Ayr4cTLq8VUcchWVMHgyZ0ni2zOLhe0rDAdNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnKN68Nd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCFBC4CECC;
	Wed, 27 Nov 2024 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732743694;
	bh=5KxPG+XwPQw+bLUahiAjp6CidsZDyxQxnnA2Elw3POU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TnKN68NdQkP4ihJThD2PZyTGRSJ42Ej5pT97su0986+fJqWwDvnErvTDuP40wA6eZ
	 TB5h/cv+Dz7kXBnf395rx3JkcELzB8INRYaU2VCXg9Aw7ceT8APmadsJ5t0KPUI30x
	 vrsc8S4ctzk/0ljt0wXTnGVGuBJ+hfMoCwIljtvfRsavLp8WqJk0qfC4D4D9MkH6kc
	 MMl4T96w1GNysyekQ2NF/orxfTdkH60JaQ4hP+SGDoX66Zp4cAyAqkhWpvwvorASr2
	 uEbzMgpY6F8GH5kTQa/+bA148kKOtPuPgr3nkPX9yS/m9e7kbJ0Qeo8uKf5EXt2Owm
	 pfskXqHvoF5ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72F13380A944;
	Wed, 27 Nov 2024 21:41:48 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241127102648.15637-1-brgl@bgdev.pl>
References: <20241127102648.15637-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241127102648.15637-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc1
X-PR-Tracked-Commit-Id: f57c084928661969a337c731cd05e1da97320829
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b867c475ec98c9436c4b7cc6f2cdd12e8ff43ca
Message-Id: <173274370692.1220377.12704562065218385206.pr-tracker-bot@kernel.org>
Date: Wed, 27 Nov 2024 21:41:46 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 27 Nov 2024 11:26:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b867c475ec98c9436c4b7cc6f2cdd12e8ff43ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

