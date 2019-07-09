Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 214DE62E41
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 04:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfGIChd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 22:37:33 -0400
Received: from onstation.org ([52.200.56.107]:59956 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726394AbfGIChd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 22:37:33 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E0FFA3E913;
        Tue,  9 Jul 2019 02:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562639852;
        bh=PpL4jIvEjNzv0fxPAfTOwE/hxjYf0rAQKipDsAuTYws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fwRCB0OqaOQjWUxd8vRgEGzftdGwaiIVW0UeqSnzKogs2DtFbStjItsTsSPSDEBN7
         Mqlh4HuO1IdORbCwNvEx94+EM/WNJ/cR8fdeahMgfotRkQ9lUIZMdeYKnj7CzPB1pi
         lLqcaOUIEttTAPFUfF0G7aghmTDrrMh0UHfs9+cU=
Date:   Mon, 8 Jul 2019 22:37:31 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190709023731.GA7401@onstation.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jun 24, 2019 at 03:25:28PM +0200, Linus Walleij wrote:
> +associated irqdomain and resource allocation callbacks. These are activated
> +by selecting the Kconfig symbol GPIOLIB_IRQCHIP. If the symbol
> +IRQ_DOMAIN_HIERARCHY is also selected, hierarchical helpers will also be
> +provided. A big portion of overhead code will be managed by gpiolib,
> +under the assumption that your interrupts are 1-to-1-mapped to the
> +GPIO line index:
> +
> +  GPIO line offset   Hardware IRQ
> +  0                  0
> +  1                  1
> +  2                  2
> +  ...                ...
> +  ngpio-1            ngpio-1
> +
> +If some GPIO lines do not have corresponding IRQs, the bitmask valid_mask
> +and the flag need_valid_mask in gpio_irq_chip can be used to mask off some
> +lines as invalid for associating with IRQs.

I forgot to call out in my patch series that the GPIOs are numbered
1..ngpio on Qualcomm and the existing to_irq and translate callbacks
in mainline take care of adding and subtracting one to / from the
offset.

I was under the (false?) assumption that GPIO numbering on all platforms
start at one. Is that not the case?

Brian
