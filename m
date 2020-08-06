Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5F23DEC2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgHFR3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 13:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgHFRAf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 13:00:35 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83745C034624
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 06:33:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z14so14186466ljm.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2020 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLJbE0lv1TbtATQ3egRbPPepTDXoKcJK7gbuEBUdECE=;
        b=s8BB26eldMXgB8UwQnXSHLvQsau0qyyEWmM/eVp+d7+MO6N2Z3PJZAU4ro5hgO8AxD
         tZfLtfChclrL9Iero4gGt4+eliDgV3iVi9TgTtX6t4CiG7ys9Bg7Xt8PlGGGDHwItByr
         pWo1RcsVmI5+eJisoHJMTYx37kRJghZDFmTAGrHYbtTscarDZkz+woLFxOc38wOniK8w
         CCOq85XUgVuQ4KozuxUIOo2cFEgSph2IN/dg67T1T7QCn8lwC50N+N3oaGbaU0GZzHGp
         5VDfHjrw0NASX1o66LwaEJ41mOjglv2RKJlAe4RNfv3ynfdQtNvLnhd1ZQZy24kATBXe
         FqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLJbE0lv1TbtATQ3egRbPPepTDXoKcJK7gbuEBUdECE=;
        b=r8UOFdzvK96XgbJnbL5h6Y3YnYyFjYWNZj+meJaUNGo13QoXSHCgLwxF7F+fqYERNo
         VYP1VCsS5iUHS/yKo5XjZByIAj8hkCw/YNScSRGWKYOR7G2KUgCW75SD0SIMcDwUVQED
         9dGYlOAqkFYy6ufiFpcMpHg/9zo8hcLNParIdsgvtsEMa95rmHI1hCr+FKRq6Sb6v8bd
         yhrvMrm/kEXvLpotZbe9h6z0qBP1XXJVhKEnPAiNZ1UtMP/8NuqzwzFu8re3/zNh3cyw
         vKYpCayYYkksaav32yul+o9kdL3puHgy5dYIx6t2dMfJqyQSA4l3VSutL3YMi0SvfcOy
         LBhA==
X-Gm-Message-State: AOAM530jCB6TzGtigvLuuodET+sIeEFtHfZQHKKkhlSYTt2yf3bqWZl5
        muqdHMdTD+XFXjAjFSsLmq8d9oJ0TgGOuoPVXvYMPA==
X-Google-Smtp-Source: ABdhPJzJWxxWaGz7TueEicgJ6H5MpY1Qp+k57y2Cn4SnPYwI9LlHnYT7cRWVuhq5j9MiuRBB8Em61YOyUpQuzzRSoPA=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr4006774ljj.293.1596720773151;
 Thu, 06 Aug 2020 06:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200804091603.541-1-a.fatoum@pengutronix.de> <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
 <871rkkhy7v.fsf@nanos.tec.linutronix.de>
In-Reply-To: <871rkkhy7v.fsf@nanos.tec.linutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Aug 2020 15:32:41 +0200
Message-ID: <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 6, 2020 at 12:20 PM Thomas Gleixner <tglx@linutronix.de> wrote:

> So the solution for this driver is either to make the dispatch handler
> threaded or use the hard interrupt variant of dispatching the
> demultiplexed GPIO interrupts.

The struct gpio_irq_chip .threaded bool that the patch
sets just instructs the gpio core to issue
irq_set_nested_thread(irq, 1) on the child IRQ.

This is a driver of type "struct siox_driver" handling the
IRQ through the special .get_data callback supplied in the
driver struct and it calls handle_nested_irq(irq) so with
this fix it percolated up to the parent as intended.

So far so good. So I think the patch should be applied.

But what is behind this .get_data() callback for siox drivers?

The siox driver framework in drivers/siox dispatches calls
to .get_data() from a polling thread which is just some ordinary
kthread. It looks like this because the SIOX (I think) needs
to do polled I/O. (drivers/siox/siox-core.c)

So this is a thread but it is not an irq thread from the irq core,
however it is treated like such by the driver, and in a way what
happens is events, just polled by a thread.

So when we call handle_nested_irq() ... we are not really
calling that from an irq handler.

I am just very confused :D

But Uwe must have designed this thread to mimic IRQs
specifically? (Uwe?)

I don't know if the IRQ core even sees a difference between which
thread it gets interfaced with. I suppose it does? :/

Yours,
Linus Walleij
