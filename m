Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816ED1426A8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgATJJy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:09:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:40066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgATJJy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jan 2020 04:09:54 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A67020684;
        Mon, 20 Jan 2020 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579511393;
        bh=vbAaO1LjWMydY+UDit/LOlD+QdhAMjmRUBC6/xTciUI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z8JoobvHuhNgmbrbIoqg/RNLpNLhodMK2TnkhVzBAaozj7wRwet84iBLCdbKiu68V
         JTPENT7TvgZv0pRxV3YVp4G79sL4cu+peo64P9DRY6axIzHnliS19t4ctptG/k6BU0
         Ae//fG/4yViRpu4zaXyfma5rNZ92GppC49HKsues=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1itT4B-000DhL-KB; Mon, 20 Jan 2020 09:09:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Jan 2020 10:09:51 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
        tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com,
        atish.patra@wdc.com, sagar.kadam@sifive.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        sachin.ghadi@sifive.com
Subject: Re: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Message-ID: <8dcb52c94eb5a585f6cf052c18571805@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com, atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-12-10 12:11, Yash Shah wrote:
> This patch series adds GPIO drivers, DT documentation and DT nodes for
> HiFive Unleashed board. The gpio patches are mostly based on Wesley's 
> patch.
> The patchset also adds hierarchy irq domain support as it is required 
> by this
> gpio driver. It also includes the irqdomain patch to introduce
> irq_domain_translate_onecell() and irq-nvic driver patch to use this 
> newly
> introduced function.
> 
> This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed 
> board
> 
> Changes:
> v4 vs v3:
> - Rename the DT yaml document to more standard naming 
> (sifive,gpio.yaml)
> - Drop "clock-names" property from yaml document
> - Add "minItems" to "interrupts" node in yaml
> 
> v3 vs v2:
> - Include patch for irq-nvic driver to use irq_domain_translate_onecell
> - Remove unnecessary inclusion of header files
> - Use a single prefix for all symbols in this driver
> - Rename the "enabled" field of struct sifive_gpio to "irq_state"
> - Remove unused variables and locking from probe()
> - Other minor changes
> 
> v2 vs v1:
> - Add patch to introduce irq_domain_translate_onecell() and use it in
>   the sifive PLIC driver
> - Drop the usage of own locks, instead use internal bgpio_locks
> - Consistently use regmap for register access throughout the gpio code
> - Convert the GPIO DT documentation into a json schema
> - Other minor changes based upon feedback received on v1
> 
> v1 vs RFC:
> Incorporated below changes as suggested by Linus Walleij on RFC version 
> of this
> patchset[0]
> - Dropped PWM patches as they are already merged.
> - Include "GPIO_GENERIC" and "REGMAP_MMIO" in Kconfig select option
> - Remove unwanted inclusion of header files
> - Use regmap MMIO instead of customised sifive_assign_bit()
> - Use GPIOLIB_GENERIC and bgpio_init() to set up the accessors
> - Use hierarchical irqdomain
> 
> [0]
> https://lore.kernel.org/linux-riscv/20181010123519.RVexDppaPFpIWl7QU_hpP8tc5qqWPJgeuLYn0FaGbeQ@z/
> 
> Yash Shah (6):
>   genirq: introduce irq_domain_translate_onecell
>   irqchip: nvic: Use irq_domain_translate_onecell instead of custom 
> func
>   irqchip: sifive: Support hierarchy irq domain
>   gpio: sifive: Add DT documentation for SiFive GPIO
>   gpio: sifive: Add GPIO driver for SiFive SoCs
>   riscv: dts: Add DT support for SiFive FU540 GPIO driver

I've queued the first 5 patches. The last one should go via the
corresponding platform tree.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
