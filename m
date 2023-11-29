Return-Path: <linux-gpio+bounces-697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0C7FDBE5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D936328276C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C043984A;
	Wed, 29 Nov 2023 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvUBnjI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057138F8B
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 15:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3936C433C8;
	Wed, 29 Nov 2023 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701272842;
	bh=d3gt2pREE1sy0WhzSvItx8bCjSwa/mbOlEtQRCq9L6k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DvUBnjI50H6IOBbIP4gW3m4Sh6GuvFG2us3wE250WoFZlQ+rxcXOdVYWsH32pAj4x
	 K+NyTVdi2uNOTA4vvZezEJLV2IFffQLYX0icV6GZQayqsSV1yG0PxBfTs75KnoPk4+
	 sd2NJyZiQ//p1gbYJA1VlGIpoIsDBJlb9ZVaNmrrGK/Y6QUdalovo3X94FtyZDRicN
	 QUmAeb9iR/HJtnilyelFqE/j6XwtuoC5oXHMcER+PZgFCJWXRFrvDLwn32JJJgQGgK
	 MF3xdd8CvfClbf/+zJ3spBNsc5icOZoZkxtFQbUsafeVL2aFtKyLiLrjccL6Bx73hS
	 V+YBl6ff84idw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C129EDFAA81;
	Wed, 29 Nov 2023 15:47:22 +0000 (UTC)
Subject: Re: [GIT PULL] Pin control fixes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.7-2
X-PR-Tracked-Commit-Id: 90785ea8158b6923c5d6a024f2b1c076110577b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b47bc037bd44f142ac09848e8d3ecccc726be99
Message-Id: <170127284278.10361.6469775362333533374.pr-tracker-bot@kernel.org>
Date: Wed, 29 Nov 2023 15:47:22 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Chester Lin <clin@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 29 Nov 2023 13:09:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b47bc037bd44f142ac09848e8d3ecccc726be99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

