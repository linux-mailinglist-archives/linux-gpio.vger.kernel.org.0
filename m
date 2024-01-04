Return-Path: <linux-gpio+bounces-2005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22E82397A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 01:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF3B1F25EE4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 00:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C4F37A;
	Thu,  4 Jan 2024 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN+TyRWm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139D36B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 00:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28ca8a37adeso4201690a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 16:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704327337; x=1704932137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yn3kgVUSfT2ZAEn2xfVGbqzukEaUDEpY4DQ4DXkfcFU=;
        b=NN+TyRWmWcKc/O3SEgFO31qEfT5KsAgDHSbLQSe4E+QjQ5J35HcnKensXzPx9UttuP
         Eld2lkBf91sqouK04qUPBveujSN9lkoyCduW8axIfbihO3o9K3JUG12b5dT0p9bynszc
         csMziTzSblsPX1lEpriKYKbdXM0BgEcGeuDnTU3X77YwieLSw9RwXadCpp9qt7FMg74d
         AkUW5rqydadndCzTNq+UBneKca7tqQ9nPWjK6Lbh5rSX9IfC3zVdlZJCLNnZT2yKoc1+
         7+Ew6sDk30v49TvZd/p/ezgnPVZIk0jMuVRfa0wPU/sVLRuRO1YTVq/HsQszk8EzQxqi
         swFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704327337; x=1704932137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn3kgVUSfT2ZAEn2xfVGbqzukEaUDEpY4DQ4DXkfcFU=;
        b=R6tlg9sN2Lj2badgRi3QLDD99FmUfCW8OJLkmlKJP5t3/2t0T47JEk85PU/cjqEju4
         PLWBTyf5+Qj3YMt1rXKj1gr8EdOz85l0f3MDrN8m6HDPkhx+XGozskUssdkiocfeXM1n
         CLLOpjsjxVc9+ydQcSmpkhPd8XegQxUdSlgWZYxkMuMfrR7tQxQa8296roPYkEdSB4RR
         ikZXn/2B+c/PyyS4jfCiwHfU9IlZlqTRmymJnbfldPRu4pwp5QNxZpZysrQ1i3O5LCiZ
         1rEChQwn4AjhKk7CsNk60o+ORKWBvVINk8iZwTCwvA12SPFRe6a8PGB2mz5TuuuHMyJb
         7ZXQ==
X-Gm-Message-State: AOJu0YyJck860p8O8AXxSfNonn5G385SZ+6zresOw2S1JgaiRocDmuOy
	B/KYJWZeENg0Uc/IEMTZpL/iDECql7c=
X-Google-Smtp-Source: AGHT+IE8F2Ij89ogj5MUKM5iWYSGJTiHrNPwVqk8MnyUw6aiLCyr661Jb7h6kzqQKiN5DjmIi6gNlw==
X-Received: by 2002:a17:90a:af81:b0:28b:542a:dc91 with SMTP id w1-20020a17090aaf8100b0028b542adc91mr10526860pjq.65.1704327336886;
        Wed, 03 Jan 2024 16:15:36 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm2536307pjg.55.2024.01.03.16.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 16:15:36 -0800 (PST)
Date: Thu, 4 Jan 2024 08:15:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
Message-ID: <20240104001532.GA5165@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
 <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
 <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
 <CAJ8C1XMsjLNdRFS8dDCua7=zha+LnuOcWCy-7W_uU5+LWgqpxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XMsjLNdRFS8dDCua7=zha+LnuOcWCy-7W_uU5+LWgqpxQ@mail.gmail.com>

On Wed, Jan 03, 2024 at 04:09:01PM -0600, Seamus de Mora wrote:
> On Wed, Jan 3, 2024 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Jan 3, 2024 at 6:53 PM Seamus de Mora <seamusdemora@gmail.com> wrote:
> > >
> > > On Wed, Jan 3, 2024 at 4:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > On Thu, Dec 28, 2023 at 2:20 AM Seamus de Mora <seamusdemora@gmail.com> wrote:
> > > > >
> > > >
>         [ snip ]
> > > >
> > > I thought this issue of line ownership had been resolved...  i.e. the
> > > system driver would take control of the line once the user's process
> > > had exited? Maybe I'm confused on this point, but I *thought* I had
> > > read that somewhere else?
> >
> > The driver is just a low-level interface between the core GPIO code
> > and the hardware. It does not typically take control of any GPIOs
> > (unless it calls gpiochip_request_own_desc() but that's an internal
> > detail).
> >
>
> OK - that *sounds* like a different story than the one your partner is
> telling... do you guys ever "talk"?
>

