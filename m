Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C32E58BEC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 22:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfF0Uof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 16:44:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44704 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0Uoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 16:44:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 85AA66085C; Thu, 27 Jun 2019 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561668273;
        bh=fqJngYFZovJRH4LMJ9rXXIBSC2Q0Q4+IE1S7MgXNT2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OaT98YmwswqhoFLvu9AAkYbhBabxkEqrBa1LHx48b2kTEb8B2k/7AFB5jGrrHc67S
         4yjpnpKOq6iSe/VPgWnABZVlIG0rfFpLFmtn35NzTuLGgfEZPu3Ol5s3kyXuFRhxaM
         q991sETK0apliQ7J977RqXAdzq08EGCDyXAq5Kvo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73A396085C;
        Thu, 27 Jun 2019 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561668272;
        bh=fqJngYFZovJRH4LMJ9rXXIBSC2Q0Q4+IE1S7MgXNT2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X54MxjAhz2wrbSvg/wIVYblS4krMWyFR1F95IWCZUV44O9np7mvGW/0bSdpNVjFj+
         /hLSy/wzJVuHkdqSMf9WS8+2Hj+w13qxo0AQ3f4d8BneNI5T4AqMykeLNSKO3+4x21
         XRDk/bsNuclyJzCYcEEkHPnMUurA8J6ka0LCwFW0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73A396085C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Thu, 27 Jun 2019 14:44:31 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190627204431.GA24030@codeaurora.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24 2019 at 07:29 -0600, Linus Walleij wrote:
>+static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
>+	.activate = gpiochip_irq_domain_activate,
>+	.deactivate = gpiochip_irq_domain_deactivate,
>+	.translate = gpiochip_hierarchy_irq_domain_translate,
>+	.alloc = gpiochip_hierarchy_irq_domain_alloc,
>+	.free = irq_domain_free_irqs_common,
>+};
>+
>+static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
>+{
>+	if (!gc->irq.parent_domain) {
>+		chip_err(gc, "missing parent irqdomain\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!gc->irq.parent_domain ||
>+	    !gc->irq.child_to_parent_hwirq ||
>+	    !gc->irq.fwnode) {
>+		chip_err(gc, "missing irqdomain vital data\n");
>+		return -EINVAL;
>+	}
>+
>+	gc->irq.domain = irq_domain_create_hierarchy(
>+		gc->irq.parent_domain,
>+		IRQ_DOMAIN_FLAG_HIERARCHY,
>+		gc->ngpio,
>+		gc->irq.fwnode,
>+		&gpiochip_hierarchy_domain_ops,
This should probably be used only if gc->irq.domain_ops is not set.
>+		gc);
>+
>+	if (!gc->irq.domain) {
>+		chip_err(gc, "failed to add hierarchical domain\n");
>+		return -EINVAL;
>+	}
>+
>+	gpiochip_set_hierarchical_irqchip(gc, gc->irq.chip);
>+
>+	chip_info(gc, "set up hierarchical irqdomain\n");
>+
>+	return 0;
>+}
>+

Thanks,
Lina
