Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073D156BC41
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238800AbiGHOtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238708AbiGHOsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:48:32 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7842D11143;
        Fri,  8 Jul 2022 07:47:50 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 6so9282312ybc.8;
        Fri, 08 Jul 2022 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mz/Ux3Ou/cK14GdLUhDkuVK6gkMVtDA5F7kC8bnPWig=;
        b=UvryhlPIlhV0sltk681l687VzjELtvqZdewC5z984Gr1kHJpaS3+hgFplIJCb41mpp
         KkPlgc/Nu27MqFBAmZ92PxNajeWbcEgxI1BzZsM31zDpEDP4tFikVd6V9BY2mP2CsAlJ
         Mwd+xQNYDJNwJH4lculVOcmyIsSfbW0h1WNNXbtj6Gl91cpxaGsNh4k5AEZrhVH3Mey8
         UcV0T5R+/7eJpXgkkaEIygk23R1cvomxvVpc9FRRJiYC19APID0tt57p263g5wb26D05
         Vjazay15xSejcVQ4ZvY9CAT1aQYXnCSKmY4U5ml0h5cqveBx2Q0gIj07VqkV2vVtNMYE
         WktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mz/Ux3Ou/cK14GdLUhDkuVK6gkMVtDA5F7kC8bnPWig=;
        b=6WoyeMR7EauDCkgejobeKcJ662MxNeyu/80FpI4iytoPb3+tOEyJtDKaOUZN6YJxoP
         IRl9IZFfEeNHjyk5pLIgsR1kX/l4uMoywxxBYW1klVG2g5RONERqNwYwldcvMPrXzeoG
         S5wbfe4uwRkHydYuzFEbH/sEE/Q/cZQD6qPGAVGEAk8MbY5RB4XRQrA2yeK8hmDCQ3V8
         CzPjudUn+2wqWin/FwcVBAH/kvMauZ37eOkG3Jlu38xCmVqOxKzcChYRavLRZ0oS3Db9
         NVAa0jbTyNmThYYq+GndFmwB1lCemNVg9qaI6NJ65VGj9vvo8I91R7NY464X0pOyoZ2w
         z8hg==
X-Gm-Message-State: AJIora/XSUFPjTI9Fe3jXu5hBANVTj4JCnUrBmSQyFRTz0LgjjgYzWqI
        GdrIVIzDN36ExYWhgokOUyUUNOFHatgfv8wq/bA=
X-Google-Smtp-Source: AGRyM1trhugMFGAtkPDhLyqFiNUH6Qtd9rczSJ5NNn+/yzXL+jmMF5Zk+T2xaPuRXQjonCtA7KM/kWrEr9RndVq5hCw=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr3905653ybs.93.1657291669650; Fri, 08 Jul
 2022 07:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-10-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-10-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:47:12 +0200
Message-ID: <CAHp75Vcs6cjqKS+Kv=Vx9xPCH6kDZSZObeUDKc+VwwEMaVSTNA@mail.gmail.com>
Subject: Re: [PATCH 09/10] input: keyboard: adp5588-keys: add regulator support
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
> Support feeding VCC through a regulator.

...

> +       ret =3D devm_add_action_or_reset(&client->dev, adp5588_disable_re=
gulator,
> +                                      vcc);

One line?

> +       if (ret)
> +               return ret;


--=20
With Best Regards,
Andy Shevchenko
