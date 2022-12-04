Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1F8641F8C
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Dec 2022 21:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiLDUa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Dec 2022 15:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiLDUa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2022 15:30:29 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8221408D
        for <linux-gpio@vger.kernel.org>; Sun,  4 Dec 2022 12:30:28 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id mn15so7004770qvb.13
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 12:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmoVJWMPojvTnASsj0qBJ0Rwkisp9Ussgz9gl66R+uI=;
        b=Glx1PI7Z6KX+LjJjPgG4GzP3mkpTet7G6g45kXQ8yRcUaUUqP7nqETBkyBdtWC15Pk
         v2ilbTuSNI3QExsCeOFWbdhkEJw93RnxY/Ls7NBu/2l3cBwAwHGskESwGLcYtVMWdcSg
         TBKRf5SceUHD/yU/D2DCSmiZoV/NY252r4YiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmoVJWMPojvTnASsj0qBJ0Rwkisp9Ussgz9gl66R+uI=;
        b=VPT9ITKb2LvMqfP9nsL2P14mj7KCcqsCs0Da/Zlh6iBpcwS/XTW7WeKW+8pMmSkdp7
         ug2hW++pcmbyetO4UmOA3vtaUxrQyuAJkO9ym7dbzY16XrNRZgDqPWBr+D6zAWBm+smD
         ldWsEaZbF1uzGxpGsfvEjF1dy+oi1TPD57Qf3TkLbs13fubt5++R1hp00MEhPAnHpfpt
         +1yTZoDqBWdIrCkE+2dm+zpFw+UBYWHTux91XOJt4l/ETXLBDBpKZYf2p19PY8v1rW1x
         RArjhFKE0wKffllxQhqAeS3nBQOksmD7CdBcl/Wqdk8xP4P/U3Dj9BhwavvUbCKZomlo
         7Lgw==
X-Gm-Message-State: ANoB5pm/cmnFA77+u0rLxAKQznCiacgZYLOAK51fX0MpQPsjRv3sjN+x
        YBYiIwnaBh4F9zphjf4tVj8bMvBqdayefrVD
X-Google-Smtp-Source: AA0mqf6pBL4DnVchXDbv6IMPOszpHSxSojRS4ZENQlOyg+vXgqhrzx0SeDwYcl1BXfmAiq5UGnN5jw==
X-Received: by 2002:ad4:558e:0:b0:4c7:5568:c0a5 with SMTP id f14-20020ad4558e000000b004c75568c0a5mr6313675qvx.22.1670185827183;
        Sun, 04 Dec 2022 12:30:27 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id ay9-20020a05620a178900b006faa88ba2b5sm10771799qkb.7.2022.12.04.12.30.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 12:30:26 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id fz10so10223313qtb.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 12:30:26 -0800 (PST)
X-Received: by 2002:ac8:688:0:b0:3a5:122:fb79 with SMTP id f8-20020ac80688000000b003a50122fb79mr63347496qth.452.1670185826082;
 Sun, 04 Dec 2022 12:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20221203150539.11483-1-brgl@bgdev.pl> <CAHk-=wjD8+XZyO4H1STwXte6x1UcYsiHKaQ4OQF5ucssY=uT8g@mail.gmail.com>
In-Reply-To: <CAHk-=wjD8+XZyO4H1STwXte6x1UcYsiHKaQ4OQF5ucssY=uT8g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Dec 2022 12:30:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi1jC=9FGA4haX0UrAthqFL7rAFHU=0O00L3_ECQLgoCQ@mail.gmail.com>
Message-ID: <CAHk-=wi1jC=9FGA4haX0UrAthqFL7rAFHU=0O00L3_ECQLgoCQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.1-rc8 - take 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 4, 2022 at 12:17 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And again - if the trylock is there because 'gdev' itself might go
> away at any time and you can't afford to wait on the lock, then it's
> broken regardless (and the above suggestion won't help either)

.. another reason I can see is that you are holding other locks, and
the trylock is either for deadlock avoidance or because the other
locks are spinning locks and you cannot sleep.

But if that's the case, then the trylock is basically a hacky
workaround for broken locking, together with a "I know the only reason
it fails is because we've already entered the shutdown phase".

Again, that kind of hacky thing is not for this late in the rc game.

It might be an acceptable workaround for backporting if it has *huge*
comments about why it's done that way, but it's not acceptable as some
kind of fix without that kind of documentation for why it's done that
hacky way rather than with proper locking.

               Linus
