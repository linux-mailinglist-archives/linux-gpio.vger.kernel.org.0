Return-Path: <linux-gpio+bounces-1815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476B81CACD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 14:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF3651F23431
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 13:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1501199A4;
	Fri, 22 Dec 2023 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IsUy6xnn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E119465
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e957e6ff50so16963777b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703252275; x=1703857075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQffPd79rIlvwIW5ad4ad+UYT5D5mESBoYPE78zPUCU=;
        b=IsUy6xnn57TKMwHAtg7yNBePLwU6r3l7Z5W6UIS3YkU1Ts9SCiTnaXTNSNZSEFo1/K
         uwD8GP+xsHN2bh1N4Z9E+1OY+LUMQLwp3aEW6IbEwNKUVSwfmtj51yrRuUmt2mstWws+
         nH/lgIsC+k52/J9n6FpzRYg8PtYA1w9IJ9VxsYl0mJT933o4s7/di5A2JGgdPvrxMxaY
         hOoYj9vkH4+9HpLPe+grIvI5in0NyAOC+qKwEitmRWK2gM6/uUXZtdq1fn3amZU6CKhq
         7NzFy3gMNwAt/1T5pyzex+YPG1OI5/GmAE7Q+y+YKLUSQ0zPDt8vbk0JSK+nN+im/HTf
         AY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703252275; x=1703857075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQffPd79rIlvwIW5ad4ad+UYT5D5mESBoYPE78zPUCU=;
        b=VvCJ6nq4xHAWRaszaypfGJOi99nVU0draFczkFttO3abKEDxLVmmxtGOGf4H3sNVYZ
         BgmH7J0DrRUzV630PL7xRkSiCz/0vk4xA+yfMtpUSsgNxbAU3C69l7NZhyRW56HNNE+s
         +Jz8nVkn6XnMcJAUP7AzG37U8dy4Duf84dwYdhet4j3gGSI7Yo5qq9+ZC2gMM65LkMjE
         BkjfSa12qVgBtbRN2iuQ0ErrTmHbPVavqtLtklhiKa6DAFcJ0P7MPy5mfthA6b/eup90
         SKdtrWzO5rY+WXn9L3l00tElnJdVH2e4S2172E+7Jx0ojr4IzqEkxAjR51qU4t0ZdUtf
         +LWg==
X-Gm-Message-State: AOJu0YyPT8pgm15T2mBY2myG0Y6AxTUwH9cr6iTLqk1sZkQGLx7u69YP
	Ur7yQr2hsAAUsqWPZpOy02cvj8FRydnE2ii+ICFjpPdmVQ3A5g==
X-Google-Smtp-Source: AGHT+IGFXLl1lSh/FbF30crf66mEJXEWLi+xwQgqm6cWKzVK0RzBQrcTFHk9W0a7NLVr+rRG1kFRKUmO80eqUye6zjU=
X-Received: by 2002:a81:6d0f:0:b0:5e8:91f2:baa1 with SMTP id
 i15-20020a816d0f000000b005e891f2baa1mr1415927ywc.6.1703252274783; Fri, 22 Dec
 2023 05:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221175527.2814506-1-andriy.shevchenko@linux.intel.com>
 <ZYTihbWMcHMHSkC_@rigel> <ZYWDij-J1YruTIM7@smile.fi.intel.com> <ZYWHjq_7PnwO27ro@rigel>
In-Reply-To: <ZYWHjq_7PnwO27ro@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Dec 2023 14:37:43 +0100
Message-ID: <CAMRc=McPzQyR1J5Mhn7_cBrWEcqz2JKg7t8CpjHx6jgVEnYBvA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: Split line_get_debounce_period()
 and use
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 1:56=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Dec 22, 2023 at 02:39:38PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 22, 2023 at 09:12:37AM +0800, Kent Gibson wrote:
> > > On Thu, Dec 21, 2023 at 07:55:27PM +0200, Andy Shevchenko wrote:
> > > > Instead of repeating the same code and reduce possible miss
> > > > of READ_ONCE(), split line_get_debounce_period() heler out
> > > > and use in the existing cases.
> > > >
> > >
> > > helper
> > >
> > > Not a fan of this change.
> > >
> > > So using READ_ONCE() is repeating code??
> >
> > Yes. Because one may forget about it.
>
> Just as one may forget to use your wrapper.
> This argument is a NULL - so I'll just forget about it.
>
> >
> > > Doesn't providing a wrapper around READ_ONCE() just rename that repit=
ition?
> > > What of all the other uses of READ_ONCE() in cdev (and there are a lo=
t) -
> > > why pick on debounce_period?
> >
> > Because you have a setter, but getter. Inconsistency.
> >
>
> But then "for consistency" ALL the struct line fields require accessors
> and mutators.  That path is insanity.
>
> The setter is there as setting the value now has side effects - none of
> which are visible to the caller, hence the usage of the standard
> setter name.
> You are siggesting every function name describe everything the function
> does?
>
> And, in case you've forgotten, YOU REVIEWED THIS.
>
> > > The line_set_debounce_period() is necessary as the set is now a
> > > multi-step process as it can impact whether the line is contained
> > > in the supinfo_tree.  The get is just a get.
> > >
> > > And you could've included me in the Cc so I didn't just find it by
> > > accident.
> >
> > Maybe it's time to add you to the MAINTAINERS for this file as a design=
ated
> > reviewer?
> >
>
> You are patching my recent change that you yourself reviewed only days
> ago. I would think that you would Cc me whether I were a maintainer or
> not as I'm very likely to have relevant feedback.

On that note: do you see yourself as a full GPIO reviewer or do you
prefer I split out the uAPI part into a separate section in
MAINTAINERS and nominate you as its maintainer?

Bart

>
> Cheers,
> Kent.

