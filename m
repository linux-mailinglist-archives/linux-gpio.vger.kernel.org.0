Return-Path: <linux-gpio+bounces-35472-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EN+Knkz62lfJwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35472-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:10:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2AA45BEA3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE83A301919C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A9935F17D;
	Fri, 24 Apr 2026 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHQd4kih"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20F1B87C9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021662; cv=none; b=rGnW9D96jtxrr6C5QfGXCmRQ7D+dxK860q3jZMGow7U80ct77jG7aMOWZBLJpOMrsy7N18lQIuncWX7U/C8EWqzuVmIu3D9SKYUuiI1jwbhKAttuD/rEilBbckn5h+VaLpPY4Luti3J0Tqt4xcu/X8W5L1z9OYX0wy2ry5dQ/lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021662; c=relaxed/simple;
	bh=jW59RVPOjY/12yrl5MTF9SavbiFEuMf28BeizEMFp64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnMxqkqbKmMABtxj/U6nyfgkUD05QR/k0N7R2wYm6Gp+iEpst1kh5OZ3SWq6RSEsYETOakAwSBkwfafnip4NED05//3ItBoJgPJFKZxHcRu7ewan9vdqBnApfKw/ibt2SGUI/EQwqJGrYZgij2mG9AYEJWfjeX8kKbexcQ6NVpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHQd4kih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C7BC2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777021661;
	bh=jW59RVPOjY/12yrl5MTF9SavbiFEuMf28BeizEMFp64=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FHQd4kiheypVdWqgcjFiNmuaEhy+jbh72dvirC4ctERL+emEbNf4etyPV0/ZTkhDJ
	 4G0m9FU8RTh1ksUPs/M4fgv3ae6TWTYg7hn1ENK1AlRybNxgmw5EOxara0xS4r/T3k
	 E2StJSs0cPeH0B9aZp/PxXkp0LI+gR2qS+2oX0Go8ixPKUewkIYGH3AEqkHCQaquFa
	 uwOAXKbIEx+cThJjvBOa5djGCjtQ9hGanSf+/i/DdgnS0rx15pNGOEqdn4hW6+pgDe
	 FkZB7eT7IvgPWXMcSIvZ6JsU7LYxtl6rS/dewbYgPZEjKZFWQg9Naz6/AVW+faz8R+
	 QYEJYogWENNAw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso6644462e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 02:07:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YyTb6Cm8ecA7JKhcGSHtS5wWeTUN8ADyKI1dcmrlgdLIB/u6FbZ
	vRupqdqqasFwYrC5ia2uXnzNisfiOP/hI3GE6yUXe6SRHmo4DjsdJTgkHwjixSbW6DblLEXSb5f
	fS/OLVeoz+EGZT6BM9BRJp8ypVdZR55hIHvUqJBBC7Q==
X-Received: by 2002:a05:6512:3dab:b0:5a3:d2ef:2f9f with SMTP id
 2adb3069b0e04-5a4172da1ddmr10502265e87.20.1777021660300; Fri, 24 Apr 2026
 02:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423222125.29097-1-vfazio@gmail.com> <20260423222125.29097-8-vfazio@gmail.com>
 <CAMRc=MdrisR4_Wmd+1S3JGHMPkiZTvC1ucNpGq_j5N1pD0xdHQ@mail.gmail.com> <CAMRc=McTrz+-peiqCovR9xo3keNGYfh4AHuE-LhxJ93E8scZZQ@mail.gmail.com>
In-Reply-To: <CAMRc=McTrz+-peiqCovR9xo3keNGYfh4AHuE-LhxJ93E8scZZQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 11:07:27 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdsL8rYt2MDjznFGNF7FPDNfzcoaYB+UAjUgwOm=SJVWQ@mail.gmail.com>
X-Gm-Features: AQROBzAF1JjgjrVk3yyrs0KrzxqyAkExkn5qEapPq-NLJadzEOsw-PPLvdVWWiI
Message-ID: <CAMRc=MdsL8rYt2MDjznFGNF7FPDNfzcoaYB+UAjUgwOm=SJVWQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 7/8] bindings: python: tests: migrate the
 system module to multi-phase init
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4D2AA45BEA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35472-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[python.org:url,mail.gmail.com:mid]

On Fri, Apr 24, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, Apr 24, 2026 at 11:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >
> > On Fri, Apr 24, 2026 at 12:21=E2=80=AFAM Vincent Fazio <vfazio@gmail.co=
m> wrote:
> > >
> > > Single-phase initialization has been classified as legacy within CPyt=
hon
> > > documentation [0] with multi-phase being its successor [1].
> > >
> > > As such, switch to the new methodology.
> > >
> > > [0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-si=
ngle-phase-initialization
> > > [1]: https://docs.python.org/3/c-api/extension-modules.html#multi-pha=
se-initialization
> > >
> > > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > > ---
> > >  bindings/python/tests/system/ext.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tes=
ts/system/ext.c
> > > index c982fa6..800648e 100644
> > > --- a/bindings/python/tests/system/ext.c
> > > +++ b/bindings/python/tests/system/ext.c
> > > @@ -67,13 +67,18 @@ static PyMethodDef module_methods[] =3D {
> > >         { }
> > >  };
> > >
> > > +static struct PyModuleDef_Slot module_slots[] =3D {
> > > +       {0, NULL},
> > > +};
> >
> > Just an inconsistency I noticed while I was about to pick it up, why
> > do we have a NULL sentinel in the gpiod extension but not here?
> >
>
> Docs are pretty clear on this so let me change that when applying.
>
> https://docs.python.org/3/c-api/module.html#c.PyModuleDef.m_slots
>
> Bart

Sorry for the noise and yes, I am sleep deprived. My brain
misinterpreted the 0, NULL for an actual slot entry. Nevermind these
messages.

Bart

>
> > Bart
> >
> > > +
> > >  static PyModuleDef module_def =3D {
> > >         PyModuleDef_HEAD_INIT,
> > >         .m_name =3D "system._ext",
> > >         .m_methods =3D module_methods,
> > > +       .m_slots =3D module_slots,
> > >  };
> > >
> > >  PyMODINIT_FUNC PyInit__ext(void)
> > >  {
> > > -       return PyModule_Create(&module_def);
> > > +       return PyModuleDef_Init(&module_def);
> > >  }
> > > --
> > > 2.43.0
> > >

