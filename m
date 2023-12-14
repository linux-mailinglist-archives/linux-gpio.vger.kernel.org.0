Return-Path: <linux-gpio+bounces-1436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9C8123C9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 01:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E08FB211BF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 00:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF85377;
	Thu, 14 Dec 2023 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKwKfsDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ED1C9;
	Wed, 13 Dec 2023 16:18:07 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35f71436397so9335895ab.3;
        Wed, 13 Dec 2023 16:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702513086; x=1703117886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBplHsQKCXk6W0ml/hFriO8Dxkh7jyAyK1nM1uz0Edw=;
        b=hKwKfsDZovSElzbZiRNVrJQlbgdjjvqT6817muiboOaALd/dcC0hxiSZTiDQ2zkm3x
         YdEVQG9FVDzavNlDUJfZhbF0Nn8cDRoOCy6zEhto1TqI6W6pjfiLbdsZyBnB8+xHYbbI
         XzAa3qu+11702Ox3Idqnvn7Ar/qXctPyoO2WtB2S5W968hYbnYXGx3eP4e2R5Ou8LvY2
         +L/5YALGiY6GU5kKfTMfT8mkHh5vuNmcjjNoBDJCwe2IVMmguj4Fzab8FYnuPpgBACGj
         Dc73sPv4LjWIbmeH+W3Ja/D8VPf5Gtz6VqC8JEBniUCl0ayEDc0+WfdGU+Yus0tGGi7J
         p9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702513086; x=1703117886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBplHsQKCXk6W0ml/hFriO8Dxkh7jyAyK1nM1uz0Edw=;
        b=BiDHG9//AlGh890YOxlLXsGeUcED+FNJE0CK9yXHw8ld/fhL1sTjQiREjc5HVIWXOr
         EbsWjCd5oDm8UNLu1BrspqoHsHwZrKIzmXe+wyrFJVp7mYWXoSDtPc//73/ZLz2PSz6W
         EdkRzAabdl9DjBTtLjvgRL66CgagcU608kvvQ2G4j32IdyeUkpDgdIWHE0Ax61yguHT+
         7Bgx0e8IxIqisZZiwlWOkhkzMOexTku2dGqrnLWtESBwGJeclSER0UD/VTzFEtE7ZVvJ
         S0PF4nS8nRgFxUY7R9WPIQO0eG4FSWWuVALBz/ZFwvlGhDTGgq4IdSMQA5pDf7/0vowQ
         q/Lw==
X-Gm-Message-State: AOJu0YxY7r/1tGaCyfiaHRhfT6eJVz0XWwBxr1lAnC6eKGpq/TgtmAAd
	GBHZrnaxoRXC1NdNOd68Zxc=
X-Google-Smtp-Source: AGHT+IFMzrScwsQpOQeMMsaRM3rfiiEcPr1gU3wq3Oe+XkLrXn2/Inbd/xxBkN0SHqHBPtdpb4+HYw==
X-Received: by 2002:a05:6e02:144:b0:35f:7200:cdbb with SMTP id j4-20020a056e02014400b0035f7200cdbbmr1864666ilr.83.1702513086548;
        Wed, 13 Dec 2023 16:18:06 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id bs9-20020a632809000000b0059b2316be86sm10465036pgb.46.2023.12.13.16.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:18:06 -0800 (PST)
Date: Thu, 14 Dec 2023 08:18:01 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXpJueTnmtUIecCd@rigel>
References: <20231212054253.50094-2-warthog618@gmail.com>
 <ZXm3rayrcvfO1t1Z@smile.fi.intel.com>
 <ZXm_WsIpgIyOUNHt@rigel>
 <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>
 <ZXnU3tMYCc2Rw8Qv@rigel>
 <ZXnX8jPHxRLW8lhi@smile.fi.intel.com>
 <CAMRc=Mfj_4YvQVP=UWkULBwJniDDjapttU+qSgqfN5ZWNgikKw@mail.gmail.com>
 <ZXnb-ks_noYLWZZ2@smile.fi.intel.com>
 <CAMRc=MfaHKKKNkXW0L1FPjCH4VvG22Vn9q8z9tupZCtCEKZU2g@mail.gmail.com>
 <ZXoO8B0N3S49GnvX@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXoO8B0N3S49GnvX@smile.fi.intel.com>

On Wed, Dec 13, 2023 at 10:07:12PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 13, 2023 at 08:03:44PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > > > > > > +static struct supinfo supinfo;
> > > > > > > > >
> > > > > > > > > Why supinfo should be a struct to begin with? Seems to me as an unneeded
> > > > > > > > > complication.
> > > > > > >
> > > > > > > I think we should keep it as a struct but defined the following way:
> > > > > > >
> > > > > > > struct {
> > > > > > >     spinlock_t lock;
> > > > > > >     struct rb_root tree;
> > > > > > > } supinfo;
> > > > > >
> > > > > > That is what I meant be merging the struct definition with the variable
> > > > > > definition.  Or is there some other way to completely do away with the
> > > > > > struct that I'm missing?
> > > > >
> > > > > Look at the top of gpiolib.c:
> > > > >
> > > > > static DEFINE_MUTEX(gpio_lookup_lock);
> > > > > static LIST_HEAD(gpio_lookup_list);
> > > > >
> > > > > In the similar way you can simply do
> > > > >
> > > > > static DEFINE_SPINLOCK(gpio_sup_lock);
> > > > > static struct rb_root gpio_sup_tree;
> > > >
> > > > The fact that this has been like this, doesn't mean it's the only
> > > > right way. IMO putting these into the same structure makes logical
> > > > sense.
> > >
> > > I disagree on the struct like this on the grounds:
> > > - it's global

I dislike having the global at all - and now you want two :-(.

> > > - it's one time use

Its not about how many times it is instanciated, it is about
maintainability.

> > > - it adds complications for no benefit

It provides a placeholder for collective documentation and clarifies
scope for the reader.
How is it more complicated?

> > > - it makes code uglier and longer
> > >

What, swapping an underscore for a period?

And you would hope the generated code is essentially the same.

> >
> > It boils down to supinfo.lock vs supinfo_lock. I do prefer the former
> > but it's a weak opinion, I won't die on that hill.
>
> Me neither, just showing rationale from my side.
>

I can't recall the last time I intentionally used separate globals over a
struct, so if there are no strong opinions otherwise I'll leave it as a
struct.

Cheers,
Kent.


