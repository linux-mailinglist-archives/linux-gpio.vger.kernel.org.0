Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9356E281472
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 15:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbgJBNsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 09:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387777AbgJBNsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 09:48:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F253C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 06:48:21 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so794612pgo.13
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sze0ou7q46wsAILh6kKTslPm1LmIUTLp4G31ognqKwY=;
        b=Ueehi2/QJyEIftCwre2otp6WgoorwyolXjpCq1k7FDG90wqwB30mBY/Pny4PQIGFM6
         9/KZ3fgjj/4fpJ3hfQ4v6g4FtoNrxScHAEEg57YZmotA+OVvN6733BzAYHUlqpB2h9MZ
         eFu5u07WfGJEY805hf9VwGz9JJBR20xNzzrucNw2S2fEkFYjs0abF1egmDoJCU+ibc4M
         jPU4F9cvmxHB0SzdXnUinGY2nOFJ85Zzc9bKpbUaEYoYS8p3zWiqx/EfAd97oquc2dM4
         JZLT05vYtJpwZNVduLaowFpxq+LKvE2YBHgJFuPDA7yr/wBVirzs5jmHgwTJLkpaXfoK
         ppOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sze0ou7q46wsAILh6kKTslPm1LmIUTLp4G31ognqKwY=;
        b=GAeL4GprwjybAIAnHYBtoAyedzFgysag3S2XGYdCkIKzz9/eK5rBiLHIvDt7GTIwnr
         ViKEmSmrEoGSt1dGpA1lBJMK7sG1aQ/RH/c2A67b7HgSpdYguk5VX1GIWq+9Qy/EIZrM
         4bJOUVYMijzcQBTcHOeKftfyrD3OERJrpRutcwndta9iDogdObglNDqoFhVscnF/ENl+
         asryL0qxJsUGq74PRq2A/6fiNw/MJGWaepB6gx8MSETPbAbqAqVymCDvMNR85NanTCp8
         7WKsh7d8JmC7tIvnuaK/zrztCjOzv77cUPW36WYGiVzkiiKh5Sect7Bc66c3K5jbqETB
         W9Gg==
X-Gm-Message-State: AOAM533z0WAilAWREpD5CoemvVPca06XF3U4Am9prjAh3UTOtcXiR5+C
        Xw1heVArdR5eoOl+eb/rqtaBy0evCCPqJW8UCr8=
X-Google-Smtp-Source: ABdhPJxGW7C2vEsE8zvuGFAK154KXUayZNpqJ3JDRyiY7xC2y1AJVD2+RvjMzUgcLKmZ6os+IVE+ucRQyxP6PFr/occ=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr2911315pfn.73.1601646501084; Fri, 02
 Oct 2020 06:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063148.32667-1-warthog618@gmail.com>
In-Reply-To: <20201002063148.32667-1-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Oct 2020 16:48:02 +0300
Message-ID: <CAHp75VfVDsxHDcnwdO5TL=wx-rB6=cuCWOxj0oP7+kpZvKuH6A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 9:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Port existing implementation from GPIO uAPI v1 to v2.
> The libgpiod external interface remains unchanged, only the internal
> implementation switches from uAPI v1 to v2.

Cool!

> This is a minimal port - uAPI v2 features are only used where it
> simplifies the implementation, specifically multiple events on a bulk can
> now be handled directly by the kernel in a single v2 line request rather
> than being emulated by multiple v1 event requests.

...

> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
> +               bias_flags++;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> +               bias_flags++;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> +               bias_flags++;
> +       if (bias_flags > 1)
> +               return false;

Seems to me like an emulation of hweight(), although I don't know if
we have in standard libraries such.

...

> -       if (values) {
> -               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> -                       data.values[i] = (uint8_t)!!values[i];
> +       for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
> +               lines_bitmap_set_bit(&lv.mask, i);
> +               lines_bitmap_assign_bit(&lv.bits, i, values && values[i]);
>         }

Hmm... What about
       for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
               lines_bitmap_set_bit(&lv.mask, i);

  if (values) {
       for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
               lines_bitmap_assign_bit(&lv.bits, i, values[i]);
  }

?

...

>         /*
>          * 16 is the maximum number of events the kernel can store in the FIFO
>          * so we can allocate the buffer on the stack.
> +        *
> +        * NOTE: This is no longer strictly true for uAPI v2.  While 16 is
> +        * the default for single line, a request with multiple lines will

for a single

> +        * have a larger buffer.  So need to rethink the allocation here,

So we (I, ...?) need

> +        * or at least the comment above...
>          */

-- 
With Best Regards,
Andy Shevchenko
