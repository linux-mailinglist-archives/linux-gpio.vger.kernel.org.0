Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6AE568C4B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 17:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbiGFPHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 11:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiGFPHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 11:07:38 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E682252B9
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 08:07:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z41so19702488ede.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpcbsEw/20xy+czFl3NKN5RfG+F04MUU4xLklx2RkdY=;
        b=CAvY5156Pd1hW8HjRa+SbS77+QIlmJ/aqV11spi0db19nP+RAi7RtWtooJIj/uX/Se
         DWYeNgfzHB4FOLkYeGjRph2dszxVR0ABUofJffAAn8/GAiWJHyK92fFUO43t7x94K91p
         nWQWMLPSfdtUIChpFdPAwHA2zKPMZNZTUJSrb4gMRml3VrzDKrXvDMX+PLyf1iDFHyoS
         tg4CFvrLcfN8uUBhOVz/b155e6dw/Djpke/zpHOnNTsxsMtIE8gq0qteoZq/vUvQTBfB
         McKpzl8tmPOCe+bqTfeW8I54EYkS5SwtdTz2CCm3GBzn29v/WUYWOTlCmp5wirnhJz20
         cvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpcbsEw/20xy+czFl3NKN5RfG+F04MUU4xLklx2RkdY=;
        b=yE8I3kz6LqZB7oD0dznn+6YaXYXmIbenZbshsiT6w9dQJs3k13E2X9RUpvGHWnkNQb
         ovHCeKS013nHIMI2QcsMgU8NgdUbU7C8Fnq2tXItECNh/+QUg5RYXJ0ufUixgSwcQJ+f
         kUOPOp0TkGc8BpSkvv01UQbo4nBTHTq6+A8svleAo+FfFRZV1YgNb1tUVHsgNtFZ4DCa
         xYQM71Gzx9aYBzGbJ0vNFhAsP3tLptwTMaP9VY0elFfo22DcSJ42C3FKgQe33TKXtRYy
         AgsFNlDrZiCD5KB/fsvNoKCa9zxr6DvxJXcFeVsWBDWS4v5jhAqPRXkv1HJwytIa+TOO
         TFPg==
X-Gm-Message-State: AJIora9Q7rAKfepLY+FsIxtuMaDXWXtl7xvOilkf+kZQUqQE0BqO9Fsa
        uwuSgNhX9lnKOxUmkGvDqrED5aEZyTg4NGto2zn8wg==
X-Google-Smtp-Source: AGRyM1toIUwU2hQGy73CKB+mVxb4qKDrzlrhNmnsT46t+aRA8c854vbii67QfBYKQMCf50W7y/jQJ8Jrdqy0Wyvjcuc=
X-Received: by 2002:a05:6402:150:b0:437:b93c:3a9 with SMTP id
 s16-20020a056402015000b00437b93c03a9mr52926716edu.82.1657120051888; Wed, 06
 Jul 2022 08:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220705171835.4923-1-brgl@bgdev.pl> <CAHp75Ve3sPhFOZhL=_2p+1avuo96CP995KD+bi+Pn3gyj1F9TA@mail.gmail.com>
 <CAMRc=MekRvEVjRKJn6CWpbk9GJWS0Y+kB9MYpGFSN9WSSzWC7A@mail.gmail.com> <CAHp75VdepbidJWgLZFk3ns13boZXRYvMqvLvXF_xYw=2ahZMgw@mail.gmail.com>
In-Reply-To: <CAHp75VdepbidJWgLZFk3ns13boZXRYvMqvLvXF_xYw=2ahZMgw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jul 2022 17:07:21 +0200
Message-ID: <CAMRc=MfQgVD3VkY+Pq7UxV8WB-2GSpsSgU9N8djdkK99ycg4Uw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: schedule a devm action for the clock struct
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>, Yuan Can <yuancan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2022 at 2:32 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 6, 2022 at 2:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Wed, Jul 6, 2022 at 1:49 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Jul 5, 2022 at 7:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> ...
>
> > > > Reported-by: Signed-off-by: Yuan Can <yuancan@huawei.com>
> > >
> > > Me puzzled.
> >
> > Yuan Can sent the following patch:
> > https://patchwork.ozlabs.org/project/linux-gpio/patch/20220704130323.104294-1-yuancan@huawei.com/
> >
> > I responded that it was not complete and sent this instead.
>
> I understand that, I am puzzled with Reported-by: followed by SoB.
> What is this format? Is it something new and documented?
>

Ah! No, it's just my brain on not enough coffee I suppose. Thanks, I'll fix it.

Bart