Formerly, once the user releases the line it becomes unowned.  That is
certainly true from the userspace perspective.  My interpretation is
that when a user releases the request the line ownership reverts to the
driver, cos in reality that is now in control of the line.

Sure we talk, but we can also have differing points of view.
You clearly have no problems talking, and I still take issue with
your tone.  Where is that damn hatchet?

> > >
> > > Nevertheless, to address your questions: No - I didn't mean to infer
> > > that there's only one user. I understand that you (library developer)
> > > need to account for different users. But GPIO control is not a unique
> > > issue in Linux (or any multi-user OS). It is the same if we were
> > > talking about control of a serial port/UART... how is that arbitrated
> > > between users?
> >
> > It's exactly the same. The first user to claim a serial port (be it an
> > in-kernel serdev or a user opening /dev/ttyX) takes exclusive usage
> > and keeps the port until it releases it.
> >
>
> OK - we agree on that much.
>
> > >
> > > WRT a GPIO line, I'd say "the user" is the one who issued the gpioset
> > > command. In the context of your example ("When gpioset acquires the
> > > GPIO for exclusive usage"), why could gpioset (or the user who issued
> > > the gpioset command) not 'make a claim for exclusive usage' of the
> > > GPIO line? If other users/processes subsequently attempted to claim
> > > the same line, their claim would simply be disallowed - unless they
> > > were `root`. Is there a reason why this model of ownership could not
> > > work?
> >
> > This is precisely what happens though (except for root being able to
> > override a regular user)? Or am I not understanding this paragraph?
> >
>
> I think you and I have a common understanding on this point. I only
> brought the root user in because the primary concern seems to be
> "ownership" of the line, and I thought 'root' could arbitrate that.
>

Even root cannot access a line held by gpioset, at least not via the
GPIO uAPI.  Root would have to kill the process holding the line first.

> > >
> > > No - not referring to sysfs... and I'm not sure I'm following your
> > > argument here. But the only point I'm trying to make is wrt
> > > 'persistence': First, I'll assume that you are saying that gpioset has
> > > a role to play in persistence, and that it does not delegate the
> > > persistence question to the driver. Under that assumption, I am
> > > suggesting that another model for persistence is as I outlined above.
> > > And I'll ask again, "Is there a reason that model could not work?"
> > >
> >
> > I'm sorry, I'm not sure what *that model* is. Gpioset has no role in
> > persistence because it's merely a wrapper around libgpiod which is a
> > wrapper around the kernel uAPI which - by design - offers no
> > persistence.
>
> Well - we're back to 'square one' it seems. There must be persistence
> in GPIO control. It gets back to my example with the bedroom light.
> Do you agree that persistence must exist in GPIO control?
>
> > FYI I understand the need for a user-space GPIO authority that's more
> > centralized and am working on a DBus daemon that will become exactly
> > that. However my cup runneth over so it'll be some time before it's
> > done. :(
> >
>
> So - does that mean that we're going to have to wait for version 3 (or
> 4?) of libgpiod to get something that provides persistence of GPIO
> control?
>

And there is that tone again...

No, AIUI this will be added to libgpiod or be a separate component.
No API changes involved and so no major version bump.

These things always take longer than you would like, and the gpioset
interactive mode is partly my attempt to provide an interrim solution
until the daemon is available.

> I apologize if this sounds "short", but if we cannot agree that
> persistence is fundamental to GPIO control, then I'm at a loss for
> words.
>

I would rather focus on providing a solution to your problem, whatever
that actually is, rather than arguing over whether the existing options
are sufficiently persistent, or what persistence even means in this
context.

The underlying issue is that the post-release behaviour is not clearly
defined across the GPIO driver interface. IIRC there has been some
discussion on signalling to the driver that it should not alter the line
post-release (on second thought maybe I'm thinking of the reading the
input/output buffer distinction), but if that were to go ahead it needs
to be done in a way that is backwardly compatible, all the way out to the
ABI, and involves updating ALL the drivers to suit.  All that is a
non-trivial task, i.e. you are looking at a butt ton of work.
It is therefore worthwhile to examine the alternatives.

So, what exactly is your problem and how does that that absolutely require
"persistence" to solve?

Cheers,
Kent.

