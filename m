Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74BA412869
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 23:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237344AbhITVse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 17:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238648AbhITVqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 17:46:34 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9298C0698D7;
        Mon, 20 Sep 2021 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=KXUOMDD9e8aDRtCMjdtKTE3I6iViL6D6eI7D8ogZ3mM=; b=uq96Xwj4pZdgwT/3V7FLk8WtPg
        YMjoJxWEbcNpxDi1aA5eIUP8wx2k0w+ft8EZAGVSpCUWeuytzVsMkniR9VUM4gcHG7SHsIGNgTeN7
        r5namj2wGtuypxeRzCxkjfTLoWKWQiKxP+VK8622VncZUv/1U4dCQ9NpGDcVZFwarsCow3C82Dj6t
        XnHaV6EF3fXOVY244/V8StSsImq5wLyXbEUeKZ9X77Gy+mlahNPtgunAxs5zHauW5YHbtSIB7IyET
        +FPv+CFlwXUibadLtKUQF/9C9fPOgiO7dtRLPEDOgvo8CO6zXyKg+blvANJ6SoA9TlwhDSuwbJogK
        XHexOcHg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mSN2Y-002uyi-DQ; Mon, 20 Sep 2021 17:25:40 +0000
Date:   Mon, 20 Sep 2021 18:25:14 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
Message-ID: <YUjD+sAkgjYkTE38@casper.infradead.org>
References: <20210920140509.5177-1-brgl@bgdev.pl>
 <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de>
 <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
 <20210920143046.GA26163@lst.de>
 <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
 <CAMuHMdXUpMvhjjgNdLgfJvaWWG9_oHa_pmx4TTy0mC1p1zUEmw@mail.gmail.com>
 <CAMRc=MdNQ+rquq6_rf-rxvoPzz9G0EzO4T=ryF6XYXh51NBL_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdNQ+rquq6_rf-rxvoPzz9G0EzO4T=ryF6XYXh51NBL_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 05:00:10PM +0200, Bartosz Golaszewski wrote:
> Anyway, I'm more interested in Al's comments on the implementation of
> committable items than bikeshedding about whether to use or not to use
> BIT() so I'll wait for those before revisiting this patch.

This isn't bikeshedding.  Bikeshedding is when lots of people weigh in
with opinions on what you should do.  This is you failing to listen
to the maintainer of the code you're changing.
