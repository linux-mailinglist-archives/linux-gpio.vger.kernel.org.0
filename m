Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B9580762
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 00:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiGYWad (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 18:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiGYWac (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 18:30:32 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CDC13E95
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:30:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b11so23018208eju.10
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pMRT6HLjy98DQ8uXQG4OLRi5mVqo0UDYq5RUWZsPoaY=;
        b=EwqOfu0sPrnZjYl3aJrGc88DDlC22qrrsbq2XSy9eBi2fKvmDJdGukKrLXL+RqjuVa
         tJql4zU9e/SSREleJzalM4FHbvmtzV/8pr2JRHQlly/wRBZsXChxiFs951tyzR1Hu5fA
         IGBhyHTThFWpvKVD5miI1BEnlmsDSkyJPsimogscLRm3gSJMWrv0GpO7hhepMR/x5U9A
         MRvETZ2UrPbsVQpbZQZ9SHkzuKJFvFhbCNUpf+35Blt3Et2e6mExS0g/oh6Hfcb12yp9
         0bnZSBuc/aZz9aJjHTIMt2h6k0yzd9rWldKV64GhjFrGAPugncG5NbGFPAcdPht2mWeN
         BWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pMRT6HLjy98DQ8uXQG4OLRi5mVqo0UDYq5RUWZsPoaY=;
        b=qLk6s7Zq6TgvvoDJ6Mgs/sOPkcpImmhZl1qpLdOfXjsMd4DoaKP5i6U6Pk1KWuWgBX
         kLnIE18mh9IxkCjGDxJkP1PqwHFmgDfN94KoInBPZBKflMGRwm61Fbsi6zDRfRX7HJOA
         XCYotf6v3OtpGmLt3pYnc4Ur6Q0XvxVinhiAgp4ufqlPiAz6Z6/aIaxoFW2xABY7FoSG
         nAqDotK5FjMuDNdJaOMrx4NNkU4czvDDbph4+j9u2+IlJW9okFRUS9nbR6wy+sXeAuGm
         F8VPLytbVPEiDARaPo3NSDLhfEwkxZi8u+lB4ewRWr+GS7qA6rpMLrBn4kEHguITKogh
         cytA==
X-Gm-Message-State: AJIora/TmF9qlbnMjBCuixl3oGMjof5b0uXC40ZGMkGJzuMp+HMagm1Y
        J/C1OvOVKAOcWDSYtNH5yOGj7pAvmdbsp3c5/bkzrA==
X-Google-Smtp-Source: AGRyM1uMc+aoB2qqdMYcBUZvUMANBbQ5OtYaG98HUeyskdK+JEwj4d/7iaPI8lIOaocsiZpU1pwNCjd3Z6EdrqY6cbI=
X-Received: by 2002:a17:907:28c8:b0:72b:97cd:d628 with SMTP id
 en8-20020a17090728c800b0072b97cdd628mr11773984ejc.208.1658788229740; Mon, 25
 Jul 2022 15:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224943.294057-1-marex@denx.de> <CAHp75Ve0EQfee+eiDDG_pgzt8V3yoWeVfRZswG3EdFZZRyxa2A@mail.gmail.com>
In-Reply-To: <CAHp75Ve0EQfee+eiDDG_pgzt8V3yoWeVfRZswG3EdFZZRyxa2A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 00:30:18 +0200
Message-ID: <CACRpkdZvjBBhNy_fQ2_dirSc1ddXCAO7dPg9OQW2eGDFWpn5rA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 10:38 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 12:51 AM Marek Vasut <marex@denx.de> wrote:
> >
> > The driver currently performs register read-modify-write without locking
> > in its irqchip part, this could lead to a race condition when configuring
> > interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> > the register read-modify-write.
>
> ...
>
> > +       spin_lock_irqsave(&port->gc.bgpio_lock, flags);
>
> To my surprise, is bgpio_lock not a raw spin lock?! How is it possible
> to work on RT?

It's a spinlock that is used both for the GPIO and irqchips, so if the
GPIO doesn't have an irqchip it works fine, as only IRQs are
problematic.

If the registers used by the irqchip are separate from the registers
used by the GPIO access, I think it is wise to use a separate
raw spinlock to just protect the IRQ registers.

They really only need to share a spinlock if they use the same
registers and the gpiochip and irqchip risk stepping on each
others toes. That doesn't seem to be the case here?

Marek: could you see if the irqchip part of the driver could
use its own raw spinlock?

Yours,
Linus Walleij
