Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0AB158FAD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 14:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgBKNSa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 11 Feb 2020 08:18:30 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:46196 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBKNS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 08:18:29 -0500
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1j1VQl-000090-Lz; Tue, 11 Feb 2020 14:18:23 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 494181013B2; Tue, 11 Feb 2020 14:18:23 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: potentially enabling IRQs too early
In-Reply-To: <20200211121748.woeix5ovpeo3gfc7@pengutronix.de>
References: <20200211073511.r24n3bygyjxrsuez@kili.mountain> <20200211080138.6bm5toge74wjncxw@pengutronix.de> <87r1z14hzh.fsf@nanos.tec.linutronix.de> <20200211121748.woeix5ovpeo3gfc7@pengutronix.de>
Date:   Tue, 11 Feb 2020 14:18:23 +0100
Message-ID: <87d0al4600.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Uwe,

Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> On Tue, Feb 11, 2020 at 09:59:30AM +0100, Thomas Gleixner wrote:
>> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
>> Indeed. Looking at the driver, all of the spin_lock_irq() usage in the
>> irqchip callbacks is broken.
>> 
>> So this needs two changes:
>> 
>>    1) Convert to raw spin lock, as this won't work on RT otherwise
>> 
>>    2) s/lock_irq/lock/ for all irqchip callbacks.
>
> Are you sure about the calls in gpio_siox_get_data()? This is only
> called by siox_poll() which doesn't disable irqs.

I explicitely said: "for all irqchip callbacks".

gpio_siox_get_data() is not a irq chip callback, right? So obviously it
has to stay there.

Thanks,

        tglx




  
