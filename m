Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80274EFDD2
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 03:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbiDBBrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 21:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiDBBrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 21:47:08 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540884F456
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 18:45:17 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id b130so3619009pga.13
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2022 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E4yV3u/lXGiKBYwekHqzwaf0vb4SH9EedonLarl1AuQ=;
        b=BVNztRylWraA+GPIuDhtDy6aVGpYzGnxB8ukvN9TbdAeSY9kzUwi/luZ1/SvgsPem6
         kWgYRx9kJ7u2rqibtyhRriW36vw80WWoaPMM6C4gYwiXl2RZp8eu9wAz5Hv3f3wpQo2L
         WtAhl3LbsotWWDitbgQDrvQ5pacgam/MeKJcyI3mh9xwG7im0eAFzXrO89om7G5o5Auh
         PHDo9YcBLgcz6C2FFahk+br7sAVa7fWiyAFl2g/WMZp9h4i7HPvpO78cVaXrsHV1lxwJ
         z7YuHAHsd9V1iVfyDxUBlEIIrJc+baNje2kFvmh3vf884VhQLCoSwh+dBaI5K6QPx/gz
         1qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E4yV3u/lXGiKBYwekHqzwaf0vb4SH9EedonLarl1AuQ=;
        b=4gCaXIACyAT7V2vZYzZdaRRtTqI24ja77JFBDOkPaoaOLLCatMmQwP7c4flFmfQZEd
         zBXbnYPyXNPOPDf+d+N5EWkIxRhf8QE+rQ60iWMP4B7+OlaM/+ra+kBRaphbfR4H0E4K
         CRuJWE76TIEaCfw2Wq4qZBI/qtbawelb8Rbc1/ipGVl4gWmyALPuwdDN6550rhckKdPI
         Xq4ueAghBxglP4TMiiBWgdpKtcFUaU5BDZVYqqkRqc52+cN2m8J3TqknMCXQhXPdshjs
         9rij/+ahXVl9FKz0FLEfTf1GxqDMrkupgtrQi57lOxxhzLtnZ0JWKRgjYuzQE+Kxj0D4
         lWkA==
X-Gm-Message-State: AOAM531gRVvlDaR2eblXICLOUIJkJkuL5BcrPLht3v7gHYwNfsc8eEg7
        h+o1d5DDVDlAKftRQL3ougo=
X-Google-Smtp-Source: ABdhPJw75I9nOKYejRMCh/HQzcxN5bxecXmlG648GWcLmk1bW0ltkniFrvYuRhlfqPo6Z8wI2qZkMw==
X-Received: by 2002:a05:6a00:1887:b0:4fd:afdf:5862 with SMTP id x7-20020a056a00188700b004fdafdf5862mr11999633pfh.13.1648863916660;
        Fri, 01 Apr 2022 18:45:16 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id r4-20020a638f44000000b0038105776895sm3433745pgn.76.2022.04.01.18.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 18:45:15 -0700 (PDT)
Date:   Sat, 2 Apr 2022 09:45:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        thomas.petazzoni@bootlin.com, linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220402014510.GA7939@sol>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 01, 2022 at 12:36:57PM +0200, Hans de Goede wrote:
> Hi Kent,
> 
> On 3/31/22 16:15, Kent Gibson wrote:
> > On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> >> On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> >>> Hi all,
> >>
> >> +Cc: Hans
> >>
> >>> It has recently come to my attention that the setting of bias by the
> >>> cdev uAPI is a best effort operation that quietly succeeds if bias is
> >>> not supported by the hardware. That strikes me as being a bug.
> >>> It seems I was aware of this when adding bias to the uAPI and intended
> >>> to fix it, as shown in the comments of v4 of the corrsponding patch
> >>> series[1]:
> >>
> >>>>> The setting of bias is performed by gpio_set_bias, which is hooked into
> >>>>> gpiod_direction_input and gpiod_direction_output.  It extends the setting
> >>>>> of bias that was already present in gpiod_direction_input.
> >>>>> In keeping with the existing behaviour, the bias is set on a best-effort
> >>>>> basis - no error is returned to the user if an error is returned by the
> >>>>> pinctrl driver.  Returning an error makes sense to me, particularly for
> >>>>> the uAPI, but that conflicts with the existing gpiod_direction_input
> >>>>> behaviour. So leave as best-effort, change gpiod_direction_input
> >>>>> behaviour, or restructure to support both behaviours?
> >>>
> >>>> Thomas: is there any reason not to check the return value of these
> >>>> calls for errors other than -EOPNOTSUPP?
> >>>
> >>> that being my comment, and Bart's followup question to Thomas.
> >>>
> >>> That went unanswered AFAICT and the issue subsequently fell through the
> >>> cracks.
> >>
> >> My understanding that all constraints we have in kernel is due to
> >> in-kernel use and possible (non-critical) issues.
> >>
> >> For example, driver can set only selected values of bias. What to do when
> >> the given value is not supported by hardware?
> >>
> >> Followup question: Why do you think your choice is any better than another
> >> one?
> >>
> > 
> > I'm probably missing your point here.
> > 
> > What makes gpiolib best placed to decide that bias not being supported
> > by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> > caller and let them decide?
> > 
> > Is it because setting bias is piggy-backed onto
> > gpiod_direction_input() rather than being separate, so then you can't
> > tell whether it is input or bias that is not supported?
> 
> Right, gpiod_direction_input() check if there is a bias described for
> the pin in the firmware description of the pin (devicetree or ACPI) and
> those might contain a bias setting even if the pinctrl/gpio chip is not
> capable of it (and instead it is actually e.g. applied by external
> resistors on the PCB).
> 

