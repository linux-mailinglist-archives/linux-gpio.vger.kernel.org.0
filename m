Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B02329DCE7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 01:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbgJ1WXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732712AbgJ1WWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:22:46 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7F4C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:22:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id r10so334061plx.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e0WV5pLxEioPyPbCZvINirWvsYtOLdelHBXJDNC1ihQ=;
        b=EpZxbBEpzluh0EEnfKCCLiHWMHbFnx7ndJ7NV8YS7HYgw2sbwNmrfXe5/e/WAjmFOC
         DU6qTPV3L9QiK/3DnX8DmciXe4d0ru8XnQF3kzN99ZhI9jKFh5oK/MWfYqoeWzrSgXce
         YNkfiO09fIn1POzePTuqEmoao2Q48bIcPJiQzWUZZKcSP+ykS7laf4/0YR49KoeloDg3
         AWu+ZqkZdbCcwx5fwUFr6lULm+S08oVepsdimox9jm1KrnyfDZF2keDFNTcd/XbzlZzb
         n+wJ/8GJWDoewEdFz2XP337NnsdlBSBEw/hwCNbHAnkulmp0zTFjBCBW2n2kns7CpLjY
         l4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0WV5pLxEioPyPbCZvINirWvsYtOLdelHBXJDNC1ihQ=;
        b=B2W2A6R6SiHktZ0VOS+2rCWBzgFvswjzi6fpyCjGZ311zzFE4BScPBi4WVDxxvLq8Y
         EC4+0EypMDBNYJ/5ATLMAZTXeM9s1322MmramBxtgePsFdpPKLd8IYdXs3wlRNTJrXmL
         HWV/s/v/rYforQp69V9Ksg2t6cxieSzayhhE3ugeKvZdUtdKUphr4vBIULUqDvumBA/b
         EJ1UwhopXa6OW8UfJ6AjKR5Io0OWz2u4o30JaiydWGiPJf04XiZV2lmpsW9VwPrcoHVe
         AliecPG4YA3mxhgwlr84Wl6/6UIQ7SGBSHGgmvGvjFK7/Y3BqE5VOkjpZ56UXatTiRq+
         hgcw==
X-Gm-Message-State: AOAM533jQna2BbmWfhm5QbZC7MQHg4iaBwUo+kv0PbpRaUHiHp2NZO/i
        j33R0VdEYuzv3NmvzxednIiuast6L2z1RXRc5Nwg+CG/f9fUzA==
X-Google-Smtp-Source: ABdhPJy9j0oSVg+HgAVPCAQ7kM9VWhplFZ/2AJi5PeOIva7axydMIxHQ94y8u6GDlqaEwQMsP14NpW0BWmrZSfHq+dk=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr753815plt.17.1603916941958; Wed, 28 Oct
 2020 13:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
In-Reply-To: <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Oct 2020 22:29:50 +0200
Message-ID: <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 6:15 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Oct 22, 2020 at 6:26 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > It _seems_ between
> >   79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
> > and
> >   14e85c0e69d5 ("gpio: remove gpio_descs global array")
> > the "Interacting With the Legacy GPIO Subsystem" of GPIO consumer
> > interface is correct.
> >
> > But is it the case afterwards?
> >
> > Details of the question are here [1].
> >
> > [1]: https://stackoverflow.com/q/64455505/2511795
>
> I don't know if I even understand the question right, but gpio_to_desc()
> can be called at any time as long as there is a struct gpio_chip with
> the global GPIO number assigned to it. It will just index into the
> array of descriptors stored inside the chip and return a pointer.
> The allocation of the memory lives with the struct gpio_chip.
>
> If for example that chip is on USB and you unplug that USB
> cable, naturally referencing the descriptor after that point
> will cause disasters.
>
> The gpio_request()/free() doesn't really allocate or free
> any memory at all. This is why we call gpio_to_desc() first
> thing in the legacy functions.

The section titled "Interacting With the Legacy GPIO Subsystem"
describes as far as I got it the interaction of gpio_to_desc() and
desc_to_gpio() with new / legacy APIs along with their scope. But is
that description correct after the above mentioned commit, i.e.
14e85c0e69d5 ("gpio: remove gpio_descs global array") when we lose the
always-present data structure (if I'm not mistaken)?

-- 
With Best Regards,
Andy Shevchenko
