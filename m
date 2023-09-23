Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DC47AC462
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 20:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbjIWSTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 14:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjIWSTg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 14:19:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F85FE
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 11:19:29 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso66714311fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695493168; x=1696097968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHvsp74Err2zYK1OLHJlR5XcxNgb3U+TwUDTFKciRR0=;
        b=DlTlDxoUdEe9Nw03sa16jhyuNbTZ4Y+QVQFCb6gP0Of6/37z0MLokill2eGWVKPL5E
         /A8LT+Hkeh7dqicPon/+gld8J3r4ugcK4CsVhMhFqH6EJppM1ilQ0aVZGtuFqUKsEr5R
         CpsDRhTxCUna56sv0njGqPPKsBTneNODkhbzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695493168; x=1696097968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHvsp74Err2zYK1OLHJlR5XcxNgb3U+TwUDTFKciRR0=;
        b=u1AEGR4viPgEXXZEZXdYOx/KHJjlNel0ghlf9oDJaaoZNgDMw5SvXYznZ5SxOaqvh1
         2A/6Y0qjmvcuVc7aCId+gBUQF1kf8ga1DK+Y9HjTGwKYuzTj1/0nIrp3oXbumG1guKWC
         /zW/2dURC9A0XC/7GGcQ8iWOmbb84W8JOWwId86KQsS2nB4QrQZxTX3+C2ufSt9Kl+/K
         mLO1PJtMt0mF8XUEIMLNI40LzQJU4c/D41e1HeKE2jfB96mm64uywB0XpzydaORmjf+S
         6tWYrRKRurY8TFAdC/sTQJMBzqF5siuKWxVPY/MghsfPF+0WF3JoZ3lkDD8Cj0bsCvZ/
         45iw==
X-Gm-Message-State: AOJu0YzZ7kvtdJT2CoSXh+oBsfFOCEo4OgeJSfUsyftzh6eSd6KNLl4/
        QEwob+9bywGvXz9lXHuIwsNDI94SWfhQTFZh/mEIYw==
X-Google-Smtp-Source: AGHT+IFjMkHjpA0asQ1rfHmZppoxAvZIPCh3e1QzVpPq+RhAv6YgOYYbZWh+XiAt9bYtChO2q+6lbg==
X-Received: by 2002:a2e:3517:0:b0:2be:5b09:5544 with SMTP id z23-20020a2e3517000000b002be5b095544mr2091215ljz.27.1695493167978;
        Sat, 23 Sep 2023 11:19:27 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id qq23-20020a17090720d700b00993664a9987sm4155655ejb.103.2023.09.23.11.19.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:19:26 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso55221a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 11:19:25 -0700 (PDT)
X-Received: by 2002:aa7:c98b:0:b0:522:38cb:d8cb with SMTP id
 c11-20020aa7c98b000000b0052238cbd8cbmr2023816edt.20.1695493165617; Sat, 23
 Sep 2023 11:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230918145533.14642-1-brgl@bgdev.pl> <ZQhtWNaCiHVu5yzL@smile.fi.intel.com>
 <CAMRc=MfkzdFgwEuNGJYgxyCA_b__Ds-jA4S+jVT1ULJ9DTRhOw@mail.gmail.com> <ZQl8tkWnQcjtFBbQ@smile.fi.intel.com>
In-Reply-To: <ZQl8tkWnQcjtFBbQ@smile.fi.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 23 Sep 2023 11:19:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK+PimVukScvVjoqOdOWWG_e+xCurhP_9SvA_+7scYWw@mail.gmail.com>
Message-ID: <CAHk-=wgK+PimVukScvVjoqOdOWWG_e+xCurhP_9SvA_+7scYWw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: sim: fix an invalid __free() usage
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     brgl@bgdev.pl, Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        akpm@linux-foundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Sept 2023 at 03:49, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Nope, k*alloc*() returns ZERO or NULL on failure. That's what most developers
> are missing :-)

Absolutely not.

k*alloc() returns NULL on failure. Absolutely nothing else.

On *success*, it can return the special ZERO_SIZE_PTR. But that is
*not* a failure at all. It's very much a successful pointer.

Now, it's a pointer that you can't actually dereference, but that's
very much intentional. You can't dereference it, because you asked for
a zero-sized allocation. You got a zero-sized allocation.

But please never *ever* think it's a failure. It's very much not a
failure case, and it is very much intentional.

It's different from NULL exactly *because* it's successful, and
exactly so that you can write

     ptr = kmalloc(size);
     if (!ptr)
          return -ENOMEM;

without having to worry about the "size is zero" case.

The standard user-space "malloc()" library is misdesigned. Surprise
surprise. The kernel isn't.

                Linus
