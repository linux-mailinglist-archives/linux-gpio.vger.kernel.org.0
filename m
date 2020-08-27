Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AFB2540F1
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgH0IeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgH0IeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:34:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16425C06121B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:34:13 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f26so5447801ljc.8
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IVXJtBnlq4f+oi1C+LRjN7t2FITJvG/QxPzZBfVFMC0=;
        b=wPhEtjhjJPq4O2MS0GsFTGAFA8KQNoAwS9zSpIQt5Bb0KvihNOrBw8hy5K1kA4k/Xb
         av26xBzzN30E5OplMzhE0l4pt5G1Yu9EoaMOZQ/X6OHxmf1IjMw1hH/5+UHwpLcSsydK
         sG4p4Gsj+zGOveSXX6pR1yFsLoTqsxz6UyJ+Yz+pA0WETTh93UenltoQ+rOwuefP8Ijv
         JNrrwRtFlfR7Dnh5mjTGUFv/RQ6Xue8cBTjh0VZblam3402C3Ex7B5e7s8LhcLbS3/hL
         1It6f047goH80p/PINGVK5pI6MXiBHioLJIOHCY59/8kU9gyCWnSXysMZBq/raX1ethZ
         EXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVXJtBnlq4f+oi1C+LRjN7t2FITJvG/QxPzZBfVFMC0=;
        b=nmdTXIbYD3f3nSPylrNpXOo0fmKbmljRgy2jExuwzZ3oRx27gYjf6CuwD3+7Y7VHDS
         nRz1NFeP+nqEh2nxLVVmQvW7Ya2lHhC2PFsX0m7U1vOPEmUpb2oGNiX/ZDvgkn3GTN4c
         Bep67s1qyLObEkUdZb6ar/xKJ+ePrMD3Uhi76wtEREOK/JkcQBwkZVWJTwq/efFgtG/8
         dp9LDI29G7szoIfugUOCcV8h35q1J9fpWFVOwkvWyXiCgY1tomnueDZ7PhArARC6fv8h
         Zpi/wl5UOpOYQUvYk6OoZlhDM4rrn3TZc8wp93KQ33sps9WUiypH1gn9I7SkLzXdesoW
         /+oQ==
X-Gm-Message-State: AOAM533ZY6+xkDStJIq9sc1ufsJ2u2EgB4z65h00iYd2sV17YEiCHbba
        lwYzakxu0AAT0c1ehol+nw7uOFGskyyQEULP45uBkV4t0Ok=
X-Google-Smtp-Source: ABdhPJxiZEt8ym49Kerv5QJe7yLxzNhaO9niJClhqyqXzkuNFIDTBDJMCL1u/6yeXUawHLNQday421PVg4TGsw6c8b0=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr9505001ljb.283.1598517251455;
 Thu, 27 Aug 2020 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:34:00 +0200
Message-ID: <CACRpkdbMLEoeuyBe9h2DPKDzL8YKYbp-8r_NO1fFE5cvZjomHw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: dwapb: Refactor GPIO resources initialization
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 5:28 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:

> This series is about the DW APB GPIO device initialization procedure
> cleaning up. First of all it has been discovered that having a
> vendor-specific "snps,nr-gpios" property isn't only redundant but also
> might be dangerous (see the commit log for details). Instead we suggest to
> use the generic "ngpios" property to define a number of GPIOs each DW APB
> GPIO controller port supports. Secondly seeing a tendency of the other
> GPIO drivers getting converted to using the GPIO-lib-based IRQ-chip
> interface this series provides a patch, which replaces the DW APB GPIO
> driver Generic IRQ-chip implementation with the GPIO-lib IRQ-chip one.
> Finally the DW APB GPIO device probe procedure is simplified by
> converting the code to be using the device managed resources for the
> reference clocks initialization, reset control assertion/de-assertion
> and GPIO-chip registration.
>
> Some additional cleanups like replacing a number of GPIOs literal with a
> corresponding macro and grouping the IRQ handlers up in a single place of
> the driver are also introduced in this patchset.

Sorry for the delay. Merge window and stress.

All 10 patches applied for v5.10!

Yours,
Linus Walleij
