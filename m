Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3EB4DE14A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239033AbiCRSrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237255AbiCRSrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:47:46 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D60818A792
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:46:26 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id u17so10166277pfk.11
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ERP/ri7fUthNe53EHX7luWZC9TGqfyrEEYYImd67W/Y=;
        b=BggTcfmtj/2qASx5jrYS2HTIDX8wZ0k8AmkaH4EK71HQS+Hr2S2Os83J0Ff6DUxdAm
         XdEW3psIax6tYFh663lnLA3erJoYb3Sm8e1aRv2sDp/FrATacY8st5ZwnQilndH+PGAH
         FWOBxc3v+HnN2XQQkObD9jEyhkY2ccr7UA6fH4ZyCS8HVnRCTL0hGzXqiYjAleeFugQ6
         s1tVAPpDjDha5Us2u/hB/Bb6LIKjCudqkEbvw3af3Bw+blHuhhiq4vF5rN6+JsWsor05
         9jo6J2Ko9bWMEHThamBW9AEzWLr2ePYij+IKusfmpqQJ9okpFAtdXYQdwYqkPI+/ts/g
         7JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ERP/ri7fUthNe53EHX7luWZC9TGqfyrEEYYImd67W/Y=;
        b=ILx3gN8EivpIV0Tqi+0h/eHkqqSSdEAX6Ep0ltCbleg/b1FXRHNxbWk2oVm6Nuoggy
         tReeVRS71bBVJVfTIgKLMc/RJ4CG1kVnPeVCm3auAXvBpRQx5nvfhsWTpo9CILqZ8ekx
         0KA7eqDf1uRFGbTaRrvRMCZ/TW4ojMRnr3gtTj0Y9otktO51Us0t7V3n17QkTEVb3fR+
         nyrUQ3dg8ENPb7NL5CLLiUdwVp4jxWPCokAP0SoY2I12d0El2tQrDGzgk3+AdxDAoTfL
         UWLkJxuOuDFoPdgMyCyXSweFDbBeH304OXa8NSSOGKfQbBwsazHeH8r6tM/PuZDN33fm
         l5WQ==
X-Gm-Message-State: AOAM531bcb0E3sp+G077vPI4tLJiUJ9aAMDWy+ihb0rJwo/dllsgTBZ8
        Qt0FUXiSr9wKllYoqJxQgLRK9I8/c2XLDyvTKkz0
X-Google-Smtp-Source: ABdhPJwpy67/FIlq8v1DlPQLIhiY4drN+Tpj/CZWirFrnRxutS5B/WWPHUgXMdz21Q64ZITqi+WwU0OH9D47AvsBvko=
X-Received: by 2002:a63:1613:0:b0:382:2a7f:5ca1 with SMTP id
 w19-20020a631613000000b003822a7f5ca1mr3871359pgl.151.1647629186010; Fri, 18
 Mar 2022 11:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
 <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com> <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
In-Reply-To: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Fri, 18 Mar 2022 11:46:14 -0700
Message-ID: <CAGG=3QV9+kakiTYSe+Oh1RTnSW1PLZNNO-KJaiQtincheQK+VQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 11:41 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Should we add a note diagnostic to clang suggesting the explicit cast
> > as one method of silencing the warning?
>
> On the compiler side, I would love to see warnings about the ambiguity
> of the sign of 'char' in the general case.
>
> That said, I tried to add that to 'sparse' long long ago, and couldn't
> make it work sanely. All the approaches I tried all get _way_ too many
> false positives.
>
> I tried to come up with some way of figuring out "this code acts
> differently depending on whether 'char' is signed or not" and warning
> about it, and never could.
>
> And I suspect the same is true even for the much moire limited case of
> only format warnings.
>
> Because it's a *bad* idea to use '%d' (or almost any other format
> specifier) together with a 'char' argument, but only if you don't know
> the range of the char argument.
>
> But the other side of the argument is that quite often, people *do*
> know the range of the 'char' argument. If your 'char' type thing comes
> from some array or string that you control, and you used 'char' simply
> because you know you have small values (typical example: use it for an
> array of booleans etc), then it would be very annoying if the compiler
> warned you about using '%d'.
>
> There is no reason to use '%hhd' when you know your data range is [0,1].
>
> So honestly, I don't think you can come up with a sane warning that
> doesn't cause *way* too many false positives and just annoys people.
>
> I'd love to be proven wrong. In fact, I'd _really_ love to be proven
> wrong for that generic case. The "sometimes 'char' is signed,
> sometimes it is unsigned, and it depends on the architecture and the
> compiler flags" can be a real problem.
>
My first thought is that this might be better suited for a static
analyzer, like clang-tidy, that can do deeper analysis on code. It
might still be difficult to weed out all of the false positives, but
could be useful for specific offenders.

-bw
