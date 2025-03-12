Return-Path: <linux-gpio+bounces-17478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E568A5D8E4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974843B63DC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4003238D42;
	Wed, 12 Mar 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/uewMVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172123817C;
	Wed, 12 Mar 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741770664; cv=none; b=XGxJR0GGdKfxeJHK3M8V2iCjo4f6nGD9Vqrgg7AFVB2QtTBIF5w52jlwLGhJr8K+5t4mP3lLFjw84zjxATE6gHSdStvZ36XDwXILex/u2t+i5YtSIsuCPDUawWZIu5Tsrl64kbc6XRPAbW588K+B5mYoaKfyErcqphvg1w76RR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741770664; c=relaxed/simple;
	bh=jcdwIAyvAsmWrwkRu3VhDyBuLuvqCLIye4/7IL+KybU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpoY8u2RmUdkbQBWEcRh9fwx2AFz7NnRLXZknllpYjNhu19hQGhBbN7BZtIkEYDicVh+zemwt8feNxmRp8UmVbLnZQTYG1rEkgQhyHi2ohns0hvX1aglQ72BeD2SPRcJZetHQJZoVKwGuTAVpHRv0qwDfEFTO6aVcpxRbTEExB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/uewMVb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so1165719a91.1;
        Wed, 12 Mar 2025 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741770662; x=1742375462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Yuao92vyYyvOuLAqEseLZXchmmycIEL43Sipjav3b4=;
        b=d/uewMVbVE1yrUn8hp2Vl4Ez05ZIiAtIxBk2AElfr6YRnPSrEHt3DWHcQKaJ35IM2b
         I3d2Z86fadjUeDwS7qoJUIXBh26ZdzhoCxS+39f4w8YfM9/86UnSLW70WsWMn4L43edb
         yk4v+/pxOpEeFxAN9fXhJnW2aZJYGv2iZ/0+rNws585zGScdT+1b4r9c1NjVyj4Wolam
         vzL090ZWGCKJi1CTw1cIUr08HxOc9NoIIXaRBJca6eQUrjVov2lVeh3O9ZosbcGa3Iof
         qIyQ3K8udvrzVH6yJoqqVrZP9sBl2zd2EU520KslNepcgPQfvCt+WUY798k2YgrofO6M
         AarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741770662; x=1742375462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yuao92vyYyvOuLAqEseLZXchmmycIEL43Sipjav3b4=;
        b=HtFo3wnYr7edIK7ut8jPiKQUm8CBJpS8zVmY0Buv+aOGU9dftEHsJi0URLR0j68s9R
         9WtEOm9sKax8bTtr7+fAgDRS0DvvwFk363fFmtTrJ3b0RPA5z2xzCi1vhSUtsFZaP1bu
         jlaKVWhWOnzbDFUImZ6GYu5JMa6LnGMGw3gA3eG03StngZeB4HxhGEshaw2z5hd3gh0Z
         RFC9kP/v8xtiIYkCUXaG/XCRsyb51+AwVLf+js0K8KvmiK5Incji8H8P074MebuW1LBF
         fa/pcVddz2g71e2Bn77btPgcjqS2gxky186qEO5lMMZ098idLw4kxi69gemlD2XjU29G
         9Fbw==
X-Forwarded-Encrypted: i=1; AJvYcCVGF5WWmSGsWtoYfNXoJYxZg7NNe8uTqc4rqJ2qMusd4/Za3ii2KZ+mOgJXRThZSUsaWALe32ik9OLQvoj0@vger.kernel.org, AJvYcCWk2adIKdPFvIOapSx7HvrnP4ROoLeRgjcX4EaAPt34Ym8hbDVUMv9OgjuHP9q971gvb380WBIIARmw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gS6Acho0AfLauT9Iy/23sQHNjYfz16di16PqKqbErs8LqvT/
	terJGA1o6rT5GQzYdJSJr/NNhJqadozwfjx+eyrb2g/Et+2iArulw3JRB0nU
