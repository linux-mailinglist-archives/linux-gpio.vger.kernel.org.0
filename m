Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684123B6214
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 16:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234616AbhF1Oll (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 10:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbhF1Ojy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Jun 2021 10:39:54 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C70C08EC66
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 07:25:12 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id y13so9020986plc.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jun 2021 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M7BIkUmB6/doxN2CJMIFuoGifWFcNTLpwzi9oufNJ/k=;
        b=f8EXhWsJnfR2DsjdlJr9gMTnedEY2jMIxhu595o08eOH+SFTMhDnDc7KJhm+NgdPUR
         f6hLb/96q5iOeoQAcJmhkUxIf15ml/t+9bVpHgyh8fSlGdgt/0g7O0CBvCUAb+uBaHR+
         /k6kDMYg5Xo2h1V3z1IcQVx214psY2vhrgPCJtI3k5VTnThScEqCxNto0CHIXsyArmFL
         M9xAz9zPavIEUF8YGpG6ZyMXblRdho498Ny9TbSHx+ImF+ZT4hi/7KhdQCWSex050zLK
         J5a/wpE/kUuPKPlB1cAJgDX5D3jLC3Zr6zsKnkoBEkv94rxyxlWgG5etmlK3284z0vGo
         NRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M7BIkUmB6/doxN2CJMIFuoGifWFcNTLpwzi9oufNJ/k=;
        b=rd9mDHWIlMPjBFOzmWyOtW57V/6MRJLR8s/G+q8DT9AtsTe4VE+wixB2/KUlciuEJp
         M9n81L3y7FctIftoSOmDDEsm7CRzD5D/1ldKi1Flu2QaQC9D6JNYzKPc3Kro4w8qUffs
         UvRNB4trmt5Jut0WfJ2Dx/32BrPenR8jfYEGASLjez73Y9oJdnJog3gzrjrZ3WdWTXjY
         /LVRsYXNgKzWz+e0AC2S+qXgGCUjWnkUJoupFr/RzN1NSao0yb+P2YhwKphQkUxiICDe
         vNJeeFP0x92i1yYQYLcI+0LVtCubXK4wY8ZwHccvMKR7IihYtRUQP4mTkJg2GkGnd9Is
         sxZQ==
X-Gm-Message-State: AOAM531EI2Z7kNzcaG3KxILMkVp3GjgCSWFMGIxaKRd14glyeD9Yo3ps
        3aAPncpyDYL4drf2babNjio=
X-Google-Smtp-Source: ABdhPJx7Qr953P82V7yV9ikAtdG/uxOuCV+yF+BvIGDdbmUOqA6xCc13rcoJPYheo70dAeGXAvEycw==
X-Received: by 2002:a17:902:ce91:b029:127:9386:932d with SMTP id f17-20020a170902ce91b02901279386932dmr23291715plg.5.1624890311542;
        Mon, 28 Jun 2021 07:25:11 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id l7sm14638933pgb.19.2021.06.28.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 07:25:10 -0700 (PDT)
Date:   Mon, 28 Jun 2021 22:25:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
Message-ID: <20210628142505.GA37053@sol>
References: <20210621191830.10628-1-brgl@bgdev.pl>
 <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol>
 <YNmyvYDZwNeYRyTU@smile.fi.intel.com>
 <20210628113413.GA20057@sol>
 <CAHp75Vd+5wVa6-B+5kj-0N-wyxr8iT_tSs-A36Pn30p3Z=THQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd+5wVa6-B+5kj-0N-wyxr8iT_tSs-A36Pn30p3Z=THQQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 02:53:40PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 28, 2021 at 2:35 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Mon, Jun 28, 2021 at 02:30:05PM +0300, Andy Shevchenko wrote:
> > > On Sun, Jun 27, 2021 at 04:47:57PM +0800, Kent Gibson wrote:
> 
> ...
> 
> > > Kent, do I understand correctly that Go bindings use C library?
> >
> > No, the Go library is pure Go - it makes the ioctl calls itself.
> 
> Hmm... Interesting. Why is it so? Performance wise? Other points?
> 
> (It means you are basically replicating what libgpiod does, right?)
> 

Yeah, I ended up replicating libgpiod in Go.  Which actually came in
quite handy when it came to developing and testing the v2 uAPI - the
first support and test cases for that were written in Go.

A bit of history...
Initially I wrote a Go GPIO library for the Raspberry Pi for a
project that required better performance than was available via sysfs.
This pre-dated cdev/libgpiod availability on the Raspberry Pi.
That library manipulated the hardware directly via mapped memory, which
at the time was the only alternative to sysfs.  It is hideous and
horrible, but it works, and if you can live with the downsides it is also
quite performant.

Once cdev started being supported in Pi kernels I wanted to port the
library to that.  I did consider porting to libgpiod, but that had a few
downsides:

My original library was pure Go, which is trivial to cross-compile
for the Raspberry Pi (just call 'GOARCH=arm GOARM=6 go build' on my PC
and I have an executable that I can run on a Pi).
If you do call C libraries from Go and want to cross-compile then you
get sucked back into requiring the whole C cross-compilation toolchain.
Plus ease of deployment takes a hit - you now have to consider
the dependent libraries, not just the executable.
At that point you might as well just write in C.
Ease of cross-compilation and deployment was important to me (I'm
lazy), so this was a major factor.

Also, I had less trouble getting my head around the kernel uAPI than
I did the libgpiod API.  The uAPI was a smaller and simpler target,
and was accessible from Go, so I went directly to that.
(I think the libgpiod v2 API is much more approachable than v1, btw.)
Anyway, neither API at the time could implement my existing Go GPIO API,
so I ended up writing a new library instead - the one that replicates
the core functionality of libgpiod.
Ironically, I probably could implement that old API using the v2 uAPI...

So, in short, cos it was easier.

Cheers,
Kent.

