Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7116803F0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 03:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjA3C71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Jan 2023 21:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235521AbjA3C7Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Jan 2023 21:59:25 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492361BAD9
        for <linux-gpio@vger.kernel.org>; Sun, 29 Jan 2023 18:59:23 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id dr8so6401458ejc.12
        for <linux-gpio@vger.kernel.org>; Sun, 29 Jan 2023 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cuvuEIWvWifnWX+tS1UYLP6iIDWylaHtaPdx3s7KXPI=;
        b=P7m8d8Vu8n6QWMQBb7p50k+pVC6BEmR2mNBvda/nkiWAg+SXwQPkUAnf+RtpTGB91a
         KLD5Lg7XHB98GPiGC0W33pDX+Wttrj9Do6/FblIvC1EBy+WTQqx+2jBCcGBlubPR3mmV
         htYWs0wBIFhwhs+JVf8p0z85dRsKIIXP1mFrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuvuEIWvWifnWX+tS1UYLP6iIDWylaHtaPdx3s7KXPI=;
        b=HAHVDHbJ0AWTz+UvLqBF77qdquCdxP9uXPHoMuSd9hR0eQf7QIUztYhNv9NwPgmGzY
         +x82InTAzfuetpRwWzG94JbXJvjoiQLnOmjIPHjI16KCaTrnMdGVsw4w4tVr1JIhetUE
         YqDHj2uyFE9Fpo7Fe+RTsJ8JAkKZlV7Rjqje8+mkgChxHW3HP1RldmPME0WYq8U1Nz79
         g/Dyvbj96nbPeg04GbjtJEx/doZu1gkmzHkLoQccDtwM1GuCGXv1nex7XePpuOgqSVal
         McD0rudicA6GsMp58dU419ZQ9bI/jOM1ZKU71K9LL69WKRoZFvBGlA5sLxfqw6KjjzaF
         kOpQ==
X-Gm-Message-State: AO0yUKUSbroIUPes+D4d+ockhiAjaKkHZ0YTTr3reQ3W8MbX1DEQMluK
        Asl/hkxQKTxfTs+SgMBnViVCzfOJou1Y/jsFH6s=
X-Google-Smtp-Source: AK7set8jJbSsX0UW9Q/dgX/JZoXwGvmYuPcKHeNB3K01XA1dZgMi/vz0oqAdBiKgmfDyvC65QFwFa779jrBBAm7Vmag=
X-Received: by 2002:a17:907:2a03:b0:87f:5802:fd72 with SMTP id
 fd3-20020a1709072a0300b0087f5802fd72mr1847753ejc.237.1675047561610; Sun, 29
 Jan 2023 18:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20230119235501.53294-1-joel@jms.id.au> <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
 <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
In-Reply-To: <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 30 Jan 2023 02:59:09 +0000
Message-ID: <CACPK8Xf3Nz8mZrGrwUXx9PZWp90jYwEOAoZ2giY4qKou3opn3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 27 Jan 2023 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 20, 2023 at 3:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:
>
> > > A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> > > function's signal") exposed a problem with fetching the regmap for
> > > reading the GFX register.
> > >
> > > The Romulus machine the device tree contains a gpio hog for GPIO S7.
> > > With the patch applied:
> > >
> > >   Muxing pin 151 for GPIO
> > >   Disabling signal VPOB9 for VPO
> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
> > >
> > > The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> > > of_clock code returns an error as it doesn't have a valid struct clk_hw
> > > pointer. The regmap call happens because pinmux wants to check the GFX
> > > node (IP block 1) to query bits there.
> > >
> > > For reference, before the offending patch:
> > >
> > >   Muxing pin 151 for GPIO
> > >   Disabling signal VPOB9 for VPO
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Disabling signal VPOB9 for VPOOFF1
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Disabling signal VPOB9 for VPOOFF2
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Enabling signal GPIOS7 for GPIOS7
> > >   Muxed pin 151 as GPIOS7
> > >   gpio-943 (seq_cont): hogged as output/low
> > >
> > > As a workaround, skip the clock check to allow pinmux to proceed.
> >
> > We'd want the clock on and and the device out of reset before this
> > makes sense though. We're just assuming the IP is in an operational
> > state? Was this just accidentally working because reading the register
> > in a bad state is producing 0 instead of other undefined garbage?
>
> This makes sense, can we come up with a resonable patch for this
> problem or should this one be merged as an intermediate remedy?

Andrew is correct, my testing showed that we do need to take the
device out of reset in order to write a value that sticks. Qemu is
insufficient for testing this as it doesn't model the reset lines.

We really don't want to enable the clocks just to set a value that
doesn't need to be set. There's a big nasty delay in the clock driver.

I suggest we revert the problematic patch until we can come up with a
better solution.

Cheers,

Joel
