Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD813D5398
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhGZGbA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhGZGbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:31:00 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C026DC061757
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 00:11:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso12981046pjs.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+5p8Aei7IrZs3alqaJKEyL3k4NRbSzzZGcPcbzf/ZKM=;
        b=nsFEEqxuhHH0w55xR+qWi6/8JTZFD+CjXaMMEmRxPwhw2+t/dxlIOoeHh6BpICM3mq
         gNT4qD6yRd/mY6jEACPu0YsvzhLNNFAflHc0uWnAC/j7XT9FAhDDBCx7p9j2vtIs0vCd
         y111+bounbY/WPKSDg7zqY0suEQPOzJntP/Vsa+De7Dkj5L32jI5icyEcWzyEnJAzCq7
         aA3xdsgUDt0CbErUbVFasdkp2E1dn6c8e9+j7u0uDTyc57FJVgyU+uLeZDcPrd8Ti2RV
         /XdKYIyowWMIT/h8pOCMmIrI//hpZnh5WqTho6WOgON21kM/nrs6WNASFxgJQAX9f9zF
         DaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+5p8Aei7IrZs3alqaJKEyL3k4NRbSzzZGcPcbzf/ZKM=;
        b=IVHldB4s9OH9polQwkUeIecTFNejI9jB/fsUGM1Y5FLqn/HCijRzwaP8G6RJqhaHwk
         NQ75FqYTPV0e0PNRWRWWSt4I5yp2MneIDc/yDSIYz5gPaBR8jvU7tCIEgyYmccA16cB7
         Hu/yO0TBwB2AyReR9R4yet92v7c9uBGPjh8k9RQWeeIIPb1vJjausTESkxOyxUY6ct8O
         DDn+oLYPPasq7SjYS5Xy7hRBoj5jxpNa7ex4wXrM17Z7cWLcp/VXv4b9jqWfPl8bpb+a
         Q5OpPEbz+dxfF3rWxvaxPiORijcwuiz5Qui2XmzxZnc0Jk+rLJoWysOpywAVDsgBST2M
         RKRA==
X-Gm-Message-State: AOAM5335SeyngxFUC6o0x59OnELmpBeM+yq8evEtbiGfdxaCbzN7uQL+
        dlvA/RFKOaN44YtXT4ctXzG1Pw==
X-Google-Smtp-Source: ABdhPJz/DGTo2HlVZORTFeTFS3UbYQ8fKSzvDp+CtRgvg+g+iWcVQ+dYYlu8pI/PRW+yWU/1lhgXHg==
X-Received: by 2002:a17:90a:6482:: with SMTP id h2mr24182383pjj.24.1627283486888;
        Mon, 26 Jul 2021 00:11:26 -0700 (PDT)
Received: from x1 ([174.127.163.79])
        by smtp.gmail.com with ESMTPSA id o134sm43060098pfg.62.2021.07.26.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 00:11:26 -0700 (PDT)
Date:   Mon, 26 Jul 2021 00:11:24 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210726071124.GA9184@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 11:04:41PM +0200, Linus Walleij wrote:
> On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
> > Am 2021-07-01 02:20, schrieb Drew Fustini:
> > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > > BeagleV Starlight JH7100 board [2].
> > >
> > > [1] https://github.com/starfive-tech/beaglev_doc/
> > > [2] https://github.com/beagleboard/beaglev-starlight
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> >
> > Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> > drivers/gpio/gpio-sl28cpld.c for an example.
> 
> To me it looks just memory-mapped?
> 
> Good old gpio-mmio.c (select GPIO_GENERIC) should
> suffice I think.
> 
> Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
> of GPIO_GENERIC calling bgpio_init() in probe().

Thank you for the suggestion. However, I am not sure that will work for
this SoC.

The GPIO registers are described in section 12 of JH7100 datasheet [1]
and I don't think they fit the expectation of gpio-mmio.c because there
is a seperate register for each GPIO line for output data value and
output enable.

There are 64 output data config registers which are 4 bytes wide. There
are 64 output enable config registers which are 4 bytes wide too. Output
data and output enable registers for a given GPIO pad are contiguous.
GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.

However, GPIO input data does use just one bit for each line. GPIODIN_0
at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].

Thus the input could work with gpio-mmio but I am not sure how to
reconcile the register-per-gpio for the output value and output enable.

Is there way a way to adapt gpio-mmio for this situation?

Thanks,
Drew

[1] https://github.com/starfive-tech/beaglev_doc
