Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15EAE5B1F30
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 15:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbiIHNbc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 09:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbiIHNbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 09:31:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B8E861DB
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 06:29:57 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gb36so38008953ejc.10
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PDuAPZrpPEtZS68Yxx+kwA9YlOfP3w3tOQUXiw/qzS8=;
        b=QH57RwMVu8vMSoQCu6D5f9wGqQlvcOcmb4CopxZrOhkFCWLbwJ6AOwCi0TTzqbNsRA
         cBJMO3DjLvPIPMLbAL+8736YVIyS6wv3WRZ/0DXmx0DCWf5SeffWDFdEenHY1bTY+LPk
         7TO1CeDgQMhSHrZi3G1sdNaDAjHhpQr2EET5Q9aAbm7LsPqInO24KZi6tAVjKw65jd2i
         FCK1JTYESyuAYtTOYvp5qht7U02LmNdSDveT2UlQPw0kP5uRiFqf61QkdOoyg1XZnWNm
         /7/ISSMyI1NbbedTVgrPhfw1wBHBxTS9jXPP2GbE+qXLjpx82IhMf5mfq8xn1AdW7mvb
         YtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PDuAPZrpPEtZS68Yxx+kwA9YlOfP3w3tOQUXiw/qzS8=;
        b=N+vc8Fi/k1LeQ2Gx1VDI5kaVtbEv29saGmKZg5+CjctzGlu0LC64jq+rdhpAFltQ/k
         0NkPhq7EPYpwCbAFOuDDueI6P73bNiJNU/4MQu2hD2Rbo4PXIlTT3IrqCC8ajnw9yWZS
         WZkIcX8Z3wl4bN7txchPNiP3mXttvQWzMd7e5tP13FjDM5YXbGF39hgvhU7pBGzKrO1Y
         EXWJC9EcWrZ8NWDIg1DC8KQJQSr9VeuhKMS0ZteX0WZp/EVUbqZRpy7dog/rvrWBp73i
         ljAjDeWZoisaiO+iGnReTzpFzuF3AMPsVgkzXtQL1WQdvaLHA3TaMvoDXtLP7eVdmRDg
         qgqg==
X-Gm-Message-State: ACgBeo3EL0uh0vW6/W2N9d8geCZaBXkyN6gkh0u0n2hrv7KZfl1n/PJw
        OtbREtbqFj7193m1P6iVZb9owKU0xda7N6xB+Vfj2g==
X-Google-Smtp-Source: AA6agR7zssRGYnqc5tnQE6Pq9ZVgR66W//Jr1xQ+ados38ww6SnvXF3vj7pDozd5PzloL51ZyUnMbu/bJsxChqtBddg=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr6050505ejc.203.1662643795629; Thu, 08
 Sep 2022 06:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com> <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com> <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
In-Reply-To: <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 15:29:44 +0200
Message-ID: <CACRpkdZpu-3gOEsXBwdjcdTEqNz4MGn59gZX0Mkdy+-+Be7LPQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
To:     Hector Martin <marcan@marcan.st>
Cc:     Lee Jones <lee@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
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

On Thu, Sep 8, 2022 at 2:58 PM Hector Martin <marcan@marcan.st> wrote:

> > If the MFD route is the best, then you can register each of the
> > devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> > as a relatively recently good example.
>
> I think cros-ec is similar enough, yeah. As long as you don't mind
> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> future T2 and legacy backends) we can do that.

I'd even suggest its own subfolder under MFD, if you already know
that there will likely be more than these 4 files.

Though nothing else has a subdirectory in MFD right now so
maybe Lee should approve of that first...

The obvious upside to using MFD is that it has an active maintainer
and patches get reviewed and merged swiftly, whereas
drivers/platform is usually managed by SoC and x86 tip maintainers
and what not.

Yours,
Linus Walleij
