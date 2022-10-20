Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22380606426
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 17:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiJTPSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 11:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiJTPRw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 11:17:52 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB41417F29A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 08:17:24 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id i9so50977ilv.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+mA5Ur+PGeh8nprNRp9HxVHaVI6IR+xXfnE6ER5zyI=;
        b=EqyTbkYc/kGmL9TcpJOKJBsVjPK0pcne4mIj7cXJD9s/mBHsAqgBPXZrp90EpBlZA0
         M7Qgd63unCY08DxCyQxIlDRwuqTomkqd1V1WT+V3S4nD/1OQhbXm37n1AsiC2+5R4HL1
         VB5tUPwZ0haDmWSjQvFb7onrZKj1yZ5zghzVSDOmBuPZhrLj4DJqMPi2wVJz0rcFjwgZ
         ydMWutUsnRWHKSZDwoxeyKJkO6RP/izVlmswfjQsYMzz2tk4gFmDwHyRzeSYq2+3FXs4
         S0R1xbm+cQx9WO8PrMstiQb7h38/KJdmI6fj/IFFH3+rtJcidQqgHw6PB78US74MN2tZ
         HFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+mA5Ur+PGeh8nprNRp9HxVHaVI6IR+xXfnE6ER5zyI=;
        b=XuJ3Jm4blHlXzTNNTzJYpTPpxMx9TdFAaG2RApR3KiiL6jSfgOfBX33/QYHuIwcuYU
         IrvhIGIHBYzoyzqrSerh1Esb+MlCNeXLok0oozBDGO08ClvssYddmIcaiqe+QupKZPX/
         9erX9QuYlx+mljGy2G5FmZent8Tq+Aw8Kj626/RmEdRelGvT9ca931cy4V5jVIdhO4dO
         0bB9Hbb7Mbs1ztOBjou26FgL++cXZzbQ6yyqCNnMhFzTGI0z3N2Ahd+xcHEkShPccjLM
         OFmQrJD7qwHKM4F1zadesE26QvmIMlRV9pQtSeNteIRAmfCiEBdJXMvn4k9teiYsa3uB
         lNVA==
X-Gm-Message-State: ACrzQf306QRMWQaAsF3spCV44NE6GrjPsfpWn356yhEhBhwD9OVGJRQA
        EEm/ERU63gPNL4SMG8eBxHkFl+NE+AJw3uORiN4=
X-Google-Smtp-Source: AMsMyM4RHi+S22NQYyUCHSNXiYZV7jkXLDgKIxMXmwGEe+jPuKtCOauav9UmOD8UlK1/WcObr+9ixbhyT56tHSspiww=
X-Received: by 2002:a05:6e02:1a4f:b0:2fa:bd75:55a4 with SMTP id
 u15-20020a056e021a4f00b002fabd7555a4mr10920456ilv.5.1666279013903; Thu, 20
 Oct 2022 08:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
 <Y01R+58inH5MgXl7@sol> <20221020103741.vdo5xwrjgqmfizbx@vireshk-i7>
 <Y1Eqtso+7MQhNmMe@sol> <CAMRc=MdGY=d3=RB8xDro3Aa_DWZmNMYGbBvTwAji0_a07wHA0w@mail.gmail.com>
In-Reply-To: <CAMRc=MdGY=d3=RB8xDro3Aa_DWZmNMYGbBvTwAji0_a07wHA0w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 20 Oct 2022 17:16:42 +0200
Message-ID: <CANiq72kfAkEXPXTPa4gcHw-ZXSdAiaqWP_gb1Dyq7uCHQnKH_w@mail.gmail.com>
Subject: Re: [PATCH V7 7/8] libgpiod: Add rust tests
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
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

On Thu, Oct 20, 2022 at 2:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> In C tests I just skip them using g_test_skip() which generates an
> info message. I'm surprised to learn one can't skip tests in rust, it
> sounds like a very basic functionality. I'd say let's drop them for
> now then.

A `#[test]` can be unconditionally ignored with `#[ignore]`, but they
can still be run if requested via `--ignored` or `--include-ignored`.

They are still always built, though, which sometimes is not what one
wants. But if possible, it is good to keep them that way, since that
guarantees they remain buildable.

Cheers,
Miguel
