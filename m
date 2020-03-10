Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6074017ED44
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2020 01:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCJAYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 20:24:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:44402 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgCJAYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 20:24:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 87999803087C;
        Tue, 10 Mar 2020 00:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ODmLbv6xH-x5; Tue, 10 Mar 2020 03:24:48 +0300 (MSK)
Date:   Tue, 10 Mar 2020 03:23:58 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] gpio: dwapb: Fix reference clocks usage
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200310002449.87999803087C@mail.baikalelectronics.ru>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 06, 2020 at 04:24:44PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> There is no need in any fixes to have the Baikal-T1 SoC DW GPIO controllers
> supported by the kernel DW APB GPIO driver. It works for them just fine with
> no modifications. But still there is a room for optimizations there.
> 
> First of all as it tends to be traditional for all Baikal-T1 SoC related
> patchset we replaced the legacy plain text-based dt-binding file with
> yaml-based one. Baikal-T1 DW GPIO port A supports a debounce functionality,
> but in order to use it the corresponding reference clock must be enabled.
> We added support of that clock in the driver and made sure the dt-bindings
> had its declaration. In addition seeing both APB and debounce reference
> clocks are optional, we replaced the standard devm_clk_get() usage with
> the function of optional clocks acquisition.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> commit 98d54f81e36b ("Linux 5.6-rc4").
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Hoan Tran <hoan@os.amperecomputing.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (4):
>   dt-bindings: gpio: Replace DW APB GPIO legacy bindings with YAML-based
>     one
>   dt-bindings: gpio: Add DW GPIO debounce clocks bindings
>   gpio: dwapb: Use optional-clocks interface for APB ref-clocks
>   gpio: dwapb: Add debounce reference clock support
> 
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       | 140 ++++++++++++++++++
>  .../bindings/gpio/snps-dwapb-gpio.txt         |  65 --------
>  drivers/gpio/gpio-dwapb.c                     |  41 +++--
>  3 files changed, 166 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> 
> -- 
> 2.25.1
> 

Folks,

It appears our corporate email server changes the Message-Id field of 
messages passing through it. Due to that the emails threading gets to be
broken. I'll resubmit the properly structured patchset as soon as our system
administrator fixes the problem. Sorry for the inconvenience caused by it.

Regards,
-Sergey
