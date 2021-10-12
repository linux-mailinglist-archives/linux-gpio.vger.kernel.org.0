Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E772442A821
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbhJLPX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234023AbhJLPX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 11:23:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F9FC061570;
        Tue, 12 Oct 2021 08:21:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ec8so983514edb.6;
        Tue, 12 Oct 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fgwbge5K1EzbR8VI8a8H+Le1NZKMMr2m8pTON2xUTN8=;
        b=QzV9YbjGsg5t2ZQdqkJweilCwjmv4f72WtizTfjRD1Z69nHKwlfIiVk9MKiRlbEJ3M
         TIHpw/FxnC/HP+5SA6hgP4KYPicWuytgbi9wK8eIt5nmUVSYpScMPgY+o8EiY28/GHw6
         N0FLqSe4XHbska7BuYvfFGFuLxwQ5ehC37hDLaiWT7iLXWenpcMsDHXEpDwkNw1UoluY
         bChBoNeZU/DB1fJvp9iHrNPflFh88J+rkZLx20pNvxo6J434CKGA8xip4fm0zZb645PF
         duqJZMT7VmJha6C2jowMLglzgpTLnF6hzYtGuX12RQEr/03u8EZDNEWZlzQ1sAhaIRMH
         /WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fgwbge5K1EzbR8VI8a8H+Le1NZKMMr2m8pTON2xUTN8=;
        b=ql1gq/UdrhrACr1IUteuY3VLxmplPBKQ6W7wz143v3hFtUUgBWkbuSema1UN+kB2z8
         9cMdMtVaY+51VAKEwezmdPOUJNj4NOfNFMf8uZbkGNQCfExrOT4ixrcGJ+dTvTHhcJQM
         9BkN350mNRCoxEUb/djSlFesBebCPTC6G3U4+fc6mZyiKh2SsJoZkmAiTIbhxs0dikvM
         beEOWlSnQbF1yuy1yxuzVufAQokh5w0T74y3CJd7gDkdJNk0JMfsvYCBAU6EU8/eA+85
         1F90qZXadAFWvqcu8fmo8u9j63G+jzyqjuTuEBVoRrTpoxotqfRkQpqeZsWuh9Tzflvg
         LTJg==
X-Gm-Message-State: AOAM531n9Uv/bkapCZM1Qbs63HCg+3bBi0KS461YQ4gFar2YNvVB9Ngw
        bYF+dIkplp0xmVwu3Xh+vj/m37h9QTcOkZWXwroB+vtnfwMhSQ==
X-Google-Smtp-Source: ABdhPJyH2Cr0E/CmRn2fpGIMT6foljvhODeW0WmDCNiwPWy1V5M7oQBd/zsMp/jE5RFRB/+ZUOCr7c7fggDU4sXQp/0=
X-Received: by 2002:a05:6402:143b:: with SMTP id c27mr606000edx.224.1634052084925;
 Tue, 12 Oct 2021 08:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-2-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-2-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 Oct 2021 21:20:37 +0300
Message-ID: <CAHp75VcCCxPmnzoE5PSxtODdguoKa7VA1r2yrJRLQ=gOAevu2Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] RISC-V: Add StarFive SoC Kconfig option
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs.

...

> +       select SERIAL_8250_DW

Is it critical for boot? Why?

-- 
With Best Regards,
Andy Shevchenko
