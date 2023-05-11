Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34936FED65
	for <lists+linux-gpio@lfdr.de>; Thu, 11 May 2023 10:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjEKICn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 May 2023 04:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjEKIBN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2023 04:01:13 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104E746A5
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 01:01:10 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so39989325276.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 01:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683792069; x=1686384069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McUfZXxoyN68Pz8/SqIaHkQ+qaI7jQjXaWVxB70Fbm4=;
        b=Ie57tBLP0SjAU+q9HkRqXH7w1Ak/h2UMEEx8u1HKC/qxYM2FqDgcksZr9LIsYNWUsl
         1OdWVQEMUvPnH0x/W01FXT4sZ0HV7RlstJTxL93uNhfbp8b2uWZtzvExkv2Bq84J0Xdx
         E7M7vQK5HDjsRQYBSVSBZlV9ajH4qqBTy+xtP2nZ+hnYo/hPjqejkIKIuJlpJ4femakR
         GnT2CcNFg2SFwMnjdsT9tYJDIREBVSPB8aGgt2EGKdLe3Q1RPbLqoRGObo9z3q4PY/+c
         ebpTl+aHx97sPkYebtmGUQpug/RUHQ7pXaGzmtX1F+0dnavV4WhjNE3ASyqg8WjU3AHv
         u5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683792069; x=1686384069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McUfZXxoyN68Pz8/SqIaHkQ+qaI7jQjXaWVxB70Fbm4=;
        b=DChY6F9rcWed4/s84pU1oqVol5B4h42SQfSea23IPc2s49UJU2zLGeYWG4FhlfV4ja
         r/j+kin1UBUE12a6oaw/09HmkIocAfKe1mIMvp+s5r6829IgWEdxj1Qh3l+xF/QvFoCR
         WehRvaiqVob1hIRbE+rHkrJAZFHZfKMM9bvGOmA9FEgswI+iMi0nPGwqm6p0iR8mcH2a
         cN+K9SPI7VKZ8NZG1znZOzCjKASTN7sqpaeP98ffwJjNMpS4NlaYnmEnH/a8CV+jzHFc
         AffUmC53rjI9bRm/loKj3WyHofPFw6KzEoCcMu6VnGypnMjMsBIrXlkq2zY5psy6IIJW
         5vnw==
X-Gm-Message-State: AC+VfDyjUblVfxkmxWE/aP3Q4At9dBtceP9o2D/91yDgsIrVWGF9apHN
        rslXNHg+9MSVSUuPBjAhgARtNZEFZNhD9C2R/5Mhbg==
X-Google-Smtp-Source: ACHHUZ6Tfv9cgVZ5JDwOFlziw588BdOF3QPOAb7FvOB6zNJ5owtsp+TK0PnPcLF8xGZ10EdS89NWugEkzkKG29HTYAs=
X-Received: by 2002:a25:24b:0:b0:ba6:956f:22d0 with SMTP id
 72-20020a25024b000000b00ba6956f22d0mr1765478ybc.2.1683792069275; Thu, 11 May
 2023 01:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230510001151.3946931-1-chris.packham@alliedtelesis.co.nz>
 <ZFtK3DydE24Qijle@surfacebook> <760ae58f-cb0b-dfe6-9e24-664310651e18@alliedtelesis.co.nz>
In-Reply-To: <760ae58f-cb0b-dfe6-9e24-664310651e18@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 10:00:57 +0200
Message-ID: <CACRpkdb1UFQ=1gePeBBEQ3ODu+6m0dHBqaxdtOF9Qc01WytMEQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Don't implicitly disable irq when masking
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        Ben Brown <Ben.Brown@alliedtelesis.co.nz>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 10, 2023 at 10:59=E2=80=AFPM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> The coupling of gpiochip_irq_mask()/gpiochip_irq_unmask() with
> gpiochip_disable_irq()/gpiochip_enable_irq() goes back to the same
> commit a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable").
> It's not immediately obvious to me why the coupling is needed.

That is just a refactoring of what existed before.

The use case is here:
drivers/media/cec/platform/cec-gpio/cec-gpio.c

The driver needs to switch, at runtime, between actively driving a GPIO
line with gpiod_set_value(), and setting the same line into input mode
and listening for signalling triggering IRQs on it, and then back to
output mode and driving the line again. It's a bidirectional GPIO line.
This use case yields a high need of control.

> I was
> hoping that someone seeing my patch would confirm that it's not needed
> or say why it's needed suggest an alternative approach.

Which IRQ-enabled gpiochip is this? Has it been converted to be immutable?
I think that could be part of the problem.

Yours,
Linus Walleij
