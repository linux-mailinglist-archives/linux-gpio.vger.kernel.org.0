Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FE7694277
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 11:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjBMKOa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 05:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjBMKO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 05:14:29 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084BE2696
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 02:14:28 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-51ba4b1b9feso156070867b3.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 02:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m24dMml2jSsL7Dl+CG8vq6QyqBxUdcOiPSlfJt9P/gU=;
        b=dE2vgPahqJN7F/K1m9ROLqCom5+Eovp9L8bfNcPdximbdKLGcCyli9VhHJJ6scj4ng
         avy/w/0zSP4GRNmvUk6hcT+Va2/KMge2BIxpA0RYQEUbvCMw9fPLXtWUEm0Ry6jHZ8So
         E5TDI1o+5iJkkRvMIrc/Nv0bf5fh64ST0ifoQ1hA4XOnulMD/m/8ofstgAXaHgfxxWJG
         S2c4k0ZhFOD/c4lqig543GHI20z+6VNiE6d9paWKFiOh/pQmg+QlojRQ5f14stuLyCVA
         sunw43YfiiXnapdsh5eTnhUuJ8h0L1wQDftkz+XE08sOwEfwAXyY/WchXmYdRGC0Rb5t
         y0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m24dMml2jSsL7Dl+CG8vq6QyqBxUdcOiPSlfJt9P/gU=;
        b=c2VUS89UvJN4aZL9cInlkvOkrqJtaawDU0OvEh8zM3RqfSwaYpWik5Z0cRLf2oTCCQ
         +N2SkahHiAH1ecRzjIrNlrcVN2K6xRdjq57OKKBwaYt6LhY05quLDcu5kiiHQ8BHG8r8
         YIKwt1Ljkev4Hh4D7m+5SyneuGOT+ig2A0EBhjHnAgZepfvDCWmTBQqZb39vScD24WAJ
         U/jc7IMEzTzu8xX8K0Zak51P48rsDdpWgS/6FSMbYWWBoIOaJ1WTyKSPZOXvi/0ngOr2
         xMfdQEeV0bUcZWvyEwg6lFnOCDJMjjfJUDy39nd5vv2wlMpvm2zPuD/fBafubh7hoItp
         N2NQ==
X-Gm-Message-State: AO0yUKWa8Qg4pnxLoQCno9Xji7WU3Oppo1/1pilglQ9fQQMhEEbhStTP
        Hfd1BWYcT4V3S2Fz5wlQNJhoIP0Jq9UcjBOKDrKgfA==
X-Google-Smtp-Source: AK7set+LuEjq0hGS8kTkbDCf7Aen0jDGWuexoGHd2jNkgiQU/80/rPS3PmbPLavbhwF7RZcjpke/lJUVBzgNfpa3fRQ=
X-Received: by 2002:a0d:f804:0:b0:527:ad38:2c5b with SMTP id
 i4-20020a0df804000000b00527ad382c5bmr3046509ywf.336.1676283267256; Mon, 13
 Feb 2023 02:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net> <20230202-asahi-t8112-dt-v1-11-cb5442d1c229@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v1-11-cb5442d1c229@jannau.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Feb 2023 11:14:16 +0100
Message-ID: <CACRpkdadj1Jwh+XwbEvzsULOo2vaKX9ioJVw3aekRbPB371A_Q@mail.gmail.com>
Subject: Re: [PATCH 11/17] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t8112-pinctrl compatible
To:     Janne Grunau <j@jannau.net>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 12, 2023 at 4:41 PM Janne Grunau <j@jannau.net> wrote:

> This new SoC uses the same pinctrl hardware, so just add a new per-SoC
> compatible.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
