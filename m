Return-Path: <linux-gpio+bounces-35229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PaRKgIh5GktRgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 02:25:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531E422B99
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 02:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 040523023D99
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 00:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CBE2AE68;
	Sun, 19 Apr 2026 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkZvEBVy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B510F1;
	Sun, 19 Apr 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776558335; cv=none; b=K9pVRmXIEci4pPoDXz4lL1i3EXfD+IaC/BE43CEeo9WhDgt/Quk/GwotGXCRcwJhEziaaze6vy9GtXsXoToVsdR+c5P2csdItIcHRi7+Jp3NvQtbc1kVSleX1DuppsS16go/BBkzU26OsMw/MON57ggaLrEhm1Jw5jcU46PMVNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776558335; c=relaxed/simple;
	bh=HXGQ0uGCBQvtLgA5cj3EUkd2oJWuJ0c2F0TRgRwcgH0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=T2eeXnYhsJtOxs+2MPj9p193aThqQ58kgOBgcYbAJ0cf363MpoWp/OxCXh/neM702NLdWLld3Gy5NO5OI0mKAwH4r8z9drhf6g+yfBvntRtKDK1CNYt6LcEW5mqkaGiZmhERm9Ak3sZSpkJ5Pb7f2GFnp+4Q+15VC1GBNYhYWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkZvEBVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D62EC19424;
	Sun, 19 Apr 2026 00:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776558335;
	bh=HXGQ0uGCBQvtLgA5cj3EUkd2oJWuJ0c2F0TRgRwcgH0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YkZvEBVyn9ReGpbpj5btYiI2Vp+L/jnh6r0VdeCtlhJLuJlq5GIpi6I51zu4Ne29o
	 RtaX+Mirh97eR9SGsohHXcr5BODksT/DEJdV1gCX52mje3WKM3dZEk1rCJ8td6+hYt
	 eWQJQ8dqciIAnNeF5sXbDWwzNac1PIfIAgYB7ydwPyA8y3W9uHnLXY48A9iBtPgkqv
	 3xpbLjO8jNCNgH2SHScq5RjWR2X357OK0a2F61yf8tF38jKYqFQmdmxFLMF0QyHMFl
	 KEqZViTPdaVwjM/aHeClObD2jnDa0sGQlhXamq8DHxXfCcskCDOUkA5k/KWTMFXaLt
	 cfS81ojhJBZUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FF2380CEF4;
	Sun, 19 Apr 2026 00:25:03 +0000 (UTC)
Subject: Re: [GIT PULL] pin control changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnutHonK6g-a9c85s5LgVY43WZOBCVs_G4vAY8etySU=w@mail.gmail.com>
References: <CAD++jLnutHonK6g-a9c85s5LgVY43WZOBCVs_G4vAY8etySU=w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnutHonK6g-a9c85s5LgVY43WZOBCVs_G4vAY8etySU=w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-1
X-PR-Tracked-Commit-Id: 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: faeab166167f5787719eb8683661fd41a3bb1514
Message-Id: <177655830158.601756.14852463695583411615.pr-tracker-bot@kernel.org>
Date: Sun, 19 Apr 2026 00:25:01 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35229-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2531E422B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 19 Apr 2026 00:24:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/faeab166167f5787719eb8683661fd41a3bb1514

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

