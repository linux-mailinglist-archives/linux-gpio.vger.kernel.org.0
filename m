Return-Path: <linux-gpio+bounces-1927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D638203A7
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E213B216BC
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 05:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A37138E;
	Sat, 30 Dec 2023 05:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0O+oLLY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635F23A0
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3eb299e2eso34640135ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 21:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703912609; x=1704517409; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NagPf35G/HQyasuOnk2c7ihYW/f/n1JTkO5p0KyhTNo=;
        b=g0O+oLLYVSPzo2CRbEbx8lk14Y2nJZU9NEFONVDYBk7C1iXk/E5Pz0f8MKNwc0RnA7
         uILzCfu5kGcaGd3n+YY6BdE1TiewmsRJriWEGIZOuiDRyd4nhEJj8wRr6nxNJKC+s8BL
         zclwoXKJ1ag4ez39HZGYEmreZu9NOzoilLlIZwbqGxZmtyV8gH43yEI0Q37zozObboF5
         lhBEkGouuTGKC4RhG5O/o+jAArCva2tfdD7Fa5gOiIfzeJqOj1Ru7ImH+UNpN+zEiIok
         VhhuOp7oaPYd1kMZUMlRHLXcyq11+zfDFsB4ZjXgrMHgpja/gGP1oTpr1+QSnzn1VCsy
         wj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703912609; x=1704517409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NagPf35G/HQyasuOnk2c7ihYW/f/n1JTkO5p0KyhTNo=;
        b=w3Z1b6zuv/u8Pe4O/AOakJ4twVWA6XlddLDwKVr7bl3KPjoYaxqSPvn1N1UxaooXay
         5fTZz2CalrVDWfV6zBqBQ2pkPMMlFbfQlf4yJvB2lj/r48E5jjD6e8qyTex/ZJNlUNLM
         /bKkAlvSjBSqOgqYSsDjaHdbcFS5f4R27P0WhkkWFgV3XtmGrtI7mvG8AGoBjphhlZBI
         FUWppeNoV9LF7WmI5h47ZyggocAVFEjbtgzAjXLupm9QAurc3N5Hg40tKuzlPy7NKU92
         tVap7mIXGuGFszVX3ZRnbgDL4ichx/d97d9h4KqqNtDAXshGO2RCeQZYiMqb5Fg0bAh2
         2LlA==
X-Gm-Message-State: AOJu0YxtxpDftiib5UuQfcUf7qiGaGdmJ04eNzJyo/3ICMz5hlwgqPlY
	d9s3scLjfCL2Qytvt2hwG5RSWYzKB4U=
X-Google-Smtp-Source: AGHT+IFqL/A6LDgrcJi4hdoUBJfXNZV3urp6HaOjk9lu23VdOsioF4CKTNG8lUYVxeqc3yRTZlcTaQ==
X-Received: by 2002:a17:903:2b0d:b0:1d4:3314:d3ec with SMTP id mc13-20020a1709032b0d00b001d43314d3ecmr6674839plb.46.1703912609199;
        Fri, 29 Dec 2023 21:03:29 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902dad100b001d3f42edb4dsm16428029plx.294.2023.12.29.21.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 21:03:28 -0800 (PST)
Date: Sat, 30 Dec 2023 13:03:25 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230050325.GA40096@rigel>
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel>
 <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel>
 <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>

On Fri, Dec 29, 2023 at 10:43:16PM -0600, Seamus de Mora wrote:
> On Fri, Dec 29, 2023 at 8:21 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > That option ('--enable-gpioset-interactive') seems to have gotten the
> > > job done. I had to back out of 'libgpiod-2.1/tools' to
> > > '~/libgpiod-2.1', and let './autogen.sh' take care of the '#define'...
> > > instead of me trying to add it manually to 'gpioset.c' via '#define
> > > GPIOSET_INTERACTIVE'.  I do have **all** the packages you listed below
> > > installed, so why my manual addition didn't work is still a mystery to
> > > me - but not one worth fretting over.
> >
> > If you want to change build options then you need to re-run autogen.sh to
> > regenerate the Makefiles.
> >
> > The option is mentioned in both TOOLS section of the README (but I note
> > has a typo that needs to be fixed) adjacent to the interactive example,
> > and the configure help, which is itself mentioned in the README:
> >
> > $ ./configure --help
> >
>
> >   --enable-gpioset-interactive
> >                           enable gpioset interactive mode [default=no]
>
> >
> > That is not enabled by default as some platforms lack, or want to avoid
> > including, libedit.
> >
> > > Thanks for your help!   :)
> >
> > And thank you for the SE un-upvote and downvote!
>
> Since you brought that up again: I did do an "un-upvote" - but not a
> downvote (don't even know if that's possible).

It is, and happened at exactly the same time as your un-upvote.
Weird that.

> And I think you know
> the reason I did: your haughty replies to my attempts at
> communication.

None of which had anything to with the quality of that answer, yet you
negged it anyway.  That is called spite.

> I really like to try to get along with everyone, but I
> will admit I do not suffer arrogance well.

As I have a very low tolerance for BS.

> After reviewing things, I
> will say that I may have "crossed a line" with my use of the term
> "can't be bothered"... I've used this term for much of my life, but
> never realized it implied laziness until I looked it up yesterday.

In what universe does "can't be bothered" imply anything BUT laziness
or complete indifference?
AIUI you are from the UK so you know that damn well.

> And
> so for that - I apologize. If you'd like to now "bury the hatchet",
> I'm good with that. If not - that's OK too.
>

Burying the hatchet sounds like a splendid idea, but actions count more
than words.

Cheers,
Kent.