X-Gm-Gg: ASbGncuaelcaQ59Lgw+hcprw96L6Ag1evBRYXotXLaJBeM+5wuRzLSrC111OzgGR8Ja
	zgytLkN2cCHjXatoaJQe2Tqmh3dyqQNU+klNcHr8/tH7hSd9G6xHGRfsFddKCdXqO8Gq++AuXSZ
	bzSFqSoC/cKGKXCdKFsZxhXD8fXq4haecQniKZ9Me8cM2ldPZzRmmEeuvpbIC7uDocT8woGcvrv
	dzdPYqQDQdejQAZ2puzJe3r8S8WaoPXFthpd//qF2E7EqjsK5DFmlkqHbDLTA3vK+HmHLDf3vqn
	S4LZklE931KIhT0+fxK8MIAs+0cBQ3z5TVwmPudRD6DiqAzj8Gv6VsnBSdP586wMoRlS
X-Google-Smtp-Source: AGHT+IHWR6KjniqbGh3j+F5evq6UogMThr03XqfiesOahPU47kY8wRhnRpcbU6savc8Uv5mfpcNnrQ==
X-Received: by 2002:a17:90b:2e42:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-301005013f7mr9365479a91.1.1741770662242;
        Wed, 12 Mar 2025 02:11:02 -0700 (PDT)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd51bsm111356825ad.49.2025.03.12.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:11:01 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:10:56 +0800
From: Kent Gibson <warthog618@gmail.com>
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250312091056.GA105343@rigel>
References: <20250311110034.53959031@erd003.prtnl>
 <CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
 <20250311120346.21ba086d@erd003.prtnl>
 <20250312013256.GB27058@rigel>
 <20250312090829.5de823b7@erd003.prtnl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312090829.5de823b7@erd003.prtnl>

On Wed, Mar 12, 2025 at 09:08:29AM +0100, David Jander wrote:
> On Wed, 12 Mar 2025 09:32:56 +0800
> Kent Gibson <warthog618@gmail.com> wrote:
>
> > On Tue, Mar 11, 2025 at 12:03:46PM +0100, David Jander wrote:
> > >
> > > Indeed, it does. My application is written in python and uses the python gpiod
> > > module. Even in such an environment the impact is killing.
> >
> > Interesting - the only reason I could think of for an application
> > requesting/releasing GPIOs at a high rate was it if was built on top of
> > the libgpiod tools and so was unable to hold the request fd.
>

Btw, I'm not suggesting that anyone build an app on top of the libgpiod
tools - I was just hunting for an explanation as to why anyone might be
opening and closing chips or requests at a high rate.

> I didn't want to bother the list with the details, but this is during the
> configuration phase of the application.

The fact that close() was slow is valid but it left me wondering why you
were needing to do that so frequently.
It helps to understand what you are doing and why to see if there are
other better solutions - or it there should be.

> It receives many configuration messages
> for different IO objects at a fast pace. Most of those objects use one or more
> GPIO lines identified by their label. So the application calls
> gpiod.find_line(label) on each of them. Apparently libgiod (version 1.6.3 in
> our case) isn't very efficient, since it will open and close each of the
> gpiodev devices in order to query for each of the gpio lines. I wouldn't blame
> libgpiod (python bindings) for doing it that way, since open()/close() of a
> chardev are expected to be fast, and caching this information is probably
> error prone anyway, since AFAIK user space cannot yet be informed of changes
> to gpio chips from kernel space.
>

Ok, if the issue is purely the name -> (chip,offset) mapping it is pretty
safe to assume that line names are immutable - though not unique, so
caching the mapping should be fine.

The kernel can already tell userspace about a number of changes.
What changes are you concerned about - adding/removing chips?

> If this had been this slow always (even before 6.13), I would probably have
> done things a bit differently and cached the config requests to then "find"
> the lines in batches directly working on the character devices instead of
> using gpiod, so I could open/close each one just once for finding many
> different lines each time.
>

The libgpiod v2 tools do just that - they scan the chips once rather
than once per line.  But that functionality is not exposed in the
libgpiod v2 API as the C interface is hideous and it is difficult to
provide well defined behaviour (e.g. in what order are the chips scanned?).
So it is left to the application to determine how they want to do it.
There isn't even a find_line() equivalent in v2, IIRC.

> > Generally an application should request the lines it requires once and hold
> > them for the duration.  Similarly functions such as find_line() should be
> > performed once per line.
>
> Of course it does that ;-)
> This board has a large amount of GPIO lines, and like I said, it is during the
> initial configuration phase of the application that I am seeing this problem.
>

Good to hear - from your earlier description I was concerned that
you might be doing it continuously.

Cheers,
Kent.


