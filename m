Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2554B67C88B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 11:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236801AbjAZK0s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 05:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237107AbjAZK0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 05:26:36 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CFA51C4B
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 02:26:19 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id i65so849065pfc.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 02:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik1korYw2nUx7w7jJc2hEU1NfMUjkYZNJ7bp09aGT3U=;
        b=QivDU5Ua9AbsJ2nOjxzVpn8gW/gLF/znODjZVJ5QloYPP4VMSeQ4qHBN7oBiGT3SxU
         o7JnOmi/opekwdTCkiF9Lz3H1lJLUB12RHT6unWtK5bWe9rB2UxVIXIRhOJ64SJEqId8
         DO1sM4WNvfe/wCUTVF0r5w8kGMUZoG3KaaOEBMqzkZvtSZv2H/xEPawXUDQKlzHifAZ4
         ifBdaJuUZpR+pdpsfJw76RonF9VNBkGcDRDqW2FRYxgHgJRnkOnogja9q1MSO5HqBh2E
         wBGVLYlM8QaRQttbGFjfEiPeGWLw4JCwNPWOCSdwU/Sy3EG8ln0gJ3m+ebCYDw/aIfL9
         926Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik1korYw2nUx7w7jJc2hEU1NfMUjkYZNJ7bp09aGT3U=;
        b=xFPlcOo7erXc3rgOrpoxldGpbxBKGZxOJF8pdqJKonJ5BR0XxYF9aGdmhGlhqPJKWU
         Xzk9jtog56zJtHLUVrCZIjtWCvdU1ovaI3lkaP3nkKK6skX0D1O3QMffxi4TQwOnCMXZ
         0y6jny7ko4dfoLfEDImyYIi6tNTUuBIcTi9wEaDCSHmA/Kpx0B3q2Zz3bVcvG5gUz9qP
         JS6PDhRht/btU5TbW6hHxxkv6C7otuKs7WT3NSyZwsMSYsN+ZmVZICf6BtjknvWHZ9yt
         Vq1RYaPQzAu4mliKSP6le5Bl9CEv6RtUMSUwtIHqBVMiaJkBIGlkB1xSq3aytVKjFb8c
         fCBA==
X-Gm-Message-State: AFqh2kpVWJKPBtMlmzzv4gPrq4LG4Y0z3svp6ufgjwqPFyVpA9NO9pdy
        yE7i5+Q/4tsTj9Hm1Mjf/xfhLZCUYSw=
X-Google-Smtp-Source: AMrXdXufqtpSf7S8U34VwPYg5u0lZ4WMAPsFkqWGOHpK3/WhSWBD24PBjnExaE6xszR0cuTZLsP48g==
X-Received: by 2002:a05:6a00:410c:b0:583:3bb3:438c with SMTP id bu12-20020a056a00410c00b005833bb3438cmr38580503pfb.10.1674728777672;
        Thu, 26 Jan 2023 02:26:17 -0800 (PST)
Received: from sol (220-245-168-240.tpgi.com.au. [220.245.168.240])
        by smtp.gmail.com with ESMTPSA id d23-20020aa797b7000000b0058ba2ebee1bsm534844pfq.213.2023.01.26.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:26:17 -0800 (PST)
Date:   Thu, 26 Jan 2023 18:26:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <Y9JVQrJTsltzOpbj@sol>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <Y9Hd/mfLkGME6Ed8@sol>
 <20230126101458.GC23347@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126101458.GC23347@pengutronix.de>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 11:14:58AM +0100, Sascha Hauer wrote:
