Return-Path: <linux-gpio+bounces-35859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIFwBIQm82mZxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:53:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484C4A03C8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28745300FEE1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77013A7855;
	Thu, 30 Apr 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rArjTGcz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12A39B4A0;
	Thu, 30 Apr 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542760; cv=none; b=fiF2P8yewbjNIVsJeByYxmMH1B8JAQbL64m61OwIF+BVAlQbdoB6i0g9U0v3MSf98HW88JKo6ksCfcAD9u3zNoO2H7fi60Si/4ZU4T7CQmjm7p2Bq7AxpRuMhKvpSJJUnGzqZiGSuxbLZCSIf4+NDiRhIOe95Wze4bQYKcf7D2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542760; c=relaxed/simple;
	bh=9ZYv9PqShfeM2Ft9+Atg9PfAJU3QEsg5aqZV7eVJ01g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evIeEmkostphr6X323GehN9dLmUQtm1l0F+OtVNgxwgssO3BNElrwamSFK0/Jf3QwWa+rpZ9x+j+cr+bmkGqM5sgqUGEFnkRM85UvVHn2HEqT1GmMG2wAzJVaJblKYJHndJbo6KdoNnXfPjQEPjed8ageLp1gzqcncnVRamQFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rArjTGcz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F81C2BCB3;
	Thu, 30 Apr 2026 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777542760;
	bh=9ZYv9PqShfeM2Ft9+Atg9PfAJU3QEsg5aqZV7eVJ01g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rArjTGczg/8+uaSSAzGHFYBsik3eCX/4ijF45rMNwSnHxwzQ/ed8Jgh0ssZEJkp+j
	 /8rNmWq7J/uu1a/l+0drC4hvA1zad777FaOmuB2qLtELGD5xicor7Tq1hKasTlFp5N
	 v2dqm+fwTr+Wu88U+ktteWyKS062EmM+13rCxQbGOtHhOYa7jmMCg2l+FdPg/WXZ53
	 ZDzPS3VSu1z3zwi1BaXg1ePZx0+37QrM++npmYgslv2JlJx8B1QaGCrjWaa1dm+GyR
	 u0BLBxfaczALQRsELDPog23YbpEa5SpzofwZYDVtZVkC+om6BazG4puVTHoDq2iyN+
	 h9rV2TOjXGaSQ==
Date: Thu, 30 Apr 2026 10:52:35 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
Message-ID: <20260430095235.GG1806155@google.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <177754249703.2432539.15541841890441225607.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177754249703.2432539.15541841890441225607.b4-ty@b4>
X-Rspamd-Queue-Id: 0484C4A03C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35859-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, 30 Apr 2026, Lee Jones wrote:

> On Fri, 27 Mar 2026 11:49:06 +0100, Bartosz Golaszewski wrote:
> > There are several GPIO driver header scattered directly under
> > include/linux/. I'd like to either remove them or move then under
> > include/linux/gpio/. In case of gpio-timberdale, the platform data
> > struct can be replaced with generic device properties. This series does
> > that. It can go either though the MFD tree or GPIO with an Ack from Lee.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
>       commit: c44d171a52513bfd06b5d847b42b0c1013ddd46e
> [2/4] mfd: timberdale: set up a software node for the GPIO cell
>       commit: 2012c0d1b91767b68dedac127c3575cf816313e1
> [3/4] gpio: timberdale: use device properties
>       commit: 065d211f9ef7e60c510cbb3663ffdb7ca14efae2
> [4/4] gpio: timberdale: remove platform data header
>       commit: 0cb4edca4ed1325ddeb368f80807403cc37edc00

Note to self: ib-mfd-gpio-7.2

-- 
Lee Jones

