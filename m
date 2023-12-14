Return-Path: <linux-gpio+bounces-1478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BCA81340F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783CC1F221D6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD3E5C070;
	Thu, 14 Dec 2023 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf96+4Hj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4F712A;
	Thu, 14 Dec 2023 07:08:11 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ceb27ec331so5356076b3a.1;
        Thu, 14 Dec 2023 07:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702566491; x=1703171291; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Vk5vGqMfI0jrxtf/OidVbCY3Nu25fYb1sjU0YfaOb4=;
        b=Pf96+4HjHSmofVr1XYlUVkA5vFGavVdSzTJN9Ccy17ycswGT3bkEG/i4h4kOAkOUGg
         h4kFmMyrQHiKOVi9u0UCj5yked+BeUXcdMeKXAt/DEX0PN6zBiReteKaYPBGjO+M8Zst
         8vEcxPG0UKsppspf49estqbo6G/v0ETIY/qhn9/UwddonlU3DMQdiXLUtQG8SrIUa+Bq
         1jb5xNEIiS0UMb+Tr+7dv1w9RVoK2C0svnc/p8SnxKGJ+ftoE5eh64n4PToxdN6rA+th
         pKOfRVakU1/qBeFVUo0+awJlPYl7OzlIzd9FVe++c4vO1dod3oONyKCOl+ECFiTl4Tku
         gZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566491; x=1703171291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Vk5vGqMfI0jrxtf/OidVbCY3Nu25fYb1sjU0YfaOb4=;
        b=sba5nNwLqusMMHCJ5fmRV6C5rpBcn6MsgXhcQilKEpfPoxYM2uiFsT8XEqAIiXTDRP
         SqIOOlwB/SUFn6vrwMmGn6eRuZLgmsgZpCr8BKCefbGtUy4+YAI/eS++NpTD/SWtckU+
         G3Tb5kk7gT7CyUKkCVYj3bXsNU6e+fpH7zJM49ih/LA4yM+2uMmjKSs8LMwjA0XcJUd8
         2d9skS4yMP3wz703MczLUl83H6Ip5Zcr+FEJdnKkXCaB1+AHFNIJKnvrMbHUlOWYduB9
         1G4m7HZ5yc/2kWr6jTM4pl5uqaFrc4IYMe7B1DUdxuqv1V30xcgF2UlNTVFaa2s225t6
         FD5g==
X-Gm-Message-State: AOJu0YwU4chdEL/jA1Hg3z3Nr7qvjdIvvA9GqAem/IEbtdYrzpKJT9rO
	ENOgy8AM2pfVT5/t/bUtaEE=
X-Google-Smtp-Source: AGHT+IFcad40d+eKko2pITmDPqtGE+aRifb8ZZ9Ogo/7g+a9X7FduxuChJw6GnsoUqp9+h/NGy6QFA==
X-Received: by 2002:a05:6a00:2286:b0:6ce:4288:f749 with SMTP id f6-20020a056a00228600b006ce4288f749mr6708017pfe.14.1702566489680;
        Thu, 14 Dec 2023 07:08:09 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id y19-20020a056a00191300b006ce75111ce7sm11808980pfi.162.2023.12.14.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:08:09 -0800 (PST)
Date: Thu, 14 Dec 2023 23:08:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, andy@kernel.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsaVSskFOXcSLZG@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
 <CAMRc=MeoeOgZaz6xT+ScVjOemVovrEHvQDBvqsN1pD9U3haE_A@mail.gmail.com>
 <ZXsU_UN6g0Fdj4qx@rigel>
 <CAMRc=Mf4FpzLqQZ5phRZLbTsGCfdYaELZHnLM13vnWnkAkLXkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf4FpzLqQZ5phRZLbTsGCfdYaELZHnLM13vnWnkAkLXkQ@mail.gmail.com>

On Thu, Dec 14, 2023 at 03:56:37PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 14, 2023 at 3:45 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Dec 14, 2023 at 03:29:28PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Dec 14, 2023 at 10:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > >
> > > > +/*
> > > > + * Used to populate gpio_v2_line_info with cdev specific fields not contained
> > > > + * in the struct gpio_desc.
> > > > + * A line is determined to contain supplemental information by
> > > > + * line_is_supplemental().
> > > > + */
> > > > +static struct {
> > > > +       /* a rbtree of the struct lines containing the supplemental info */
> > > > +       struct rb_root tree;
> > > > +       /* covers tree */
> > > > +       spinlock_t lock;
> > >
> > > Looks like this is never taken from atomic context? Can this be a mutex instead?
> > >
> >
> > Correct, only from thread context.
> >
> > Can be a mutex, but it only covers tree lookups which should be quick
> > as the tree is kept minimal, and I wouldn't expect it to ever get to the
> > mutex slowpath, so a spinlock seemed more appropriate.
> >
>
> Fair enough.
>
> Bart
>

While I think of it, what tree should I be basing on?
These patches are based on v6.7-rc5, and I'm not aware of any other
changes they may contend with, but best to be on the right tree to be
sure.

Cheers,
Kent.


