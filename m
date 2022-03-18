Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1D44DE09F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbiCRSCr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239903AbiCRSCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:02:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A75B2A129A
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:01:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m3so3313761lfj.11
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1Ms63NIkd6E7s+RusloWQgZ7ue4LhJ4QsLqeHtSUJw=;
        b=UmJ7ZODw+NbFnzVmsyjuDdBgu4T/BwFBuS2/0+3MpNrwys8fTBTfkYBO1USQX87RCc
         GytlT2Sz0odsaeGpYDGyMwEBtfolTTfoXe/0/w8shAKFDO+IRj1la0blGBdQOVphsqY7
         M3IJWHcNUuY3XpphtwP3Ccs3F0vVtc7X4tupL6zeR1RE0r6kEUnLdV6sv6abGBSKuAvT
         qsz62NmNx+qchrEYSrn3OzEydIzwRraHZ8mwieJYb1vuVoLB/731mnpJMslLxnJ/Q8em
         PiirQtwAVuwulvHUk2tiS2Du+CYiHYNqBE/RFHLy24dEqp6UfqUw5Ii145O69Lw/vjea
         Ly/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1Ms63NIkd6E7s+RusloWQgZ7ue4LhJ4QsLqeHtSUJw=;
        b=L+tXXpH/nSmtDzGqBEmhvlX8ZtzqwKcRxlX8Ay48Er8QEt79QTj525zRVzPpyO86ch
         0QAd1kwsIhFjh97N6T1ubsmrVm2JNjfWYcWOEC4NaH8aCJ2AUlapJ8H3f/FyIBGnmL3Q
         Q32lNnNlQywQ+DOfGH4C6eThTpysYmRegSO8SdvPRYaTKI6zrb8SndApVpvCGJouWm/O
         iz/qRL0QS5BDYBDyYUHWFAD7XIgqtv5+irrBAMR/A7+GZJgemO1uQ5ej6SnAiA9QN7sq
         kBLisCwdTVpAv9OVdezU2Kagx/gk5GJJ6NKE2lnXkUvRFN47F8OFTQdCLaDo6jmsZ6dL
         jNIQ==
X-Gm-Message-State: AOAM532R66UIRxY8fKzogbFVqbf/HwPuVM/4ces2qngGEfjOGdqDWcCH
        2BcAOX/IR7tLHes6+yhgZVFjyEpEo4zphNKkS/uTHQ==
X-Google-Smtp-Source: ABdhPJz6aj15Mk032FInyJsNGaIzC0VM6EnNcglPQg/SUnzZ2trHPqDTPq6Y0J4vC0VxLXeRF9Apc6TRZUmywwUSrg0=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr1382981lfv.626.1647626485133; Fri, 18
 Mar 2022 11:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com> <YjSROmYwwGhpsXMl@smile.fi.intel.com>
In-Reply-To: <YjSROmYwwGhpsXMl@smile.fi.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 18 Mar 2022 11:01:13 -0700
Message-ID: <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bill Wendling <morbo@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Joe Perches <joe@perches.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
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

On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > unnecessary %h[xudi] and %hh[xudi]")
>
> Not that I agree on that commit for %h[h]x
>
>         signed char ch = -1;
>         printf("%x\n", ch);
>         printf("%hhx\n", ch);

Will print:
ffffffff
ff

Maybe we should reconsider our recommendations for signed types?

It's probably worth adding `signed char` explicitly to
Documentation/core-api/printk-formats.rst, as it is a distinct type
from `char` in C.
-- 
Thanks,
~Nick Desaulniers
