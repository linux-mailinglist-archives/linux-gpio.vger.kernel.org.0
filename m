Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9557450C3FF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbiDVWYE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbiDVWWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:22:48 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0184289365
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:14:27 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2f7c424c66cso6475527b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSeyVHSkF+E4oa0XSY6kFg4lNiCUpurOq85kO8Thfs0=;
        b=INjYxvAOSldxB3GnA5v+XowteYLzvKJl7xcoA5X45DW7NszU+ue5Iwuh82ikmKF7iZ
         aZqKiahCfnFgJCTxeIo7Ur+C9fmU/6R0kHKGNfogw8R4psa2PB73Gmi6jrfAleEWU3Fu
         TpniWkwmWdEIb2A4WwVWBbp6qzUTDyR9/3WeGO4B6Qr/bxVAl+v84Yj2BBPiR+nuXLvu
         1kszPQojltbMILFgPDnEn/IRbmR1E1ShQsQrYlYs4HhI7OFsDMc/aEAmfglIenEd5oRG
         gw0k5fbk5IKqtvD8vMwA/19gmGagwNF//wqWfUqOFaGb0Zb3dEd2eipQq6lXOmQWX/GY
         RHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSeyVHSkF+E4oa0XSY6kFg4lNiCUpurOq85kO8Thfs0=;
        b=MTmt/CwuFPZDGXvKJaRdjQnIa7CQS+xY5h73qzULCmq2Z+T8wJ5wN+SggK92OVBymw
         paRUijIkPO+mRx1fubZatsD1A+QVFvaArHhjehA3N4BVOr++fyncqgSVMUBIp8e/weXv
         8AZvyVHZfv6V1gr5X/FUuKfdB5VBB5KTfvLa5Xgr3pD2SDgrrNwqXwE2BhNPJ/Rs9Lyx
         RxzW6iQT/zo0Y4Y+3dGhks0PxUujnKRHSG2/Mk5DJLLzyuSJ3bqbOS/JYP/9ESUCXF5O
         1MDUkomV7NaBiIFs7cHRNlQZibXmndPLUI0/plHgzBkcbhFNO5VtJEoxKiFlIG/zAoxT
         blxQ==
X-Gm-Message-State: AOAM533afKgif0bDOeTJeJAncU/To9UC84gdmvYMMYatKj9oeJQJi35R
        kSIQPGnv/HCqMdCuBR7FTjCUHT9pq26TjogARKDGqQ==
X-Google-Smtp-Source: ABdhPJwq2aWVketHqepmniz2ODIzva2uUpTd0stgwqCpyhaz3cmfj0U/26pdY8xQiv+Js98HKRpSr6v3Iu4l/7S4vD8=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr5144986ywh.151.1650662066988; Fri, 22
 Apr 2022 14:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649533972.git.sander@svanheule.net> <7105ae382d7b328102f66b39ffd7c94998e85265.1649533972.git.sander@svanheule.net>
 <CACRpkdYmKbHOZChSHjB-ykQCyCziwYTO_+Ai2vheo0y-vD_akA@mail.gmail.com> <0a48cd99805736d6a01573effa28f771fdbe9485.camel@svanheule.net>
In-Reply-To: <0a48cd99805736d6a01573effa28f771fdbe9485.camel@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:14:15 +0200
Message-ID: <CACRpkda=SNKAeBpfdA2seRgZwmb0-SMxq-_c0je6gdR-8m+p_A@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] gpio: realtek-otto: Support reversed port layouts
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bert Vermeulen <bert@biot.com>, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 21, 2022 at 9:55 AM Sander Vanheule <sander@svanheule.net> wrote:

> The kernel for RTL930x SoC is built with CONFIG_CPU_BIG_ENDIAN=y, just like the
> older SoCs that were previously supported. The SoC's IRQ controller is also the
> same across RTL930x/RTL839x/RTL838x, even though 32-bit registers are used
> there.
>
> On RTL838x/RTL839x the GPIO IRQ control registers have byte layout:
>         [H1] [L1] [H2] [L2]
>         [H3] [L3] [H4] [L4]
>
> On RTL930x, the GPIO IRQ control registers are:
>         [H2] [L2] [H1] [L1]
>         [H4] [L4] [H3] [L3]
> which is the reverse of:
>         [L1] [H1] [L2] [H2]
>         [L3] [H3] [L4] [H4]
>
>
> Same for the GPIO registers:
>         On RTL83xx: [P1] [P2] [P3] [P4] (four 8b ports)
>         On RTL930x: [P4] [P3] [P2] [P1] (one BE32 port)
>
> It looks like the RTL930x could use a little-endian interpretation of the 32b
> registers, followed by a little-endian interpretation of the contained port
> values. That would mean two reorderings for every 16b read or write operation,
> and manual manipulation of the register values. Although I have to say that the
> current offset calculation is not too pretty either.

I'm happy.

It's not very invasive and the bulk of the problem is addressed by
simply using the GPIO MMIO library, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If someone knows a more elegant way, they can send a patch,
this works so we should merge it.

Yours,
Linus Walleij
