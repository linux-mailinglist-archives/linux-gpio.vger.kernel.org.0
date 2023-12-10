Return-Path: <linux-gpio+bounces-1176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D080B86D
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 03:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9513E1C208CD
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 02:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6765C620;
	Sun, 10 Dec 2023 02:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hspYSK2Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CD4B7
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 18:34:53 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5c690c3d113so2775202a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 18:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702175693; x=1702780493; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJpA9wNXRzttvJ7+MGP9xafSW+yuX43TVx+Ans7LS4c=;
        b=hspYSK2YYCFhK+stLLOQeNaOCn39db2ScFmfhunvCBs1JDkf7ETKm4/OrjhzhReVsd
         lpvzbsc+Fl1NLosRU/kkPhezlKMnQLox+AXx3XGqJSWO+EFLG7NhcY0EOqwWF14kPW6a
         VAEE4ysJ/yX/rcUwRS/zBc4h4L5t18uhLESAP7iEes2fbo/ypX9TTH12nTGBep5g1EIg
         PgTWKzeKrrQtzLaIO2IraJpuoOzY2h5f08jYrpV226jYyp3JzOwOtPl3aaJO1n3sUj2S
         39p3zWiszdG8FKb5is+fiGTqk/ATg/e9rDRSCkqFqL/F/f+rXqFstmmvRxvVQR4xjNYK
         obFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702175693; x=1702780493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJpA9wNXRzttvJ7+MGP9xafSW+yuX43TVx+Ans7LS4c=;
        b=TIpXzHQp3Axj8+/qe72tKIwvZA5WjwsYFljyUmsOY80WpOWi6QYDGB+RvdNJJwVQ2V
         rL9jwo6qn5KB2pbeite0Gm0+wc4WHD/hfsRGik0pXgnLuDpPzqaRaC6x/D+iq1PE48zn
         4G+A1nRVVdLaLRf/8WfTiXPeFjRXSNMb+XMAg/c7wxZ1B6LsIMdnop4dvDkv15kCBm1n
         4T1SIaNYHb0RWZ4gbu4gJajEuOyifbfwyq4Bt3W1Pl1r/4ygim2PcT3D4TLCgNgmxhlr
         dgloAgWtprI0BL6Lnd7Jm90YQkm8sT8IYka1wP4pO/mADMAgfWRQz5vXHn3Pz05RG7f9
         Ye+w==
X-Gm-Message-State: AOJu0YyH+t5QrfvQro1K6ZfGr+Fg1ruj9+KNcbK5uFjY45Hz3IkxroY2
	cifAfYZXAng/tzCWdIRvy0Q1Ji5jD8I=
X-Google-Smtp-Source: AGHT+IFMph7/M9sFoR2LZ4q9xELNPvqU3NHjeDOPIXhUCOakaLyHm8bXoE30JzwTpXzYYPh8hHvmJA==
X-Received: by 2002:a17:90a:c252:b0:286:6cc0:cade with SMTP id d18-20020a17090ac25200b002866cc0cademr1733160pjx.85.1702175692463;
        Sat, 09 Dec 2023 18:34:52 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a08c400b00286da7407f2sm5663649pjn.7.2023.12.09.18.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 18:34:52 -0800 (PST)
Date: Sun, 10 Dec 2023 10:34:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXUjx5UTgC9tvkp9@rigel>
References: <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel>
 <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
 <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
 <ZXLvfBWTAGZt0f0L@rigel>
 <CAMRc=MdhcYToMixdFh6Kf+GZ_MhDeHxd5_2U00neLGoH2M_P9Q@mail.gmail.com>
 <ZXPJXTm3pzBKFX08@rigel>
 <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdDg8pcu=iTCUDjdpgYMuBubjeL5po8Fmhz6z3ri0fOZw@mail.gmail.com>

