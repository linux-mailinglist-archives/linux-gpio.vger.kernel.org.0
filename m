Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C7D67C768
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 10:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjAZJfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 04:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjAZJff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 04:35:35 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9871F1AF
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 01:35:34 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-4fd37a1551cso15154647b3.13
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 01:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Eos5PCq031bBmCjxIREeklYxC5wbGmtX2E8d74k8RI=;
        b=S5FGjkogHe7LPfKGI+9gUih6CR93txIffyFJyoT0bvWJv15+ynUNH4w1kAy7hxIR0v
         T3H8pp7dB9iw/BIVFNPc40nUKjyyO9kYl+3qnyFgcMkx1dF+tVRhFo+gm8i2yDMmJw7F
         +1iMDiKhphQH/sOALu6nJgEpHCmMoafr/vHV748Fb4BegZSCde1Bpdb0MV1DwDvHRIA9
         HVa0kLOsGu8EMklvCN/pZ87eucmA7l9stnmkRqkLzWF/4JM5VQBTXf5gglV8bR7eqPTW
         zIjAiu0JkVq2slQc6CojmfrZqICh7k5GT/B394HLB8ST7WN3mkwfwGS6Q9niqy4zSGSS
         Gz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Eos5PCq031bBmCjxIREeklYxC5wbGmtX2E8d74k8RI=;
        b=NB6qKh91S5nO82DTqNxBi8hvzge2WvM1hgNa+aXPMvWB6q3JnuRSeg7VWfX3cNWgrP
         unhLNVkUiuRN1cljLz7ipIds2g07Xz8WG/khczO0y8DusaqIRR/Ot6kyEUWbZiK9bcE3
         Y9QUGm6E/UT+7F0P6MHgsTFGheBs1Mf3LqnMV6D7Vrce4mx+XE5XSIglD1Na0NGq06i6
         xOx+hyrP5BsbC9fnFuucpsG4ggRh+JWm4xR7bNXUT7oxmTk09D6a3XBxGYz961ym2pYK
         n5fWQmOwrWH7Al7QinkiVXgf/m4UeP1SBddKUejKjRK2stdAiWl3TtBA0JNd/+1vdIVU
         pcOw==
X-Gm-Message-State: AO0yUKUP51kqfQaEYpeDnNoKZYL2MPPUbM07UXRNv8R5AHGmfEPwyp/Q
        7oOhTxti6oePuTQrQNOQkK2gTrGvJ8HuQpWit/cTcw==
X-Google-Smtp-Source: AK7set81N3qEG51TPrxypBsflo4//wXbBeebKKJ1uQRanxzHfxnU7zNdkGFdc4BSfVXkOylNiKRsmNqMT59aKPWiK0Q=
X-Received: by 2002:a81:784f:0:b0:506:651b:cd0 with SMTP id
 t76-20020a81784f000000b00506651b0cd0mr826401ywc.273.1674725733775; Thu, 26
 Jan 2023 01:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com> <20230125093548.GB23347@pengutronix.de>
In-Reply-To: <20230125093548.GB23347@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 10:35:22 +0100
Message-ID: <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 10:35 AM Sascha Hauer <sha@pengutronix.de> wrote:

> You are trying to remove the GPIO sysfs API for many years now without
> success so far, and I doubt that you will succeed in future because the
> Kernel comes with the promise that userspace won't be broke.

I see it more as permanent deprecation and nudging than removal as of now.

For some reason people perceive all nudging as militant and as a
my-way-or-the-highway style of communication but it's not really intended.
OK maybe I am softer now than in the past, one grow humbler with
old age.

It will become more interesting once we removed all in-kernel users of
the global numberspace, which is well underway. At that point we can
move the management of the global numberspace into the sysfs code
and distros etc that don't want to use it can compile it out completely.

But the idea was never to slam people to not use something they use and like,
it was to offer something new because they want it and like it more.

So using the character device with libgpiod users can:

- Get and set multiple lines at the same time
- Do biasing (if supported by HW) pull up/down
- Do drive strength (if supported by HW)
- Properly listen to IRQ-driven events on lines with real-time timestamps
  to ensure strict event order
- Use HTE timestamps (new feature!)
- libgpiod for the above with C, C++, Python and Rust bindings

By offering those new tasty features only for the character device and not
for the sysfs ABI, at least the advanced users are expected to switch over
to using the character device.

It's not like we're unaware about the upsides of the sysfs ABI. Easy to use
to do quick hacks. Always there. I have been trying to think of e.g. a
debugfs ABI that would be even easier to use for even quicker hacks, but
using only local per-gpiochip offsets, see the bottom of the TODO file:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

Yours,
Linus Walleij
