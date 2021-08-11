Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31C93E9031
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbhHKMLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbhHKMLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:11:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938B1C0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:10:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z20so5268100lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBczuHX+1v4RsAOc2qbNNm3ZUF53aZdkil8sTejujeA=;
        b=kGZfn94t2QYH8Q6jbR2mv4bDU86CK5aMCFcJTprdhQ7LTcjy0AGpFDuPfdGJsGdN/U
         NJIzHe7EIeUXNf0Ok0IfEDnHfdSoLKbDM4Qhw8ooyyWPSwkCMQfFlma2PGj/S0Elw/jd
         KbyjiFearaL6pO3QTLcmOwC4hTuhQL5uM80DfzmZAD2TuN2hAw9lqsYvx4Vd2IhUdooe
         DbXkbTsmF3ifT2lB33+NHruWXaSSX+RnErO+VfOGKmqgoA9WS8GrfJ4IA7N0mHWAXW+3
         GgD3HCPy+Vez4uJCVL4YKAyUKJj5oLD8eqI+wp95E2ssOzdqg0VhbBwCiWXII4hCzIYR
         58DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBczuHX+1v4RsAOc2qbNNm3ZUF53aZdkil8sTejujeA=;
        b=Nb+7oZf7rqGLAi/sdKR9Hc3IiuOcabNevQPkxeoN79pkRNVAAjfZy0T0RXMGlfUllG
         1xkwmYgBCPCZuhJdYfB3yGTE9sT6nGnwHT151ulJ4nRFxcKq6N5UIkR5tJnVACu3efW8
         kRYZcLn9U2BC3ssY0j32DAG74fSVGGQYN+93pWYnzBflqdQkQT41z+rSrdCGxIUAlgTK
         BgvDLVZoZ4IGd8Jy5qdV2v7PBTWc+DakF2h2WqDBMBtinYfmS66CVbO9HVdP9nCmi+fy
         fMn8eXQVzliS0eE5CGdhJCLpUfzBE28DLkCsixdLNa+WfLU9lHYJgLX4F9diQ0CgM0P1
         GCIQ==
X-Gm-Message-State: AOAM531UnXQA+EAH3d4a3YgOgqvz4enzWpUWTmowmgWzv3/pI7xyVWWD
        v3UBkuiWj8VZSdi2dNprIhQwRHNlNBBzpo+8SxTAog==
X-Google-Smtp-Source: ABdhPJwwrj9PJmBaA8K2+6DSS48GN5f7YzmPXv/NK8VjseBpLrkHE7CMNRz/lOmkeBhanSaQZ+TO0c3EbNLRLuUHpPw=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr24694863lfu.291.1628683842796;
 Wed, 11 Aug 2021 05:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:10:32 +0200
Message-ID: <CACRpkdaMmGCwmA6j0CvJUX3S6cthoeqWRmY1RssSTmSKukwHkg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: interrupt-controller: Add Renesas
 RZ/G2L Interrupt Controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 3, 2021 at 7:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> +description: |
> +  The RZ/G2L Interrupt Controller is a front-end for the GIC found on Renesas RZ/G2L SoC's
> +    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts,
> +    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts,
> +    - NMI edge select.

Not that we don't have weird documentation but what on earth is an
"NMI edge"???

I know about rising and falling edges, and I know about non-maskable
interrupts. But NMI edge? Maybe expand this to explain what it is?

Yours,
Linus Walleij
