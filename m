Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17ED341177C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240505AbhITOvh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:51:37 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37749 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhITOve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:51:34 -0400
Received: by mail-ua1-f41.google.com with SMTP id p9so11326719uak.4;
        Mon, 20 Sep 2021 07:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wH5UncPKe50JwP+zJde5g0e4HDP42GQioU45RB2YIEY=;
        b=4UKmu6AistRf++1IPMRgOgzZskSFqf7gHDAgRf3kxj7kTqWDAhcpo2Y8dHTRWn+97m
         BI39sH8eZT7w5stK1FCopvahuJ02kET+7en5UXBt2TSQXfEvoplHmmcdGsHiU2UFyr1j
         PsypvNmbOUJfwgUwvS+1tT1+IC5meUVdMcaKydN9Fe9SvNF9KQCnoCjKgOmr1vPqbliN
         dQ35r4pv0th/0fM7d5UmEqV4peogs/6Emnr70qUiCqcPH9W3CHoh13ERy9aFR2swF9LN
         w+Z9JYQHCIiglebSg+pWAerXMMxGlfmJKu2XdDNK4LMQIJ4lwrMMT47LXx9TXdcIVn0I
         X6cg==
X-Gm-Message-State: AOAM531B7EmoQ7qE9Rp95qNh5SuIIdLr/YY/yDBfB5YVc8ftdjUWpszZ
        U3xRmTSD6vqdiRZ3l3fbQ9RiLPLXSBEvEhMFY+4=
X-Google-Smtp-Source: ABdhPJyAkutJYCRne96YNrucgTgxe0OCzkFVzHSFb01yXQCKWuDFgnS6KokRadVNtz5w9JNPAKYiBzoi+eDjy3akNww=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr11940672uad.89.1632149406719;
 Mon, 20 Sep 2021 07:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de> <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
 <20210920143046.GA26163@lst.de> <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
In-Reply-To: <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Sep 2021 16:49:55 +0200
Message-ID: <CAMuHMdXUpMvhjjgNdLgfJvaWWG9_oHa_pmx4TTy0mC1p1zUEmw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, Sep 20, 2021 at 4:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Sep 20, 2021 at 4:30 PM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Sep 20, 2021 at 04:29:30PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> > > > On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > > > > For better readability and maintenance: use the BIT() macro for flag
> > > > > definitions.
> > > >
> > > > NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> > > > ever.  And I'm pretty sure we had this discussion a few times.
> > >
> > > Care to explain why it is a stupid macro?
> >
> > Please look at the previous thread.  I'm tired of this discussion.
>
> The only previous answer from Christoph is this:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2399968.html

Yep, found that one, too.

Now, as these definitions do not correspond to hardware register bits,
perhaps use an enum?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
