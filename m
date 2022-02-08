Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E19E4AD65F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357789AbiBHLYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356854AbiBHLJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 06:09:37 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EF7C03FECA
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 03:09:36 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id w14so36718891edd.10
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQBVfVDlvCSrk6Sswzhkfx8sEJDxZvcBw31v7IjCtFQ=;
        b=Zcfv+t1DGD3EB3HP5kz6zWh1pByYKpIDp3Q8enYRVXu63AQLAzCQugZ4SoXjF7MtVL
         wPoRzOO0w7TcQorumE2LF1RehZcto52dZVQic+Oml3gV3bdUn5exQP5qlieY7VK772IB
         899VBZDJodq3ijB1E4fvyfVsqH5Yv4Wvfw9r+FwTxvKuN0Gv9NsxgyWrCWSqhTgUcvlA
         SsUtmMsqfSbJdRCSSPqUcEhsTh85nK2hsyj/xSZL1PKB+kbu1sc+t0jMHQvCn4lcflc5
         LXdfZb+JZrjoX0m2iXKT7sAVVRTIwqpSlqCbqvYB+7glzzi2eSDHj+aHnj1g5e8Z9v1g
         LvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQBVfVDlvCSrk6Sswzhkfx8sEJDxZvcBw31v7IjCtFQ=;
        b=tp/w1xGFkBW2krUX5vlxV/7o8kdEmr83IG9+sXZ9FWT0eTVeaaYOaWLQG5kRyb7IZm
         Hfee2qtrCwAZv5TJKfUyHkV7VV0rwrTpMo41V2X+ihMsaU5LB3ufZfk73beZyQSFLOLv
         3nIjCzkWWY5Rfc1ydc6/hZJKo7dqTUNKdQoSuAv/nQmRpJSkTqIm2wMuPI2mAQbfOu7R
         d9kexxHIKWpcvW9XCeaN5NXPGlmzXDkY7OKFoHCUjUr/+e6+nuedGe7p7uI970vQaxGE
         A4Z9UnaSAuZDildukHAim6WY59MYgwDLVfNyCNMAZ5NwcrqZakaODDhkJOwOl4SIb0kX
         o65g==
X-Gm-Message-State: AOAM530V1SL42XF6AooEc4Malag753G/4d428/AMdR6Y86FGxTu7OPTG
        O8Oxi5iCpzZdsLJhgcIwh/oh6WtoRnemR7GCpiwpvQ==
X-Google-Smtp-Source: ABdhPJzNCw/cioLcKrAYx5rbKSd05oiNHfv+p2Mg5ic+HSw2d1l/HVOQ3hTWmd+vsyuosiASrLQGqbIOMPkET3fjF+c=
X-Received: by 2002:a05:6402:5189:: with SMTP id q9mr3959045edd.314.1644318575241;
 Tue, 08 Feb 2022 03:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207162637.1658677-1-conor.dooley@microchip.com> <20220207162637.1658677-6-conor.dooley@microchip.com>
In-Reply-To: <20220207162637.1658677-6-conor.dooley@microchip.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Feb 2022 12:09:24 +0100
Message-ID: <CAMRc=Mc0CYCgiGqQgmCQArv=1P0M5dxCw53H+KQ92d=yX=BY4Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
To:     conor.dooley@microchip.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-riscv@lists.infradead.org,
        bin.meng@windriver.com, Heiko Stuebner <heiko@sntech.de>,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atishp@rivosinc.com,
        Rob Herring <robh@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 7, 2022 at 5:24 PM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Looks good.

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
