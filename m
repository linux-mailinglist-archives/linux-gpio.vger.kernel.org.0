Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8944E2EC2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 18:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351598AbiCURHt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 13:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351589AbiCURHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 13:07:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27782AF1F1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:06:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w27so25648686lfa.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/7FJJ7qSAHgZRJnHXKO5tZ1Hgqiu2AMH/REX+ZRS18=;
        b=CcgHOId2RyMEcxGfJARNzZUbdlGCM1utZBV6z2njMf4aotZ5ZdYT92P6HnVd9xeSDn
         6SKI9lq8krPDyV7w1W69qTqXWW/ZdAWa6Mrom2kCjhCKYZp8s9hila6IncLMwIkz1Ozv
         Oq53zzxlEASFXHt6+NFvB+ficHM9zDUPGzfao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/7FJJ7qSAHgZRJnHXKO5tZ1Hgqiu2AMH/REX+ZRS18=;
        b=4NQId3AZN+sEGImiJXk2+ns88cCsRUPbUeLBdLnt2yZRphRarh+MiRb8AvE5m52eK8
         yUxGDjnnZBk2p58WYW9nzjeRu4a7S3avVI7xIhEis6z1tGXsBrU5zd5wQr8HfnbPvbnf
         vUCHvn5NFJbz0BI5ZwUHRG4uqluQZrrYO3vnt6VLlTNE5+okvh2KR6fxOONFceJYYwaY
         VEfFeteqthhbQupmCuRGFK6x9pJOuldG6xIfGspSl6JNeVp2UmZHlne/2GtBXNrksZrg
         37gzRQNMTE0TxZIAtppyfWttVU7wq3wATx8xkTsCukUIYL5K3XHSYBAaw2H599USMp/3
         byLQ==
X-Gm-Message-State: AOAM533bE2IDzrNcyVWm3eXMNZkC8x3CCvEj96qVO9pGK9SQ4PyHJWSD
        xLs7RkKnhBPIW9Q33fjaEowzDjoMvVBlN3p/oxk=
X-Google-Smtp-Source: ABdhPJzSgikgwLy2FywvYNYLsCqMsLssY8KuJZBnII5Y549TH/YewzabaJ+RJojE0ivhIpnui/h/Kg==
X-Received: by 2002:a05:6512:390e:b0:448:5ddb:e501 with SMTP id a14-20020a056512390e00b004485ddbe501mr15587190lfu.319.1647882374332;
        Mon, 21 Mar 2022 10:06:14 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id g2-20020a2ea4a2000000b0024983b1a8dcsm426762ljm.105.2022.03.21.10.06.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 10:06:12 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 5so7469403lfp.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 10:06:12 -0700 (PDT)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr15823991lfu.542.1647882371543; Mon, 21
 Mar 2022 10:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <20220319222228.4160598-1-morbo@google.com>
 <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
 <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com> <CAHp75Vc+T3eM9=yu9XccXKmf1ZnR6dz1ZP_eL4faPnM8ZNbbnQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc+T3eM9=yu9XccXKmf1ZnR6dz1ZP_eL4faPnM8ZNbbnQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 10:05:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0zxgKyHn1F_K6o-uxvPmdKA0njcyD3PDSAvVZgdk4OA@mail.gmail.com>
Message-ID: <CAHk-=wi0zxgKyHn1F_K6o-uxvPmdKA0njcyD3PDSAvVZgdk4OA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: acpi: use correct format characters
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bill Wendling <morbo@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
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

On Mon, Mar 21, 2022 at 3:09 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Would you sign off on this? I will then replace the original patch
> with your version.

Sure. Note that I (intentionally) do bogus indentation of my inline
patches, because that thing wasn't actually _tested_. It's obvious
enough and should fix the issue, but I just wanted to point that out.

With that said, it's _so_ obviously correct (famous last words) that
I'll happily add my sign-off to it:

    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

and I suspect the explanations in the email could probably be used as
much of a commit message.

> And for the record I have a follow up patch to clearly show that pin
> is always unsigned, induced by this discussion.

Yeah, that sounds like a good idea - for a compiler it was obvious due
to the load from a 'u16' array, but a human would actually have to go
and check what that pin_table[] array was to see that "yup, that can't
be negative in 'int'".

                Linus
