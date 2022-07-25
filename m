Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810A258003A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 15:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbiGYNyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 09:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbiGYNyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 09:54:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078D71580C
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 06:54:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sz17so20719575ejc.9
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nWnoriasKTjPDfSijueg14IXB7HkYS+jR5E7GrNcJoI=;
        b=sIWJ/HEQO30M3WPFW+JwQi3sVhMIjYWZvm2ynC0ydkv3Fm4i9CCcXUmpM/5RUs1NMM
         rJf0blQtU0mTVq4nYQY04mNi5Q9cYbD7FjeeUcOcypBZcGSkVf1fxeYTLB7xtagvFGNW
         CHCyFWL85qyeDPAHaBO57XVbRGPzAEPpBxjLbpIVCK4VaPnkv4xao6SYhqdrd4VM17tU
         BsJCHqVrmWW1KRWgXaM4UaEAs4tZ668fTGNynCo0adlFURisOHFygMV7gmM98A+TUcCg
         fjFHaKh/Xp3lHBEcU5vn9sjoq8JKFFWMnGa7FCrl7WocP450ChVH/GfDt9D/nx2kngxG
         e9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWnoriasKTjPDfSijueg14IXB7HkYS+jR5E7GrNcJoI=;
        b=mzHHhUBXHJYji1AqWomrL8TBHCTTgcEBfHaxypU0rT5rSv/uIkDaqGtzIFRnqI0dTF
         2k9UCmVk3xjcsjtQtbMhu2JnDv2/SgdevOj2FMLVSodIkV3qbMuKB5JVblIwuaUkNECx
         LjuHzerbdc+rE1djHCKz4zl6fkJQGjxclKXIYmF9Qb4cFiK+xKnY3lPpUgRlEvc4gvj0
         QpRE8DEqdPfhF92uJUhoKGoEml5GO3F0hT72G55bK+v0dTwBCyfYIB1jp0ASYDgjXY0d
         LrFFAMEDo5c2+nYhNVY299UZzWP9Ay7GBNqfFReowwy4t5+xVle1TRDPqbjRw0GKrwnx
         NTbA==
X-Gm-Message-State: AJIora9oE7Kdcun488TNEIQVhZbNCxM1IQ7O0Vx9+WRxiK0GWktT6BWf
        BXKvv0fAFe5nioH+zl62RzADoZePw4Q55hk390t90EFCP+o=
X-Google-Smtp-Source: AGRyM1uv4XSrJORFWnyeqF1yUEUIC5JQ8KMU9r/spIy2/+5/ZuMjdCNJ2JcZQ6+Dx3O4ygaEViARUdXqxxALaG+iBgU=
X-Received: by 2002:a17:907:9612:b0:72e:56bd:2b9a with SMTP id
 gb18-20020a170907961200b0072e56bd2b9amr10311393ejc.526.1658757256304; Mon, 25
 Jul 2022 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093422.2173982-1-marcus.folkesson@gmail.com> <CAHp75VddBhc9peHXfNfTyTNni246kC8CyLqCrMFadn67LGDarQ@mail.gmail.com>
In-Reply-To: <CAHp75VddBhc9peHXfNfTyTNni246kC8CyLqCrMFadn67LGDarQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Jul 2022 15:54:04 +0200
Message-ID: <CACRpkdaczrU1tM5Yt7P-Q2h+ge8STOi6HvvYeTM-g+JwS8_gZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-74x164: add support for CDx4HC4094
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 11:32 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 21, 2022 at 11:32 AM Marcus Folkesson
> <marcus.folkesson@gmail.com> wrote:
> >
> > 74hc4094 and 75hc4094 works similar to 74x164 but has an additional
> > storage latch associated with each stage for strobing data from the
> > serial input to parallell buffer tri-state output.
>
> parallel
>
> > Add support for an optional strobe pin.
>
> Sorry for my absence of understanding, but why?
> SPI has MOSI, CLK, CS, where the last one is exactly for that. No?

Forgive me if I misunderstand, but if you use CS that
way, the way that the SPI framework works is to assert
CS then transfer a few chunks over SPI (MOSI/CLK)
then de-assert CS.

If CS is used for strobe, it is constantly asserted
during transfer and the sequence will be latched
out immediately as you write the SPI transfers and
the data is clocked through the register, making the
whole train of zeroes and ones flash across the
output pins before they stabilize after the SPI
transfer is finished.

If you first do the SPI transfer, then strobe after
finished, this will not happen.

Then it should be a separate pin, so this doesn't
happen, right?

Yours,
Linus Walleij
