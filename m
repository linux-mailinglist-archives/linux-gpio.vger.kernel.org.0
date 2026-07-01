Return-Path: <linux-gpio+bounces-39281-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I++3C0nMRGpb1AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39281-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:14:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9766EAFED
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:14:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mPIiKMt0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39281-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39281-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 461D03015CB2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB8828688C;
	Wed,  1 Jul 2026 08:13:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EDD266581
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:13:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893634; cv=none; b=sjYsFFl6y2RzSE1DlggdFJvK0Gklm38yJ+YGp0mJX98H9DQCbMoQiTAERVNN3vAGH9tYBDOETfqV8Wj5qQwk+fPs9bxglPNX7Hf2d1nr2bor1cgxuZ+RJEbgL6p2s6GOohqhb4Z+c4qoVM0FyvGnXIeKeiaAUKzuy/wXoDrD9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893634; c=relaxed/simple;
	bh=fjCZdFCveQTTkO4Ttsuztq2MpSrFX5/twjfddssFiUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqGNGzB2nNBDYOngqVEZypwrXBW0iiIQrlrxJCEfoFKErWJ99mWQlkhf6n19cTpxYrGmn2E7+1vBmkkqGn9NAwN63J0HTsmbBF7FUWr8+JzTwK12kVwEEoUq4rjaXdyldTQwckrJR3VpLnSlLYlSBI7OTCj+05BxgGTXGhQKJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPIiKMt0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0744A1F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893631;
	bh=fjCZdFCveQTTkO4Ttsuztq2MpSrFX5/twjfddssFiUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mPIiKMt0KgvQW8M8PQ8E2RhTRO46N4xi+7ifMfOmPK+FOjYd93Q0TPqPJeu2go9NX
	 GPGqUrsQ+4B96Ez9R5R3cq+4kucvGG2Jo9lS/CzvlTZFeTZTC8ryK6WFSAe1WNBveK
	 Ma2pZgGVzjWVLUZ7pyuKwdMS4MpDH8vmF/VodxGnJ/bBjTf9gLcmQDZydg2ftryBbN
	 PeIjho5dGT4rTTJLpmy7OFhSzveWi59yagIdCSyMZtjpCm6wp4KpJrjp042oIjRRkq
	 TIWj1e13kvvt967gmbtl4bfiPe3oHBiuT075LajwqBmBE7Vt6pZN2tjp6QMYQMA5aF
	 0wYkzzdMZ8uQg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso253432e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpznMgPVbHtiyCMOG4Nb7UEhxVXgmyKI+rqMTC6WRvi119rJ68ZJYNrb8Kmz9963eKL2DgqtkHJmWyU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoko3dpsIzei4djXbOuIiKI8lqgb08s7THhafW8a4RaAZBj2T+
	qQ8p11Tt1ju3azYFGoFC6pjb5p9/FmbDG6X2gZKtFV0vM/y79vVEBFVP4iDqi2fLPTNBKcTOxEX
	VWcGSVGb3uNX0nefp1mAXYSnbs2+gGTs=
X-Received: by 2002:a05:6512:3d19:b0:5aa:671d:9960 with SMTP id
 2adb3069b0e04-5aec6797473mr151000e87.6.1782893629862; Wed, 01 Jul 2026
 01:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629060526.3638272-1-jgross@suse.com> <20260629060526.3638272-25-jgross@suse.com>
In-Reply-To: <20260629060526.3638272-25-jgross@suse.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 10:13:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>
X-Gm-Features: AVVi8CccVa_1F4RDbQXXMJraKayHgWNxS8q3tHXtAkDgD4gkSOSBN9CB4qpjx5c
Message-ID: <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>
Subject: Re: [PATCH 24/32] drivers/gpio: Stop using 32-bit MSR interfaces
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39281-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D9766EAFED

Hi J=C3=BCrgen,

On Mon, Jun 29, 2026 at 8:07=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:

> The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
> removed. Use the related 64-bit variants instead.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Is this something the subsystem maintainera are supposed to apply
directly on a per-subsystem basis? I was under that impression.

Yours,
Linus Walleij

