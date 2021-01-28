Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518EC307A80
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhA1QRA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 11:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbhA1QQl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 11:16:41 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A96C061573;
        Thu, 28 Jan 2021 08:16:01 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 11so4296789pfu.4;
        Thu, 28 Jan 2021 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j5smMsSfDNRIFTZ6zVMHDSZsMWxi1PSm64c19lBgQL4=;
        b=bYU8DCdQroLMmiyTShRy3lBln2/3DJA8WxaZ8TtOxPCu+39KTVWvacmJ6kY49VlJhq
         GQjnJbtDzSxwEU50rmI86Y3AT0R7of7Q5XCl+tRK7t+SzQHWDeqQ3vnqTNjNyPyUtEi4
         2J4Cs+fSb1vouJKeRQNRuzhqDd7phq9XuQ9NikCXM2GwZnVC4O8vrioTAbqYo29eGuHH
         PlnsQIrsAP8Hn35BwENq6iqsJYxH0fpm04EMoxaP+KvuYTo74DUuhHfzaP7GvXj3tmxT
         nALn0NGR7RZyy8vHA/qe+t6eEX5Ni4cNmG7ZGUbXfrqTxp0JlY1erA83FHTD+x8OuX/t
         s+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5smMsSfDNRIFTZ6zVMHDSZsMWxi1PSm64c19lBgQL4=;
        b=lwzpbvSzbVraZLnPViPlGeozMM64E5QPChZhOOFJNng72NzecCiOYBr8H2TNC205ZW
         F8oaD8IEKaXP+26nJRB+qYtXfCbND4MtycB9k7s1gXuPqt1pnQLfCLYObVM03TGX/JZH
         aW1jpWMAkUnu7TFQxtb5nAp9svxbQRLxpaUCT1jvngXvenoHoCC+dhqoKZ60MAJZCCa/
         8folrXtIbMj0Z4O0yEDM3qJoMu4psVBaKkmM540e8U9XXqw2YqFrPpJz+S5cy3iQn/y8
         YYv6HHlvJRpj5T7WJvdOq9+EbV8TkiQXVy0Kzorjc+zZX6JVW7xSYAs/4eoEMdujlUHH
         Mh+g==
X-Gm-Message-State: AOAM530O8mr1LXwi7Sh+OzzHrr185PshrZnVAdkxDBWo3eVSbwH+MZcU
        aNmToEYlZq5INZPSZ6vVZPUNzABfU77uj1Ze/9I=
X-Google-Smtp-Source: ABdhPJwFdbOR+m8Jtq3bYIMd6HOhrotBl4a7/jYl0E1+eB2wf0kbMbZ4gKwp2qwPlRDEhwRR8IkzPAgFN8ajIe8DI7o=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr197860pfe.40.1611850561286; Thu, 28 Jan
 2021 08:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Jan 2021 18:15:45 +0200
Message-ID: <CAHp75VeuKVwbgH1DBJ1-TxdNh8u4_3d0CUmabWRXq=90YDsqww@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 2:21 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> v2:
> https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/
>
> v2->v3 changes

I stopped reviewing at some point, b/c I have a feeling that I gave
you tags (and others) against some patches and none of them has any.
Am I missing something?

-- 
With Best Regards,
Andy Shevchenko
