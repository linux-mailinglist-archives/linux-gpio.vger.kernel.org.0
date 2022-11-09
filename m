Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0EDE622703
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiKIJbM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbiKIJbJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:31:09 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB33A22B19
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:31:06 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id n68so15866200vsc.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TWriCxXT4/4RYdhjXz1BgZ/7EJaP4UDa27JNUVSbVYU=;
        b=ivgTvEyK65bzPehpw+0ypJsD8fBNQrotYCi3jgN7M1slYt2ojZ54o4WdnhFW3trgLV
         XZKDV/WmQEJBLiSCfWmh188Js8qyUWquywbaQgvlPftnaKnJfucgVIbO5fncwt/m0OOo
         IDW0XqYVsGQdGt/xU4Q1/Q6BNk+rPZTmOtLPGy7CVEV4AwvvEvYPCT5+9j1enEIWJOvx
         uFJUPZUVwvtF6W4WClIOZ7DZ/Nql7PJPrjvroCVwDcLHXwIc2JSnyvu40isCkkdNjWFk
         XoFZsygNwtd5EwM2T7sBdSIf1J6Ef/w8rvsEpMUtEIN3EP9WP56gyp1WNgco7fnwZhxQ
         UU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWriCxXT4/4RYdhjXz1BgZ/7EJaP4UDa27JNUVSbVYU=;
        b=5snpTVek49KHtaoqbTo80JP1R5XlO2ZlldIIqNyRKExbLa/JOh3r1bHrqSVG6y4ffQ
         e8ibSeIvFHuaM0WaHXRU12Jv4Id7j+2N1h91IMq9PjsE1OlkHsR+rLgwYb8j8aEfRjYK
         DqTGHngWbMbbOFRVmgpWZDjq16OsGB20PveVTFdQ8lzfmjqYMdbePDSNmvGnHRl4PTv/
         D82mBDyjJKP1TWfuERHTJAocCQkVVGHiFqsJoKvrdvthHievIxM3PvuKQbECIAmbbLoZ
         HHGpZIPdLYZ+Vyjfd9QjbmZ7wwHSgLBTl5zvLPIXSIFxx1ixWoDZZBSlWqIZy6KeuYm1
         oPNg==
X-Gm-Message-State: ACrzQf3/S74/qUbtxNuWa9OrqHcM68u9O+KM6WAJrvTcFTwkYv/a3i14
        bMu6itkV4VCMaX+gjppcWLihlHiJRFtVAGsHoFLnzw==
X-Google-Smtp-Source: AMsMyM5wxuA0MepQJ8so4pJCfTN68AR/hGIa/v3lzwxhknd6TWz2CWrCyRxKeN2z17TSvuoTKwbw5R+m/Zy7TYRjtHA=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr31049677vse.9.1667986266047; Wed, 09
 Nov 2022 01:31:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org>
In-Reply-To: <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Nov 2022 10:30:55 +0100
Message-ID: <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 7/8] bindings: rust: Add tests for libgpiod crate
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

On Mon, Nov 7, 2022 at 10:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Add tests for the rust bindings, quite similar to the ones in cxx
> bindings.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Without modifying udev rules on my system - is there a one-liner I
could use to launch the tests? I guess using cargo as sudo is wrong
but the executables are there so can I somehow run them all at once as
if running `cargo test`?

Bartosz
