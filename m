Return-Path: <linux-gpio+bounces-1376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA7811564
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D881F2110B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F792F841;
	Wed, 13 Dec 2023 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1Dk+2Wow";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uST60tem"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB32393;
	Wed, 13 Dec 2023 06:59:33 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702479572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foW+ZiDixud3U2NWD+f47jXaCIGRQEuK1RL8JyJXNEg=;
	b=1Dk+2WowdGiO+Nc6YoCeRk4MBUkLTmEwK1mTz1+Vnbq0zDiUYn03tPXac7qQ3Z8PrUaVyG
	uxT+XMkLI7qjPKpo3QtzqODBn4rg1LBdIdXjpQM1Ejr39aCZXJljpnO3YAbGaH7h1qltsZ
	NpcKEB80J+0EVgBA27u819GQ0quMT3V7rlemWWKFDLjGK/GkW4kKrGeiQueSuqJIkYe4l/
	H0aFiiYw6q+mgLU9q4YP6TG/Qo53kW2OgnZASTZCkUTih4lyGcT9tjhJQ8AYhwftuT2AsW
	OeK2dxLagtBG5LTY6Qvbu2k4rG60jJnJITnVWnBMhbMYVCq44qVU8FNma/Nqng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702479572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foW+ZiDixud3U2NWD+f47jXaCIGRQEuK1RL8JyJXNEg=;
	b=uST60temtwUPk5nrXczqgBP/EwCCDyRB14JgeVhMZ8CGUimz2/EkOl9pnl/fM76Vjxi/ym
	wmL30e05LKJRA8Dw==
To: xiongxin <xiongxin@kylinos.cn>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org, Riwen Lu
 <luriwen@kylinos.cn>, hoan@os.amperecomputing.com,
 fancer.lancer@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
In-Reply-To: <bf4004bf-4868-4953-8d8e-0c0e03be673e@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn>
 <87ttosssxd.ffs@tglx> <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
 <874jgnqwlo.ffs@tglx> <bf4004bf-4868-4953-8d8e-0c0e03be673e@kylinos.cn>
Date: Wed, 13 Dec 2023 15:59:31 +0100
Message-ID: <875y12p2r0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13 2023 at 10:29, xiongxin wrote:
> =E5=9C=A8 2023/12/12 23:17, Thomas Gleixner =E5=86=99=E9=81=93:
> Sorry, the previous reply may not have clarified the BUG process. I=20
> re-debugged and confirmed it yesterday. The current BUG execution=20
> sequence is described as follows:

It's the sequence how this works and it works correctly.

Just because it does not work on your machine it does not mean that this
is incorrect and a BUG.

You are trying to fix a symptom and thereby violating guarantees of the
core code.

> That is, there is a time between the 1:handle_level_irq() and=20
> 3:irq_thread_fn() calls for the 2:disable_irq() call to acquire the lock=
=20
> and then implement the irq_state_set_disabled() operation. When finally=20
> call irq_thread_fn()->irq_finalize_oneshot(), it cannot enter the=20
> unmask_thread_irq() process.

Correct, because the interrupt has been DISABLED in the mean time.

> In this case, the gpio irq_chip irq_mask()/irq_unmask() callback pairs=20
> are not called in pairs, so I think this is a BUG, but not necessarily=20
> fixed from the irq core code layer.

No. It is _NOT_ a BUG. unmask() is not allowed to be invoked when the
interrupt is DISABLED. That's the last time I'm going to tell you that.
Only enable_irq() can undo the effect of disable_irq(), period.

> Next, when the gpio controller driver calls the suspend/resume process,=20
> it is as follows:
>
> suspend process:
> dwapb_gpio_suspend()
>      ctx->int_mask   =3D dwapb_read(gpio, GPIO_INTMASK);
>
> resume process:
> dwapb_gpio_resume()
>      dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);

Did you actually look at the sequence I gave you?

   Suspend:

	  i2c_hid_core_suspend()
	     disable_irq();       <- Marks it disabled and eventually
				     masks it.

	  gpio_irq_suspend()
	     save_registers();    <- Saves masked interrupt

   Resume:

	  gpio_irq_resume()
	     restore_registers(); <- Restores masked interrupt

	  i2c_hid_core_resume()
	     enable_irq();        <- Unmasks interrupt and removes the
				     disabled marker


Have you verified that this order of invocations is what happens on
your machine?

Thanks,

        tglx

