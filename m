Return-Path: <linux-gpio+bounces-35264-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPfKMKYt5mliswEAu9opvQ
	(envelope-from <linux-gpio+bounces-35264-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:44:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E66C42C310
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5A8431F6281
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A13E3A9DB5;
	Mon, 20 Apr 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSwhbzxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC843A380B;
	Mon, 20 Apr 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691280; cv=none; b=PSkAotweBlaMMO4aK/XX402PLTftO4XZ4NykFbmJbQY/T9uwa1NQ5+Qe5tI7S1c6wfkCQ5VMUjRrU2qg2UwrLYtObOObEoirdvjdu+dkj3nucWvBAjgnQKQ18r1A1lylJlh/PEs3rFtF9UUwR4eTb+FrNEs+GvP/ZRw49XbDV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691280; c=relaxed/simple;
	bh=v4DzARJcNPISs2RhdGEomhKZb1KwaG2QvZSKdA9rwfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cE+xV3e4Rtid+ryUg7RQtrWBHncsgvOJwrITA78iG8T6YNmQyXWB886LOjxDxUa2u1uY6A5+lb++F53SzLGawTyAX30q9//6ukZgenR7aa2fWCK+ntPZc43qigpJMPw8kFAprSUA3OM+hIUcUY3YY3gkBqSFBej1Dqdv4Io6cbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSwhbzxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7929BC19425;
	Mon, 20 Apr 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691280;
	bh=v4DzARJcNPISs2RhdGEomhKZb1KwaG2QvZSKdA9rwfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSwhbzxccPz9I93G8ii+fCsgbE2RqrG94rQoYiD1GQ5Ux8CDrYVxEStuGQ392Or6X
	 RSUNrYjjmVuztCHINXe27/d/e6c19E/sMvdV5PHqeNgsEaUdhegCVvO/RzCWPjehSK
	 BpvhjcqHLgAB8aLFFENyzJnuCupcbYdXJOwG6j6dMfviLKgz7YcQzSMhZ0f5NKe+4A
	 x+IBNdJj55V3UE8N8rfq404BfIBUhwZJF4nWvaetsOEgFeiGpbv3oFF6se7pcN1/KV
	 X8LcmwCWz33WTWuuftGN4JzCwBveVDwAoLbKuMCXYwVqm1IsToX5Jt8nSUJNzUJu4U
	 7GStbJ3uRWJ2g==
From: Sasha Levin <sashal@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6.12.y 0/2] gpiolib: backport fa17f749ee5b and a7ac22d53d09
Date: Mon, 20 Apr 2026 09:21:00 -0400
Message-ID: <20260420-stable-reply-gpiolib-6-12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
References: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35264-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E66C42C310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026, Quentin Schulz wrote:
> This series backports fa17f749ee5b ("gpiolib: unify two loops
> initializing GPIO descriptors") and a7ac22d53d09 ("gpiolib: fix race
> condition for gdev->srcu") to 6.12.y to address CVE-2026-22986.

Queued for 6.12, thanks.

--
Thanks,
Sasha

