Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670E4411693
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhITORD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:17:03 -0400
Received: from verein.lst.de ([213.95.11.211]:51673 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235337AbhITORC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Sep 2021 10:17:02 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id EE75367373; Mon, 20 Sep 2021 16:15:30 +0200 (CEST)
Date:   Mon, 20 Sep 2021 16:15:30 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
Message-ID: <20210920141530.GA25156@lst.de>
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl> <20210920140938.GA24424@lst.de> <CAMRc=MfTfgKxgmgEsRxcbGqadsutfFhiTkGFT1bagS7DHXHpLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfTfgKxgmgEsRxcbGqadsutfFhiTkGFT1bagS7DHXHpLA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 04:13:37PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > > For better readability and maintenance: use the BIT() macro for flag
> > > definitions.
> >
> > NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> > ever.  And I'm pretty sure we had this discussion a few times.
> 
> Yep and the general consensus among the kernel developers still is to
> use the BIT() macro. Even for this patch there were three separate
> comments from high-profile developers to use BIT().
> 
> Also: this really is bikeshedding at this point, given that the core
> subject of this series is elsewhere.

Given that we had this dicussion before I'll gladly tell you that your
any seris with a BIT() conversion will go stright to /dev/null after
the first warning from now on.  You had more than one warning.

