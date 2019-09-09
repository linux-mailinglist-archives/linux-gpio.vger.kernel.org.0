Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA318AE150
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 01:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbfIIXAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 19:00:52 -0400
Received: from onstation.org ([52.200.56.107]:44768 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfIIXAw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Sep 2019 19:00:52 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 071EA3EECB;
        Mon,  9 Sep 2019 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568070051;
        bh=6Kv4KMaygv0KswF7kk/EVVDG9vrBQXD7yG5Bil7Y34A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a6YmcW0Ph4LLfgyO3jfVMFR5L6ufv/rzPUTiqRPgQ1puSrzqLxK+fq+ACbZrnbLLP
         +iVuxSaP2nanO9bD4PA7tWbbZqxpHI4LsocCCxi3Np9LvSjOIbT1vfvpYP1+uY/tkP
         rDgx16eprx9w9aRwXIqDbBsVXDLBOLzewb1/HHMY=
Date:   Mon, 9 Sep 2019 19:00:50 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Hulk Robot <hulkci@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: fix incorrect merge of linux/gpio/driver.h
Message-ID: <20190909230050.GA5181@onstation.org>
References: <20190909203512.675822-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909203512.675822-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 09, 2019 at 10:34:59PM +0200, Arnd Bergmann wrote:
> Two otherwise correct patches got merged incorrectly, which leads to
> build problems when CONFIG_GPIOLIB is disabled:
> 
> include/linux/gpio/driver.h:722:19: error: static declaration of 'gpiochip_lock_as_irq' follows non-static declaration
> static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
>                   ^
> include/linux/gpio/driver.h:706:5: note: previous declaration is here
> int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
>     ^
> include/linux/gpio/driver.h:729:20: error: static declaration of 'gpiochip_unlock_as_irq' follows non-static declaration
> static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
>                    ^
> include/linux/gpio/driver.h:707:6: note: previous declaration is here
> void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
> 
> Fixes: 8a6abcd04e4c ("Merge tag 'gpio-v5.4-updates-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel")
> Fixes: 9091373ab7ea ("gpio: remove less important #ifdef around declarations")
> Fixes: c7663fa2a663 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Brian Masney <masneyb@onstation.org>
