Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A970E18FD64
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgCWTQp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:16:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37988 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbgCWTQp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:16:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 75AFE80307C2;
        Mon, 23 Mar 2020 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HOychBBlNtgQ; Mon, 23 Mar 2020 22:16:42 +0300 (MSK)
Date:   Mon, 23 Mar 2020 22:16:28 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Joe Perches <joe@perches.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-gpio@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add Segey Semin to maintainers of DW
 APB GPIO driver
Message-ID: <20200323191628.rbi2j2wk66fiyuyh@ubsrv2.baikal.int>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
 <de4ee117f047874788ea64c4625c96d40ec0a35e.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <de4ee117f047874788ea64c4625c96d40ec0a35e.camel@perches.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 11:36:45AM -0700, Joe Perches wrote:
> On Mon, 2020-03-23 at 21:06 +0300, Sergey.Semin@baikalelectronics.ru
> wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Add myself as a co-maintainer of the Synopsis DesignWare APB GPIO driver.
> []
> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -16084,6 +16084,7 @@ F:	drivers/tty/serial/8250/8250_dw.c
> >  
> >  SYNOPSYS DESIGNWARE APB GPIO DRIVER
> >  M:	Hoan Tran <hoan@os.amperecomputing.com>
> > +S:	Serge Semin <fancer.lancer@gmail.com>
> 
> nack - S: is not the right line type prefix
> 
> You need to use an M: type line not an S:.
> 

Ah, yeah. Will fix it in v3.

Regards,
-Sergey

> The S: line is for subsystem status which should be one of:
> 
> 	S: *Status*, one of the following:
> 	   Supported:	Someone is actually paid to look after this.
> 	   Maintained:	Someone actually looks after it.
> 	   Odd Fixes:	It has a maintainer but they don't have time to do
> 			much other than throw the odd patch in. See below..
> 	   Orphan:	No current maintainer [but maybe you could take the
> 			role as you write your new code].
> 	   Obsolete:	Old code. Something tagged obsolete generally means
> 			it has been replaced by a better system and you
> 			should be using that.
> 
> >  L:	linux-gpio@vger.kernel.org
> >  S:	Maintained
> 
> like this...
> 
> >  F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> 
> 
> 
