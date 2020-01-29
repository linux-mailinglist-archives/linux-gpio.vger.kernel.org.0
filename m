Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5ED14C7DD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 10:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgA2JML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 04:12:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:42122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgA2JMK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 04:12:10 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C371920708;
        Wed, 29 Jan 2020 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580289129;
        bh=3PbAV8xHa5J1shODJC/9vqbomQlLbIG5XwG5BrUPB+s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o011yhgIai4vAfp6DxIAk6OX++mtFKDDNVaRJUxPNVXWQEo1PtH3nX+IBfs8/cv/K
         MbYVdQ1hHusvG/nXheJpX9kJT+rEYrkI/r+P5TFKNy+LfCv8u/D8miQ0aR/QyCcq8Y
         xV7xzBc3J7YDnUoPjSJYKh3+ygKNl6TEg0vecg/8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1iwjOK-001zHw-1b; Wed, 29 Jan 2020 09:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Jan 2020 09:12:08 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     JaeJoon Jung <rgbi3307@gmail.com>
Cc:     Yash Shah <yash.shah@sifive.com>, atish.patra@wdc.com,
        wesley@sifive.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        Palmer Dabbelt <palmer@dabbelt.com>, sachin.ghadi@sifive.com,
        linux-gpio@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
In-Reply-To: <CAHOvCC5A4usY0k4+0Y13N_zbAG8PD4H++fngAu+yJsVba9+6Ng@mail.gmail.com>
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
 <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
 <CAHOvCC5A4usY0k4+0Y13N_zbAG8PD4H++fngAu+yJsVba9+6Ng@mail.gmail.com>
Message-ID: <934410721310a3107e1d9d2600ec438a@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: rgbi3307@gmail.com, yash.shah@sifive.com, atish.patra@wdc.com, wesley@sifive.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, palmer@dabbelt.com, sachin.ghadi@sifive.com, linux-gpio@vger.kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

JaeJoon,

On 2020-01-29 01:27, JaeJoon Jung wrote:
> Because SiFive FU540 GPIO Registers are aligned 32-bit,
> I think that irq_state is good "unsigned int" than "unsigned long".
> 
> I refer to SiFive FU540-C000 Manual v1p0 (GPIO Register Table 103)
> as "Only naturally aligned 32-bit memory accesses are supported"

You realize that we're talking about variables here, and not hardware
registers, right?

> when you use assign_bit(offset, &chip->irq_state, 1),
> offset is 32-bit.

And? assign_bit takes an "unsigned long *" as a parameter. irrespective
of the size of long on a given architecture, by the way.

> I prefer to use bit operation instead of assign_bit().
> 
> u32 bit = BIT(offset);
> chip->irq_state |= bit;

which is not what assign_bit() does.

> If you use this code, you do not use the assign_bit() and
> need not change irq_state data type.

Or we can use the correct API and not introduce additional bugs, which
your suggestion above would lead to.

> There are many improvements in my works for drivers/gpio/gpio-sifive.c.
> I hope to check my attached source file.

That's not how we submit patches to the Linux kernel. I suggest you
read the documentation on how to do this.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
