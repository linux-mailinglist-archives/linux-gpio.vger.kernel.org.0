Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC44184AC0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 16:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCMPaU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 11:30:20 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33058 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMPaU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 11:30:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0303280307C4;
        Fri, 13 Mar 2020 15:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zabMnJuGEewt; Fri, 13 Mar 2020 18:30:16 +0300 (MSK)
Date:   Fri, 13 Mar 2020 18:29:28 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] gpio: dwapb: Fix reference clocks usage
Message-ID: <20200313152928.54lk2wi42auh2nat@ubsrv2.baikal.int>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <CACRpkdbq9aTkf6-DctXKabyd2=Rr8GPii02_8jQP49SFuTo_SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdbq9aTkf6-DctXKabyd2=Rr8GPii02_8jQP49SFuTo_SQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 12, 2020 at 02:58:33PM +0100, Linus Walleij wrote:
> On Fri, Mar 6, 2020 at 2:25 PM <Sergey.Semin@baikalelectronics.ru> wrote:
> 
> > From: Serge Semin <fancer.lancer@gmail.com>
> >
> > There is no need in any fixes to have the Baikal-T1 SoC DW GPIO controllers
> > supported by the kernel DW APB GPIO driver. It works for them just fine with
> > no modifications. But still there is a room for optimizations there.
> >
> > First of all as it tends to be traditional for all Baikal-T1 SoC related
> > patchset we replaced the legacy plain text-based dt-binding file with
> > yaml-based one. Baikal-T1 DW GPIO port A supports a debounce functionality,
> > but in order to use it the corresponding reference clock must be enabled.
> > We added support of that clock in the driver and made sure the dt-bindings
> > had its declaration. In addition seeing both APB and debounce reference
> > clocks are optional, we replaced the standard devm_clk_get() usage with
> > the function of optional clocks acquisition.
> >
> > This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> > commit 98d54f81e36b ("Linux 5.6-rc4").
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> > Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> > Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> > Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> > Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Hoan Tran <hoan@os.amperecomputing.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> 
> I like these patches, once Rob is happy with the bindings I'll be
> happy to merge them. I haven't heard from Hoan Tran in a while,
> so if we don't hear from him this time either I would suggest you
> also add yourself as maintainer for this driver, if you don't mind.
> 
> Thanks,
> Linus Walleij

Hello Linus,
Thanks for positive response. I'll resend the patchset soon in the
email-threaded form together with two extra patches, which will
add me to the MAINTAINERS list and to the dt-schema of the driver.
If Hoan Tran will show up before you merge them, just drop these two
new patches.

Regards,
-Sergey

