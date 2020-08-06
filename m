Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB623D936
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 12:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgHFKU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 06:20:59 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:57264 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbgHFKUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 06:20:55 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1596709253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ge+JX+cdMitocjDLHQfgYX/vUnt+cVAX7PgNeviNeYs=;
        b=GYDAHSN5wkxgqmkAARRIaQUULLn8vk8ySHSMhINwSAdhgazH5jbckkmVRnelkdmV2tKBjS
        1+daZnxX2NEX5S3lieDFoEgmVNricvPRH5hQ+wveC/1nlncNhPptRzXolIqh9gOjblmPpk
        AplFijjBd6qmFDQaFWysZ30V+xvccLhQAuq3d32WZvXTFwstk8oHdS8SjPpb+YyUU6zCDi
        43O13wf+ntR6VEGk4dlT6beJXu0y+sxC1LK65r0AkP5871d/ZddnSLEKg7U81KtLS8nPzQ
        DUgC6JyiJy6pXeP8eKp/LNG54gmwJU9L8ZLZPj6/0E2HDIpOiXgLPEsqrcVvPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1596709253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ge+JX+cdMitocjDLHQfgYX/vUnt+cVAX7PgNeviNeYs=;
        b=2ZX39YnprqfHb0qiYbvBSregfP4dhiP3FRpCZTtLiGg1vT36FGj3zGB7kK4t8ifjc7IfVP
        A4ybL42RSHFG/oCg==
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
In-Reply-To: <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de> <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
Date:   Thu, 06 Aug 2020 12:20:52 +0200
Message-ID: <871rkkhy7v.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> On Tue, Aug 04, 2020 at 11:16:03AM +0200, Ahmad Fatoum wrote:
>> Generic GPIO consumers like gpio-keys use request_any_context_irq()
>> to request a threaded handler if irq_settings_is_nested_thread() =3D=3D
>> true or a hardirq handler otherwise.
>>=20
>> Drivers using handle_nested_irq() must be sure that the nested
>> IRQs were requested with threaded handlers, because the IRQ
>> is handled by calling action->thread_fn().
>>=20
>> The gpio-siox driver dispatches IRQs via handle_nested_irq,
>> but has irq_settings_is_nested_thread() =3D=3D false.
>>=20
>> Set gpio_irq_chip::threaded to remedy this.
>
> Sounds reasonable, but I have to keep this for others to judge if this
> is indeed how the irq stuff works.

handle_nested_irq() documentation clearly says: "Handle a nested irq
from a irq thread". As a consequence the caller of this function must
run in an interrupt thread. This is an optimization to spare tons of
interrupt threads and context switches.

So the solution for this driver is either to make the dispatch handler
threaded or use the hard interrupt variant of dispatching the
demultiplexed GPIO interrupts.

Thanks,

        tglx


