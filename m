Return-Path: <linux-gpio+bounces-35513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFNnIufU62kASAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:39:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56F463392
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E21F4301B06F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5997B3FB040;
	Fri, 24 Apr 2026 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hObIzEWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8E3E928A;
	Fri, 24 Apr 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063087; cv=none; b=hk5o1W8e8qUe4cnC/d99vfVSnwdTXAIRccysYN+otuqsgXTQtW8QskDaz9CVA1S0d45V7gh3YDUmFlLEEnO7ypnfBpc/rTB/dxSPDVDu7Qjm9fQRpiJm3yCI5f6hGRIzAEOCuFSXXGhPyDX1j+3tTszttIK/2qDrwbrvD5OqJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063087; c=relaxed/simple;
	bh=8GTabiU78Z9JaGufgAeBxqBlvUTwCJ6jMri0R0mqCj0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TH4xj74iH53IIA/84a19Ldm61nbVdfSXVzgyOkGaQfVu3SZoLptwIcGCv98eDIB87eU4ZwJ7qmmvXWJacljru/DZoJZsjD1f3Mu1/LJfsqApiT/KqmAugeA1WxzQH0LzF91Oa4oKnN3vjTAqwG+62YvKF7VvKZpbXkUMXwuS1+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hObIzEWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19C6C19425;
	Fri, 24 Apr 2026 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063086;
	bh=8GTabiU78Z9JaGufgAeBxqBlvUTwCJ6jMri0R0mqCj0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hObIzEWWFdziZKrREf7MnY0kH6NAREXYTC44YMQVwtf/LQ4hqJ2IhPKEqDJMjv3rp
	 RNZU2iyhaHM/gElARb4xdlEY5CjUZmsOzVlFQvRedLMRddkKFOgWWbV9sxJnk2wD5h
	 mgXIZcuK3nslGoCXFHlEP41NxwS8MnTS3pnhXbBUEI/0KQkOz6PyR0Dtfih5WxD8iT
	 b+KkXqMQTCyyZ3orc7hiedTLO9YBf+1ziJKNJt04u+BoteYmKfXgBPcNchN6YcWhOG
	 8Nmp1Tb6qJkUgsERKsNqDfGUiz3qm/tMJNXB0lDidBdIG/JXywFRSJajt7t9cNMYFR
	 vmtPkG6HHR0tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD9638119C3;
	Fri, 24 Apr 2026 20:37:28 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260424075903.5997-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260424075903.5997-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260424075903.5997-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc1
X-PR-Tracked-Commit-Id: e31eee4a961077d60ef2362507240c6743c1c2ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0fc5bf9fe9b89389287846f13cc4e462a89954d
Message-Id: <177706304689.1703875.8418240362170065263.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2026 20:37:26 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 2C56F463392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35513-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The pull request you sent on Fri, 24 Apr 2026 09:59:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0fc5bf9fe9b89389287846f13cc4e462a89954d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

