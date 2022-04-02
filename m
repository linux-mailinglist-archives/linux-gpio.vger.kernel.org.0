Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787E64EFDD3
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 03:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbiDBBrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 21:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiDBBrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 21:47:31 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC541017E9
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 18:45:40 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h19so4167520pfv.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2022 18:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NbEuLQTSEBPwriUeOY3Nukb3jb34Ybgxmz0RIemm5pE=;
        b=eKEh6NeasY3C0n0e3RYAssbRGa/+vcMIooiF6VBMybs38BYApoJvu6Bc3dRm5/Ochn
         mhhovi8VjLt42ydY/7nzA24h1WXbHFWVkyYussG3jfYxxQy0qWoPAN/4dNyoIDgTFhgt
         cjjNQlaCm7naLSy7ooPs1E9P4jcJEwFvwXf8IpTie7ysXAg7V2tJ4paJY6unGSHlUgdx
         sslGaKLpvJi8Yf2Bx5VGEbXYD2PRGQwPMpSuCcbRAa6NmAltON6J40l/mDu9VnTQzMsl
         9rkEwEN8m4EZPaRSvna5g5Wkjr7Gan2bDi7Gw8vYrTR/ZpJI0BJvrs4JfETncdLx9czx
         JPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NbEuLQTSEBPwriUeOY3Nukb3jb34Ybgxmz0RIemm5pE=;
        b=w/hFaMV6VY1wnDi3242DScWK4zEOZGWEWo6paF8lPAj62Iz7EnCS9Jf3TN2W0Iu0rR
         Oqc+Ia99pKa2iYetNXCwh8bKis1Z21qmFmZeAcG8tTB5UKHiCgL6hUoaAPrqwUE4s9ar
         PZqfEGnzSAGmQt4BpxbG2VHh4GqC6nVvllPubnla4PVD1/bypIepsjo4Fj7gXpHVrD8B
         Qwjoe3E1tEBeyzsU5H38x20A6mcR0ZEx1R6S6BRj3QiM9LhhrOslk6TqsOznZv1RUvGg
         zYWcWlPNET+65I4Bo7rmESKeBupXAu56fy3P3fv81gQaClBBk85numvASJ0xi/DHFEjJ
         Onjg==
X-Gm-Message-State: AOAM530Adua2QDlv/cX+fS2ePIazmviZ7xqKIhuAFXYyanY7ye1ichhu
        Jcr5iGb3IXLJ/lcAhdiQMyE=
X-Google-Smtp-Source: ABdhPJzIin9/bOqPkbzWkIQWqvT9e2epDrxbGbIQCBQSW++g9Ftm6RTwMpaWD8aC1PZjnk1mfwhbDA==
X-Received: by 2002:a05:6a00:338e:b0:4fa:9015:af50 with SMTP id cm14-20020a056a00338e00b004fa9015af50mr13677911pfb.57.1648863939398;
        Fri, 01 Apr 2022 18:45:39 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id 75-20020a62144e000000b004fae56c42a0sm4322961pfu.211.2022.04.01.18.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 18:45:38 -0700 (PDT)
Date:   Sat, 2 Apr 2022 09:45:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, thomas.petazzoni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220402014533.GB7939@sol>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <YkXiq995Xb+1Quq8@smile.fi.intel.com>
 <20220401000837.GA4938@sol>
 <YkbXLgeodeQtmGS9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkbXLgeodeQtmGS9@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 01, 2022 at 01:42:54PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 01, 2022 at 08:08:37AM +0800, Kent Gibson wrote:
> > On Thu, Mar 31, 2022 at 08:19:39PM +0300, Andy Shevchenko wrote:
> > > On Thu, Mar 31, 2022 at 10:15:24PM +0800, Kent Gibson wrote:
> > > > On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> > > > > > It has recently come to my attention that the setting of bias by the
> > > > > > cdev uAPI is a best effort operation that quietly succeeds if bias is
> > > > > > not supported by the hardware. That strikes me as being a bug.
> > > > > > It seems I was aware of this when adding bias to the uAPI and intended
> > > > > > to fix it, as shown in the comments of v4 of the corrsponding patch
> > > > > > series[1]:
> > > > > 
> > > > > > > > The setting of bias is performed by gpio_set_bias, which is hooked into
> > > > > > > > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > > > > > > > of bias that was already present in gpiod_direction_input.
> > > > > > > > In keeping with the existing behaviour, the bias is set on a best-effort
> > > > > > > > basis - no error is returned to the user if an error is returned by the
> > > > > > > > pinctrl driver.  Returning an error makes sense to me, particularly for
> > > > > > > > the uAPI, but that conflicts with the existing gpiod_direction_input
> > > > > > > > behaviour. So leave as best-effort, change gpiod_direction_input
> > > > > > > > behaviour, or restructure to support both behaviours?
> > > > > > 
> > > > > > > Thomas: is there any reason not to check the return value of these
> > > > > > > calls for errors other than -EOPNOTSUPP?
> > > > > > 
> > > > > > that being my comment, and Bart's followup question to Thomas.
> > > > > > 
> > > > > > That went unanswered AFAICT and the issue subsequently fell through the
> > > > > > cracks.
> > > > > 
> > > > > My understanding that all constraints we have in kernel is due to
> > > > > in-kernel use and possible (non-critical) issues.
> > > > > 
> > > > > For example, driver can set only selected values of bias. What to do when
> > > > > the given value is not supported by hardware?
> > > > > 
> > > > > Followup question: Why do you think your choice is any better than another
> > > > > one?
> > > > > 
> > > > 
> > > > I'm probably missing your point here.
> > > > 
> > > > What makes gpiolib best placed to decide that bias not being supported
> > > > by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> > > > caller and let them decide?
> > > 
> > > First of all, ENOTSUPP may not be sent to user, it's wrong error code.
> > > The returning any other error code make behaviour for the _very same_
> > > GPIO line _different_ when it being configured in kernel (via firmware)
> > > and user space. That's unacceptable. So, it means we have to have
> > > synchronized behaviour, means either error in both case or ignoring it.
> > > The latter one is current state of affairs, the former might break the
> > > cases where driver and firmware are not synchronized well.
> > > 
> > 
> > First of all, I was referring to in-kernel users of gpiolib, so gpiolib
> > would propagate ENOTSUPP.  You will note I said "caller", not "user"
> > to try to emphasise that point.
> > cdev, being the caller here, would translate the ENOTSUPP to EOPNOTSUPP
> > for user space consumption.
> 
> Ah, okay!
> 
> > But back to the point...
> > Are you saying that user space should not be given an error if bias is
> > not supported as it was already decided by gpiolib that the kernel
> > driver wouldn't be given one?
> > That makes no sense to me, so I'm probably missing something.
> > Can you clarify?
> 
> I think that deviating of the behaviour would confuse some.
> Why the configuration of the very same line described in DT
> and used in user space will behave differently?
> 

