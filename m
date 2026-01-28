Return-Path: <linux-gpio+bounces-31249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAWbOmRBemmr4wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:03:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54FA67F5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B8483096422
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 16:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2FF313552;
	Wed, 28 Jan 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwfCzMZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA7225390;
	Wed, 28 Jan 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769618365; cv=none; b=qiU+ajfrAWfTVXSoOT3O8Lp0Ws8sD86aJ9TyeOtXZ9NCtria40eCuKiO/p7ZclwGbFHhLZTQt07JmIde/LH6YK7KCIDkjCmdcWqy2fxT/6eocluYIWtZWBWREb+JCmd6ISYJputTA4jk/1CczmvZKjQW7m1xtSlqcO8gkkD9jn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769618365; c=relaxed/simple;
	bh=IZSTMkhdz41rdfKuvSw6uB1sRENKREKXySojwansQLo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PFzyhlc8hc9qDhBgQmHvT1XXVaMMk4MiYa9o3zizfvbVMFREUPWHbBFgml+NWvgt+vLRidUNxdj9p+uPFh4rmdbbfQw4NM6w0lzDFyk6cPFsdxkXeAQG71DChcrETkBbtcFBtAjJkvUIY+J81YmCCslrfzFzniN/m/HIMqfo/as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwfCzMZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B8BC4CEF1;
	Wed, 28 Jan 2026 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769618365;
	bh=IZSTMkhdz41rdfKuvSw6uB1sRENKREKXySojwansQLo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GwfCzMZ02RhBwv8URcYCsxbL91BfALp7jDu2hp+feJ2QPZdqJR4/zq+4oEWXp2F/v
	 Pvalo6TF3DDjQIj/h0kdxl3ncu6ngY2BpoxUEILhWV2fNstaqqXcNskX6RQuet9hYj
	 7yWmDA7OjQO+bhmlvx22ya/TVjJAgFqwKVukS5kyO4DIodzjZHWmKrzTWn8k6SEDq9
	 5IFHPNELemebeQOlAHGIdd+iGSLKQwlicQy7f6W3QKsK4jG98s36Rxi61k7+RNO+KA
	 6F14FFrilOf2ZjNgQpjxV5yD5pZaNkvDShrl8EJREs3jWNSdi4hNttJVHKmxzQVvf3
	 EqQt/fNHSD8AA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8F7439E9618;
	Wed, 28 Jan 2026 16:39:19 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLkCt6CXT26vo5MF1f3scXy86KYW+cqynDs7DWF8J+DWBA@mail.gmail.com>
References: <CAD++jLkCt6CXT26vo5MF1f3scXy86KYW+cqynDs7DWF8J+DWBA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLkCt6CXT26vo5MF1f3scXy86KYW+cqynDs7DWF8J+DWBA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-3
X-PR-Tracked-Commit-Id: f58442788fdac580c49e0c42379fd32438cff6d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
Message-Id: <176961835834.2140102.9793547246631983566.pr-tracker-bot@kernel.org>
Date: Wed, 28 Jan 2026 16:39:18 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31249-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D54FA67F5
X-Rspamd-Action: no action

The pull request you sent on Wed, 28 Jan 2026 09:06:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8dfce8991b95d8625d0a1d2896e42f93b9d7f68d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

