Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7432F62D8F2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbiKQLIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239721AbiKQLH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:07:57 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EE2FAD1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:07:47 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id c15so1462034ybf.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U4EWSEj4yVr1Zz7qdMsah0lk+YIU9jCQuFIEJIZoyTI=;
        b=HX7VtVVCvr0rjzzLuU8PPMqBysvA+ufY6bkcClpFfT2IybfKN+OkTreKoQCDwNYGoh
         XlPnTdPtx8yxHRipzojLlf3IepvWKmtQV572B4irW5xhBZLUiVKYad2b68Hb7p8tT5b1
         afVQDSX1W4gSjhcHeXcEFpnJhzAwKbkQ757/1RrGZVvYmNlBkWrQfqEGPuYj4Car/lsU
         cwRj9kg4zqeSX+97uXTjAPIGDeraCj7H3Uj3oCcKDYprXkd3emMrtgCL93cUYSJbcD9p
         xip7CwBdoFj8mcCyZ2XHA2ELpQHCW6k+5l16RE70ov8IMbYsELoKXufFfE+s42+AKlW6
         NihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4EWSEj4yVr1Zz7qdMsah0lk+YIU9jCQuFIEJIZoyTI=;
        b=LHZ698iBC5Hv747l0KZR7sPOMRJ7qqt1QwSIrRynJUynZDkZ7IQh3Ze9EhaD26ui96
         1sSPw1IVnZ1hTyNo0ItaMUufDnB7i5T/4ebZEHbEjvNt2iEl0dvqjB6AE4z6vvH781Ut
         heZL8rJj8MBAibKd09+fbjEqK2uqHItRaE1zGjbA9WbxLW2xDnnpJ1GOX80lIUspFmdR
         O2VIbRJac6awoytBvpluEqJS29+Y3X04zOaO7aqJLbZCOlzAgBVMqrdckOIbfeJnWzbN
         U2e3D089NSWyGDr83ijAv2jPHBIQFIUMvom5b//KkMA2axHFOYdc6Kl/FYw4eQ0NSTt/
         4D8g==
X-Gm-Message-State: ANoB5pmtac3RLBwReS980OMwV9KDnNExEBd33cXGFC46wyBz5hXapwfU
        ySJY8+fnOGgCulP0CAar1g7+C5Fr789j6Suc14k=
X-Google-Smtp-Source: AA0mqf4kYAlVxm0ClvyOBjNzbSG70Q4rJn/GdIahbomZI1DBT96e0ndcXvUauXVVh52okuPQQ5ABPdWsby6R+MfB7M4=
X-Received: by 2002:a25:ce83:0:b0:6dd:edba:c7cb with SMTP id
 x125-20020a25ce83000000b006ddedbac7cbmr1473924ybe.507.1668683267124; Thu, 17
 Nov 2022 03:07:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
In-Reply-To: <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 17 Nov 2022 12:07:36 +0100
Message-ID: <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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

On Thu, Nov 17, 2022 at 10:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 10:06, Bartosz Golaszewski wrote:
> >
> > Just use regular SPDX header at the top of the file in a # comment block?
>
> Miguel ? Kent ?

In the kernel at least, all files (including docs) should have an SPDX line.

However, configuration files which use a publicly documented format
(things like dot files) are not copyrightable apparently, and it was
proposed that the `scripts/spdxexclude` kernel script excludes those
[1], but the patch has not been merged (yet?) since I raised a couple
questions about how to handle those (sorry...).

So I am not sure if e.g. `Cargo.toml` should have a SPDX license
identifier or not.

[1] https://lore.kernel.org/lkml/20220516102615.884180377@linutronix.de/

Cheers,
Miguel
