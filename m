Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5E256BCB7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbiGHO44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238240AbiGHO4z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:56:55 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5C52E6A6;
        Fri,  8 Jul 2022 07:56:54 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 136so6421602ybl.5;
        Fri, 08 Jul 2022 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UBRtgf5jJxHOWcpxKu4eQwMRDGgY5Iuuj99uz+8kowo=;
        b=IWTPycY6Hmt4wDHAJk1jV3FHaZieD7XCRemY3UVaV2S18sBuang118IXqQsZcx42DW
         jKx8IUnbMBHJMjlaaCiDeRKTcwIyWZgBcFYCMSu7nJt1b2ME5JXcFopGAOq+sFjCHw5H
         0jQ2CCAoI+p4ax9rhqdi5hhDq82Lf9iDHUUQwk3h1o6bUm7mcyD4maTTNw0QWsa61jXq
         gQHjxeIwCscVq7pBwTSAQnvu1ocRW5FrW2gHB0j1kvR/X1n4gUyXz3ajpf3cz/ezD6hW
         maur3sqUE0fl/CcV8/RGAX1fOFHZNjS0HVPb2REP4n/uG3tjKzpe5251P68NbJdD/lSt
         7ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UBRtgf5jJxHOWcpxKu4eQwMRDGgY5Iuuj99uz+8kowo=;
        b=7q3h4IEWBMW0Ekm2w8p/eCx4rUCa+eUiujpvpzYZvWGMHo8qsQf6yApCSfvG/gckWD
         kMkRQjaTBzx0vFqFD8T6QnPsFar5Ygr/41Y4dFTDjtKcHxamf3oxUF6mGEP9NWf3zCST
         hkVnaPJzSpqTmaKnQAL/JKOLBXiJo65zCBUzvD0KqTumrO3DRDSTOhI3xz0LvgNK4+HN
         X5xzBUz98LwMAt2qR+cwr+NZDtevyPDKBA54fgii+iW9L9PpJsymXFUbhEOHOlQdVxAl
         Hls5KL1RK9eASDL5GsWPp1HCm/D1X0/a7u69Ui6G2y1WuJd2svZKtDzg/cYqAxKUq+1H
         BhDA==
X-Gm-Message-State: AJIora+piakNjkit9aebEizLflEako4psKC6plwmsD3hsIen8VRftEGZ
        DZ0BZzGLnQ4XT0cLxC6oHHABynVulxQa0J4hwIg=
X-Google-Smtp-Source: AGRyM1sBOgArE4IWL83q2y3kNA1qLQNTMFG2FesqDH2zVAvdLv7S4AwTSdUcMMjJ2UCJ3+G+yrWYOkMkB5SNRESKIKE=
X-Received: by 2002:a25:dd83:0:b0:66c:8d8d:4f5f with SMTP id
 u125-20020a25dd83000000b0066c8d8d4f5fmr4151487ybg.79.1657292214063; Fri, 08
 Jul 2022 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-5-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-5-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:56:17 +0200
Message-ID: <CAHp75Vcv8i-XXarjA=sE_gkG57ngADLrsG2=xA71zOfxtfEUCg@mail.gmail.com>
Subject: Re: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw properties
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

On Fri, Jul 8, 2022 at 11:37 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> Use firmware properties (eg: OF) to get the device specific
> configuration. This change just replaces the platform data since there
> was no platform using it and so, it makes no sense having both.
>
> Special note to the PULL-UP disable setting that is now supported as
> part of the gpio subsystem (using 'set_config()' callback).

...

> +#define ADP5588_DEVICE_ID_MASK 0xF
> +
> + /* Configuration Register1 */
> +#define ADP5588_AUTO_INC       (1 << 7)
> +#define ADP5588_GPIEM_CFG      (1 << 6)
> +#define ADP5588_OVR_FLOW_M     (1 << 5)
> +#define ADP5588_INT_CFG                (1 << 4)
> +#define ADP5588_OVR_FLOW_IEN   (1 << 3)
> +#define ADP5588_K_LCK_IM       (1 << 2)
> +#define ADP5588_GPI_IEN                (1 << 1)
> +#define ADP5588_KE_IEN         (1 << 0)

Okay, you add something in the wrong form and then fix it in the other
patch in the very same series? Please no ping-pong type of changes.
Squash / rebase your series accordingly.

...

> -       ret =3D adp5588_write(client, KP_GPIO2, KP_SEL(pdata->cols) & 0xF=
F);
> +       ret =3D adp5588_write(client, KP_GPIO2, KP_SEL(kpad->cols) & 0xFF=
);

Do you need these " & 0xFF" parts?

...

> +               /*
> +                * fw properties keys start from 0 but on the device they

Firmware

> +                * start from 1.
> +                */

--=20
With Best Regards,
Andy Shevchenko
