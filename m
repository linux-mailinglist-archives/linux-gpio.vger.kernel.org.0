Return-Path: <linux-gpio+bounces-31988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKK4Fi4JmWn1PAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 02:23:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4816BB76
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 02:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E50F63062211
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 01:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D5F31A05E;
	Sat, 21 Feb 2026 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYoC9SY7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046471F16B;
	Sat, 21 Feb 2026 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636827; cv=none; b=YBD8RFldI2aY+fEfJB8l1GqMBo5NaMy2/LDMU2CYU8sc/buK/vTGrRVcgrVpe0M39XH0x61rcTZMb1BmCbj4XLmuBDQvSlK6DpsCKJcdmFCt4HQ6gZlT9oNt9TnilNCa5dS6DudRoV8X4uE4jmohp+iiRhwIi56DGKmIEjWYYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636827; c=relaxed/simple;
	bh=Ot/qPSh3D7xKJhwxnKOsp5AqUpfyccS+9Tz+/0lbBuw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nC8fqRCunNt5gRv1SzD2Oz4rAm6CgjJ2ixohPfyvGgTSmHe0ow/EbbJx6J5Kxiew2mKhtM+KcHvgLzJYWh/Hrew5PHK+16fGEPjthIemxHgem7xlt61SyKbS7DMnnNrZm7JZX8yuZ7aKtGLRaa0i6css7DAC+NFgd+BWm4NO8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYoC9SY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC477C116C6;
	Sat, 21 Feb 2026 01:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771636826;
	bh=Ot/qPSh3D7xKJhwxnKOsp5AqUpfyccS+9Tz+/0lbBuw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JYoC9SY7mgj0BsaHttOVnAy02Txg8KP25ZB2dVWR9CoW/5fam8mzZnfA/IOPb/4ik
	 07kRzcxo5d+CwEz7h0ZhT3ppS1qKVm7BaRGVgYN8FC5T5vP4rPkDjCu89b6KH1Y3aj
	 s7xENkjmUQVVI+FkCQpknxHTMDZEMtZLemGPT8zeAth7xxnwIx+wknGl0jnBZnWLyD
	 Hhg17JIkaw6AWjkfgZ8IBKm5nW5imhoiuWTEJltpMVSFU9FYiKKQycCb7iAc8ZjY0O
	 BV0ca6jZpYS4O3h+w4Yg3NObn/mtd6BGY4WvsZ8l6GDEzEoVXsHOzOVQH2G55ZaJrV
	 Q+YpZCeKCvlAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02BD03808200;
	Sat, 21 Feb 2026 01:20:36 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260220094023.16001-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260220094023.16001-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260220094023.16001-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc1
X-PR-Tracked-Commit-Id: fbd03587ba732c612b8a569d1cf5bed72bd3a27c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e8d85235677b6571857c26854ad1d4edc64c50c
Message-Id: <177163683461.969912.16794615313443881940.pr-tracker-bot@kernel.org>
Date: Sat, 21 Feb 2026 01:20:34 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31988-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3C4816BB76
X-Rspamd-Action: no action

The pull request you sent on Fri, 20 Feb 2026 10:40:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e8d85235677b6571857c26854ad1d4edc64c50c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

