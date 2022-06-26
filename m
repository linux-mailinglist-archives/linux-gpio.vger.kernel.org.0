Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9512B55AD8F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbiFYX2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiFYX2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:28:47 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03296FD0F
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:28:47 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3137316bb69so54865427b3.10
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=N4D4Xi/ZkS3g3tlO204tZ0mkKhnIOSd0acgAfI4W+ZQommQ6v+6ziiA9vaKLZB1zm3
         ylk5U6EcbKo2nBk3LV4euELboUgU97u10+M1vva8j1SQ9NaOUirt1OsOICRsZxACg39f
         lgjgv0snIW55QwjgLDiw+ocE7KVu13CPv/p2Qtk6lVq6Ub5vFMo9cuwQoJE4N06H78Hm
         tGRrQnvm18hSZ4Z4tIHIAyTHJz2gIfo/cPqp9gfycDseZ35TW5OgJ3cGaPs6XzYWAJSC
         LR1o3zCklx/ZCZPlE4JK6uVQOh1UlN9XUpSz9K7shEAVGA8y9CmkSSZoICDXatuWfoqw
         2LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=enkzOhcEu/mOVag2dx8nVv47TfH2izphYyqUbbvOqRoY+4cEw15/6rYBaHBOkOKItz
         4kt7xJSfN5k7Rm1GyxWQhhujWcrNBhe9b6LROb4lk0BJYQVZgH59SUsFvAm6rVYDUI6F
         RRuxiuJ/fbpEcV/Vx+P6n9+eXojDw2Cwohrqlcvzk6mKzcMQ6A5zKqnPaAupCURLzak6
         EbxOhyb4MaUQ5G7yCg5Wn1RR+25GO8fo2njB+FrBw8iUwk3jqEFF3ZX5GLt+S3v4N/MM
         ZMhwTZ5Cifrr0ccGM7YqsRj7IR4ITKWayPSmAGaGW1MJHmiGAhTN25u5mFW/9yQzhdAt
         i63A==
X-Gm-Message-State: AJIora8eMR1Kk0EZ2mPUnxl78zB+II2Qwit4DjEdGxOMK1D88e1CY9lB
        Gm+Oum2ctjXEymcU6bvccU2pffKPpQi1EiuP0Os3Tw==
X-Google-Smtp-Source: AGRyM1spnHk4DL1GaXxVekSrkt1iH996cdrejY3FYGxU0SDg1CbcxSaWPwj2DH8lacg9auY41J3Ys1RDyCcjq6nVpWg=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr6969123ywe.448.1656199726318; Sat, 25
 Jun 2022 16:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:28:35 +0200
Message-ID: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> gpio-keys schema requires keys to have more generic name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

OK, do you want me to apply this one patch to the pinctrl tree or
will you collect a series?

Yours,
Linus Walleij
