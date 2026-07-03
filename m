Return-Path: <linux-gpio+bounces-39421-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2rxKL/cR2rngQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39421-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 18:01:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AE7041A0
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 18:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RV4D5nCc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39421-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39421-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1A6B30D8CD8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 15:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA422C11F3;
	Fri,  3 Jul 2026 15:55:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11A2D1F40;
	Fri,  3 Jul 2026 15:55:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094125; cv=none; b=qXPQcjVq1lU19Vp8FKEwNwpJiRE8FUvKIx3apJvZv0vV3Umauz80o/Tr+2ZX09ZkEKHTwA5UXKvXp1tibDQjt1MhrBMBZeZkVKL9dlN3QcBHKQBq34kPSv/vM+HpgTEDVFhnjCyYXtiZbZ6JbmYAehQGfeOberWrU9UA75Ys3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094125; c=relaxed/simple;
	bh=DzQG5y6S4p0WsZ4UNrRoZ4+yqbC0hPz0GthLB16ji+Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Xlxt7eA2289WQdsOriM71l6IdFXwyJa4zndtpJZdNNVFA6Of9n4rCsdxcuLToLZFtqfKG4GAzYJ8qtaJNn7KssSVUoVFj3mQPrT8oA7LievCMHUcwUHg5DjaH3Q1pTA+fd3CiaVKMvqmXwN8mAOo0bWWN4St21Nh09ulr4H54NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV4D5nCc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AFC1F000E9;
	Fri,  3 Jul 2026 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783094118;
	bh=xI/t66ac+ic4oGwPzYoMNIgelFa+hMQiYFJOqrZl6uI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RV4D5nCcJaJjyhYOKifAVo4xjiJrGMzUTFBKiW4nWXz1I15UWk/7raT9s3jKnMauH
	 n+RrDFIa7ZRUXBmkZxm2+TVcJAkuuP56uwiZAfDy0SaYsibSmgBNKQE/a8JG+uIDnv
	 zHEV0ntjpMnaOPAhKWKYA7IxmRsyWLG09mjnTiDavdzjSxSYqGWrnTYiW2U6mwd5fe
	 wbClL9PBUu5nHK8y7yzJ5D0+mbWIg6MXrakwE2mEyLR3eQSTFfBpKop2YWHNHg1+I5
	 2XanbfRkUJDUVwxpLadrcJxRsgmGXf74YFwSkDFZQr8BiVocWhvZilAt2fzO+XUgIU
	 z1lrIAq2Xd4ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C4C3939347;
	Fri,  3 Jul 2026 15:55:02 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc2
X-PR-Tracked-Commit-Id: 9777530157e7b82fd994327ff878c4245dadc931
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2916bfc6baf7e1215b00169d285b88321299b629
Message-Id: <178309410089.2776291.18230823079101094422.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jul 2026 15:55:00 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39421-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 082AE7041A0

The pull request you sent on Fri,  3 Jul 2026 09:59:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2916bfc6baf7e1215b00169d285b88321299b629

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

