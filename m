Return-Path: <linux-gpio+bounces-35471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN1GG7sy62lfJwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:07:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A9345BE01
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7B63002A01
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA069221FCD;
	Fri, 24 Apr 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQtrhYRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5693246FE
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021548; cv=none; b=L6nHMMxPYKpRZA+dS0Y9XxtqwTZcc7jf+zPBTU34tZXlCLCS/jxLevd+tLZJoK59634USwexS/GJwbnF0+BELMipPPOC9z2aRhtTr9+CDeFGnh0TMz2E2bictaErMBYwLPEVetaC42Ir5WaiYqqncP/Jf04al959ecoCSFh54p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021548; c=relaxed/simple;
	bh=Iq+cio896+7e1etOLjIcq/+70W1faxu636zas+Anh40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5QVHMvrI2ZOv41s5upG6lbpwQvkc6E1MOKFV2/zEXhy9sLgjarN6B/7Q/W60e+g+/vauhykwcwkwZACRJzikhjYPqruaKcOV1In6v9dYxI00MNfsNrBoUKSMLfw03id+Xcx03jdwh0HjUR9dGBkWdc7rcjm9mNFet3RLEmH2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQtrhYRf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658D5C2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777021548;
	bh=Iq+cio896+7e1etOLjIcq/+70W1faxu636zas+Anh40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IQtrhYRfbHGh11KX0aLiBXVCkyE3gwgiBLX81Y3Bfor2fzEQ2bxO99NVJg9p6fdDu
	 qauUaW12USfAK6BQuizrRjDAK1aK8qgZfX5z2dMU6q8GzX1kqf37Zp6zzEKKjmqFam
	 bUlTHH7P67jfzbHPZLqWsTFJGZ9sjOw9VPDbuU6WCTR2nVGkZt7gbBaRaxpru/fZBh
	 63p+ifdaAuExkbh60mT7l+W9obP+GX/rPVN7Z6JPmrBNFwqvO9sGudDYsqGfDPV0kh
	 Qrq/g2w3RJYNOlXvUOHiZKfGNOc6YP2qxkWl9A5HxO8deOpuH3b+JRqLmuL1GFeSqn
	 DQR5NNi2la8iQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e4989dacdso8342889e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 02:05:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwyDv75ihWv9juJ+R/mfY4iZSonwmIJcvyj2beYUdZt7K3/CwI+
	SIoHlq3c/0qyXDLF1tuGibziULceSV5EFU4F34Nbc+K4OtqswS/WOm4D3sFrM38jCQcxrQnQF8M
	iw4f1BaCQSThoJEzyg+BboLMv57lO+EwbT7h6EfEpGA==
X-Received: by 2002:a05:6512:12c6:b0:5a4:12a4:856f with SMTP id
 2adb3069b0e04-5a4172e7bb4mr8618497e87.30.1777021547080; Fri, 24 Apr 2026
 02:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423222125.29097-1-vfazio@gmail.com> <20260423222125.29097-8-vfazio@gmail.com>
 <CAMRc=MdrisR4_Wmd+1S3JGHMPkiZTvC1ucNpGq_j5N1pD0xdHQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdrisR4_Wmd+1S3JGHMPkiZTvC1ucNpGq_j5N1pD0xdHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 11:05:34 +0200
X-Gmail-Original-Message-ID: <CAMRc=McTrz+-peiqCovR9xo3keNGYfh4AHuE-LhxJ93E8scZZQ@mail.gmail.com>
X-Gm-Features: AQROBzCO9iJiXHOGjlMNgUAecZpWUVW1AVnicG6koSH6Ma_zCV2OzkvL3bQhKwE
Message-ID: <CAMRc=McTrz+-peiqCovR9xo3keNGYfh4AHuE-LhxJ93E8scZZQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 7/8] bindings: python: tests: migrate the
 system module to multi-phase init
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B9A9345BE01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35471-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,python.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 11:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, Apr 24, 2026 at 12:21=E2=80=AFAM Vincent Fazio <vfazio@gmail.com>=
 wrote:
> >
> > Single-phase initialization has been classified as legacy within CPytho=
n
> > documentation [0] with multi-phase being its successor [1].
> >
> > As such, switch to the new methodology.
> >
> > [0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-sing=
le-phase-initialization
> > [1]: https://docs.python.org/3/c-api/extension-modules.html#multi-phase=
-initialization
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > ---
> >  bindings/python/tests/system/ext.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests=
/system/ext.c
> > index c982fa6..800648e 100644
> > --- a/bindings/python/tests/system/ext.c
> > +++ b/bindings/python/tests/system/ext.c
> > @@ -67,13 +67,18 @@ static PyMethodDef module_methods[] =3D {
> >         { }
> >  };
> >
> > +static struct PyModuleDef_Slot module_slots[] =3D {
> > +       {0, NULL},
> > +};
>
> Just an inconsistency I noticed while I was about to pick it up, why
> do we have a NULL sentinel in the gpiod extension but not here?
>

Docs are pretty clear on this so let me change that when applying.

https://docs.python.org/3/c-api/module.html#c.PyModuleDef.m_slots

Bart

> Bart
>
> > +
> >  static PyModuleDef module_def =3D {
> >         PyModuleDef_HEAD_INIT,
> >         .m_name =3D "system._ext",
> >         .m_methods =3D module_methods,
> > +       .m_slots =3D module_slots,
> >  };
> >
> >  PyMODINIT_FUNC PyInit__ext(void)
> >  {
> > -       return PyModule_Create(&module_def);
> > +       return PyModuleDef_Init(&module_def);
> >  }
> > --
> > 2.43.0
> >

