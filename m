Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1E2628B95
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 22:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbiKNVtv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 16:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236128AbiKNVtu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 16:49:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABB713E9C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:49:48 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id a6so8657178vsc.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 13:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qm65FC0ISZU9vNwEMzcHGE8+KbgPejNJKo8HtdurgEg=;
        b=W7S4D8yw/njsBBoP2W96iixRUE3v2c+7x9bzUZGzTV/uHrnWyJ27lzPK0uEuy8SkFg
         Mn8oDvMtpfCeeWmZl2gdLuB93oyoVZT60KoA8ZNNicMR2X5OXTf/v/AQcwW1zRRnr7eC
         mI8jgf260Pr2bWgThAWW0nOMfXY2gKXt3JhoXucuZpy7r3e3YdFUyNdqsyT+BaVibW1H
         3rY9N8/4bAXjC+HPKZM45J/p3/TOl0OCVL//tSMGlxXhj8UZIyUGK4rZPM7Fe+MtHQ7T
         CG+QSo2vhdkL1PDpkMKybCQifoNOOribJohPNcqG5IwKrYPcfsHXxMwJBtqEU4RLuGzb
         pa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm65FC0ISZU9vNwEMzcHGE8+KbgPejNJKo8HtdurgEg=;
        b=sqmY/WNU6coJw1L95h7zEKb51foCzrnf8UXDo6wbvdrnzsxZNk8Jd1yxkEbbQv1dAZ
         eBWWM1mMBHODrew1I52RNqhhSKy1suI3ECG2VtJ/CwLyiwhCbu/3/5qZIeqrebVDzvI/
         qPZzkccIO3nRFKmOhVZnzF1cyVL5l4vScps1z9igqpKgy/BQ3ek8pB1p29iA3fiXnkZL
         u44C9xqtU11iw7PUCmJhOcMA+JVGoTJ1lhnIaA1zpyOUH/V1a6IDQRGHLKVLC6zZP351
         pwLx1COaQNVR09xxK55akddmaa9OiYrdjY7OlEqAa1x3iENVOOQobU+HAv8DjtzUqNxC
         ylTg==
X-Gm-Message-State: ANoB5pn5iboIsiMWGys1Gl0peoE1jM7iGO2B2Rm25QqswDO8/pr2mSpd
        MRAmr2uLOjTECqBg02+JSzRhVUqWDWv6lm33fMlWdg==
X-Google-Smtp-Source: AA0mqf727DF2KcxJNIgacyj1EJzfdwS+qr71cKX0wgHvbikpzkvMYZKgSAm9lra8fHUeAqmyD0XA1mog6mNAS/F2eCw=
X-Received: by 2002:a67:6b03:0:b0:398:6504:9ece with SMTP id
 g3-20020a676b03000000b0039865049ecemr7210899vsc.16.1668462587526; Mon, 14 Nov
 2022 13:49:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1667815011.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Nov 2022 22:49:36 +0100
Message-ID: <CAMRc=Mc=NVzo-R8Yg8SSos6rSaru_i4+m3qpXeZcKsHH6hcOAg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> Here is another version of the rust bindings, based of the master branch.
>
> Pushed here:
>
> https://github.com/vireshk/libgpiod v9
>
> V8->V9:
> - Merged the last patch (supporting Events) with the other patches.
> - Events implementation is simplified and made efficient. nth() is also
>   implemented for the iterator.
> - Unnecessary comment removed from Cargo.toml files.
> - Updated categories in libgpiod's Cargo.toml.
> - Updated gpio_events example to show cloned events live past another
>   read_edge_events().
> - Implement AsRawFd for Chip.
> - Other minor changes.
>

Kent, Miguel: if you are ok with this version - can you add your review tags?

Bart
