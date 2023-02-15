Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411486979A8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 11:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbjBOKSU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 05:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjBOKST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 05:18:19 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5EF32CF3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 02:18:18 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-52f0001ff8eso157542377b3.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 02:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJBqbA9/1u4A8sVO/Zk715/WabHxkSgMgrFN8Htu8mM=;
        b=WjVP6zmwugQ9MOW+plHy2OjEWtkW2pV2E+kvSjcZJCrqafoEfoyABgBc+weMQiblln
         QcXbBOqxbdSwv3ilQ5OpUKg0rJzIgO6XAQvJyO6dLRlWryae9iOsJ3ABu8Ry+1lOHF9i
         T41AcZ5jOPQkdbEMmdtqZ+BBsH1OJ7n7Rw86CUXbzH8cTVvlTmRQxVqan/zhhKANDUCa
         sIdHLC3ZqvYPG8OnsTAq/4EAyIRe6P0yftBIO+wN9HwyrR9pDtxBy21Br/JS7oh4EHJS
         RvgTIzjdqm4RmgLj44l81AJOch3tI2ublUs8ZAii9AYsKpagh59sDrsaGrCY6QciAxFt
         eUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJBqbA9/1u4A8sVO/Zk715/WabHxkSgMgrFN8Htu8mM=;
        b=0VW1yw+2oawCobGRMXTsjUv3Wk3g4cJwf61FPCY/5PMNm6oFIhFlhG0s3sDOsOYJgR
         YpyGsR8zZqh5Gd4praDVmkXFM66mg0exYDsOVLBIUp97Yp0Qi3hO9IGpRM2bkZmhGMZ5
         zNKp3ZSiViX5HE47qj9JB+oS4xVcUj5wYvpif+TiNe+VR+82k/un0cqH/WM4tBIP0esc
         seM31eNAHwpNWfeMHlmoVEDlCiwN/ojwR6XeW0xn+5adTEddrNmMCHVPzbG/toNXJuyv
         haKAke3GTYxLpU5bRiWapFZsmlYTeBvv4FWyUDS/CqCBhDENGK5ut7YjqE5uT2dJJAmF
         0jAA==
X-Gm-Message-State: AO0yUKW4407AlxfL7roih5716OFJgDNjZXUsHaJFAVch+rfSAmAjk3eX
        TphpjxLucxd3llC40QLmtgcW94TAelTvbhYroFUw3w==
X-Google-Smtp-Source: AK7set8Q/ML7FJWquz6rdA8/0zq+ibw2pjtN5ZL0/QIoHuOAFcnJNcM/tya+FKCufMOb71pOTFpIBgNnjAROFWgeOO8=
X-Received: by 2002:a5b:c3:0:b0:83a:dd71:5b70 with SMTP id d3-20020a5b00c3000000b0083add715b70mr242086ybp.35.1676456298013;
 Wed, 15 Feb 2023 02:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20230214073638.571417-1-alexander.stein@ew.tq-group.com> <Y+tn3Y+SraIetn5X@surfacebook>
In-Reply-To: <Y+tn3Y+SraIetn5X@surfacebook>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Feb 2023 11:18:06 +0100
Message-ID: <CACRpkdYHJOgO9K_H9QA1_VWgParbh+Xqh-oCmo3JAFtaMXYByg@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: vf610: make irq_chip immutable
To:     andy.shevchenko@gmail.com
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 14, 2023 at 11:52 AM <andy.shevchenko@gmail.com> wrote:
> Tue, Feb 14, 2023 at 08:36:38AM +0100, Alexander Stein kirjoitti:
> > Since recently, the kernel is nagging about mutable irq_chips:
> >
> >     "not an immutable chip, please consider fixing it!"
> >
> > Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> > helper functions and call the appropriate gpiolib functions.
>
> ...
>
> > The overall changes are based on commit f1138dacb7ff
> > ("gpio: sch: make irq_chip immutable")
>
> Nice, but you forgot one crucial detail. You need to mark GPIO resuested
> whenever it's locked as IRQ and otherwise when unlocked.

+static const struct irq_chip vf610_irqchip = {
(...)
+       GPIOCHIP_IRQ_RESOURCE_HELPERS,

That's what this macro does ;)

Yours,
Linus Walleij
