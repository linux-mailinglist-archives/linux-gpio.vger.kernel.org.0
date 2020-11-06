Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0662A9276
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgKFJZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgKFJZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:25:04 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C84EC0613CF;
        Fri,  6 Nov 2020 01:25:04 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id z3so773435pfz.6;
        Fri, 06 Nov 2020 01:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n6HjZO68eJwzCsb2ucSZ6B0XskEpVkwnHnaVuGbEBd8=;
        b=QuNKss5T6V8FATdlBUmjBheEfwGufC9Y1UXzYxDMTiEZvLAF7bCfcmGRDg8qSEQQel
         k3Nr9/fy6sJq5zzk3JFXFtN8YKFdHddgd5g5XTmbg820WhVQzZ/NHmxYen7Bj1sqQ8g5
         ssFqfy7JYnuSngNiv0wzXDRRDSTxa+nSRr5xt0hYxk6DA/B3MBj71YH8Bbd+aJg/0euL
         SV1IPLw3rjRdUBk49mYnCTKifNjQiTxnW+0FUgdLNwwviK5kpawTb4n1Bnvbu5Dh3oAY
         pbRRwgtwO1N16x1599ipby+zECVNEvDKnYUU4Nkp9YZyy2i8cO95DboiTrH4NWyW1+Z7
         homQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n6HjZO68eJwzCsb2ucSZ6B0XskEpVkwnHnaVuGbEBd8=;
        b=jKxFIeltJ9IVqOMroK8eYGY1iJW07/DyYS+sYDtDs4zZ6wnpmAjFBqqz70GR2JBL0g
         fe0pOp+3DehoKNTDg2qs6O3STIewfcTFkGT0GVV4Ds2F4a/bNP0AFez3CbvkaPNsJd4O
         IA2fO+fO4KnGyesm/0dQmZeBR/FRpvHy5zvTrAZHiN3eq/12FeS7YeXrMRqDL5r6G98g
         Xm1wa9awtfcDbSL4yCKikYfCJ6PYXhkqQ5rPlTHntufiZyaMP3EZn7rhdfncYigUw95t
         fS/XjSEncJokoMLUfLvuoIVeB1yAeQ3WVz9Or9RVIH5L2mlPcXICP5rE1s+TXMqPkdGL
         gnow==
X-Gm-Message-State: AOAM532R82Qa4ooOnevGJKnAyM2uzIlZNPDczVHjGBDabcIBBdyMo/j3
        PdH/W+h1flEUYwy7GCNnStcJtG11zgTZwrl7hQgwQ29fUQM=
X-Google-Smtp-Source: ABdhPJwFBbWhc/ajqSlGOcas2h9EZH9QHYpwErKY1RO0qZxDIbkxawo5JL2nnS7meQZOjB9qgm3lQKPxILJL90d9kUw=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr1037118pfd.7.1604654703797; Fri, 06 Nov
 2020 01:25:03 -0800 (PST)
MIME-Version: 1.0
References: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
In-Reply-To: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 Nov 2020 11:24:47 +0200
Message-ID: <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device
 tree data
To:     Greentime Hu <greentime.hu@sifive.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 4:59 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.

...

> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);

> +       *parent = d->hwirq;

There is an API to get hwirq.

...

> +       for (i = 0; i < ngpio; i++)
> +               chip->irq_number[i] = irq_of_parse_and_map(node, i);

Can't you use platform_get_irq_optional()?



-- 
With Best Regards,
Andy Shevchenko
