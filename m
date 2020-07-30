Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC48F2333D1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 16:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgG3OHc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 10:07:32 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56712 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgG3OH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 10:07:28 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 7E2FC803202F;
        Thu, 30 Jul 2020 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OD6TdfAHwz6E; Thu, 30 Jul 2020 17:07:25 +0300 (MSK)
Date:   Thu, 30 Jul 2020 17:07:25 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] gpio: dwapb: Add max GPIOs macro
Message-ID: <20200730140725.nl4xdbfzqobgo4gy@mobilestation>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
 <20200730135536.19747-5-Sergey.Semin@baikalelectronics.ru>
 <20200730140526.GL3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200730140526.GL3703480@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 05:05:26PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 30, 2020 at 04:55:30PM +0300, Serge Semin wrote:
> > Add a new macro DWAPB_MAX_GPIOS which defines the maximum possible number
> > of GPIO lines corresponding to the maximum DW APB GPIO controller port
> > width. Use the new macro instead of number literal 32 where it's
> > applicable.
> 

> Since it's a modified version of what I sent earlier, perhaps Suggested-by?

Could you point out to the message with that change? I must have missed that...(

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
