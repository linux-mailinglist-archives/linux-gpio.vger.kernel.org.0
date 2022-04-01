Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE274EE503
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 02:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiDAAKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 20:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243255AbiDAAKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 20:10:33 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E2164BF4
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 17:08:44 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id h19so1115705pfv.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 17:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OBZZLn5rRGe0pzd1QMdEBKJCjf3qzIdBCJovCTKbpPg=;
        b=qX39Y+SQ55BF+STouWCfBttHBarCDHlj6wCm6sfDGAAMaxAPDeSscAl7rqCCPDFvKP
         y+WukPr9Vbh+SR0nKJbA+e63MevvanIachHNPXQbisQGzfjOYL8LITsOZ4Hbe7pXf+G1
         uu23dhsjOgm6eGfsYcUs/7JiuA5x53C5kP9xZLXyYPS5xrADYRuUkM4w6AI26rLo7IQu
         qiL8F/4oeHPb04c4H6hbiax1SRbxmlsk6553PTzCfkKqjGMnJ6dfk+Ua8vLvyxtfZ+4C
         7CRdVzm0ab4LI3gfTgL9gmuzc+4LQGPnQq5tQiYMF7X1mi9h38/l66r/tickR8MyqlDL
         ZIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OBZZLn5rRGe0pzd1QMdEBKJCjf3qzIdBCJovCTKbpPg=;
        b=V1Hxz32uBouKuwCncbSGNWoK1ncDIg4P/Rv8PNhyF9JE4M0evojeB/UjpgUxSD9QPV
         De8x0msHBfzg0sfuwGx8te+qmzKDmTj1c0Uxtk8d9rd1Mc4hFwjVXEcTX+fxT9VoFO7A
         r6UK+tkyHrTFOs83yEA4RWXqQuRzdJtWRfTel2l8UyUTLo9AvmgwehhszbwQTHtZKGba
         yvUC6ZpvN2rUXCQ6eybwsbZURLDIEaRJbs7tEga4j+N6VEGd0QYmMbmdFOhdUK3m4G8h
         DXZ+HQsn0X7AFmsUwPZU96YL5+S1atf+R6yue+g8VydyICRqlA2aRs0fkek3yNuQNnua
         bnhg==
X-Gm-Message-State: AOAM530Ooeo+RtvszCbUQhJ+/InkVU91mkr5oqzOCz9xCSyYbCxyqDGL
        sCqvbA8uEa5+ydEJWPQN3lQ=
X-Google-Smtp-Source: ABdhPJwm8vTLUG8IwL+Q8+z6rFTnx92bbxIQfGT5qgXPP5PXeGv/HIvW9tC/0u2mbt2g2sZvq7FGYw==
X-Received: by 2002:a05:6a00:cd2:b0:4fa:a4f6:74b8 with SMTP id b18-20020a056a000cd200b004faa4f674b8mr41984027pfv.19.1648771723897;
        Thu, 31 Mar 2022 17:08:43 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id d10-20020a056a0024ca00b004fd90388a86sm625315pfv.173.2022.03.31.17.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 17:08:43 -0700 (PDT)
