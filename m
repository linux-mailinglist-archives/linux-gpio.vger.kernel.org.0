Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3B6276B79
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 10:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIXIJ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 04:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXIJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 04:09:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87566C0613CE;
        Thu, 24 Sep 2020 01:09:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so1425319pfi.4;
        Thu, 24 Sep 2020 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=89mYYyU5CP/vNh9r0QB1xyWvou3jF1r0AJ18PMNgyq8=;
        b=T/mll2pp8Rw5b/I3IM284sBZ3oFqKBpr/SGwnXyysm8fPXOS2Qf3cwECp4w5womlkk
         Vu2wALdADfSgjcTCoeqgVjZwrXnNDf5OtLcPXBydIjGoms46b/6XbdZficVct4WnFnT5
         ibg/k0FK59+c9VKe1vIhW4qLy7Pi5J9bpHm7g86e44PfBUNtbYdIF2XbepqMnbmOmJro
         +9t7e51SEBJFJKFawO5jqNeGOOMxIjnkH49H/hBGkteJo7qgbxPidS/MjN18FGSycwbW
         wKm6GSX12XLSJSddD5GDmzhfT+Ga8oQ1OdA0XmcSb1wqDQJJY2FpeH1Z1P4kv9fWvM9c
         XEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89mYYyU5CP/vNh9r0QB1xyWvou3jF1r0AJ18PMNgyq8=;
        b=Y31YlgKOwiAU9LvCueNR0D4HmdMDCmccNIkWTpdBNgP6X5tby75F/erdMVcEFyjn+Z
         ovtR4YLLLEmogbJFlqPdvQDHnEN5EKx395QRnu66ZsI80pkahkeL1+xvivW4AHwFkVkf
         r5l38AHs8qaFxSKBc0XU3lHpJmqXsMd3Jg0QYtFMGdpRiQ8Kox5+aFOWTSsuuBQSeXGW
         ItFZJnCJNZq3SbnXMMyE22dbdQpgIWvMWKqSUEgQOhfHw0zLgei7zJLxjUPbahdhEZin
         cB5fkZl/8T+K20TBOMNYQbq9pOWxHgv1fVJnugPcE6EcprBQ1/6kJfHNm0CC2GSAEtxJ
         vbfw==
X-Gm-Message-State: AOAM530DBNUBu7xZCxD8kTP8G+W/UbDLEBW1j1ir0vJhP5sTS8qshU75
        D0roFk9Geql176vCuk0N/IU=
X-Google-Smtp-Source: ABdhPJzBoOYPN+peoGAGQF5/hhIqkb1Of3W2IaB9n8MRdnao3Om13RxhCH8frW4uqclwRTnUY4Wx9Q==
X-Received: by 2002:aa7:948d:0:b029:13e:cb8d:60e0 with SMTP id z13-20020aa7948d0000b029013ecb8d60e0mr3533226pfk.9.1600934966923;
        Thu, 24 Sep 2020 01:09:26 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id n2sm1855653pfe.208.2020.09.24.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 01:09:26 -0700 (PDT)
Date:   Thu, 24 Sep 2020 16:09:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200924080921.GE17562@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-8-warthog618@gmail.com>
 <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 02:11:54PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> >
> > The struct linereq implementation is based on the v1 struct linehandle
> > implementation.
> 
> ...
> 

Ooops, nearly missed this one...

> > +       /*
> > +        * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> 
> You see, in some cases you are using "OR:ed" as understandable for
> programmers, and here & which should be and in plain English and
> really confusing from a programmer's perspective. That's why I prefer
> to see plain English rather than something which is full of encoded
> meanings.
> 

Understand these are pulled directly from the v1 implementation, so I
think that is actually one of Bart's.

But, yeah, it should be 'and'.

> > +        * the hardware actually supports enabling both at the same time the
> > +        * electrical result would be disastrous.
> > +        */
> 
> ...
> 
> > +       /* Bias requires explicit direction. */
> > +       if ((flags & GPIO_V2_LINE_BIAS_FLAGS) &&
> > +           !(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> > +               return -EINVAL;
> 
> Okay, since this is strict we probably may relax it in the future if
> it will be a use case.
> ...
> 

Again, this is drawn directly from the v1 implementation, and I didn't go
changing anything from v1 without good reason.

> > +       /* Only one bias flag can be set. */
> 
> Ditto. (Some controllers allow to set both simultaneously, though I
> can't imagine good use case for that)
> 
> > +       if (((flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED) &&
> > +            (flags & (GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN |
> > +                      GPIO_V2_LINE_FLAG_BIAS_PULL_UP))) ||
> > +           ((flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN) &&
> > +            (flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)))
> > +               return -EINVAL;
> 
> ...
> 
> > +static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
> > +                                                   unsigned long *flagsp)
> > +{
> 
> > +       assign_bit(FLAG_ACTIVE_LOW, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
> 
> What I meant is to attach also this to the other assign_bit():s below.
> And just in case a question: why not __asign_bit() do we really need atomicity?
> 

These are initialized as per their order in the flags so it is easier to
tell if any are missing.

The atomicity is not required here, but it is elsewhere so you are
oblidged to use it for all accesses, no?

> > +       if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
> > +               set_bit(FLAG_IS_OUT, flagsp);
> > +       else if (flags & GPIO_V2_LINE_FLAG_INPUT)
> > +               clear_bit(FLAG_IS_OUT, flagsp);
> > +
> > +       assign_bit(FLAG_OPEN_DRAIN, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
> > +       assign_bit(FLAG_OPEN_SOURCE, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
> > +       assign_bit(FLAG_PULL_UP, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
> > +       assign_bit(FLAG_PULL_DOWN, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
> > +       assign_bit(FLAG_BIAS_DISABLE, flagsp,
> > +                  flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
> > +}
> 
> ...
> 
> > +static long linereq_get_values(struct linereq *lr, void __user *ip)
> > +{
> > +       struct gpio_v2_line_values lv;
> > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > +       struct gpio_desc **descs;
> > +       unsigned int i, didx, num_get;
> > +       int ret;
> 
> > +       /* NOTE: It's ok to read values of output lines. */
> > +       if (copy_from_user(&lv, ip, sizeof(lv)))
> > +               return -EFAULT;
> > +
> > +       for (num_get = 0, i = 0; i < lr->num_lines; i++) {
> > +               if (lv.mask & BIT_ULL(i)) {
> > +                       num_get++;
> > +                       descs = &lr->lines[i].desc;
> > +               }
> > +       }
> 
> So what you can do here is something like
> 
> DECLARE_BITMAP(mask, u64);
> 
> ...
> 
> bitmap_from_u64(mask, lv.mask);
> num_get = bitmap_weight(mask, lr->num_lines);
> if (num_get == 0)
>   return -EINVAL;
> 
> for_each_set_bit(i, mask, lr->num_lines)
>       descs = &lr->lines[i].desc;
> // I'm not sure I understood a purpose of the above
> // ah, looks like malloc() avoidance, but you may move it below...
> 
> > +       if (num_get == 0)
> > +               return -EINVAL;
> > +
> 
> > +       if (num_get != 1) {
> 
> ...something like
> 
> if (num_get == 1)
>   descs = ...[find_first_bit(mask, lr->num_lines)];
> else {
>  ...
>  for_each_set_bit() {
>   ...
>  }
> }
> 

As per elsewhere - will give it a shot.

> > +               descs = kmalloc_array(num_get, sizeof(*descs), GFP_KERNEL);
> > +               if (!descs)
> > +                       return -ENOMEM;
> > +               for (didx = 0, i = 0; i < lr->num_lines; i++) {
> > +                       if (lv.mask & BIT_ULL(i)) {
> > +                               descs[didx] = lr->lines[i].desc;
> > +                               didx++;
> > +                       }
> > +               }
> > +       }
> > +       ret = gpiod_get_array_value_complex(false, true, num_get,
> > +                                           descs, NULL, vals);
> > +
> > +       if (num_get != 1)
> > +               kfree(descs);
> > +       if (ret)
> > +               return ret;
> > +
> 
> > +       lv.bits = 0;
> > +       for (didx = 0, i = 0; i < lr->num_lines; i++) {
> > +               if (lv.mask & BIT_ULL(i)) {
> > +                       if (test_bit(didx, vals))
> > +                               lv.bits |= BIT_ULL(i);
> > +                       didx++;
> > +               }
> > +       }
> 
> So here...
> 
> > +       if (copy_to_user(ip, &lv, sizeof(lv)))
> > +               return -EFAULT;
> > +
> > +       return 0;
> > +}
> 
> ...
> 
> > +       /* Make sure this is terminated */
> > +       ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> > +       if (strlen(ulr.consumer)) {
> > +               lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
> > +               if (!lr->label) {
> > +                       ret = -ENOMEM;
> > +                       goto out_free_linereq;
> > +               }
> > +       }
> 
> Still don't get why we can\t use kstrndup() here...
> 

I know ;-).

Another one directly from v1, and the behaviour there is to leave
lr->label nulled if consumer is empty.
It just avoids a pointless malloc for the null terminator.

Cheers,
Kent.
