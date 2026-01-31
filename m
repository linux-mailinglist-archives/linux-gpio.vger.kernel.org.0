Return-Path: <linux-gpio+bounces-31336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGJtC2dUfWn9RQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 02:01:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0ABFCD0
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 02:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D02301CCE6
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 01:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8444A31A56B;
	Sat, 31 Jan 2026 01:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK9z7E8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F65318EED;
	Sat, 31 Jan 2026 01:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821258; cv=none; b=rOW3CMG0QJFaWzuEzYXZ+FjRLHoNokwaiR3J3xnkUzL0f9c/6Cid/b2dhYHfNotVgglPEWW5ERjretDfkQVmvq1MMosFWTFddRD95tJcR69/Wc1Olwb0Tbaf0e8J3PFyvtErl43/B4IIPwY0aZbIJvO7YrHfmHaVRti6RjwDOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821258; c=relaxed/simple;
	bh=7XqMN++ztGaPa4e6B5bYE7A8qhgWYa2OvTuK/o/GhF4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mGwjltbnZzWQ6hdS1I1FWNGxWz26MgC8b4ZyvsGhiOuRd3xT5ePN7F9jwjugfLgPkGiUldNnFQcbE3Y57hDcFRl6kvlmJUWK6fmw3Sq6NiS8XIsltC02+3AjnRw9f7bW8j/Kug7FjrtAW/czI+LO/IyWamLyYXIu8uJ4NR28eh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK9z7E8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D640DC4CEF7;
	Sat, 31 Jan 2026 01:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769821257;
	bh=7XqMN++ztGaPa4e6B5bYE7A8qhgWYa2OvTuK/o/GhF4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OK9z7E8DCOxNR0aQlDs6GDH64yoIWnkvV9uNwAwcTdvqix3cqxaccNJbf3ZAEMIoC
	 7ujfqZ7cWKTXQg0u3OSRxP6On+Er+Fl9NtAOTDna2B7kngwOcns/qpUxNMnniJmXFO
	 K7QxxLF0/EM7p+nPGuJ+IR9Zf6wJkMt5XBKfGLB7MeulAx/vE0THS3b6zwxTslydX8
	 SN+D2kkQNQ2a7Dj/gOCv258r5xD6WrRJ255SNbdlPL+0sEI6yAby01CqREGGdo1GpP
	 PyWSvjPJeCpEA5hlq6z77J+dnAACUslqH293pX4Bcae/rIhuwmF2cds7r4XDCbF9Dw
	 l3HLgvkcAlwSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ECF6380CFFB;
	Sat, 31 Jan 2026 01:00:51 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260130115258.24843-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260130115258.24843-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260130115258.24843-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc8
X-PR-Tracked-Commit-Id: e64d1cb21a1c6ecd51bc1c94c83f6fc656f7c94d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d941a3f65605113db18d1485d65f0e175238beea
Message-Id: <176982124991.3947395.14451233339561881356.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 01:00:49 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31336-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AA0ABFCD0
X-Rspamd-Action: no action

The pull request you sent on Fri, 30 Jan 2026 12:52:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d941a3f65605113db18d1485d65f0e175238beea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

