Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DAE66D0FA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 22:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbjAPVh2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 16:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234282AbjAPVh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 16:37:27 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E692F2BED9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:37:25 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id z190so13916012vka.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 13:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aJyeMYB6SbVDkgl/V+1v7Af14AQO3G+rZXa3WOzIoRo=;
        b=5kgh2nE4B4kxpCXUB9pDrGUSxFmMyixorRMqX3tN6Ko09C5Ybwl8R9UENQbSZyTdd5
         T25cPADvDpBaVIZZETL2PAJBKjgarPkw8ZQ5ZzCcLx86jQ1EJEwu7Gp6wWsFwbBvvS79
         7ayQY+lZ4sPNEqJCpjwabvMq/Q4gWcy1oEuu5F8vVVuzg0Kd08WYiYFgxSWLstKOfl2A
         hm0AEny/dzHnLd7XljfjaFHpc4DTxZsQ6w5X5KGWg2PeB2wYJNI91fBE4aE1Q0KRgKKE
         FIdP2G4IulT2VX4MqH/XDqLUp3ZVZHDkCuhMDLf+oyXEhP78beUjxUHOTwxBmMnXDDxt
         2Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJyeMYB6SbVDkgl/V+1v7Af14AQO3G+rZXa3WOzIoRo=;
        b=aQB5mDynenogpJwe5WtBPOxSsByB0jYy0ACqPVK+dv7dsgtMDiNpPWyO8hR6gYxUVY
         u+JpveeWdq3di5BXE/rz0ZX8wLUPWAgUAC2JNsGb4KdiyQTBry5nzRbb0LzvYz8uTq7W
         YaLY0rkEDquphXKUoXMUCLOTRU4u7O0TifNKk+MVsSMBazIPG74uowecSA/Cl4Ybx4su
         5qzttO2014mdN4MTEMtbex1B9ekoLgmdgwenpscjsqg2W702myixqJ3xb0mEtpi+X8oT
         jPRe0EvuXPu9d/nbD8nUiiTBCSZfM7K3ikui5TCMUD7Qu6uUnq1jZoHdX9mxfHth57Xs
         r5+g==
X-Gm-Message-State: AFqh2krXyDZmJEigczjFrrfelVtLbQ4enmC/GjgOVOxm3YOYWzhpHGsh
        pnwQZFc6rdZcfUIsrix4tsnJ4Je4WgHx5bCw4ueknHFiaHT9UgZZ
X-Google-Smtp-Source: AMrXdXsw5/HTB7k942URuTdGwFUfVbhfkC+8fvSN0f3bcZHztjP4RP/ptm9SFDQXcJgbrpnsmrYdBXNAjqHxSk2ZraU=
X-Received: by 2002:a1f:3283:0:b0:3dd:f7cf:e67e with SMTP id
 y125-20020a1f3283000000b003ddf7cfe67emr89903vky.33.1673905044999; Mon, 16 Jan
 2023 13:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-5-brgl@bgdev.pl>
 <Y8SW/frUy16O67Kb@sol>
In-Reply-To: <Y8SW/frUy16O67Kb@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 22:37:14 +0100
Message-ID: <CAMRc=MeHatoHX3O5zUuxQ12G4h4DCi7xAuiJuXe5kXveXOoRpw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify gpiod_line_config/request_get_offsets()
 functions
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

On Mon, Jan 16, 2023 at 1:14 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jan 13, 2023 at 10:51:58PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have two functions in the C API that allow users to retrieve a list
> > of offsets from objects: gpiod_line_request_get_offsets() and
> > gpiod_line_config_get_offsets(). Even though they serve pretty much the
> > same purpose, they have different signatures and one of them also
> > requires the user to free the memory allocated within the libgpiod
> > library with a non-libgpiod free() function.
> >
>
> They differ because they operate in different circumstances.
> Requests are immutable, wrt lines/offsets, while configs are not.
> More on this below.
>
> > Unify them: make them take the array in which to store offsets and the
> > size of this array. Make them return the number of offsets actually
> > stored in the array and make them impossible to fail. Change their names
> > to be more descriptive and in the case of line_config: add a new function
> > that allows users to get the number of configured offsets.
> >
>
> Not sure symmetry => beauty in this case.
>
> > Update the entire tree to use the new interfaces.
> >
> > For rust bindings: also unify the line config interface to return a map
> > of line settings like C++ bindings do instead of having a function to
> > get settings by offset. A map returned from a single call is easier to
> > iterate over with a for loop than using an integer and calling the
> > previous line_settings() method.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> <snip>
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -780,19 +780,29 @@ struct gpiod_line_settings *
> >  gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
> >                                   unsigned int offset);
> >
> > +/**
> > + * @brief Get the number of configured line offsets.
> > + * @param config Line config object.
> > + * @return Number of offsets for which line settings have been added.
> > + */
> > +size_t
> > +gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config);
> > +
>               ^^^^^^         ^^^^^^^^^^
> Not a fan of the stuttering.
> What other kinds of lines are there in the config?

The user may not have an in-depth knowledge of the data model we use
and just wants to use the library. I think this name is much more
descriptive that way. It's not that long or repetetive, have you seen
udev_monitor_filter_add_match_subsystem_devtype() or
kmod_module_dependency_symbol_get_symbol()? :)

> Similarly requested lines in the request.
>
> >  /**
> >   * @brief Get configured offsets.
> >   * @param config Line config object.
> > - * @param num_offsets Pointer to a variable in which the number of line offsets
> > - *                    will be stored.
> > - * @param offsets Pointer to a pointer which will be set to point to an array
> > - *                containing the configured offsets. The array will be allocated
> > - *                using malloc() and must be freed using free().
> > - * @return 0 on success, -1 on failure.
> > + * @param offsets Array to store offsets.
> > + * @param max_offsets Number of offsets that can be stored in the offsets array.
> > + * @return Number of offsets stored in the offsets array.
> > + *
> > + * If max_offsets is lower than the number of lines actually requested (this
> > + * value can be retrieved using ::gpiod_line_config_get_num_configured_offsets),
> > + * then only up to max_lines offsets will be stored in offsets.
> >   */
> > -int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
> > -                               size_t *num_offsets,
> > -                               unsigned int **offsets);
> > +size_t
> > +gpiod_line_config_get_configured_offsets(struct gpiod_line_config *config,
> > +                                      unsigned int *offsets,
> > +                                      size_t max_offsets);
> >
>
> So, to be sure that they have all the offsets, the user needs to call
> gpiod_line_config_get_num_configured_offsets() before every call to
> gpiod_line_config_get_configured_offsets()?
> Unless they can be sure no lines have been added subsequently?
>

Yes. Just like when you add config for new lines and need to be sure
it hasn't changed between that and the request. Perfectly normal for a
library that doesn't provide any thread-safety.

> Another way of looking at it is that the old API combines those two
> functions in one, hence the difference from the request equivalent.
> The old way you got them all, no matter what and no questions asked.
> That seems simpler to me, so I'm not sure this is a step forward.
>

I'd like to avoid having the library provide resources that are then
managed with functions from outside of the library (even if it's a
standard library function). That's bad practice and we should provide
our own function for freeing the allocated resource which in turn
makes the API more complicated than what this patch proposes. We still
need that *_get_num_*() variant.

Bart
