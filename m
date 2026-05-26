Return-Path: <linux-gpio+bounces-37505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HWleKqNlFWqQUwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:19:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1339D5D3288
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FBB93012CC6
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156163C9ED0;
	Tue, 26 May 2026 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlDXXenB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6A305694
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787167; cv=none; b=gZhKS7l4yTnLvYkHm9ipWQH51j7lLO9vsaJ+VLK/TqUuc7uY4eK+s+JA11D/67c9wr8JMAD6JFFl9mTPbse+GmIIYiJIn3AjPWuWy2MujTl2GQWx3Z2L+U6QAI3gX4cewkDIzbHmPNkynDlZBpBnhJ/9XvecnCAdtRZCdofeThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787167; c=relaxed/simple;
	bh=oviD7lteyN/gFf79gUn8I/HMmUljfbH6Qyuu10Ki0Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw8kg7Le09xCMpempWSY8I5UYV6yL93iDrMn0JnpB3SBi1/wRmVzd6T9azkAgmJMztSLn19ynsd9rIIaxvcm7KlzOEBptKGkMEGp3yOsGvy2q9S1kHmoziCljVsSW+v4KvMw8D0ra+S8FLPFXyfCJZGKapdT1xLycVDbW53CwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlDXXenB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3591F00ADB
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787166;
	bh=ni6jIrunOswHt88fgTZ+iXmbe77CAGPwZXG2zBni7TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UlDXXenBU7GpRC+gmRvP8UAHDa2LZ3ukmNusNV6Co16dqTczj0UU1xMIFWzDXWkeu
	 AVmtYxZwhVUuT+6geI835mSkvt4Air4LQzKNiWzCgQH5MKTKxMdTCeLHhFc6SP0rnF
	 Og70aj8sk8auYbyFauZFCcQttJXDWFcmRTjcgCQMRVAirZH7vmgyE7YBO7RVkz0QYk
	 lg0SANdjcoFV/Jg+p4zX7iS/Oy+oaCPQ06TRGxbkbKKdspb5sArZYyecLM/yxs94z4
	 /qJPZR5Ui8wd/wf+2L80uAPbnIOSDN6e1n/KLn6IKYUJpVqgxUj0BR7x9yig7244Th
	 1Ln2NNrpvaQcg==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1363e78746eso5505594c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/g8HZajnvc83HLbCTy9NqiBtq1Mf2S0r4Eht3f0AkXU1znbBleyWQdlXc/VD3sYk99L1fskXMjRAk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ykP6HnbYHFR20yX2GR9RmDJ+FrlIE2tNX2CL88UdJNYcJYro
	AXvhpHufGSSl2iLOv3sL8SOKL5B5IePQXRfevZlCiytSoTWrXINrNJk0kwX8ExZzszDZNP5i+C0
	ZrPiaHFhMcKplFxNaMuSDcxgBLIz/4/WWyhRy1b7kQQ==
X-Received: by 2002:a05:7022:41aa:b0:12c:2cf8:2f30 with SMTP id
 a92af1059eb24-1365f811393mr6015928c88.15.1779787165853; Tue, 26 May 2026
 02:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
 <20260522-gpiolib-kunit-v3-3-b15fe6987430@oss.qualcomm.com> <d580b8fe-2f22-48c2-86ae-5037ef13a9db@davidgow.net>
In-Reply-To: <d580b8fe-2f22-48c2-86ae-5037ef13a9db@davidgow.net>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:19:09 +0200
X-Gmail-Original-Message-ID: <CAMRc=McLAgTMOXWOXq4_6qR9tBpH6Z_7L3-Tw6K2T5rtM5cmVQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ksh-aU6HD72aBn-k6WmimdFPyfHwPzKE-pc-LGmMlvFtjEwrjPejcQ1nU
Message-ID: <CAMRc=McLAgTMOXWOXq4_6qR9tBpH6Z_7L3-Tw6K2T5rtM5cmVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: add kunit test cases for the GPIO subsystem
To: David Gow <david@davidgow.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37505-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,kernel.org,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1339D5D3288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:07=E2=80=AFAM David Gow <david@davidgow.net> wro=
te:
>
> Le 22/05/2026 =C3=A0 9:42 PM, Bartosz Golaszewski a =C3=A9crit :
> > Add a module containing kunit test cases for GPIO core. The idea is to
> > use it to test functionalities that can't easily be tested from
> > user-space with kernel selftests or GPIO character device test suites
> > provided by the libgpiod package.
> >
> > For now add test cases that verify software node based lookup and ensur=
e
> > that a GPIO provider unbinding with active consumers does not cause a
> > crash.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> This is a nice looking test, thanks.
>
> Reviewed-by: David Gow <david@davidgow.net>
>
> Happy for this (and the previous two patches) to go in via gpio, but if
> you'd rather them go in via the KUnit tree, let me know.
>

I'll take it through the GPIO tree, thanks.

> Cheers,
> -- David
>
> >  drivers/gpio/Kconfig         |   8 +
> >  drivers/gpio/Makefile        |   1 +
> >  drivers/gpio/gpiolib-kunit.c | 358 +++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 367 insertions(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 00fcab5d09a4294ed778cea78af5867a0f6e481b..0306005fb7d65ae85905e96=
7b9065fd74db753db 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -102,6 +102,14 @@ config GPIO_CDEV_V1
> >         This ABI version is deprecated.
> >         Please use the latest ABI for new developments.
> >
> > +config GPIO_KUNIT
> > +     tristate "Build GPIO Kunit test cases"
> > +     depends on KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       Say Y here to build the module containing Kunit test cases veri=
fying
> > +       the functionality of the GPIO subsystem.
> > +
>
>
> FYI: If you want to add CONFIG_GPIOLIB=3Dy to
> tools/testing/kunit/configs/all_tests.config, we can enable these tests
> when the --alltests flag is passed to kunit.py.
>

Sure, I'll send a separate patch for this.

Bart

