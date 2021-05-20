Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C757F389FE1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 10:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhETIfB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 04:35:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhETIfA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 04:35:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97D7860FF1;
        Thu, 20 May 2021 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621499619;
        bh=zC2Jqfc5np9GUFGI4yjQnL4CXojZ6bzom+Oi0SOtk6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VaD2bxFUKLLJL8MZWeXdgd6q98EV/SNrK2Wqdz0NYQnUnk+uh/famzLtgHFS9cQlP
         btasDmMYDDxyotLe+oDzQxnX2WePQ6cgFGEgpF520zG6eT95zu6L3BJG8XAE1j4oe2
         N6VcOg5ro1zaUaQ3N62R0KqvFVeHNj4mFdU02qC6pTav5LRdtAqNbkj2pZYU9nZBGk
         /SkTTieKeFKEMITBw7obSIsim32Pxace5CsHTE8+6NqzCl2g8a1x1iwqXZl2CMV7kU
         ebEbltxjM8HKMJBOI2q3FxHEZr1btdImy5txRDeIudK2r0pm5aaYwQ6gVeiidLIJuS
         XED+6/wBeYa/Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lje7e-0001vI-7G; Thu, 20 May 2021 10:33:38 +0200
Date:   Thu, 20 May 2021 10:33:38 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYe4rgGTDRfq+va@hovoldconsulting.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
 <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
 <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 11:15:31AM +0300, Andy Shevchenko wrote:
> On Thu, May 20, 2021 at 11:07 AM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, May 18, 2021 at 11:33:39AM +0300, Andy Shevchenko wrote:

> > The _if suffix here is too vague.
> >
> > Please use a more descriptive name so that you don't need to look at the
> > implementation to understand what the macro does.
> >
> > Perhaps call it
> >
> >         for_each_gpio_desc_with_flag()
> 
> Haha, I have the same in my internal tree, but then I have changed to
> _if and here is why:
> - the API is solely for internal use (note, internals of struct
> gpio_desc available for the same set of users)

That's not a valid argument here. You should never make code harder to
read.

There are other ways of marking functions as intended for internal use
(e.g. do not export them and add a _ prefix or whatever).

> - the current users do only same pattern

That's not an argument against using a descriptive name. Possibly
against adding a generic for_each_gpio_desc() macro.

> - I don't expect that we will have this to be anything else in the future

Again, irrelevant. Possibly an argument against adding another helper in
the first place.

> Thus, _if is a good balance between scope of use and naming.

No, no, no. It's never a good idea to obfuscate code.

> I prefer to leave it as is.

I hope you'll reconsider, or that my arguments can convince the
maintainers to step in here.

> > or just add the more generic macro
> >
> >         for_each_gpio_desc()
> >
> > and open-code the test so that it's clear what's going on here.

FWIW, NAK due to the non-descriptive for_each_desc_if() name.

Johan
