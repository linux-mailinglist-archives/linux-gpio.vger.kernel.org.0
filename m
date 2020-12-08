Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FBC2D2B7A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 13:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgLHMxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 07:53:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:37452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgLHMxk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 07:53:40 -0500
Date:   Tue, 8 Dec 2020 18:22:50 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607431979;
        bh=oNMSmNezk0/IPDTVM+CthNykiMyH1a+B7oR1jQ/A5qk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=nS3TeL8gHhizbF2IkCQroAS2g3NbunEH1wdGO1pQPI5YADTlJtYo+CrjiBgldISkb
         2s4VDbA2ivrhORxVZor+wTrCWG/R0iWEn6VamVq+gOm9qCa6Ibq8e1Aiw2Cu7D3sEF
         LnxEH88hFnjTZQLEUkTE4G9PhRtwQKzagYYW3FKQHKl0OHSZh+Bn+YrBn7wTKjPmVp
         jSkyhr+c8YFrw7zmOb7FtQy7GNvUv4pVL4N8VtyGWzEvZiZkUFMEHtJULmDazQuvED
         O/w4jJB7q2pivp25AiJIi/WX76fUJtU0fNzHXkqvsObxLTdogKi0Q1N3FeTVWn09B4
         Nye3xN+U91oqA==
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20201208125250.GB9925@work>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 01:41:52PM +0100, Linus Walleij wrote:
> On Tue, Dec 8, 2020 at 10:57 AM Johan Hovold <johan@kernel.org> wrote:
> > [Me]
> 
> > > A better approach might be to create an array of names
> > > prepended with something device-unique like the USB
> > > bus topology? Or do we need a helper to help naming the
> > > GPIOs? What would be helpful here?
> > >
> > > name = kasprintf(GFP_KERNEL, "%s-NAME", topology_str);
> >
> > Well we started discussing this back when we only had the sysfs
> > interface which suffered from the same problem. I thought the chardev
> > interface was supposed to get rid of the assumption of a flat name
> > space? Perhaps in v3 of the ABI. ;P
> 
> It's "mostly true" that the line names are unique per-chip actually,
> because people don't like the nasty warning message. I wonder
> if anything would really break if I go in and make a patch to
> enforce it, since all drivers passing ->names in the gpiochip
> are in the kernel we can check them all.
> 
> If the names are unique-per-chip, we can add a restriction like this
> with the requirement:
> 
> depends on !GPIO_SYSFS
> 

This sounds reasonable to me.

> so it can't even be compiled in if someone is using the sysfs.
> 
> That should solve the situation where people are (ab)using
> the sysfs and getting name collisions as a result.
> 
> Then it should be fine for any driver to provide a names array
> provided all the names are unique on that gpiochip.
> 
> I doubt it would break anything, but let's see what Geert says.
> He has some special usecases in the gpio-aggregator driver
> which will incidentally look for just linenames when
> aggregating gpios, but I feel it is a bit thick for it to work
> with multiple hot-pluggable GPIO chips as well, I don't think
> that is its usecase. (We all want to be perfect but...)
> 
> > But what about any other non-pluggable
> > IC, which provides a few named GPIO lines and of which there could be
> > more than one in a system?
> 
> I think if there are such, and the lines are unique per-chip
> we should make the drivers depend on !GPIO_SYSFS.
> 
> > The topology is already encoded in sysfs and it seems backwards to have
> > each and every gpio driver reconstruct it.
> 
> I agree.
> 
> I think if this driver already has unique line-names per-gpiochip
> we could actually make it depend on !GPIO_SYSFS and
> just add the names.
> 

Sure thing.

Johan, if you are okay with this I can resubmit incorporating Linus's
suggestion.

Thanks,
Mani

> Yours,
> Linus Walleij
