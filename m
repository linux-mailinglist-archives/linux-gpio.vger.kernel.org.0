Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4C15FF2B5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 19:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiJNREP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 13:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiJNREO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 13:04:14 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBC11C7107
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 10:04:13 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id o13so2829957ilc.7
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyf1sRNFUJIJiOF0VfTXrQbUOgDClINLTJy5yXS635U=;
        b=lXMRKKnNW5C8iKQ44W45KKgTaZVZr3z4+hHfpD1+eo0P6oeJmFTVXYGRd+MapZjGaG
         ii5Q/RSn/9+nqOwkRjnZIKRzHox0Ng4hOlBl8TaF3vbPdakHfJwFdljLP22L9gmIKicN
         VqDnLgpIbC/bKVrenVWgBdiChC9TL4C++3rq1WAaMAQd6lm/+oNJFhtRqcGXHScmt5gc
         MYp25s980nC0tZ8WlovP7Y9qBrnSK2wxV2znTinDNxYtHlZGgh9gR3IoBRCVmUVTodme
         el4smLHZPcQ7gCCDB/6oAt9PnGg2eY3lIn9wuyX+xNMbZYOMcDSrOZ/l1YfRMYbQjLcj
         p/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyf1sRNFUJIJiOF0VfTXrQbUOgDClINLTJy5yXS635U=;
        b=vewmsRlSz2eTVQX1veC0Fy0vMEJvw5lxO9iYMX8CjVbGH/V0AT0OT912l1KSR9tV4C
         o8RtQTwH8SSo8VFI+8jWFnJHHJRb29+pAY78WhqkqHiocdfsVqt8dB9aLgYNM1d3iB2x
         9BN2o83Xz9G9beJrPLNgpC1Wqcs0OqERh+ievI49aIwvsD5Gi28K7pMm9keGqDuAgtrW
         hf8tH6qjTvq0KZPslzsvh0iyvY2/7zwXSLZ7d8AsuahFQLDGcuq2MqGiGqsz0Mn8xDzT
         UnfdZPqRt2xMqLKWLNpYzXIC9vhYubAWjGuL3Yimgj+7+rucZgekgXK0DmL6HOzZa7BN
         +d5g==
X-Gm-Message-State: ACrzQf0J/PRjBh3sGWD8tYAeSiNpcobjyefrdkV4BiH37PREOs4zrcLU
        sYDbZuN9PoaIBLK0yOatY4qo12tm8TkMpY88NdI=
X-Google-Smtp-Source: AMsMyM7Hc78uSymx1gfDxGXjGqDvjzDLDVqJqwVrXIXmOBcwn6DBb6k/CGWanOmRimCiGlQBgwjim7cXHSuBEfi0ioM=
X-Received: by 2002:a05:6e02:b2d:b0:2f9:e735:a010 with SMTP id
 e13-20020a056e020b2d00b002f9e735a010mr2976290ilu.151.1665767053086; Fri, 14
 Oct 2022 10:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1665744170.git.viresh.kumar@linaro.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 14 Oct 2022 19:03:57 +0200
Message-ID: <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com>
Subject: Re: [PATCH V7 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 12:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Here is another version of rust bindings for libgpiod v2.0, based of the
> next/libgpiod-2.0.
>
> Pushed here:
>
> https://github.com/vireshk/libgpiod v7
>
> [I have pushed v6 and v5 there too, in case someone wants to look at the
> changes].

Fixing Wedson's address (the old one is not valid anymore, which is
why I guess he got dropped at some point in other threads) and Cc'ing
others in case they want to take a look.

Cheers,
Miguel
