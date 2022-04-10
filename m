Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE06A4FABE1
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Apr 2022 06:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiDJE3Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Apr 2022 00:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiDJE3V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2022 00:29:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A31B3B
        for <linux-gpio@vger.kernel.org>; Sat,  9 Apr 2022 21:27:11 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s13so16256099ljd.5
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2022 21:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Z1YLQ6CPp8qWYSXS6O3ReggvGyrIKglimVJl59baLE=;
        b=FcqLW9awS934gzVuSpON2tUcZg9aQBii+95gzCDBKmpWOTeF5pPT+AwkiXPREoO67S
         I85/O8SH3u9kIcfoyOvoUIaLO3i/R0YD0Riz9BJ0iyZ7hQio7lsfQVv+qjcQ7MqM7CA3
         SzEkytBk0Jt7+mEt8xTOE74CLkIQbrkqixg1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Z1YLQ6CPp8qWYSXS6O3ReggvGyrIKglimVJl59baLE=;
        b=aRzOjtX5uPgMWLNB510K8S1VmqNruV2dir/+7sMKkQ/izcAbSSW398YdTHvWKWCGW+
         DP9AqInKoVYQVb7tbpDrP+1T/547n2HFvH0IiZtKLJsJe0HvBL589fCRDQ5MiErukyvP
         /US8XCtVCePQYQ8SiEz9iyfFuPwRY2fpkfHTEsKDxoO23EqbU56DI/I1IkL81myoIgjX
         OcGqkjP/CdN7u52IvIU/tj9aoB0CZOOmYT7nzJOStK2v5M7COATzcQsuJYovwYoOiMGN
         69txXN2PE0MV0/SylVCKQ8v35WTFZ7alpbSucuqLnusZsaqebcJ5+E4FmgCBDMBANec3
         9Sug==
X-Gm-Message-State: AOAM533EZePCSk8ND+C4cXTj9TOZ2q1FqFwY5qvwhF7qovkxvmlvFWsg
        9beXAdUuqyp5oMAQXDuuN4Gv1DPA7KDlCdrE
X-Google-Smtp-Source: ABdhPJyG0qafs11RbOoboNPqi1QtF3icGaE4X8L33pnsCw1vMVxlGlW2omgDqpNDzXdcBHo6bykBwQ==
X-Received: by 2002:a05:651c:19a5:b0:249:8568:d065 with SMTP id bx37-20020a05651c19a500b002498568d065mr17001207ljb.207.1649564829453;
        Sat, 09 Apr 2022 21:27:09 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t15-20020a192d4f000000b0046b9c6856fesm217129lft.51.2022.04.09.21.27.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 21:27:08 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q14so16204194ljc.12
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2022 21:27:08 -0700 (PDT)
X-Received: by 2002:a2e:a549:0:b0:249:9ec3:f2b with SMTP id
 e9-20020a2ea549000000b002499ec30f2bmr16565379ljn.358.1649564827924; Sat, 09
 Apr 2022 21:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220409205134.13070-1-brgl@bgdev.pl>
In-Reply-To: <20220409205134.13070-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 9 Apr 2022 18:26:51 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgQbb0cvOnX1W5_Ho_SvpYqS4GuEo=gxhbw-UCjOaEpQg@mail.gmail.com>
Message-ID: <CAHk-=wgQbb0cvOnX1W5_Ho_SvpYqS4GuEo=gxhbw-UCjOaEpQg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.18-rc2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Sat, Apr 9, 2022 at 10:51 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Here's a single fix for a race condition between the GPIO core and consumers of
> GPIO IRQ chips.

I've pulled this, but it's horribly broken.

You can't just use a compiler barrier to make sure the compiler orders
the data at initialization time.

That doesn't take care of CPU re-ordering, but it also doesn't take
care of re-ordering reads on the other side of the equation.

Every write barrier needs to pair with a read barrier.

And "barrier()" is only a barrier on that CPU, since it is only a
barrier for code generation, not for data.

There are multiple ways to do proper hand-off of data, but the best
one is likely

 - on the initialization side, do

        .. initialize all the data, then do ..
        smp_store_release(&initialized, 1);

 - on the reading side, do

        if (!smp_load_acquire(&initialized))
                 return -EAGAIN;

        .. you can now rely on all the data having been initialized ..

But honestly, the fact that you got this race condition so wrong makes
me suggest you use proper locks. Because the above gives you proper
ordering between the two sequences, but the sequences in question
still have to have a *lot* of guarantees about the accesses actually
then being valid in a lock-free environment (the only obviously safe
situation is a "initialize things once, everything afterwards is only
a read" - otherwise y ou need to make sure all the *updates* are
safely done too).

With locking, all these issues go away. The lock will take care of
ordering, but also data consistency at updates.

Without locking, you need to do the above kinds of careful things for
_all_ the accesses that can race, not just that "initialized" flag.

                 Linus
