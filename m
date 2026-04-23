Return-Path: <linux-gpio+bounces-35395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIjRL17T6Wm9kgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:07:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457C44E562
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E3430CDC1B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 08:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8670A36309C;
	Thu, 23 Apr 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljsK6Ffc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF2363086
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931268; cv=none; b=fKZSXpV0fA37SY7pQ8QEwEvzrDggd6pOmuCEfnX+KPl4Tr7Oe0JkNC5gbD4fUq9XxHRmzkZrWIngm46fCCUtcimR8pax+nbCMEXc5l6x8xPdKEil5sxaqvmORMSrBoc+4QvNFGo2TUGhDxV1caDlGfLfWmnJcB+HyxTwzMpWOw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931268; c=relaxed/simple;
	bh=bcX+vEqVNyKG67aCCVEuyskSO8KekgYQaPDOVwj9CrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyK8BnD/ZPgSCNhYw5LtEK7Qfy6f4g8mM4DdRMQxLvYZDEY+9TAtkOfzG4JyHBeOYjW1PdyeSjPXGjiTCddrYiNPlk3CXvgVl+/tcYWibqti7RghDwNAfuA32aZUvtFpaM5j7+dFVUMpoaIB7SPJ2IiVwcbkG/7h4wrK3nn7/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljsK6Ffc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3242C2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931268;
	bh=bcX+vEqVNyKG67aCCVEuyskSO8KekgYQaPDOVwj9CrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ljsK6FfcDdlrdt+vLl/IeMtN7vvj4lATGpXHLhGC8cdTuZBAR4fg+WqiyUjExQM59
	 Fq+e5cdjzfRBxcb1zihTS+0ixdmgYrMq6PtTEpNUlVR7I/gdScdKGwjQlFysN88BoL
	 UAfKAU2fEFLZqKSzCnXOb7XcIM3oarAoDZyyo/DwUkG+5S9wqAklliLvWL3vnEtwS1
	 znt/oyHYQx9yNLC2MdYfkC39Hx3+qb6N5+Ix1KfnTR/xGZ1B7t4MpLUqbTDCnCo7Yi
	 JibNIoIBY8tnfkEIr5aaBP9yRFwCd+eQWwbertMYEFqVewqzGOmCZqEQOoLhlk5uBF
	 jBTIR4msP/c1g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4989dacdso7006410e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 01:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++78Lrb5cS9QV03OS6Ov3feHKb6nDymdMiX3ePyKk/A+g+ZrsBUN4k+NGVl9Fzcgpj2XvcFzI7VHiL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFmXMI8GizTkKvqeToFrzzap6ZvRLg0dfzPy3gRuw326Z027s
	kcLwMr6pSRh2EGyFyj1J7ljswilmtcXKa1PSewdyJ9MnEgbwxRB81uTX71MPEJi6AKyKNopkWSX
	Gs68z3CRLl3+BjtSDaUW5HN+gsGg+/S8WAsGzdYGBtQ==
X-Received: by 2002:a05:6512:3c8f:b0:5a3:ff6b:cb63 with SMTP id
 2adb3069b0e04-5a4172f6af6mr10356633e87.44.1776931266554; Thu, 23 Apr 2026
 01:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
In-Reply-To: <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 23 Apr 2026 10:00:54 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfeKOKjtVSRUont7D1ROvob9z-2smp7_fQ0kKB9TOc4GQ@mail.gmail.com>
X-Gm-Features: AQROBzCVTFyd0qANf50gir3VQEBpgtZjDBYCOHqQD2H9kFn7P071dtc8YyjMXoU
Message-ID: <CAMRc=MfeKOKjtVSRUont7D1ROvob9z-2smp7_fQ0kKB9TOc4GQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
To: Linus Walleij <linusw@kernel.org>
Cc: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, wbg@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35395-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3457C44E562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 6:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
>
> > This series is an RFC for adding port-mapped I/O (PMIO) support to
> > gpio-mmio.
> >
> > This v2 comes with all suggestions done by Linux Walleij in the
> > initial review [1].
>
> That name! ;)
>
> > For keeping compatibility with gpio_generic_chip, a new _config struct
> > was added instead of extending gpio_generic_chip_config. Using such new
> > _config struct, called gpio_generic_chip_port_config, requires a new AP=
I
> > function gpio_generic_chip_port_init() to access to that new structure.
> >
> > Besides, structure gpio_chip_reg has been transformed to union. It refl=
ects
> > better that MMIO and PMIO chips will only use one of them, saving memor=
y
> > as well.
> >
> > I'm still sending this as RFC but I don't know if I should send this as=
 a
> > regular PATCH series.
>
> I think we will usually only merge infrastructure if there is also a
> consumer/user of it going in at the same time so these patches will
> need to be prepended to a driver patch.
>

Agreed. If the driver in question is not targetting drivers/gpio/, I
can provide an immutable branch with these patches.

Bart

