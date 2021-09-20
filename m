Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20EF3411702
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbhITObJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:31:09 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:44807 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237796AbhITObJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:31:09 -0400
Received: by mail-vk1-f179.google.com with SMTP id s137so2144790vke.11;
        Mon, 20 Sep 2021 07:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=21YkALx8MY4xYqXIBqwCtbg9uR4choq3iXSql033QuY=;
        b=ncjGd+zdQglCnUZItsBwHnwXR8WWGMewgRuCbWnpbL4N0Jfg56DiaH6xnG4yZ532uz
         EnyJLQPK+T28H/Teq0lv3HCNvkYh4lP4X+T/+IPpdI3DkmkXnjlbfrbUszStqjQJoj4c
         8FtKHUy4WL1hMIZVDqnCOh0Ai5rZLjaZMcOHnjBLfmCtd89NzpuHgCCj1ZuBw4uz8xF/
         BOSIDmRR7EgScC2jeYtbzUxIhGiJityfn/02HbVlWAdUJYmcvIgVcn4otX5OkAexD6AU
         Yb4otYsIUA2NuUoi4FYr9qbfsACGMlxoK79Dm+dTH4/jvS2D2fONH5x7bDXVFC9KpkXn
         /gdQ==
X-Gm-Message-State: AOAM531jfwgRia0S2Jm5nqHdVOnlJgAdwI2NnuomFsMDK9IqBnQuGq7R
        zdmidZzFaUc9i0yELZRBmrHsJBlyzRic+TQ+1RQG5o80
X-Google-Smtp-Source: ABdhPJzYwvtLjl5QDwoV+CHITQjvFv+87GrxeChNSj2O8dfOTy5rVYi5P2u2LoaRXbU19nG7yQpelDKN8sKmTzppk8c=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr3803629vka.19.1632148182010;
 Mon, 20 Sep 2021 07:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de>
In-Reply-To: <20210920140938.GA24424@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Sep 2021 16:29:30 +0200
Message-ID: <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
To:     Christoph Hellwig <hch@lst.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
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

Hi Christoph,

On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > For better readability and maintenance: use the BIT() macro for flag
> > definitions.
>
> NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> ever.  And I'm pretty sure we had this discussion a few times.

Care to explain why it is a stupid macro?

TIA!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