> On Thu, Jan 26, 2023 at 09:57:18AM +0800, Kent Gibson wrote:
> > On Wed, Jan 25, 2023 at 10:35:48AM +0100, Sascha Hauer wrote:
> > > On Mon, Jan 23, 2023 at 03:55:18PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > > >
> > > > > Hi all,
> > > > >
> > > > > I stumbled over the following warning while testing the new v6.2-rc4 on
> > > > > a imx8mm-evk:
> > > > >
> > > > > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > >
> > > > > The warning was introduced by commit [1] but at least the following
> > > > > drivers are parsing the alias for a gpiochip to use it as base:
> > > > >  - drivers/gpio/gpio-mxs.c
> > > > >  - drivers/gpio/gpio-mxc.c
> > > > >  - drivers/gpio/gpio-clps711x.c
> > > > >  - drivers/gpio/gpio-mvebu.c
> > > > >  - drivers/gpio/gpio-rockchip.c
> > > > >  - drivers/gpio/gpio-vf610.c
> > > > >  - drivers/gpio/gpio-zynq.c
> > > > >
> > > > > According commit [2] it seems valid and correct to me to use the alias
> > > > > and the user-space may rely on this.
> > > > >
> > > > > Now my question is how we can get rid of the warning without breaking
> > > > > the user-space?
> > > > >
> > > > > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > > > > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> > > > >
> > > > 
> > > > The warning is there to remind you that static GPIO base numbers have
> > > > been long deprecated and only user-space programs using sysfs will
> > > > break if you remove it, everyone else - including user-space programs
> > > > using libgpiod or scripts using gpio-tools that are part of the
> > > > project - will be fine.
> > > > 
> > > > Any chance you can port your user-space programs to libgpiod?
> > > > 
> > > > The warning doesn't break compatibility so I'm not eager to remove it.
> > > 
> > > Well it's a warning and sooner or later somebody will come along and
> > > removes this warning by removing the GPIO controller bases from the dts
> > > files which in turn will then break things at least for us, but I
> > > suspect for many other people as well.
> > > 
> > > You are trying to remove the GPIO sysfs API for many years now without
> > > success so far, and I doubt that you will succeed in future because the
> > > Kernel comes with the promise that userspace won't be broke.
> > > 
> > > I can understand that you want to get rid of the global GPIO number
> > > space. Currently you can't, because there are still hundreds of
> > > in-Kernel users of the legacy API. When all these are fixed and the GPIO
> > > sysfs API is the only remaining user of the global GPIO number space
> > > then we could move the numbering to gpiolib-sysfs.c and no longer bother
> > > the core with it. At this point the sysfs API would be a GPIO consumer
> > > just like every other consumer and we could leave it there until only
> > > the oldest of us remember what it's good for.
> > > 
> > > Instead of trying to remove the sysfs API I really think it would be a
> > > better strategy to push it into a corner where it can stay without
> > > being a maintenance burden.
> > > 
> > > Regarding the usage of libgpiod for our projects: I think one of the
> > > major shortcomings is that the character interface doesn't allow to
> > > just set a GPIO to a value and leave it in that state without having
> > > to keep the process alive. While you may argument that it's cleaner
> > > to go to a "safe state" (or "idle state") when the process finishes
> > > that's simply not the way how many projects out there work.
> > 
> > You can argue that, but that is not what cdev and the gpiolib subsystem 
> > do.
> > 
> > When a line is released cdev and the gpiolib subsystem do not explicitly
> > change anything, so the line may well remain in the state it was set.
> > The state becomes "undefined" from the user perspective, as the line is
> > now accessible to other processes and as the kernel MAY reset it.
> > The latter is the case where the line being released is the last
> > requested line on a gpiochip, in which case the gpiolib subsystem 
> > will release the chip and the chip MAY get reset back to defaults
> > (depends on the gpiochip).
> > 
> > Given that, you can get sysfs-like behaviour as long as you hold at least
> > one line on a GPIO chip, and that could be a line hogged from DT or an
> > other internal kernel user.
> 
> Having to hold one line to get a well defined behaviour of another line
> is a kludge or a workaround, not a solution.
> 

Strictly speaking it isn't even a well defined behaviour, so my bad for
even suggesting it.

Cheers,
Kent.

