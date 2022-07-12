Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0CA571474
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 10:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiGLI02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 04:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiGLI01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 04:26:27 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E482578DD3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 01:26:26 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 136so12739653ybl.5
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdwxK6sqddclopLMDQXjGSjLursyiRjgU3MJexMgrN8=;
        b=T0mE9leD4xAeEnQzNe1mGvbTU54tE591kkrtZQbGYmGc7EycL36Z0zNh4GYKex6Aen
         PS7pbj+TxdcWJWy6I+f+SM+RCHh9vi0SWg5s5sBnouNh54+xUrMgPF9JSgv5lrKcaa5D
         6Q0cCpe35CVD+efZerCXq2mzJ5Qvz9+/AVtIYLOeEnuvkUe6i5UHjqdOdPlekTs1Uz7u
         4D1lVWmUP0TSvwidh8MdZeGYAUG4XHcvXD0p9HVBQXbRNSNfy9Dh4eT0Ud1iZMul/RiF
         8sNwgwGZl2Bmfic8J2jWrodm3A8Ow8XztUb08p9xxZaRuEzfh9GT+bHudTqs8szsNftc
         9WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdwxK6sqddclopLMDQXjGSjLursyiRjgU3MJexMgrN8=;
        b=LYke/f2h+kMAalKOZJNWMRQ5S9icPuuFq0IbEvzxYaNhLD1CfevOXs22Q+/Ew4Zljh
         pXQTAzqfT8uWpJWJXh7Guec3zweJ75cTfXE80xBIfpAI1LxEYBxo0Vlph0MbS8ee3emI
         s7WuSybtNRZtBe3/n+5Semt1wZwpXH0yYWVXDY1TLDR+CYyGpNI0UBorCTaolQCBYogs
         j5R59k9XEIcEVD+xrDASu0EJ6GKH4EFUIZWyDJLdm03VzPYq5FEgQxBLnONDCKv2y94w
         C1P/jc7H2pteHadBsovzG/e7JWz3KylRXaow1mhzwdq9QyzL5S7C6eUNeuFolRfZbzyI
         2Tng==
X-Gm-Message-State: AJIora9rXpm97iOan6vVZmDJ9SUms8AhmfF8g1MlPs8Nr8iw+arUSEk/
        CjpjnauHRRE5oSD1e19UeZBWl6tjCoj30H2LU5012XmPvP8=
X-Google-Smtp-Source: AGRyM1skU7B/1Gl0/uh6OxHgWgqtXXalUK32WZZ1omCInIqFTjNoRwTkWmiNd5ic0U7V725ztvnU+sfgDKBAA9PmB6M=
X-Received: by 2002:a25:fe04:0:b0:66e:1f8a:8e89 with SMTP id
 k4-20020a25fe04000000b0066e1f8a8e89mr21731565ybe.514.1657614386132; Tue, 12
 Jul 2022 01:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220711125238.360962-1-windhl@126.com> <CACRpkdZJBT86um5VM0e2mnMEv=cVrg7PmZNGbZ0GwxC-1nXbBQ@mail.gmail.com>
In-Reply-To: <CACRpkdZJBT86um5VM0e2mnMEv=cVrg7PmZNGbZ0GwxC-1nXbBQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Jul 2022 10:26:15 +0200
Message-ID: <CACRpkdY0HH1c2bWz+W9wna7wP1-HjuOL-tRBsvUo0iEuGx3VQQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 11, 2022 at 3:23 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jul 11, 2022 at 2:52 PM Liang He <windhl@126.com> wrote:
>
> > We should use of_node_get() when a new reference of device_node
> > is created. It is noted that the old reference stored in
> > 'mm_gc->gc.of_node' should also be decreased.
> >
> > This patch is based on the fact that there is a call site in function
> > 'qe_add_gpiochips()' of src file 'drivers\soc\fsl\qe\gpio.c'. In this
> > function, of_mm_gpiochip_add_data() is contained in an iteration of
> > for_each_compatible_node() which will automatically increase and
> > decrease the refcount. So we need additional of_node_get() for the
> > reference escape in of_mm_gpiochip_add_data().
> >
> > Fixes: a19e3da5bc5f ("of/gpio: Kill of_gpio_chip and add members directly to gpio_chip")
> > Signed-off-by: Liang He <windhl@126.com>
>
> Patch applied for next as nonurgent fix!

Oh no I shouldn't. This goes to the GPIO tree, took it out again.

Yours,
Linus Walleij
