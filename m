Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB65D2756E4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 13:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgIWLMO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 07:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWLMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 07:12:13 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E91C0613CE;
        Wed, 23 Sep 2020 04:12:13 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p16so54775pgi.9;
        Wed, 23 Sep 2020 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YbTLMhc/PFHCK+c6yLpmglBDEktYs2KKCRMTusR0Uuo=;
        b=qjsl47zWuZ8A9LusIvWB2t5aq8UuJYUZ/4nQ5MWVvTBHX5U3JhkfTBO9ndLdQTaVoI
         L0OyvW0qXCUhNNhv6MgAJsGijQV/N66pe4h20Ap6TdD7Xt5GqYqJaZeOqDtKYDWjhEuf
         WZ/hr8kXvbA57mNKadi6gkHqHyeG95QRkoU2whCiNP3ckd/reOPJEbXNsKXdsYfgr9P5
         32Eie5fLVg61s+X1g0dfLd3Ey65cm/E8y78WS5XpmXWKqzaSnI7ZOQM7/dm82h1L2+Eb
         wQqegTxqEN8dDK1QTzJkFel2YMcgcXQnOQp05JnC0rpWw8QaXy1agGcaQ2GjqgpElXm4
         jYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YbTLMhc/PFHCK+c6yLpmglBDEktYs2KKCRMTusR0Uuo=;
        b=ZcU8C+dE5hsvt6RlwSXnWt48D8nLebWAgPSud1nShLPBX3WEzgri94+s4w8EJj2WsJ
         RTlCP40WqQ/hIXFwu/krh2r7hA0OTY59js4h6S3BYjJo0s95PEcRNN+6j0FyxEzDIHN4
         5MytHQ6QLKKXSi5qD7id87jOKADJEgMRdZPHv+b5rHnqEFD5nPCgkcPwZ2XGg4i9avRk
         hBhQzhdk01brjXl5usSklwRWjhP5F/LdLkapfV7Sxk+oDNAKusbXctIgN6ELTxPD4EOV
         7vu7eoea5HplxCNl2E/OjBe5pMY2J7RDjsSKlkkC6ZaCS83sIRVD78hmsO1qKvMFKQDQ
         iZHQ==
X-Gm-Message-State: AOAM533grOUQQ15YMcKFX5TmNDFdc99mJTtEyVycdXC2QGT/0YC+yq0c
        tf3m/b/ofDPr1AqkoUgQNed02GcAggXSqz3EW0ERgE2TlWtzcp+o
X-Google-Smtp-Source: ABdhPJxz+vdpMeti/A6nwnMsCbDcNvbBGq6ovPO6ZcefaPgQt0USEHoCVgflk07sfhlEiSisswAluvFwnBx/EfMEcxU=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr1270724pfc.7.1600859533117; Wed, 23 Sep
 2020 04:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-8-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-8-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 14:11:54 +0300
Message-ID: <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
>
> The struct linereq implementation is based on the v1 struct linehandle
> implementation.

...

> +       /*
> +        * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If

You see, in some cases you are using "OR:ed" as understandable for
programmers, and here & which should be and in plain English and
really confusing from a programmer's perspective. That's why I prefer
to see plain English rather than something which is full of encoded
meanings.

> +        * the hardware actually supports enabling both at the same time the
> +        * electrical result would be disastrous.
> +        */

...

> +       /* Bias requires explicit direction. */
> +       if ((flags & GPIO_V2_LINE_BIAS_FLAGS) &&
> +           !(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> +               return -EINVAL;

Okay, since this is strict we probably may relax it in the future if
it will be a use case.
...

> +       /* Only one bias flag can be set. */

Ditto. (Some controllers allow to set both simultaneously, though I
can't imagine good use case for that)

> +       if (((flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED) &&
> +            (flags & (GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN |
> +                      GPIO_V2_LINE_FLAG_BIAS_PULL_UP))) ||
> +           ((flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN) &&
> +            (flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)))
> +               return -EINVAL;

...

> +static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
> +                                                   unsigned long *flagsp)
> +{

> +       assign_bit(FLAG_ACTIVE_LOW, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);

What I meant is to attach also this to the other assign_bit():s below.
And just in case a question: why not __asign_bit() do we really need atomicity?

> +       if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
> +               set_bit(FLAG_IS_OUT, flagsp);
> +       else if (flags & GPIO_V2_LINE_FLAG_INPUT)
> +               clear_bit(FLAG_IS_OUT, flagsp);
> +
> +       assign_bit(FLAG_OPEN_DRAIN, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
> +       assign_bit(FLAG_OPEN_SOURCE, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
> +       assign_bit(FLAG_PULL_UP, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
> +       assign_bit(FLAG_PULL_DOWN, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
> +       assign_bit(FLAG_BIAS_DISABLE, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
> +}

...

> +static long linereq_get_values(struct linereq *lr, void __user *ip)
> +{
> +       struct gpio_v2_line_values lv;
> +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> +       struct gpio_desc **descs;
> +       unsigned int i, didx, num_get;
> +       int ret;

> +       /* NOTE: It's ok to read values of output lines. */
> +       if (copy_from_user(&lv, ip, sizeof(lv)))
> +               return -EFAULT;
> +
> +       for (num_get = 0, i = 0; i < lr->num_lines; i++) {
> +               if (lv.mask & BIT_ULL(i)) {
> +                       num_get++;
> +                       descs = &lr->lines[i].desc;
> +               }
> +       }

So what you can do here is something like

DECLARE_BITMAP(mask, u64);

...

bitmap_from_u64(mask, lv.mask);
num_get = bitmap_weight(mask, lr->num_lines);
if (num_get == 0)
  return -EINVAL;

for_each_set_bit(i, mask, lr->num_lines)
      descs = &lr->lines[i].desc;
// I'm not sure I understood a purpose of the above
// ah, looks like malloc() avoidance, but you may move it below...

> +       if (num_get == 0)
> +               return -EINVAL;
> +

> +       if (num_get != 1) {

...something like

if (num_get == 1)
  descs = ...[find_first_bit(mask, lr->num_lines)];
else {
 ...
 for_each_set_bit() {
  ...
 }
}

> +               descs = kmalloc_array(num_get, sizeof(*descs), GFP_KERNEL);
> +               if (!descs)
> +                       return -ENOMEM;
> +               for (didx = 0, i = 0; i < lr->num_lines; i++) {
> +                       if (lv.mask & BIT_ULL(i)) {
> +                               descs[didx] = lr->lines[i].desc;
> +                               didx++;
> +                       }
> +               }
> +       }
> +       ret = gpiod_get_array_value_complex(false, true, num_get,
> +                                           descs, NULL, vals);
> +
> +       if (num_get != 1)
> +               kfree(descs);
> +       if (ret)
> +               return ret;
> +

> +       lv.bits = 0;
> +       for (didx = 0, i = 0; i < lr->num_lines; i++) {
> +               if (lv.mask & BIT_ULL(i)) {
> +                       if (test_bit(didx, vals))
> +                               lv.bits |= BIT_ULL(i);
> +                       didx++;
> +               }
> +       }

So here...

> +       if (copy_to_user(ip, &lv, sizeof(lv)))
> +               return -EFAULT;
> +
> +       return 0;
> +}

...

> +       /* Make sure this is terminated */
> +       ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> +       if (strlen(ulr.consumer)) {
> +               lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
> +               if (!lr->label) {
> +                       ret = -ENOMEM;
> +                       goto out_free_linereq;
> +               }
> +       }

Still don't get why we can\t use kstrndup() here...

-- 
With Best Regards,
Andy Shevchenko
