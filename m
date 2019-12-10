Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E12118408
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 10:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfLJJvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 04:51:21 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49169 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLJJvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 04:51:20 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iecAm-0007SC-FR; Tue, 10 Dec 2019 10:51:16 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iecAl-00040m-NJ; Tue, 10 Dec 2019 10:51:15 +0100
Date:   Tue, 10 Dec 2019 10:51:15 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, support.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
Message-ID: <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
References: <20191129165817.20426-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129165817.20426-1-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:50:51 up 25 days,  1:09, 33 users,  load average: 0.14, 0.06,
 0.01
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

gentle ping.

Regards,
  Marco

On 19-11-29 17:58, Marco Felsch wrote:
> Hi,
> 
> this update address all comments made on [1], for further details see
> the patch based changelog.
> 
> [1] https://patchwork.ozlabs.org/cover/1201549/
> 
> Marco Felsch (3):
>   dt-bindings: mfd: da9062: add gpio bindings
>   mfd: da9062: add support for the DA9062 GPIOs in the core
>   pinctrl: da9062: add driver support
> 
>  .../devicetree/bindings/mfd/da9062.txt        |  10 +
>  MAINTAINERS                                   |   1 +
>  drivers/mfd/da9062-core.c                     |  16 +-
>  drivers/pinctrl/Kconfig                       |  12 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/pinctrl-da9062.c              | 297 ++++++++++++++++++
>  6 files changed, 336 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pinctrl/pinctrl-da9062.c
> 
> -- 
> 2.20.1
> 
