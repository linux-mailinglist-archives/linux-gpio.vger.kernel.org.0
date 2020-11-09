Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078D82ABEF6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731493AbgKIOmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:42:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:56832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731491AbgKIOmL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 09:42:11 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5132B221E9;
        Mon,  9 Nov 2020 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604932930;
        bh=sqs6Ab6qmHb8wLjpO8+s17ibG0cExkZUhwdEEn/31RM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I0iWJXq7f8C4w8yCYfE3FJzyDJQWdci2e2Yo5BRR9N1qSpD90kCXxUr//h8p5d63l
         +zV4WPLmIRHHsTCfNzdRO/HdzzXaIZ7PKpQ76S7Yf4QyvazXUtPDly4j26hIe08QP8
         KbhJeRUpCqLE2tWq83v7JaAVW9L0uqPr3XV6+Kmk=
Received: by mail-ot1-f48.google.com with SMTP id j14so9125993ots.1;
        Mon, 09 Nov 2020 06:42:10 -0800 (PST)
X-Gm-Message-State: AOAM5331pGgHLlj7FzCqTxsUz1K5+Xs/9kzQx7QHfnWclOREc6+xkhEH
        O/aKcGAdyUbj6Mt3JV177qp1JSvSjBGlGXb4860=
X-Google-Smtp-Source: ABdhPJzeeo6JiBdT3OYlZsQwt9pc+G9cyqIJAbkyOtDcxvKwYR4vZ799vC2P3NypOkrxzEQQr00gdSY/oBLDecIaZeM=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr9636879otc.305.1604932929586;
 Mon, 09 Nov 2020 06:42:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu> <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed> <20201109134128.GA5596@shinobu>
In-Reply-To: <20201109134128.GA5596@shinobu>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 9 Nov 2020 15:41:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
Message-ID: <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 2:41 PM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
>
> One of my concerns is that we're incurring the latency two additional
> conditional checks just to suppress a compiler warning about a case that
> wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
> there's a way for us to suppress these warnings without adding onto the
> latency of this function; given that bitmap_set_value() is intended to
> be used in loops, conditionals here could significantly increase latency
> in drivers.

At least for this caller, the size check would be a compile-time
constant that can be eliminated.

> I wonder if array_index_nospec() might have the side effect of
> suppressing these warnings for us. For example, would this work:
>
> static inline void bitmap_set_value(unsigned long *map,
>                                     unsigned long value,
>                                     unsigned long start, unsigned long nbits)
> {
>         const unsigned long offset = start % BITS_PER_LONG;
>         const unsigned long ceiling = round_up(start + 1, BITS_PER_LONG);
>         const unsigned long space = ceiling - start;
>         size_t index = BIT_WORD(start);
>
>         value &= GENMASK(nbits - 1, 0);
>
>         if (space >= nbits) {
>                 index = array_index_nospec(index, index + 1);
>
>                 map[index] &= ~(GENMASK(nbits - 1, 0) << offset);
>                 map[index] |= value << offset;
>         } else {
>                 index = array_index_nospec(index, index + 2);
>
>                 map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
>                 map[index + 0] |= value << offset;
>                 map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
>                 map[index + 1] |= value >> space;
>         }
> }
>
> Or is this going to produce the same warning because we're not using an
> explicit check against the map array size?

https://godbolt.org/z/fxnsG9

It still warns about the 'map[index + 1]' access: from all I can tell,
gcc mainly complains because it cannot rule out that 'space < nbits',
and then it knows the size of 'DECLARE_BITMAP(old, 64)' and finds
that if 'index + 0' is correct, then 'index + 1' overflows that array.

      Arnd
