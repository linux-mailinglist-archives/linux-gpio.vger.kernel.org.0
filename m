Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8270D5805AE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 22:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbiGYUcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 16:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237164AbiGYUcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 16:32:35 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0011B2250B;
        Mon, 25 Jul 2022 13:32:33 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id b11so22593126eju.10;
        Mon, 25 Jul 2022 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5uTJfbjnCnNY4L/Fr3ZU7lb8k5HMvtMkTOBlXtv0Il0=;
        b=AQasQ/MSGTbHW6t7ys2gXk6LP7V5bLGKVh0gfNqxetFMDc46uqliQx1vGDyExDaf6i
         SEM37qO6RpfOq9AAsrjiws9PL6LNDKboDBQzgVIWcGJgdPbtXgPEmlxtQJNFsB7D7AHw
         OVebDbKFOSLmCnK5DjCnXy8+GsaCQjneXxDoROmzClH+zA1eExpQK+Gcvnj+4++DyadP
         +sDFI0MkqW4X88dAtYspPnGXB359YsDTrPhhFn2+T0DenlqCaDS9EhBi8YAyRmOPtw3I
         9Zv2VAw98FeDlIkZQ8VKXwFTrs8EuqsRqxTaGHWX9rxo3XP3//pKMeYl+25vOyiIKmaC
         LtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uTJfbjnCnNY4L/Fr3ZU7lb8k5HMvtMkTOBlXtv0Il0=;
        b=kECEBRW7vlklyUkuPrvrbwJYwBazyPcisE4v1l2SmD/5zHBplvsEVlD+cVblz5hPKI
         xQdW+04L6DC5tY5ikLl1Ss2CxTRwxU07uz3DCEAMw2bcQ88UVjdtH8NcnFU5otoP2bWG
         C9qjt/bv6GvGQP613xINZEcDTrAP9+HCk7NwHq54Is7o8TR3LD4GvHExZI+XflYL/B6X
         u/Q9tUXHPJcYoZf0F7VFWSXoEGAyg/u8KGbfalLF9GiMBeM+Tb08ztRW3I3tGiD0mKln
         o25r6P+EfLkcR93Xe4pKnqfQtszPpcDgjt2c6o1fX9fqVlXaL1SW2q19ZiLgLMvTaFfd
         LgoA==
X-Gm-Message-State: AJIora+3VITTZuDDJ4lD/hqOIcsi0lyEeO7fJq/9r5FovqaQ8eau+efK
        rU6u4s6lT97V31+Y8YFCvpTxdfw2Yk6V4b/E13Y=
X-Google-Smtp-Source: AGRyM1uyBNChG5ECz+p2Fd8YgOxxtmnwutdvyTx8z1E+g68+5PjLrzoMydGgCXDQwbro9Akd5Qttt3/aOY5ERzSxyLE=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr11434125ejc.394.1658781152514; Mon, 25
 Jul 2022 13:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220721080423.156151-2-nuno.sa@analog.com> <202207231228.n8l077iB-lkp@intel.com>
In-Reply-To: <202207231228.n8l077iB-lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 22:31:56 +0200
Message-ID: <CAHp75VdY6qikNgvh4K5Ga4D5MHf7sEfm0kbNzN-xNanwj4yQgg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     kernel test robot <lkp@intel.com>
Cc:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 23, 2022 at 6:57 AM kernel test robot <lkp@intel.com> wrote:


...

> All warnings (new ones prefixed by >>):
>
> >> drivers/input/keyboard/adp5588-keys.c:336:9: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
>            return INVALID_HWIRQ;
>            ~~~~~~ ^~~~~~~~~~~~~
>    include/linux/irq.h:1245:24: note: expanded from macro 'INVALID_HWIRQ'
>    #define INVALID_HWIRQ   (~0UL)
>                             ^~~~

It requires irq.h, but hold on. Marc said that he wants to rather kill
that definition than having it spread over the kernel. So, please use
your own custom macro with an appropriate type.

-- 
With Best Regards,
Andy Shevchenko
