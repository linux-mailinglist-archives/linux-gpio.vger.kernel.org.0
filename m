Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26932D1469
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgLGPIP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:08:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39798 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgLGPIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 10:08:14 -0500
Received: by mail-lf1-f68.google.com with SMTP id b4so10955044lfo.6;
        Mon, 07 Dec 2020 07:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hG5aJVSYnalv/Oi7hfy3oVEgetYN8NhzNJzKap34rWc=;
        b=XkZMLiqbisP6kLioPvcNmVRspkp1WY5ge/5ElrGRk4Fd6mY4WcO76Z36k/gE0hOWK3
         55sqFbkkYXGgrTuHih9kWHQ2LxbOqI/lAfcCSRAXkVY0EcF9Ex5r+V2hyKwX+sC0Vb2s
         x72PnLHZt3X2uZKH3K68vlG/0M/Z195X6tgEkFF5faE0ThkoNWC2opFXYB1BLjMT4Agt
         XdZeVrMDVdKWyOEZ+qxIiZm0DXmTcXG+Ylfy0cUpVnUcM+BYy52f5Y15+3e+5ewDmXOR
         8H4AMFfBM8bPErOgJUEhusmGEpAdabdby3G2MgjV2Aryc2jT5q1dFcUPRHBUCSpjWFPV
         4kPw==
X-Gm-Message-State: AOAM533AdDR3/TAxn2MaawzKQwrTD55xIIHTYuTLm4B3ycg+F1JFZQ5b
        pvStxuDiz9zwmJXZ+JYaPsM=
X-Google-Smtp-Source: ABdhPJyJc7ngcKGnDccRG4tx3HlP0vZSkSam7bRi0M7Uz68jCvkbSzAy93AnATsuq8FVnvZuHJJfwA==
X-Received: by 2002:a19:f242:: with SMTP id d2mr8338637lfk.520.1607353651863;
        Mon, 07 Dec 2020 07:07:31 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v4sm602377lfa.55.2020.12.07.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 07:07:30 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmI7R-000369-VQ; Mon, 07 Dec 2020 16:08:06 +0100
Date:   Mon, 7 Dec 2020 16:08:05 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
Message-ID: <X85FVc07Hc7LQQU8@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <X841xwCChUEqi5Ad@localhost>
 <73d57fe9fefe50955771846ea52004fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d57fe9fefe50955771846ea52004fb@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 07, 2020 at 02:41:03PM +0000, Marc Zyngier wrote:
> On 2020-12-07 14:01, Johan Hovold wrote:
> > On Fri, Dec 04, 2020 at 04:47:35PM +0000, Marc Zyngier wrote:
> >> Having recently tried to use the CBUS GPIOs that come thanks to the
> >> ftdio_sio driver, it occurred to me that the driver has a couple of
> >> usability issues:
> >> 
> >> - it advertises potential GPIOs that are reserved to other uses (LED
> >>   control, or something else)
> > 
> > Consider the alternative, that the gpio offsets (for CBUS0, CBUS1, 
> > CBUS2
> > or CBUS4) varies depending on how the pins have been muxed. Hardly very
> > user friendly.
> 
> That's not what I suggest. If you want fixed GPIO offsets, fine by me.
> But telling the user "these are GPIOs you can use", and then
> "on second though, you can't" is not exactly consistent.

It's really no different from any other gpio chip which registers all
its lines, including those which may have been muxed for other purposes.

> >> - it returns an odd error (-ENODEV), instead of the expected -EINVAL
> >>   when a line is unavailable, leading to a difficult diagnostic
> > 
> > Hmm, maybe. Several gpio driver return -ENODEV when trying to request
> > reserved pins. Even gpiolib returns -ENODEV when a pins is not yet
> > available due to probe deferal.
> 
> -ENODEV really means "no GPIOchip" in this context. The fact that
> other drivers return -ENODEV for reserved pins looks like a bug to me.

No, the chip is there. The -ENODEV is what you get when requesting the
line, because the line isn't available.

> > -EBUSY could also be an alternative, but that's used to indicate that a
> > line is already in use as a gpio.
> 
> Or something else. Which is exactly the case, as it's been allocated
> to another function.

Right, there are invalid requests (e.g. requesting line five of a four
line chip), lines that are already in use, and lines not available due
to muxing.

And then there's the question of whether to use the same or distinct
errnos for these. I believe using distinct errnos provides more
feedback, but we can certainly pick another errno for this if it's
really that confusing.

> >> We address the issues in a number of ways:
> >> 
> >> - Stop reporting invalid GPIO lines as valid to userspace. It
> >>   definitely seems odd to do so. Instead, report the line as being
> >>   used, making the userspace interface a bit more consistent.
> >> 
> >> - Implement the init_valid_mask() callback in the ftdi_sio driver,
> >>   allowing it to report which lines are actually valid.
> >> 
> >> - As suggested by Linus, give an indication to the user of why some of
> >>   the GPIO lines are unavailable, and point them to a useful tool
> >>   (once per boot). It is a bit sad that there next to no documentation
> >>   on how to use these CBUS pins.
> > 
> > Don't be sad, Marc; write some documentation. ;)
> 
> I sure will, right after I have fixed the rest of the kernel bugs
> I have introduced. With a bit of luck, that's right after I finally
> kick the bucket.

Hear, hear.

Johan
