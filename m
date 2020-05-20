Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A821DB3CE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgETMkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 08:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgETMkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 08:40:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F1EC061A0E;
        Wed, 20 May 2020 05:40:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cx22so1211336pjb.1;
        Wed, 20 May 2020 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sTd7gk/F5t8+90VdVmPMqwcUDImsEOyU6Dtdpqgy9Wk=;
        b=lGH4/YvXzbpg8mnazKXwowykaaS/FaFJK6zRzmFMUwq3bPrXqelmSJhJjUCx4kt5gR
         FdWwuYsZxumG2p8fXPW0Ug2kqYvwBuDnWQuqFKAWpPtK4IkzaxNPuUE10/fBXRRkPOqd
         YXAUI7Z2mLoTYZjKY3IVwNmLA/R3iJ+vKrs/dZk/jzRVIlCek4Y89X9j6BqPB7m5IFj7
         y7AkQbFwVCVc5LqYoEZz8hIF8F2XyP3NcPV7395PBQM4+uuaWpNZQ+HZNPGjkHI6jPSg
         RrG08I60wNO3l368r3lFotMz4aasm2cXaAztzC2c3TLWFnBTqHnwnSe+jMTsTyHeGvRH
         rnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sTd7gk/F5t8+90VdVmPMqwcUDImsEOyU6Dtdpqgy9Wk=;
        b=gFthDYIo6yLRF5FlDyOETE1IDvuIaAWxEq32M8a5iTG3wQFka8TEocw9OPIBsJDZ9O
         jpA/te2/S6PMrMTHKCuPK0s/xEcdHJHH0Xjd0RTL6ReyilXLzqm7TZHCoQ8TcVDlQc/B
         BeTxHn3ZcA9JMDKVbsdB9nogliv6f03A7tANT5z6Su399pERFTSvuPat/Jpj9zb6Fe4l
         Jo8VT8y7mzjjE0GdCaXj2Spej/tmcu7NaGSMySDFP/4T1cd3kIUZgnajIvX7BmWnSLvl
         3vb5Ds6RSSbY4sw1K+4ieC1/QuLbjRz4jP3YiPZM6W1lBIJUO+rGp1q3cDWiwqXgWmDO
         Whow==
X-Gm-Message-State: AOAM533sKYIcCqw36O1Fr8f3UUgfrkmmsaxUKsQuxszGNtpY0aUw2XCL
        7RUkM2dYERgUaXk8l9WcizChvZwbN77Sh2Td8WY=
X-Google-Smtp-Source: ABdhPJx/Cl6q3jd3Y0UMnwozkcZAjDceOt2Er4TDCLYHyDTi6gqB77pGxZs0hLGbAvpCUV1znVIZxUUk8EW37tNIpcg=
X-Received: by 2002:a17:90b:113:: with SMTP id p19mr5377909pjz.129.1589978413555;
 Wed, 20 May 2020 05:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be>
 <20200520121420.GA1867563@smile.fi.intel.com> <CAMuHMdW9EsRLYYTL0pd-PqqZs5WcUfK8i2uceNwJnSvAQKuVgw@mail.gmail.com>
In-Reply-To: <CAMuHMdW9EsRLYYTL0pd-PqqZs5WcUfK8i2uceNwJnSvAQKuVgw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 20 May 2020 15:40:02 +0300
Message-ID: <CAHp75Vc9=1cD81TDuaGuFQpBcHaKqEZKv8tA7ZGBbDJ6MKq6kw@mail.gmail.com>
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

On Wed, May 20, 2020 at 3:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, May 20, 2020 at 2:14 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, May 11, 2020 at 04:52:51PM +0200, Geert Uytterhoeven wrote:

...

> > Sorry for late reply, recently noticed this nice idea.
> > The comment I have is, please, can we reuse bitmap parse algorithm and syntax?
> > We have too many different formats and parsers in the kernel and bitmap's one
> > seems suitable here.
>
> Thank you, I wasn't aware of that.
>
> Which one do you mean? The documentation seems to be confusing,
> and incomplete.
> My first guess was bitmap_parse(), but that one assumes hex values?
> And given it processes the unsigned long bitmap in u32 chunks, I guess
> it doesn't work as expected on big-endian 64-bit?
>
> bitmap_parselist() looks more suitable, and the format seems to be
> compatible with what's currently used, so it won't change ABI.
> Is that the one you propose?

Yes, sorry for the confusion.

> > (Despite other small clean ups, like strstrip() use)
>
> Aka strim()? There are too many of them, to know all of them by heart ;-)

The difference between them is __must_check flag. But yes.

-- 
With Best Regards,
Andy Shevchenko
