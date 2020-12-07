Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAAF2D143E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgLGPBV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:01:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:53594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgLGPBU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 10:01:20 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 090A023609;
        Mon,  7 Dec 2020 15:00:40 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kmI0D-00Gn5p-5k; Mon, 07 Dec 2020 15:00:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Dec 2020 15:00:37 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
In-Reply-To: <X848LXNv3GRmmSXA@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-4-maz@kernel.org> <X848LXNv3GRmmSXA@localhost>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <02b461244a33d5eb0620cfaa13c2b03e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: johan@kernel.org, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, gregkh@linuxfoundation.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-12-07 14:29, Johan Hovold wrote:
> On Fri, Dec 04, 2020 at 04:47:38PM +0000, Marc Zyngier wrote:
>> The validity of the ftdi CBUS GPIO is pretty hidden so far,
>> and finding out *why* some GPIOs don't work is sometimes
>> hard to identify. So let's help the user by displaying the
>> map of the CBUS pins that are valid for a GPIO.
>> 
>> Also, tell the user about the magic ftx-prog tool that can
>> make GPIOs appear: https://github.com/richardeoin/ftx-prog
>> 
>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/usb/serial/ftdi_sio.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/usb/serial/ftdi_sio.c 
>> b/drivers/usb/serial/ftdi_sio.c
>> index 13e575f16bcd..b9d3b33891fc 100644
>> --- a/drivers/usb/serial/ftdi_sio.c
>> +++ b/drivers/usb/serial/ftdi_sio.c
>> @@ -2012,6 +2012,15 @@ static int ftdi_gpio_init_valid_mask(struct 
>> gpio_chip *gc,
>> 
>>  	bitmap_complement(valid_mask, &map, ngpios);
>> 
>> +	if (bitmap_empty(valid_mask, ngpios))
>> +		dev_warn(&port->dev, "No usable GPIO\n");
> 
> This isn't an error of any kind, and certainly not something that
> deserves a warning in the system log on every probe. Not everyone cares
> about the GPIO interface.
> 
>> +	else
>> +		dev_info(&port->dev, "Enabling CBUS%*pbl for GPIO\n",
>> +			 ngpios, valid_mask);
> 
> And while printing this mask has some worth I'm still reluctant to be
> spamming the logs with it. Just like gpolib has a dev_dbg() for
> registering chips, this should probably be demoted to KERN_DEBUG as
> well.
> 
>> +
>> +	if (!bitmap_full(valid_mask, ngpios))
>> +		dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog 
>> to enable GPIOs if required\n");
>> +
> 
> And again, this is not something that belongs in the logs of just about
> every system with an attached ftdi device.

Fine by me, this patch can be dropped without issue. After all,
I now know how to deal with these chips.

> While not possible to combine with the valid_mask approach, this is
> something which we could otherwise add to the request() callback for 
> the
> first request that fails due to the mux configuration.

That was Linus' initial suggestion. But I think a consistent user
API is more important than free advise in the kernel log.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
