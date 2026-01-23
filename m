Return-Path: <linux-gpio+bounces-31026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ji2Borec2nMzAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:48:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 018497ABAD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA71E304502D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 20:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAEF23A562;
	Fri, 23 Jan 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSREFZhm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702872A1BA;
	Fri, 23 Jan 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201217; cv=none; b=ooQXaEK16jVrBqmqkPkGGXCdE3dYlfy8ICUIpI1EUVFN0QO5CErQJ5ApiALj76Ma5splE3CcABdug3K00ynml+wZ7ypE+kOxIR/l6WMX+6gqS4LEAQCo372fp6bVvJHmgeR+TfPEIYqqRD19S/gm7fSXYXVGDXleIsa0AIyevlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201217; c=relaxed/simple;
	bh=6pBfnXJzCIlP7kgVXbUtwAHRN6UYY/qWNFcvT9U6+p0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=df3eKos6/xmC8t/uj8te3gtLPTblC5+uOkmG4FY1ABN3gDKWYw7ggb6CJoTAU25qOYxqy41WWHrNEbxDHQ/wKWIQ5GKuRrIfBauL7OQ5s34qR6bn4V0SiknsiuQjBq5q17aRuOodv69GRiyJfUlZXjNH4FX2kzTMeOQ542oW2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSREFZhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEFDC4CEF1;
	Fri, 23 Jan 2026 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769201217;
	bh=6pBfnXJzCIlP7kgVXbUtwAHRN6UYY/qWNFcvT9U6+p0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qSREFZhmY1h51+VeDaXsUZ71KeiHVaQOrS7soLPc6IQG5+tPS/GgNI8MwvfuXlJk6
	 fi7u0iUQVHlMICx9bzBUdiy7kRyJ59FOjWhbma1/vFflOp7vWE1ibTIlspwM/ymk4u
	 37tuLcc0GEDzRS4vQ/vGrCgJuEiwIKuraKSnazwHgne4B8D016ekD3CGW5FxxssdBq
	 l8STOUx+MXEAsc76pOW8U1pFNimUTUe3ZKu6a8UUo7+MFC+8G4P5WU3TiYXDINbZe9
	 5pyL8GBmB/vqEgkafFph6RE96BlhjOzsHycaiGU1Gh1MXsL29iP2E/mT2lndqRXzQT
	 yv1TeWI3HdP5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 119DA3808200;
	Fri, 23 Jan 2026 20:46:54 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260123095122.13589-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260123095122.13589-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260123095122.13589-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc7
X-PR-Tracked-Commit-Id: 4918cc05137cb347686462923ab3fd249ef7899d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f664bbd5f2fc16c6bef29912d610ca67e12a2c1
Message-Id: <176920121269.2710575.14169407405483999956.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 20:46:52 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31026-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org]
X-Rspamd-Queue-Id: 018497ABAD
X-Rspamd-Action: no action

The pull request you sent on Fri, 23 Jan 2026 10:51:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f664bbd5f2fc16c6bef29912d610ca67e12a2c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

