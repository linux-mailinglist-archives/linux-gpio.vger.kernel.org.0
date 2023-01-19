Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFAD673CDA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 15:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjASOzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 09:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjASOzf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 09:55:35 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B90C75A18;
        Thu, 19 Jan 2023 06:55:34 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id m12so1660139qvt.9;
        Thu, 19 Jan 2023 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuSHIMi100SjCMXyOYZNA55sNFG4gfYNgu8GWlVIKt4=;
        b=KRGLD1IRUeh365ARvjPFu9EMF/uDhkb3MyNt9+Puodgz0h31D4Fj3ZTTdbYaKTZyHV
         Oc7dm3T3Y1aOGNDc7uLQirBt7hSX0GBM0wrOKgJQv6Ozf3gZB+XHmot/khh0VSNnvpZj
         dDKZ9y4NFIDjIkHsKGaN2NIXUBfyjRjthIzL22bNF1BRPXR5fknewjq9gOAyk/3roNVV
         HfWxoMPRmkYXWW7vGu2UtjGOW8mrW201j9N/crmBkJPdrbLAhW0wQcxp6YY2lR9Kv/7H
         A2Y4I7GYe1/dgvUCS733hsRRNgog3nNYVr9A/9XRfSA+qYWDiYH36MDYLd8qO+qcRew+
         eK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuSHIMi100SjCMXyOYZNA55sNFG4gfYNgu8GWlVIKt4=;
        b=lubXXvlqBVIpA60QpU1FBsnVtmFFqX10qaD1DB4dajszBE874LwTd6w60W6mbUTaPA
         4mS4I8D1EYiZsp5OTZs3lgaEoMddILwSVhIOxS/GcrxqNKAKjja/kyxOJ9SgJkcewD3b
         7tV4ZBBDEBGm4ud8fhPERh4rg7gyzC5Vdt68uwewLPlO8hx7Q9VcWGe178RLdV301k91
         TyaqhO1FbQ+dE6U0lvjgMhmRA4Zn34ibtAbjoYHCfw3imz0qLBTto571gpGA0yITUyVH
         Rfdvgyp/7Qf1V03kvJilfSdsa7JV8d7FkJKCbOMhicxQtlx1OHp7yCqCWTzAYHhEn+qM
         6Kcg==
X-Gm-Message-State: AFqh2kofB+XjliWj9ndbz3cQkPSBK4Rz36PAb8FdLo7IJ6op8VIBdDAo
        RR1cnIrhm5Yq86XmK90IkoUvx7rAFRysuXE8+yw=
X-Google-Smtp-Source: AMrXdXubsgfZ3wzyVdKl2A9HpcN8mWntdfDZIcBi9M//XkVzfxLrDyJjnWuZkZ0lxhe3zqNwGl5objy5U0PkaTTzUbo=
X-Received: by 2002:a05:6214:418e:b0:532:2c82:95ac with SMTP id
 ld14-20020a056214418e00b005322c8295acmr696888qvb.97.1674140133179; Thu, 19
 Jan 2023 06:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-5-hdegoede@redhat.com>
 <CAHp75VcCEJVx71H9MqNqPP+KAMDzgpx5v1P9h_h375ejeMa2+g@mail.gmail.com> <53af2be7-8a10-2ea4-83f7-501668f8042a@redhat.com>
In-Reply-To: <53af2be7-8a10-2ea4-83f7-501668f8042a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Jan 2023 16:54:57 +0200
Message-ID: <CAHp75Vd1TjAedSGmA=fQTy-f5NsZDG96VCxtbLN2Nf+rUOo-TA@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2023 at 4:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/19/23 15:04, Andy Shevchenko wrote:
> > On Thu, Jan 19, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +/*
> >> + * This is used to tell led_get() device which led_classdev to return for
> >> + * a specific consumer device-name, function pair on non devicetree platforms.
> >> + * Note all strings must be set.
> >> + */
> >> +struct led_lookup_data {
> >> +       struct list_head list;
> >> +       const char *led_name;
> >> +       const char *consumer_dev_name;
> >> +       const char *consumer_function;
> >> +};
> >
> > I'm wondering if it would be better to have something like
> >
> > struct led_function_map {
> >        const char *name;
> >        const char *function;
> > };
> >
> > struct led_lookup_data {
> >        struct list_head list;
> >        const char *dev_name;
> >        const struct led_function_map map[];
> > };
>
> Thank you for the review.
>
> Since led_lookup_data now is variable sized, AFAIK this means that
> the led_lookup_data now can no longer be embedded in another struct and
> instead it must always be dynamically allocated, including adding error
> checking + rollback for said allocation.

I'm not sure what you are talking about here. GPIO lookup table
defined in the same way and doesn't strictly require heap allocation.
For the embedding into another structure, it can be as the last entry AFAIU.

> If you look at the only current consumer of this:
>
> [PATCH v4 09/11] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
>
> then the code there would become more complicated.

> > as you may have more than one LED per the device and it would be a
> > more compressed list in this case. I'm basically referring to the GPIO
> > lookup table.
>
> Right, but having more then 1 GPIO per device is quite common while
> I expect having more then 1 (or maybe 2) LEDs per device to be rare while
> at the same time the suggested change makes things slightly more
> complicated for consumers of the API which know before hand how much
> lookup entries they will need (typically 1).
>
> So all in all I believe staying with the current implementation is better
> but if there is a strong preference to switch to the structure you suggest
> then I have no objection against that.

I have no strong opinion, I just want to have fewer variants of the
lookup tables.
Anyway, reset framework has something similar to yours. Question: can you
rename fields to be something like dev_id, con_id, etc as it's done in the most
of the lookup data types?

-- 
With Best Regards,
Andy Shevchenko
