Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA276641F72
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Dec 2022 21:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiLDUSA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Dec 2022 15:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiLDUR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2022 15:17:58 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7386595B2
        for <linux-gpio@vger.kernel.org>; Sun,  4 Dec 2022 12:17:57 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id x28so9099466qtv.13
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 12:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f8NYc7EM2IXtxuh3+i3Wr2qsy0YCzgxsK6G124ZiKxs=;
        b=QNyR8J4FWGkJDH1uMJUuRQ7dYv+ynzw21s/LyMWN1Pg8knCFhy7FW7VhlPZ2xQZs2b
         AL54p6NWnznEEGxyV4ZGDXhtz6/Qe3Y43lHdXVHyAeNc6GV+dy1XTlKXMrew3ztdKOXX
         KD+LWsnzq/ol6XAvzctbIk6ZUts1AVsyn95yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8NYc7EM2IXtxuh3+i3Wr2qsy0YCzgxsK6G124ZiKxs=;
        b=lVkJ9RovP4BE+zmI6FS1tQghBTpwtiZfDhGlNBVuKuhYLD2gcDw8ejdCPX5uv/uzQK
         BF0IXq0GLM0iWhxRPssCZs1nc4O6Xf5uaihyhz46ov+49luE3wt8QBSOMuT86ZJOauW+
         RvmpwSBc5yJsbaLlRV1m+koFQcpBc2vlkZiBeRt/OQEhNm5zDak7qyfjTK9skmTRnpfe
         Md29YJiNTP55T5GY4O0TORmImlQVxgLao4MG3GcMU38ZZyu3TsKynbl5yRuItuRzaHi4
         Vdj+cp6zbLljj8A24WpJNmBDINiFSNjSKDeowEklolK6u1LJaId0P0wTwFOya8i4NLpv
         FtWQ==
X-Gm-Message-State: ANoB5pmKLgv8XyWCQWdzwFZWEMFXi84NElZoJuTTKKFwrj49PF4zFm84
        BYp5u1DO8JCBEdfwFcaJ2DqvRqgla50rAPIX
X-Google-Smtp-Source: AA0mqf66JOiXpg/IZif1i531jTcsEsIIzy9+5RLBfm+YwPVgNWt8ONdKWtd0kOLxmAW4UqF/HNki/w==
X-Received: by 2002:ac8:7291:0:b0:3a5:87f4:1909 with SMTP id v17-20020ac87291000000b003a587f41909mr73887473qto.470.1670185076147;
        Sun, 04 Dec 2022 12:17:56 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id x29-20020a05620a0b5d00b006f87d28ea3asm10276968qkg.54.2022.12.04.12.17.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 12:17:54 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id s10so2069150qkg.8
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 12:17:53 -0800 (PST)
X-Received: by 2002:a37:54e:0:b0:6fc:c48b:8eab with SMTP id
 75-20020a37054e000000b006fcc48b8eabmr5679851qkf.216.1670185073545; Sun, 04
 Dec 2022 12:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20221203150539.11483-1-brgl@bgdev.pl>
In-Reply-To: <20221203150539.11483-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Dec 2022 12:17:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD8+XZyO4H1STwXte6x1UcYsiHKaQ4OQF5ucssY=uT8g@mail.gmail.com>
Message-ID: <CAHk-=wjD8+XZyO4H1STwXte6x1UcYsiHKaQ4OQF5ucssY=uT8g@mail.gmail.com>
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

On Sat, Dec 3, 2022 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Here's a fixed PR from the GPIO subsystem for the next rc.

No, this cannot be right.

That last commit seems *very* dubious, and in particular all those

        if (!down_read_trylock(&gdev->sem))
                return EPOLLHUP | EPOLLERR;

are a sign that something is very very wrong there.

Either the lock is necessary or it isn't, and "trylock" isn't the way
to deal with it, with random failures if you cannot take the lock.

If you are using "trylock" because the data structure might go away
from under you, you have already lost, and the code is buggy.

And if the data structure cannot go away from under  you,  you should
do an unconditional lock, and then check "gdev->chip" for being NULL
once you have gotten the lock (the same way you did in open()).

But a "trylock and return error if it failed" just means that now you
are randomly returning errors to user space, which is entirely
undebuggable and makes no sense.

Or, alternatively, the trylock succeeds - because it hits fully
*after* gpiochip_remove() has finished, and now ->chip is NULL anyway,
which is what you claim to protect against.

End result: "trylock" can never be right in this kind of context.

That "call_locked() helper might make sense more along the lines of

        ret = -ENODEV;

        down_read(&gdev->sem))
        // Does the device still exist?
        if (gdev->chip)
                ret = func(file, cmd, arg);
        up_read(&gdev->sem);

        return ret;

or similar. Not with that odd "try to lock, and if that fails, assume error".

And again - if the trylock is there because 'gdev' itself might go
away at any time and you can't afford to wait on the lock, then it's
broken regardless (and the above suggestion won't help either)

Anyway: the end result of this all is that I think this is a
fundamental bug in the gpio layer, and rc7 (soon to be rc8) is too
late to try these kinds of unfinished games.

Fix it properly for 6.2, and make it back-portable, because I'm not
pulling something like this right now.

               Linus