Ok, you are looking at the uAPI using a DT lens.
How many users would be using both DT and uAPI?
If the bias is already set via DT why set it again via uAPI?

The more likely use case is that users don't know anything about
DT, and are surprised to find that bias doesn't work - despite 
the uAPI accepting bias settings without complaint.

> > What I read from your answer is "that's the way it is".
> > I get that, but was after why.
> > I don't see dropping errors as a way to get anything in sync.
> > Quite the opposite - it ensures we can never tell if they are.
> > 
> > If the original problem was that there are two possible causes for
> > ENOTSUPP, and one of them is critical and one is not, then the solution
> > should be to split the functionality into separate calls, not just drop
> > the error from the "non-critical" one.  Again, gpiolib has no business
> > in that criticality decision, IMHO. And again when I say gpiolib here
> > I mean the core - gpiolib.c.
> 
> I got your point. But to me it is a way of breaking the prototyping and
> actual product. If you strict at prototyping and reuse same DT(b) over
> several generations of the platform, some of them (due to subtle hardware
> differences) may ignore errors (due to in-kernel behaviour) while during
> prototyping that was strict.
> 

I understand why you want application of pin description from DT to be
best-effort - I was unsure why that was done in gpiod_direction_input().
But Hans got me over that hump.

> The best approach here is to add a new IOCTL "enable extended error reporting"
> or alike and expect all of GPIO ABI calls to fail. In such case it won't
> alter status quo, not break ABI.
> 

Agreed, although I'm thinking a flag in the gpio_v2_line_request rather
than a new ioctl.  Or maybe in gpio_v2_line_config.

Thanks for the assistance - much appreciated.

Cheers,
Kent.

> > > > Is it because setting bias is piggy-backed onto
> > > > gpiod_direction_input() rather than being separate, so then you can't
> > > > tell whether it is input or bias that is not supported?
> > > > 
> > > > Anyway, if that interface is required for internal use then there is no
> > > > option but to refactor gpiod_direction_input() and provide an alternate
> > > > interface so that cdev can determine if bias is supported or not.
> > > 
> > > > > > I would like to fix the uAPI such that if the hardware does not support
> > > > > > the requested configuration, or if it can't be emulated in the kernel,
> > > > > > that fact is returned to userspace - bias being the sole counter example
> > > > > > as far as I am aware.
> > > > > > 
> > > > > > The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> > > > > > rather than gpio_set_config_with_argument_optional(), but as mentioned in
> > > > > > my comment above, that would impact any existing users of
> > > > > > gpiod_direction_input() that assume the best-effort behaviour.
> > > > > 
> > > > > Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> > > > > the best form the hardware driver.
> > > > > 
> > > > > > I haven't been able to find any such usage, but that could just be proof
> > > > > > that I'm not looking in the right place.
> > > > > > Any input on that front would be greatly appreciated.
> > > > > > 
> > > > > > Also, fixing this as mentioned could be considered an uAPI ABI change.
> > > > > > Is this a bug, so that is ok, or do I need to consider adding a strict
> > > > > > mode flag or somesuch to the API?
> > > > > > 
> > > > > > Bart, I'm also hoping to extend the gpiosim to optionally not support
> > > > > > bias in gc->set_config() to test this case.
> > > > > > Any suggstions on a configfs interface extension to do that?
> > > > > > 
> > > > > > My apologies for the verbage rather than proffering a patch, but the
> > > > > > different paths have vastly different costs, and the simplest solution
> > > > > > has the potential to introduce breakage.
> > > > > 
> > > > > > [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
> > > 
> > > -- 
> > > With Best Regards,
> > > Andy Shevchenko
> > > 
> > > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
