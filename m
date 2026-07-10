Return-Path: <linux-gpio+bounces-39840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfmhByQnUWp3AAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:08:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3003373CEB4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:08:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lwL1ad0y;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39840-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39840-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFA033023C38
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B1343CEEB;
	Fri, 10 Jul 2026 17:05:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337443CEC7;
	Fri, 10 Jul 2026 17:05:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703127; cv=none; b=Lc7JcZUAmnYxeaCFEumPOINFgJ/GA/xYkSw2SL30DFkZW65J/5HuD8Ce9c9LpSGmr5cnQHjy2CtVGuYrW+yA9cn+0QQty9JIZzhXj0Q+DZ5Wt1fCI7UuplhMqr3mjC/60Ibvickw9mfMYrd1ZYcQJKBtsuNmAaKnkUPr65acFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703127; c=relaxed/simple;
	bh=hsfRbH14Myna/QFNGSawDT1xZujeKokAK4rrDynEyn0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tVh2Tc/HTS+9Qnj7ee1+zBs1xXLOtItdI54kBY0AUV6gi5IJqm6FkiJdz2YrJ+PYsg4KRSauJbHFeFyQXv7nlIKipiLbcEIttUqDl+9dNAdgfxww9gxC+4DVui/2m3sAXwX+ngZepXclk+viAphKjJ5rj5c7/0js4S3fpUD/LwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwL1ad0y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C0E1F00A3F;
	Fri, 10 Jul 2026 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783703125;
	bh=aJePSyOg5OoYp30MLHch00/HR8Hy7+hHeyPR6rlr4Qw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lwL1ad0ypQ6DUZ2BqgiMoZdKi62KlNUlri+XlZ58FLsfKDCZa71rvRckUTCrDtR+3
	 MYOW8XQXq3dpqKp4sJV8oQLmi2P2q+gjh+3vlTl14ZAlwWrjQkJLDcSq9QfzbMexaA
	 0wpACkujXOrUOkwIyjqHA0w37xgWQFE3MwYS18AsxwTbYvIvwHQevZr4++SWth/YIG
	 qkBJYythCO92z/4tWImnjcrrEJhJQqIvkVnCrKZVQYaijRzcjbKlRAjb+hJwthMtPo
	 vwQ6eqWmv5Q45LE7fr9EaERQyGNUSGQ7KHLur47f2hHWg7P0red82Yy6Sohlp/mCeC
	 IU/VYsgtDf9sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CD73924FB2;
	Fri, 10 Jul 2026 17:05:04 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260710085520.8412-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260710085520.8412-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260710085520.8412-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc3
X-PR-Tracked-Commit-Id: b11c513ad943f35cf5e8007d3a56279c79b7ed4b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f827c27e573b475863d87bd2bab0b06f75aef5cd
Message-Id: <178370310357.779204.12348880753518720542.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jul 2026 17:05:03 +0000
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39840-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3003373CEB4

The pull request you sent on Fri, 10 Jul 2026 10:55:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f827c27e573b475863d87bd2bab0b06f75aef5cd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

