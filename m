Return-Path: <linux-gpio+bounces-32873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJ/F1J/r2nZZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 03:17:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D4244228
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 03:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72B523090089
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC553A2555;
	Tue, 10 Mar 2026 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0OYf4eh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531632F749;
	Tue, 10 Mar 2026 02:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108723; cv=none; b=AGsEq71rJAKoWHIbMEw8oiwSRUQUUEtyY8hfXuf5N6s3jbt3qbHqAhaM5swgG9eC3S2LjqUKc+RZ4oZVrAeSQh2XXPM4qp/hsuFqGxJv6+83gCiWuMCzB6RIKXS+uwiFE1+COWX4qYPJLKeUWLjDviANEud+1bSAruX/mEVAvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108723; c=relaxed/simple;
	bh=BD21nfv50nwfWgskGS/wmBRCS5YnOo01m5ojxUevbFs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIsHBynC5hQg8WzqNu4LYQIDaLqKcoCNdrnolcJNxF/sRXi0a6gwjsWRSrAdXgv8CvpGaDrRGoM5dMwhp4t9hDVbgnOHBOxmXVxinjEQiw/7SQBD52Tss/M6TNTnEAsS0E+WKWlfylw9AQu1lAvR8fBZmSEuT1/wsPIcxmZFirA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0OYf4eh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A1BC19423;
	Tue, 10 Mar 2026 02:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773108723;
	bh=BD21nfv50nwfWgskGS/wmBRCS5YnOo01m5ojxUevbFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u0OYf4eh6R8pHA+bxxabGp3+aFcY9ogE9F8hRQj00nESFgdQwHsjVYnq45Y3tvMO7
	 jDMHSNkxE65hKRJeQ6XvB7B7aWsWiAehHB3+5/I/MMBq6mOGlojmZbpAWSp2+Mnggd
	 L+ka/Ba5T8UhI0FfXNgZXpAf9e298DFH/1DzJ2qV6L5uYh8mQW4rsss4hHM/eOqZfq
	 h9lwayS3lefao8/neW1mlPThRSP2sGPXyMSDSsX8evrvF3dsZnP6knq+nTNY99wJ6V
	 3LmoNqWemGbRjhFlOU8zzXSmnlYAeKzlwPV7U3ri/OSH7TOoYA4JYu+HJXD+6Bs1KA
	 vVlv5hAgTU3cA==
Date: Mon, 9 Mar 2026 19:12:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jialu Xu <xujialu@vimux.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linusw@kernel.org>, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between GPIO and net for v7.1-rc1
Message-ID: <20260309191202.753cff01@kernel.org>
In-Reply-To: <20260309093153.10446-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260309093153.10446-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E71D4244228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32873-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon,  9 Mar 2026 10:31:53 +0100 Bartosz Golaszewski wrote:
> Please pull the following changes for v7.1-rc1. The first two commits
> convert the remaining users of of_gpio.h under drivers/nfc and the last
> one removes the - now unused - header.

Pulled, thank you!

