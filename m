Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950104DE146
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240144AbiCRSmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240249AbiCRSm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:42:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4675B2EF0C5
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:41:09 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 17so12424227lji.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T68So5s+Mvf8Yxsi6hpGLQhvBaydZiJJcf2u3DNH8AQ=;
        b=ZmBvasPMchpBJ8mkRKb7R3RhkkeHi7XstG7ccVRfInSia4wxmHPc+1XSCMLTTbtwoD
         iBBZhG8pLYhyN+/NcRaXQ6YvBWpZBO0b6qFsSWL8b/QpLIBN/MEi/ZFczp9fnO89TfiE
         WjskrGL3deHU2C25PjWZUp+gAg6DG/SMTBWTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T68So5s+Mvf8Yxsi6hpGLQhvBaydZiJJcf2u3DNH8AQ=;
        b=3Z2xp8SyJdpR/+QnW44cZtbU1QuJer5o+dvHX/iqP8w3Qu8ydl761Tl1Ub36Hplnpo
         oxK1Q5dkKLHJqDTS7/30Y00hzzuLTXNoRS7i3lTSPBC2yBGPG0wbPdaCdKxbafx2F8Ui
         SnqEVvall7K0YI6zMp9w7kiAu7bSX8mCNMvD+pCLmtkpbArOI2Slcx3BemCf6riUYXR1
         LxNlLJ6sR5lSZK/TmHL6yx00g/4593A4kpkfprhdbf0thRkkio8AS7iv7ulnDbMrLYe2
         +4GWksIX9wr6E0Z7JJlt1BxT/o5izG1QH+To2hr7wSWOseJ6Cd7fSNmD/WHS9Lg2E1S0
         GpxQ==
X-Gm-Message-State: AOAM532Tu6rF4XIfOHMU1ZdTnJZh1ERX0ETiagbVxGZYw8Ajump3qG1l
        M52lSIqg6EbgGo96GY/G6GgC/j75gLD60X5L0us=
X-Google-Smtp-Source: ABdhPJzZq0J7/uXZctyqYBLQP11Rfm7h494KOU3jgfAE9r8kUfuHJK02pLw+OLQijGVe/wIwaBgbkg==
X-Received: by 2002:a2e:b52f:0:b0:249:3831:6329 with SMTP id z15-20020a2eb52f000000b0024938316329mr6959613ljm.326.1647628867056;
        Fri, 18 Mar 2022 11:41:07 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id e13-20020ac2546d000000b0044827065453sm958191lfn.169.2022.03.18.11.41.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:41:04 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 17so12424034lji.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:41:03 -0700 (PDT)
X-Received: by 2002:a2e:804b:0:b0:247:e81f:87e9 with SMTP id
 p11-20020a2e804b000000b00247e81f87e9mr7192968ljg.176.1647628863338; Fri, 18
 Mar 2022 11:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com> <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
In-Reply-To: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 18 Mar 2022 11:40:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
Message-ID: <CAHk-=wis4P8-=-0jmcDzGGuttZ3ESnq0LA5PMOVmKkPRwK1kEA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>,
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
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Should we add a note diagnostic to clang suggesting the explicit cast
> as one method of silencing the warning?

On the compiler side, I would love to see warnings about the ambiguity
of the sign of 'char' in the general case.

That said, I tried to add that to 'sparse' long long ago, and couldn't
make it work sanely. All the approaches I tried all get _way_ too many
false positives.

I tried to come up with some way of figuring out "this code acts
differently depending on whether 'char' is signed or not" and warning
about it, and never could.

And I suspect the same is true even for the much moire limited case of
only format warnings.

Because it's a *bad* idea to use '%d' (or almost any other format
specifier) together with a 'char' argument, but only if you don't know
the range of the char argument.

But the other side of the argument is that quite often, people *do*
know the range of the 'char' argument. If your 'char' type thing comes
from some array or string that you control, and you used 'char' simply
because you know you have small values (typical example: use it for an
array of booleans etc), then it would be very annoying if the compiler
warned you about using '%d'.

There is no reason to use '%hhd' when you know your data range is [0,1].

So honestly, I don't think you can come up with a sane warning that
doesn't cause *way* too many false positives and just annoys people.

I'd love to be proven wrong. In fact, I'd _really_ love to be proven
wrong for that generic case. The "sometimes 'char' is signed,
sometimes it is unsigned, and it depends on the architecture and the
compiler flags" can be a real problem.

                Linus
