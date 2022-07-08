Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBB156BC52
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238107AbiGHOuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238461AbiGHOud (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:50:33 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA425241;
        Fri,  8 Jul 2022 07:50:32 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31c8bb90d09so146843307b3.8;
        Fri, 08 Jul 2022 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q0JBA5dEk42iXqV/362gU6ZiGuGOU2GBZ+qsDlv3VJ8=;
        b=q6X50LbY+YNrTa/01/6GSAAMuGiINz+DrTkxjV7pINrxhYACJ9g/+Z37I59+tiHTYU
         EnlGcqnWqOtm7KKYkY9uAhkAtIXt7KAnNRR3Ff6we20+yev1JLn3LVgIIlkQe7QZ7b0I
         6amlzEzBDV9Z5/7kTQS6WnFxeK610LGXiLGbDAEZiOVgDIey4A28neVI2510uqJF3Ak8
         8l9vZjB8y2alIx8F2+EWi/KiE4j4ijo3b2jVhBLuOXOa5Xxc3iTcWjCijwbBer4DaES/
         01Y/Xf0Lc6XNpObEB7Lw/+fdvyWCpDKplVtapgO6mSiJ9J7kPacf5NeybnNId5JSH9CL
         IVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q0JBA5dEk42iXqV/362gU6ZiGuGOU2GBZ+qsDlv3VJ8=;
        b=eJw5VV5pga8BKtfPQZnbiFTR88hbxCyzwkIoCEHxFdoJl59gE8pgi9pLUo8X6+i67L
         f4AQC44GlbqcqsTLRAXTS87iXNzowMbMaQxWOj5pKKkC+poOMcB8qReuZlQbn7Qth3/p
         3zOAQ2EEU1Gbn4EUpiLOkc/GSlzV2E2ZE6rq+8cs1l9q/tYaibH6eENzdpWii9RCtnV3
         nkV0HsUVKECL0whF/Woyk9MhH9mzWass5xv0T7L0032mtF64h542EnICjpanmts1/Qdb
         C8/DZf3gHkBxRxPYf008PjraWGnFI74IaCPJDGus/eMG2wCWjksrNzuAaThfwvzBECKG
         dJDA==
X-Gm-Message-State: AJIora8GXhn+F5f2hqbMbz03xds/CmyEXc26Xne5ma7D6QpBKy14pXYF
        NnaRMmwoLzl444whgAiYIkjnSf/r9cGugR8Ix5k=
X-Google-Smtp-Source: AGRyM1sGUXyQ7+KGI1HN9XGUKmWhyZYkYSB0orvOUIzdh2+XiFSvRlclKnvliLoAKXTXTJ8TlalpYMCQb4uc+VFRWjc=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr4320440ywq.18.1657291831099; Fri, 08
 Jul 2022 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-8-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-8-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:49:54 +0200
Message-ID: <CAHp75VeKg9G7o6evb47P8jgwG2Pgh5prw7WJYwXZq4pMGZCxUQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] input: keyboard: adp5588-keys: fix coding style warnings
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> Just some code cleanup regarding coding style. No functional changes
> intended.

...

> -#define ADP5588_KE_IEN         (1 << 0)

> +#define ADP5588_KE_IEN         BIT(0)

This is actually a change. And if there wasn't bits.h included, you
would do it as well.

...

>  #define ADP5588_KEC            0xF

Probably then GENMASK() ?

...

>  #define KEY_EV_MASK            (0x7F)

GENMASK()

...

> -#define KP_SEL(x)              (0xFFFF >> (16 - x))    /* 2^x-1 */
> +#define KP_SEL(x)              (0xFFFF >> (16 - (x)))  /* 2^x-1 */

Ditto.

--=20
With Best Regards,
Andy Shevchenko
