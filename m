Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5148E2D1510
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgLGPtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:49:22 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44653 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgLGPtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 10:49:22 -0500
Received: by mail-lf1-f65.google.com with SMTP id d20so18734009lfe.11;
        Mon, 07 Dec 2020 07:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0NeitWUE72bOazPk0RWGIGCfwRRdfTRIc3aJljkPw7Q=;
        b=IWkuV1ANcrtpi60NRnqzicDl8O/fjOQAVGIQ1uC4HA00Zq2+JTCzDheD5Ic2UkYQJX
         KOisSPFQypi5OtlARSd0IYNC6Z+KCWCutGX78Fm6Q6m6N8LJhGZjuGCpW0vn3qVQ+pcX
         ZBUEycX5up+NozEZFGy1WcmyxdW8dDvhLMZf9x8Ly4oigFr0wgS5ABNQdwFSi1oErjc5
         VabodiEVZJGCBMh73EVQb1roXwSKiK7/S7aLAIImLkl2OFIdqbVcHkWDlducXolZoqGJ
         D0aIrSkf4uqWsnSybq1Wwv97dLCn/Kw3F8Atk5e/sOTHmYpO4snVST5zDBlucWNzdCL4
         dZfQ==
X-Gm-Message-State: AOAM5311f6WXv0n565zvWBVyrWntfpo3Nh3NTYfoGA/dEwCLbJZILwSI
        tv8JVo0O3nV5yKZp5Rg/jiU=
X-Google-Smtp-Source: ABdhPJw6teg8d3600aqcwAl3vaNViL+OPA1OTluqrSndPwY8rRZZoslAB2OaQcL2R8tFPxD6rsv7Pw==
X-Received: by 2002:ac2:46e1:: with SMTP id q1mr9264724lfo.212.1607356113675;
        Mon, 07 Dec 2020 07:48:33 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id t9sm198271lff.45.2020.12.07.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 07:48:32 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmIlA-0003J3-1U; Mon, 07 Dec 2020 16:49:08 +0100
Date:   Mon, 7 Dec 2020 16:49:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
Message-ID: <X85O9GoDcbiDp97j@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <X841xwCChUEqi5Ad@localhost>
 <73d57fe9fefe50955771846ea52004fb@kernel.org>
 <X85FVc07Hc7LQQU8@localhost>
 <d5fa2065009d5854b4c719003ebcb255@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5fa2065009d5854b4c719003ebcb255@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 07, 2020 at 03:34:23PM +0000, Marc Zyngier wrote:
> On 2020-12-07 15:08, Johan Hovold wrote:
> > On Mon, Dec 07, 2020 at 02:41:03PM +0000, Marc Zyngier wrote:
> >> On 2020-12-07 14:01, Johan Hovold wrote:
> >> > On Fri, Dec 04, 2020 at 04:47:35PM +0000, Marc Zyngier wrote:
> >> >> Having recently tried to use the CBUS GPIOs that come thanks to the
> >> >> ftdio_sio driver, it occurred to me that the driver has a couple of
> >> >> usability issues:
> >> >>
> >> >> - it advertises potential GPIOs that are reserved to other uses (LED
> >> >>   control, or something else)
> >> >
> >> > Consider the alternative, that the gpio offsets (for CBUS0, CBUS1,
> >> > CBUS2
> >> > or CBUS4) varies depending on how the pins have been muxed. Hardly very
> >> > user friendly.
> >> 
> >> That's not what I suggest. If you want fixed GPIO offsets, fine by me.
> >> But telling the user "these are GPIOs you can use", and then
> >> "on second though, you can't" is not exactly consistent.
> > 
> > It's really no different from any other gpio chip which registers all
> > its lines, including those which may have been muxed for other 
> > purposes.
> 
> If they claim that their lines are available, and then refuse to
> let the user play with it, that's just a bug willing to be fixed.

My point was that this is how *all* gpio drivers work, and that muxing
is somewhat orthogonal to the gpio controller implementation.

Not sure how you would even "fix" that since muxing can often be changed
at runtime while the number of lines is typically a hardware feature
(which we report to the user). The resource is still there but it may
not be available for use.

> >> >> - it returns an odd error (-ENODEV), instead of the expected -EINVAL
> >> >>   when a line is unavailable, leading to a difficult diagnostic
> >> >
> >> > Hmm, maybe. Several gpio driver return -ENODEV when trying to request
> >> > reserved pins. Even gpiolib returns -ENODEV when a pins is not yet
> >> > available due to probe deferal.
> >> 
> >> -ENODEV really means "no GPIOchip" in this context. The fact that
> >> other drivers return -ENODEV for reserved pins looks like a bug to me.
> > 
> > No, the chip is there. The -ENODEV is what you get when requesting the
> > line, because the line isn't available.
> 
> I still believe that ENODEV is the wrong error. The device is there,
> but the request is invalid because the line is used by something else.
> EINVAL, EBUSY, ENXIO would all be (sort of) OK.

Fair enough.

> >> > -EBUSY could also be an alternative, but that's used to indicate that a
> >> > line is already in use as a gpio.
> >> 
> >> Or something else. Which is exactly the case, as it's been allocated
> >> to another function.
> > 
> > Right, there are invalid requests (e.g. requesting line five of a four
> > line chip), lines that are already in use, and lines not available due
> > to muxing.
> > 
> > And then there's the question of whether to use the same or distinct
> > errnos for these. I believe using distinct errnos provides more
> > feedback, but we can certainly pick another errno for this if it's
> > really that confusing.
> 
> Fundamentally, I don't think the backend driver should be in charge
> of the error reporting. That should be the char device's job. Leaving it
> to the individual drivers is a sure way to have an inconsistent API.

I agree, and your valid-mask approach takes care of the static mux-
configuration case nicely.

Johan
