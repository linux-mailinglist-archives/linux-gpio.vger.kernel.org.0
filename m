Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366072D4553
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbgLIPZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:25:17 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44573 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbgLIPZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:25:16 -0500
Received: by mail-lf1-f66.google.com with SMTP id m25so3598385lfc.11;
        Wed, 09 Dec 2020 07:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c82hnL+n/w5N2k4itbMOvCwk0PTaYeye6Ht48+ywYyA=;
        b=WfVFG6SBxzj19SwB7jgFUjzCQU/xibwzzKc/mBicKBmriepuFopDC33Z9WYTpFUWEw
         wfvZfTIaAbxztqTRJ+s4qTEYkhCh7rhBjO7k3MCSKU75RizbvoevFrUCoGr6NnVmg7hg
         wjlvvI65wYouPxHALr8e5XtVyYaLrID0lE4M5nbwzIrsPqYikj6944kHt6cETwc/M8I9
         4/igDarUcUhIH0T0P638l46VYESTHQ30Fn1Hg9ymMg7F77yH6aVF2a5THS8ofj/M43lW
         IH+uPt52jQqlYO/LHE77+8M5krLq/TPFXoUPuGP2fcgN7W6ckzUh9aCpkBpmXrJXWOXi
         pj9g==
X-Gm-Message-State: AOAM532Uzhck6/cBEczimeywQZXzExOuV+HRoIUuW8CELebLHwm2JFTk
        1rxPk11Wn/yib0YQG6R333s=
X-Google-Smtp-Source: ABdhPJzCmf4UQvTZ6ImEMwUHrHuLwwO8+ABHGcKgnbs6Z5W3asrE3QVb45CQN5eEDjiXQyr+aZ2j9g==
X-Received: by 2002:ac2:5469:: with SMTP id e9mr1107904lfn.439.1607527473924;
        Wed, 09 Dec 2020 07:24:33 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f15sm267706ljo.7.2020.12.09.07.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:24:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kn1L7-0005Wj-Sm; Wed, 09 Dec 2020 16:25:14 +0100
Date:   Wed, 9 Dec 2020 16:25:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X9DsWahl6UDwZwBn@localhost>
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
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 01:41:52PM +0100, Linus Walleij wrote:
> On Tue, Dec 8, 2020 at 10:57 AM Johan Hovold <johan@kernel.org> wrote:

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
> so it can't even be compiled in if someone is using the sysfs.
>
> That should solve the situation where people are (ab)using
> the sysfs and getting name collisions as a result.

Would it possible to set a flag to suppress just the sysfs entry
renaming instead?

Despite its flaws the sysfs interface is still very convenient and I'd
prefer not to disable it just because of the line names.

> Then it should be fine for any driver to provide a names array
> provided all the names are unique on that gpiochip.

So it sounds like there's nothing preventing per-chip-unique names in
the rest of gpiolib and the new chardev interface then? Are the
user-space libraries able to cope with it, etc?

> I doubt it would break anything, but let's see what Geert says.
> He has some special usecases in the gpio-aggregator driver
> which will incidentally look for just linenames when
> aggregating gpios, but I feel it is a bit thick for it to work
> with multiple hot-pluggable GPIO chips as well, I don't think
> that is its usecase. (We all want to be perfect but...)

Ok.

> > But what about any other non-pluggable
> > IC, which provides a few named GPIO lines and of which there could be
> > more than one in a system?
> 
> I think if there are such, and the lines are unique per-chip
> we should make the drivers depend on !GPIO_SYSFS.

Or just suppress the sysfs-entry renaming if that's the only thing
that's blocking this.

Johan
