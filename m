Return-Path: <linux-gpio+bounces-6330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB08C3EB0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 12:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36A97B2200A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61063149E03;
	Mon, 13 May 2024 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkKKvwb7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A701487EC
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715595218; cv=none; b=Cb1k7xHAQYbUNGqw15yWvPZzpHBXMD7PIBRm5MREqV+aye2lPB95sijhRkJUtAw4G/5ae8VqNyxpxZCmmDjVin/d/MAUP8oDvTgVTm7l2SLxQPuhMppTnZ7bHifc2D/mo8meOUaty4stbNHSTX4ZfOLaCN7oYZPzyLFYn8JiHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715595218; c=relaxed/simple;
	bh=/lXrZc9AacAYX+7jR4p5NQ5sxmNYClTpKwMUqqYkzbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kX84UecAkGtNgGxOq5xo4y1rwp+Fga0HxbKyKjKu2GPJVqTII78vxGcJ/aSWRy/knOQx3WGBlCcdSHiiRyoGB40AuaM5LHo/fARaeW4ND8pHPMY0FWrcH//xmTSkOaBn7UwdrkB8vaQycY+/HTlgFP3Vsp+vqFRdPgeYjVKrGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkKKvwb7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso31222345ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715595216; x=1716200016; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIS5kp3YO+H3ZxTlm+iBPz7zsrK0fXnoYhtaC+7Ls9I=;
        b=LkKKvwb76WhNs3vQVHTzN/PBuLbiif33PzX/7C6VRmuvpeRfUWOptRBSSTzJ9xXyqX
         Qn8p2L9VwAoAauAZY4nPvBBYqptJ+Ux4CR9bAtEneGfeCLgbRIigHQwN89/yGmB5v26I
         jbm6zBiLI4jExuYhsdK5pCIm/C8dV0PPmMBsfK5nluNOXZ51EhrQ3aE02KAJnWUuZbBc
         B/2dv2cJrowVHpTGRitvmHFVb04E9t87Ta+w9jpizICc1lWfFLTtrqd6z/YTJxVdFNq1
         bD01U0ZTodjZsbfOWe2c1vHCYlxi4wD+/wwOKpiF/L9HLsVMDXWxkfc3orPhiWB25XSw
         YseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715595216; x=1716200016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIS5kp3YO+H3ZxTlm+iBPz7zsrK0fXnoYhtaC+7Ls9I=;
        b=ivs8qOnGm+CfhJavTsXqbDJM8Qi17MkHDfvpZ4Y8/PcV0HyzVDgBmIaVCITit8KUda
         JGeneJM5ZBLIvMUloTFIWK9yKyjUOPd8tULN9Bfyd4bTDZFWc6W4AUIkFdO6Xgl/9g0P
         kRlkOKgoHEc4l13OiX8PBFU+F0yHCAJXb5I3uo1p5Scu6kg78HmJFQPJJh5EizFDRslh
         CWLTPTj5lHU2Z5kqWokwncg/GZMJpgfgpoQjQlWTm0OMjpvrsykUYG0bRealYYjM/Rh0
         cWTaHX0HPkR5vEJrj9DjJBrnY3gkYCdCv/PFGH8X7w+zT2Yw3vKyeqNERVphbZw/xk5W
         +8xw==
X-Gm-Message-State: AOJu0YwtGlptokk8IBca7xmgzPRBiB7ka1zG8Ipexrv1jOl2U1y2WqwY
	JsLyCmI5mkKJ/QIzFjzrjVcU638rRh8Zsd6/Qj1SqymxzLqGvrXy
X-Google-Smtp-Source: AGHT+IEGdHSaSOgSUvdxjHqkR+Z0MbANvax7uMRFn65/BTZaaC4ULVn7dltr7DQJEZraolHGqLcaSw==
X-Received: by 2002:a17:903:11c4:b0:1eb:73c2:6b4a with SMTP id d9443c01a7336-1ef43c0cb17mr118201575ad.8.1715595215846;
        Mon, 13 May 2024 03:13:35 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c264479sm75441055ad.292.2024.05.13.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 03:13:35 -0700 (PDT)
Date: Mon, 13 May 2024 18:13:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240513101331.GB89686@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>

