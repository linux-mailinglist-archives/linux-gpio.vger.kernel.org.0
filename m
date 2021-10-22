Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AF5437813
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhJVNjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhJVNjE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:39:04 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5FFC061764;
        Fri, 22 Oct 2021 06:36:46 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id e19so3227197edy.0;
        Fri, 22 Oct 2021 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3VqjR5oI/ait3rohMOusYdeugPboOfYtc3O9o05eMHQ=;
        b=Q1yRtDerJPfkd6V6vThQqZzlZX02K8g1faPyh5JvGtWbxyqlvyJdVLUGTYwPQ3saLq
         //fIB06jwTGHRGxKPLs8MJWyLB830xmXmsTkCETeG1taPcahOXie4rvc7CK5zltFt8oF
         oPUshuRuTnd0iZXy0ny9kVNx8mrm1ouS31YXXV69DYolYaT48xWqECVE7DhkqpFj8Azm
         VWMFDlsZTra/bzin+kya2NessF7ZGFHODA9zaBsoaYq5uCJaZikR/QWJcRu4iqFGwBxl
         7SUxGngqa3kITyZSSsSKeCn5rbO8WWtCwQv7XozRKVi8eu+fjf3xq7bGmV9vMO/W2GeJ
         DmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VqjR5oI/ait3rohMOusYdeugPboOfYtc3O9o05eMHQ=;
        b=LA0O2ritGvHs42KGT2DfYX62qe8ITDzUTgz14pdTQ+Ni3AIMsYNJcA40Pn5JOabVnK
         87brKmiOojCeim57Kn+uUWiTdUQnb34hf6CvomFeL2qRkZNdOscWyHoWxwyhS4c1uOP7
         MxqPczorrJT46LtNePqqPBjn3DAXg5Ndoj4hDx3IL3vLEiDlMTjdH+wWgm0dvaXKyRZU
         SrTMT8KhUlbWi2Y924iVUpBeTIxEHzHvo7/VYtS5qeJE+ESnIMVmumuODQoLDmuMSNLG
         VSvoygyK/RZYigSjMDhGQYmou2BW9i+PGOU5O6Ln+bmTE/I8mB5ys7gTCpfZq21XSFMq
         3GHA==
X-Gm-Message-State: AOAM5318jS0lKWZF04wL+wimiEv+AuQOU5uWYs63r2B+KakiCXel7Ruh
        yyGYxtyrdky1OwUpy6cALAS+zFqZ/EFuSTLHAyU=
X-Google-Smtp-Source: ABdhPJxTUPfm1rVOGx8gokzVv5igP9B4UGk9EquAWiBprb/AKADuLLwJMD4BsQNPgSHNpLkA0ym/zi0SHdqrUZTvc64=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr14903725ejc.128.1634909805119;
 Fri, 22 Oct 2021 06:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com> <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
In-Reply-To: <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 16:35:49 +0300
Message-ID: <CAHp75VfjmYONiuaQMybCvnfswZKvwBVAXH+sFirOoOb9YEzYHg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 4:13 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 14:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> Hmm.. this function doesn't return int, but struct clk_hw *, hence the ERR_PTR.

Ah, indeed, sorry. Got your point.

Of course one may try 'return ERR_PTR(dev_err_probe())', but this looks ugly.

-- 
With Best Regards,
Andy Shevchenko
