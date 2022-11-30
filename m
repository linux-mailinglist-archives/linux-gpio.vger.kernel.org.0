Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE4D63DA6C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiK3QVF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiK3QVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:21:05 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322632C132
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:21:04 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id f68so8690788vkc.8
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UoyZVxA0aeRkEY8DynjV9LhVIJFEwgcgT6m1261Zygc=;
        b=b5ey7Yfqw1pkomNYrJWTEaCpGjP2CjsyRNBbachvh96oEg+teIOr93v/bEuOJLmFA0
         fhZE/w2drsULc5oSpAsZD6atx19hMnSbkVZv6GQIMPMKpl92x4Sf3tTCtwqY6DbYxIaK
         BUvrx/PshzDJtkI6hSk4hLAnj44AUof41T389z+r5Zp+YIO5X9jODOisiJHA4YmtarOi
         IynlvkuctjzCaD4kXwdob7baM1pGJkUFKD7BFSX43Yxk018/Dm0VOOYc1U7pRFtALn0M
         95o2yHYfgmQxZ8QWI37n6X86GM/9oOMe1GhekFb8TuCUBwjcAqkUUuCE19xhXnwRwQUh
         nR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoyZVxA0aeRkEY8DynjV9LhVIJFEwgcgT6m1261Zygc=;
        b=vPqJ8uJo5xHlbi6Za4186wE27h7KxeGTZuB9HmYsR73dae/Di2UQZfpDoo2mzwYV0+
         hu8ptYdFgfAHWruEwPGU9fF3SHiddWmJKvtoXy0Ni/bw4yII3dbDX0xAn+GQsExEIzA4
         hRhKGAk5SZ3tpnGV/txnGVMwcSzJFEowYEAzkJD2LXJceq1nUuIaYN7z0t1SgA8lqjfV
         BbUqbJI3LoWRA8xpAJ06kXfgNBW8GEZdtRG8HhqXbGg5G2EUMRpeV980e16xvx+FLuZW
         Dp22YeiD+cbwvP/c5dXrJURSe9eln0OalD+5inCmlroeJBMIhxMQbhbOAIbnb94r6CsQ
         l5kA==
X-Gm-Message-State: ANoB5pkfog9GD0bN+CEbiDO9bPuLBhbdHZWy1DD8eggxLFLrnAsMn8Ym
        UCNKvr2jGchdWHZhvJebBkna1omwOcVXRpJjOrgbGw==
X-Google-Smtp-Source: AA0mqf5ONF6N3CS9hm98hypUN9JMuCvInMH5iIQha33mWFioYK6dFKNTqqu9l/5bQwp4gBOkBb0X3sRFxfI+ic6WEwk=
X-Received: by 2002:a1f:1342:0:b0:3bc:cc16:f662 with SMTP id
 63-20020a1f1342000000b003bccc16f662mr11507400vkt.33.1669825263307; Wed, 30
 Nov 2022 08:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20221130124231.1054001-1-brgl@bgdev.pl> <20221130124231.1054001-8-brgl@bgdev.pl>
 <Y4djKAW2Y1RQb98Z@smile.fi.intel.com>
In-Reply-To: <Y4djKAW2Y1RQb98Z@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Nov 2022 17:20:52 +0100
Message-ID: <CAMRc=MfUo2dq6qCiP4q0K0W2b=fBWdb9Jo3b6b=u9DQDQNArDw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 3:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 30, 2022 at 01:42:27PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add missing license text files and use the CC0-1.0 license for the
> > rust-specific .gitignore file.
>
> ...
>
> > diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
> > index 95054d9..6fe7bde 100644
> > --- a/bindings/rust/.gitignore
> > +++ b/bindings/rust/.gitignore
> > @@ -1,4 +1,6 @@
>
> > -# Added by cargo
>
> Seems like automatically generated, which means that next time something comes
> here may well screw up the below.
>

I think the comment refers to the *ignored* files *added* by cargo,
not saying that .gitignore was added by cargo.

Viresh, please confirm.

Bart