Date:   Fri, 1 Apr 2022 08:08:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, thomas.petazzoni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <20220401000837.GA4938@sol>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <YkXiq995Xb+1Quq8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkXiq995Xb+1Quq8@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 31, 2022 at 08:19:39PM +0300, Andy Shevchenko wrote:
> On Thu, Mar 31, 2022 at 10:15:24PM +0800, Kent Gibson wrote:
> > On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> > > On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> > > > It has recently come to my attention that the setting of bias by the
> > > > cdev uAPI is a best effort operation that quietly succeeds if bias is
> > > > not supported by the hardware. That strikes me as being a bug.
> > > > It seems I was aware of this when adding bias to the uAPI and intended
> > > > to fix it, as shown in the comments of v4 of the corrsponding patch
> > > > series[1]:
> > > 
> > > > > > The setting of bias is performed by gpio_set_bias, which is hooked into
> > > > > > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > > > > > of bias that was already present in gpiod_direction_input.
> > > > > > In keeping with the existing behaviour, the bias is set on a best-effort
> > > > > > basis - no error is returned to the user if an error is returned by the
> > > > > > pinctrl driver.  Returning an error makes sense to me, particularly for
> > > > > > the uAPI, but that conflicts with the existing gpiod_direction_input
> > > > > > behaviour. So leave as best-effort, change gpiod_direction_input
> > > > > > behaviour, or restructure to support both behaviours?
> > > > 
> > > > > Thomas: is there any reason not to check the return value of these
> > > > > calls for errors other than -EOPNOTSUPP?
> > > > 
> > > > that being my comment, and Bart's followup question to Thomas.
> > > > 
> > > > That went unanswered AFAICT and the issue subsequently fell through the
> > > > cracks.
> > > 
> > > My understanding that all constraints we have in kernel is due to
> > > in-kernel use and possible (non-critical) issues.
> > > 
> > > For example, driver can set only selected values of bias. What to do when
> > > the given value is not supported by hardware?
> > > 
> > > Followup question: Why do you think your choice is any better than another
> > > one?
> > > 
> > 
> > I'm probably missing your point here.
> > 
> > What makes gpiolib best placed to decide that bias not being supported
> > by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> > caller and let them decide?
> 
> First of all, ENOTSUPP may not be sent to user, it's wrong error code.
> The returning any other error code make behaviour for the _very same_
> GPIO line _different_ when it being configured in kernel (via firmware)
> and user space. That's unacceptable. So, it means we have to have
> synchronized behaviour, means either error in both case or ignoring it.
> The latter one is current state of affairs, the former might break the
> cases where driver and firmware are not synchronized well.
> 

First of all, I was referring to in-kernel users of gpiolib, so gpiolib
would propagate ENOTSUPP.  You will note I said "caller", not "user"
to try to emphasise that point.
cdev, being the caller here, would translate the ENOTSUPP to EOPNOTSUPP
for user space consumption.

But back to the point...
Are you saying that user space should not be given an error if bias is
not supported as it was already decided by gpiolib that the kernel
driver wouldn't be given one?
That makes no sense to me, so I'm probably missing something.
Can you clarify?

What I read from your answer is "that's the way it is".
I get that, but was after why.
I don't see dropping errors as a way to get anything in sync.
Quite the opposite - it ensures we can never tell if they are.

If the original problem was that there are two possible causes for
ENOTSUPP, and one of them is critical and one is not, then the solution
should be to split the functionality into separate calls, not just drop
the error from the "non-critical" one.  Again, gpiolib has no business
in that criticality decision, IMHO. And again when I say gpiolib here
I mean the core - gpiolib.c.

Cheers,
Kent.

> > Is it because setting bias is piggy-backed onto
> > gpiod_direction_input() rather than being separate, so then you can't
> > tell whether it is input or bias that is not supported?
> > 
> > Anyway, if that interface is required for internal use then there is no
> > option but to refactor gpiod_direction_input() and provide an alternate
> > interface so that cdev can determine if bias is supported or not.
> 
> > > > I would like to fix the uAPI such that if the hardware does not support
> > > > the requested configuration, or if it can't be emulated in the kernel,
> > > > that fact is returned to userspace - bias being the sole counter example
> > > > as far as I am aware.
> > > > 
> > > > The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> > > > rather than gpio_set_config_with_argument_optional(), but as mentioned in
> > > > my comment above, that would impact any existing users of
> > > > gpiod_direction_input() that assume the best-effort behaviour.
> > > 
> > > Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> > > the best form the hardware driver.
> > > 
> > > > I haven't been able to find any such usage, but that could just be proof
> > > > that I'm not looking in the right place.
> > > > Any input on that front would be greatly appreciated.
> > > > 
> > > > Also, fixing this as mentioned could be considered an uAPI ABI change.
> > > > Is this a bug, so that is ok, or do I need to consider adding a strict
> > > > mode flag or somesuch to the API?
> > > > 
> > > > Bart, I'm also hoping to extend the gpiosim to optionally not support
> > > > bias in gc->set_config() to test this case.
> > > > Any suggstions on a configfs interface extension to do that?
> > > > 
> > > > My apologies for the verbage rather than proffering a patch, but the
> > > > different paths have vastly different costs, and the simplest solution
> > > > has the potential to introduce breakage.
> > > 
> > > > [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
