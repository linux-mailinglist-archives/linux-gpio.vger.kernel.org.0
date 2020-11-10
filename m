Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BE42AD8F5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbgKJOkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbgKJOkK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:40:10 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6181CC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:40:10 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l2so17906266lfk.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
        b=yMvmv62jzEb5fWYRyJZ4EfNvXQWxI0M2a6MD6A14Kx2zX0+pJwr0BFTgurkn/NFcYN
         SEuffXDjbLtIeQtWDaXAhzdEJoRKIeHAT5dvDEySvCGFrvh9bPI0L3QFezJRcPZWqkwR
         FIQqy4YacfO3Oj7lxlpiIQnlZ4lyLWMQFP58iJL3VeCk2S/Z0o+9+n36DPvrUm3djefP
         Nf8fsoRkRTr406syuJyIdGYjtpWJFYIFc/AlaHKP8gv0mbHpRynDsz7F35XR6HyAaEkO
         LEgu4epTlp38o7p3nKYvORMzrP2I8j9HTmYhHZ1PbN3l0woZQdGi2pyG9yox7ZCDvkr+
         JmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMIR0x3v/SOduiNJI+iAqXslKNdg1Phd+avxtEvAmZ0=;
        b=XGf17b6S0bP68u3lnQBs7M5X8vW1hxArxwONwrI6cWECJT1nuRovcbrHnBZN4l/8Ik
         OGBW9OWZHg6VLDXdkTGVA5GAPtu+vKRCaP5tUqVj18aEKivcHAQw/e3Cxnc0sOQZIPRB
         J95VPEKrUwqKGuLMcKzmnUe9t44HsQn07+fXqs5dTLvjyzgq9zeDU8ojHmf1hbti5h2y
         DFjSYhkK0j+B4AEP4+sz9PNpHjIpX5Tb5ykB8Q27jzfzxjhzMlCWnV0n/lA8GcZ96DNP
         U5p78cCAiBQ1jhL+dbd4qUb01H3nvSpFi+kx+DTM5kZwJpTHOUi3p8Q9oECN66IZV4Qj
         WK1g==
X-Gm-Message-State: AOAM5337iuWMSH+0E3E8h9d21d/0NUeUkeX6wpHRNawq3tXdMz1HSk7x
        Ul5ktYDisdU/ktypkmAWAMzuzrY3vue6+PrPBsDeGA==
X-Google-Smtp-Source: ABdhPJwZKZCcPYORmeuUmPxVdMBipXbwsghexY2Fo6mTCT8Nwc9BfXeRqZ9vpij7/rcd11cpqaaXACeFiLO1OmB0y3k=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4591668lfg.571.1605019208781;
 Tue, 10 Nov 2020 06:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-10-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-10-damien.lemoal@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:39:57 +0100
Message-ID: <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 7, 2020 at 9:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Fix the check on the number of IRQs to allow up to the maximum (32)
> instead of only the maximum minus one.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

I just ripped this patch out of your patch set and applied it to
the GPIO tree with some minor change to the subject.

Yours,
Linus Walleij
