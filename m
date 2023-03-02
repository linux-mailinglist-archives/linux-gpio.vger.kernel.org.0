Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582006A796B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 03:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCBCTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Mar 2023 21:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjCBCTM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Mar 2023 21:19:12 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A249F22794
        for <linux-gpio@vger.kernel.org>; Wed,  1 Mar 2023 18:19:11 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id y11so11942260plg.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Mar 2023 18:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+PkF5UhHB+hYsUt7o+JDXfk3/MdTpFJPv5SK4ggULw=;
        b=U1u/EWbHb2hH4nTy9FraJKAareD5CxBs46+arwA5s3bmsUklL/77ikC70LYbDcI+tY
         PCbbc0fGGahUq9OqHxMMvRIQmFR0dRIEaqp80y+gx0/XDt7yJSnQZOPYXs4kwBaILJk2
         qn+qR2CRdEu//GduCVaRHhtj1885OqDcAfSMI1DGX9DRKDb9chgqi6jLq4tniNbfqWgk
         9YLGJvQZb8WfU+JEclgHG42Wlt1W46B5BmnFW1+X0jNmRtd3eqUku8upZkg/V93ZVC76
         ZTdWgs4gGH5LKj4CFAEywBEMp9jZ8icNmZTf0HYfErrHSvbSIsWiQjnMVmZFISJcU+qk
         nJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+PkF5UhHB+hYsUt7o+JDXfk3/MdTpFJPv5SK4ggULw=;
        b=G1YnUkATZmb6bK31UNk0ZLDr8WopbfgKUI+fXsILhTDD08NBIIezm6Ms6Ex41axBGG
         /RDZvE2hlXCaPTONV6inLmRL9Dhwu1TbrF6yPNy+v/VcqvsaP0EFJ1suoCXtrrQFiSht
         Ki41yLHZA7tTXuW5HlToqI9lbYYTEny/iC2zrOBwYTbf1MMkxPVDnl5aToMY7GUgX0KX
         V7gxYR0cKfwmt7muTDp1gQZ81G4onOHrqou3SoAoROtM2oEp5Z7enfsGTB5poxUNYglc
         kJiSvWCMMtNVQzXyGmnPDksVhUy17aWfLqTDRyb2hq7fseWFvuNNQVAvjnLE0qfsd/DU
         L3JQ==
X-Gm-Message-State: AO0yUKWBnGJiz7iJUst8iUeGFUsRDj11w7KGHFgXBlB8p9EJ10L9GHlU
        3McmBgs+Q35GjYRkKkvvCWg=
X-Google-Smtp-Source: AK7set/pMCGmYJyTjvPtf6Rm1RYsFOm1fbaLgUQoVyD9RusWEPNrMfRotLwLdEOdJudj1XYIGnEYcQ==
X-Received: by 2002:a17:90b:33c7:b0:237:d2d8:3264 with SMTP id lk7-20020a17090b33c700b00237d2d83264mr9872093pjb.40.1677723551005;
        Wed, 01 Mar 2023 18:19:11 -0800 (PST)
Received: from sol (14-201-52-182.tpgi.com.au. [14.201.52.182])
        by smtp.gmail.com with ESMTPSA id d17-20020a637351000000b005030136314dsm8053852pgn.71.2023.03.01.18.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 18:19:10 -0800 (PST)
Date:   Thu, 2 Mar 2023 10:19:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Robert Schwebel <r.schwebel@pengutronix.de>
Cc:     Sascha Hauer <sha@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <ZAAHlyjr+pNHTMoo@sol>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de>
 <20230129183339.GY24167@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129183339.GY24167@pengutronix.de>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I didn't respond to this earlier, as I considered it best to let the
thread die and not inflame the issue.

Adding Andy as he raised the issue again in another thread.

On Sun, Jan 29, 2023 at 07:33:39PM +0100, Robert Schwebel wrote:
> On Thu, Jan 26, 2023 at 11:49:27AM +0100, Sascha Hauer wrote:
> > What's missing is a way to let a GPIO stay in the current state when I
> > release a GPIO chip. Unlike the new features you listed above this is a
> > feature that the sysfs API offers and that's important for us.
> 

