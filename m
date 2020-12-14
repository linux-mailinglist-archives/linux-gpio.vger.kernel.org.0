Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E7A2D9493
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgLNJIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:08:46 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37254 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgLNJIp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:08:45 -0500
Received: by mail-lf1-f67.google.com with SMTP id o17so25339130lfg.4;
        Mon, 14 Dec 2020 01:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iSZg91JV66/CW3JaoaVefWFfJlXig0VcVO2sy1PBYiQ=;
        b=q6CCAlyj0m9RybxTxdoWeKTR9miI7oVvoeD1uk4I1I1fh1X4SIg6qOIqzAHjsQYdL6
         tj3yokP27Zlcz32zI2MGj6uHF+m3T1wUcgVDVyLB/Uzc6g/SM1MsbF+lJQnjAGwHx/qH
         wk5Uw5TjYLq7P4TaudKRwDxkbPfkm9CZOx0Y2pGFdoEaZnX8M9onvvHPNUPg4jjsfi+s
         fe5OdLbKO+jFf5/H7ZqDEiAGXu66SclGCzJ7AfGfL2HkWHRt+5D98LiN/B4T5TQoyVpI
         9eV68oQ+qZE+6ZQ6dCSd85UF5Ixe8yIM0z42/utiJmljR4XiHxRPfCjJ1WE/8R9/X80W
         83wQ==
X-Gm-Message-State: AOAM533SuxiqEEgpiIa3I7rJ6UQGOboXubYcSIHBheLvdkak4iLTXCfT
        K8Oz2qMirxcXqVamthQSdpM=
X-Google-Smtp-Source: ABdhPJxX8c5SVl1IHFKtWi6V5wvsewL6Dtk/h5U0L9Oxo0nZjP7h8e7LcdKCE9gVb0gYQe2+viN8Yw==
X-Received: by 2002:a19:bec2:: with SMTP id o185mr8752477lff.488.1607936883153;
        Mon, 14 Dec 2020 01:08:03 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.203.179])
        by smtp.gmail.com with ESMTPSA id h19sm2073374lji.51.2020.12.14.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:08:02 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kojpl-0006Ue-Ht; Mon, 14 Dec 2020 10:07:58 +0100
Date:   Mon, 14 Dec 2020 10:07:57 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: sysfs: Try numbered exports if symbolic names fail
Message-ID: <X9crbWwMiCC9ePLW@localhost>
References: <20201209161821.92931-1-linus.walleij@linaro.org>
 <X9HdfKxuUD3CZGNP@localhost>
 <CACRpkda+GhBF9f7nemrhL_mbgO0YENkWQJKZG_WA3g+ibp6ZhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda+GhBF9f7nemrhL_mbgO0YENkWQJKZG_WA3g+ibp6ZhQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 12:41:50AM +0100, Linus Walleij wrote:
> On Thu, Dec 10, 2020 at 9:33 AM Johan Hovold <johan@kernel.org> wrote:
> 
> > I suggested having the driver set a flag which determines whether to use
> > the line names in sysfs or not.
> 
> Aha I get it.
> 
> I need to think about if I can fix that in some good way.
> 
> > The above will trigger a bunch of nasty warnings and backtraces in the
> > sysfs code (for every gpio line!), which is not something we want for
> > normal operation.
> 
> At this point I feel any use of sysfs kind of deserves that but OK
> it's a bit nasty.

It would be a bug in gpiolib as the warnings are due to collisions when
trying to register two sysfs files using the same path.

> > Having the sysfs interface for the same USB device
> > depend on probe order is not very nice either.
> 
> The sysfs for a USB device is already very dependent on probe order.
> Since all dynamic gpio_chips pass -1 as base they will be allocated
> some global GPIO numbers at random (well, semi-random)
> depending on probe order.
> 
> The user will not have any idea whatsoever what to echo into the sysfs
> export file without inspecting other things such as debugfs.
> That's how unstable this interface is, and one of the reasons we
> are trying to get rid of the global GPIO numberspace to begin with...

That's not true. The gpiochip has a "base" sysfs attribute from which
any user can construct the gpio number by simply adding an offset.

Having the lines sometimes show up using their names and sometimes
using this number, is what would be a problem.

> Maybe that is actually an argument for any multi-instance GPIO
> devices to
> depends on !GPIO_SYSFS

No, not at all. Just suppress the rename of the sysfs directories based
on line names, which was a bad idea from the start (the names should
have been exported through a separate name attribute).

Johan
