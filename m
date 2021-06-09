Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30ABB3A11BE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 12:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhFIK4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 06:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbhFIK4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 06:56:45 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1208FC06175F
        for <linux-gpio@vger.kernel.org>; Wed,  9 Jun 2021 03:54:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s22so10641505ljg.5
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cvIuq7yCBZI9oh+HolFFkb/f7sv15WjrCKTD1PWydYE=;
        b=aqmTQ4Tq7tp3JhjxH4GQ9HXZVvX8RRZOYwnTZqi9FwM6DNLCDlVKbHyie15+145qBI
         o6An9yE8okaeikBuxFIdZs9p4u/S/tbNX2MTXDdDPcCd7ychrX5KlcQmqoBHvyS/8y1h
         aZa2dxXYrL9EbKPIUC/kIdVAGRkxfR4+kmzpfVgiI7rkvePdrajM08ARcHhUO88/QK2O
         hdXXraH/qgd3SkAAiB+DPV3k4t8u8A70JSZe7qkIfHciR8T1SK8BsKtLhEhUMBqVjAGZ
         G60hZjGepVKScMs3xNKpAJ8FlPOv6u3jYG45jLhhpQbOIHjrSkCsCl+mSQnRSl74lJpK
         t3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cvIuq7yCBZI9oh+HolFFkb/f7sv15WjrCKTD1PWydYE=;
        b=S1JwzUxmZltLPXGjOJf0snSj5Tak7wVIPqxjb2OH/V2ds2qjl97d0FEawbdC/dezvT
         nnHXEzW6hNV4IVdLjhw4/xUeHW/ttUW2r7TWlsVykpo6ACi6c/iAl5hzoA7PwEBMIMj5
         z+EldoxokT7Yx/oQHH7uBOsIPWNHVKmz4EuPp4DFchKw01Imigf/5qpANybvogSfzDga
         LOtrP4WFXWyGkv18YCLmvkf7Ui8ZllHLnEspUyvPBDFnxmZydCrV9+4y8Hi7iXVVrsEM
         qCh9eiA+9Q+Rly+cR2ZqSk/IPsjOqsB2k7fvo10T7JQUqJSjCQazqSxI3sBtjSH1TM/+
         6dIw==
X-Gm-Message-State: AOAM533eoGN+j/yucNtrSyK02fjTI4buaNjD3ckvgU/0Ze2mKSciZKRb
        tNhri+jwOcSul+cwvZdMPnixvO6c1UD3/++4dGqFRQ==
X-Google-Smtp-Source: ABdhPJy9jtLYPd3PIA6YsEvO5XTv5tO8NP31qTDfX0RScssCc2S2g4ub5LbPM5p6JmfTmLKacK2QOK7wOSZswNzp3KA=
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr11232132lje.438.1623236088374;
 Wed, 09 Jun 2021 03:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
In-Reply-To: <20210608102547.4880-1-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 12:54:37 +0200
Message-ID: <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASPEED sgpio driver enhancement.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 8, 2021 at 12:26 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> supports up to 80 pins.
> In the current driver design, the max number of sgpio pins is hardcoded
> in macro MAX_NR_HW_SGPIO and the value is 80.
>
> For supporting sgpio master interfaces of AST2600 SoC, the patch series
> contains the following enhancement:
> - Convert txt dt-bindings to yaml.
> - Update aspeed-g6 dtsi to support the enhanced sgpio.
> - Define max number of gpio pins in ast2600 platform data. Old chip
>   uses the original hardcoded value.
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins.
> - Support wdt reset tolerance.
> - Fix irq_chip issues which causes multiple sgpio devices use the same
>   irq_chip data.
> - Replace all of_*() APIs with device_*().
>
> Changes from v4:

v5 looks good to me!

I just need Rob's or another DT persons nod on the bindings (or timeout)
before I merge it. Poke me if nothing happens.

>   ARM: dts: aspeed-g6: Add SGPIO node.
>   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

These two need to be merged through the SoC tree, the rest I will handle.

Yours,
Linus Walleij
