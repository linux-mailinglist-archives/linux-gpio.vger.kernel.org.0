Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957B5268BB3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 15:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgINNEy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 09:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgINNEn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 09:04:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0390C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 06:04:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s65so10434689pgb.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdh90nAsg8FPAwf7YhkmI3ryVDLqZ68ajjR6rhm5qec=;
        b=hQ+jUW67DwnfezjJV5ljuIyhP8P5600BhEprjCxPC1g9vY8POsllHj3KAzIHBanbmf
         uG/DVaoho3fGlI9PhQVl3SGLJzHF53qwbd0rL8FewdATNHX9lZ8XcQTyt4HWXzSjtzxo
         osMKYblHTjZtrfYk02YHnleWNw3qb0Va6rEbDZ+WQuNWvDnlEea1A1eMxcgknXKp+Lbo
         awA6Y4wsGOmIFs0bwVt/GPj96SI0JxalRrqGqfMGUa3fMXEaOi5IphZ5iUflxtMuQqKS
         8WD9N4I6OVszwRwO+bsYL1rZwYGMrR8GyJcSbbik0fHQUSAFoadJU6jYVM+XME5Bv0hA
         Uigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdh90nAsg8FPAwf7YhkmI3ryVDLqZ68ajjR6rhm5qec=;
        b=ldUVjj6BG8lZlMkJKidWfZHjVAWgPzVmkgNQLR8CDIv6pnLhTtl87Vivu31Cm7Smud
         0VmbMDXNUuBFvRG75Lda+eHb5nZ+Yz2Uj+ZBLCx9J/N0XHqqSNqhYARFRNX0cWHwHcGX
         jl0Vspkq99fNuhjjB9G3PPu70hsjbpg+yxCv2mvk5bFbiWBNLflN7KlCt0ztw4BoB4di
         Plj+/1Jr36OPlVCmGKMdYekmZrjJbWxp6XjYo5ywtX66HWFHePgD1XyzqIwE53KcFE01
         CmmM8I7AfyW4QebbxjGIG1uuvBU9BlQkhPo3HuJlBVWDKFkAGMlgcZGn4tSe+d2RMTRC
         CsaA==
X-Gm-Message-State: AOAM532I+AidcqONq5IrWR21c6wzXFJdIyLGFKE7kbHlkUksA4kH9Flo
        O4Q5IL6hA03+huHzrbNmse55/UO2/ncPbSr2Si4=
X-Google-Smtp-Source: ABdhPJw3H+GPTOiFms1K5UEM7TlBhnVVXZFLrNN4gcHnhjf6qvCOdUahM7ev9j6gBYpfjo1VQRdBFsPNC/alYqBVFDc=
X-Received: by 2002:a17:902:6bc1:b029:d0:cbe1:e76e with SMTP id
 m1-20020a1709026bc1b02900d0cbe1e76emr14893020plt.21.1600088681344; Mon, 14
 Sep 2020 06:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol> <20200911083109.GF1891694@smile.fi.intel.com>
 <20200911091249.GA1874731@sol> <20200911095355.GG1891694@smile.fi.intel.com>
 <20200911101714.GA2132928@sol> <20200911142846.GM1891694@smile.fi.intel.com>
 <20200912022148.GA3880502@sol> <CAMpxmJU9=aFrQP9t+rOn4xvCdB9kHHvWzMkPnMcjG8G7pDzj4g@mail.gmail.com>
In-Reply-To: <CAMpxmJU9=aFrQP9t+rOn4xvCdB9kHHvWzMkPnMcjG8G7pDzj4g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 16:04:23 +0300
Message-ID: <CAHp75VeFfNmKWNSxQXOVHuksFzxCbxyv=3LmAesSYTSoZ5u1yw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 4:00 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Sat, Sep 12, 2020 at 4:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Fri, Sep 11, 2020 at 05:28:46PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 11, 2020 at 06:17:14PM +0800, Kent Gibson wrote:

...

> > > I don't like the difference between 2nd and 3rd argument. This what looks to me
> > > hackish. Variant with explicit compat structure I like more.
> > >
> >
> > Agreed - writing it that way does look pretty nasty.
> >
> > But my suggestion is actually this:
> >
> > ret = copy_to_user(buf, &ge, event_size);
> >
> > I suggested ge_size previously, but event_size might help highlight that
> > it isn't always sizeof(ge).
> >
> > > But if you think it's okay, I will update your way.
> > >
> >
> > I would defer to Bart or Linus, but I think just calculating the
> > appropriate size is preferable for this case.
> >
> > Cheers,
> > Kent.
>
> Kent has been producing clean and elegant code so far so I trust him
> on code quality issues TBH. Personally in this case however I'd go
> with an explicit compat structure as Andy prefers.
>
> I don't have a strong opinion on this so I really am fine either way.

Since the initial idea was Arnd's and he agreed on Kent's approach, I
will re-do that way.

-- 
With Best Regards,
Andy Shevchenko
