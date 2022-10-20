Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78498606069
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 14:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbiJTMko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 08:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiJTMkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 08:40:43 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B671718E73F
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 05:40:41 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id n5so548608uap.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hsTXsklSsZS6aopdVjvN5kAR8il3myTy/c3ZjqQ4rik=;
        b=iuyZWcIVXlxat2b/GNhQcHKnXSZ/FFtKhqjrqeaP9JUOXI3UuLZ4XpYrf3V541zJza
         0CKdw5HpWVn800zIuanL26F/OMrJRrzC3KGlzsQjFHqDYB6asoR8fuDiRWpkyVkOvn87
         rD9XViwJXduf3PnW/yVlKx2JWTHkFLI1R1+TJFgO54uUcqdb8oxG9110rp7/HaXTcNan
         zmTouppQrwJx3BBoc1S74lnEFi030HwmmAjMVW7Uf4pNyL4YoSdWcVvapYZbLzApfrzl
         U17FXi7zYs/tqQDTlml2/A/DcrHNWyHLMNu93d0FHXF2cPdsSlwZz2rw74LIFNzVGcN+
         0yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsTXsklSsZS6aopdVjvN5kAR8il3myTy/c3ZjqQ4rik=;
        b=SbMndG0VB88UP/M3h9+j6koRVUzScs7NCZ2W+jr4h0R9ZipEYPtCcmGSw6qI3GOko4
         1q0CJUf6RcWUHbodl1gk9aVa+gNRZ3Fn6JxM8hYCPTBti5uVRZt21zaOdFoFkrcNXXV2
         kFrlPDdKZ4RYVCE4+eVclLCJnrPB7lpwDwntikRjASbS0EpMZaBMO7Fc4n6tp7ZVPSqt
         +TAhbBrJRvQpv9N3nxacWDcyABOnAyzrHpuaJUX2J9q1mAiS2nw6z5Vynepx5xtsmpDG
         0t/8zFSY3ni6zebkS/fkMj5eaQINjOxn0CdLIOqlIHxUiP2Xo7Le9dVuVnHtRiBFjF+g
         C7uw==
X-Gm-Message-State: ACrzQf3c/WzNCYmHAe/b4zDpVVxOn2iIbEI3mE7obmpidvPRrubsPMUG
        4txQMSTnKjjx5zx4yJJGS9T4Y5RxRgfP0RXSQLHFqbj7X08=
X-Google-Smtp-Source: AMsMyM6izB52DSZ8IZIAS0GtLzYWJgb4tmCLitxzrksAGTBEE2YDmNsieRbziKA/xfnAyu+61LECuq0k+7fmnIaQJkU=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr1066306vse.9.1666269640834; Thu, 20 Oct
 2022 05:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
 <Y01R+58inH5MgXl7@sol> <20221020103741.vdo5xwrjgqmfizbx@vireshk-i7> <Y1Eqtso+7MQhNmMe@sol>
In-Reply-To: <Y1Eqtso+7MQhNmMe@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 14:40:29 +0200
Message-ID: <CAMRc=MdGY=d3=RB8xDro3Aa_DWZmNMYGbBvTwAji0_a07wHA0w@mail.gmail.com>
Subject: Re: [PATCH V7 7/8] libgpiod: Add rust tests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 1:02 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Oct 20, 2022 at 04:07:41PM +0530, Viresh Kumar wrote:
> > On 17-10-22, 21:00, Kent Gibson wrote:
> > > I was surprised to find HTE tests passing on a kernel without CONFIG_HTE.
> > > I take that as being a kernel bug (GPIO_V2_LINE_VALID_FLAGS includes the
> > > HTE flag unconditionally - which is wrong IMHO).
> > >
> > > You probably shouldn't assume HTE works - unless you have a system that
> > > supports HTE.
> >
> > Should I drop them ? Or run them conditionally ?  How ?
> >
>
> The Rust test framework is pretty simple, so there is no way to
> conditionally skip tests, AFAIAA.  And the only generic way to tell if
> your kernel supports HTE without probing it, which makes testing it
> pointless.
> So I don't see any alternative but to drop them.
>
> Though I would be happy to learn otherwise.
>

In C tests I just skip them using g_test_skip() which generates an
info message. I'm surprised to learn one can't skip tests in rust, it
sounds like a very basic functionality. I'd say let's drop them for
now then.

Bart
