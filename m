Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DA3627A76
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbiKNKaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbiKNKaL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:30:11 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47103F03F
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:30:09 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id l190so10905583vsc.10
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wUt1UcQ4Eqy5sMdBZOhFIj6dOml4EDGMjuGiY8TxD70=;
        b=3GyM8SBpgny4Sjd2R6vmU9J1gRhNdnZD0dAFotxqJ8nreDCAyQ9fZ8zknMOf+c8FbJ
         m+hWExFnen74aWzVvLNCJFxfsBzfAsFvsKAauoPvXxQqx6MNfvTWQtqh+drJLQxbOsSt
         nppTC0VQmyWrBmw7dF/m4tUbiQq+7oOZEZESxMLPy7MUH1PvSHlGpFERUtLQLJVFoj3s
         VRsBQ+yrmwJPIBXOnoKxmiypz2XXCojSRIZ1H1NsZETs1qrPe3q8X1+mn2IRBXtxVKes
         +h0h73AvttaeJe4TEV3HYCPP9bIz6bp/TbTkgsi4Y9rXvcinoHTvWm3Xr82prrdVDPEs
         IcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUt1UcQ4Eqy5sMdBZOhFIj6dOml4EDGMjuGiY8TxD70=;
        b=06RB+VMH5FDUWy+MQafFZph9FpUGqv2Zf5OzjzmMg/zPsHNAvOF66vZ3o3y1MSoy++
         VkkhYEshoIQ6ggS39SdwqykJnZaqMexSIOJFGkB3IipIyiHbdoCdq1MuQbZMyM/zZPS1
         CAJUsHjrk2lbceJkNeOs7cE8ZYoevo6hD1ULaGRB5uVbeuzYmFWyrczZMkhx5W8EHuKT
         JKl3LgrITvlZMTsVkUaaIJOaSO7vSVE/80U0xBmOLIHNvD2EGJKt1p/uCYkU7e8//QZ9
         PI0YBgSBa/ziGTPQ1rRNW3uAzvrylLKrqqHf6u1suefI9mRQYPZnGgOKeK8zoq0G9IDr
         BgjA==
X-Gm-Message-State: ANoB5pnBbdXMDHJIprKR+OmJzhI28kYvJ9RbfubmA/A5OHV3Jeo9l3QY
        iVjMf6dPCijHieI30wecMppXjMN86KAS65h3wZU1+/lP554=
X-Google-Smtp-Source: AA0mqf77qhJzEG09v/K+eTVNDxb+NczaDy+KEPjYLVaoLt9w0XnKN3JcxFwlMmKiuQfgQU1mItvD0cO0ZpV+tQxqol8=
X-Received: by 2002:a67:fb81:0:b0:3a9:afe1:eef6 with SMTP id
 n1-20020a67fb81000000b003a9afe1eef6mr5563139vsr.61.1668421808410; Mon, 14 Nov
 2022 02:30:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <43c0d28fc12bbfb5a0feba0d30542a4ca2d4bad6.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=MetERzq-SjosE6bxTHh6Np6133CAMxz09YVrJAgvnpssA@mail.gmail.com> <20221114100305.2siyj2i7m3a6bvdb@vireshk-i7>
In-Reply-To: <20221114100305.2siyj2i7m3a6bvdb@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Nov 2022 11:29:57 +0100
Message-ID: <CAMRc=MfU3a+28eoLcxbB+3fFb04PkRvmsaT_Gd+-BosUecd_Lw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 6/8] bindings: rust: Add examples to libgpiod crate
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

On Mon, Nov 14, 2022 at 11:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 10-11-22, 19:26, Bartosz Golaszewski wrote:
> > I'm looking at it and thinking that it would look much better as:
> >
> > let settings = line::Settings::new()
> >     .set_direction(Direction::Output)
> >     .set_output_value(Value::new(value))
> >     .build()?;
> >
> > settings would not need to be mutable (we'd have some intermediate
> > SettingsBuilder object?) and could be directly passed to
> > add_line_settings()?
> >
> > We now have chained mutators for LineSettings in C++ and keyword
> > arguments in Python - somehow I think that the former suits rust much
> > better than passing an array of properties.
>
> We already support chained mutators in the Rust bindings. This example can also
> be written as:
>
>          let mut lsettings = line::Settings::new()?;
>
>          lsettings
>              .set_direction(Direction::Output)?
>              .set_output_value(Value::new(value)?)?;
>
> --
> viresh

Ah, I missed that, my bad.

Would it also work in non-mutable way like

let lsettings = line::Settings::new.set_direction(Direction::Output)?;

?
