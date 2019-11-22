Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A58E107323
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfKVN3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:29:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46522 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfKVN3y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:29:54 -0500
Received: by mail-lj1-f194.google.com with SMTP id e9so7327007ljp.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+Zc7Z97fvvNYHZnL1c1JIxGRQj+2WpocWRa+cXonDE=;
        b=IDL7ob5nX7sNC8DySqXW3eLlpoXTzpVE6NPwX6QSGY0Zw60mX9pYqxDVlaPXAyKEwG
         69iCabqzuza5RvNull7xO5wQV9fWZAEGL36eSd+mtLC8C9dWRl9E5venP912P4VCzJCT
         17gi9A7QnWGqmTGjAjqzCjsUqFJwhvZCfT7Fx8N2Zw3wSgzefAJ4+CLMsCdwGPDjgEPf
         jtsXQgeayqTAzGIl15ujsKAqD3gPDjevVAc7YnpRWuXnZm0SpMMsp316u9g1ox9yAkFM
         079HvOm5xazduN5QVrea3FZLjpznvlXJfqxe6xH8OsCJCoC7JbyCmAr5kSG+UePwvzsp
         96pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+Zc7Z97fvvNYHZnL1c1JIxGRQj+2WpocWRa+cXonDE=;
        b=aa5ZblmkL71F2ncF6dqNsQxIr15pa6prqKdAM61Nl/wa+6w3RWWeYIfF4THhYLtnSr
         eYtAKh0WurFErkQg82hUZrhiO4oCc58Qh/wOSfPYuR8JYsahXWEwgq24USsbKq8+JQY0
         r6C7bV8s3JGrL4KibTqDjwYTR3rNUH2XC7NsvfEHQgp7ovaua5ofimfsS+UiEXqiwLai
         Suh2xC3tpkcUlyaXe+M6Cr6jdXqMfaVyMchu3W+cr9sAPJM9FyF1FN6CKOAJrpzslpRD
         ad5IG/oR7wYnndiCfgQO0jYHtPlVpzyJQlb5/ih1KmtzQoDhIAulGvKRSSRloAlwfP7n
         poqg==
X-Gm-Message-State: APjAAAWHKCjWoTeGbKk9ocwpxCkDgYntyS4mU7enNhZoaiwzYyL0GxvP
        VfAHKJvOJ7SYjx4jIVBNMnB/M994YblTigxCo6sDDg==
X-Google-Smtp-Source: APXvYqwmSSOtVmBtX/HzWWq55yxz03Q3CaAmSGcHqiRIokiCHZLjK6quI6vEVqsvu5R0BpiQvgrlF6raTPg3lPC0DXg=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr12014078ljb.42.1574429390771;
 Fri, 22 Nov 2019 05:29:50 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYhLoGdGQt_jzj5aFa-EY_kMimoVShi7QFLG3sZbC436w@mail.gmail.com>
 <563f2fdf0c32103d95a53fc1e7fd84c0@walle.cc>
In-Reply-To: <563f2fdf0c32103d95a53fc1e7fd84c0@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 14:29:39 +0100
Message-ID: <CACRpkdZWP0CSDGPjkUOTuEkDSvBpoW0tN3ia+B74s1dfFGNinw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio : mpc8xxx : ls1088a/ls1028a edge detection mode
 bug fixs.
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hui Song <hui.song_1@nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 22, 2019 at 2:08 PM Michael Walle <michael@walle.cc> wrote:

> >> From: Song Hui <hui.song_1@nxp.com>
> >>
> >> On these boards, the irq_set_type must point one valid function
> >> pointer
> >> that can correctly set both edge and falling edge.
> >>
> >> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> >
> > Patch applied!
> >
> > Yours,
> > Linus Walleij
>
> mhh.. this bug should already be fixed in a better way with [1]:
>    gpio: mpc8xxx: Don't overwrite default irq_set_type callback

OK I drop this patch.

Yours,
Linus Walleij
