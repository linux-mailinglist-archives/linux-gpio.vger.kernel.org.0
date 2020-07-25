Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F145C22D9E4
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 22:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgGYUwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 16:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgGYUwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 16:52:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E9CC08C5C0;
        Sat, 25 Jul 2020 13:52:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m16so6220855pls.5;
        Sat, 25 Jul 2020 13:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hhs+1xM7FhyybbR0iXVsCSFCjTnqQqQ71jqS9xdAn3Y=;
        b=IPRH08HKCRZ88hk4TmoW2iHRPZN33mH1aL4FzajE0Nohrf0HwdaOi9MDoFZCAcpPCM
         ZlGvT0ffQpDcD23LL/tB1jsChRCoQarOw+00bSBKIxX02d0VUmqLVySh1LgRh+WAA0ZK
         kV5qd8GZVmhRhBQlxPTe0Uec7tMhKyDyJJqHH9JKDYNKR2+NDxfsrVPSIOWIfip/ddF2
         rUhz6JmMGyCF5K71HJo6O1FvBU4Ve0/++KyR+WjD+G87KMXF1chWsvyR9iQgV6LNXh4i
         c3qHniK+vvCgc9PxBMksKf9Yk6puB+NphBCyq5+coXHs/3O2IPMndYUgz9n5e2cgv+JF
         qrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hhs+1xM7FhyybbR0iXVsCSFCjTnqQqQ71jqS9xdAn3Y=;
        b=p63zmhVweZ6eH8880Sq8B8FxVbxxRN4NbKeqVpGdAaTRoB78NlkGylRhZm5NwhH4XI
         cMAtneCmfLHSPMDyIcNPiH/W/aLi5fKrjtmD8aLX61ls9A6HORh/hfWtciGeL9u1naKJ
         MBBpXklDf9Q9TJ7tboJbWhL5zXJUxM61julZ8eh7W7f5g2Vm/RglGiieRXfrK+HHgSiu
         M3Q1tqeZTIEpz+9VD4mRQKmhE0MNLb82ZVkh+7InCM76muKmbnBowOSp9KjGhnzjyB4F
         TL+gScZWcV47mH34B29zn6FLCk3od5nmtMGEJi/68Gv5LfyUXiJBx+sKSZj9HMbQS5uu
         mZfA==
X-Gm-Message-State: AOAM530dfKdpUMDPjFVUlKFmZSZUJRVkPrdq+bFFOLi9qLwlEKaBm9N+
        sulSfZx1F8UaFNtbX5a9Z7Ja9ippC/mSSViCsNE=
X-Google-Smtp-Source: ABdhPJzPqCteWw8LxG2tqCKe06Uf2hNJGql0o3mluy8ww/Kdu18ydX800zwKZMQNiRMY4/oK4CqHcUmuxQ5a+r8kT+k=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr11307651pjb.181.1595710330583;
 Sat, 25 Jul 2020 13:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-6-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-6-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Jul 2020 23:51:54 +0300
Message-ID: <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and GPIOLINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 7:24 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for requesting lines using the GPIO_GET_LINE_IOCTL, and
> returning their current values using GPIOLINE_GET_VALUES_IOCTL.

...

> +struct line {
> +       struct gpio_device *gdev;
> +       const char *label;
> +       u32 num_descs;

> +       /* descs must be last so it can be dynamically sized */

I guess [] implies above comment and thus comment can be dropped.

> +       struct gpio_desc *descs[];
> +};

...

> +static bool padding_not_zeroed(__u32 *padding, int pad_size)
> +{
> +       int i, sum = 0;
> +
> +       for (i = 0; i < pad_size; i++)
> +               sum |= padding[i];
> +
> +       return sum;
> +}

Reimplementation of memchr_inv() ?

...

> +static u64 gpioline_config_flags(struct gpioline_config *lc, int line_idx)
> +{
> +       int i;
> +
> +       for (i = lc->num_attrs - 1; i >= 0; i--) {

Much better to read is

unsigned int i = lc->num_attrs;

while (i--) {
 ...
}

> +               if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_FLAGS) &&

> +                   test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))

This casting is not good. What about BE 32-bit architecture?

> +                       return lc->attrs[i].attr.flags;
> +       }
> +       return lc->flags;
> +}
> +
> +static int gpioline_config_output_value(struct gpioline_config *lc,
> +                                       int line_idx)
> +{

Same comments as per above.

> +}

...

> +static long line_get_values(struct line *line, void __user *ip)
> +{
> +       struct gpioline_values lv;

> +       unsigned long *vals = (unsigned long *)lv.bits;

Casting u64 to unsigned long is not good.

> +}

...

> +static void line_free(struct line *line)
> +{
> +       int i;
> +
> +       for (i = 0; i < line->num_descs; i++) {

> +               if (line->descs[i])

Redundant?

> +                       gpiod_free(line->descs[i]);
> +       }
> +       kfree(line->label);
> +       put_device(&line->gdev->dev);
> +       kfree(line);
> +}

...

> +       /* Make sure this is terminated */
> +       linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
> +       if (strlen(linereq.consumer)) {
> +               line->label = kstrdup(linereq.consumer, GFP_KERNEL);

kstrndup() ?

> +               if (!line->label) {
> +                       ret = -ENOMEM;
> +                       goto out_free_line;
> +               }
> +       }

...

> +               struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);

I prefer to see this split, but it's minor.

> +               if (IS_ERR(desc)) {
> +                       ret = PTR_ERR(desc);
> +                       goto out_free_line;
> +               }

...

> +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> +                       offset);

Perhaps tracepoint / event?

-- 
With Best Regards,
Andy Shevchenko
