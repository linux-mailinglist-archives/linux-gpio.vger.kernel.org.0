Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0FA64B27B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 10:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbiLMJg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 04:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234956AbiLMJgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 04:36:37 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81270DEEC
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:36:36 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id b16so16980711yba.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hd26A52tCpr/TZckO2AVYLVhE5lfnmKa/PoDrSKaIA=;
        b=G3H1wlAZpdpmQYEieqdVuJKIsOzW5NXXiQInR7B8S9KT3ra2veBRSQ/BqZ5EWCjQqs
         qYKAfPqCdD3slKR8pI+qp+du4ChkVYmD3V8WcqYibXxIjPCiBekfspJkhEAVlP3OczhF
         HDS6JM968T9/yi1meoD9tZaH2RtYsxwA7eocXUdrhSNLmiNDC4boRIpo1rv3SPqy4+Q+
         KcgVKC78qG9irgH4Q1aashBRhUUBRhn9pXpf3FgxB3Oru21hgDkIxo8IKywySuk23/xH
         u0GehlP7GwmfIXOGXG8SISBiNcf6tIA4LMTXganXiVNdWS01R/7rwXbiJwPuaGt7qlSf
         j6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Hd26A52tCpr/TZckO2AVYLVhE5lfnmKa/PoDrSKaIA=;
        b=5O6TuPwbO/VXKaiJvf3pgOE2vsXE6L9zcrHSSqBbfdC1oSSbcb0Mu9hwtfz+XAxlaL
         WdRYor1FiPxuX30gAKTsX7rG80ztfoIdksGIB9xg0NCEjjp1fD5A0TK47lhATQ8FlTlO
         bA1Kr4GszdheYcYJ29/ULis1pIDXfZjTbixfzsiWZBQmgXQxJrsdW+rsIuwIkvlGFuWE
         t3qxKwWkV7+d+BsQFUMiqKYx4eGTjnYEzH4hYD/KUje6syL4vxxr51E5IoDg7mi/bALo
         qUvS+1cEHMiOkyRg7ICLeFLdmjCkHu+Awf5wbnWdeplG6+4MwqVeJTBvZtyWkJ5zPZk3
         8bwA==
X-Gm-Message-State: ANoB5pn4dbBx1yCps+7uZm3WKGUMPNEnvLVKfq41FtVSGJ3TK+OKWh+V
        UEglLOTYVH6vn0pSH0RHXbVRS9dC1jz8gGl4V8zVxQ==
X-Google-Smtp-Source: AA0mqf7nZkHxiu+fKuIysqXHZF7UfBmLi0ZBnxPGnQLtOGWmyCu8e8cxfKokNJEIdxwKsyPc4kMyW8JbkbnRGby4zNA=
X-Received: by 2002:a25:d2ce:0:b0:710:f2e2:eb92 with SMTP id
 j197-20020a25d2ce000000b00710f2e2eb92mr2950219ybg.304.1670924195683; Tue, 13
 Dec 2022 01:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20221121123803.3786-1-zhuyinbo@loongson.cn> <20221121123803.3786-2-zhuyinbo@loongson.cn>
 <CACRpkda1adiNwbTZHdAyHKny3r5FFMP_XXVGbo1vnCdw9U1gNg@mail.gmail.com>
 <8a7abd77-9540-efa8-6f67-908530e85399@loongson.cn> <CACRpkdb=wdydOYCcrpjLSyvfVO--_ezXsFQ46qwfVCiiTd5fNw@mail.gmail.com>
 <4c02570e-03d5-85f1-73fb-b66d6170c875@loongson.cn> <CACRpkdbgP9m40t_Ky4H+SQi9TELikomT2M-JpF7+auKmzOxQdg@mail.gmail.com>
 <ce858832-c052-1797-ffeb-2dbe654cbdd1@loongson.cn>
In-Reply-To: <ce858832-c052-1797-ffeb-2dbe654cbdd1@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Dec 2022 10:36:24 +0100
Message-ID: <CACRpkda0VerZhVGMJJjMYyAWdobvSLj4=eWxBjh+5ubmxvFcjQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 9:13 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> mask_irq/unmask_irq/irq_ack/ function always be called by
> handle_level_irq/handle_edge_irq in current irq domain. and the
> handle_level_irq/handle_edge_irq will be called  by handle_irq_desc that
> ask know which irq is.
>
> when a peripheral need to use a gpio irq that gpio irq driver need know
> irq status and call irq desc->irq_handler.
>
> so I don't got it about which case it is unnecessary to know which irq.

Sorry I don't understand what you are asking, can you elaborate?

Do you mean that you don't know which driver will not call ->to_irq()
on the gpiochip? That would be any driver that takes an IRQ directly in
the device tree:

gpio: gpio {
    interrupt-controller;
    #interrupt-cells = <2>;
    ....
};

device {
    interrupts = <&gpio 14 IRQ_TYPE_LEVEL_HIGH>;
    ....
};

This case will only call the irqchip callbacks and will never call
the .to_irq() on the gpio_chip.

> > You find an example of a hierarchical GPIO irqchip using the
> > GPIOLIB_IRQCHIP in drivers/gpio/gpio-ixp4xx.c.
>
> Loongson-2 gpio irq hardware only a enable register, and when a gpio irq
> happen, then will has a such flow:  "cpuintc -> liointc -> gpioinc ->
> generic_handle_domain_irq -> handle_level_irq ->
> peripheral-action(action->handler)"
>
> generic_handle_domain_irq need rely on specific hwirq that ask gpio irq
> hardware has a status register but Loongson-2 gpio irq hardware doesn't
> have it.
>
> so I still think it wasn't appropriate that for loongson-2 gpio driver
> add a irq chip.

generic_handle_domain_irq() is of no concern, what matters is if
your interrupt is hierarchical or not, the callback in the GPIO chip
can be a simple remapping of the numberspace followed by
a call to the parent callbacks.

Yours,
Linus Walleij
