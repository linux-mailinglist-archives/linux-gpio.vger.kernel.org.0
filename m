Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398892D14D6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgLGPfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:35:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:37636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgLGPfH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 10:35:07 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A5C623730;
        Mon,  7 Dec 2020 15:34:27 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kmIWt-00GnSK-En; Mon, 07 Dec 2020 15:34:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Dec 2020 15:34:23 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
In-Reply-To: <X85FVc07Hc7LQQU8@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <X841xwCChUEqi5Ad@localhost> <73d57fe9fefe50955771846ea52004fb@kernel.org>
 <X85FVc07Hc7LQQU8@localhost>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d5fa2065009d5854b4c719003ebcb255@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: johan@kernel.org, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, gregkh@linuxfoundation.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-12-07 15:08, Johan Hovold wrote:
> On Mon, Dec 07, 2020 at 02:41:03PM +0000, Marc Zyngier wrote:
>> On 2020-12-07 14:01, Johan Hovold wrote:
>> > On Fri, Dec 04, 2020 at 04:47:35PM +0000, Marc Zyngier wrote:
>> >> Having recently tried to use the CBUS GPIOs that come thanks to the
>> >> ftdio_sio driver, it occurred to me that the driver has a couple of
>> >> usability issues:
>> >>
>> >> - it advertises potential GPIOs that are reserved to other uses (LED
>> >>   control, or something else)
>> >
>> > Consider the alternative, that the gpio offsets (for CBUS0, CBUS1,
>> > CBUS2
>> > or CBUS4) varies depending on how the pins have been muxed. Hardly very
>> > user friendly.
>> 
>> That's not what I suggest. If you want fixed GPIO offsets, fine by me.
>> But telling the user "these are GPIOs you can use", and then
>> "on second though, you can't" is not exactly consistent.
> 
> It's really no different from any other gpio chip which registers all
> its lines, including those which may have been muxed for other 
> purposes.

If they claim that their lines are available, and then refuse to
let the user play with it, that's just a bug willing to be fixed.

>> >> - it returns an odd error (-ENODEV), instead of the expected -EINVAL
>> >>   when a line is unavailable, leading to a difficult diagnostic
>> >
>> > Hmm, maybe. Several gpio driver return -ENODEV when trying to request
>> > reserved pins. Even gpiolib returns -ENODEV when a pins is not yet
>> > available due to probe deferal.
>> 
>> -ENODEV really means "no GPIOchip" in this context. The fact that
>> other drivers return -ENODEV for reserved pins looks like a bug to me.
> 
> No, the chip is there. The -ENODEV is what you get when requesting the
> line, because the line isn't available.

I still believe that ENODEV is the wrong error. The device is there,
but the request is invalid because the line is used by something else.
EINVAL, EBUSY, ENXIO would all be (sort of) OK.

> 
>> > -EBUSY could also be an alternative, but that's used to indicate that a
>> > line is already in use as a gpio.
>> 
>> Or something else. Which is exactly the case, as it's been allocated
>> to another function.
> 
> Right, there are invalid requests (e.g. requesting line five of a four
> line chip), lines that are already in use, and lines not available due
> to muxing.
> 
> And then there's the question of whether to use the same or distinct
> errnos for these. I believe using distinct errnos provides more
> feedback, but we can certainly pick another errno for this if it's
> really that confusing.

Fundamentally, I don't think the backend driver should be in charge
of the error reporting. That should be the char device's job. Leaving it
to the individual drivers is a sure way to have an inconsistent API.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
