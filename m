Return-Path: <linux-gpio+bounces-40099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +OtZG6RAV2qeIAEAu9opvQ
	(envelope-from <linux-gpio+bounces-40099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:11:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C827A75BC03
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b3NNuCqt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40099-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40099-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D36FB3009025
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3045C3C5DB8;
	Wed, 15 Jul 2026 08:11:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0142DCC1C
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:11:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103072; cv=none; b=q6fu2iUVBllPoW/lk1zoAmztzqoRWXrvr8S04RSD6jWN248LdekQ3ioytrt7ZoVndmORZZCHCjRiL0CmhHTBvKkvGQOkRyDyF3dgfWWWCd9R10EJFk3c0gFwm9oYAQ+gxZfgxfzsRQOucOrbQ29ZrUJsWeToMN8YdA7kx3Hvk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103072; c=relaxed/simple;
	bh=dcEC/GTX1kDmqVMIR0uNJ1uSBIP/qBmL7/6lXx+ZZRg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPLCHAmGinOmUARwXim3WdNKvPP5tr3z/PTfwKV6wnv+SJq/yMbvsYNnwaULcYVh4R5u/GvWIuVHp2Hi8YIaAl9ydjCNFkCs4ahVYLJn9O82FVOopSDgEk4LqkiXxeLMn/7J5cPfjKSXNjqwIQDdBQu/izFTVjORgwRmX8Tvm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3NNuCqt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5381F00A3A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103070;
	bh=dcEC/GTX1kDmqVMIR0uNJ1uSBIP/qBmL7/6lXx+ZZRg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=b3NNuCqtZ//OpWtB2dQOKPc6AaHIM3DJ58uDWNDzWeHjwakAUAe8r73g6RCF3au5A
	 EMcFU4OM5feN3cwU3INwnn8UYJEn52RyysWw0tfcekBQ+eXauJtApu/g3Zk68aTIpu
	 gOuiGmKPU2/nnU8+NFLZr4GTPCo5ggsKzmYWKu+kk5uWHmCU+umb949JCayhtRulF6
	 acXo4CmQ6U2lc6krHru/xBDnzs6pYs95EKrgP21bTLIgtnR2tBXM2zW/QpPQhwqqdD
	 KlSA+oN5jhLGLo97NQ4FnqRijLlhiBlGnStx3KhvW23XY020wSn89DykKtVtQk3aGL
	 5M/rzBEirNlBg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so16855791fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpvk7lDBSN8YcPZITJ5hrHSNSH4ju6gkqG5Q/LYQlrhxTWaMPndc4I+54rFSu6mUNe6thcggZz3KQvw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt65Kgsao3wjwUwXez1CMXCFymMu9vMnRJmaNK6CuN0ElmNVpV
	Yavb3wqAGlQa6U80loP37qtJ0kygoB+fJ7KYsAkxBPtb1hSqhpXalnPuQiqtLAGs+9I+nu4EUIT
	2sOezAwuJcahU+yxG4mwXbWyWexAsnMByqUk9KCObKQ==
X-Received: by 2002:a2e:bcc3:0:b0:39d:560a:f87 with SMTP id
 38308e7fff4ca-39d560a1e42mr34665371fa.36.1784103069394; Wed, 15 Jul 2026
 01:11:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:11:06 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:11:06 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alX2Q3OcJHVmamWM@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alV0wIgZAY_InGYV@google.com> <alX2Q3OcJHVmamWM@ashevche-desk.local>
Date: Wed, 15 Jul 2026 08:11:06 +0000
X-Gmail-Original-Message-ID: <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
X-Gm-Features: AUfX_mzoq-s2qBaoeMdBslqUGfhRro10EO237r3xD58-J6HGUhge7vKwEP4zKm0
Message-ID: <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40099-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C827A75BC03

On Tue, 14 Jul 2026 10:41:39 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
>> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
>
> GPIO_LOOKUP_SINGLE()
>

I fixed it when applying.

>> followed by an empty sentinel entry. The sentinel entry has a trailing
>> comma which is unnecessary. Remove it.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>

I queued it but I do consider it a bit of a needless churn TBH.

Bart

