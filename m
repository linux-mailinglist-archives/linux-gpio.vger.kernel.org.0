Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B882D411E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 12:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgLILak convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 9 Dec 2020 06:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbgLILaf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 06:30:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E75C0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 03:29:55 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmxfG-0004Pq-QY; Wed, 09 Dec 2020 12:29:46 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmxfF-0001N1-Jx; Wed, 09 Dec 2020 12:29:45 +0100
Message-ID: <a168ae4fdf17e2f9e422354f5dadc62bcad3e4d8.camel@pengutronix.de>
Subject: Re: [PATCH v5 12/21] riscv: Add Canaan Kendryte K210 reset
 controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc:     "seanga2@gmail.com" <seanga2@gmail.com>
Date:   Wed, 09 Dec 2020 12:29:45 +0100
In-Reply-To: <57d4ae6e06551a56e41a4d50078ef51cbad67083.camel@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
         <20201208073355.40828-13-damien.lemoal@wdc.com>
         <4d0a0c80e57b156b7d86dfca250285048ab30825.camel@pengutronix.de>
         <57d4ae6e06551a56e41a4d50078ef51cbad67083.camel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Wed, 2020-12-09 at 05:26 +0000, Damien Le Moal wrote:
[...]
> I added COMPILE_TEST. I also removed the RISCV dependency since SOC_CANAAN
> already depend on it (due to the SOC_EARLY_INIT_DECLARE() use in the sysctl
> driver). Stricktly speaking, I think we could also remove the SOC_CANAAN
> dependency for the reset driver, but I do not really see the point since it is
> cannot be used for any other SoC.

Thank you, this is fine. Depending on SOC_CANAAN is nice for users of
other SoCs, as they aren't shown this option to enable a kernel driver
that we know they don't need.

regards
Philipp
