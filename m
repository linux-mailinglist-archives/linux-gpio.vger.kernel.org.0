Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFE767B3BB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 14:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbjAYN41 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 08:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbjAYN40 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 08:56:26 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364582410C
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 05:56:25 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id b18so4661492uan.11
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 05:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+nSDhd2/2jqJbAB8UKIYDAf59uJLflunMFyAEYUbgFc=;
        b=K5r/tPfpVlEgYWurf2cW1oDCtyVulVbE5P8ZfkVttGD5KHKGQub7DMbDhSaiLGRe2O
         6SQzjv2Cuigi2xrCNbFXZ/iIgbgxaFSEipzByNzjJ44HW4Oy92JFJFrHrEGtiam21VrN
         5fdLrhYLyUrwxzwyUaw6Jf4UwV+TUWqxKqyfpvEZJoiZJ60VOFZZ/XdMaGNcegSPTIMj
         CpmWT0TETvRE71ovbZU5Bs4QMv45iyQP14dgWXSN15/udX7gPaON3kdMnJQVsMjC7ZWa
         rQ91Amrgyu7jIQFeVxESNZBEIiW/3gO2AGGwcJce7tlFGmLt7GABgPtEdPrIcbgFt4kO
         yGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nSDhd2/2jqJbAB8UKIYDAf59uJLflunMFyAEYUbgFc=;
        b=bS+e2GWLsEHSzazcjGg82G27JKpovtLGUQEN36u2nr5/MyKX931kJde2dvYba7u48G
         i9uJOyIRhtqMBvvK4Cf2Cubudt93M8ZFwbNmprYDxS9GLXRgRnBYxPmbXY1OQOvOiJ9n
         CHExXqladCmh6XnzXsMkvoSNsl0NcuLLb6SW2LEsT4RYfo/iz7f1wMzT/sxPk57fSltr
         gBlpCMKqVAdeFoQPpGSqiKVpCd3A31mXWuosOxCj9fKZVizHiSHh0pN/H/zrvJ3E4Mat
         Yz7f/KuqTfFAmu5Zk3EMFX+bKYDlaZ/jix2SBbbHFXDJSwOyDyO4ukw8ixNJPpK9CrXp
         MwEA==
X-Gm-Message-State: AFqh2ko0x2sVHG6yXwqNdDhLIu0dwaDePJlX6IXIUTImmJPi70hy7bGB
        jGG/lGd5IIfyCWNATomCPWHDLwSRRDJm9RV9rxU0Bw==
X-Google-Smtp-Source: AMrXdXuVLzblbaMR+2NGmxHzb425f/sgx2qYu47EJGMUxn+LDrPt4Wp7wdHUkOazGEoZmEptI1akZ+PSfiAxDWA0pB4=
X-Received: by 2002:a9f:29e1:0:b0:63f:5ee:7e42 with SMTP id
 s88-20020a9f29e1000000b0063f05ee7e42mr2002876uas.112.1674654984264; Wed, 25
 Jan 2023 05:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com> <20230125093548.GB23347@pengutronix.de>
In-Reply-To: <20230125093548.GB23347@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Jan 2023 14:56:12 +0100
Message-ID: <CAMRc=Mfrqy5GGpS3co3Div+EsFJO7e2reJTn7BDCf+pD+mB8Ew@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 10:35 AM Sascha Hauer <sha@pengutronix.de> wrote:
>
> On Mon, Jan 23, 2023 at 03:55:18PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > Hi all,
> > >
> > > I stumbled over the following warning while testing the new v6.2-rc4 on
> > > a imx8mm-evk:
> > >
> > > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > >
> > > The warning was introduced by commit [1] but at least the following
> > > drivers are parsing the alias for a gpiochip to use it as base:
> > >  - drivers/gpio/gpio-mxs.c
> > >  - drivers/gpio/gpio-mxc.c
> > >  - drivers/gpio/gpio-clps711x.c
> > >  - drivers/gpio/gpio-mvebu.c
> > >  - drivers/gpio/gpio-rockchip.c
> > >  - drivers/gpio/gpio-vf610.c
> > >  - drivers/gpio/gpio-zynq.c
> > >
> > > According commit [2] it seems valid and correct to me to use the alias
> > > and the user-space may rely on this.
> > >
> > > Now my question is how we can get rid of the warning without breaking
> > > the user-space?
> > >
> > > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> > >
> >
> > The warning is there to remind you that static GPIO base numbers have
> > been long deprecated and only user-space programs using sysfs will
> > break if you remove it, everyone else - including user-space programs
> > using libgpiod or scripts using gpio-tools that are part of the
> > project - will be fine.
> >
> > Any chance you can port your user-space programs to libgpiod?
> >
> > The warning doesn't break compatibility so I'm not eager to remove it.
>
> Well it's a warning and sooner or later somebody will come along and
> removes this warning by removing the GPIO controller bases from the dts
> files which in turn will then break things at least for us, but I
> suspect for many other people as well.
>
> You are trying to remove the GPIO sysfs API for many years now without
> success so far, and I doubt that you will succeed in future because the
> Kernel comes with the promise that userspace won't be broke.
>

History knows interfaces that were long deprecated, triggered warnings
and were eventually removed (sysctl?). We have not yet broken
user-space. IMO a warning is in order if an interface was deprecated.

> I can understand that you want to get rid of the global GPIO number
> space. Currently you can't, because there are still hundreds of
> in-Kernel users of the legacy API. When all these are fixed and the GPIO
> sysfs API is the only remaining user of the global GPIO number space
> then we could move the numbering to gpiolib-sysfs.c and no longer bother
> the core with it. At this point the sysfs API would be a GPIO consumer
> just like every other consumer and we could leave it there until only
> the oldest of us remember what it's good for.
>
> Instead of trying to remove the sysfs API I really think it would be a
> better strategy to push it into a corner where it can stay without
> being a maintenance burden.
>

We're also doing it step-by-step.

> Regarding the usage of libgpiod for our projects: I think one of the
> major shortcomings is that the character interface doesn't allow to
> just set a GPIO to a value and leave it in that state without having
> to keep the process alive. While you may argument that it's cleaner
> to go to a "safe state" (or "idle state") when the process finishes
> that's simply not the way how many projects out there work. Virtually
> everyone has scripts poking GPIO states into sysfs and currently you
> can't do this with the character device API. If you want to get rid
> of the sysfs API then you should work on making the character device
> API more attractive for users and I think this is one point could use
> some improvement.
>
> Sascha

On that note: as libgpiod v2.0 is almost ready for release, I started
working on the idea I've long had in mind - DBus interface for GPIOs.
I've started writing the code over Christmas and some very limited
functionality is available on my github[1]. For now it only allows to
read chip properties but my goal is to have a complete DBus API for
libgpiod v2.1. Is this something you could work with? It addresses
your main concern (having a central authority and persistent state of
GPIOs) while using the character device behind the scenes.

Bart

[1] https://github.com/brgl/libgpiod-private/tree/topic/dbus