I assume you mean release a line...

The new (cdev) interface provides access control over lines so you can
guarantee that you, and only you, have control over the line.
This is not possible with sysfs.

With cdev, and internally with gpiolib, the state is only guaranteed while
the line has an owner, and when you release line it becomes unowned -
ownership effectively reverts to the GPIO chip driver.
Its state does not become random, it becomes undefined from the
perspective of the former owner.  Neither cdev nor gpiolib change the
line state when the line is released - any changes at that point are a
function of the GPIO chip driver.

(With sysfs, it becomes the owner of exported lines.)

> An example where it is used is labgrid: our test automation controller
> (LXA-TAC) doesn't run any software for controlling power of the device-
> under-test; to switch on a DuT, labgrid does
> 
>   ssh tac echo 1 > /sys/some/path/to/gpio
> 

As can anything else that can access /sys/some/path/to/gpio.
So it is possible for multiple test benches to mess with the DuT power at
the same time.  Using cdev would make that impossible.

cdev providing access control does mean that it is more awkward to use
than sysfs, but to provide a "set and forget" feature akin to sysfs would
undermine that access control and the associated benefits.

> While this could also be done with a daemon offering a dbus api, this
> would be significantly more complex. In a critical environment, one
> needs to make sure that the daemon process never fails, otherwhise the
> power of the DuT would maybe be in a random state. Then of course one
> can add a watchdog, but with the current sysfs interface it's really
> simple. Of course that would also work if the new interface would offer
> a "keep this line as it is" feature, but adding a dbus daemon just for
> keeping the state of a pin sounds overcomplex when the kernel could also
> provide that functionality.
> 

So it is non-trivial for your test framework to run a process on a
remote host for the duration of a test?
That is a problem.
Seems like something that would be generally useful, and having it run
gpioset for the duration of a test *should* be pretty trivial.

Unlike sysfs, when you request a line with cdev nothing else can come
along and mess with your power switch while your test is using it.
Which seems like something you might want in a critical environment.

Wrt complexity, I would contend that it is actually more work to add
this functionality to the kernel.  The state of GPIO lines when not held
by gpiolib is dependent on the GPIO chip driver, so solving the problem
for all cases would involve extending the GPIO chip driver API and
updating *all* GPIO chip drivers to keep the state of the pin as
requested - even when the line is freed.
Even if this were to happen, it would take significant time and effort,
so it would be more practical to try to find a solution that uses cdev
as it stands.

> Another example that came up on friday when we talked about this is a
> motor for an airplane: It doesn't have only one "safe state" it could
> fall back to if something fails (i.e. daemon disappears). The safe state
> on power-on (with uninitialized external hardware) might be different
> from the one on the ground (motor-off) or while being in the air
> (motor-on). Of course one would probably not build an airplane without
> further safety mechanics, but we have several less-desasterous-but-
> still-very-expensive-in-the-case-of-failure use cases in the field, like
> multi hundret kilowatt motors in agricultural or heavy construction
> machine equipment being switched on/off by a GPIO that cause significant
> loss of material / work on failure.
> 

Agreed - such applications should have external safety mechanics, so
the software safe state is irrelevant.

> I hope those examples help a bit to understand the issues. As Sascha
> said: when the new interface provides the same features sysfs offers
> today, without adding tons of new complexity, increasing the pressure on
> people to move there is perfectly fine. 
> 

Can you elaborate on "adding tons of new complexity"?
You mean that you can't drive GPIOs just by echoing into files?

I don't see any GPIO developers "pressuring" anyone to switch.
The standard process to remove old interfaces is to mark them as
deprecated and provide time for users to migrate to alternatives.
This is exactly what has been done.
The sysfs interface has been deprecated for a very long time (since
2015??).
And the deprecation suggested it was scheduled for removal in 2020.
Exactly how much warning is required for you not to feel "pressured"?

We well understand that there are trade-offs involved in the switch from
sysfs to cdev, and have endeavoured to accomodate sysfs users.
The problem as I see it is sysfs users who continue to insist on feature
parity while not appreciating the associated costs.

Cheers,
Kent.
