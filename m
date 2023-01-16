Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAC066D1BF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 23:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbjAPWXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 17:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjAPWXO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 17:23:14 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B47322018
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 14:23:13 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id 3so30425529vsq.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 14:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2DIrcdT7VNWMoLXDeQkSa0gYVyrYM16SewZle2fQdkg=;
        b=0mZeFjcYPPeaQUDr1fjtr8DVN8aedUT1CFviYI6H2JB9mi8IM7zpW+RXzcTXtCreK0
         D9ELVwtCk7fg9YQUCmvRV7cJGjt4XmipFfuGHOnDLNo/+rPM4C6FdksiXVK70q1Xwy+8
         3xyEvCIJGYmk0LmjybDNTydFtWuQP1255MPExEc0zsumfB9fstafptSfxMuytKzKDWAJ
         NkKHlWKPQLbnA/P+uaBL/pPOihv7RLyZmXryhX9IVO6yO/luQmZsXcR6upKrOSRtAIVa
         yXTr8yJNfiKGT4mPWZaSH7OQgqFB22gNAFvmuGUurivTp//MRzqmuV+j8+bL59S4pRyD
         9RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DIrcdT7VNWMoLXDeQkSa0gYVyrYM16SewZle2fQdkg=;
        b=jeWQ63EnwBykM6FS6qmf3x+7txq5sGciX2Lj0lDQmJIycnV5ja6Rf/GJ3TMC0E4wM4
         +ahAIwKxIJvLbLN7FrAi66DBaHw+GxAU9Xd7+8vdbGt5Zie/Rur3z04ip6M/ZrYE/596
         UppUZ1FAZQhLACKpwCr7bU3/cA+oyMWSoZlM2ZEB+LNUmqj1/VDYsgwjWQqM8FiONMfV
         UVLGdK2CoZsSUPZ6SEuSM4vkEYakip6ROOz6E7IwxBWIU6BTlwa1CNwH1JJvidhrHYtX
         fDwSa/qhCLHToIatoSz3Gmego1BxpIWw8E3F6oGhiRiu7J6cnfdWeF91R+R+IgFrt3so
         bDXA==
X-Gm-Message-State: AFqh2kq+w4Y1FSySHdXJMw1IAP3tEF6oH2Sh/vAo/2XdHNeabj9zHU2p
        VDZcgGvnSQBB/PeF7OlYFH8q9ePp2GBh710x78eEhw==
X-Google-Smtp-Source: AMrXdXusljTiEu0XyzMVep2kg2M6b/KiTI9fW7mxS1eTfblAFBJr/g9HKCu21UfDtK21Yb6AF41ADZ4yux5pHf+BLDo=
X-Received: by 2002:a67:fe89:0:b0:3d1:3753:9a3c with SMTP id
 b9-20020a67fe89000000b003d137539a3cmr58367vsr.73.1673907792383; Mon, 16 Jan
 2023 14:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-11-brgl@bgdev.pl>
 <Y8SXDmyq4kp8iRoX@sol>
In-Reply-To: <Y8SXDmyq4kp8iRoX@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 23:23:01 +0100
Message-ID: <CAMRc=MdXr6GuAJgyYj0fU-4xhppxTxpcH6Lu0XMUMHiC+jY5JQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 10/16] core: provide gpiod_line_config_set_output_values()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Mon, Jan 16, 2023 at 1:15 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jan 13, 2023 at 10:52:04PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Currently if user wants to use the same settings for a set of requested
> > lines with the exception of the output value - they need to go through
> > hoops by updating the line settings object and adding it one by one to
> > the line config. Provide a helper function that allows to set a global
> > list of output values that override the settings. For details on the
> > interface: see documentation in this commit.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  include/gpiod.h            | 27 +++++++++++++++
> >  lib/line-config.c          | 60 +++++++++++++++++++++++++++++++---
> >  tests/gpiod-test-helpers.h | 10 ++++++
> >  tests/tests-line-config.c  | 67 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 160 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index 8cede47..c552135 100644
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -785,6 +785,33 @@ struct gpiod_line_settings *
> >  gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
> >                                   unsigned int offset);
> >
> > +/**
> > + * @brief Set output values for a number of lines.
> > + * @param config Line config object.
> > + * @param values Buffer containing the output values.
> > + * @param num_values Number of values in the buffer.
> > + * @return 0 on success, -1 on error.
> > + *
> > + * This is a helper that allows users to set multiple (potentially different)
> > + * output values at once while using the same line settings object. Instead of
> > + * modifying the output value in the settings object and calling
> > + * ::gpiod_line_config_add_line_settings multiple times, we can specify the
> > + * settings, add them for a set of offsets and then call this function to
> > + * set the output values.
> > + *
>
> A helper such as this did cross my mind when updating gpioset, but I
> didn't consider it worth the effort then, and still don't.
>
> So the user has to set ALL output values, or more correctly the first num_values,
> right? i.e. it is the block form.
>
> This helper is only helpful if the user already has ALL the values in the
> required array format, as is the case for gpioset, else they need to build
> the array to pass - in which case they may as well call
> gpiod_line_config_add_line_settings() for each line.
> So is it really that helpful?

It seems to me that building/adding a separate settings object for
every line is quite cumbersome (I know that C is cumbersome in itself
but still...). IMO more so than just storing values in an array. And
in many cases the user may already know the right set of values in
which case it boils down to `static const enum gpiod_line_value vals[]
= { ... };`

This is also pretty much the equivalent of the
gpiod_line_request_set_values() function just run at request-time.

>
> The sparse form would be more generally useful, particularly in the
> bindings. i.e. they should accept a mapping from offsets to values rather
> than the ordered list.  Though, again, those may be best implemented with
> multiple calls to ::gpiod_line_config_add_line_settings rather than
> jumping through the hoops of constructing the parameters for another helper
> like this one.
>

I'd argue that this should be implemented in bindings using the new function.

> > + * Values set by this function override whatever values were specified in the
> > + * regular line settings.
> > + *
> > + * The order of the output values in the array corresponds with the order in
> > + * which offsets were added by ::gpiod_line_config_add_line_settings. For
> > + * example calling add_settings([1, 3]) and add_settings([2, 4]) and then
> > + * calling this function with the following logicall values : [0, 1, 0, 1]
> > + * will result in the following offset->value mapping: 1->0, 2->0, 3->1, 4->1.
> > + */
> > +int gpiod_line_config_set_output_values(struct gpiod_line_config *config,
> > +                                     const enum gpiod_line_value *values,
> > +                                     size_t num_values);
> > +
>
> But if you do keep it...
>
> Use documentation from gpiod_line_request_set_values(), suitably modified,
> to describe ordering - it is clearer and does not imply that the user has
> to independently know the order lines were added - it is in the order
> provided by gpiod_line_config_get_offsets().
>

I'd like to have some version of that. Maybe keep what I proposed for
C but have something more elaborate (with mappings?) for bindings? I
need to think about it tomorrow.

Bart
