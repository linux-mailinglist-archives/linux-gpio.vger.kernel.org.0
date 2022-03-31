Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672394EDB89
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 16:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbiCaORU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 10:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbiCaORU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 10:17:20 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32305BE42
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 07:15:32 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c23so23564250plo.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C8PcRhKBroNNXRWj5Lky/+b7rZaa83pLFzOiszpXX5s=;
        b=eiOQqvngd5Do1t+PB9JVdbxMSECk1JZz1V0PWe1Bpwc4O7WJxA8kj6j75wgoJ2q7rR
         gNuyYyXzgCc1bhit/9H+/bhnJa2e1z8wheNSqLxbwJZmGp4dpDPPlQhefvZvQdJ0POuX
         ZxP6UMis/LO+oiEoL+zm17PZcDPnyKmoO8p2/+cR2SdjAd2BrrO1r+4iOmTC5Xjrj9QT
         ps03GoNPnoH8gh3fgLQ9Bb5KSedVOraG+Not/BEC6CC82PJAunHmE0xUldwcakOc1ybi
         hSStsIro3IwyTr7rWcVCfUEdCLg/AEmzK6uQBEpCV+eCO2GHXRVc4WXJOerYPm0jhQ4E
         MSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C8PcRhKBroNNXRWj5Lky/+b7rZaa83pLFzOiszpXX5s=;
        b=aHQXRQDV+2Lkq7K81DrNBKNCeUwt1kv2UQrB9V5SbhvsYp1j6jdJfFDKQumkuhlv/8
         58j0pWurIzqXRop4w4NfHPeB7MNune3fb9ehGNJD+KNSkb0XdBr7X2j7xIntSdu7tnJY
         OPbjYmDc6noEZobuS+HnUUeod6oa7yZSolNUK6V2mFhBrSmcKvjG7PpCl06Oc3n/DwEB
         u+txr2t5BurSYLiwyBOrY+djU1lrSK97HBq+E4LWVyekWYeeFzrc7HqWcUgHjUh/dWfR
         Y5SR1Z/cGSG2HvSJsEqdHtHNFIHm2LZvHcxKmndjjbAO9McIm89GbfbENxmTy86aEDQd
         7fyA==
X-Gm-Message-State: AOAM530WmRrx9Uli2Rtx1zNd0Zay8uTmQ4M46vbXz5y3P/NkoYJKLze2
        O+f0qgptOt/fVMT1uuC5XQc=
X-Google-Smtp-Source: ABdhPJyNBuc5AtReagzzMzVQEADctSFKFsgirOWPHnCVzY45GlUzn61Jql9LhTqvxGAEJIBDOsKqXA==
X-Received: by 2002:a17:90a:2c0c:b0:1b9:fa47:1caf with SMTP id m12-20020a17090a2c0c00b001b9fa471cafmr6431030pjd.34.1648736132323;
        Thu, 31 Mar 2022 07:15:32 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id d18-20020a056a0010d200b004fa2e13ce80sm29276731pfu.76.2022.03.31.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 07:15:31 -0700 (PDT)
Date:   Thu, 31 Mar 2022 22:15:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, thomas.petazzoni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220331141524.GA93836@sol>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkWyU8seDqyDL532@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> > Hi all,
> 
> +Cc: Hans
> 
> > It has recently come to my attention that the setting of bias by the
> > cdev uAPI is a best effort operation that quietly succeeds if bias is
> > not supported by the hardware. That strikes me as being a bug.
> > It seems I was aware of this when adding bias to the uAPI and intended
> > to fix it, as shown in the comments of v4 of the corrsponding patch
> > series[1]:
> 
> > > > The setting of bias is performed by gpio_set_bias, which is hooked into
> > > > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > > > of bias that was already present in gpiod_direction_input.
> > > > In keeping with the existing behaviour, the bias is set on a best-effort
> > > > basis - no error is returned to the user if an error is returned by the
> > > > pinctrl driver.  Returning an error makes sense to me, particularly for
> > > > the uAPI, but that conflicts with the existing gpiod_direction_input
> > > > behaviour. So leave as best-effort, change gpiod_direction_input
> > > > behaviour, or restructure to support both behaviours?
> > 
> > > Thomas: is there any reason not to check the return value of these
> > > calls for errors other than -EOPNOTSUPP?
> > 
> > that being my comment, and Bart's followup question to Thomas.
> > 
> > That went unanswered AFAICT and the issue subsequently fell through the
> > cracks.
> 
> My understanding that all constraints we have in kernel is due to
> in-kernel use and possible (non-critical) issues.
> 
> For example, driver can set only selected values of bias. What to do when
> the given value is not supported by hardware?
> 
> Followup question: Why do you think your choice is any better than another
> one?
> 

I'm probably missing your point here.

What makes gpiolib best placed to decide that bias not being supported
by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
caller and let them decide?

Is it because setting bias is piggy-backed onto
gpiod_direction_input() rather than being separate, so then you can't
tell whether it is input or bias that is not supported?

Anyway, if that interface is required for internal use then there is no
option but to refactor gpiod_direction_input() and provide an alternate
interface so that cdev can determine if bias is supported or not.

Cheers,
Kent.

> > I would like to fix the uAPI such that if the hardware does not support
> > the requested configuration, or if it can't be emulated in the kernel,
> > that fact is returned to userspace - bias being the sole counter example
> > as far as I am aware.
> > 
> > The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> > rather than gpio_set_config_with_argument_optional(), but as mentioned in
> > my comment above, that would impact any existing users of
> > gpiod_direction_input() that assume the best-effort behaviour.
> 
> Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> the best form the hardware driver.
> 
> > I haven't been able to find any such usage, but that could just be proof
> > that I'm not looking in the right place.
> > Any input on that front would be greatly appreciated.
> > 
> > Also, fixing this as mentioned could be considered an uAPI ABI change.
> > Is this a bug, so that is ok, or do I need to consider adding a strict
> > mode flag or somesuch to the API?
> > 
> > Bart, I'm also hoping to extend the gpiosim to optionally not support
> > bias in gc->set_config() to test this case.
> > Any suggstions on a configfs interface extension to do that?
> > 
> > My apologies for the verbage rather than proffering a patch, but the
> > different paths have vastly different costs, and the simplest solution
> > has the potential to introduce breakage.
> 
> > [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
