Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7551BFF68
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 16:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgD3O6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 10:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726380AbgD3O6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 10:58:51 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD439C035494;
        Thu, 30 Apr 2020 07:58:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l20so2849822pgb.11;
        Thu, 30 Apr 2020 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NFYSfA/3764WrnouY0loV6hglNFNiP/lp/p+4dXkwLs=;
        b=gnR8JGqi6ExZ8eVYHErJr8bXlK8lxA/47DM1lBduLpbJt5HsVjZDsJbtxHJ6VW2/D7
         mwAvUFmDG+4Opyz1XMXsfhV3V8gGHxFj9eu0zbRprCctVYZiXzKu9Pjqcti1H+JwN7XA
         9MflhWFoYRKuA3A2R4IIk6PCTKV4V9X1eDt1bjOoSrIRd8zFHGFdvpD8lFUU/FE5EBKv
         41J6RkMMKQ2ht6afAGzP2eEm/0OURhxRLYtroJ2GW2Qm/OD8A07TzRTxAzwset5X5It/
         UmMxsIfvXVorGDXrC42NDeiOrOzEJFWbSwbI9XPSAsAULogotNegbJhnSaOOVNcxosy2
         bWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NFYSfA/3764WrnouY0loV6hglNFNiP/lp/p+4dXkwLs=;
        b=sScsvJy/Jkqel7pVxjvSe3IZH90K8dD4TM3lYxUmZ/N0ITlfWy0mi9wmSxXBEy/kER
         lG5C5mYFcRp+5NPtkgixACZB90ULQkklwKLv1LExnxo23hhDC5tmnN370Ql2UOHsdIN/
         6w9XKPvkrwjxgRY48CP2Ag2swGqZBpT5PS8sphqTu9UQ/IQ23+czAXbz1pU5Zq5fvjuo
         i1dQRMWzdiJAAxobBX4QcY+gMLQ3quRT4FIllr9Z0VcTKIJxcbu4IQB610OkeKj/9sW/
         OBwq8VaMCjqU7i8Or9Qhk/KUBCpgo3WQU5Isa8EaeStBgfH9Kbi7mvN0eUJlSLYMeGuu
         n/OA==
X-Gm-Message-State: AGi0PuZGKMrGwbcRnDdNlRXLTaTeLH4eXXPf33QIDfckYGa8jELHXPo2
        X1TYGvmvDEpM3sydS0vMSaOcMJknQIM=
X-Google-Smtp-Source: APiQypLUbA28K7rJdyqHeyLYfd3Z4yuLMi0EkduRaXjMwn5RPKUauV7cMtEFMzJ1kUN+265YercDow==
X-Received: by 2002:aa7:9484:: with SMTP id z4mr4053092pfk.144.1588258731268;
        Thu, 30 Apr 2020 07:58:51 -0700 (PDT)
Received: from sol (220-235-85-217.dyn.iinet.net.au. [220.235.85.217])
        by smtp.gmail.com with ESMTPSA id c1sm101548pfc.94.2020.04.30.07.58.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 07:58:50 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:58:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Bujanda, Hector" <Hector.Bujanda@digi.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200430145844.GA28588@sol>
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 30, 2020 at 01:32:22PM +0000, Bujanda, Hector wrote:
> Thanks all for your guidance!
> 
> First saying that this patch request was sent having our platforms in k4.14 in the way of upgrading to k5.4.
> In those versions the commit e588bb1eae31be73fbec2b731be986a7c09635a4 "gpio: add new SET_CONFIG ioctl() to gpio chardev" by Kent Gibson was not available.
> 
> I see that you clearly understand the necessity of having a way of configuring debounce from the userspace.
> Our platforms make use of hardware debouncing filtering. Up to now we were using the sysfilesystem to let the user handle gpios (including debounce configuration).
> We wanted now to get rid of sysfilesystem and start using gpiolib/libgpiod.... but configuring debounce is blocking us.
> 
> Now I clearly see (as pointed by Bartosz Golaszewski) that my suggested GPIO_SET_DEBOUNCE_IOCTL is wrong as it hits the chip file descriptor while 'Modifying any config settings can only happen on lines previously requested too in user-space'.
> 
> I agree with all that a flag is needed to allow configuring debounce to '0' which has always meant disabling it.
> 
> Also agree with 'Kent Gibson' suggestion of  'You might want to add a flag to the GPIOLINE_FLAGs to indicate if debounce is set'.
> 
> I have my doubts if it is compulsory to extend debounce configuration to the gpioevent_requests since the debounce value configured by a user is normally linked to a hardware noise in a line; and that does not change from one gpioevent_requests to another. So I think this configuration would be useful but not compulsory.
> 

Just to clarify on this point, the reason the SET_CONFIG would have to
be extended to events is not to alter the debounce on the fly but to set
it at all.  Lines are requested as either handles (for outputs or polled inputs) 
or events (for asynchronous edge events on inputs). We cannot extend
either the handle or event request ioctls themselves as there is no provision 
in their data structures for future expansion.  There is in the
SET_CONFIG ioctl - but that doesn't apply to event requests yet...


> I agree with Linus Walleij that 'there is a serious user-facing problem here though, because not all GPIO controllers supports debounce'.
> Our platforms have native freescale/NXP gpiochips not supporting hardware debounce and our own gpiochips having hardware debounce.
> We have also noticed that 'drivers/input/keyboard/gpio_keys.c contains generic debounce code using kernel timers if the GPIO driver cannot provide debouncing'. That feature is not of our interest (because of having hardware debounce filters) but it would clearly be a very good overall functionality.
> 
> Having said all above, I wonder how you want to proceed.
> Our current development in k5.4 and libgpiod1.4.1 is much behind master... what makes collaboration (and reusability) a bit more complex.
> Also I see the implementation requires a bigger picture than I initially expected.
> So I wonder if you want me to do the initial steps of the development (what I foresee will require some back and forth) or you prefer implementing all pieces.
> 

I totally agree with you on the widening scope.

Bart - how do you want to go forward with this?  I'm available to work
on it, in part or full.

Cheers,
Kent.
