Return-Path: <linux-gpio+bounces-32328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aALBLpjpoWmSxAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 19:59:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E511BC39B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 19:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 740513010731
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 18:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D543A960E;
	Fri, 27 Feb 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+mnRpZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF53A1E8B;
	Fri, 27 Feb 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218770; cv=none; b=fqkGvlRCrJ25SGEllxRxwb25ds8n8lgRHctclW7ftqeQ6Eo5Yb+3miHmIMmkAC4KpRfO9+OVFcxXz3ssQCHmUr5LZr2oTPrtTu7PPaLDZsaLR+TAD4VzS12ul3RqsvF1JN2OFKLojts71HVSoUItAp9sNo6jv28QQSDM28OqnQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218770; c=relaxed/simple;
	bh=DIp1sIn8Eu+zhAc6ybEj7Nn+LJk6D2hHDHkm9BkoEsA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GXgS1wzj/uLB83JZMHozd2RrubQ9jlwg0Th0ovxsWZ8ORp3+nnl5dzWlyxb+fl/4YUyiUFIYCSApaL3gmXJZAxPZ48n8Y2ZYuemwlZ6GldbiCoPVoY4+V8OB8P8ErQakHo2YzXs2kHge+nKlo/fOYHWNmT7S9sU6Jv/3diAZLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+mnRpZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB12C116C6;
	Fri, 27 Feb 2026 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772218770;
	bh=DIp1sIn8Eu+zhAc6ybEj7Nn+LJk6D2hHDHkm9BkoEsA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Y+mnRpZpmXmjsPj5f/nZkj+WFFzSpnSQWf0pNks2VDTdbxHzBIjoXMnMez97sjeDg
	 yLBkzMLfnCBTJ1J641h/o/PQ2yTOtgRPlRzRoY5GMs0W8sIVd5zP2B8Ny62q23hIX3
	 izZ7ZIGRqwzhEx05uPzrGy3Y3ArsyDUOEhDt3uEZhcK/0ff6lUZk91RNPWh/tMV1T5
	 FN2GR13/VJar9x/p77ND4GNcS06szurYtYYCRIGvlNKAcFR6CN1uu19ZLs0he6a4O2
	 gKYKelpd+fBxE2M90xToH2WI7t4zncMgEr3/E5WZ0hZjxzCZwGYH1KoixoIypuh719
	 BVnAvd1mtqLAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02EFA39E9614;
	Fri, 27 Feb 2026 18:59:35 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260227084816.6898-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260227084816.6898-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260227084816.6898-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc2
X-PR-Tracked-Commit-Id: ec2cceadfae72304ca19650f9cac4b2a97b8a2fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5a8e4be46514982c143a91549c678002b839a28
Message-Id: <177221877361.2713791.6333417669605008413.pr-tracker-bot@kernel.org>
Date: Fri, 27 Feb 2026 18:59:33 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32328-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9E511BC39B
X-Rspamd-Action: no action

The pull request you sent on Fri, 27 Feb 2026 09:48:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5a8e4be46514982c143a91549c678002b839a28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

