Return-Path: <linux-gpio+bounces-1476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4F8133B4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C1B6B2187E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A680D5B5AC;
	Thu, 14 Dec 2023 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DA0GCRET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67DF120
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 06:56:49 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4647403bd3bso1745536137.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702565809; x=1703170609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXGU7uxzdx9Ei/zDB1+ErYmoyAxKtQT/JcBiEtryWB8=;
        b=DA0GCRETHjh2t2x//pla5xlpAu9Lv9r0HluBKMCO+7yymArkZpzaB4j7DSOyPDcTdS
         9npQei5l2AS2LaKEYA5PtD0mO13gp97/yeafxQesOFFPOyNldhXbcL0ykINYEx6mF7u/
         kdiUNaOhpvtgOwqRyZHXDGD3z3PXnGGJAtsy/E+HCrxso5LCrDMaGNcxnaJTH0zQdZDp
         j1oMxlr7YG6pnKeM6TZUDdShV6XeWoEukfIqYVUSba26G7QRWEqMYXmJ6gaDHYTQE/jP
         JQPW5m16FEKBPEuJX40+bqq6rdZnBy8LYFmGqiOVuwo3BHTlQPc0quZMuv7TJNc5xeHC
         P43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702565809; x=1703170609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXGU7uxzdx9Ei/zDB1+ErYmoyAxKtQT/JcBiEtryWB8=;
        b=jSUJHuaXFcg1YbAuWdmIM4k4XemXiCh/1J28hwXI3TI2en4vgg0YQoN4COTbYzZsLh
         pBOoPmDuZki3op4z5/6E+9C0HGmWoh1C9CCrj86kp0LV8c8oHnDXib2SRD1EjuKKVb+g
         5ro8mJytFsekYcfxa9b9avEvaX0M1xV1TfXPyHvxtum2gy4ZO7EIdcmIEdXyFYmXfybg
         7P1PKC+2ZRlIvlljSu/t0WS0tFYefMFKfm4mqysom6iy2D57kuDP5wg/M23uXUwwQwA3
         Si2X6B2ZvNf81c+IlGog7mTwOZWUZW1zuNJt4KvP6Y7KdJ+XWJMxSGah0QJSPeI4cWvm
         DUgQ==
X-Gm-Message-State: AOJu0Yx2to40eDuyAO8A4g8x6jbbLXFlVNnAntmhaSIRRW1a3pniFMQ9
	TH3zhL03BWvzudXTRSUFxqDSaJqh8E1EIJCRv/UqQg==
X-Google-Smtp-Source: AGHT+IH1GjCeuBbUcjcikeV55wKgIXAGMADfNzBmmP8sp3xw7kytWZVne7yKdaKjhD1PQ0BGrq4ns+SIyq3frhSJ8xA=
X-Received: by 2002:a05:6102:dcd:b0:464:93fd:f4a4 with SMTP id
 e13-20020a0561020dcd00b0046493fdf4a4mr7694324vst.25.1702565808851; Thu, 14
 Dec 2023 06:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214095814.132400-1-warthog618@gmail.com> <20231214095814.132400-3-warthog618@gmail.com>
 <CAMRc=MeoeOgZaz6xT+ScVjOemVovrEHvQDBvqsN1pD9U3haE_A@mail.gmail.com> <ZXsU_UN6g0Fdj4qx@rigel>
In-Reply-To: <ZXsU_UN6g0Fdj4qx@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 15:56:37 +0100
Message-ID: <CAMRc=Mf4FpzLqQZ5phRZLbTsGCfdYaELZHnLM13vnWnkAkLXkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 3:45=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 14, 2023 at 03:29:28PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 14, 2023 at 10:58=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > >
> > > +/*
> > > + * Used to populate gpio_v2_line_info with cdev specific fields not =
contained
> > > + * in the struct gpio_desc.
> > > + * A line is determined to contain supplemental information by
> > > + * line_is_supplemental().
> > > + */
> > > +static struct {
> > > +       /* a rbtree of the struct lines containing the supplemental i=
nfo */
> > > +       struct rb_root tree;
> > > +       /* covers tree */
> > > +       spinlock_t lock;
> >
> > Looks like this is never taken from atomic context? Can this be a mutex=
 instead?
> >
>
> Correct, only from thread context.
>
> Can be a mutex, but it only covers tree lookups which should be quick
> as the tree is kept minimal, and I wouldn't expect it to ever get to the
> mutex slowpath, so a spinlock seemed more appropriate.
>

Fair enough.

Bart

> Cheers,
> Kent.

