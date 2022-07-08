Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECC456BDC9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238640AbiGHPvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238151AbiGHPvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:51:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC5167593
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 08:51:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h23so38335753ejj.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6xprDpcoZOGJDj+kaMmTTKPyjy0F33A9f2Olt1+Xws=;
        b=v9hyV+haJfHpcHdA8b+dErnqxVGVjmEgLJE/af5R8VMDAXP8sPp5Yp3p8IU4Jo+7Rt
         nHR5lgvsPZ1nT+wkRwW7EojB+UukkdYqKqq54JELDI3vgTB/XKQF2ELOYcWWq8DBcqzl
         OpizpvkE+T159NNENJqqYY4LGqn2if7Pt9S99IDEjJLgU8RPbijnPJBgiwZSIakZvNfW
         /nPfwi+XNCCAsThBbL/NemE2egw5L7mJkdZ9HPuHqczDoZfFFLnDfgYGCEin73g2K/BC
         wU1UgqieyoWYiV5GD7WN/5M+Q3wIJcUwTOIFzWZjhvtPUvZ9XmSTwUaY8Yj/Y3x09NaG
         /KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6xprDpcoZOGJDj+kaMmTTKPyjy0F33A9f2Olt1+Xws=;
        b=Ezrx6S060lrpoaC9JhIx2NcFW5exqn0FC0zLXCSJIqc9Z0lwfhmAy/z588TtC6IIs5
         kchowyIaI/wCkz3k51jSeTsWTKuRfpY+6dgkRGs+uXrZqzRiCgvAelXczFc8O7YKA8cX
         Ix9nWDEj8kODwK2JI9wp16OTUXCMcV5ePeH0Vd/X5d2rhvldKyaI+bg442k6hQfkP2O9
         7uwdDgsvVolvhAC1YdOCoWcvvS2q3VhE87n8Lnsi6spVHp/cT8CVMo7eZgNDeef+mJae
         PwZwbVxQiPfNogGxJ34LiTN2E6VfsrlnINibmhlxrw8Iyy8mVWOIcalFWcUCGZaIfMBd
         p78A==
X-Gm-Message-State: AJIora+KXGn24zArMPxofEARTu2Nn1kT0rU6ZlEnFLcXrXs7EMYPyZ0m
        YwSrz//0gQi31bCilFhYQbKSo3fj6nZfWf0L2spgdA==
X-Google-Smtp-Source: AGRyM1su54Ku1qAjLu703d2IlpS702M7iuveg+SxBer7m6gSk7OkVFUZS1QfaeXnF5yXi0HSRKfz2jppaC02eDxApTw=
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr4152727ejc.736.1657295510287; Fri, 08
 Jul 2022 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220707182314.66610-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220707182314.66610-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220707182314.66610-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 17:51:39 +0200
Message-ID: <CAMRc=McXyNk8r0bhAVKWY71+zXjDB-5wD4sx7pXjiBkLutsb8Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] gpio: Remove dynamic allocation from populate_parent_alloc_arg()
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Thu, Jul 7, 2022 at 8:24 PM <prabhakar.csengg@gmail.com> wrote:
>
> From: Marc Zyngier <maz@kernel.org>
>
> The gpiolib is unique in the way it uses intermediate fwspecs
> when feeding an interrupt specifier to the parent domain, as it
> relies on the populate_parent_alloc_arg() callback to perform
> a dynamic allocation.
>
> This is pretty inefficient (we free the structure almost immediately),
> and the only reason this isn't a stack allocation is that our
> ThunderX friend uses MSIs rather than a FW-constructed structure.
>
> Let's solve it by providing a new type composed of the union
> of a struct irq_fwspec and a msi_info_t, which satisfies both
> requirements. This allows us to use a stack allocation, and we
> can move the handful of users to this new scheme.
>
> Also perform some additional cleanup, such as getting rid of the
> stub versions of the irq_domain_translate_*cell helpers, which
> are never used when CONFIG_IRQ_DOMAIN_HIERARCHY isn't selected.
>
> Tested on a Tegra186.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Romain Perier <romain.perier@gmail.com>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Robert Richter <rric@kernel.org>
> Cc: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
