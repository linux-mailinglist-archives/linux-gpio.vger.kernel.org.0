Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2D48FC81
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 13:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbiAPMHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 07:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiAPMHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 07:07:46 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC183C06161C
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:07:46 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id y14so19395956oia.9
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNXnIX6RDJdtlZPD9+1UW8TCX7PYSU+tj75Zl+vyUO4=;
        b=DBLiHXCLxN1uq/uKSNR3y1nJSqPKpE2i5uNfleicUU8F6GQf1QGbCLk2W/wMZvLUB8
         I1UevA001hhXsayZHUXVT4z6jlO5ULWJEAZZmFF9nZYl9kQll4hNM0x8AXMEIeevPrm1
         KEmYUFirkHg2Toi5bBoqpqzOBVMAOS2DPQQryXOgsZcVf39BSx4hZvi+Ue8wWfPTwcES
         vgjyLjCVSxXj19NrwR8SviXhlP/el7rDt5QLZIOJ+v5PlqbCFfYD+6y5Ptu8KwIwgVbE
         YCjXzDNpEP/N8iSM0nGIMSFZrPfA31Gkpg9ZjThATQ6LQ2kz5pxUTtxFt4H16b3HtpST
         Pvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNXnIX6RDJdtlZPD9+1UW8TCX7PYSU+tj75Zl+vyUO4=;
        b=aE6aUvcmt5ZnCkiXiacrGjxN00PdWMaDz6P/y54oT5yDJ/oha84ogUlkP4yq24JMO3
         hBWIGQFGNOCjpKYK4VVyJDBKTG1cDwsKaM8gr7OmvuTGCoZaKegCKyxp2e5W8RX/Ei3I
         ofbppL5ZeXbgLx0Izwx4CwtvxHbAsfT10vpmhJyF/tmJOVIY0wir/NK1To4GVRcRuGZa
         2P0IB02k1KB/BFq5S51Z77rEip8UwdmaksR1m+gFLUiMWb+QDSFkY6W64o5o1fgiVqmz
         tFET75RKuNJyBaasFRdPLkGwsD5qEwpHOkGJDDBNlzktFBNOoovy+JINUM90BC3u++4h
         8Dfg==
X-Gm-Message-State: AOAM531+Rt2M7IuRJkKPy1j767to3p1KBQYhbKjFbj1VP4J0Em6/lFxK
        XYFd6v6wNGIzH1NsdTVb6j3rubzi2A2tt6DP+s8Bvg==
X-Google-Smtp-Source: ABdhPJz3c7i1nWVvOnru4irBp0CN9UCIjC4v/gQ2WmRYxXxAzL7nI+jCT0NKiIxoq70CnTa+JgsYI6a/CP+caVcn7fg=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr9512934oiw.132.1642334866142;
 Sun, 16 Jan 2022 04:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20220114065125.21208-1-linmq006@gmail.com>
In-Reply-To: <20220114065125.21208-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 13:07:34 +0100
Message-ID: <CACRpkdYSmgziDQuMU7McW2QQ_M7S16gPb6TgzRX2UkNzt2QdaA@mail.gmail.com>
Subject: Re: [PATCH] gpio: idt3243x: Fix IRQ check in idt_gpio_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 7:51 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
