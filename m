Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1D41AB717
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 07:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405087AbgDPFJC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 01:09:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49674 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404971AbgDPFJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 01:09:01 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3E3AB8030778;
        Thu, 16 Apr 2020 05:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id surKt_FRKDek; Thu, 16 Apr 2020 08:08:48 +0300 (MSK)
Date:   Thu, 16 Apr 2020 08:09:32 +0300
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
Message-ID: <20200416050932.25qbbheg43h5ijlw@ubsrv2.baikal.int>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <CACRpkda3YpCxVii1r5F-q=b_Eh7ixbtprWykUH7xPDxPZR0gwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkda3YpCxVii1r5F-q=b_Eh7ixbtprWykUH7xPDxPZR0gwQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 11:27:49PM +0200, Linus Walleij wrote:
> I have applied the v3 version of the patch set after some tinkering
> with the b4 tool.
> 
> For some reason some patches are missing in my inbox and also
> on som mailing lists, they are not in my spamfolder even.
> 
> Anyways with some help from Konstantin I managed to get the
> series out using the b4 tool and applied it.

Thanks Linus.
Regarding missing the messages in your inbox. It's weird. I double checked.
All messages were sent to your email. Regarding missing them in the devicetree
mailing list. It's my mistake. Forgot to add it to Cc'es. Next time I'll
keep in mind that this is necessary.

Regards,
-Sergey

> 
> Thanks!
> Linus Walleij
