Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C5A1BD1DE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 03:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgD2BtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 21:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgD2BtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 21:49:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036C9C03C1AC;
        Tue, 28 Apr 2020 18:49:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a7so118076pju.2;
        Tue, 28 Apr 2020 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=22eR4GeH3uLJlI6EyUusNoLtYlyLvJrEBzI+5e5O1cw=;
        b=WIN7jVEV808IqqMcqpSXxDCSGrCRXffL5pZzufSgXZgAFSsYZXLp0+rqaIPOd5iKvl
         GfhjkS0EwNWLUmtba4brlcz3tN87rABZ+7cRgEll0L9Q//mZQEgfg751hu8lcjIQu3YL
         aXt9ym5yHrKo0d8p//MlnnRj5lIi5/i5yWgSKZGYyXw06lXWM/Zut8i3GrS6oUs9720t
         wxBCYr4R6ef6J18POW7vK6F/QjvFxjssp9ZK94AgJuhcN8LfE3s1gsm88bIvhU+LIxhL
         OFqwTjT8vQ9yCZ9A6nJMeM8s1mp2XN0tq7bb+JAmJRcXJ5V3cfcgtv4D6kXlaS4apvEH
         q/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=22eR4GeH3uLJlI6EyUusNoLtYlyLvJrEBzI+5e5O1cw=;
        b=XBlJcxcxodJCIylB6lUIeu0Bcs1LccP8ju1oNExq++MxVE3tsJrnfCbhkerW7gzbG7
         tgU21E0KgvY2G0+eKH/Mdddw14shS/mg3ZwpjS4rt+Jskc4uvfN1EF7BlOg3rut2Z0b2
         opjMhXNYdNND4gDBDrnz+nQYJawKG/TFR0GLhaaRlwyyN+s8PPeKEJRGRbvux3qkOgra
         GgzeSsM6yVhFfxhPqVvIuHIiH/mj31AgLULOVSzhGX7Kz/wmh8ddyFPQ4akJSGD6iFDp
         EZJMg2ZgWtYwsghOS0pZgRLuqcriTH5S9NO9+gNRgTZJDp0z2g9dfFEaL6OGQDG/SETP
         QB/Q==
X-Gm-Message-State: AGi0PuZQTJaPG8Ln5XKslvXAnKxQCGbgdIj0+Ig1LUw93+Hf083L0lUx
        Ty6xCMeLPZRhHO0iOxhl7SY=
X-Google-Smtp-Source: APiQypJYYbb2EATmnroUCi9Ji83jutPLj85KYGVskHmQTMsVQJxBP6Do7jK4EHvPJa2w0mbVvDo6wg==
X-Received: by 2002:a17:90a:24e7:: with SMTP id i94mr336101pje.117.1588124964359;
        Tue, 28 Apr 2020 18:49:24 -0700 (PDT)
Received: from sol (220-235-85-217.dyn.iinet.net.au. [220.235.85.217])
        by smtp.gmail.com with ESMTPSA id z190sm16336762pfz.84.2020.04.28.18.49.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 18:49:23 -0700 (PDT)
Date:   Wed, 29 Apr 2020 09:49:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hector Bujanda <hector.bujanda@digi.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200429014917.GA11974@sol>
References: <20200419002220.105338-1-hector.bujanda@digi.com>
 <CACRpkdZgkKG04=MmRLjepYY+trGY3fQCx49iFk9aTC4axfaMyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZgkKG04=MmRLjepYY+trGY3fQCx49iFk9aTC4axfaMyw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 12:35:05PM +0200, Linus Walleij wrote:
> Hi Hector,
> 
> thanks for your patch!
> 
> On Sun, Apr 19, 2020 at 2:22 AM Hector Bujanda <hector.bujanda@digi.com> wrote:
> 
> > This allows calling gpiod_set_debounce function through char device ioctl.
> >
> > Signed-off-by: Hector Bujanda <hector.bujanda@digi.com>
> 
> (...)
> > +/**
> > + * struct gpioline_debounce - GPIO line debounce
> > + * @line_offset: the local offset on this GPIO device, fill this in when
> > + * requesting the line information from the kernel
> > + * @debounce_usec: debounce in uSeconds to set for this line
> > + */
> > +struct gpioline_debounce {
> > +       __u32 line_offset;
> > +       __u32 debounce_usec;
> > +};
> (...)
> > @@ -154,5 +165,6 @@ struct gpioevent_data {
> >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
> > +#define GPIO_SET_DEBOUNCE_IOCTL _IOW(0xB4, 0x05, struct gpioline_debounce)
> 
> Please do not define a new ioctl for this: since of commit
> e588bb1eae31be73fbec2b731be986a7c09635a4
> "gpio: add new SET_CONFIG ioctl() to gpio chardev"
> by Kent Gibson we have this:
> 
> /**
>  * struct gpiohandle_config - Configuration for a GPIO handle request
>  * @flags: updated flags for the requested GPIO lines, such as
>  * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
>  * together
>  * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set in flags,
>  * this specifies the default output value, should be 0 (low) or
>  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
>  * @padding: reserved for future use and should be zero filled
>  */
> struct gpiohandle_config {
>         __u32 flags;
>         __u8 default_values[GPIOHANDLES_MAX];
>         __u32 padding[4]; /* padding for future use */
> };
> 
> #define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
> 
> Setting debounce is just another type of config, so please use Kent's
> work as a base for this.
> 

A few things you might want to keep in mind:

For ABI backward compatibility, a zeroed field should be treated as "don't change".
As a 0 is also used to disable debounce you are going to need a flag
indicating whether the debounce field is present.  I don't think that can
be added to the flags field, as those values are shared with the
gpiohandle_request, but I could well be wrong on that (maybe it can just
be ignored in the request case??).

You might want to add a flag to the GPIOLINE_FLAGs to indicate if
debounce is set.

The GPIOHANDLE_SET_CONFIG_IOCTL/gpiohandle_config only applies to 
gpiohandle_requests, so it does not provide a means to set debounce for 
gpioevent_requests, and you really want debounce for those, right?
I would extend that ioctl to the gpioevent_requests, but I would run it
past Bart or LinusW first - they may have better ideas.

Cheers,
Kent.
