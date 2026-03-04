Return-Path: <linux-gpio+bounces-32480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHQLGZpmqGl3uQAAu9opvQ
	(envelope-from <linux-gpio+bounces-32480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 18:06:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D597B204D83
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 18:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 302B330F10E3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 16:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F661373BE4;
	Wed,  4 Mar 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrbpa/uP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7D372EE9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642845; cv=none; b=U5EB9yIawxMKmCRdQgT0Tue28VeaSTQX2Fg07NMxUDb6AUnvT6+sOWefOWNhNwANKvoLaUCatC41Egpkzcc9LrV6IBagyj2VV8ScOmeWCeqGBJzeEaAq5/ZiDV7JfpaTbCNAcqInFi5F6qS68XlxAies2kd5f2pZYGGtj/ix3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642845; c=relaxed/simple;
	bh=nhpTIth+kvozNdkK/uAqdnTVx8Wa272gqsw4ftj+FRU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=a/bFsDwOYN04v95pHThzUjaP/uv9315RhtFo/bg7rs9ykHeph/Mibp8/4NojhVobPKA4Rh5GrYAlQWb2XHfRPWYC5j8d66I1OPWdbbrpUNHAmEfjHtsPgfsCz5etsGRRQnJJ1s9u3XRFCiQl0o7lEjosZNJWS+Cc8fUXQjoRizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrbpa/uP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F2C4CEF7;
	Wed,  4 Mar 2026 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772642844;
	bh=nhpTIth+kvozNdkK/uAqdnTVx8Wa272gqsw4ftj+FRU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hrbpa/uP8XmWC7qMU4WmR0gQMewj15AoVGx1V6Wz7FL7T2TQMLhtwk66TrWH6QzqU
	 2zKbM9W+maV0ACw8pCPpfvw45CxL0IogAOx4Mj2an/oe+IrPi0D0pLMH9tFmjAvocF
	 tK93K0s3b04scNDeW52iNQivgfZgAgRAe8LzXZDfDIhnvjFGnqiPgJZPnnytqEvmDd
	 plkmkXrCzoLn5JbOmnkw5tt+juP8JuaniDo5h1CU2RooYqDMxtO1WKWxTCQgt9TRBO
	 PMMcSzjLblPSFj8nJs7R5WemzqhDFnN5N5Eo9fLq/9fr5BYCUBV0P6ERnO4lqXvo4K
	 huIZafLDJocew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1313808200;
	Wed,  4 Mar 2026 16:47:26 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
References: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnWG49Ne5uk1eqR+O832dWQQb7dBNz6qoUKHt6HyRNEwQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-2
X-PR-Tracked-Commit-Id: b6c3af46c26f2d07c10a1452adc34b821719327e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40d3f622477ccd99118498df5283941bf546dd9c
Message-Id: <177264284523.2299690.4493629634466307875.pr-tracker-bot@kernel.org>
Date: Wed, 04 Mar 2026 16:47:25 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: D597B204D83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32480-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Wed, 4 Mar 2026 09:05:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40d3f622477ccd99118498df5283941bf546dd9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

