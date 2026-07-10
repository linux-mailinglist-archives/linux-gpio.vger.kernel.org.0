Return-Path: <linux-gpio+bounces-39848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c+9dMNZAUWpABQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:58:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158E73D790
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="foTFO/sI";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39848-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39848-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C64B8302BEB9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626E33803D6;
	Fri, 10 Jul 2026 18:56:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3333937AA8A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:56:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709799; cv=none; b=SxWjC7Bkyhj0HLo+jTS3MLoD12uXsJZ12ovnzHabopzi31P7iXjC8Nte2rRtHpUlOkFOzhka3mtoLyECFsQJoXkPD5rroaFfYdaNZkO/43KXneNkhSxh5+9LKWxb+lPyaSlRfdEO3fykN4RnaV0g6ANSvyyN1eeEYsDY17ML7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709799; c=relaxed/simple;
	bh=QokqL5MmRjZF9oWfU22pMfvVc1JbodjJtVyze8q1m6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJDcvM4upTMp9gHuAiasub1KG+/atVaLUF5X8KPNYP6hGrhH8ir0TSVJmeZZn7h/L90/UFx4eRieR70OwT0EOqwZ+kxB74ACGRHYAAVlgG66n99WfqXpQ+DPVNooC7KImDtrA+388k9S5OuodaT94VPEAIOAMIwpP2Th1ulWW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foTFO/sI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4081F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709797;
	bh=QokqL5MmRjZF9oWfU22pMfvVc1JbodjJtVyze8q1m6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=foTFO/sIBtl3ikaP70gWtNjBCMGev50Q4DQIqEq/5487pGnaCFOPaJP1uIMd4x6oq
	 6kO8wELu0FREHKuiM/8V5/8I4v+95ZDCHokDsbI+33ngTPfPml0Xs7Z0kOBWlxb8C8
	 mF/vohHztSavht5btwEDH309OszkVISki5VCEGFkOjArsGVx+aWeAMkhoP03KNu2ZM
	 eA7GSV7DqP7jFJN/T6WKgau6vDqNHtDIldDpE3JzB141VTVai7pu/JZL1u2kEu97pK
	 dr0/oB8NDeqw1nbvhsXWvQL0uxL//fVoOF62a21ZbrbRDT8/hXtlHlmPyBJyDNNyPE
	 IMvId6yj5JVmg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b22d0e488so12599991fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 11:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrV/gX0E1WQsW+e66AWCLo3iSweb7FAqUog75TiznncZcKQ0MqTKH2LyBL4acavLLioRAuygYi/4+hQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqzRMDyW3eR1WroCfYIJDGzEAgwHO1IxiS6jhxj6eMDqYSgNc
	mCry2XlYhrmwXKnezooWCHnN/1XlNqHUY6ZbhbsayG2rtuErOcDb+cyTZHp2qreWAEBFyUUy7dL
	S2el9ScHcNXRR1p237WL9Fi5vlSWCaTg=
X-Received: by 2002:a05:6512:2509:b0:5b0:1b78:495d with SMTP id
 2adb3069b0e04-5b023668f89mr80186e87.24.1783709796580; Fri, 10 Jul 2026
 11:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-rp1-str-hi-lo-v1-1-1b452a5a8780@gmail.com>
In-Reply-To: <20260705-rp1-str-hi-lo-v1-1-1b452a5a8780@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:56:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=WKUSuGsrzxh7LJfONqeJaUi9z1u3gw6WtODmJBSUZNw@mail.gmail.com>
X-Gm-Features: AUfX_mxhzr4vXSlabxirsrNeF7Uz40YrA9fmy9g8a1PcCIBwkXbEAI922n-x-k4
Message-ID: <CAD++jL=WKUSuGsrzxh7LJfONqeJaUi9z1u3gw6WtODmJBSUZNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-rp1: Make use of str_hi_lo helper
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39848-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alex.t.tran@gmail.com,m:andrea.porta@suse.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alexttran@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1158E73D790

On Sun, Jul 5, 2026 at 6:01=E2=80=AFPM Alex Tran <alex.t.tran@gmail.com> wr=
ote:

> Use the str_hi_lo helper API to print value
> of a pin for debugging instead of using
> ternary operator.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>

Patch applied.

Yours,
Linus Walleij