On Sat, Dec 09, 2023 at 08:24:59PM +0100, Bartosz Golaszewski wrote:
> On Sat, Dec 9, 2023 at 2:56 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 07:54:40PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Dec 8, 2023 at 11:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Dec 08, 2023 at 10:52:09AM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Dec 8, 2023 at 9:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> > > > > > > On Fri, Dec 8, 2023 at 2:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > On Tue, Nov 28, 2023 at 11:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > [snip]
> > > > > > >
> > > > > >
> > > > > > Yeah, no need to risk other GPIO users messing with it if it is only there
> > > > > > for cdev.
> > > > > > Want me to take a look at it or are you happy to take care of it?
> > > > > >
> > > > >
> > > > > If you'll find the time to do it in the following days then sure, go
> > > > > ahead, otherwise, I'll have some pare cycles today and next week to
> > > > > spend on it.
> > > > >
> > > >
> > > > It would probably take me longer than that to context switch, so go for
> > > > it.
> > > >
> > >
> > > Well I went for it and it turns out to be quite tricky. We have
> > > linereq and gpio_chardev_data that have independent lifetimes and the
> > > only resource they share is the gpio_device and - by extension - gpio
> > > descriptors . If we want to store some additional data locally within
> > > the context of gpiolib-cdev.c then I see the following options:
> > >
> >
> > Well that probably explains why putting it in the desc made so much
> > sense at the time.
> >
> > Lets take a look at the code...
> >
> > I had thought it could be moved to struct line (contained within
> > struct linereq), so basically replacing line->desc->debounce_period_us
> > with line->debounce_period_us.  That almost works, but the problem there
> > is that gpio_desc_to_lineinfo() returns the debounce period in the line
> > info - and there is no way to access the linereq/line from the desc...
> >
> > Ah, so the lineinfo_get/_v1() functions that call
> > gpio_desc_to_lineinfo() also have the gpio_chardev_data to work with -
> > now I see where you are coming from.
> > (Debounce is not relevant for v1, so that reduces the problem to
> > lineinfo_get().)
> >
> > > 1. Global radix_tree containing additional configuration
> > > (debounce_period_us for now) looked up by the descriptor's address.
> > > Lookup can be done locklessly using RCU and from atomic context
> > > (interrupt handlers in cdev code).
> > >
> >
> > The irq handlers are already protected from changes to debounce period.
> > It is either set before the irqs are enabled (in the request), or the
> > irq is disabled, debounce updated, and irq re-enabled (in set_config).
> >

Having had a closer look at the code and strictly speaking, one of the
corner cases (updating the period for sw debouncing) doesn't do the
disable/enable but lives with the possibility of the debouncer using a
stale value for one debounce period (as that is much simpler).

But the end result is the same - the debounce period doesn't require
additional locking.

> > > 2. Reference counted wrapper around descriptors. It would look something like:
> > >
> > > struct gpio_cdev_desc {
> > >     struct kref ref;
> > >     struct gpio_desc *desc;
> > >     unsigned int debounce_period_us;
> > > };
> > >
> > > And then struct gpio_chardev_data would store an array of pointers to
> > > this wrapper while struct line would store a pointer to it instead of
> > > directly referencing struct gpio_desc.
> > >
> > > Any other ideas?
> > >
> >
> > I still think the primary location for any additional line config is in
> > struct line - that makes it clear and simple for the majority of cdev and
> > matches the lifetimes of the accessors (other than lineinfo_get()).
> >
> > The only issue being how to access that info from lineinfo_get().
> > I guess we can't stop reporting the debounce in the line info :-(.
> >
> > Rather than worry about an linkage between gpio_chardev_data and the
> > linereq/line, I would consider a separate copy of this supplemental line
> > info for the chardev, possibly using a radix_tree as you suggest.
> > That would be updated by the linereq to match its value in struct line.
> > So basically Option 1 but for a shadow copy of the additional info.
> >
>
> We still need to connect linereq with its "parent" gpio_chardev_data
> somehow and make this link weak so that it can survive one or the
> other being destroyed. Maybe a notifier in linereq to which
> gpio_chardev_data would subscribe? It would send out notifications on
> changes to debounce_period which gpio_chardev_data could store. When
> linereq goes out of scope it sends a corresponding notification
> allowing gpio_chardev_data to unsubscribe before linereq is freed,
> while when gpio_chardev_data goes out of scope first, it unsubscribes
> when being released.
>

No, there has to be a link between both and the supplemental info.
For gpio_chardev_data that is to create lineinfo, and for the linereq it
is to keep the value reported in lineinfo mirroring the current value.
Below I suggested making the supplemental info a reference counted
object, with chip scope, referenced by both gpio_chardev_data and the
linereq. So last one out turns off the lights.

Having the shadow copy allows most usage to avoid the tree lookup and any
associated locking (assuming the tree isn't inherently thread safe and
requires a spinlock to prevent modification during a lookup).
It is only populating the lineinfo or updating the value that would
require the lookup, and neither are a hot path (if there is such a thing
in cdev).

Hmmm, the radix_tree allocates a page of entries at a time, which might
be a bit of overkill per-chip, so maybe a global is the way to go?
Or something other than a radix_tree, say a rbtree?

All this is getting rather complicated just to relocate one field, so I'm
starting to reconsider whether the desc was the right place for it after
all. ¯\_(ツ)_/¯

OTOH, I've partially coded my suggestion, to the point of skeletons for
the supplemental info, so if you like I'm happy to finish that off and
provide patches.  Though what remains is probably 90% of the work...

Cheers,
Kent.

> Bart
>
> > I'm not a fan of globals, so would go per chip and indexed by line
> > offset rather than desc. But then, given the lifetime issues at play, that
> > would have to be in a reference counted object that both gpio_chardev_data
> > and linereq would reference.  So swings and roundabouts.
> >
> > Does that make sense? Anyway, that's my $/50.
> >
> > Cheers,
> > Kent.
> >

