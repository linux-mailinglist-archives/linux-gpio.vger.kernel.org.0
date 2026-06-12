Return-Path: <linux-gpio+bounces-38389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pVo4FwiHLGptSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:24:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A136067CBDF
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="f2g4+/ZZ";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38389-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38389-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AFE83132054
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F1C3D25AF;
	Fri, 12 Jun 2026 22:24:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0A368D5C
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:24:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303041; cv=none; b=e4y4UbVnnBs7qP5gZGJrYYVc0rJX+7FkAggkzQag6y3vru2aw7k2XiOhZTsaRtzAAq0eqgvhzcYDsf6boys/7SzLQS1VbpHUC7YKvv/RjJEBKINlLttXwy7l+v7QpQUQzEDaQ2+Z/6Jsvee6IgbfVodArHg1PWd3lrjik3BmaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303041; c=relaxed/simple;
	bh=bXP3sa7rifXth+VPZwtIhI8rPqb0L2XD4ZVqATgc4Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u27STOZIgdCIJJMPaHtdcwgNTKQ6sTXBQ1Aq881HC8mHujUCKOCZGDkYIXsFWvYbr1Ff7AEoOBGWJnuCAu0pPVwCkDOhMaeWcKeLvwGJF4Artv1vEYkJ7oM8JK9QM8VROK3Ff9J5n0aNsJ8weZpXl5lDYMl/cD4HjxK3HuW1IbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2g4+/ZZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DEE1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781303040;
	bh=bXP3sa7rifXth+VPZwtIhI8rPqb0L2XD4ZVqATgc4Oc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2g4+/ZZIyU2wVo5oofIMr6SLQUPSoE7peY/KPlBLLjTmAWzZAi9eFfPdghrX/fkX
	 qrPnl8Bkrlw9DlQi0mzs8idzF2a9tGvDHDwHVf3NPoscjwBOHcSSfsZLCWyNXJTlid
	 eoVctntfqITt30e6+cbBNyzJ6kBA90sGD2S3jRM49bEieJF2j2w2hIv81QER599Abl
	 g7uPEJ/mFVObpDsXhM+l7RETXAW6Z4LVw0rK2QU0qtyfgBuRArXFlhhE7IcYPHBAKw
	 pt80GYSH24ujqF53Ap+BDJcoH6LOMWAcSh5XUifc/za4VjJCD1b+VofcpgvVNLmrtf
	 5DHKzIghRHSSg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-399389dae01so27271fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zKg7GyrfJuiFJcM8Jz9JGulZtG0bDXnETvYSSlKRQ7HDT6QRTGNn/sEHfGKo4Kxk8ud0dc1wBmeMP@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZQBWcLC0YQE6pOHny2htl9HkhjYVqTKA8Q8c2f4q4Yty/xUv
	8lXC+ttye3SdJ+FqcOIK4ZqdHd/WyWWqAOdsx+awE9DI1yRSfZhlQPRxvR/v4zX1TiFRCRpnqwF
	hdQB5rB4s+OMwbO0fVxbk8aH7/1Fst2A=
X-Received: by 2002:a05:6512:104c:b0:5ad:3035:9e59 with SMTP id
 2adb3069b0e04-5ad30dd8e8fmr295424e87.50.1781303039652; Fri, 12 Jun 2026
 15:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612215216.1887485-1-robh@kernel.org>
In-Reply-To: <20260612215216.1887485-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 00:23:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
X-Gm-Features: AVVi8CfiQrMKbi5s5aF5f3ZvdRjPtAwhHHk1Y3Lrz2g0YWsrIN4iMr3RSS7ME2k
Message-ID: <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pisosr: Read "ngpios" as u32
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38389-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A136067CBDF

On Fri, Jun 12, 2026 at 11:52=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The generic "ngpios" property is encoded as a normal uint32 cell. The
> pisosr driver stores it in the gpio_chip field, but reading it with a
> u16 helper does not match the DT property encoding.
>
> Read "ngpios" as u32 and keep the existing assignment to the chip
> field.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij

