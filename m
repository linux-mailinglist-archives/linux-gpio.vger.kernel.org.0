Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B342E29A813
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 10:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895751AbgJ0Jmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 05:42:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38951 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895750AbgJ0Jmo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 05:42:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id o7so464567pgv.6;
        Tue, 27 Oct 2020 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XCeec5IImxL2EGXfGQqgVj5bq/FQ6sYk1H41/XnYwtU=;
        b=TIGNx8Y4jEjyo+b7+5wApbszjIMBLHM2fsBg458QxhAvvvv4s8zZxCALWrqBhRrahb
         /odYggV8e8wy66I3MwdjPyB0gxtRUH1upAEmSo+JoSwBgViOusxtdO0WXsTn293siaF2
         F7bgZg6O0V6uD+geGKe10nDPvH6nxrjbkHDhut2RyTFv92W7TxznWQPRr+6pEjv4ZYhe
         QTU9eRG9o28mUDNkNPZ2Il/14ImuOuFq7w7suCFPH+uSbGpRxBMWAxFsGscN339DmVXB
         mWkxK3JS7NyyodfQcEVmWY77ZqWqO4jhoN/a8t16TsakpZFq8KMwdFBj7tQhdh7g3oNc
         3Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XCeec5IImxL2EGXfGQqgVj5bq/FQ6sYk1H41/XnYwtU=;
        b=h7/A818XVDnQQ0V4XwNXtKhlZ990uAr2xwbhKz6wd8JGORZ6cHAnVw9+X7LP27Sc6G
         RL4Flt7UiQDgcdSYSupzwowGAwWagh+avifHZMN9tOTOJIBLd0bgiWXCUyU58KNuUF3c
         5EBGqZ4+nvEKQOt7bGwc0Sv1A2DhEquFi7izAa+gKToLpwl03vQUmOw2w9yiOcUj0khy
         i2qUeDYUUEq4dEA+gn4YRfph7mCN6woPiQLy4eeYi9OHfJW0enJlHhKE12hiAg5TJD3J
         wr5CqTsM/A3SFc2rOJl+Kg9Zg9LqxFjF/xAWQkAg9RQ0jBDSqhwJoWf6RabUdynZ/Tu4
         AYHA==
X-Gm-Message-State: AOAM531SyNz3gOxT/3fqL3sxjw+Tw1z2Dl0JcynB3XBsKq/BfF/CcGZJ
        99LoenrtRakvegK7KGAU0EazdiSRqTu7ktyinmVEiLQsob8=
X-Google-Smtp-Source: ABdhPJyw0I0ivrd4JvJPVqMDPwksBG9fNzq0U+AZ/BV8tlThqbR4h/cBHc/ggmdt2xdVB4TldoQ9xD1ZBNZqv2OWgXA=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr718328pfd.7.1603791762715; Tue, 27 Oct
 2020 02:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201026151600.2703-1-coiby.xu@gmail.com> <CAHp75VfZ+-rJFWVpowXyViA99_9tA5VaFLfJGH1WF4W=kQHr8w@mail.gmail.com>
 <20201026231631.6l6kei3z45cunzmx@Rk>
In-Reply-To: <20201026231631.6l6kei3z45cunzmx@Rk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 11:42:26 +0200
Message-ID: <CAHp75VcLRjZDckuUDSsZ5KWfqFGRZbeEMSqMYSuF4P9iWt_LhA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: print debounce filter info in debugfs
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 1:16 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> On Mon, Oct 26, 2020 at 05:22:45PM +0200, Andy Shevchenko wrote:
> >On Mon, Oct 26, 2020 at 5:16 PM Coiby Xu <coiby.xu@gmail.com> wrote:

...

> >> +                               if (tmr_large) {
> >> +                                       if (tmr_out_unit)
> >> +                                               unit = 62500;
> >> +                                       else
> >
> >> +                                               unit = 15600;
> >
> >Side note: Hmm... Shouldn't be 15625? As 1/4.
>
> Thank you for discovering the inconsistency! I wrote these code based on
> amd_gpio_set_debounce. I'll send an email to the original author to
> confirm it.
>
> static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
>                 unsigned debounce)
> {
>      ...
>         if (debounce) {
>                 pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>                 pin_reg &= ~DB_TMR_OUT_MASK;
>                 /*
>                 Debounce        Debounce        Timer   Max
>                 TmrLarge        TmrOutUnit      Unit    Debounce
>                                                         Time
>                 0       0       61 usec (2 RtcClk)      976 usec
>                 0       1       244 usec (8 RtcClk)     3.9 msec
>                 1       0       15.6 msec (512 RtcClk)  250 msec
>                 1       1       62.5 msec (2048 RtcClk) 1 sec
>                 */

What the heck with HW companies! (Just an emotion based on the experience)
They like to use really bad precision when it's clear that the numbers
should be different (note the cycles, it's 1/4 sharp ratio).

>                 if (debounce < 61) {
>                         pin_reg |= 1;
>                         pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
>                         pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
>                 } else if (debounce < 976) {
>                         time = debounce / 61;
>                         pin_reg |= time & DB_TMR_OUT_MASK;
>                         pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
>                         pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
>          ...
> >
> >> +                               } else {
> >> +                                       if (tmr_out_unit)
> >> +                                               unit = 244;
> >> +                                       else
> >> +                                               unit = 61;

-- 
With Best Regards,
Andy Shevchenko
