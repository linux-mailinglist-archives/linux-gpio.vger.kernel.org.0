Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEFE54E6AB4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 23:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355386AbiCXWcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 18:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355388AbiCXWcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 18:32:04 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4107FBA327
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:30:31 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2e5e9025c20so66098417b3.7
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nx70n0suL1GDpxFS4bYKUTt/7IVPxxVYBu7tsC4lV4U=;
        b=wV1PHTJJBE46LfidocVooxEy6bX7qvq2914zt2Oyz0DEkO1P2b9T4RBK2uyUlfHMXi
         8L4h61xtgy+nf1Sp5SjH+p+8xOdkyIscKNzC5c+ta5w2ZHwPHdqOR0m4HDH3kZXyKUd+
         4nVVH+VWPcaO2hF/59Kup2doG3cbGYIsSNIDHELH+X3HMxlxEBK6tWEYjh3cu7KJsdFz
         8a/veQ9Qdlc7QnvgFXa+xmf3DPpx81MEUB3oDQM46z75GtJbBjRqGYYo8c4Jh72kwjjj
         qwwd+T0/mXVeNFlmfSMkAwTE6NWBqBCe6huzIpYFivT8APWWXtVemglzRRTu2lcqtEft
         r1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nx70n0suL1GDpxFS4bYKUTt/7IVPxxVYBu7tsC4lV4U=;
        b=cRuHehvYeZ0gLb/8kbt0hmDd5ilJR8h3c2X2+2u3R8SZkIirh7VvIsY8YbcEvLLvz1
         alMHtcLlECkVkcm0Ei0ZIjgLgs946HuXJeQ7U58zzbsGjth5yVexEPJZ6AcKMhLoZWrL
         WPMIQEhCKfyNSMpoTAjvwGJtGSeSSwzasd/RVdwHXkwfm+YkwVMcdToAKNUGwq1z3Qh3
         Jw9Tpu1U3vU03vYEikDlKq0ToZ6qIa7/15lPw0VBl7gR/s0hsMm/LPWvzDHe/e/L+C7T
         s8WN5elBvEIrUKWAd/E9oVMWpq3BJRziTlPWEd2PNHqJ2wuqvFgSSCeVkvvDuJ9S4rN/
         jyKg==
X-Gm-Message-State: AOAM532dAT12PA2yt+P2/7nGhDDIQPMJhaRiQQhf6Ir4MocBUzcHHqOa
        dAA7RmP3DsiHhHn5IHO5Nc6HhMz8z8/y1e21ifd9PQ==
X-Google-Smtp-Source: ABdhPJyX/ehlHwq02rrgBUmaGF0K2xU+m3rjYaoGRrmp/Pny8sEiCtj0Bb3Mr1HrmXMEl0nAG2wa9t/q+Y8pZcewrXk=
X-Received: by 2002:a81:5706:0:b0:2e5:c451:b257 with SMTP id
 l6-20020a815706000000b002e5c451b257mr7678607ywb.126.1648161030506; Thu, 24
 Mar 2022 15:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220223154405.54912-1-maz@kernel.org> <CACRpkdbEDoPeu=TWmsJ_t-4+NtyiiSCXoj9rymspZt0nC+yrsQ@mail.gmail.com>
 <e39c68c6c8c99fec796461cde33f78df@kernel.org>
In-Reply-To: <e39c68c6c8c99fec796461cde33f78df@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 23:30:19 +0100
Message-ID: <CACRpkdZJch7SmMNGhfJ9hpNP+=yy4ZE_8wuATsaqdHQdaMhbAQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 10:35 AM Marc Zyngier <maz@kernel.org> wrote:

> > I'm happy with this approach as long as the 300+ drivers get fixed
> > and the old way of doing it gets deleted.
>
> Of course. Note that it will take some time before it actually happens.
> My current plan is to stick in a pr_warn() each time a driver
> following the old scheme gets registered, as a nudge for people to
> update their driver if they care about it.

Fair enough, we have a bunch of those WIP churn tasks in
GPIO anyways.

What about adding a blurb to:
drivers/gpio/TODO
so we have it on the radar?

> Regarding documentation, are you OK with me simply replacing the
> current code samples with the new approach? It will at least avoid
> giving people the wrong idea. I also want to write a brief migration
> guide that people willing to bump up their patch count can follow.

Yup

> I'll repost something once -rc1 is out.

Sounds good!

Yours,
Linus Walleij
