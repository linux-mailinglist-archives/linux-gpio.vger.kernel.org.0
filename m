Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9800542A73C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 16:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbhJLOdu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 12 Oct 2021 10:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237300AbhJLOdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 10:33:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46FBC06174E
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 07:31:48 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maIoT-00014a-Ay; Tue, 12 Oct 2021 16:31:29 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maIoQ-00049f-J4; Tue, 12 Oct 2021 16:31:26 +0200
Message-ID: <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 16:31:26 +0200
In-Reply-To: <20211012134027.684712-10-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
         <20211012134027.684712-10-kernel@esmil.dk>
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

On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> Add a driver for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                           |   7 ++
>  drivers/reset/Kconfig                 |   8 ++
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> 
[...]
> diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
> new file mode 100644
> index 000000000000..26bc5b59c1f3
> --- /dev/null
> +++ b/drivers/reset/reset-starfive-jh7100.c
> @@ -0,0 +1,164 @@
[...]
> +static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct jh7100_reset *data = jh7100_reset_from(rcdev);
> +	unsigned long offset = id / 32;
> +	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
> +	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
> +	u32 mask = BIT(id % 32);
> +	u32 done = jh7100_reset_asserted[offset] & mask;
> +	unsigned long flags;
> +	u32 value;
> +
> +	if (!assert)
> +		done ^= mask;
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	value = readl(reg_assert);
> +	if (assert)
> +		value |= mask;
> +	else
> +		value &= ~mask;
> +	writel(value, reg_assert);
> +
> +	do {
> +		value = readl(reg_status) & mask;
> +	} while (value != done);

Looking at the barebox driver, this could loop indefinitely if the
caller forgets to enable the corresponding peripheral clock. Maybe
use readl_poll_timeout() as a safety net.

regards
Philipp
