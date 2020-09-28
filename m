Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1C627AB5E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 11:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgI1J63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 05:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgI1J63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 05:58:29 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A79C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 02:58:28 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t12so597019ilh.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bynqe8oqfLSmRS8jPy3IQGtOrQle4bDHlhly7glDXtE=;
        b=E6pi/58he3Bw+tuVCJbgXrJPbzgzvilKEDqpPwZ6gDn4Y3NLB9WHKZVomKAoHyYgyw
         Pf/fvJFUPbY1TAJTKewr93xn76mzrr0DHIylwkGiejOR6rA2kT/dIa9u8PngfJphK8UO
         y3uA3ABoePxwD06j8F3cSTq+fNqADptlbwN11t1cQp3lPAzxj3wZoKopB8Glto4cM8f9
         EvkBygwREatGM2BurfQ7g/KzI/mYn2WQDh0UCxm3aFIb+aenjVZqx0sj5vHYrsUY/z9o
         SCHhYORqNAzwkDMCk+kzQkkN2h73nJbgRCh9SEG8VwXIPJa254vcVoCtD8hsPaXp7cE4
         qDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bynqe8oqfLSmRS8jPy3IQGtOrQle4bDHlhly7glDXtE=;
        b=HeKxtW3+zSxJs0W0/C8jV1E5EwU4jt0QOLQ7Gfg5o7xZM5gNuY81faMy/9LkW4VNlH
         k+3r3a7JEB/tjg8koaJ6ePSrNXz/a45LVC0PW5B6tDA2fSlpE8L0p3dV2LZ7EJJQakes
         au/3abTAOhzRhLnbjCSZOYmiM1h/9un9gmrLbenVdIgsxpP/C+t1BxrY3PuZTK0GA/PA
         bt0oznb4XkF6wWwNv1GhT0Q2fL8VfeEuTF6zX40NFaPWlEMg7eLycvOGdYjA4Cw5RUvI
         0ORBKTwBehjjzi1HxZsx+tM/jOZiHNWjAhbF+KTPvXqZRWmzH+NjfmogmvjY6LsBi25I
         HSug==
X-Gm-Message-State: AOAM5322WdY7pK2H6Lojm3Hu0nD3herG22pEfMYXhKOJxFvtQNQj/Cu4
        lFzA/RIGceJ/7GMFUahMAE15LFJ/Qd4K50VEEgV9vg==
X-Google-Smtp-Source: ABdhPJzsnbR4X2gtOKMUOyny3SQ3EJ35XjKu1q3fJ+jImDN/PZpQkDGibLVlL4P3ysT+VeTtQfzSLC34OxMezTb95us=
X-Received: by 2002:a05:6e02:f10:: with SMTP id x16mr444999ilj.220.1601287107416;
 Mon, 28 Sep 2020 02:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com> <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
 <20200925123000.GD3956970@smile.fi.intel.com> <CAMRc=McfBLaE=N12z29JjTDJ0ABzC8OW4rPWeeSU82kag+9pgQ@mail.gmail.com>
 <CAHp75Vd9N+OWCq_M3U3RfTEwx+xCyJHzSpZOXWiXQRRdv3tSDQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd9N+OWCq_M3U3RfTEwx+xCyJHzSpZOXWiXQRRdv3tSDQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Sep 2020 11:58:16 +0200
Message-ID: <CAMRc=MecMWopShuSSiGTFpwdHKLf7DCsm-vADZ6gokKnnrepNA@mail.gmail.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names' property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 11:11 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 28, 2020 at 11:45 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Sep 25, 2020 at 6:41 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Sep 25, 2020 at 01:40:10PM +0200, Bartosz Golaszewski wrote:
> > > > On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > > +             kfree_strarray(line_names, line_names ? ngpio : 0);
> > > > >
> > > > > Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> > > > > here?
> > > > >
> > > >
> > > > I did in the previous series and you told me to not to. :)
> > >
> > > Hmm... What was my argument? What was wrong with me? free() should be NULL-aware.
> >
> > Well, it is - your just need to make sure ngpio is 0 too. :)
>
> Do you really need that? If you have NULL as a first parameter, the
> second one can be anything.
>
> > I'll revert back to having the NULL check.
>

Yes that's what I'm saying but under patch 1/9 you previously said:

--
Shouldn't we expect that caller will supply NULL, 0 and above check is not
needed?
--

this is why it works like this in v1.

Bartosz
