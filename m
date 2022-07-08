Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB54B56BBCA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 16:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237925AbiGHO0H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbiGHO0G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:26:06 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EE22ED4B;
        Fri,  8 Jul 2022 07:26:05 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id y195so6846892yby.0;
        Fri, 08 Jul 2022 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wvQfxnZG4ZdwejDKeELG5D9djKYZwf0Iv6VO6TXRSmc=;
        b=CBG8iS3ij6JIrBkghV2RnPyMzjkqOO0YEHBP+yLwNBO6ypSZ9r4qBS9BO4WXG0J1uK
         gHQHUZaMiOEXMQVNTYBOG54JUdcVvRYYTOlgDSGs49LNNSjz1Gh/lAA5knbXD0xQNySf
         Jv8YNFjIrjx/LJ4XfFGQVUoJjjarBqRPlx6mui7pkMfa+IDC99O7TRFeyQNHjBUAwQVz
         Qp+CQWJj23CMJp0EzRufmLo7Xd6VmpAbp0aoqNYUkKQHPb0Gwvf9xKK1bGjUbok26V/O
         wz2r1zh4zZ6uEG/j00JUbLOGihKq1Aryu9CwMBlRX7yrr5RZ1vKOhBxqLfGsOrXoxyh7
         lLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wvQfxnZG4ZdwejDKeELG5D9djKYZwf0Iv6VO6TXRSmc=;
        b=yAOxrlQsSonLKO48pUhltMdd52B2xTFvoeVpnCFw67Cl3qEVQ4q/EQRw0DZbsIYGaS
         6EK4O5s0lTWFXgfM098+pTozUtcx3X2gc/fAO2MeEju5ZDs9dzGjb26nLmzWaXDEiBIE
         5RLkPE9uI2b1yH23bJ5plIJkeWo1CE9U36YgJQ65tVoYAzOWD1B4y4+DbflTVma9RAMJ
         fVYmn5LfsujR1AezZj/F71t949javmhDQMu1e1octSf2f3uu+3dgQn093sO2egunrE46
         faLY21zdWnv5ta/m6oNQxzpcTGnNvalhAQtXv30wsHyxZvZe2rop9whP0n1HEpYdg/HY
         jtLQ==
X-Gm-Message-State: AJIora9oVrewWtN078jyeT/8wsNXsR/5xeGaJi8d7O19ilY9y08wSBqx
        qOFyq2z9XYBPRFQIiRB8jLrGQzsgLAfUT6T9tQ0=
X-Google-Smtp-Source: AGRyM1uyqLtSqA4ynvTMMC0P7HN+HjCEdSJuhp1EYPAkM7n6+bb0NMYKZKrnK9BECRYEPnXnGIEz9kRyxsr3mPhrq+I=
X-Received: by 2002:a05:6902:10c9:b0:668:e27c:8f7 with SMTP id
 w9-20020a05690210c900b00668e27c08f7mr3912039ybu.128.1657290364535; Fri, 08
 Jul 2022 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-4-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-4-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:25:28 +0200
Message-ID: <CAHp75Vconnzkh6JA03X9G7QKNaBEu2fad7GwHckmyZY3rV8QVw@mail.gmail.com>
Subject: Re: [PATCH 03/10] input: keyboard: adp5588-keys: bail out on returned error
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
> Don't continue in code paths after some error is found. It makes no
> sense to do any other device configuration if a previous one failed.

...

>                 for (i =3D 0; i <=3D ADP5588_BANK(ADP5588_MAXGPIO); i++) =
{
>                         int pull_mask =3D gpio_data->pullup_dis_mask;
>
> -                       ret |=3D adp5588_write(client, GPIO_PULL1 + i,
> +                       ret =3D adp5588_write(client, GPIO_PULL1 + i,
>                                 (pull_mask >> (8 * i)) & 0xFF);
> +                       if (ret)
> +                               return ret;
>                 }

Looks like a good candidate for bitmap_get_value8(pull_mask).

--=20
With Best Regards,
Andy Shevchenko
