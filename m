Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AAB23E338
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 22:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHFUdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 16:33:09 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60046 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgHFUdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 16:33:09 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1596745987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zwF9AEpIWoN0DedEfwJjIVC8hhAtasHs6JdNjxwjuIg=;
        b=ghvoclG2PeUiKfcdjsLA2PJ443ANQQLvhQ2M4oq2oWFPmSvmFuImuP537Pj8SnpnhXzAmx
        IJ8WVWPiLwGuONTKE8OK25V/tQknMPsGGjazhWsfkvGW4lAyGriKRkIuXplBWiJ4SLtA1x
        DvxaMrzGFC6y4rep2BmSUyRe7hzMTmSq63GsK1BIETwrzBaBcsDn06H+psEXH2haJmsB54
        y1JHSeFAdUKM3BL4LfPGd+OMeRHbmYKCK2VnqpVlfDDPq8uQk5quNbNlU/XYzkTCW23RIM
        UJxqulZ9AEq6cZiddhMCR5114spOMovFJCNAOgYLAPVYyR2jYV/Luj2/WGEo3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1596745987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zwF9AEpIWoN0DedEfwJjIVC8hhAtasHs6JdNjxwjuIg=;
        b=zaBl05h+UNLTElmXIseGpDWMPtZMuaFoiBPqQM4PtPq/GBdBbV6qCX0zEXoGULev8XH2pm
        QfN9nzlo0FAEeEAQ==
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
In-Reply-To: <20200806194608.bdhvltvwxi3opykk@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de> <20200805061753.5o63zu4ionhgjab4@pengutronix.de> <871rkkhy7v.fsf@nanos.tec.linutronix.de> <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com> <87r1sjham2.fsf@nanos.tec.linutronix.de> <20200806194608.bdhvltvwxi3opykk@pengutronix.de>
Date:   Thu, 06 Aug 2020 22:33:06 +0200
Message-ID: <87eeojh5vh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> On Thu, Aug 06, 2020 at 08:50:45PM +0200, Thomas Gleixner wrote:
>> handle_nested_irq() does not care. It cares about thread context,
>> external reentrancy protection for the same nested interrupt and that
>> the nested interrupt has a thread handler.
>>=20
>> The latter is what goes belly up because w/o that threaded bit set the
>> GPIO core fails to set nested thread. So if a consumer requests an
>> interrupt with request_any_context_irq() then that fails to select
>> thread mode which means the threaded handler is not set causing
>> handle_nested_irq() to fail.
>
> For a caller of request_threaded_irq() that passes a relevant hardirq
> handler the hardirq handler is never called but request_threaded_irq()
> doesn't fail. The handler is just replaced by irq_nested_primary_handler
> in __setup_irq(). Is that a bug? (I didn't test, just read the code, so I
> might have missed something.)

Depends on what the threaded handler expects what the primary handler
has done. It might just work or not :)

> Trying to be constructive, here is my suggested changelog:
>
> 	gpio: siox: explicitly only support threaded irqs
>
> 	The gpio-siox driver uses handle_nested_irq() to implement its
> 	interrupt support. This is only capable to handle threaded irq
> 	actions. For a hardirq action it triggers a NULL pointer oops.
> 	(It calls action->thread_fn which is NULL then.)
>
> 	So prevent registration of a hardirq action by setting
> 	gpio_irq_chip::threaded to true.
>
> Does this address all your concerns?

LGTM

> Is this bad enough to justify sending this patch to stable?

Yes, a Cc: stable and a Fixes: tag is justified.

Thanks,

        tglx
