Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C1F28348C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 13:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgJELBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 07:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJELBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 07:01:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75342C0613CE;
        Mon,  5 Oct 2020 04:01:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q123so6638859pfb.0;
        Mon, 05 Oct 2020 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Osp4/+N3+YZvrvl/ejBqgXdbKyrkqPFZQidK9cO7Oxk=;
        b=WRoSNdtTfzjD/kqjh2kjdQRbaWr1jP83/UEn/n7nSlnuTQXql8dU7ugZLB8t6zIxnJ
         u1rJdAkbDi5c9UmyqH3I28xE2fIzPrGV7SAanUo+fuTacJ8zpOw0AQ+i3J6ID6OFkr1c
         SF8FUJEz7hoNsKRgmrzDDLUzTi25wcl3ySCI60uxabclopNKT4IyfccJQmYnV0vvM13u
         loQ2ToM1skwI51AGxPdp7tW6JWbr6DtrEwUU5Quvfi+mBCtdwa7H0jgSilLrmN17/arP
         CyFSU1vYICnLdzByooF/qScorreRu+3S/6CD4LAlBEZpxdZhCgAuhtP3qMNz58tvt1w9
         hhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Osp4/+N3+YZvrvl/ejBqgXdbKyrkqPFZQidK9cO7Oxk=;
        b=juv+pX1pfPN6HyUnxOneKvkFjakd8IWEqbzy9TtmlSKtFI/zgJ8UWhvxqO9rM6LWiq
         6+zJ/PF8Oz3sWv/kjxcQtMA1lRHHGnjbQz/STEtO2l0/YEDbnFXF/XFROlN9Q/OtYDG9
         L1OTFTJJ697GNdW1TpQllecKLqpGVOBjBuWHXyYGD7uawLFurYkDLe2EvFxGopYRTBXL
         FsluxvILN+6NzWnZ+YhLdRrnB1KXK05StCZeCgMhC15tIcxezkv1o1tfM+rSH2jQQnRx
         T5lZsnj1bxG+4k0Y6go08fZbP8EpzfToIqI1P7cB8M5T/YUtJShdAMXiFlrwtPwRh8I9
         U+ng==
X-Gm-Message-State: AOAM533SbdDTA4qhyZWQDOKW7mZCTNot3GmOqPsD6pZT9mIJlIKzlGyd
        4qoERxQuuDub8K9A7T5HQIrQb6h8VvjfzY61RkQ=
X-Google-Smtp-Source: ABdhPJz2Lk4AX/H7xWbbASg5PnJoWtyb/7CQTWRwMIHfK3DIxev5eh7y7nPHHLMH5fbem6VCDX8J8IvbE/n3tjGKEak=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr7228230pfo.40.1601895700982; Mon, 05 Oct
 2020 04:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com> <20201005070329.21055-6-warthog618@gmail.com>
In-Reply-To: <20201005070329.21055-6-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Oct 2020 14:01:22 +0300
Message-ID: <CAHp75VdJ7zqPtWXKp3cUqPw3ZT7K0Dxzf7NYK+Zk9ZBhAPqG4g@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: uapi: clarify the meaning of 'empty' char arrays
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 10:07 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Clarify that a char array containing a string is considered 'empty' if
> the first character is the null terminator. The remaining characters
> are not relevant to this determination.

>   * @label: a functional name for this GPIO chip, such as a product
> - * number, may be empty
> + * number, may be empty (i.e. label[0] == '\0')

I would rather put it like
"...may be empty string (i.e. label == "")"

And so on for the rest.

-- 
With Best Regards,
Andy Shevchenko
