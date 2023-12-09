Return-Path: <linux-gpio+bounces-1146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3480B19A
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 02:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD0B1F2134A
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 01:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B91D80F;
	Sat,  9 Dec 2023 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mowe4geT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667E0E7
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 17:56:51 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d05e4a94c3so23959085ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 17:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702087011; x=1702691811; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mp63wmpJLLZ/mMGo/WIN7n+iFRJapgVl/qcMGfHlZFk=;
        b=Mowe4geTH8D+V5DqHh2yAtm3P6B/ttUYK8pkKJfGyQNd5XyQw7t80Wu4yaOYMA/UqZ
         88o3Y01Go4yI34YgyK1W/Jf3vBx35J6PkQgFyZx9ABkH0iUuzBemZXb/XznpYjISR14H
         W/x1geEwRZdOBblm2BlaY6K2fNvSbuMDxtWVsge2EPnhEWRwwGXFBSEDmgJG+fGWLFVN
         qX5l//1RMMEs95opvsnniuQzyBUs/l2jP1jd98aaJN7hi15l4lbAGw/nqIW1+jISP5Sy
         0LkUariFNY2o4ntZNszZF4WhXLTEAd7g2zN5jJF/Px8rfYkAqV2X21JlvHgZ8n+95VqC
         +LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702087011; x=1702691811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp63wmpJLLZ/mMGo/WIN7n+iFRJapgVl/qcMGfHlZFk=;
        b=e30Nj5aTTzbXGz9SjZLO/7M0o0GwvxiZ9l5V8PifVeiLhCMzfHZ67JbetIEKbRIe37
         EOSbUqvMsgyYKdymB31ffS5zBGgxTm1pLwfblZ8pz95bW9CSPaiRuANTOA9TBzJqQClK
         10OPTdcGdwM/wn7BLjHrtZuzpaKV0zoKOm+lWMB+fJltHjGs7pFBVT4sjWFUY9ayJYoM
         oOBILhYOuoV2YbVrf8hPHGqBoAeLSR9njPQvwk/bwk2qXs3B5jz8oEjdbasmAsAeY+ws
         EerJ0cDGDspBbXudGRHbmHUAyiumnbUmySPFk9K2fLxt6FIxkMhReY6TwJcClG5Ro6rm
         eZvw==
X-Gm-Message-State: AOJu0YxbRqnZ0ISGoP5KIKq5HC+MUVe8BTCzKcupG/kaP5/M6FW5hDaK
	CvZq1ySEU7xaH21CxzlPpMI=
X-Google-Smtp-Source: AGHT+IE8T98M5Nfr4zZ86YL/Aj5/zBRtHAotVK9AGLF82nLGaFlJpT/FqvcJvhZWbdbqleQxW4hlAg==
X-Received: by 2002:a17:902:6bc4:b0:1d0:6ffe:a22 with SMTP id m4-20020a1709026bc400b001d06ffe0a22mr1012251plt.128.1702087010751;
        Fri, 08 Dec 2023 17:56:50 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902b94900b001d071d58e85sm2360626pls.98.2023.12.08.17.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 17:56:50 -0800 (PST)
Date: Sat, 9 Dec 2023 09:56:45 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXPJXTm3pzBKFX08@rigel>
References: <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel>
 <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
 <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel>
 <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>

On Fri, Dec 08, 2023 at 07:54:40PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 8, 2023 at 11:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 10:52:09AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Dec 8, 2023 at 9:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Dec 8, 2023 at 2:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > > > > > > On Tue, Nov 28, 2023 at 11:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > >
> > > > > > >
> > > > > > > [snip]
> > > > >
> > > >
> > > > Yeah, no need to risk other GPIO users messing with it if it is only there
> > > > for cdev.
> > > > Want me to take a look at it or are you happy to take care of it?
> > > >
> > >
> > > If you'll find the time to do it in the following days then sure, go
> > > ahead, otherwise, I'll have some pare cycles today and next week to
> > > spend on it.
> > >
> >
> > It would probably take me longer than that to context switch, so go for
> > it.
> >
>
> Well I went for it and it turns out to be quite tricky. We have
> linereq and gpio_chardev_data that have independent lifetimes and the
> only resource they share is the gpio_device and - by extension - gpio
> descriptors . If we want to store some additional data locally within
> the context of gpiolib-cdev.c then I see the following options:
>

Well that probably explains why putting it in the desc made so much
sense at the time.

Lets take a look at the code...

I had thought it could be moved to struct line (contained within
struct linereq), so basically replacing line->desc->debounce_period_us
with line->debounce_period_us.  That almost works, but the problem there
is that gpio_desc_to_lineinfo() returns the debounce period in the line
info - and there is no way to access the linereq/line from the desc...

Ah, so the lineinfo_get/_v1() functions that call
gpio_desc_to_lineinfo() also have the gpio_chardev_data to work with -
now I see where you are coming from.
(Debounce is not relevant for v1, so that reduces the problem to
lineinfo_get().)

> 1. Global radix_tree containing additional configuration
> (debounce_period_us for now) looked up by the descriptor's address.
> Lookup can be done locklessly using RCU and from atomic context
> (interrupt handlers in cdev code).
>

The irq handlers are already protected from changes to debounce period.
It is either set before the irqs are enabled (in the request), or the
irq is disabled, debounce updated, and irq re-enabled (in set_config).

> 2. Reference counted wrapper around descriptors. It would look something like:
>
> struct gpio_cdev_desc {
>     struct kref ref;
>     struct gpio_desc *desc;
>     unsigned int debounce_period_us;
> };
>
> And then struct gpio_chardev_data would store an array of pointers to
> this wrapper while struct line would store a pointer to it instead of
> directly referencing struct gpio_desc.
>
> Any other ideas?
>

I still think the primary location for any additional line config is in
struct line - that makes it clear and simple for the majority of cdev and
matches the lifetimes of the accessors (other than lineinfo_get()).

The only issue being how to access that info from lineinfo_get().
I guess we can't stop reporting the debounce in the line info :-(.

Rather than worry about an linkage between gpio_chardev_data and the
linereq/line, I would consider a separate copy of this supplemental line
info for the chardev, possibly using a radix_tree as you suggest.
That would be updated by the linereq to match its value in struct line.
So basically Option 1 but for a shadow copy of the additional info.

I'm not a fan of globals, so would go per chip and indexed by line
offset rather than desc. But then, given the lifetime issues at play, that
would have to be in a reference counted object that both gpio_chardev_data
and linereq would reference.  So swings and roundabouts.

Does that make sense? Anyway, that's my $/50.

Cheers,
Kent.


