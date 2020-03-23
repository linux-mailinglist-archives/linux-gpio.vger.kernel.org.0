Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1676518FD99
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCWT0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:26:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38058 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbgCWT0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:26:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C997580307C2;
        Mon, 23 Mar 2020 19:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uqYTsrN6Qt7Y; Mon, 23 Mar 2020 22:26:20 +0300 (MSK)
Date:   Mon, 23 Mar 2020 22:25:58 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpio: dwapb: Add debounce reference clock support
Message-ID: <20200323192558.ph75ifdhibxwnkie@ubsrv2.baikal.int>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-6-Sergey.Semin@baikalelectronics.ru>
 <20200323183837.GV1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323183837.GV1922688@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 08:38:37PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2020 at 09:06:31PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Aside from the APB reference clock DW GPIO controller can have a
> > dedicated clock connected to setup a debounce time interval for
> > GPIO-based IRQs. Since this functionality is optional the corresponding
> > clock source is also optional. Due to this lets handle the debounce
> > clock in the same way as it has been developed for the APB reference
> > clock, but using the bulk request/enable-disable methods.
> 
> > +	if (err) {
> > +		dev_err(gpio->dev, "Cannot reenable APB/Debounce clocks\n");
> > +		return err;
> > +	}
> 
> Yeah, this should be a separate change.
> 

Linus didn't think it was necessary in v1.

> Otherwise looks good.
> 
> Also, did I miss the documentation update (bindings)?
> 

No, it's there: https://www.spinics.net/lists/devicetree/msg342655.html
You just haven't been in Cc there.

-Sergey

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
