Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0362614059A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbgAQIrE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:47:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58377 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgAQIrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:47:03 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1isNHM-0004XR-RC; Fri, 17 Jan 2020 09:46:56 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1isNHM-00043o-GH; Fri, 17 Jan 2020 09:46:56 +0100
Date:   Fri, 17 Jan 2020 09:46:56 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Add DA9062 GPIO support
Message-ID: <20200117084656.f466wygv2bvn4kqc@pengutronix.de>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108104746.1765-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:45:05 up 63 days, 3 min, 56 users,  load average: 0.06, 0.04,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

gentle ping..

On 20-01-08 11:47, Marco Felsch wrote:
> Hi,
> 
> this v4 adds the missing PIN_CONFIG_BIAS_DISABLE support so
> pull-ups/-downs can be disconnected. I also added all git-tag already
> made on my v3 [1].
> 
> @Lee
> checkpatch complains about the "Acked-for-MFD-by" tag. I kept it but is
> this behaviour on purpose?
> 
> Regards,
>   Marco
> 
> [1] https://lkml.org/lkml/2019/12/12/601
> 
> Marco Felsch (3):
>   dt-bindings: mfd: da9062: add gpio bindings
>   mfd: da9062: add support for the DA9062 GPIOs in the core

@Lee
Can you apply those if everything is okay?

>   pinctrl: da9062: add driver support

This one is for Linus.

Regards,
  Marco

>  .../devicetree/bindings/mfd/da9062.txt        |  10 +
>  MAINTAINERS                                   |   1 +
>  drivers/mfd/da9062-core.c                     |  16 +-
>  drivers/pinctrl/Kconfig                       |  12 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/pinctrl-da9062.c              | 300 ++++++++++++++++++
>  6 files changed, 339 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pinctrl/pinctrl-da9062.c
> 
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
