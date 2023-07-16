Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93012755750
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jul 2023 23:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjGPVM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jul 2023 17:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjGPVM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jul 2023 17:12:26 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC181A6
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:12:25 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-577497ec6c6so34297757b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689541944; x=1692133944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3b8UztauwV0ipqVWs+m4z5CuiHs0HTjuwiinV+KW6c=;
        b=iJE8TnKnGNUVcHSbBHKe81kuBytUmh/nX7RWrJ4hWhiaxg7kZSEMRkAHryEj/emUoK
         G8zLTRQrdrD08I+i3WrGYu8BjLZBQnfr4MovpIdbAA+xR7mQ7f5sgQhH3EjkxbdcZvXI
         /eCLrVWANcrIhH9h8rsrpb+PVPHo27zbvUg2X9Tw9lcOmzgB6OVKN3d3LroBpYoq7jKo
         aPG+Gf8a93XgRAvjV0hitpKVzqI0RxyPGPXOsL60WOG4gRC5TwTeU1+RSsdO1qablql9
         bt+qzWDalevoGP8CaXGDl3DJnvPE9EVZcnJ5/BEFhuDaGuEGgPAf/ffqWqYMzqKMHkYp
         l20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689541944; x=1692133944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3b8UztauwV0ipqVWs+m4z5CuiHs0HTjuwiinV+KW6c=;
        b=FJusowUV806mDfYVPjLMfIYeAHL8BYPvNBfn3kIPCWGnf8kqacgYdLXSY6xDYbtunF
         ffvFtjGYFlb90U8zJUAkl80gWcSKXL/j4Bv232xMWPpLHVXuuIr9nUmj4s9BQhlVL2bw
         FXrvz0RsjRSH+c+ZCdl2dULUmyXXy7FDSpLKpMpcZSccCDtdzH19TOtIubnywXC3ONu3
         Vz5MexvnLS4UzW3Xv5MYtfE5c5OoA4CAGR8VvrL68l5v8QOWilxS8cQsSRBA4VlPoQij
         zSgvq8m1SaW7w3ydEc5WYNTdfSIB2QbqJlr5djuAywEgOikoyZZmwt+yK5PxQXEop2gM
         J8Cw==
X-Gm-Message-State: ABy/qLZRpVDqE009jqehRwiy29u/zz8URw7xz3F/X+BwSrDigwJ4Qd4c
        u0XL+6yFvDuZji4Z7REHAzLaeDLpzSthKq2qiPSMkw==
X-Google-Smtp-Source: APBJJlFnnja0vtO/UNtiX8CqwYqlRiXKXzfhukb7/r++zNdWsfbBOvheL5nmnz2B7/+XfmeDKz1PdXeMoyOcfp2IvpE=
X-Received: by 2002:a81:68c3:0:b0:570:8482:4074 with SMTP id
 d186-20020a8168c3000000b0057084824074mr10302376ywc.42.1689541944469; Sun, 16
 Jul 2023 14:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230705194544.100370-1-nick.hawkins@hpe.com>
In-Reply-To: <20230705194544.100370-1-nick.hawkins@hpe.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 23:12:13 +0200
Message-ID: <CACRpkdavmueFkzMDfck+OMXGqjxT55_1XhomTXYdtXoGDYKi_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] ARM: Add GPIO support
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 5, 2023 at 9:49=E2=80=AFPM <nick.hawkins@hpe.com> wrote:

> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The GXP SoC supports GPIO on multiple interfaces. The interfaces are
> CPLD and Host. The GPIOs are a combination of both physical and virtual
> I/O across the interfaces. The gpio-gxp-pl driver covers the CPLD which
> takes physical I/O from the board and shares it with GXP via a proprietar=
y
> interface that maps the I/O onto a specific register area of the GXP.
> The CPLD interface supports interrupts.
>
> Notes:
>
> Based on previous feedback the gpio-gxp.c driver has been discarded in
> favor of it going into a separate larger patchset. This leaves behind
> only the gpio-gxp-pl.c driver.

The kernel certainly looks better after this change than before, so
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
