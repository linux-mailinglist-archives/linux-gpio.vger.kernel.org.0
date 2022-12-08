Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC835646BE2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiLHJ2Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 04:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiLHJ2I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 04:28:08 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120EE62E80
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 01:28:02 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id t5so917255vsh.8
        for <linux-gpio@vger.kernel.org>; Thu, 08 Dec 2022 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ERTN666fRKDGoGfDoWZ2iitu1VMt/YznXmkGkIcNh4M=;
        b=YXI7UF1jJnosly8bPBmeFcOv+0Jb4bhp7nBTBqDFVqrLLo5Hrjp4vsaQQxX0o9/1ZQ
         wHkJy7NPAydM9JRundYyzxP/ThgmuqqmBByACE3m5Jfz7Bq6f27t8dTNLkp7npHJi5xQ
         aVnfYci8DWOOmz5gz0vOA+uus0A2f/hIwAy0fuFfeuhRdHiyaQFcQOFArCIfWBsH7Wnr
         Rn0j6oulayOM0UEeHjmBGpPsOHto/FwzCC/EwmpV97pUYdruKR3k/OVlsAzKm8sHHibg
         7Ge2jUInvZykKgh5SIrZlNZx1un0DXT3kb6i8/1Jn3zLRWhHlyqStuGVJA+HjQX4aJUP
         qinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERTN666fRKDGoGfDoWZ2iitu1VMt/YznXmkGkIcNh4M=;
        b=6PzHfz1jdhabCH3ZWo1T9pSXpXATh67MjDxYHTiwKvFG+QxTAJE6YXZsf0LgoD9X1r
         IyDS6Nc6MrY8Nv30QuXVr/5fVOSGq179RmqHlLxZzyNyWoQr2QCL20leU65vTvR4vbWi
         qXriuxYaosPyrawhO9tKX/uIUZ2fbxq/9Dn0K12QRiTYTHMFbLooD3NzKnEVc17qONEU
         bW3h76a5aPkC9jBmZJ8eqsZe25j0m+oGPwmuXrLum/TN6gY25S6+aeZd1drpWc4qSlJ7
         faONtZlcvgco8BxMxUWf3FiV/lA4h7Af9o7dQyhQgi7Rn8YdkaCtVXmrJR5L/CrnY8Yf
         VDTg==
X-Gm-Message-State: ANoB5pka20oyAsaewxP6hYzw6sbEnh+NbUWXXiiHvnIvOBFLlbtsV+fF
        q3EHjYGkcl4pUgs1CVP9YaX88mdExNKG5Leg3388bA==
X-Google-Smtp-Source: AA0mqf5oZYhE7nNd6sX3e55eg7oNPm/zwdxsZ73nHMpA2qdFLkWpPvJ/jukYkpEoommGUmv3hp1/aLtDri5UT7Ced48=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr28043590vsc.9.1670491681153; Thu, 08
 Dec 2022 01:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20221205132207.94775-1-andrew@aj.id.au> <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <01a47fff-c21d-4309-a7a2-fa7a87f4e024@app.fastmail.com>
In-Reply-To: <01a47fff-c21d-4309-a7a2-fa7a87f4e024@app.fastmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Dec 2022 10:27:50 +0100
Message-ID: <CAMRc=MchiuLWy1yrO-HNVtUFyJjFK2Jdp_aBjomL9n5JAgv_Vw@mail.gmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 8, 2022 at 5:23 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 6 Dec 2022, at 05:25, Bartosz Golaszewski wrote:
> > On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >> Hello,
> >>
> >> Based on a recent poke [1] and in-between meetings I've put together a
> >> WIP series that converts libgpiod's build from autotools to meson. As
> >> far as I'm aware the meson build supports all the significant options to
> >> enable or disable features exposed by the autotools build:
> >>
> >> * Tests
> >> * Tools
> >>   * Interactive gpioset
> >> * Bindings
> >>   * C++
> >>   * Python
> >>   * Rust
> >> * Documentation
> >>   * Manpages
> >>   * Doxygen
> >>
> >> [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
> >>
> >> Meson has pretty good support for handling python and so the patch does
> >> away with setup.py entirely.
> >
> > Eek! No, please do keep setup.py. Autotools too is capable of building
> > python C extensions on its own and it's what we use in v1 but I want
> > the python code to be built the standard python way. I actually plan
> > to post libgpiod v2 on pypi and split out building python bindings
> > into a separate bitbake recipe in meta-openembedded using the
> > setuptools3 class.
> >
> > So let's keep setup.py and just call it from meson.
>
> I've poked at this for a little while and it's not a great experience.
> Meson's design pushes back against calling out in this way, and I don't
> really have the motivation to carry on fighting it to make it do what
> you request. Unless someone else has that motivation, I think there are
> two options if meson is still desired:
>
> 1. Use the meson python support as posted in this series
> 2. Split out the python (and probably rust) bindings, keeping the
>    dependency relationships pointing in one direction and using the
>    language's own package management tooling.
>
> Given there's nothing to do in the install phase for rust we don't have
> as big of an issue there, but it is problematic for python.
>
> Let me know which way you want to go, including if you want to abandon
> meson :)
>

No, I don't want to abandon it. What is the problem exactly? Is meson
unable to simply add external commands to its ninja output?

Bart
