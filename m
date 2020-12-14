Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3FC2D9478
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439482AbgLNI7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:59:41 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46415 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439472AbgLNI73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 03:59:29 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so28145310lfa.13;
        Mon, 14 Dec 2020 00:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lr5XsBxGYGsi86hSbsch7/IRMB+x1iKvkn7GZc67tW8=;
        b=O/lrdeQ/4pcwmhj+AhhM8qbzeJWbHRGr8mqP5WbAEis9xFgBAqKF3VIRdW5pc+a8v4
         BcYdqsA1b/Bbf03Nm+DXdzAHkcovpL71i/fSwe7e8OFAG6dtQYsXXdX+dUfTU/Ol68Xf
         LMctO9IStHOS0Q5202GB1jThJ1KNz38ZkTag07aduWu3EZo768vo9qCylMJ1Rape2HqM
         PuOeOC8Zxp10Hjzh0Y6gpwYgozrXL/KyiaUGd8GwoE5ewsOjflnHOL2/x7lZa0mboWfw
         VaSp0/RavASspoFAzn7t6CFDGH0z/SkbKhbak1cK91cgR5zfB3SwnoCcx7NweAyE78DA
         QeZg==
X-Gm-Message-State: AOAM532Z35Y9cKGvBUQ2JuJ22DMlYFp1vC45p6khnZg9Vcz0gAboRAZ8
        k0ou/snzgqmeLZx1zx/Q84A=
X-Google-Smtp-Source: ABdhPJyhhmDZ7vcuIblH29uJeGjTMhhbNEqXAoVlSXDhsWa+GIQSBCxgnnou7Fw/tJWAtPwTNKLsdA==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr8699978lfg.61.1607936326079;
        Mon, 14 Dec 2020 00:58:46 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.203.179])
        by smtp.gmail.com with ESMTPSA id e1sm1700092lfs.279.2020.12.14.00.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 00:58:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kojgm-0006Sj-9M; Mon, 14 Dec 2020 09:58:40 +0100
Date:   Mon, 14 Dec 2020 09:58:40 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
Message-ID: <X9cpQO3IV4IgX1dh@localhost>
References: <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost>
 <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
 <X9HiGaIzk4UaZG7i@localhost>
 <CACRpkdZ6MUzRe9m=NrqA_5orhZXDtWj+qoFMHX7v6Zjsx-rVGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ6MUzRe9m=NrqA_5orhZXDtWj+qoFMHX7v6Zjsx-rVGg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 01:03:32AM +0100, Linus Walleij wrote:
> On Thu, Dec 10, 2020 at 9:53 AM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Dec 09, 2020 at 05:25:32PM +0100, Linus Walleij wrote:
> 
> > I just replied to that thread, but to summarize, you can't rely on
> > having the sysfs code detect collisions since that will trigger a bunch
> > of nasty warnings and backtraces. We also don't want the sysfs interface
> > for a specific USB device to depend on probe order (only the first one
> > plugged in gets to use the line names). And adding line names now could
> > in fact be what breaks currently working scripts.
> 
> Yes the sysfs ABI is very volatile and easy to break.
> 
> As pointed out in the other reply, sysfs base GPIO number is all
> wibbly-wobbly on anything hot-pluggable so in a way I feel it
> is the right thing to disallow sysfs altogether on hotpluggable
> devices.

No, the gpio numbers will of course vary, but since gpiolib exports the
base number for the chip, a scripts can easily determine the right gpio
number as base + offset.

Having probe order break that by sometimes exporting the line using it's
name is what would be a problem.

> > Just did a super quick check and it seems libgpiod still assumes a flat
> > name space. For example, gpiod_chip_find_line() returns only the first
> > line found that matches a name. Shouldn't be impossible to extend, but
> > just want to make sure this flat namespace assumption hasn't been to
> > heavily relied upon.
> 
> The unique way to identify a GPIO is gpiochip instance (with
> topology from sysfs) and then a line number on that chip.
> This is done e.g. in the example tool
> tools/gpio/gpio-hammer.c
> 
> As you can see the tool doesn't use these line names.
>
> The line names are really like symbolic links or something.
> But they are indeed in a flat namespace so we should try to
> at least make them unique if it turns out people love to use
> these.

Not necessarily, they could be unique per chip as we're discussing here
with respect to hotpluggable controllers. We just can't have it both
ways.

> As it is now system designers mostly use device tree to assign
> line names and they try to make these unique because they don't
> like the nasty warnings from gpiolib.
>
> If I google for the phrase "Detected name collision for GPIO name"
> I just find the code, our discussions and some USB serial devices
> warning about this so far.
> 
> Maybe we should just make a patch to disallow it?

That would make it impossible to provide name lines on hotpluggable
controllers, which would be nice to support.

Johan
