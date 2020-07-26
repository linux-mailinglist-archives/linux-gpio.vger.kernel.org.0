Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEED22DB8A
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 05:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgGZDYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 23:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgGZDYP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 23:24:15 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFF8C0619D2;
        Sat, 25 Jul 2020 20:24:15 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m22so7499316pgv.9;
        Sat, 25 Jul 2020 20:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ylSob1TfxL3wF+3P8pCCtn06XFXpIg3kaDnuq9sg5J0=;
        b=k2ub80atQf46SM7/tv2X1i5R3DEErzZ+5J1pDTbRGubw1XCD+DnyiF9iIQqEHYVUCv
         o6BXq3bJUYrDP8iWyGNNQfvmmbMwld0HjMotsunHMVizTYd4sX9q/NTu+VVP2yTcBuPX
         2nI1eFpeTO7OdNrmJxv2W12JACp81Ndt750FcTHN9O4WvxjfpLgqCaePgrav+atoy6Wy
         JsQXlKDPCQNkEG/r/rFWPezY+ly+1v/7RCq82xsKSuhkhMa2zBkgEhZo9oGLnhBkWPTR
         kiV/TK0NMmJu8zSUnd8CpW4LV0doxlicwCC7SSbtlhgAxlU5O9CtoluaCz4g8X4RQjGW
         s0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ylSob1TfxL3wF+3P8pCCtn06XFXpIg3kaDnuq9sg5J0=;
        b=LSmuvgAN5tfQ6MlMmPhvEQ7gTVxGNvkRXqwXyVKdYvNbi4eV0HWF3+XVeaFdHa3sAf
         CyzUy64iVkaPr4a2rztfTSQSeKXTZCSmrT3NoliMaYAI3k3sze7xzGE2U7yZLPLKboba
         KtMOqBYeEzCavyXEWirQ2HKX6eQgeUAM71/Lz7FpTbUt57JZXZ7fbQRUGTEvRltkjyPM
         FYztJtBFlG7esrLJoXaP4VRdOCCWXcI9+RYnI1nHak10VD5pV4zWvpIuEp7MLv8pN2hU
         FydAdwtI21xXJIu4EKgFAihQrySCDQKMCtNe7iPlsfmBOvSgjFN8sSIIaXwWnYeZfX0V
         Nn0w==
X-Gm-Message-State: AOAM533FFNvp4viEQGvvhrKa2OklnxacQVk6tH640Gz336Q48oIFJyoB
        9q25vE/ABro/r8G4RZ8LPJQ=
X-Google-Smtp-Source: ABdhPJysDocBa2t+oK0J0mwTR7+EBG8WGAOvXaR/dVfcTe8Oh0Yqf99qil8drFBSKSCjWZb8TMkKnQ==
X-Received: by 2002:aa7:871a:: with SMTP id b26mr14868460pfo.294.1595733854896;
        Sat, 25 Jul 2020 20:24:14 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id x10sm9771159pgp.47.2020.07.25.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 20:24:14 -0700 (PDT)
Date:   Sun, 26 Jul 2020 11:24:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200726032408.GA78235@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726011244.GA6587@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 09:12:44AM +0800, Kent Gibson wrote:
> On Sat, Jul 25, 2020 at 11:51:54PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 25, 2020 at 7:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >

[ snip ]
> > 
> > > +static bool padding_not_zeroed(__u32 *padding, int pad_size)
> > > +{
> > > +       int i, sum = 0;
> > > +
> > > +       for (i = 0; i < pad_size; i++)
> > > +               sum |= padding[i];
> > > +
> > > +       return sum;
> > > +}
> > 
> > Reimplementation of memchr_inv() ?
> > 
> 
> I was hoping to find an existing function, surely checking a region is
> zeroed is a common thing, right?, so this was a place holder as much
> as anything.  Not sure memchr_inv fits the bill, but I'll give it a
> try...
> 

I gave it a try.  It is a good fit functionally, but in my build it
results in a larger object by ~104 bytes.  I assume that is because 
padding_not_zeroed is being inlined, and otherwise optimized, while
memchr_inv calls aren't.

As such I'm inclined to leave it as is - unless there are other
objections.

Cheers,
Kent.

