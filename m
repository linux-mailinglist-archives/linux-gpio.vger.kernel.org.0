Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7591DB3DB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 14:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgETMlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 08:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgETMlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 08:41:04 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12105C061A0E;
        Wed, 20 May 2020 05:41:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so1226023pjb.3;
        Wed, 20 May 2020 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oByZiP5udJbQzBWklBptE2RceP4HV/dxPc97SQf5r9I=;
        b=bMPUbzd4w8Xckix21mTZAu4nqS8lo47Q1IuxRu1bg7ZEfkEGQ8nXx5annWGMvSJpUG
         Ik/OdHHZVFQzOUM1UtH3eq53mId64W2QngOShgah4eBAgtzA8wecG2nCqBzMqTNljtsD
         I/obKtjGl79PBq18fdqrzfjBAgO5nXDSxTC6ja6DWm6PPpb0EEEoMoUqBYfL2jgwEY31
         ny9uKMDOQHdpq3EmyqBSW1qcC/9hybhjlqyzXdhMmUELkNCHd+FG4uFvvhSZ89c0FYk8
         Wc8Amekl/xkn7XYPvcq8vhfKVysczN0Bay8pc2ehG7MO/QFdv0+hAQ81qW7BWXJ5hvL3
         f5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oByZiP5udJbQzBWklBptE2RceP4HV/dxPc97SQf5r9I=;
        b=iTW//rTfh2OraISO7oFTfovkDbK4B1c7WKL8cgXuLQsQo2yeCoAp/BgGh/ME/lexIe
         tiryTnPHC7lnY/p08ako84JAvN2CVoFl9HG6hNjD2h0SR5geUslhmJ2awjX6HX5lxxeV
         WSm25aZZ0Kbm0Bw4yYFRdhghYoEY4IUEZJUzhN7MVtJ0MDy1D92oKWdnw6LPkG6SrtqZ
         0oBaP7eezwTJExDI+QZQ3ohnlpNL8/3FpDD/Wsgjt4IAPp17dOImCW7E4Q73EnWAxPIl
         jYSakU3hWyzqiCsfj+Dx6ZGLRRL6ue5NbtxbM4wRfw19aT/BiFMAZc657dWcGUogltbr
         NpNQ==
X-Gm-Message-State: AOAM5323YLnml1jSvYNjN9OL7TPbxbF+sIoxe3zCEJqgC9ezlmuccjAl
        aR9XUcTAH1jDyuCL42l072fBNaBHhFTUC6tjpCk=
X-Google-Smtp-Source: ABdhPJyjV9IcI4Rvhp2yDHZ0cMw5+9uLEMBQuP44Edg6AhPbW7DTGRWOGVfUVIEgCtyep5Po1iHo+g/GYI8TVSX85T8=
X-Received: by 2002:a17:90a:1704:: with SMTP id z4mr5093444pjd.181.1589978463619;
 Wed, 20 May 2020 05:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be>
 <20200520121420.GA1867563@smile.fi.intel.com> <CAMuHMdW9EsRLYYTL0pd-PqqZs5WcUfK8i2uceNwJnSvAQKuVgw@mail.gmail.com>
 <CAHp75Vc9=1cD81TDuaGuFQpBcHaKqEZKv8tA7ZGBbDJ6MKq6kw@mail.gmail.com>
In-Reply-To: <CAHp75Vc9=1cD81TDuaGuFQpBcHaKqEZKv8tA7ZGBbDJ6MKq6kw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 20 May 2020 15:40:52 +0300
Message-ID: <CAHp75VcARgxf-Ty77mk2PJ0BUxJsXQdDLMffiDdv1gCkF_VMtg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 3:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 20, 2020 at 3:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, May 20, 2020 at 2:14 PM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Mon, May 11, 2020 at 04:52:51PM +0200, Geert Uytterhoeven wrote:
>
> ...
>
> > > Sorry for late reply, recently noticed this nice idea.
> > > The comment I have is, please, can we reuse bitmap parse algorithm and syntax?
> > > We have too many different formats and parsers in the kernel and bitmap's one
> > > seems suitable here.
> >
> > Thank you, I wasn't aware of that.
> >
> > Which one do you mean? The documentation seems to be confusing,
> > and incomplete.
> > My first guess was bitmap_parse(), but that one assumes hex values?
> > And given it processes the unsigned long bitmap in u32 chunks, I guess
> > it doesn't work as expected on big-endian 64-bit?
> >
> > bitmap_parselist() looks more suitable, and the format seems to be

> > compatible with what's currently used, so it won't change ABI.

What ABI? We didn't have a release with it, right? So, we are quite
flexible for few more weeks to amend it.

> > Is that the one you propose?
>
> Yes, sorry for the confusion.
>
> > > (Despite other small clean ups, like strstrip() use)
> >
> > Aka strim()? There are too many of them, to know all of them by heart ;-)
>
> The difference between them is __must_check flag. But yes.



-- 
With Best Regards,
Andy Shevchenko
