Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6857001F5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 09:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240378AbjELH5a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 03:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240285AbjELH45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 03:56:57 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E13FE713
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 00:56:30 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-55a010774a5so146127787b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683878188; x=1686470188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLoFyIrPAi3EEOdGC0zExOeBEkI6RlncueJgkn+e0y0=;
        b=HMJFokHB+58pzXXUqtY7cAb644FlHusC/0QvQ8mnHvtVEzP5S5nvYx1a5PPTEQDyOq
         00P4Z04bTG/JLzARxxNeQMxJmQs0jmSWsKMgwSBaJwM61vwwZ4MN/Ent0eCLByC6amOC
         HbucH7r5q9dGW/vBoESikkzTm30qudYmzxGAFaVN+q3GNg6pmZ1IAAeCmikDvHKEpWTy
         feiQgZ4qMo79dYYnmbaZl7uylfKAcaWTA2LAba8JVUK7iOEfJh+qe+nykQe2RwIHGmQz
         QMw3vIv01YmnQakTCKcOc601GDU87DIfN6Nn62z2ee860Z9sjnYaGzSm2wOyyJfICDX/
         BweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683878188; x=1686470188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLoFyIrPAi3EEOdGC0zExOeBEkI6RlncueJgkn+e0y0=;
        b=kBBih+oalVp9l0Lty2eZZZb2dl8ZV1FiNtw/u3D+GxoIoeYzUCrPv9ntImnW4H3Qwk
         zvUk5j5GFMPACaKC6f2svMeL+9IRKn6ZwtonVhuJrf4DwKBibBjiCWdrvEZtgou8qxQ5
         C/gs7CdgSz0FMtjeSBKmmaOygAkwam+UZLDN3gY37PXtwCT/6cUJr+9G+7tOXrkz1iHK
         MSTwSxtQqLIExUvrMemGqw7D7pXKBkYHBt95BeqZNdZqGvzelBxNZsZ1tavY0O07CzKb
         Czs6yLVkEz4p1nrBjr7M8JLL3Yhts9UxxanMXn+j8KTjLvk1/WCjxF1m0h/0ZuZSApkV
         vVlw==
X-Gm-Message-State: AC+VfDxmkhwfRuBwP5lRWEsG9c6LOGtchzWjkEwPQW1NmPiFOwBKcBMB
        i7h2qQbJbp4N7iAibPUfw42hGSf8yKIHnZ6kOAqkCA==
X-Google-Smtp-Source: ACHHUZ6Xwb7u3hs5uLg8fGrUxzysuqfkOz9s/fyjNuxDXJMRXslUlSXSUDO584ffWGLbiFqPBXAwnGaejtNlutg9wwI=
X-Received: by 2002:a0d:db47:0:b0:55a:1cb0:b255 with SMTP id
 d68-20020a0ddb47000000b0055a1cb0b255mr24063219ywe.37.1683878188652; Fri, 12
 May 2023 00:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230512042806.3438373-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20230512042806.3438373-1-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 May 2023 09:56:17 +0200
Message-ID: <CACRpkdYz9ipNTo2ORXKWy5Q4uCpKL=9Gd+kK76pestX7Onuz-Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Avoid side effects in gpio_is_visible()
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     brgl@bgdev.pl, johan@kernel.org, andy.shevchenko@gmail.com,
        maz@kernel.org, Ben Brown <ben.brown@alliedtelesis.co.nz>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 12, 2023 at 6:28=E2=80=AFAM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Calling gpiod_to_irq() creates an irq_desc for the GPIO.

Normally gpiod_to_irq() should not have side effects, it's just
a helper function that is there to translate a descriptor to the
corresponding IRQ number.

> This is not
> something that should happen when just exporting the GPIO via sysfs. The
> effect of this was observed as triggering a warning in
> gpiochip_disable_irq() when kexec()ing after exporting a GPIO.
>
> Remove the call to gpiod_to_irq() from gpio_is_visible(). The actual
> intended creation of the irq_desc comes via edge_store() when requested
> by the user.
>
> Fixes: ebbeba120ab2 ("gpio: sysfs: fix gpio attribute-creation race")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

I have a hard time understanding this fix.

The problem is rather this see gpiolib.c:

int gpiod_to_irq(const struct gpio_desc *desc)
{
        struct gpio_chip *gc;
        int offset;

        /*
         * Cannot VALIDATE_DESC() here as gpiod_to_irq() consumer semantics
         * requires this function to not return zero on an invalid descript=
or
         * but rather a negative error number.
         */
        if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
                return -EINVAL;

        gc =3D desc->gdev->chip;
        offset =3D gpio_chip_hwgpio(desc);
        if (gc->to_irq) {
                int retirq =3D gc->to_irq(gc, offset);

Here gc->to_irq() is called unconditionally.

Since this is using gpiolib_irqchip this ->to_irq() will be
gpiochip_to_irq() and that finally ends in the call:

return irq_create_mapping(domain, offset);

which seems to be the problem here. Why is this a problem?
The IRQ mappings are dynamic, meaning they are created
on-demand, but for this hardware it should be fine to essentially
just call irq_create_mapping() on all of them as the device
is created, we just don't do it in order to save space.

I don't understand why calling irq_create_mapping(domain, offset);
creates a problem? It's just a mapping between a GPIO and the
corresponding IRQ. What am I missing here?

Yours,
Linus Walleij
