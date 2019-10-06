Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC7CCCE05
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 05:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfJFDM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 23:12:27 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43622 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfJFDM1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 23:12:27 -0400
Received: by mail-pl1-f193.google.com with SMTP id f21so5058649plj.10
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 20:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8/5T8SiGioQuxZLiveRC0WYYVw1c4RYL5Igrpyi++IE=;
        b=qse5u1XBY9DNhE7g6x6vcblmickzNnVnyu9Hmfse3LAfO6LzFDEbxwnFgf1B+W4oqr
         i/LhrFzCXRQVZsqW8nuJu7rfldr1TWbIR02sIFprcXW/jCS1ktZDjv8E6hqllPKIHZjp
         EHfkSU+IcOPFbOqXhWYsUyk3RcNTqfJCwmg9pvUeWI1v/hVxlbj372F+hFO7Lc0BnhfG
         0+W5YiYO4feLKchNv7C12iLhcj8FQxczY+yHlPt1s+bHkTbBBTjBwu5zpyF8D/gh8kL3
         DEJwarTq0bsNL9Ob2HKNAFQDx1zTGI6R8djNMS7d5/qqbHa7fq4s2/bmiklYB2bxZvZB
         MLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8/5T8SiGioQuxZLiveRC0WYYVw1c4RYL5Igrpyi++IE=;
        b=XWbFmVAkFviwwiIx9x4EJ0oEKOy73Qth09TD+Ko8FmLQYJvkubGpEkloS8geqjFTm6
         gjCQ86gsSUokvtvs7FCqh5qTpKWxAmOyf/1UaP+rLdpiZ+DFPGZK68UiPht91JvZ27ZF
         VTG1RMrYngE1w5hqkj3xVLV2WZpkNA/PFQWszG2uOisalOTe+/r+rzgjiXGAwTRe9ULy
         Pt5kSShP8vrdthbU6WiCpyeCK5+zEs4cUUtgZeZwNOiOtEOx7BN0FuvacxXQqPJAD24d
         XgxmYulh+JVGXysyti3LIK1kVmrokUE6oNgKE/HOn8htjrE1UzLHPvpNO9/xCj1gsIxJ
         FZnw==
X-Gm-Message-State: APjAAAX3EeX/UGZlm1R9U8gVOBu/gu78V1SI9Q/ooHJv2fITQUaZbv97
        dLYul9iLiC5GG1mPWBH1mmTrw6yjQQir7Q==
X-Google-Smtp-Source: APXvYqzxVwNECJpMjWmFvrk6m/ylQ0oEXwoQBR5zboZTCtOVsA4cJcy9hukPU9jc34kk++kMmk2XlA==
X-Received: by 2002:a17:902:9b83:: with SMTP id y3mr24110988plp.25.1570331546094;
        Sat, 05 Oct 2019 20:12:26 -0700 (PDT)
Received: from sol (220-235-122-141.dyn.iinet.net.au. [220.235.122.141])
        by smtp.gmail.com with ESMTPSA id 2sm11294038pfa.43.2019.10.05.20.12.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 20:12:25 -0700 (PDT)
Date:   Sun, 6 Oct 2019 11:12:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191006031220.GA7957@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
 <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
 <CACRpkdZP8GYPUk4ZB+2Ei4hrrT0Orq0MUEszJ+YM=npuh1uH9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZP8GYPUk4ZB+2Ei4hrrT0Orq0MUEszJ+YM=npuh1uH9w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 05, 2019 at 07:02:58PM +0200, Linus Walleij wrote:
> On Fri, Oct 4, 2019 at 9:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > The config ioctl (or
> > something similar) you're mentioning may appear sooner actually -
> > users of libgpiod have been requesting a way of changing the direction
> > of a line without releasing it - something that's possible in the
> > kernel, but not from user-space at the moment. I'll submit something
> > that allows to change the configuration of a requested line soon.
> 
> Hm! I guess I assumed that userspace users would be using the lines
> for either input or output, not complex use cases like that, reversing
> direction and what not.
> 
> What kind of usecase is this? I certainly hope nothing like doing
> userspace drivers for complex hardware ... those should be in
> the kernel... the current ABI is a bit oriented around industrial
> automation and prototyping use cases.
> 
I'm not the only one asking for this, and I can't speak to others' use
cases, but in my case I'm prototyping and bit bashing a SPI driver for
an ADC where the MOSI/MISO lines can be tied to save a pin. I need to
be able to switch line direction without glitching the line and that
can't be guaranteed with the current UAPI.

Would you consider that "complex hardware"?

Kent.
