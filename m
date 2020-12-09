Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9B72D45A6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 16:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgLIPmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 10:42:31 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39344 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgLIPmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 10:42:23 -0500
Received: by mail-lf1-f67.google.com with SMTP id a12so3699769lfl.6;
        Wed, 09 Dec 2020 07:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xHtJdl5wRPnIFMBx2cuWtaxIr4kDVs8SuLeP7y0WSmY=;
        b=DLW3pn/5TdXySKs2PgdPIVarz/4hvE9vvRUBkhMLSp3HD3m/i16tAv0aPyZSO216Gk
         oZ6gWEgEceuQjnW8EYUiajCJyWWbqHTd2zZgE/69fvcvrQPhAJ0KDhTuuhHSxjLHg0Yd
         EZ0DqgQ5GcJzUECr0a3AhJp5/0W0x9GAi8XHYACNtMhNjQQ/ghEw1c1FE9oZT7vLaETX
         PxEj54Mm2jfTmxJZPGMGI6jSArHN1d+tdodSPaF0SlEPa6qGry4gaoaZUPsnO0ejDs7J
         NFcrMSsnpY9VhPgMCwcFfC3GBr1ph7MUVOXIpo8qJlwj2py8KLZPq9NuVl2ctExCOx2g
         voDA==
X-Gm-Message-State: AOAM531NBhFqU0RmvifMOKPtFyROvE/3b5wszkPp7xahCSZpJmd2vMRg
        Cf/rKuNEHhpOeKCXbXI/X3Y=
X-Google-Smtp-Source: ABdhPJw9ljZ7MRhYTQbmC7vjfq9B+Ozu4VAas+KoVlY+wzQhnTq7ZPUTzns8ekRUWpKUG+89P88iuw==
X-Received: by 2002:a19:8c0f:: with SMTP id o15mr1261240lfd.126.1607528501264;
        Wed, 09 Dec 2020 07:41:41 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x20sm208612lfq.86.2020.12.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:41:40 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kn1bh-0005bT-5o; Wed, 09 Dec 2020 16:42:21 +0100
Date:   Wed, 9 Dec 2020 16:42:21 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
Message-ID: <X9DwXS2xaiOs033B@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <X841xwCChUEqi5Ad@localhost>
 <73d57fe9fefe50955771846ea52004fb@kernel.org>
 <X85FVc07Hc7LQQU8@localhost>
 <d5fa2065009d5854b4c719003ebcb255@kernel.org>
 <X85O9GoDcbiDp97j@localhost>
 <CACRpkdZ06vWY+mqR7bYd_WcEM6+N6v5GgTAYhr0p0KkNLa3Qnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ06vWY+mqR7bYd_WcEM6+N6v5GgTAYhr0p0KkNLa3Qnw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2020 at 10:20:38AM +0100, Linus Walleij wrote:
> On Mon, Dec 7, 2020 at 4:48 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Dec 07, 2020 at 03:34:23PM +0000, Marc Zyngier wrote:
> 
> > > If they claim that their lines are available, and then refuse to
> > > let the user play with it, that's just a bug willing to be fixed.
> >
> > My point was that this is how *all* gpio drivers work, and that muxing
> > is somewhat orthogonal to the gpio controller implementation.
> 
> This is true. It's because it is orthogonal that the separate subsystem
> for pin control including pin muxing exists.
> 
> Should I be really overly picky, the drivers that can mux lines like
> this should be implementing the pin control mux driver side as
> well just to make Linux aware of this. But if the muxing cannot
> be changed by the kernel (albeit with special tools) then it would
> be pretty overengineered for this case. Things would be much
> easier if this wasn't some flashing configuration but more of a
> runtime thing (which is kind of the implicit assumption in pin
> control land).

We'd still have problem of how to configure these hot-pluggable devices
at runtime, so it's not necessarily easier.

If I remember correctly the xr_serial driver under review is doing
something like muxing at runtime, but by simply having whichever
interface (tty or gpio) that claims the resource first implicitly set
the mux configuration. I have to revisit that.

> We don't really have many drivers that are "muxable by
> (intrusive) flashing" as opposed to "muxable by setting some
> bits" so in that way these FTDI drivers and siblings are special.

Yeah, but the gpio-reserved-range (valid-mask) feature which Marc used
comes close here.

Johan