So the pin description may extend beyond the gpio chip itself, and
describe part of the external circuit?
Ok, hadn't considered that a possibility.

> The idea behind this is to make things just work for most
> drivers using/consuming GPIOS without the drivers needing to know
> about the firmware description details.
> 
> To make sure this actually just works and does not cause drivers
> to see unexpected (and usually not a problem) errors the ENOTSUPP
> error from the set bias call is not propagated from
> gpiod_direction_input().
> 

Ok, just to make sure I have this straight:

The drivers get their pin description from devicetree or ACPI and
then apply it using gpiod_direction_input() or gpiod_direction_output(),
as appropriate.

The gpiod_direction_input() was leveraged to do that, rather than having
to extend the gpiolib API and change all the drivers, as drivers were
already using it.

The application of the pin description, specifically the bias aspect,
is best-effort as the pin description may not match the capabilities of
the hardware, or more precisely the pinctrl.  The driver is acting as
the middleman between the source of the pin description and
gpiolib/pinctrl, and so wouldn't know how to deal with any inconsistency,
so gpiod_direction_input() suppresses the error.

> 
> > Anyway, if that interface is required for internal use then there is no
> > option but to refactor gpiod_direction_input() and provide an alternate
> > interface so that cdev can determine if bias is supported or not.
> 
> I'm not very familiar with the cdev userspace API, but I think
> that that is correct.
> 
> Assuming the cdev userspace API has separate set-direction and set-bias
> calls then I would expect the set-direction calls to work as the in
> kernel one does, so try to apply any bias from the firmware pin
> description, but ignore ENOTSUPP errors.
> 
> Although I guess in most (all probably even?) cases since we just
> get a GPIO-chip + hw-index there is no firmware pin-description in
> the cdev uapi case.
> 
> Where as explicit set_bias calls should indeed probably not ignore
> the ENOTSUPP error.
> 

In fact the uAPI doesn't have separate calls.  The user effectively
creates their own pin description and that is applied with a single
ioctl call - which results in a call to gpiod_direction_input().

The current problem is that users can request bias and then be surprised
to find that it doesn't work on their platform - despite the uAPI
accepting the bias setting without complaint.

> I do wonder though if such a change would not consider
> breakage of existing userspace, esp. on popular boards like
> the raspberry pi where there is a lot of existing code
> poking the GPIOs from userspace.
> 

I've wondered the same.
It would only be breakage for cases where platforms don't actually
support bias, but users were assuming that it does.
The RPi supports bias (when adding bias to the uAPI I explicitly did
testing on RPis), so it wouldn't be a problem there.
OTOH, I can't say how many other platforms it could cause breakage on.

Probably best to extend the uAPI to add a strict mode and leave
existing usage unchanged.

> As long as you don't actually change the function prototype
> of gpiod_direction_input() making changes for this should be
> fine. You can rename the original function to something else
> and give it an extra flag, or split it in 2 functions or some
> such + use a wrapper with the old name. But having to modify
> all callers for this would be bad IMHO.
> 

Agreed - refactoring and providing a wrapper for existing usage looks
the way to go.  I was hoping to avoid that, to avoid having to find a
name for that new function, as naming is always the hardest part.

Thanks for your assistance - much appreciated.

Cheers,
Kent.

> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 
> > 
> > Cheers,
> > Kent.
> > 
> >>> I would like to fix the uAPI such that if the hardware does not support
> >>> the requested configuration, or if it can't be emulated in the kernel,
> >>> that fact is returned to userspace - bias being the sole counter example
> >>> as far as I am aware.
> >>>
> >>> The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> >>> rather than gpio_set_config_with_argument_optional(), but as mentioned in
> >>> my comment above, that would impact any existing users of
> >>> gpiod_direction_input() that assume the best-effort behaviour.
> >>
> >> Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> >> the best form the hardware driver.
> >>
> >>> I haven't been able to find any such usage, but that could just be proof
> >>> that I'm not looking in the right place.
> >>> Any input on that front would be greatly appreciated.
> >>>
> >>> Also, fixing this as mentioned could be considered an uAPI ABI change.
> >>> Is this a bug, so that is ok, or do I need to consider adding a strict
> >>> mode flag or somesuch to the API?
> >>>
> >>> Bart, I'm also hoping to extend the gpiosim to optionally not support
> >>> bias in gc->set_config() to test this case.
> >>> Any suggstions on a configfs interface extension to do that?
> >>>
> >>> My apologies for the verbage rather than proffering a patch, but the
> >>> different paths have vastly different costs, and the simplest solution
> >>> has the potential to introduce breakage.
> >>
> >>> [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
> >>
> >> -- 
> >> With Best Regards,
> >> Andy Shevchenko
> >>
> >>
> > 
> 