On Mon, May 13, 2024 at 01:28:19AM -0700, Bartosz Golaszewski wrote:
> On Sat, 11 May 2024 03:11:44 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Fri, May 10, 2024 at 08:37:08PM +0200, Bartosz Golaszewski wrote:
> >> On Tue, May 7, 2024 at 4:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> >> >
> >
> > I understand - slippery slope and keeping minimal.
> > But I think we do need some solution for simple one line request cases that
> > can get users up and running with a smaller learning curve.
> > Then they can learn more if they want more.
> >
>
> I don't disagree on this point but I still think core libgpiod is not the right
> place for it.
>
> >> Do you think that users actually use it (core C libgpiod)?
> >
> > Yeah, they do, believe it or not.  I'm mainly talking the vocal Pi crowd,
> > many of whom are used to going bare metal to the hardware, and are now
> > searching for an alternative.  libgpiod as it stands is too complicated for
> > them - they just want to drive a pin up and down or read a button.
> > There are a few other alternatives that let them do that, and they will
> > switch on that basis alone, and never look back, though they will happily
> > spread their rather toxic opinions of libgpiod vs those alternatives.
> >
> >> I would think they stick to python and C++?
> >
> > They are actually less likely to go C++ - more learning curve.
> > And Python can be considered too heavyweight in situations with limited
> > resources.
> >
>
> I see. We're being held hostage by the RPi crowd. :)
>

You could look at it that way.

> > /**
> >  * @brief Set the bias of requested input line.
> >  * @param olr The request to reconfigure.
> >  * @param bias The new bias to apply to requested input line.
> >  * @return 0 on success, -1 on failure.
> >  */
> > int gpiod_olr_set_bias(struct gpiod_line_request * olr,
> > 		       enum gpiod_line_bias bias);
>
> For this to work, you'd most likely need a new struct wrapping the request
> and also storing the line config. Otherwise - how'd you keep the state of all
> the other line settings?
>

Yeah, I realised that when I went to implement it :(.

What I implemented was to read the line info and build the config from that.
So no impact on core.
Not the most efficient, but for this use case I wan't fussed.

> >
> > /**
> >  * @brief Set the debounce period of requested input line.
> >  * @param olr The request to reconfigure.
> >  * @param period The new debounce period to apply, in microseconds.
> >  * @return 0 on success, -1 on failure.
> >  */
> > int gpiod_olr_set_debounce_period_us(struct gpiod_line_request *olr,
> > 				     unsigned long period);
> >
> > /**
> >  * @brief Set the edge detection of requested input line.
> >  * @param olr The request to reconfigure.
> >  * @param edge The new edge detection setting.
> >  * @return 0 on success, -1 on failure.
> >  */
> > int gpiod_olr_set_edge_detection(struct gpiod_line_request * olr,
> > 				 enum gpiod_line_edge edge);
> >
> > /**
> >  * @}
> >  */
> >
> > I think those 5 functions cover the basics.  That is it.  Done. No more.
> > Unless you can think of something I've missed.
> >
>
> I'm afraid it never ends up being enough. We'd just open the door for all kinds
> of extensions to libgpiod. Very soon someone would want a callback-based API
> for reading edge events. Next you'll have people asking to be able to toggle
> the direction of a pin without touching the config structures which will require
> us to somehow store the context of the request. "That is it" never works.
>

At the end of the day you are the arbiter of where that line is drawn, so
that is up to you.

>
> In most cases bindings do allow you to do what you try to achieve here with
> one-liners already. I think this really only applies to C.
>

Oh, you would be surprised - the C++ "one-liners" are still considered
too verbose and difficult to understand.

> > Anyway, have a think about it.
> > And I'll go take a look at the GLib bindings.
> >
>
> I have thought about it. I agree we could use some simpler interfaces. I don't
> agree their place is in core libgpiod. I understand we want to make this new
> interface seamless to use for end-users of libgpiod.
>
> How about introducing a new header and a separate shared object: gpiod-ext.h
> and libgpiod-ext.so respectively? We could put all these new helpers in there,
> use the gpiod_ext_ prefix for all of them and distros could package the
> "extended" part of libgpiod together with the core library to avoid having to
> install multiple packages?
>

That sounds good to me.

> We'd keep the clear distinction between the low-level, core C library wrapping
> the kernel uAPI and the user-friendly C API. Though the user-friendly API in my
> book could be the GLib library but I understand not everyone wants to use GLib
> nor is familiar with GObject.
>

Sorry, still haven't had a chance to look at the GLib API.
But if it involves any additional overhead or learning curve then it
wont be well received.

Cheers,
Kent.

