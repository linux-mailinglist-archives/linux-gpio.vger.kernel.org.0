Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7BB7465B7
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 00:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGCW0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 18:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjGCW0K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 18:26:10 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF850E5F
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 15:26:09 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c49777d6e7aso3343771276.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688423169; x=1691015169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw6+ByigHBJdfmEG6EluGaqV/pvtu1cF1vk8X2CKt4w=;
        b=h63KI61+UAK5TRnPN2pcivYePX6zulhB0EgH8bQvG7CknckBBxGc3UuOdud1w1guiw
         jryBqkaS0Z3p7IKK2k8rIxZrHrL2gechQvuV3+vbdceqxcXnJT4XvDezkBsHek8SDtYG
         keDMqZF49gHAGV5/fAlB/1tx5ozoyjUcAfk8AL1MjRv7jgOtkZkjSTPqWU21/2M1WDus
         cYgkQe2872RFWWOYsb9QiBcfxuEZU+j8FkHoKh1nwdEQsVCAj1rjVvXfsW22HfDFF5l1
         GfFgn2RxBHA4hwek1xMChZtom54eHOorD5Qsb6BzASvXNExvqih6AQtkGv3aQMrdud8G
         XhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688423169; x=1691015169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw6+ByigHBJdfmEG6EluGaqV/pvtu1cF1vk8X2CKt4w=;
        b=hl6fA9x1IumTq5rbOwgUvuEjIKEQqXSGWBP+ovqW527ekFT7Gr/uzpVutjO71lgcum
         ngSiE+2rw9dDsD5dYHzcqzqRV6GWvTVLgXCR/eGaNFmtJf8PSrr6z9DAVnBPWQ7Te2a2
         O3o3d2nxDysJ2ttqrkhQP5IKN2xypxOQO2F54VT1n27Yq1hMfKSImrJFq1ZV19SUnGcE
         180jZfcF570btH4mMS/IKI7Adkb6+N2mFOEnFhJrAJovcKywn8bb6Gepc1nz6PUhQ1IO
         LmWGmL8iRZF2kh4Qu2nISkC6pKC6pR4nGR6tzROQeIsloEABq+JvZbcXDyUfdfs0W7GZ
         Be6g==
X-Gm-Message-State: ABy/qLYFwO6t3f07CYWdyUP7je+h+j5HwdPrPFHLy3xyci5sWP8RaoqM
        1/snwxkK/NH5JKFbENWfFObGoIH5fInRzMuL3D9UZ82gdBNzHsPOjEU=
X-Google-Smtp-Source: APBJJlE5slpEafA4MBWpcHjh663tSp9z0h5d0hrSN2jHgqoWYSh9zriTPZ9o/PH+Xhxi8TTtX+W7n6jt/eh05CD0TU0=
X-Received: by 2002:a25:2494:0:b0:c4d:c258:7ad with SMTP id
 k142-20020a252494000000b00c4dc25807admr6009354ybk.64.1688423169117; Mon, 03
 Jul 2023 15:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com>
 <20230621174943.30302-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdbOoDKZRF+8cys6FAf4Yy=v7UokPAmUp9mSkVnbqsH2tw@mail.gmail.com> <CAHp75VdDJ2Eeur3oG01_1s6iS9aZXBzaoDfk+s6tEgEdqbdTow@mail.gmail.com>
In-Reply-To: <CAHp75VdDJ2Eeur3oG01_1s6iS9aZXBzaoDfk+s6tEgEdqbdTow@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 00:25:58 +0200
Message-ID: <CACRpkdZKLtg4wNZqY7ujrcOa=h8gazXxhwdCmPeDbgOSze0mXw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] gpiolib: Replace open coded gpiochip_irqchip_add_allocated_domain()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
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

On Fri, Jun 30, 2023 at 3:58=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> While at it, I would like to ask on ->to_irq() callback. IIUC
> assigning it with an IRQ chip makes a dead code in the driver. Am I
> correct?

It's fine to assign it with an IRQ chip but not with GPIOLIB_IRQCHIP,
i.e. gc->irq better be NULL.

> If not, can somebody shed some light on how the RT5677
> driver, for example, works with GPIO IRQ?

That is theoretically fine (I don't know this HW in particular).
It looks a bit fragile...

It's just a helper to translate a GPIO line to the corresponding Linux
IRQ number and when using GPIOLIB_IRQCHIP the GPIO core
will do this using the irqdomain, else it is up to the driver.

Yours,
Linus Walleij
