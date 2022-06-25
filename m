Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B59E55AD66
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 01:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiFYXSY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jun 2022 19:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbiFYXSY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2022 19:18:24 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46971209E
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:18:22 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31772f8495fso55048647b3.4
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jun 2022 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1lEsJtkNZbW6pyj+UEBzWbQKiimWRk8J2D2WyS2PI8=;
        b=KoacatgMZZBpRCXPbvLZYAuPJOuGRaP35V6GQGHzf9ip4nu9ZN9GwQlkv3whLZ0elc
         D9kt8nEMn5EyqAgr1MgXuUXmo+Y0AC0DKSofvzMmYPR66Y2eIjJs19NYd6tlwVcdg5rB
         5IEwg8iIs1HeVvM63yEp97Oi/ceOx/401MffbkHaBjrwn1COYHG7b+eEbefwOyKep/RW
         Skt9O7k/YCCZnuZcIPuB0t3+vYCeRM00BZljm6MiALd71OaTlVSPVZAKM9A3PyWHUiae
         ibgHzU8NsukO2X+n2LiDbprvSUDbfmRciABJ1jKdCflBIdAuUOe8hunRtgUtQ8kATAHH
         80lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1lEsJtkNZbW6pyj+UEBzWbQKiimWRk8J2D2WyS2PI8=;
        b=u1cRDOQYp1Xs5qCZCrBKuyiqxOxhADSaeSO9Tkna/q+1Z3tKqeKXqnqo+dVLL8yJXy
         IdQFL8G6TjrPJfCi+UVz/kzSyVzFfwZAqzshD76Zecw0DfscV3Q1cvsozQGTbBtMLrP8
         Po0S3EYFBWdSZMnu6OGZn9ux0B4lbd9POqk3Vh5qfzvSmlbY/X11exdlmlzL4LZjQxGR
         iJywD9Frr7/D2teerHOzJVC4spVKHw6c/vIIZAaThxplHRIbwMcD1vyf3sr9ag3JvRKD
         Lc/wpWX7Sj/sYcJ4UvBwsabXmOILTL7QpAg9419IgYWCsOYkzhbirnFVi/mqRAP7ePlt
         6ndA==
X-Gm-Message-State: AJIora/h1SG++yDG9CHVMWipIV8g1eW3dAdMR47ExD0GAfpYbwkb8ZoR
        yCSPvjzHX1L0dj4Adlc/Ryrf9N2oiGpmg9zkH6HNFg==
X-Google-Smtp-Source: AGRyM1vPgaDOnRXygiHaY2iEqka3XlgQt2gTMAnBu+rU9CZe9K4dmUR22BvkxFs8sAUWLBKQ4L3Y0aeMiNfUdKfZCEk=
X-Received: by 2002:a0d:d487:0:b0:318:48dd:95b3 with SMTP id
 w129-20020a0dd487000000b0031848dd95b3mr7009019ywd.140.1656199102016; Sat, 25
 Jun 2022 16:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220625200600.7582-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220625200600.7582-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220625200600.7582-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:18:11 +0200
Message-ID: <CACRpkdbYbRnjEB+LdUGPxj1T2KbxtieGMY2uzbThD2ffY8zkJw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 25, 2022 at 10:07 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> Add IRQ domain to RZ/G2L pinctrl driver to handle GPIO interrupt.
>
> GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> used as IRQ lines at a given time. Selection of pins as IRQ lines
> is handled by IA55 (which is the IRQC block) which sits in between the
> GPIO and GIC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks OK to me, as long as I get Marc's approval I'l merge this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Maybe Marc want to apply all patches to the irqchip tree?

Yours,
Linus Walleij
